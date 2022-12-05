Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91899C4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1luWkaOQTbBl2eyOXseK+I86Fc5M1mDRDC9sIOCHEoE=; b=F7eggMyP5qQ9oa
	WO7mgDkP7vTI1V9DVp35YvrMRbeebQCCl9GyHMIW+l6IbQm2/asvpb0LHdLPNVk01NbFZrM8aCSGT
	Lfwd6WQ5d+8WpADzAFNow6n7DnMKPDDqAbgEnhScUHF2x0CBZImL90tZoS/a1yDUD68L9ErnekcL0
	hi611sdLEkr/Jur6BPc33k7qUk+hi/w+YSJsAHbkCckoclYotHVWCDFMF+fUKrsr02TJcmG7Jqhz0
	FdeDdATm3cKG+Q99PTE9YG5tqSttUdB+vtzfZeXO+BnkHy+in+1NPfHWUDQFS5lx8yNsYovPMmJ3x
	qK2XfnHXJQpzfCDY9Dqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27XT-00GtiB-A9; Mon, 05 Dec 2022 09:13:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27XR-00GtgE-2c
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 09:13:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7DB21B80D9C;
	Mon,  5 Dec 2022 09:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A280EC433C1;
	Mon,  5 Dec 2022 09:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670231602;
	bh=BxyB9UbcH7VMa4LZtCngzzb08+kauzvcdH5JV40PM6o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ewk8yMS+YVNKhle2v6S8qXC/9kE/yOPobcpuNGnGZ+I7WFAZeGrxiQJEtzX3wI8sr
	 8g9/fNnprw5Rg47kBQIUPWlxKZ4H/0/4AjVEsaV9zuVes49nYheTc7KBpLOk38zodQ
	 izkG4nJobxvVEDRfvjatgUMwDD5+Mu4dp6a3aUHDRDbalaqSBmfMTsb9xMIhMoVIf9
	 Nganxkt67B8I+SY5Gp4az3B5Kx55WJ7bAG+7vEH/DifQRdZanypMH2jBHAnHHdVe31
	 MqSZesfugHGzQL8U4EdI/D+p51iB/0w2++1jGLcxfFWUiAJMmoSXuAkBIvxOEMftQ7
	 eUzKJUJo58eBg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com,
 zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com,
 chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -next V8 02/14] riscv: elf_kexec: Fixup compile warning
In-Reply-To: <20221103075047.1634923-3-guoren@kernel.org>
References: <20221103075047.1634923-1-guoren@kernel.org>
 <20221103075047.1634923-3-guoren@kernel.org>
Date: Mon, 05 Dec 2022 10:13:19 +0100
Message-ID: <87iliq9psg.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_011325_307397_B3DA934A 
X-CRM114-Status: GOOD (  15.66  )
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

guoren@kernel.org writes:

> From: Guo Ren <guoren@linux.alibaba.com>
>
> If CRYTPO or CRYPTO_SHA256 or KEXE_FILE is not enabled, then:
>
> COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1
> O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/
>
> ../arch/riscv/kernel/elf_kexec.c: In function 'elf_kexec_load':
> ../arch/riscv/kernel/elf_kexec.c:185:23: warning: variable
> 'kernel_start' set but not used [-Wunused-but-set-variable]
>   185 |         unsigned long kernel_start;
>       |                       ^~~~~~~~~~~~
>
> Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  arch/riscv/kernel/elf_kexec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
> index 0cb94992c15b..4b9264340b78 100644
> --- a/arch/riscv/kernel/elf_kexec.c
> +++ b/arch/riscv/kernel/elf_kexec.c
> @@ -198,7 +198,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
>  	if (ret)
>  		goto out;
>  	kernel_start = image->start;
> -	pr_notice("The entry point of kernel at 0x%lx\n", image->start);
> +	pr_notice("The entry point of kernel at 0x%lx\n", kernel_start);

This patch shouldn't be part of the generic entry series. It's just a
generic fix! Please have this as a separate patch.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
