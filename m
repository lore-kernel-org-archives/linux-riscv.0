Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04346C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 22:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=cUiawCvX/fZE6b481/UHNJKFD+agyGVzwIwvkh8ee1U=; b=SY4XC4wPunypGfWu6do4dteUK+
	2p0B7uI1YEgzFmCEbdxkNBTTeWL1arlfLtv+oMwfLMuwjrwjLANbmGhYTRzShpF8jkhCQniv2prJI
	HwKr8u4SWg59oaBNIP7GO6nAgtZZdkXIV2W/bhE55WJPyEB8rrfN9dAq5w4l2OrHiouXSCV8g+W8d
	cb817a2xRZp8JtSBag+kozarxabu+O/VstaxWrVj+NEk+kZVgqdsIfMprGPQZXKZ7/DpkedBRSuid
	mcgS564VGVxtSD+IvXhaQep6FAIE8ZD9vzLWhaQYP3GkLdX9n6dkaohj+0JiYtrWp/9TgDKx1Q6IA
	7FxSz/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1xc0-004XSS-Aw; Thu, 16 Jun 2022 22:05:12 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1xbj-004XKh-RI
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 22:04:57 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 73-20020a17090a0fcf00b001eaee69f600so2630312pjz.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jun 2022 15:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=l7bNYgy+kj8u/jxC0moNwUt1/A1dWzpe6enKDLs3CYw=;
        b=vbp6VGbXIF+ANmagPv6oY9KhOIlXhEJ/vbaTYawbBSJUALwdTygMrXNi6hIbI2uVtA
         WDsDi0e7k+bgkXHlj45ijFbhfBjcycXF6UY5ZYfJ+MWZ0wn3tkcFEABG0WRFtdpVTpDX
         dGC0zHuucnNwJXo2U+7H90bxpNRp37Lp8v/wgZajKi09AnZ+nq6wN2ICLne/E6Qc4ASE
         pz3iw3f4no4zX/fQLqTUVnjjtSDz7V7RuU90fOB9lkGOpQrVPY6R1GnVjSjudzsMpJqq
         HTWXNrG2csc19lOCRuYMGtROF1jKTVT0wTQZTFK1pICfVcZrImaZdHtzr8mmIBtaKS8M
         xP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=l7bNYgy+kj8u/jxC0moNwUt1/A1dWzpe6enKDLs3CYw=;
        b=pl7Pmdju44BkMxkpoiEioBNIkbEROcFJpsL0/R6x1zvAiEEyyodpr4bneaE3bldi+b
         FImXpyNoVXjhzquQQlta49td8Q8bbPx0qel7P7Ih9OWY5WrEUk4eYqdvlrvtuaGgTkVE
         dbB5OFJajCgfbvRxSOcTle398SaPJNvvTRGcvgVH0FeslKRkshtcU9fvT4gleVChBn+w
         dO6tY7EsWv+7vaH2oOgJ2pWUOwomu6ThcfCDSGyfRB6RhVax1E+KFnx7kqJ4oFIFHj/9
         Aloivb35ZtaPUUSd3r5shRXTJBzn5LHXd832rpNShxc3bwKgKMelBcFepC1/siosW6TV
         Y4Rw==
X-Gm-Message-State: AJIora+MNiuLyAJTmqY0O7kVjlvMouq+2f11exaukPB0ZC+Y+2oFNS57
	uTIccJanrcwHJUp8b5NqzI5N7g==
X-Google-Smtp-Source: AGRyM1u/yXpwyrUF4jgUMyqRVFRAoXSg7gMnc5yFVQgEn/9sJrmjQsFr4WOYlU3Q3XtOqdWvT2kljA==
X-Received: by 2002:a17:902:9348:b0:167:8e92:272f with SMTP id g8-20020a170902934800b001678e92272fmr6779739plp.77.1655417091611;
        Thu, 16 Jun 2022 15:04:51 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id r24-20020a638f58000000b00401a7b4f137sm2311093pgn.41.2022.06.16.15.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 15:04:50 -0700 (PDT)
Date: Thu, 16 Jun 2022 15:04:50 -0700 (PDT)
X-Google-Original-Date: Thu, 16 Jun 2022 13:10:07 PDT (-0700)
Subject: Re: [PATCH v2 0/2] introduce unified static key mechanism for ISA ext
In-Reply-To: <20220522153543.2656-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  atishp@atishpatra.org, anup@brainfault.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-ea1ebe26-82ad-4a9d-b024-f6d79a0cb699@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_150455_997940_28656E47 
X-CRM114-Status: GOOD (  16.91  )
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

On Sun, 22 May 2022 08:35:41 PDT (-0700), jszhang@kernel.org wrote:
> Currently, riscv has several extensions which may not be supported on all
> riscv platforms, for example, FPU and so on. To support unified kernel
> Image style, we need to check whether the feature is supported or not.
> If the check sits at hot code path, the performance will be impacted a
> lot. static key can be used to solve the issue. In the past, FPU
> support has been converted to use static key mechanism. I believe we
> will have similar cases in the future.
>
> Since v1:
>   - fix typo, thank Atish
>   - remove riscv_isa_have_key_extension() instead use the isa ext keys
>     directly as pointed out by Atish.
>
> Jisheng Zhang (2):
>   riscv: introduce unified static key mechanism for ISA extensions
>   riscv: switch has_fpu() to the unified static key mechanism
>
>  arch/riscv/include/asm/hwcap.h     | 25 +++++++++++++++++++++++++
>  arch/riscv/include/asm/switch_to.h |  4 ++--
>  arch/riscv/kernel/cpufeature.c     | 14 +++++++-------
>  3 files changed, 34 insertions(+), 9 deletions(-)

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
