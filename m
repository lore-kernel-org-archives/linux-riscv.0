Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F74CC61DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 22:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLi3GP2kCAaVdeFDjxLRZ90GCUBHB9dWQ6AguVGtiS0=; b=3cft9vdWM6sESZ
	RQE8bX4bvJNdD+dBBmq8zQzhgNlTkwoyIMtRaZ9H74RwCQm9Xy/EhZQUn52Vk4pFj9JYVGvKUf1uG
	UpZri33UA1o7xx1WZSwpumwjJatoDploI1f5sGxXeUkaJclY4rWSjQYSuFwfW5e/UKi8zM0UOH3jX
	+LSr4jOKAN74qGFRkax+Awx2ZvNkb7pC6rXAy+CDLXdBpu7KQG/L2bGKsRWeTphgXRDMKbVP9wbdA
	BsNG7BKZ1D1Y69JmFefQL9iOmgKHSGedcBFXYHtO/xagCSX7gFMxu/GJCQhetuyjO4nokdGA2Q1x0
	OKNhd5z9pTXhtwccykBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG6Ds-00HP2K-Qh; Thu, 12 Jan 2023 22:39:00 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG6Dp-00HP1j-B6
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 22:38:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id k8so5002341wrc.9
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 14:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYOgRxVnVO9WiL8/xIYxULkQkHyZrlvgyKSvkvkG3+8=;
        b=MQbYuzhLsQu6MkS1jzHazC1VCHcVKtONrzMZyNtvDwHUObhi0tHazvoEfjn8/FwwSI
         OGID1S9c9sKgft0fh2n8uWZ84at5FnSaJqtbL85b1PnsUt/z4X0A6QevA3wNOyYX8gMl
         eGpPUq0ZuKa1GkZj5r0SsQk02t6XrbDdF67Y4/yMq+ef/NeAp9dJa5/ENEOgaX+Z9FCz
         MSTY+Kuqamhg/evlAX5ag+5lZe8PMz7ab87qpREAI758WC9CewvI+gW+H9DjVGAXA8pA
         x2L5dDJbPewhN+qyApGh1WKhMmohmT0Dbv5CN7ZE/yvWkJZ/rlKl1GvFTDTGXCknEg3O
         8vww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYOgRxVnVO9WiL8/xIYxULkQkHyZrlvgyKSvkvkG3+8=;
        b=QRCOSoMI+0BxWTbwzVGejTCxVvzrHbxr/K1iCUqAZcP4IwvIwEJ3Cqg1ZEugvJeIN/
         KSSa6nazd5fiOhwlX6yEeNJfjbfij07+JFUJLMi3lBXwdC1BTEMWlU1pBfVuicwpu3ol
         F8ia29WdpW/BafW+IOaGwXffcuuQ0Dw0YMj1NdJOgARjSbNhxNgGzQnACEINJutYz3Q7
         5WKEfEcxQoozIUXnSiuLByV0Qj6FnnRs5zmecluKYGvNDoINWruPgRuZkM52g/wp9TQO
         xTZ0elbgBS5RRDPH0MEi2AGTJbslR734mHi5LtM2MoLDkeIi2geglC6838+DK0ORy2IW
         wVBg==
X-Gm-Message-State: AFqh2kr57si+kFJC5K8yDh/UKYM6uNVhQiIJPmVHa9b+uqYCYo+63UEh
	3Sx3WZKzAEVQ5DymJvyWqRk8Og==
