Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87E06072C48
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q+oyDOz3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XpFeehY4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ThN+x52kgOgeUckkBQ2vsaKQ+l4TDY5319TCxjGwa/s=; b=Q+oyDOz3o6/ggFKtAwQvI4cwvJ
	YXc1xuv5xUh9ms/6N023Z3V+/Wsr2oct+cQd7dNr9XeAIgWPS2f5HRSpfqIBWjpYQtHugW4m8lmrR
	n4CGVVtojNQQkjL8NbObkFkMAwnFTpvnBD+MO1JogVeDyPSLFgpJ8Za/r6EKCklA2OBjDsPeWtNIG
	3702qwIE3tcJnGiBHKsq/tRGZN4wz1J8pKrJtVWVvBSTpT/1RNMM+gp9wND+RC5m84wOgDPKPpkHX
	ERSRsFbSelvh7AjhldBzgob+5fLFP9klZ44yxbs3+P1+9NNofB+ohT22rxOaZ3sfwkb5uGRYW2oo6
	4Ty5KgCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsy2-0000000GnfG-3M0r;
	Mon, 02 Nov 2026 14:24:59 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsy0-0000000GndH-22q1
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 14:24:57 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e7e742a2c7so20489345ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 06:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629496; x=1794234296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+OZmX8JIf6s1L/six0W6PN/I70GBs5nxLKcsSZPbfs=;
        b=XpFeehY4h3CSFLx6XwZw3ohbyF92CanJ7jg9wGDUB+Me7irD9OuFDWtMAl9pgLeEx9
         Mo5AlcrERZc1IVLwiZ9lHh3Oqovcrmp8iKf0HSk9Kpkj+QcPxLlTdw6zLSQ+wCIsnDac
         dURQYExmPlLoeq6/UDWnYtXB3grvIqOFjYuPZuUyscdwS97J7ESJHxm4oBF3FxzM/M0P
         NcP4mHPIVpBuPa6j22WihvAgtJEFsnjkebMr+bVd5xNoEAtAWKJl+U1wG8Ft3uXNi468
         zTqiyU1NBixWD/ZJqC3L1WfCMclEf6e1d0OVCAEYeosZiybEqcJeV1I4XIqVjWMJT/dS
         EIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629496; x=1794234296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+OZmX8JIf6s1L/six0W6PN/I70GBs5nxLKcsSZPbfs=;
        b=U+l3NdHg8PZL8xPZue1BA4BsEJ4cJvnk/jwrDowvQBuYhJfC6stUL+kUa/fwji/mFA
         FoxqMzD0l27MSMbWLR3tClNmHMZRVoAGExN9wZPD+Ec9jjB3vsSSIdXIpkmv7+/cQKZH
         lNrJtTPgNRyOpfOKXzqM75AhZhEOkZvETB/6dUDu+AtwkuBzfsYnkodkqMU9xvG3MdtC
         M6gI8oJnqHR+NWg+G0GGCcMs64ndjbjY4craWaLTzCYYyP5pnCWNggGQ2H4T2WKXh0yz
         ISpZp6LwtB2Tz2/vXjOZJts2sjmzf6kliyllkvPI7sksD+tlw0McUK04iWB1mDD2D3H4
         snYg==
X-Forwarded-Encrypted: i=1; AKwUvBzfbZM8xEehMHPCS7VSiRVZKh5inwe6IApRi/DrXCZW4OTkl5vRP1c9xfyep2Q/oNoeEV5fae0G+XRBTg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+UWtbGqjuRtH7AztRvqDnYmbLMNfIFZYgUOSkcJP9ehzdCaWhl
	pIbwCP1ucWezQSpP8y3Xn2uEmzYiU2O7Jy0MpTe1a4YXaJFaYb/5T7MR
