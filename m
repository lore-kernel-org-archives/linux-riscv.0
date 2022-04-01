Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01F4C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 02:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vMPDnwINLysXkZFTMVPbh19bBt7YLTS67vcuyZl13NM=; b=3iFRCp2+E+ZqtupSxSBYpjoxlb
	xbtw0OnkDTaqJuEF04su06wCuoS5P7VoV1FUwnjPAzoAgeIrKTEn6h6Jm2IldW8txjzaiHFtHQ3Gb
	BR2SBV11GGh4vBwgz+pmB5ZKDpJvQWhnDsf7+i69iVrsrpXKPBSzViuhjaYuUS+wt0+p2fJ6L6xf8
	c9PDk/SOlhELpxLtK6YnQpATSUr3VX7L4OpLFulsTbrynlOXLX5/1QxIse1kBoSVeE6xgZvhObqgg
	L+D3PFEjOET06MsRYzOWknyRXGyLmWkIO6MRSMN0bIl6Hjg5bQIpB6a9QQVYcs6tesokDuJhOjaUO
	5aAce8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na7AW-004IYS-2J; Fri, 01 Apr 2022 02:37:44 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na7AS-004IVX-G1
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 02:37:42 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 mj15-20020a17090b368f00b001c637aa358eso4117387pjb.0
 for <linux-riscv@lists.infradead.org>; Thu, 31 Mar 2022 19:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gBYCYz1bkk39xbyKo7MQ2WtVL9iFT5vSKgfWp7aQhV8=;
 b=BkEA7+Zl5MzzUQCvqogIhTJYYPvdJTk6PT+6zs0MxnDjQH+YH2K1/6WTZ/eunZ5MR0
 ZamaMNF/WT6f0OEZ7ZVanIV/AjhGLn5C6QKEGptHg13wc6+pqvTZk2nx9SVgCk2n8ul1
 tljAEF2v/OfMVEzet6sntz/e0xR7a2+S+VYZoROSrj8Gyutq8kKLKhJEN1UyLP0rbQy2
 MmD9yc7afum0nmGu9QpMBpWRgX9lMwnyXW7Ti5obmKnExR97CTP60yiHH9iZVf4piq+8
 Q32wbs5ftGOOhWsEPNIVNCzt3g8nNCzgPdC2LvKIjiBeCQc1Ec6D6fgZI3KwX13HaTYj
 l0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gBYCYz1bkk39xbyKo7MQ2WtVL9iFT5vSKgfWp7aQhV8=;
 b=noOFUuFsqI2NrbbLar0X7vm851ezfxBWzmpxceClaSFZ38TZUlKGODrJW9l0ywqIB2
 mANvoTWAlh8kLYab0R1JbJLcmbTCWaNNEF3gtWXup75my+2gylX9zi7LK5WtC6KOFB1u
 3UIVkmSYEwWlfI9TwNo8g1fNfaaRVArX0A1W4hWVawQ5ofny7TaIijNIt9qlSEhG2Mhj
 UjSoIhh/VPIAOUGdfKl4T6MEI7Lit+ZT/YAGtr1MMcQGqYmitSrbdh4Z90YbIFTM9zeM
 ykG8IzWDRgo9yXdMi9GoEsXjQGA1A97QooioTlx1fUgC0I68A+j86ruPCx4D4c1YyKC1
 d1Jg==
X-Gm-Message-State: AOAM532I6lnPmkIvio5GbS7FYt5QGNv7Di9dpswETb14+H4OiX602/b3
 C64HGhgnW358WBh+nSMy/Mv89g==
X-Google-Smtp-Source: ABdhPJygRK5APdtCoRrX/Zr1FLzYP83LYp5QO731w2mnNyypKr2ZxCP7OepqG94hBINlAwJrZsxTKA==
X-Received: by 2002:a17:902:be18:b0:153:2444:9c1a with SMTP id
 r24-20020a170902be1800b0015324449c1amr8465054pls.152.1648780654348; 
 Thu, 31 Mar 2022 19:37:34 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 ev16-20020a17090aead000b001c7c2919453sm10973632pjb.33.2022.03.31.19.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 19:37:33 -0700 (PDT)
Date: Thu, 31 Mar 2022 19:37:33 -0700 (PDT)
X-Google-Original-Date: Thu, 31 Mar 2022 17:13:10 PDT (-0700)
Subject: Re: [PATCH v2 -next 0/6] riscv: kexec: add kexec_file_load() support
In-Reply-To: <20220330081701.177026-1-lizhengyu3@huawei.com>
CC: liaochang1@huawei.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 Bjorn Topel <bjorn.topel@gmail.com>, changbin.du@intel.com,
 ebiederm@xmission.com, guoren@linux.alibaba.com, 
 jszhang@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mick@ics.forth.gr,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 penberg@kernel.org, sunnanyong@huawei.com, wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lizhengyu3@huawei.com
