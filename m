Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCCAC43334
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 16:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sIr///K6zP/QQqbwNfXi2QN94AxxhQCs6TvS0sKGS5Q=; b=DZJGijIXIJ860M
	dnRSaaZqH+SEpKVU+YAEGbCwrYJSp7+Uu5ktDz79MXRsMLbwXp47veMIBSDoQyxhe4k5pjS3JwVxJ
	1XIwr1sHw/krWKd8gbM63Hlq8Fvf8mJ/g+9WTlG8THwvHW2VTS27v3eUk6dEV9PpYu8f562R0HkQM
	cxqhj2kUM+Fsi8oGTpRuH4Um2R6Gk+u8dwEutLZ6tr9kMI86eKUXHhClCCMqH7ooLa8pLeqa+GNOI
	39eMi1DOMXvzqMc6u63ED0tYWAcqe+43Fi3ItxUdHp+rrJQmb3nYOUA3F84do3+s7OqYM+FQVrTpw
	cZL88576cpCCygzJPIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwR9K-00H67Y-SM; Wed, 01 Jun 2022 16:24:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwR7G-00H55W-9M; Wed, 01 Jun 2022 16:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NnrpreKpidqE44axlas7IG2FtD6kVX7jiGNsZlGRSdg=; b=GWo8xBBmfHNDPY3Fkj4OWs4PQX
	lcXWUplJvegZQ9aacMqx0YlweHe67SluYghTdn+kpfFSA9xdD404gCCpf1aZ1pJVwn1ij0ryH+HAW
	xZ+HvTcnp5SfvmMWR91+ZGqWIn28MAN8kYXYlq5/NxfYsXkIWgquQ0Phe6EyxWYSpRQK8zgIsREME
	yf2+8hQbxyoyrmfNAuyjeOMaG3rAI1etanTVPwEOS7JfWpkTR8m72oo4H4eEAyYceiQyKmIbLHQR7
	I+f5MWxDhp7IHzsvMEq7itda0dbOKKkk+tVRkt/rUdfZTlDUDPLunEHNWk5KrMvQQXyLGXcwV/sj0
	3vd+pikQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwQlK-003pGd-PA; Wed, 01 Jun 2022 15:59:59 +0000
Message-ID: <e507585a-574e-a217-479b-cb677d2df443@infradead.org>
Date: Wed, 1 Jun 2022 08:59:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] RISC-V: kexec: Fix build error without CONFIG_KEXEC
Content-Language: en-US
To: Li Zhengyu <lizhengyu3@huawei.com>, palmer@rivosinc.com, mick@ics.forth.gr
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu, liaochang1@huawei.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 ebiederm@xmission.com, kexec@lists.infradead.org, linux-next@vger.kernel.org
References: <20220601070204.26882-1-lizhengyu3@huawei.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220601070204.26882-1-lizhengyu3@huawei.com>
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



On 6/1/22 00:02, Li Zhengyu wrote:
> When CONFIG_KEXEC_FILE=y but CONFIG_KEXEC is not set:
> 
> kernel/kexec_core.o: In function `kimage_free':
> kexec_core.c:(.text+0xa0c): undefined reference to `machine_kexec_cleanup'
> kernel/kexec_core.o: In function `.L0 ':
> kexec_core.c:(.text+0xde8): undefined reference to `machine_crash_shutdown'
> kexec_core.c:(.text+0xdf4): undefined reference to `machine_kexec'
> kernel/kexec_core.o: In function `.L231':
> kexec_core.c:(.text+0xe1c): undefined reference to `riscv_crash_save_regs'
> kernel/kexec_core.o: In function `.L0 ':
> kexec_core.c:(.text+0x119e): undefined reference to `machine_shutdown'
> kernel/kexec_core.o: In function `.L312':
> kexec_core.c:(.text+0x11b2): undefined reference to `machine_kexec'
> kernel/kexec_file.o: In function `.L0 ':
> kexec_file.c:(.text+0xb84): undefined reference to `machine_kexec_prepare'
> kernel/kexec_file.o: In function `.L177':
> kexec_file.c:(.text+0xc5a): undefined reference to `machine_kexec_prepare'
> Makefile:1160: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1
> 
> These symbols should depend on CONFIG_KEXEC_CORE rather than CONFIG_KEXEC
> when kexec_file has been implemented on RISC-V, like the other archs have
> done.
> 
> Signed-off-by: Li Zhengyu <lizhengyu3@huawei.com>

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

> ---
>  arch/riscv/kernel/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index c71d6591d539..33bb60a354cd 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -78,7 +78,7 @@ obj-$(CONFIG_SMP) += cpu_ops_sbi.o
>  endif
>  obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
>  obj-$(CONFIG_KGDB)		+= kgdb.o
> -obj-$(CONFIG_KEXEC)		+= kexec_relocate.o crash_save_regs.o machine_kexec.o
> +obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
>  obj-$(CONFIG_KEXEC_FILE)	+= elf_kexec.o machine_kexec_file.o
>  obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
>  

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
