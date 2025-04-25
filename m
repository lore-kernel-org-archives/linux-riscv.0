Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12E3C369D3
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 19:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tY3oaMtJvTzi6Fv7iFsN1wiWivw9N+oXshN4LqDoA5c=; b=1Lblz/deII8dFx
	B6yVMfaAUhx8w85OMFpXO58yqk67yvV8HWGznre/PTnU2TUM7ukEa5cpJIF3RvqTXIjWV5RO0zu2z
	CdspMObLTPRIG1NvoI+d9LMvwG8AcucznBMALbZb0Gt8hynu0McZoly3BRm3q/PXBS27fsVdTC6Uy
	aGpdYUmgY2UE3tcbhTC3yr387NpxV6EBslInruapFpkW2wqY4uuRLbBsNcbZ31/SmHVf/9G4eZK8g
	bbpPpahDpJYkLs0/1HWGUKWSdwyVcA0OvvAR4oDWYzaSqiSUkc1tT/zbGzhNHjzhC7Y6QSAG6pvRT
	axZKX8vqbEfLtHt6/96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OXe-00000000d2m-0olE;
	Fri, 25 Apr 2025 19:16:54 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8OXa-00000000d1y-3Kpa
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 19:16:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-224100e9a5cso33072145ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 12:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1745608609; x=1746213409; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XNI+wkZfospHmLOr+2+jXX5pJdTmqRckjghLYfMtBgk=;
        b=vkD/u402rSEQgpaYe3i1X0KcpuvxKaUYZ1SPf6f5oE+nAClSwY0at+yr6ITpc1KcMS
         jSglEu8oyRvlo3kLSr+PeOf3HBwnUfJdyFwg2ISTsZGvaNyIw/XR7HtfkWolUxfApmwD
         Qk6Jo9IlJpusBH6BmvKM+55acdCpv/Hrvk4TxIhiCRyWEWE16QF1ZX7wZd1wZrgl+GK/
         AM/qcvaGS69IIPL0cNWZ4109Cgt1zDhABvv1AtkS8pEUHQjLsXGt3y9ImDSJj1B89ff1
         p+ZlLPwjaaOzQhMygCpxMeFXPXshgwAQxbdbLfvadhITZhAgTK9sLgG1XZnFRl1VlYI7
         AUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608609; x=1746213409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNI+wkZfospHmLOr+2+jXX5pJdTmqRckjghLYfMtBgk=;
        b=qJ7jOiZmke5dHkv5tbl3O8othFmpuKFiRi8wi6FU4zIf2hmlQbQySVYg4+xQRzuCTk
         zbu9hhCJ8j++eV4kkvoX1ylz1yhINAcuUFXQTAfycs+PwkNrdWQih3jPSOvTw6/1dLQS
         OmjmtZ1E69R/v9G/MJBhvZz1OywoYbNRuRA28A4bii+lMYgQ4PbUG4h7R0AbbJBxP5G6
         VIWkAnvImoaf73TER1im9W4BQF+U9wIfrQiL9BOCcv2PYzphJJpzApGqiK0YY2IdiEDw
         M5Gk3hvi786v3gsqwvsIBOP51kM4ZiGJTSKEYtACLnmVqM6dJjkbE/czxQkpErUaU0MD
         7gvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7d/9EF7mtSU40RN3+FrMmL3lzZPA4XMa5aeRBWBBqb1TH7lxUIYkLyEPv/aoIiiccaQbT+hfhEeaS6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5MO8HElCeH1S0O4xDKFDIqWK8pdg5KvfwMhteKh5fVjSm+fyG
	QUF+OAUHL+HMIRPy9rNesHuQ7kECnZ8cLQWqbmUeRqzkwMzR0eoAfB30hD65cys=
X-Gm-Gg: ASbGncvFB5FiyIvzkj7EuCn/AdKHghCmgxRWkvT5jGfpz8Tw/Wl2P1FDiQnraRZ6JY5
	qR0Z1XyS0xi3uxdcP8gOOeCnXxlBkn2IFtQiBR5RNY1e4J3df7QTFYxpo4giAbg30fCmQtWTXeR
	Rs3MoUCFl/BTTmrZkR6pf5da/LSZJLneGhC7sKTLukp1gaXPT6O5BeK7rIz4BeU79taZSf+VBLp
	70itnhYVIRJfj5f3owvhlRCTpO/UTZyP+tMudc5x410cky8/tMs7dmYsDpAoww6JCR3TJsIISN2
	gLTDagpibVhJC4Rb16aGQLigmLK9fTzuoJfM34oUs0vvPOU=
X-Google-Smtp-Source: AGHT+IFhMLeZWxbEN2BcydszBZXCVk7gJnHRAGc8GbZQro6UfqEPZMk7uHs43lBLaNwzfikdBQk+ag==
X-Received: by 2002:a17:903:1cf:b0:224:721:ed9 with SMTP id d9443c01a7336-22dbf73e8bfmr61560135ad.44.1745608609541;
        Fri, 25 Apr 2025 12:16:49 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db510304csm36179535ad.204.2025.04.25.12.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:16:49 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:16:47 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, ulf.hansson@linaro.org, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 20/21] riscv: dts: thead: Introduce reset controller
 node
Message-ID: <aAvfn2mq0Ksi8DF2@x1>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140316eucas1p29a76023868946f090f261bf78d5103e3@eucas1p2.samsung.com>
 <20250219140239.1378758-21-m.wilczynski@samsung.com>
 <aAP1BW3RmMb/Irya@x1>
 <81e53e3a-5873-44c7-9070-5596021daa42@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81e53e3a-5873-44c7-9070-5596021daa42@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_121651_104017_FA09D466 
X-CRM114-Status: GOOD (  22.50  )
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

On Tue, Apr 22, 2025 at 09:47:34AM +0200, Michal Wilczynski wrote:
> 
> 
> On 4/19/25 21:09, Drew Fustini wrote:
> > On Wed, Feb 19, 2025 at 03:02:38PM +0100, Michal Wilczynski wrote:
> >> T-HEAD TH1520 SoC requires to put the GPU out of the reset state as part
> >> of the power-up sequence.
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> index 474f31576a1b..6b34aab4b455 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> @@ -7,6 +7,7 @@
> >>  #include <dt-bindings/interrupt-controller/irq.h>
> >>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> >>  #include <dt-bindings/power/thead,th1520-power.h>
> >> +#include <dt-bindings/reset/thead,th1520-reset.h>
> > 
> > Are you okay if I omit this hunk? My thead-dt-for-next branch is based
> > on 6.15-rc1 but thead,th1520-reset.h only exists in next until the merge
> > window.
> 
> Yeah, I'm not exactly sure how to coordinate such stuff, obviosuly it
> would be best if this chunk would make it to the 6.16, but if you think
> it would be problematic then omit it, no problem.
> 
> I will then update this patch series v3 [1] to gracefully handle lack of
> reset, as the 6.16 will not contain the required reset line for sure.
> 
> [1] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-2-70c5af2af96c@samsung.com/

I've applied this patch to my thead-dt-for-next tree:
https://github.com/pdp7/linux/commit/1b136de08b5feca37ebdb6d28db3c9c6285aba5a

We should be able to test with the driver in next once a new next is
published (which I assume will be on Monday in Austrlia).

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