X-Gm-Gg: AYBFou1B+TGRI27bxkCd6pHbEAFab4HswCcZg/imlIfc2wSG8T8HAQ3tzgOLmWsDDLB
	D0YyzZwII8alkLzvg89KkkIfhZYW5K8jO3T8tp7NjOziPF/w47qkinYff9WfDqAeNpWZnNLN6Ho
	0WGeLg7VXUXq2IyJP/AfIU+x/I0uvBilgj1uXQRMWrHVWNil3IEq5qSmEnU3Xff0LHCoyYGw+KF
	Yy5+A+MruQ9DKV9ESnkJGYs740t599lorQ+2ahPnQV2KsQrzYrnnJzvqp4loBbSdOhwYMCXxcCz
	XmIoj2Hcr/B7cIMrta3DymSVmNj5Dn080fMdKcKq98oB5y2mPqeo9dwC8yNSs/B46cz/s74p3re
	cJeEPo16t36OHfTAJIyWylUZfqMYVHE2l9oeZTR76DyGEcbd1IwR3WTk5yVXkrGZIRWAwYw7Bec
	OuOyhCOUzPyq3tao2ZI2TkUrvTv18t8vaMq4upqEHu0CQEFdDJ7K6JJn5583fqsV482oXYDlWL0
	8JYtgDLOfAKmz+WcalNN0haglKjqejL0lybIPXt6esyttM339duwX95wiXbH/T75b271A5dszvY
	H/sK3L/6/OztLWjeIw216LSRW3bna5yqJRzb5A7yftSFBuYPbyiLSn2rKQ==
X-Received: by 2002:a17:903:1a4e:b0:2df:9e44:32f1 with SMTP id d9443c01a7336-2eb364e1741mr69092915ad.29.1793629495462;
        Mon, 02 Nov 2026 06:24:55 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298543sm28720445ad.60.2026.11.02.06.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:24:54 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 14/18] riscv: dts: zhihe: add A210 UARTs
Date: Mon,  2 Nov 2026 22:24:46 +0800
Message-ID: <20261102142448.3784989-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ef0957a4ceaf754989f8a7132cb6276686244d24.camel@pengutronix.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_062456_531355_90DE4D2A 
X-CRM114-Status: GOOD (  18.52  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Drew Fustini <fustini@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Radu Rendec <radu@rendec.net>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Bartosz Golaszewski <brgl@kernel.org>, gaohan@iscas.ac.cn, linux-gpio@vger.kernel.org, Daniel Lezcano <daniel.lezcano@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Paul Walmsley <pjw@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 11:22:51 +0200 Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Do, 2026-10-22 at 03:53 +0800, Han Gao via B4 Relay wrote:
> > From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> > 
> > Add the ten A210 UARTs with their clocks, resets and interrupts, using
> > the snps,dw-apb-uart compatible.
> > 
> > Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> > Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/boot/dts/zhihe/a210.dtsi | 150 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 150 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/zhihe/a210.dtsi b/arch/riscv/boot/dts/zhihe/a210.dtsi
> > index bbad51a3edb0..a07b67d10633 100644
> > --- a/arch/riscv/boot/dts/zhihe/a210.dtsi
> > +++ b/arch/riscv/boot/dts/zhihe/a210.dtsi
> > @@ -405,6 +405,66 @@ rst_peri1: reset-controller@2010400 {
> >  			#reset-cells = <1>;
> >  		};
> >  
> > +		uart0: serial@2014000 {
> > +			compatible = "snps,dw-apb-uart";
> 
> Prepend a vendor compatible if you need two resets, similar to
> "starfive,jh7100-uart"?

Thanks, agreed. The RFC that replaced this series adds a
"zhihe,a210-uart" compatible and lists both resets.

> 
> > +			reg = <0x0 0x02014000 0x0 0x400>;
> > +			clocks = <&clk_peri PERI1_UART0_SCLK_EN>,
> > +				 <&clk_peri PERI1_UART0_PCLK_EN>;
> > +			clock-names = "baudclk", "apb_pclk";
> > +			interrupt-parent = <&intc>;
> > +			interrupts = <321 IRQ_TYPE_LEVEL_HIGH>;
> > +			reg-io-width = <4>;
> > +			reg-shift = <2>;
> > +			resets = <&rst_peri1 PERI1_UART0_PRST>;
> 
> This looks to me like it should be
> 
> 			resets = <&rst_peri1 PERI1_UART0_PRST>,
> 				 <&rst_peri1 PERI1_UART0_S_RST>;
> 
> instead.
> 
> regards
> Philipp
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
