Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB60D65C54
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 07:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2G3P0RhFimgRYh0OruxNYhJvpROwx8/Fo7kvC65F5M=; b=vt57KY5qKEIaBa
	DIa3sHTE0Ai2pBh1yTm4KeqHroyLt966dgq89oMqsOrMkoNXASFDOa256CUAqPq0EuxO5J3yIJPMR
	2PgdObGuEyEAy6YUNh31yQl3vDJlqcFtdb3xxfdwvXtb3VlHWnix8ndTVkMyTolsK4Te4Cb6IT0go
	uAWn0kKVDT/CW0nYNDFLgMZir61quJkoVSXUv7oobz/uI4ctnCfKQZ4zte8xyuVhk+D8TxmVTd6KH
	RP1IDFNeRRdPgy+ln5fhMOyNSGKW2jKQ6gEKv9SjOL1qNVurBGiIrK/+W/QIcEJWLfnINpkcRRJDs
	zThHL8475pwsii51Ubqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBU2A-000000093e4-3Fwx;
	Thu, 14 Nov 2024 07:12:54 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBTv9-00000009213-2Wj0
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 07:05:42 +0000
Received: from mail-ed1-f44.google.com (unknown [209.85.208.44])
	by APP-05 (Coremail) with SMTP id zQCowABXXX03oTVnfshrAg--.237S2;
	Thu, 14 Nov 2024 15:05:29 +0800 (CST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so400110a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 23:05:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZ1MotCSUWKttGT2Dcx0/C9nJhM4Uu2WiUqywZzPHzIKG88DGY3gD1eyPQD8RPQvbBW9GYS0lTv7b2zA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxV51nVeNuVz1Lc6zl+AKdt6xxkIiOmQANDsHjP3LGy3i5FLWQ
	+PQZwnq3c8utGGS+Nlck4OC9AGC4DjahT7DGUGefxgaqxEqeTL20yPgNlHPHr8eWUaWywbpPebU
	mZcoggfpujU+m4UNuwYc+gBqA4Ig=
X-Google-Smtp-Source: AGHT+IFwPozQFCOODafSvUsMBgiiIWegzjsXs0qgVHGEk/lqLIyW2PeQERbppFlGIPxakonLbxUx10yCJ5bKFA0g5SI=
X-Received: by 2002:a05:6402:2105:b0:5cf:466f:d2c1 with SMTP id
 4fb4d7f45d1cf-5cf77e86416mr847420a12.6.1731567926593; Wed, 13 Nov 2024
 23:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20241113104036.254491-1-zhihang.shao.iscas@gmail.com> <20241113104036.254491-3-zhihang.shao.iscas@gmail.com>
In-Reply-To: <20241113104036.254491-3-zhihang.shao.iscas@gmail.com>
From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Date: Thu, 14 Nov 2024 15:04:49 +0800
X-Gmail-Original-Message-ID: <CAOsKWHCK-W72sx94WnVTeAm7mbG2XAgqD9LiLdRDNEfJQ-Ex=w@mail.gmail.com>
Message-ID: <CAOsKWHCK-W72sx94WnVTeAm7mbG2XAgqD9LiLdRDNEfJQ-Ex=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Optimize crct10dif with zbc extension
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org, 
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CM-TRANSID: zQCowABXXX03oTVnfshrAg--.237S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gw13tw4DZFyDtF1fCFy7trb_yoW3Cr47pF
	Wqkrs7KFWUXa47WrWxXr9xXrn8Cw4I9F43Xry7Wa4UJFsrAr40qFZ2ka4vvw48JF4kZrZ2
	9rZ5CrZxCw4DJ37anT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvE
	ncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK6IIF6r4xMxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU
	kh05DUUUU
X-Originating-IP: [209.85.208.44]
X-CM-SenderInfo: x2kd0wxfkx051dq6x2xfdvhtffof0/1tbiDAcBB2c1iyVKRwACs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_230540_043991_00A81890 
X-CRM114-Status: GOOD (  28.87  )
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
Reply-To: zhangchunyan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Nov 2024 at 19:06, Zhihang Shao <zhihang.shao.iscas@gmail.com> wrote:
>
> The current CRC-T10DIF algorithm is based on table-lookup optimization.
> Given the previous work on optimizing crc32 calculations with zbc
> extension, it is believed that this will be equally effective for
> accelerating crc-t10dif.
> Therefore, this patch offers a implementation of crc-t10dif using zbc
> extension. This can detect whether the current runtime environment
> supports zbc feature and, if so, uses it to accelerate crc-t10dif
> calculations.
>
> This patch is tested on QEMU VM with the kernel CRC-T10DIF selftests.
>
> Signed-off-by: Zhihang Shao <zhihang.shao.iscas@gmail.com>
> ---
>  arch/riscv/crypto/Kconfig               |  14 ++
>  arch/riscv/crypto/Makefile              |   4 +
>  arch/riscv/crypto/crct10dif-riscv-zbc.c | 182 ++++++++++++++++++++++++
>  lib/crct10diftest.c                     |   4 +-
>  4 files changed, 202 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/crypto/crct10dif-riscv-zbc.c
>
> diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
> index ad58dad9a580..69751ff5573e 100644
> --- a/arch/riscv/crypto/Kconfig
> +++ b/arch/riscv/crypto/Kconfig
> @@ -29,6 +29,20 @@ config CRYPTO_CHACHA_RISCV64
>           Architecture: riscv64 using:
>           - Zvkb vector crypto extension
>
> +config CRYPTO_CRCT10DIF_RISCV
> +       tristate "Checksum: CRCT10DIF"
> +       depends on TOOLCHAIN_HAS_ZBC
> +       depends on MMU
> +       depends on RISCV_ALTERNATIVE
> +       default y
> +       help
> +         CRCT10DIF checksum with Zbc extension optimized
> +        To accelerate CRCT10DIF checksum, choose Y here.

This line should be aligned with two characters.

> +
> +         Architecture: riscv using:
> +          - Zbc extension

Same here.

> +
> +

More than one redundant empty line should be removed.

>  config CRYPTO_GHASH_RISCV64
>         tristate "Hash functions: GHASH"
>         depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
> index 247c7bc7288c..6f849f4dc4cc 100644
> --- a/arch/riscv/crypto/Makefile
> +++ b/arch/riscv/crypto/Makefile
> @@ -7,6 +7,9 @@ aes-riscv64-y := aes-riscv64-glue.o aes-riscv64-zvkned.o \
>  obj-$(CONFIG_CRYPTO_CHACHA_RISCV64) += chacha-riscv64.o
>  chacha-riscv64-y := chacha-riscv64-glue.o chacha-riscv64-zvkb.o
>
> +obj-$(CONFIG_CRYPTO_CRCT10DIF_RISCV) += crct10dif-riscv.o
> +crct10dif-riscv-y := crct10dif-riscv-zbc.o
> +
>  obj-$(CONFIG_CRYPTO_GHASH_RISCV64) += ghash-riscv64.o
>  ghash-riscv64-y := ghash-riscv64-glue.o ghash-riscv64-zvkg.o
>
> @@ -21,3 +24,4 @@ sm3-riscv64-y := sm3-riscv64-glue.o sm3-riscv64-zvksh-zvkb.o
>
>  obj-$(CONFIG_CRYPTO_SM4_RISCV64) += sm4-riscv64.o
>  sm4-riscv64-y := sm4-riscv64-glue.o sm4-riscv64-zvksed-zvkb.o
> +
> diff --git a/arch/riscv/crypto/crct10dif-riscv-zbc.c b/arch/riscv/crypto/crct10dif-riscv-zbc.c
> new file mode 100644
> index 000000000000..01571b4286f1
> --- /dev/null
> +++ b/arch/riscv/crypto/crct10dif-riscv-zbc.c
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Accelerated CRC-T10DIF implementation with RISC-V Zbc extension.
> + *
> + * Copyright (C) 2024 Institute of Software, CAS.
> + */
> +
> +#include <asm/alternative-macros.h>
> +#include <asm/byteorder.h>
> +#include <asm/hwcap.h>
> +
> +#include <crypto/internal/hash.h>
> +
> +#include <linux/byteorder/generic.h>
> +#include <linux/crc-t10dif.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +
> +static u16 crc_t10dif_generic_zbc(u16 crc, unsigned char const *p, size_t len);
> +
> +#define CRCT10DIF_POLY 0x8bb7
> +
> +#if __riscv_xlen == 64
> +#define STEP_ORDER 3
> +
> +#define CRCT10DIF_POLY_QT_BE 0xf65a57f81d33a48a
> +
> +static inline u64 crct10dif_prep(u16 crc, unsigned long const *ptr)
> +{
> +       return ((u64)crc << 48) ^ (__force u64)__cpu_to_be64(*ptr);
> +}
> +
> +#elif __riscv_xlen == 32
> +#define STEP_ORDER 2
> +#define CRCT10DIF_POLY_QT_BE 0xf65a57f8
> +
> +static inline u32 crct10dif_prep(u16 crc, unsigned long const *ptr)
> +{
> +       return ((u32)crc << 16) ^ (__force u32)__cpu_to_be32(*ptr);
> +}
> +
> +#else
> +#error "Unexpected __riscv_xlen"
> +#endif
> +
> +static inline u16 crct10dif_zbc(unsigned long s)
> +{
> +       u16 crc;
> +
> +       asm volatile   (".option push\n"
> +                       ".option arch,+zbc\n"
> +                       "clmulh %0, %1, %2\n"
> +                       "xor    %0, %0, %1\n"
> +                       "clmul  %0, %0, %3\n"
> +                       ".option pop\n"
> +                       : "=&r" (crc)
> +                       : "r"(s),
> +                         "r"(CRCT10DIF_POLY_QT_BE),
> +                         "r"(CRCT10DIF_POLY)
> +                       :);
> +
> +       return crc;
> +}
> +
> +#define STEP (1 << STEP_ORDER)
> +#define OFFSET_MASK (STEP - 1)
> +
> +static inline u16 crct10dif_unaligned(u16 crc, unsigned char const *p, size_t len)
> +{
> +       size_t bits = len * 8;
> +       unsigned long s = 0;
> +       u16 crc_low = 0;
> +
> +       for (int i = 0; i < len; i++)
> +               s = *p++ | (s << 8);
> +
> +       if (len < sizeof(u16)) {
> +               s ^= crc >> (16 - bits);
> +               crc_low = crc << bits;
> +       } else {
> +               s ^= (unsigned long)crc << (bits - 16);
> +       }
> +
> +       crc = crct10dif_zbc(s);
> +       crc ^= crc_low;
> +
> +       return crc;
> +}
> +
> +static u16 crc_t10dif_generic_zbc(u16 crc, unsigned char const *p, size_t len)
> +{
> +       size_t offset, head_len, tail_len;
> +       unsigned long const *p_ul;
> +       unsigned long s;
> +
> +       offset = (unsigned long)p & OFFSET_MASK;
> +       if (offset && len) {
> +               head_len = min(STEP - offset, len);
> +               crc = crct10dif_unaligned(crc, p, head_len);
> +               p += head_len;
> +               len -= head_len;
> +       }
> +
> +       tail_len = len & OFFSET_MASK;
> +       len = len >> STEP_ORDER;
> +       p_ul = (unsigned long const *)p;
> +
> +       for (int i = 0; i < len; i++) {
> +               s = crct10dif_prep(crc, p_ul);
> +               crc = crct10dif_zbc(s);
> +               p_ul++;
> +       }
> +
> +       p = (unsigned char const *)p_ul;
> +       if (tail_len)
> +               crc = crct10dif_unaligned(crc, p, tail_len);
> +
> +       return crc;
> +}
> +
> +static int crc_t10dif_init(struct shash_desc *desc)
> +{
> +       u16 *crc = shash_desc_ctx(desc);
> +
> +       *crc = 0;
> +
> +       return 0;
> +}
> +
> +static int crc_t10dif_final(struct shash_desc *desc, u8 *out)
> +{
> +       u16 *crc = shash_desc_ctx(desc);
> +
> +       *(u16 *)out = *crc;
> +
> +       return 0;
> +}
> +
> +static int crc_t10dif_update_zbc(struct shash_desc *desc, const u8 *data,
> +                               unsigned int length)
> +{
> +       u16 *crc = shash_desc_ctx(desc);
> +
> +       *crc = crc_t10dif_generic_zbc(*crc, data, length);
> +
> +       return 0;
> +}
> +
> +static struct shash_alg crc_t10dif_alg = {
> +       .digestsize             = CRC_T10DIF_DIGEST_SIZE,
> +       .init                   = crc_t10dif_init,
> +       .update                 = crc_t10dif_update_zbc,
> +       .final                  = crc_t10dif_final,
> +       .descsize               = CRC_T10DIF_DIGEST_SIZE,
> +
> +       .base.cra_name          = "crct10dif",
> +       .base.cra_driver_name   = "crct10dif-riscv-zbc",
> +       .base.cra_priority      = 150,
> +       .base.cra_blocksize     = CRC_T10DIF_BLOCK_SIZE,
> +       .base.cra_module        = THIS_MODULE,
> +};
> +
> +static int __init crc_t10dif_mod_init(void)
> +{
> +       if (riscv_isa_extension_available(NULL, ZBC))
> +               return crypto_register_shash(&crc_t10dif_alg);
> +
> +       return -ENODEV;
> +}
> +
> +static void __exit crc_t10dif_mod_exit(void)
> +{
> +       crypto_unregister_shash(&crc_t10dif_alg);
> +}
> +
> +module_init(crc_t10dif_mod_init);
> +module_exit(crc_t10dif_mod_exit);
> +
> +MODULE_DESCRIPTION("CRC-T10DIF using RISC-V ZBC Extension");
> +MODULE_ALIAS_CRYPTO("crct10dif");
> +MODULE_LICENSE("GPL");
> diff --git a/lib/crct10diftest.c b/lib/crct10diftest.c
> index 9541892eb12c..ac642191e6e8 100644
> --- a/lib/crct10diftest.c
> +++ b/lib/crct10diftest.c
> @@ -666,9 +666,9 @@ static int __init crct10dif_test_init(void)
>
>         local_irq_restore(flags);
>
> -       if (errors)
> +       if (errors)

This change should be removed from this patch.

>                 pr_warn("crct10dif: %d self tests failed\n", errors);
> -       else
> +       else

Same here.

>                 pr_info("crct10dif: self tests passed, processed %d bytes in %lld nsec\n",
>                 bytes, nsec);
>
> --
> 2.34.1
>
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
