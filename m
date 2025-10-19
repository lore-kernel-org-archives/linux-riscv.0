Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B2DCCD1AB
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 06:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DSBF5+H6UhiSTA5UqgJwXH81bEpHef1sPuZH6wHZK4=; b=b66XWYJ+/S+gaQ
	//m4021UsWQx2WzcZxdWbB/P5TcOeho0H27yf3jOYewe/zKU0+goccmI5wNZ/OTP3E3k1iUQlNaNy
	1Nkm+Xim6FnmquHHFGBV2/dMUFiSb+00s+kNdNr+jNb7mDhN2xYhnHynX4sFLdhABCiJD1uVvIujz
	KTAg7pAWW29XWBKuuFyjLHfX+qf/hqz+CVYhODfb4d48LUUbDWZOd5EJWYakEHIvbXjoM53yEP4Dk
	CbYOBH8fOAM4IyeNgtDQ+3tZjgy/65OeIFNRp0kSlxViZ3le0zO4P+cGNDLAdtFMmHnafqfmm/F8f
	Fazji4yCom3OmAYTIMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAMbM-0000000AiaS-1xZl;
	Sun, 19 Oct 2025 06:09:08 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAMbK-0000000AiZl-0IC6
	for linux-riscv@lists.infradead.org;
	Sun, 19 Oct 2025 06:09:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4712c6d9495so7974005e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 18 Oct 2025 23:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760854143; x=1761458943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=;
        b=P03z5OtYxnTNKJPmSc2tY3Kg2VoA6NC869Fdrc7BrXtKABasNzJYrkiiWx241yEFa+
         AC4NxB3Tt6EL5EIGszjxAfKPGmeDDs/oRWKVTebIgTnXgFPxMd4I4wWSLMhQT3L4Z1gZ
         yd/fEANImMeYvKMBQylXiLj252NDNPYAPUJUYyD0gHKEW+NaVGeEDP5NdpwJ/cL99f93
         mBMD+Gdjk0bDLxMYSo96Z37ESDC/DT1IeOA+V6IJgCakXro66omNNtQW/AlyQA/i/NCf
         Ot7F1sINs9rrvuZR6wO4keEl91MNxCJWpp3hLnuXib7mIdaJGiu7uNr+/KUtTGzE5jiD
         kUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760854143; x=1761458943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=;
        b=P7XsfrKRGoUwBfgVavsWLKS0MVTtVARmlY+Q6OjTEHGc78gUiZ1qQnyYAuwPVL2yqc
         0Tm7wRuNb3I+epF0uchxnRC96IJ6aHwX8deiuAiNj8P9pj7GP9iXfJZIriEfkrbdsEfM
         wf6143PIvDQSiIQvg0PaumJX7CwST6scDX6uZpDpeTZDRcHfvSeAI8PhTaSQPGGoEmuZ
         QKTveJv6UMCzATkav0dZPY2H7Et5hMN8ROU/XTwS/PStswnvGkSV3wtVXNv5JsickHUE
         zT83EvJeCAjP72nGoJIZgrZrbrE4fFZpPm4KHlHqCkT5u5r1A8buskgdz/lCseH3RE6O
         tAXw==
X-Forwarded-Encrypted: i=1; AJvYcCWelHwvfyVyIlHIUgotH+oEuKg8irWcC9jeBfbDX2tdY/9yJmZRSCamooYTbXfqlZ3Tqgo6GrFpgJTmrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhdPHOqQlS6e0TVIZU4K1k0HX9G3pjIzYMmjlpVSn+T78iWpYY
	HB+JTFmKjQMaUqw4EA9PbRmD21o+YSi/tR+GsPYJ2OxynO89p9D69Nw0
X-Gm-Gg: ASbGnct7opKVlX0qnRao8e7EgymFNcG0J8IaqqcpoMoVHEEM8uil2OFw4dW3BpWArqk
	bra2L+pQUWbFa3xupN3OcoQgo2v3tHkqLdEyERpsGWzVqlvyUMxTq+h/Xvv5usgJmp/Jy5vUSSI
	56+DykjCa8NZB1U+xm6bZjwa/aPEYTpgDPoHQSS68LtHzqNd6/lY+Ir+mRcBugT1hhm+0uD/vYX
	jaGoFsgub1F7PFh8D7oMWFUyUsS0/tJK9hx9GfpgnWkQwZ2FQQgzhc/LrYjOkwKVXvoPtR9fxSI
	qN/I3bP3swtfeBP/Ui1/syoUNgOcLVMa22b8U//UhGcFe3H0arwyZ3W71vQbMoEOwtzoqesINfk
	ZtL7/yV7igEpo5d2SLugclVwL+mWyDcv0VAR3xjy1adntvudEFCqIm/NscpYcQ9UCRv06/Gud04
	TS
