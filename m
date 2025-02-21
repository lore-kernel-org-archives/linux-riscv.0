Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DB2C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 23:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7zblaB2sQaMd94dLtj2I/B4r+7ykyz6WbWiPXq2P3A=; b=Iqc35vyudcOPBs
	MlDLf7HkbJOX4QVw8fFCdbXe0GCNHs0mvU/2Te+7MsqBuErLWdxIdEf2vDmd0WCNygp9I9bQUrZc9
	rGm5tAUyo3i1MI39srbJ0+fIj0MRLMlGnT40dBwbvgTuggW89NWvRDQGj+raIobOEbJAZznsQjbOW
	/wn8Svuxf7CvxaL+FqHod8SuIiXqzy87dLcxC1y6COwGWJomgvo/pAY2of/DPklMx5Iqi+dV1/Who
	DtKh86d7+8494Bn2y0UriT9wFIT65LWQR031nHgSW0Z7gFrkJbMOnVg/8ijJ8C5OCXWiWbhWhIuOt
	eRjfecZDivMNHRB5iWgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcet-000000079cb-2gmg;
	Fri, 21 Feb 2025 23:42:15 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcdg-000000079WZ-14T0
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 23:41:01 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4720fb0229fso25435021cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 15:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1740181259; x=1740786059; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f93o7FAG90qaVAfzA0geJ/uDU/bxaCxWXA35kHGThZA=;
        b=ZoyZHyTerl9euxcz7y8TDjN+fQyPC+aV0+obtG6klr1yFP3qqaBaWbsXXDwiF0CDq3
         KMfED83jkL7Pnkvd+OVVPeStYuZ4fIHkKe3VkiwHHWntj4Dzm1gjX5DubSYVY7LhtEZS
         4/GglNGTmPrP29/+PL2r7U1XbT95BsPV/t4LpYC8sk3iCBCBkmngQ8zoOViWS3vEPry3
         DQ337bKRy+yeL42c1CMOzAdZaEN9z/H8rYIphGK/fJe/7zuKRfBWrjFJ+52D2xCO53tK
         dSd0ghgz4an3m9Q6NlwoMmzvTEx+XWy6XOaA4IqpaCeNybpYZ/wjA8+i7X/fayabs2yH
         m1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740181259; x=1740786059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f93o7FAG90qaVAfzA0geJ/uDU/bxaCxWXA35kHGThZA=;
        b=K6YWSRjTA8AlP9nhaqbeABllf+niNxW25n3qdAAinMffLDxkZ6D92srmqSavLMMvwz
         pMyWr0q9NABHHp1gZLDL83IlQFCdHzQ+lM3iJGEVD42NJHqC8rio3uxubI+tyhweFyYM
         SRpoGvdSkNh5E0Tcc8a7H/zK92Ei06cD3otpPLJRMYYc7D4CDWwAg8mbkDVgabK22duc
         53sLRls8MrAG1kl6yQLT/3Y6yiyqs/0HOK8DADQHl/B13CplttYaL7qGyMzst4AAADob
         cWOW7Gia4EotJBFpOWtJAin/XEZSIvwN0iacs+NjV+V9WiSUTMHryaGsO9simoFdFgOB
         wPfw==
X-Forwarded-Encrypted: i=1; AJvYcCVdNzGPNbvpN40mtkqpUcu2oKqQZrD6S4umTXn87CglB/Q6lj4kfcng59HQS/uMQZKvpv6g26Ky18xiWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxX+sVvooje7CGu9WP9pY/QxBhvuBBFhsIrLNJy6zbJK+jybMAU
	5I5cs4g2g7M+t8CA51CEBZQ4m+Ux23rsH8WaKsVBFQdcZe2EJhY91bzBFr8iWiU=
X-Gm-Gg: ASbGncvzin6qq3I7/hXQtMNh6KozbINp3bKRDCANMwEoar+EhGzLTnprXUeQW/XCA8Y
	emfIsTbJkgKAom9dbJxazid31napY70aj97ixQHSDoS1nEBEu464hTWrmdZLJXI0WxoxqEgy5+g
	iOqJKkFZ+qn0hHkPKdksct7sl2LXyAlWa3B2Am2K9SstFsi/ZB6EHsuS610/4LgZMAB7jVKgWmU
	J5xse6HoB3gagbj+vpvkYb87I8wrJwIepuNDDwpvxhkwDWd5bS9oin7aP+cuPP9I4LkWiJtepAu
	Ce3SnAl0gOjw9yTPajhMc6vrv+qZU6QJFfLf10WMWRKx3x35dCcGfmWMWmhqfXFrHw==
X-Google-Smtp-Source: AGHT+IF09Y2l1WyaNQYoNtRessBI+9y7Evefa+3aJzpT7BdL6xOrBu5WGp0qzs26a1CPzjXqQ1pKmw==
X-Received: by 2002:a05:622a:44f:b0:472:13e8:47a0 with SMTP id d75a77b69052e-4722473dd50mr66754041cf.21.1740181258850;
        Fri, 21 Feb 2025 15:40:58 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471f506f819sm58485811cf.62.2025.02.21.15.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 15:40:58 -0800 (PST)
