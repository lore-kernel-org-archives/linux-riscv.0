Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0765EDE995
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 08:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5WJdv6MEZ1EiBsGtDUBZ1+lIaNykVzkvF7U2Of4FRwE=; b=cW/OPh+bzPQ5afFMc94DYO2VWZ
	rDysaPuGZsMHwC080itj1jmevZXhe2b86i+NLtOnPB/35KU/lFCXTmgph+ebBEgpejqSZp9Il72mo
	RYUm5K54sggmRG67dDCdTbfPulGC1VfjZ8ZgWJHekO0KmrVfsdHfZGcgb6xgsIo6avbk582yFNoQQ
	ORTBckThBLLFymvCLFcBGc+UwffQ/ZAdwgLPJP4kRLqYgTT/1nuRkW/ivFNIlWkv4qFEI7I1AuS6s
	EomDlRSXhZFvDTyGBB2PqLkrnMbpOyO/ixpBLTtSdEuzjoMxaw47Ihct7H+JiIL7kQvF0Mdj+uxuQ
	VG5kM/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghqv-007j2j-0J;
	Thu, 14 Sep 2023 08:37:33 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghqr-007j1i-0p
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 08:37:31 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 73F1B3F67B
	for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 08:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694680645;
	bh=D8/vdg5WWy297srdvLmeFBOUg2iKk4zetQQ/8UfG4Fs=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hxcMLj3nvUMdJ5FWf5q2rluFdAolF5PNL6wLhuemiVUS0yt2wUDW/Y75sSgYwh9F1
	 5o2DkqjkpljbUtW8T9aJTFp+1l1qgXOG3ppAOfqHm7DJrGydmBKENig1YsQqpvQNO7
	 Q98Vg9TbRdLYYr7PyGdXwl2Mc8eIBAFlT1z+Wv4M4ZL9JNkgAnu2FwZS4FlzZLVv5+
	 oN7UvYy5KQKMS9ue+Toip4B5fPaKTyOFyLxdVK/kyg52ZfXQgxMgeJAXefV3jcUKnx
	 fRgj/oRIb8QXxf/chKzwC/uOzHNGx/LwxUuYO2JJ02eA1t8KOxM09L7tDyPke5dZDL
	 7AWCdDphakWaw==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41219864601so8039171cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 01:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694680644; x=1695285444;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8/vdg5WWy297srdvLmeFBOUg2iKk4zetQQ/8UfG4Fs=;
        b=OL1QcxV0K2Xjbo1hSxzylNeBvjnENEuypUA5cUvvk17oVVlcTwjfi3L023Ryeo2GQa
         W+SguJLqkNhSlrotWhTJZrikn5gkLCTJLDruX+IGo67xNgS8mCaPW3j2HE1yRgv/p/B9
         qeIGqZSKs8EyIIPuGEV25rwBxkqAijwRrKFU302rXhsA6GfoMMS7vTfbb3CDPWu68bII
         l8/1KnMfVTyR+ic9gWwIjgx+gDkOpmCWTgqJWeEz+2Gzp07kXyB/wLpD61siGqg49o17
         aJLUDYke/ngGF0MXTfA89xL37JadpeKzprNBb+hAGlQ8zLgglovsZAcLzEbZkRfE7m+e
         31kg==
X-Gm-Message-State: AOJu0Yzllgm7M6q3jPG3lw+xUHVWpBLdDfCyCVolPGt/Kc0d8WrVd9mo
	A/sVzO51wonSVwh3zd8CH3R9S+9RPcFJpo77WE7Z9LdrwFEEUwM6Nd159btssFr2cSeoJ9fOr01
	vLSLDIJTif6yasgOwziicGbj4NQa3GUKuAzFJPgYK0RoWffVAv6dgbbDbG6nUyw==
X-Received: by 2002:a05:622a:14d0:b0:412:184d:cfe7 with SMTP id u16-20020a05622a14d000b00412184dcfe7mr5526751qtx.26.1694680643772;
        Thu, 14 Sep 2023 01:37:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNnZ+nGTMsCn0DRQNe0Qzahm4pMoonr/P+YAcKTP/sMMuWeo6QZg94wyWt7YgQ3pHq4DHx2t63CBIKEdArydA=
X-Received: by 2002:a05:622a:14d0:b0:412:184d:cfe7 with SMTP id
 u16-20020a05622a14d000b00412184dcfe7mr5526722qtx.26.1694680643522; Thu, 14
 Sep 2023 01:37:23 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Sep 2023 01:37:23 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230914020044.1397356-3-songshuaishuai@tinylab.org>
References: <20230914020044.1397356-1-songshuaishuai@tinylab.org> <20230914020044.1397356-3-songshuaishuai@tinylab.org>
Mime-Version: 1.0
Date: Thu, 14 Sep 2023 01:37:23 -0700
Message-ID: <CAJM55Z8D3yJREg0+UtecW3wpgrGKxZYP73Pvbi2oaQfsZf4Gfw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: kexec_file: Support loading Image binary file
To: Song Shuai <songshuaishuai@tinylab.org>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lihuafei1@huawei.com, 
	conor.dooley@microchip.com, liaochang1@huawei.com, guoren@kernel.org, 
	ajones@ventanamicro.com, alexghiti@rivosinc.com, evan@rivosinc.com, 
	sunilvl@ventanamicro.com, xianting.tian@linux.alibaba.com, 
	samitolvanen@google.com, masahiroy@kernel.org, apatel@ventanamicro.com, 
	jszhang@kernel.org, duwe@suse.de, eric.devolder@oracle.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_013729_441259_E22D65D4 
X-CRM114-Status: GOOD (  24.14  )
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

