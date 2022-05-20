Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BBAC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 15:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=JNRpFnKK0tmnwPEdwM2izrlZzfH8m9/8N26wz6YDn9M=; b=JqeVnBA91Qpmi5tvpq4fPTO4Tv
	emfdHq7k1pnKCT2bPhWBfRO48relySEsHUOReHEz09+o1bKE0U2Wx306c6OQMequ+GZ+cQAMpMsBL
	pyKIogbVir2V64TdSdok04+iGiWF5TdCB/NXYgqqp4508VBYltwHfKH7ZqcHqtFpoEOGSMdX4jV8r
	B2HRRbtJiTxPCoCTB1aRBjovCCOSBf6uQnkoQ0fDOWZauMxTEzwjjXrvRxDLISXmQlHlxudTrSTDt
	Vyjs4irKgT7fJ7Vqm1/OT0I17VFhmS/miHDNXXo7yrgRGmdK5yG/YQ9aL31nkJqO4NMQZh0eYLpaW
	uq3ZpmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4ou-00DJrE-EF; Fri, 20 May 2022 15:45:40 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4od-00DJgu-MQ
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 15:45:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id f10so8375732pjs.3
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 08:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TKNizaJK5LV6+xJVusK1AbXEur+gt5eyzd/+ohEFbaY=;
 b=cbN/jl0GfdcCtf/Azw/VXzbl8NsOZvJpRJyyTD+AbHq1BYKI3LM1h0PpeAlYhHq+n5
 FCJn6OcULWUXQIJHC41wz7U2Q986qMf3AkdouzPyfSkrTM7zmHNwr3q1TgXu9p7jhj84
 BZPcAzT+wCyCg/Ro6sIcdzv/RaJ0T8/iqhYK20uAlD2FXDg+M2Ednojx5ui6Xp3jfJYE
 PWLYnIVYnUw2nWa3ygJZ96nKj2ZdDtx1/lNGvWfXxprLFTPPstl5+4xS/tbUSivIw8MD
 dtvhtPix341ID51aOa/DfkHlqMU40lOlUsP1AJ67AGaD53eWuJNXQrEfVYiDRfXXIz/A
 jvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TKNizaJK5LV6+xJVusK1AbXEur+gt5eyzd/+ohEFbaY=;
 b=fyTxYdrt48cmLGgZiLf14iCKHTBIyNA2Ad/Lt5fZrNQDZ9lbwrZK//pq7jXH3JMLX3
 ZQz619sWner/0GLwM97xUI53wxVjgdiJ/MxQF1ZoeRXKiqgNfw68Lo2+eaRsiIUxnkDI
 vbnF8/ovGaAz6MBQkLNnnuZfMRG9CPuy4ml1zfk2hCUVObwI9ICiWjDbdVO/xlH9jsbM
 HXboBPbz+PL8XMCci3BFMn0HM5g+yHtSrBKOBU4RL+KM8QH+8sA42eFgEF8LPbUNvCxm
 p9oK5+baKG/gUCUhbDh5IbyEe9Y5e4nWjcQRV2IAPz0kQMQjy+ZWztpACOPIlcyv89I8
 eI5g==
X-Gm-Message-State: AOAM530OGjUBNerpYy1q00AK3FMrqWwsiD1SJ+gWF9bCNBF7B4jDX9Ut
 oATBq+5HmHdkE32IWqul5ypaQQ==
X-Google-Smtp-Source: ABdhPJymU5KjZ8xh9FuahgzKmV4QoYMqJBdt+CEAiub2X07vT+ut6dzIiIH/t7l8AltVjbDn7acZeg==
X-Received: by 2002:a17:90b:180f:b0:1df:cc0c:bbfd with SMTP id
 lw15-20020a17090b180f00b001dfcc0cbbfdmr11396565pjb.84.1653061522075; 
 Fri, 20 May 2022 08:45:22 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 w8-20020a17090a1b8800b001d95cdb62d4sm1953007pjc.33.2022.05.20.08.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:45:21 -0700 (PDT)
Date: Fri, 20 May 2022 08:45:21 -0700 (PDT)
X-Google-Original-Date: Fri, 20 May 2022 08:44:27 PDT (-0700)
Subject: Re: [PATCH v3 -next 0/6] riscv: kexec: add kexec_file_load() support
In-Reply-To: <20220408100914.150110-1-lizhengyu3@huawei.com>
CC: liaochang1@huawei.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 Bjorn Topel <bjorn.topel@gmail.com>, ebiederm@xmission.com,
 guoren@linux.alibaba.com, jszhang@kernel.org, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 mick@ics.forth.gr, Paul Walmsley <paul.walmsley@sifive.com>, penberg@kernel.org,
 sunnanyong@huawei.com, wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lizhengyu3@huawei.com
Message-ID: <mhng-86400921-7491-46ce-8248-d09a4d49f673@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_084523_785482_F0953DA9 
X-CRM114-Status: GOOD (  26.16  )
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

On Fri, 08 Apr 2022 03:09:08 PDT (-0700), lizhengyu3@huawei.com wrote:
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
> v3:
>  * Rebase on v5.18-rc1
>  * Workaround for -Wmissing-prototypes
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
>  arch/riscv/purgatory/purgatory.c       |  45 +++
>  include/linux/kexec.h                  |   2 +-
>  kernel/kexec_file.c                    |   4 +-
>  13 files changed, 683 insertions(+), 4 deletions(-)
>  create mode 100644 arch/riscv/kernel/elf_kexec.c
>  create mode 100644 arch/riscv/kernel/machine_kexec_file.c
>  create mode 100644 arch/riscv/purgatory/.gitignore
>  create mode 100644 arch/riscv/purgatory/Makefile
>  create mode 100644 arch/riscv/purgatory/entry.S
>  create mode 100644 arch/riscv/purgatory/purgatory.c

This doesn't build on 32-bit, there's some issues both in the arch code 
and the generic code.  Looks like nobody else supports these bits on 
32-bit platforms, so I've restricted this to rv64 for now and sent along 
a patch set to fix everything up for 32-bit platforms.

This, with that minor Kconfig change just squashed in, is on for-next.  
It passes my tests, but I don't have anything specific to kexec_file() 
so that's probbaly not so exciting.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