Message-ID: <7c697e9a-d6d9-4672-9738-93ce3a71beb6@riscstar.com>
Date: Fri, 21 Feb 2025 17:40:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
To: Haylen Chu <heylenay@4d2.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Guodong Xu <guodong@riscstar.com>
References: <20250103215636.19967-2-heylenay@4d2.org>
 <20250103215636.19967-4-heylenay@4d2.org>
 <aw2vqnz5vcccqqvrrhz5tgawj7fnzzg3tds7nnepuorit37a7r@jcj3wrs7d73h>
 <Z6rdBhQ7s2ReOgBL@ketchup> <19e5129b-8423-4660-8e4f-8b898214d275@kernel.org>
 <Z63T_EDvXiuRQbvb@ketchup> <2ab715bd-e26c-41bb-ac64-baa864d90414@kernel.org>
 <Z7BTVu10EKHMqOnJ@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z7BTVu10EKHMqOnJ@ketchup>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_154100_562426_39D31504 
X-CRM114-Status: GOOD (  14.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I have a general proposal on how to represent this, but I'd
like to know whether it makes sense.  It might be what Krzysztof
is suggesting, but in any case, I hope this representation would
work, because it could simplify the code, and compartmentalizes
things.

Part of what motivates this is that I've been looking at the
downstream reset code this week.  It contains a large number of
register offset definitions identical to what's used for the
clock driver.  The reset driver uses exactly the same registers
as the clock driver does.  Downstream they are separate drivers,
but the clock driver exports a shared spinlock for both drivers
to use.

These really need to be incorporated into the same driver for
upstream.

The clock code defines four distinct "units" (a term I'll use
from here on; there might be a better name):
   MPMU  Main Power Management Unit
   APMU  Application Power Management Unit
   APBC  APB Clock
   APBS  APB Spare

The reset code defines some of those, but doesn't use APBS.
It also defines three more:
   APBC2 Another APB Clock
   RCPU  Real-time CPU?
   RCPU2 Another Real-time CPU

Each of these "units" has a distinct I/O memory region that
contains registers that manage the clocks and reset signals.

I suggest a single "k1-clocks" device be created, which has
access to all of the I/O address ranges.  And then within
the DT node for that device there is a sub-node for the
clocks, and another sub-node for the resets.  Each of these
uses 2 cells for addressing.  The first indicates which
"unit" contains the clock or reset registers, and the
second indicates the clock or reset line implemented by
that unit.

I might not have this exactly right, but below I show some
DTS code that I hope demonstrates what I mean.

Could this approach, or something close, work?

					-Alex

/* SpacemiT clock/reset unit numbers */
#define SPACEMIT_CRST_RCPU      0
#define SPACEMIT_CRST_RCPU2     1
#define SPACEMIT_CRST_APBC      2
         /* . . . */
#define SPACEMIT_CRST_APBC2     6

/* SpacemiT RCPU unit reset IDs */
#define SPACEMIT_RCPU_HDMIAUDIO 0
#define SPACEMIT_RCPU_CAN       1
         /* . . . */
#define SPACEMIT_RCPU_UART1     6

/* SpacemiT RCPU2 unit reset IDs */
#define SPACEMIT_RCPU2_PWM0     0
#define SPACEMIT_RCPU2_PWM1     1
         /* . . . */
#define SPACEMIT_RCPU2_PWM9     9

/* SpacemiT APBC unit reset/clock IDs */
#define SPACEMIT_APBC_UART1     0
#define SPACEMIT_APBC_UART2     1
#define SPACEMIT_APBC_GPIO      2
         /* . . . */
#define SPACEMIT_APBC_TWSI0     27

/* APBC reset/clock IDs */
#define SPACEMIT_APBC_UART1     0
#define SPACEMIT_APBC_UART2     1
#define SPACEMIT_APBC_GPIO      2
/* . . . */

     clocks {
         compatible = "spacemit,k1-clocks";

         reg = <0x0 0xc0880000 0x0 0x2050>,
               <0x0 0xc0888000 0x0 0x30>,
               <0x0 0xd4015000 0x0 0x1000>,
               <0x0 0xd4050000 0x0 0x209c>,
               <0x0 0xd4090000 0x0 0x1000>,
               <0x0 0xd4282800 0x0 0x400>,
               <0x0 0xf0610000 0x0 0x20>;
         reg-names = "rcpu",
                     "rcpu2",
                     "apbc",
                     "mpmu",
                     "apbs",
                     "apmu",
                     "apbc2";

         /*
          * The two reset cells indicate:
          *     unit number (e.g. SPACEMIT_CRST_RCPU)
          *     reset within that unit (e.g. SPACEMIT_RCPU_CAN)
          */
         k1_reset: spacemit-k1-reset {
             #reset-cells = <2>;
         };

         /*
          * The two clock cells indicate:
          *     unit number (e.g. SPACEMIT_CRST_APBC)
          *     clock within that unit (e.g. SPACEMIT_APBC_UART1)
          */
         k1_clock: spacemit-k1-clock {
             #clock-cells = <2>;
         };
         /* . . . */
     };

     /* . . . */

     uart8: serial@d4017700 {
         compatible = "spacemit,k1-uart",
                      "intel,xscale-uart";
         reg = <0x0 0xd4017700 0x0 0x100>;
         interrupts = <50>;
         clocks = <&k1_clock SPACEMIT_CRST_APBC SPACEMIT_APBC_UART8>;
                  <&k1_clock SPACEMIT_CRST_APBC SPACEMIT_APBC_UART8_BUS>;
         clock-names = "core",
                       "bus";
         reg-shift = <2>;
         reg-io-width = <4>;

         resets = <&k1_reset SPACEMIT_CRST_APBC SPACEMIT_APBC_UART8>;

         status = "disabled";
     };


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