Song Shuai wrote:
> This patch creates image_kexec_ops to load Image binary file
> for kexec_file_load() syscall.
>
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> ---
>  arch/riscv/include/asm/image.h         |  2 +
>  arch/riscv/include/asm/kexec.h         |  1 +
>  arch/riscv/kernel/Makefile             |  2 +-
>  arch/riscv/kernel/kexec_image.c        | 97 ++++++++++++++++++++++++++
>  arch/riscv/kernel/machine_kexec_file.c |  1 +
>  5 files changed, 102 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/kernel/kexec_image.c
>
> diff --git a/arch/riscv/include/asm/image.h b/arch/riscv/include/asm/image.h
> index e0b319af3681..8927a6ea1127 100644
> --- a/arch/riscv/include/asm/image.h
> +++ b/arch/riscv/include/asm/image.h
> @@ -30,6 +30,8 @@
>  			      RISCV_HEADER_VERSION_MINOR)
>
>  #ifndef __ASSEMBLY__
> +#define riscv_image_flag_field(flags, field)\
> +			       (((flags) >> field##_SHIFT) & field##_MASK)

Hi Song,

This macro is almost FIELD_GET from linux/bitfield.h ..

>  /**
>   * struct riscv_image_header - riscv kernel image header
>   * @code0:		Executable code
> diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
> index 518825fe4160..b9ee8346cc8c 100644
> --- a/arch/riscv/include/asm/kexec.h
> +++ b/arch/riscv/include/asm/kexec.h
> @@ -56,6 +56,7 @@ extern riscv_kexec_method riscv_kexec_norelocate;
>
>  #ifdef CONFIG_KEXEC_FILE
>  extern const struct kexec_file_ops elf_kexec_ops;
> +extern const struct kexec_file_ops image_kexec_ops;
>
>  struct purgatory_info;
>  int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 1c62c639e875..9ecba3231a36 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -86,7 +86,7 @@ endif
>  obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
>  obj-$(CONFIG_KGDB)		+= kgdb.o
>  obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
> -obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o machine_kexec_file.o
> +obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o kexec_image.o machine_kexec_file.o
>  obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
>  obj-$(CONFIG_CRASH_CORE)	+= crash_core.o
>
> diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
> new file mode 100644
> index 000000000000..b6aa7f59bd53
> --- /dev/null
> +++ b/arch/riscv/kernel/kexec_image.c
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V Kexec image loader
> + *
> + */
> +
> +#define pr_fmt(fmt)	"kexec_file(Image): " fmt
> +
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/kexec.h>
> +#include <linux/pe.h>
> +#include <linux/string.h>
> +#include <asm/byteorder.h>
> +#include <asm/image.h>
> +
> +static int image_probe(const char *kernel_buf, unsigned long kernel_len)
> +{
> +	const struct riscv_image_header *h =
> +		(const struct riscv_image_header *)(kernel_buf);
> +
> +	if (!h || (kernel_len < sizeof(*h)))
> +		return -EINVAL;
> +
> +	/* According to Documentation/riscv/boot-image-header.rst,
> +	 * use "magic2" field to check when version >= 0.2.
> +	 */
> +
> +	if (h->version >= RISCV_HEADER_VERSION &&
> +	    memcmp(&h->magic2, RISCV_IMAGE_MAGIC2, sizeof(h->magic2)))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void *image_load(struct kimage *image,
> +				char *kernel, unsigned long kernel_len,
> +				char *initrd, unsigned long initrd_len,
> +				char *cmdline, unsigned long cmdline_len)
> +{
> +	struct riscv_image_header *h;
> +	u64 flags;
> +	bool be_image, be_kernel;
> +	struct kexec_buf kbuf;
> +	int ret;
> +
> +	/* Check Image header */
> +	h = (struct riscv_image_header *)kernel;
> +	if (!h->image_size) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* Check endianness */
> +	flags = le64_to_cpu(h->flags);
> +	be_image = riscv_image_flag_field(flags, RISCV_IMAGE_FLAG_BE);

..but here you're just testing a single bit, so since be_image is a bool it
could just be
	be_image = flags & RISCV_IMAGE_FLAG_BE_MASK;

/Emil

> +	be_kernel = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
> +	if (be_image != be_kernel) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	/* Load the kernel image */
> +	kbuf.image = image;
> +	kbuf.buf_min = 0;
> +	kbuf.buf_max = ULONG_MAX;
> +	kbuf.top_down = false;
> +
> +	kbuf.buffer = kernel;
> +	kbuf.bufsz = kernel_len;
> +	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
> +	kbuf.memsz = le64_to_cpu(h->image_size);
> +	kbuf.buf_align = le64_to_cpu(h->text_offset);
> +
> +	ret = kexec_add_buffer(&kbuf);
> +	if (ret) {
> +		pr_err("Error add kernel image ret=%d\n", ret);
> +		goto out;
> +	}
> +
> +	image->start = kbuf.mem;
> +
> +	pr_info("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
> +				kbuf.mem, kbuf.bufsz, kbuf.memsz);
> +
> +	ret = load_extra_segments(image, kbuf.mem, kbuf.memsz,
> +				  initrd, initrd_len, cmdline, cmdline_len);
> +
> +out:
> +	return ret ? ERR_PTR(ret) : NULL;
> +}
> +
> +const struct kexec_file_ops image_kexec_ops = {
> +	.probe = image_probe,
> +	.load = image_load,
> +};
> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
> index aedb8c16a283..5dc700834f1e 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -17,6 +17,7 @@
>
>  const struct kexec_file_ops * const kexec_file_loaders[] = {
>  	&elf_kexec_ops,
> +	&image_kexec_ops,
>  	NULL
>  };
>
> --
> 2.20.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