X-Google-Smtp-Source: AMrXdXsmISdu3qNJHjekfd3ZBDYw5rdWELoEhuuAzbzZiZuJI2p1mOfmiRfTWsVauytHmKnxrurYkw==
X-Received: by 2002:a05:6000:384:b0:297:175c:3cbd with SMTP id u4-20020a056000038400b00297175c3cbdmr36440247wrf.66.1673563133985;
        Thu, 12 Jan 2023 14:38:53 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id bw28-20020a0560001f9c00b002421888a011sm17124456wrb.69.2023.01.12.14.38.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Jan 2023 14:38:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2] riscv: elf: add .riscv.attributes parsing
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230112210622.2337254-1-vineetg@rivosinc.com>
Date: Thu, 12 Jan 2023 22:38:52 +0000
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux@rivosinc.com
Message-Id: <D6A37757-DB22-44C6-A906-D68A0B8BD7A6@jrtc27.com>
References: <20230112210622.2337254-1-vineetg@rivosinc.com>
To: Vineet Gupta <vineetg@rivosinc.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_143857_493617_9AA61AC1 
X-CRM114-Status: GOOD (  34.90  )
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

On 12 Jan 2023, at 21:06, Vineet Gupta <vineetg@rivosinc.com> wrote:
> 
> This implements the elf loader hook to parse RV specific
> .riscv.attributes section. This section is inserted by compilers
> (gcc/llvm) with build related information such as -march organized as
> tag/value attribute pairs.
> 
> It identifies the various attribute tags (and corresponding values) as
> currently specified in the psABI specification.
> 
> This patch only implements the elf parsing mechanics, leaving out the
> recording/usage of the attributes to subsequent patches.
> 
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> ---
> Changes since v1 [1]
>  - Handling potential oob accesses due to against malformed elf contents
>  - Handling of multiple sub-subsections
> 
> [1]https://lore.kernel.org/linux-riscv/20230110201841.2069353-1-vineetg@rivosinc.com
> 
> Given the current state of discussions, the intended Vector extension
> support would likely not need it, still posting the reworked v2 for
> logical conclusion and for posterity in case need comes up in future
> for something like CFI elf annotation.
> Maintainers/reviewers can decide whether to merge it.
> ---
> arch/riscv/Kconfig           |   1 +
> arch/riscv/include/asm/elf.h |  11 ++
> arch/riscv/kernel/Makefile   |   1 +
> arch/riscv/kernel/elf-attr.c | 232 +++++++++++++++++++++++++++++++++++
> 4 files changed, 245 insertions(+)
> create mode 100644 arch/riscv/kernel/elf-attr.c
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..f7e0ab05a2d2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -12,6 +12,7 @@ config 32BIT
> 
> config RISCV
> 	def_bool y
> +	select ARCH_BINFMT_ELF_STATE
> 	select ARCH_CLOCKSOURCE_INIT
> 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
> 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index e7acffdf21d2..7ab8bd0ec330 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -116,6 +116,17 @@ do {							\
> 		*(struct user_regs_struct *)regs;	\
> } while (0);
> 
> +struct arch_elf_state {
> +};
> +
> +#define INIT_ARCH_ELF_STATE {}
> +
> +extern int arch_elf_pt_proc(void *ehdr, void *phdr, struct file *elf,
> +			    bool is_interp, struct arch_elf_state *state);
> +
> +extern int arch_check_elf(void *ehdr, bool has_interpreter, void *interp_ehdr,
> +			  struct arch_elf_state *state);
> +
> #ifdef CONFIG_COMPAT
> 
> #define SET_PERSONALITY(ex)					\
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 4cf303a779ab..eff6d845ac9d 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -50,6 +50,7 @@ obj-y	+= riscv_ksyms.o
> obj-y	+= stacktrace.o
> obj-y	+= cacheinfo.o
> obj-y	+= patch.o
> +obj-y	+= elf-attr.o
> obj-y	+= probes/
> obj-$(CONFIG_MMU) += vdso.o vdso/
> 
> diff --git a/arch/riscv/kernel/elf-attr.c b/arch/riscv/kernel/elf-attr.c
> new file mode 100644
> index 000000000000..51bcee92dd5b
> --- /dev/null
> +++ b/arch/riscv/kernel/elf-attr.c
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +
> +#include <linux/binfmts.h>
> +#include <linux/elf.h>
> +#include <asm/unaligned.h>
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt) "rv-elf-attr: " fmt
> +
> +#define PT_RISCV_ATTRIBUTES		0x70000003
> +
> +#define RV_ATTR_TAG_file		1
> +
> +#define RV_ATTR_TAG_stack_align		4
> +#define RV_ATTR_TAG_arch		5
> +#define RV_ATTR_TAG_unaligned_access	6
> +
> +#define RV_ATTR_VENDOR_RISCV		"riscv"
> +
> +#define RV_ATTR_SEC_SZ			SZ_1K
> +
> +static void rv_elf_attr_int(u32 tag, u32 val)
> +{
> +	pr_debug("Tag %x=%d\n", tag, val);
> +}
> +
> +static void rv_elf_attr_str(u32 tag, const unsigned char *str)
> +{
> +	pr_debug("Tag %x=[%s]\n", tag, str);
> +}
> +
> +/*
> + * Decode a ule128 encoded value.
> + */
> +static int
> +decode_uleb128_safe(unsigned char **dpp, u32 *val, const unsigned char *p_end)
> +{
> +	unsigned char *bp = *dpp;
> +	unsigned char byte;
> +	unsigned int shift = 0;
> +	u32 result = 0;
> +	int ok = 0;
> +
> +	while (bp < p_end) {
> +		byte = *bp++;
> +		result |= (byte & 0x7f) << shift;
> +		if ((byte & 0x80) == 0) {
> +			ok = 1;
> +			break;

Why not just do the return here?

> +		}
> +		shift += 7;
> +	}
> +	if (!ok)
> +		return -1;
> +	*dpp = bp;
> +	*val = result;
> +	return 0;
> +}
> +
> +/*
> + * Parse a single elf attribute.
> + */
> +static int rv_parse_elf_attr_safe(unsigned char **dpp, unsigned char *p_end)
> +{
> +	unsigned char *p = *dpp;
> +	unsigned char *str;
> +	u32 tag, val, s_len;
> +
> +	if (decode_uleb128_safe(&p, &tag, p_end))
> +		goto bad_attr;
> +
> +	switch (tag) {
> +	case RV_ATTR_TAG_stack_align:
> +		if (decode_uleb128_safe(&p, &val, p_end))
> +			goto bad_attr;
> +		rv_elf_attr_int(tag, val);
> +		break;
> +
> +	case RV_ATTR_TAG_unaligned_access:
> +		if (decode_uleb128_safe(&p, &val, p_end))
> +			goto bad_attr;
> +		rv_elf_attr_int(tag, val);
> +		break;
> +
> +	case RV_ATTR_TAG_arch:
> +		str = p;
> +		s_len = strnlen(p, p_end - p) + 1;
> +		p += s_len;
> +		if (p > p_end)

Constructing such a p is UB, check s_len before instead.

> +			goto bad_attr;
> +		rv_elf_attr_str(tag, str);
> +		break;
> +
> +	default:
> +		if (decode_uleb128_safe(&p, &val, p_end))

From the ratified spec:

  "RISC-V attributes have a string value if the tag number is odd and an integer value if the tag number is even."

> +			goto bad_attr;
> +		pr_debug("skipping Unrecognized Tag [%u]=%u\n", tag, val);
> +		break;
> +	}
> +
> +	*dpp = p;
> +	return 0;
> +bad_attr:
> +	return -ENOEXEC;
> +}
> +
> +/*
> + * Parse .riscv.attributes elf section.
> + */
> +static int rv_parse_elf_attributes(struct file *f, const struct elf_phdr *phdr,
> +				   struct arch_elf_state *state)
> +{
> +	unsigned char buf[RV_ATTR_SEC_SZ];
> +	unsigned char *p, *p_end;
> +	ssize_t n;
> +	int ret = 0;
> +	loff_t pos;
> +
> +	pr_debug("Section .riscv.attributes found\n");
> +
> +	/* Assume a reasonable size for now */
> +	if (phdr->p_filesz > sizeof(buf))
> +		goto bad_elf;
> +
> +	memset(buf, 0, RV_ATTR_SEC_SZ);

This will hide bugs from sanitisers...

> +	pos = phdr->p_offset;
> +	n = kernel_read(f, &buf, phdr->p_filesz, &pos);
> +
> +	if (n < 0)
> +		return -EIO;
> +
> +	p = buf;
> +	p_end = p + n;
> +
> +	/* sanity check format-version */
> +	if (*p++ != 'A')

What if n is 0?

> +		goto bad_elf;
> +
> +	/*
> +	 * elf attribute section organized as Vendor sub-sections(s)
> +	 *   {sub-section length, vendor name, vendor data}
> +	 * Vendor data organized as sub-subsection(s)
> +	 *   {tag, sub-subsection length, attributes contents}
> +	 * Attribute contents organized as
> +	 *   {tag, value} pair(s).
> +	 */
> +	while ((p_end - p) >= 4) {
> +		int sub_len, vname_len;

u32?

> +
> +		sub_len = get_unaligned_le32(p);
> +		if (sub_len <= 4 || sub_len > n)

n is the total amount read in, not the remaining amount.

> +			goto bad_elf;
> +
> +		p += 4;
> +		sub_len -= 4;
> +
> +		/* Vendor name string */
> +		vname_len = strnlen(p, sub_len) + 1;
> +		if (vname_len > sub_len)
> +			goto bad_elf;
> +
> +		/* skip non-mandatory sub-section for now */
> +		if (strncmp(p, RV_ATTR_VENDOR_RISCV, sub_len)) {
> +			p += sub_len;
> +			continue;
> +		}
> +
> +		p += vname_len;
> +		sub_len -= vname_len;
> +
> +		/* Vendor data: sub-subsections(s) */
> +		while (sub_len > 0) {
> +			u32 tag, content_len;
> +			unsigned char *sub_end, *sub_start = p;

Confusing naming for sub-subsection variables.

> +
> +			if (decode_uleb128_safe(&p, &tag, p_end))
> +				goto bad_elf;
> +
> +			if ((p_end - p) < 4)
> +				goto bad_elf;
> +
> +			content_len = get_unaligned_le32(p);
> +			if (content_len > sub_len)
> +				goto bad_elf;
> +
> +			p += 4;
> +			sub_len -= content_len;
> +			sub_end = sub_start + content_len;
> +
> +			/* For now handle attributes relating to whole file */
> +			if (tag != RV_ATTR_TAG_file) {
> +				p = sub_end;
> +				continue;
> +			}
> +
> +			/* Attribute(s): tag:value pairs */
> +			while (p < sub_end) {
> +				ret = rv_parse_elf_attr_safe(&p, p_end);
> +				if (ret)
> +					goto bad_elf;
> +			}
> +		}
> +	}
> +
> +	return ret;
> +bad_elf:
> +	return -ENOEXEC;
> +}
> +
> +/*
> + * Hook invoked by generic elf loader to parse riscv specific elf segments.
> + */
> +int arch_elf_pt_proc(void *_ehdr, void *_phdr, struct file *elf,
> +		     bool is_interp, struct arch_elf_state *state)
> +{
> +	struct elf_phdr *phdr = _phdr;
> +	int ret = 0;
> +
> +	if (phdr->p_type == PT_RISCV_ATTRIBUTES && !is_interp)
> +		ret = rv_parse_elf_attributes(elf, phdr, state);
> +
> +	return ret;
> +}
> +
> +int arch_check_elf(void *_ehdr, bool has_interpreter, void *_interp_ehdr,
> +		   struct arch_elf_state *state)
> +{
> +	return 0;
> +}
> -- 
> 2.34.1
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
