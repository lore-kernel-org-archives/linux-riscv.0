Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C90C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 14:04:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 557F9611F1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 14:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 557F9611F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NedIl2UuP8lGJlr3yWKcHIVXG6AAXZXTA61JpcdxZRs=; b=qAr/OpNX6A36SbHUq3ApFtlQk
	QzpqD+PNQey30aX3KxLyxyQLizqf5aolw69fi8F+x4hx4oabx9TLaVRia1WasAHuQq74SYGT7Qa9A
	fmDRrhGy8XILC0af2LrWLONK/IA4J6DZdmwtz6PmrqWOZlcGhxZnJqrIc9VDAvzeWIe28ESSBpf6K
	/6E+ECb8S6AVRYz6QXZM5/ZYYQLE1SpRAECoMSx/OszucF4cj9YheOrfhILaiUEeaTC52Y9KpFqIl
	lTibXIShQPA5gmFj40IKeDUfIsSMzP6Np5avKzlgYGe19iZkMlF8+0CdvFvwzdBoNxLeB58mIOQqO
	oPF2vOE5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX2be-00GNAF-Gf; Thu, 15 Apr 2021 14:04:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX2bZ-00GN7k-DH
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 14:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=kuRDozf3WQKUEF+qhJ44HCCb1jtN9SZWxpKpBPaaFAk=; b=t/AJzh11zk3OJ/U+qENcIEVso0
 by8ImrDIM0mzp1DFFyRD7SsBslvr5CBNb/mbPNPK6p8nSOjZTDpRDjC9n1uz2V1cTFG8qfL5U+yB/
 8CF8ZcfHqq8HMJwMhyacTqcJDz5nySKW5Rptvwv7huApeqpGmPFtUqJtO1tDNFVLJSq2CNM7/viQJ
 1REDsz4GnapwJjt5mIoC1RV6Lyx0tsufYyX1ziAS3ZENHK58x6uF2taPIWgp3ExJ/GspBh6E3ud5c
 rrlGB870vFe1YHv8LTYyBVtv2qc3fDddzKn122pfcUWAmOdS9er5Zj2lrukr6WKyPk2Zdfq0Itw8k
 Zo1FJwTw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX2bV-008dOE-1D
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 14:04:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0523461222;
 Thu, 15 Apr 2021 14:04:17 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] binfmt_flat: allow not offsetting data start
To: Damien Le Moal <damien.lemoal@wdc.com>, uclinux-dev@uclinux.org,
 ugerg@linux-m68k.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-kernel@vger.kernel.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Christoph Hellwig <hch@lst.de>
References: <20210415061502.7248-1-damien.lemoal@wdc.com>
 <20210415061502.7248-2-damien.lemoal@wdc.com>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <8ff801ad-6e17-fdd2-6186-5443540947a9@linux-m68k.org>
Date: Fri, 16 Apr 2021 00:04:15 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415061502.7248-2-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_070421_148242_66176E92 
X-CRM114-Status: GOOD (  31.07  )
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

Hi Damien,

On 15/4/21 4:15 pm, Damien Le Moal wrote:
> Commit 2217b9826246 ("binfmt_flat: revert "binfmt_flat: don't offset
> the data start"") restored offsetting the start of the data section by
> a number of words defined by MAX_SHARED_LIBS. As a result, since
> MAX_SHARED_LIBS is never 0, a gap between the text and data sections
> always exists. For architectures which cannot support a such gap
> between the text and data sections (e.g. riscv nommu), flat binary
> programs cannot be executed.
> 
> To allow an architecture to request contiguous text and data sections,
> introduce the config option CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP.
> Using this new option, the macro DATA_GAP_WORDS is conditionally
> defined in binfmt_flat.c to MAX_SHARED_LIBS for architectures
> tolerating the text-to-data gap (CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP
> disabled case) and to 0 when CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP is
> enabled. DATA_GAP_WORDS is used in load_flat_file() to calculate the
> data section length and start position.
> 
> An architecture enabling CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP also
> prevents the use of the separate text/data load case (when the flat file
> header flags FLAT_FLAG_RAM and FLAT_FLAG_GZIP are not set with NOMMU
> kernels) and forces the use of a single RAM region for loading
> (equivalent to FLAT_FLAG_RAM being set).