Message-ID: <mhng-1152c6f3-80c2-4409-848b-b882bbe2cbb8@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_193740_561012_57628062 
X-CRM114-Status: GOOD (  27.00  )
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

On Wed, 30 Mar 2022 01:16:55 PDT (-0700), lizhengyu3@huawei.com wrote:
> This patchset implement kexec_file_load() support on riscv, Most of the
> code is based on the kexec-tool-patch repo developed by Nick Kossifids.
>
> This patch series enables us to load the riscv vmlinux by specifying
> its file decriptor, instead of user-filled buffer via kexec_file_load()
> syscall.
> ``
> Contrary to kexec_load() system call, we reuse the dt blob of the first
> kernel to the 2nd explicitly.
>
> To use kexec_file_load() system call, instead of kexec_load(), at kexec
> command, '-s' options must be specified. The patch for kexec_tools has
> to be apply to riscv architecture source like this:
>
> int elf_riscv_load(int argc, char **argv, const char *buf, off_t len,
> 	...
> 	if (info->file_mode) {
> 		return prepare_kexec_file_options(info);
> 	}
> 	...
>
> Add following routine to prepare cmdline_ptr, cmdline_len and initrd_fd
> for syscall kexec_file_load:
>
> int prepare_kexec_file_options(struct kexec_info *info)
> {
> 	int fd;
> 	ssize_t result;
> 	struct stat stats;
>
> 	if (arch_options.cmdline) {
> 		info->command_line = (char *)arch_options.cmdline;
> 		info->command_line_len = strlen(info->command_line) + 1;
> 	}
>
> 	if (!arch_options.initrd_path) {
> 		info->initrd_fd = -1;
> 		return 0;
> 	}
>
> 	fd = open(arch_options.initrd_path, O_RDONLY | _O_BINARY);
> 	if (fd < 0) {
> 		fprintf(stderr, "Cannot open `%s': %s\n", arch_options.initrd_path,
> 				strerror(errno));
> 		return -EINVAL;
> 	}
> 	result = fstat(fd, &stats);
> 	if (result < 0) {
> 		close(fd);
> 		fprintf(stderr, "Cannot stat: %s: %s\n", arch_options.initrd_path,
> 				strerror(errno));
> 		return -EINVAL;
> 	}
> 	info->initrd_fd = fd;
> 	return 0;
> }
>
> The basic usage of kexec_file is:
> 1) Reload capture kernel image:
> $ kexec -s -l <riscv-vmlinux> --reuse-cmdline
>
> 2) Startup capture kernel:
> $ kexec -e
>
> For kdump:
> 1) Reload capture kernel image:
> $ kexec -s -p <riscv-vmlinux> --reuse-cmdline
>
> 2) Do something to crash, like:
> $ echo c > /proc/sysrq-trigger
>
> v2:
>  * Support kdump
>  * Support purgatory
>  * Minor cleanups
>
> Li Zhengyu (3):
>   RISC-V: Support for kexec_file on panic
>   RISC-V: Add purgatory
>   RISC-V: Load purgatory in kexec_file
>
> Liao Chang (3):
>   kexec_file: Fix kexec_file.c build error for riscv platform
>   RISC-V: use memcpy for kexec_file mode
>   RISC-V: Add kexec_file support
>
>  arch/riscv/Kbuild                      |   2 +
>  arch/riscv/Kconfig                     |  17 +
>  arch/riscv/include/asm/kexec.h         |   4 +
>  arch/riscv/kernel/Makefile             |   1 +
>  arch/riscv/kernel/elf_kexec.c          | 448 +++++++++++++++++++++++++
>  arch/riscv/kernel/machine_kexec.c      |   4 +-
>  arch/riscv/kernel/machine_kexec_file.c |  14 +
>  arch/riscv/purgatory/.gitignore        |   4 +
>  arch/riscv/purgatory/Makefile          |  95 ++++++
>  arch/riscv/purgatory/entry.S           |  47 +++
>  arch/riscv/purgatory/purgatory.c       |  42 +++
>  include/linux/kexec.h                  |   2 +-
>  kernel/kexec_file.c                    |   4 +-
>  13 files changed, 680 insertions(+), 4 deletions(-)
>  create mode 100644 arch/riscv/kernel/elf_kexec.c
>  create mode 100644 arch/riscv/kernel/machine_kexec_file.c
>  create mode 100644 arch/riscv/purgatory/.gitignore
>  create mode 100644 arch/riscv/purgatory/Makefile
>  create mode 100644 arch/riscv/purgatory/entry.S
>  create mode 100644 arch/riscv/purgatory/purgatory.c

This seems like a reasonable way to do things, but I haven't looked over 
the code yet.  Looks like the autobuilders are finding some failures, 
and it's way too late for 5.18.  If you have time to fix the failures 
then it'd be great to have a version based on rc1 with these fixed, so 
we can target the next merge window.  That'll also make it easier to 
look this over on my end.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
