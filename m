Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FEAC00A94
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 18:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rkDYHNhRn1c4pRCGZjrz+4E/UCY2sA5iGFRBMUj5rE=; b=mvqqX+/cLKZYp8
	Q8xyPx7dzTgwPuaV1T5sfdzQrkQJ6HFZjRbEVl6Gyckzy7Bd2cWlGLU4VBHIMRdpycWN2oZKS02qR
	HH4uoeShyErwkWcZjCnVDiaE2j8x/kxCulr4p7O1HIe50W2StRvRMxc83emlUs8ELL8UMdO5Pgqzx
	EpmawqgOLvsMLwYT3KToCNn1+2UUGm0O69djnRutSLeFi3aoXiN5/Lb8z+nUWx4GfBrh5E6BSGwNm
	AAqG9tgJNx0CWBVOjuJ2lkel/M8WD1Wvv2HR6qBuZj5KrYLygRUljRGY1Ie5XP87Pyjfc4XfYsk3Q
	+lCN9WqWb5k/5TSHOxTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLZu-00000000qnL-2Ujr;
	Fri, 12 Apr 2024 18:24:46 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLZq-00000000qlh-1KZz
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 18:24:44 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso1050228b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 11:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712946280; x=1713551080; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VnBuVioN4do9yO5Fp+To5ya+VzBTYCmZkVY34L3QmB0=;
        b=oGYc2iwYVguqRWbWbNCyN0oqy1ChvmxU9bZLxlUFvBTAyqg/IofIc85NZ9Ul/yuNBN
         XojjOnqtdm0tdtIuK+ZlXUV7gC0oBxIlkPQ/feYTSic7HHFaIKpt9Cotxsy9kUtzSrf7
         3eDiEcrVHNSGQbi8hbW3S0/+qx1XJNLoq503CSFmYQLQdYRuSCzqAmPTK0u7MpivivPd
         oJ1YVraDMxf1wBWtLc4LJ0KFw0jKKaeyGl5K6PnObiQHN7WORe76OoLCTz7Q7sIaXp/Z
         8aaSdZAdZnaydZnheieGOjgxDCRG+I3ld6wwUpLeQLrDOBrjdAAcT8H+4NKuSNcU7pQS
         0qvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712946280; x=1713551080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnBuVioN4do9yO5Fp+To5ya+VzBTYCmZkVY34L3QmB0=;
        b=D6OZaPiUJLxxfKgMXPX17VY2sVzyxAhPSY/9/Q6f8eau/QlztDNtxyRih/J7ucVaUu
         I4tHZuHZZAZWy5wiLhopEyVZOrAEY32o/ncFdwW1IkC10uLvAlsfnNnUNvzS7f1Ci/Cr
         1ofpXxVh3VEKP28OoyMqQq1jIcFelS9NhtaMdOuD3AEBg+58F3l9726bEDyVhW5E4zZl
         BiEir6U4cALwGrDy70HuW9RR9V2DmN9YPP1jp4n/31RDshoAKMgw4/a6NXWsy/aSuYbz
         jj0Hp1TXGSWUhzqO2tF029TGqYD5Ry3kSLri/3uyg6+NjepuAWaavqu/MJmavENup0Wy
         FMzg==
X-Forwarded-Encrypted: i=1; AJvYcCXkUcJakVV+qe+SoT1rQWSWmqygls6+I/Se6N/70mk+ZgcPP/EUQRmBUY6QYxuNDiCkPfHbpwRa4MthOQW5fAtOcUzfG2X+LBc4E+caO1Wu
X-Gm-Message-State: AOJu0YzN1fXTaGWT0iZveRiFKSQX6iWqzU6SAVAhLBT3McbmgyjCQG3T
	pEXpF6U6VohKRHi3qrKiSk4+D5ahlngQFonvRYQOak8c43LqRwI2GYK6lybZ3Hs=
X-Google-Smtp-Source: AGHT+IGBSZ+NKU4CickCNnsQ+/kbxESLkfaeQqukqebjAC4cnyf8qidufBP0hWj5qMBvb+MfDt1C/A==
X-Received: by 2002:a05:6a00:3913:b0:6ea:8e89:7faf with SMTP id fh19-20020a056a00391300b006ea8e897fafmr4224014pfb.28.1712946280297;
        Fri, 12 Apr 2024 11:24:40 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id q4-20020a656244000000b005dc4fc80b21sm2633420pgv.70.2024.04.12.11.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:24:39 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:24:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 12/19] riscv: Create xtheadvector file
Message-ID: <Zhl8Y+GzTB/ip7rT@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-12-4af9815ec746@rivosinc.com>
 <20240412-thirty-sacrament-db052c7fe6fe@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412-thirty-sacrament-db052c7fe6fe@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_112443_477963_631F9F89 
X-CRM114-Status: GOOD (  23.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2024 at 12:30:32PM +0100, Conor Dooley wrote:
> On Thu, Apr 11, 2024 at 09:11:18PM -0700, Charlie Jenkins wrote:
> > These definitions didn't fit anywhere nicely, so create a new file to
> > house various xtheadvector instruction encodings.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/xtheadvector.h | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/xtheadvector.h b/arch/riscv/include/asm/xtheadvector.h
> > new file mode 100644
> > index 000000000000..348263ea164c
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/xtheadvector.h
> > @@ -0,0 +1,25 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +/*
> > + * Vector 0.7.1 as used for example on T-Head Xuantie cores, uses an older
> > + * encoding for vsetvli (ta, ma vs. d1), so provide an instruction for
> > + * vsetvli	t4, x0, e8, m8, d1
> > + */
> > +#define THEAD_VSETVLI_T4X0E8M8D1	".long	0x00307ed7\n\t"
> > +#define THEAD_VSETVLI_X0X0E8M8D1	".long	0x00307057\n\t"
> > +
> > +/*
> > + * While in theory, the vector-0.7.1 vsb.v and vlb.v result in the same
> > + * encoding as the standard vse8.v and vle8.v, compilers seem to optimize
> > + * the call resulting in a different encoding and then using a value for
> > + * the "mop" field that is not part of vector-0.7.1
> > + * So encode specific variants for vstate_save and _restore.
> 
> This wording seems oddly familiar to me, did Heiko not write this?

Yeah, I wasn't sure how to attribute him. He wrote almost all of the
lines in this file, but I put it together into this file. What is the
standard way of doing that?

- Charlie

> 
> > + */
> > +#define THEAD_VSB_V_V0T0		".long	0x02028027\n\t"
> > +#define THEAD_VSB_V_V8T0		".long	0x02028427\n\t"
> > +#define THEAD_VSB_V_V16T0		".long	0x02028827\n\t"
> > +#define THEAD_VSB_V_V24T0		".long	0x02028c27\n\t"
> > +#define THEAD_VLB_V_V0T0		".long	0x012028007\n\t"
> > +#define THEAD_VLB_V_V8T0		".long	0x012028407\n\t"
> > +#define THEAD_VLB_V_V16T0		".long	0x012028807\n\t"
> > +#define THEAD_VLB_V_V24T0		".long	0x012028c07\n\t"
> > 
> > -- 
> > 2.44.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
