Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3F7EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZA1NdQB4lTVGXH1KOSATyBMwsCMg5lPFnCnhQov67A=; b=E7ghne1I4V2KNC
	osCd9BStG2utYWCXZoakfRZdn6LIL+foXgzJkSusv3VFT98wtZVZG/HsWRzO/va2JLXsEwXQCoS21
	7nqKG0ZKmAHWgJs4IumejstWo4c1lbLUyqIMsA6K+F4BlTCSjIxP1B5iAmZCbOYRIppbPrVAg0eqU
	ccvXXXagQ+0xazYEDU/fMAJW5e8J4VKDzUH0p4ieeiO4yvQMbZOi8VjRzVxJlzq/mh30oailp1Xo+
	PgrGwt5nm0fkiF8W4EF8WGCCgBRF9gSofr0XcddmSx7DfIysJmZ1/nBCMX8OBFnPsJ/RS7besY6hT
	0qfOpATSbkP62Ly/sk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa1b-00A6fg-1q;
	Thu, 03 Aug 2023 15:14:03 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa1U-00A6Vd-27
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:13:59 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bba2318546so9402075ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 08:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691075634; x=1691680434;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwOPfqP2jqQDqtzxDPpbpkmjqrOiOYyKNAFNDG2M+II=;
        b=yPARXjcdGStftqjS/oaJ5OYvo5LUnTfmx1JvFnBofb2p/O4qgVB4qczUnlhcdDM9ie
         jc3iAyKoKYLaOCxs7AxQXXLuTnhHqG2jtdQ8svhSaLSYYOzSPPcBdlWjPfL7J055mVpx
         H/IbJCrtdcdxcOwQ/XdiIhnxhcGSftrkbPJCqRsJ+1eYgj5MVLRqPrIyUIWI04KbbLeV
         jvJQGNWJrf6TbAAzmJff/hZiQL1Ld7rMBNC53J3eEwrNKe0Rvdyr/Xts2pB/5GR1hqtQ
         ZpV/1fA6+tgyO6jX3Ipg8khhn50zxjdbPdfdwU045gNTqdPMTM2MtMX8cKjBM4oCAhfj
         nqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691075634; x=1691680434;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwOPfqP2jqQDqtzxDPpbpkmjqrOiOYyKNAFNDG2M+II=;
        b=OA66Bvg4/ti/dACHhCjOBk600WniDnq4fL6UCzp8unyVhEuwb/t94Z8iNaTs7GO1Ky
         DQGS2/3EPYCMAcuPTA3CpanfE51YDubCSN7I2arQd3FL0TeETZVCORX2p+VClGZ5Bgx/
         i/bZvELmGYBLuy9AaoCfkIsQL5AFkAnl9kJzwlnegxRfUo7d7k2g86v+FZNhT/G5Mnbw
         JjGNiNFq1wwatfQ0f6xJGqa8Akhvbbt4QS2Th/tSIQrxHAFDjo30UvPxM43weqTwuOBC
         +tEiEJJpcmUmd+r+PyX7uXG2W3Yn/AOXbduNizSJQjrjTuretnuimakZDBVsJZszLYzq
         tIpA==
X-Gm-Message-State: ABy/qLbjLnEhSBNsP3eBzWBNP53jf9c1iqUZeltg3r4OKN1WRmr4z3AH
	pGq81SOO1Uc0Rpr4FFndloe8qg==
X-Google-Smtp-Source: APBJJlF/emt41UduXS9wIVIwn/4gqNBAL9/6FhE5OrvzMvPUxpZj9XYWSKdyhE9O9GMBigEHv6eC3g==
X-Received: by 2002:a17:903:456:b0:1bb:77a2:edda with SMTP id iw22-20020a170903045600b001bb77a2eddamr17288120plb.36.1691075633664;
        Thu, 03 Aug 2023 08:13:53 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id y7-20020a170902b48700b001b8b1f6619asm14535688plr.75.2023.08.03.08.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 08:13:53 -0700 (PDT)
In-Reply-To: <20230724100917.309061-1-suagrfillet@gmail.com>
References: <20230724100917.309061-1-suagrfillet@gmail.com>
Subject: Re: [RESEND PATCH -fixes 1/2] riscv: Export va_kernel_pa_offset in
 vmcoreinfo
Message-Id: <169107392509.27633.2884019260902221664.b4-ty@rivosinc.com>
Date: Thu, 03 Aug 2023 07:45:25 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: bhe@redhat.com, vgoyal@redhat.com, dyoung@redhat.com, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
  xianting.tian@linux.alibaba.com, anup@brainfault.org, robh@kernel.org, ajones@ventanamicro.com,
  alexghiti@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>, Song Shuai <suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_081356_692549_3E0D942F 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
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


On Mon, 24 Jul 2023 18:09:16 +0800, Song Shuai wrote:
> Since RISC-V Linux v6.4, the commit 3335068f8721 ("riscv: Use
> PUD/P4D/PGD pages for the linear mapping") changes phys_ram_base
> from the physical start of the kernel to the actual start of the DRAM.
> 
> The Crash-utility's VTOP() still uses phys_ram_base and kernel_map.virt_addr
> to translate kernel virtual address, that failed the Crash with Linux v6.4 [1].
> 
> [...]

Applied, thanks!

[1/2] riscv: Export va_kernel_pa_offset in vmcoreinfo
      https://git.kernel.org/palmer/c/fbe7d19d2b7f
[2/2] Documentation: kdump: Add va_kernel_pa_offset for RISCV64
      https://git.kernel.org/palmer/c/640c503d7dbd

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