So is it the case that a flat format file on RISC-V will never have
relocations?


> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>   fs/Kconfig.binfmt |  3 +++
>   fs/binfmt_flat.c  | 21 +++++++++++++++------
>   2 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
> index c6f1c8c1934e..c6df931d5d45 100644
> --- a/fs/Kconfig.binfmt
> +++ b/fs/Kconfig.binfmt
> @@ -112,6 +112,9 @@ config BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>   config BINFMT_FLAT_OLD_ALWAYS_RAM
>   	bool
>   
> +config BINFMT_FLAT_NO_TEXT_DATA_GAP
> +	bool
> +
>   config BINFMT_FLAT_OLD
>   	bool "Enable support for very old legacy flat binaries"
>   	depends on BINFMT_FLAT
> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
> index b9c658e0548e..2be29bb964b8 100644
> --- a/fs/binfmt_flat.c
> +++ b/fs/binfmt_flat.c
> @@ -74,6 +74,12 @@
>   #define	MAX_SHARED_LIBS			(1)
>   #endif
>   
> +#ifdef CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP
> +#define DATA_GAP_WORDS			(0)
> +#else
> +#define DATA_GAP_WORDS			(MAX_SHARED_LIBS)
> +#endif
> +>   struct lib_info {
>   	struct {
>   		unsigned long start_code;		/* Start of text segment */
> @@ -559,7 +565,10 @@ static int load_flat_file(struct linux_binprm *bprm,
>   	 * case,  and then the fully copied to RAM case which lumps
>   	 * it all together.
>   	 */
> -	if (!IS_ENABLED(CONFIG_MMU) && !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
> +	if (!IS_ENABLED(CONFIG_MMU) &&
> +	    !IS_ENABLED(CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP) &&

If RISC-V flat format files must always be loaded to RAM then why don't
they set the FLAT_FLAG_RAM when compiled/generated?

Regards
Greg


> +	    !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
> +
>   		/*
>   		 * this should give us a ROM ptr,  but if it doesn't we don't
>   		 * really care
> @@ -576,7 +585,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>   			goto err;
>   		}
>   
> -		len = data_len + extra + MAX_SHARED_LIBS * sizeof(unsigned long);
> +		len = data_len + extra + DATA_GAP_WORDS * sizeof(unsigned long);
>   		len = PAGE_ALIGN(len);
>   		realdatastart = vm_mmap(NULL, 0, len,
>   			PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE, 0);
> @@ -591,7 +600,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>   			goto err;
>   		}
>   		datapos = ALIGN(realdatastart +
> -				MAX_SHARED_LIBS * sizeof(unsigned long),
> +				DATA_GAP_WORDS * sizeof(unsigned long),
>   				FLAT_DATA_ALIGN);
>   
>   		pr_debug("Allocated data+bss+stack (%u bytes): %lx\n",
> @@ -622,7 +631,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>   		memp_size = len;
>   	} else {
>   
> -		len = text_len + data_len + extra + MAX_SHARED_LIBS * sizeof(u32);
> +		len = text_len + data_len + extra + DATA_GAP_WORDS * sizeof(u32);
>   		len = PAGE_ALIGN(len);
>   		textpos = vm_mmap(NULL, 0, len,
>   			PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, 0);
> @@ -638,7 +647,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>   
>   		realdatastart = textpos + ntohl(hdr->data_start);
>   		datapos = ALIGN(realdatastart +
> -				MAX_SHARED_LIBS * sizeof(u32),
> +				DATA_GAP_WORDS * sizeof(u32),
>   				FLAT_DATA_ALIGN);
>   
>   		reloc = (__be32 __user *)
> @@ -714,7 +723,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>   			ret = result;
>   			pr_err("Unable to read code+data+bss, errno %d\n", ret);
>   			vm_munmap(textpos, text_len + data_len + extra +
> -				MAX_SHARED_LIBS * sizeof(u32));
> +				  DATA_GAP_WORDS * sizeof(u32));
>   			goto err;
>   		}
>   	}
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
