Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A340CC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EP+nfwf1aB3onFex40h+CXFXYtwKi4b1Yvw0SU6bzI=; b=cZDRNukwgUe360
	JbT7mppjATZFjiVYiH2GyuGfxY0LYIfWdxF0N6PRT1fO83d4mkek5aLseKA1UkidWdDVsP2b9Io4Z
	CnaGOTEnI43BI267/qt9dHJhPUoDdHu+FJInhlh8MYrne5LErgWfAYT1C0LNhCFtzGdYkT5bWHIVO
	aVD8avtcv0cT+jnUeQINSbrpliplRTESrLd63w/dyZOmnEI/0Rabr7yRd0u0jrKKjLJ6IV9v4WYpQ
	4F1U23UOoljpXNPT/CYkqJx3QHE6jzFxGqAef8TQLJ55t7m4Qu8ujJOdMKsjBewCUjxmsJK3YTjHB
	NZBbx9HauNWrMXivpuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaFV-00BGhI-V6; Wed, 11 Jan 2023 12:30:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaFT-00BGgP-8g
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:30:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso2360047wmb.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 04:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GRVSfU07ytu5HxDQggGdpSbpnu/it+EbB187D49+Goc=;
        b=goVIv7Ab6tA/V78blzr6lRNm036xIvNe9OnqzEjmEL0+8Gi9XBq0KrwB58Pi+xPrBg
         bsUsoQulyHH3rO4bs/kUPH1Kw4EBtReg02Vj1xqaLuhwoGfi7aOzKvRM6bneWTY1YxuZ
         OiCvoyv1H+GfHHMgJFEXZ6DK9tmELpxwwDnBbzLCPG4ylRsTMjRIyaijmf8DLmV4mJJg
         1RRtVMP8lGNWvfT5lgv4ibAMduMj75BEmXhujNioK/E0oDv5OPgwo8RRY1jt4uWDY++n
         xZmIjuEBMxIRGUwjkfYIXZMH8H6ZmgMPvF6wtr8JZzkrqSJ5e7Bi9UNQDTgIliYXLEkr
         9M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRVSfU07ytu5HxDQggGdpSbpnu/it+EbB187D49+Goc=;
        b=P7/zpQBPR1p9+5DRAKHleUc2Bl9OZRaglCrBQtJ/OLcwiynVo3wL1soqs/43ni0J4a
         b7XWJBZcOWafWzp/XRQMMeu6AdT58NANQvFNjvUq/qY8wtSr0MTXd9BVSSKT2uDi3oeX
         QnTFExjW5ogRwVS+G4pprUzrPWBdMdgsqmZ7S8V2eyMJpDN+KNKO7ZU23cd7z2DQfGpV
         nAQYnEoadb8xvjtjdtag2RUeZQBU0OPz4stWHxDOivlrNqQxJB+SCVoRsg14db8J3FzB
         UcJ2zFjy68nOo6jzPx7h+G2hxw4AIaYJZXW70/mjptkIAkqVhZHRNVBeLbVhV4WQey3B
         H0Pw==
X-Gm-Message-State: AFqh2krR5mMTXLhG1mLDSFDbZc666xfFR/LivJqc3S9NCafL1k575x5a
	slsF8s0EWecnER132xGbm7u45Zw1A1DG+t1U
X-Google-Smtp-Source: AMrXdXvE0sov8+5cQlsj/gWNiLRBYiQsbboXFeJT/OLCFv6VwL6Y4ZywCP6Lhq8lWA2aoLOzYU4Nyw==
X-Received: by 2002:a05:600c:a4f:b0:3d2:196c:270c with SMTP id c15-20020a05600c0a4f00b003d2196c270cmr54957386wmq.31.1673440228775;
        Wed, 11 Jan 2023 04:30:28 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f11-20020a05600c4e8b00b003d04e4ed873sm26125397wmq.22.2023.01.11.04.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 04:30:28 -0800 (PST)
Date: Wed, 11 Jan 2023 13:30:27 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 4/5] RISC-V: add infrastructure to allow different
 str* implementations
Message-ID: <20230111123027.3uddjvdlwncn6x3a@orel>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-5-heiko@sntech.de>
 <20230110121320.zr4tk4nl2w57klqg@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230110121320.zr4tk4nl2w57klqg@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_043031_328327_6F58F39B 
X-CRM114-Status: GOOD (  13.69  )
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

On Tue, Jan 10, 2023 at 01:13:20PM +0100, Andrew Jones wrote:
> On Mon, Jan 09, 2023 at 07:17:54PM +0100, Heiko Stuebner wrote:
...
> > +
> > +/* int strcmp(const char *cs, const char *ct) */
> > +SYM_FUNC_START(strcmp)
> > +	/*
> > +	 * Returns
> > +	 *   a0 - comparison result, value like strcmp
> > +	 *
> > +	 * Parameters
> > +	 *   a0 - string1
> > +	 *   a1 - string2
> > +	 *
> > +	 * Clobbers
> > +	 *   t0, t1, t2
> > +	 */
> > +	mv	t2, a1
> 
> The above instruction and the 'mv a1, t2' below appear to be attempting
> to preserve a1, but that shouldn't be necessary.
> 
> > +1:
> > +	lbu	t1, 0(a0)
> > +	lbu	t0, 0(a1)
> 
> I'd rather have t0 be 0(a0) and t1 be 0(a1)
> 
> > +	addi	a0, a0, 1
> > +	addi	a1, a1, 1
> > +	beq	t1, t0, 3f
> > +	li	a0, 1
> > +	bgeu	t1, t0, 2f
> > +	li	a0, -1
> > +2:
> > +	mv	a1, t2
> > +	ret
> > +3:
> > +	bnez	t1, 1b
> > +	li	a0, 0
> > +	j	2b
> 
> For fun I removed one conditional and one unconditional branch (untested)
> 
> 1:
>      lbu     t0, 0(a0)
>      lbu     t1, 0(a1)
>      addi    a0, a0, 1
>      addi    a1, a1, 1
>      bne     t0, t1, 2f
>      bnez    t0, 1b
>      li      a0, 0
>      ret
> 2:
>      slt     a1, t1, t0
>      slli    a1, a1, 1
>      li      a0, -1
>      add     a0, a0, a1

If we just need < 0 and > 0 then the above four instructions can become

       sub     a0, t0, t1

>      ret
>

Similar comment for strncmp.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