X-Google-Smtp-Source: AGHT+IEZ5upR5rvq2pYeoFEK0g1VqqLoHFsnsUnK8lryUbaHf4IrN1h8fWBgNccm4eIUhXw2FJ5z5w==
X-Received: by 2002:a05:600c:820f:b0:471:176d:bf8a with SMTP id 5b1f17b1804b1-4711791cd3dmr68834905e9.35.1760854143309;
        Sat, 18 Oct 2025 23:09:03 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4710cdb9d4dsm83976805e9.5.2025.10.18.23.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 23:09:02 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: ebiggers@kernel.org
Cc: ardb@kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
Date: Sun, 19 Oct 2025 09:08:45 +0300
Message-ID: <20251019060845.553414-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20241202010844.144356-16-ebiggers@kernel.org>
References: <20241202010844.144356-16-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_230906_139935_34F48E57 
X-CRM114-Status: GOOD (  13.76  )
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

Eric Biggers <ebiggers@kernel.org>:
> Now that the lower level __crc32c_le() library function is optimized for

This patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to lib"))
solves actual bug I found in practice. So, please, backport it
to stable kernels.

I did bisect.

It is possible to apply this patch on top of v6.12.48 without conflicts.

The bug actually prevents me for using my system (more details below).

Here is steps to reproduce bug I noticed.

Build kernel so:

$ cat /tmp/mini
CONFIG_64BIT=y
CONFIG_PRINTK=y
CONFIG_SERIAL_8250=y
CONFIG_TTY=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_RD_GZIP=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_PROC_FS=y
CONFIG_SYSFS=y
CONFIG_DEVTMPFS=y
CONFIG_MODULES=y
CONFIG_BTRFS_FS=m
CONFIG_MODULE_COMPRESS=y
CONFIG_MODULE_COMPRESS_XZ=y
CONFIG_MODULE_COMPRESS_ALL=y
CONFIG_MODULE_DECOMPRESS=y
CONFIG_PRINTK_TIME=y
$ make allnoconfig KCONFIG_ALLCONFIG=/tmp/mini
$ make

Then create initramfs, which contains statically built busybox
(I used busybox v1.37.0 (Debian 1:1.37.0-6+b3)) and modules we just created.

Then run Qemu using command line similar to this:

qemu-system-x86_64 -kernel arch/x86/boot/bzImage -initrd i.gz -append 'console=ttyS0 panic=1 rdinit=/bin/busybox sh' -m 256 -no-reboot -enable-kvm -serial stdio -display none

Then in busybox shell type this:

# mkdir /proc
# busybox mount -t proc proc /proc
# modprobe btrfs

On buggy kernels I get this output:

# modprobe btrfs
[   19.614228] raid6: skipped pq benchmark and selected sse2x4
[   19.614638] raid6: using intx1 recovery algorithm
[   19.616569] xor: measuring software checksum speed
[   19.616937]    prefetch64-sse  : 42616 MB/sec
[   19.617270]    generic_sse     : 41320 MB/sec
[   19.617531] xor: using function: prefetch64-sse (42616 MB/sec)
[   19.619731] Invalid ELF header magic: != ELF
modprobe: can't load module libcrc32c (kernel/lib/libcrc32c.ko.xz): unknown symbol in module, or unknown parameter

The bug is reproducible on all kernels from v6.12 until this commit.
And it is not reproducible on all kernels, which contain this commit.
I found this using bisect.

This bug actually breaks my workflow. I have btrfs as root filesystem.
Initramfs, generated by Debian, doesn't suit my needs. So I'm going
to create my own initramfs from scratch. (Note that I use Debian Trixie,
which has v6.12.48 kernel.) During testing this initramfs in Qemu
I noticed that command "modprobe btrfs" fails with error given above.
(I not yet tried to test this initramfs on real hardware.)

So, this bug actually breaks my workflow.

So, please backport this patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to lib"))
to stable kernels.

I tested that this patch can be applied without conflicts on top of v6.12.48,
and this patch indeed fixes the bug for v6.12.48.

If you want, I can give more info.

It is possible that this is in fact bug in busybox, not in Linux.
But still I think that backporting this patch is good idea.

This busybox thread my be related:
https://lists.busybox.net/pipermail/busybox/2023-May/090309.html

-- 
Askar Safin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
