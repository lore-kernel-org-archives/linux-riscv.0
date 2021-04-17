Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2263FC433B4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 04:52:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67D4D60FE8
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 04:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67D4D60FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CewPI8k32AWvAMAcnjx65JRwVlCB3ydCbEHeRS3HYQ0=; b=BvCjRvmm0vSncIexHeC9Ra/Dw
	4tF3due13Kt+G0ycswhrWaU1bOXqGVDr2Z233Lhxl52tpwwQpAijZD1qx3CNsNT8xvO5ZU842llEX
	whjWswfkGutOeSPqhC1WEUFiTpRK9oxwIBVT7rdEspLxbPUv3AZyzerxT3WqKMyDgikD/XmnCnpV5
	EoeEPoRPJCu+s9Gu4BJkIMbYbLHvNF5tIEp5KrPcFyXN6DanwQo7nIuyDgDa+5ChVlKqIvKc9FEJn
	gjmYlsZDuxRRB7S0e6g3JeFY6wDeMwjJJkugcg9vGarukgALQ/oqVDiOegBRTiydYce9CVdafrA+N
	WIriVgViQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXcwK-004Lj5-N8; Sat, 17 Apr 2021 04:52:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXcwH-004LiZ-F8
 for linux-riscv@desiato.infradead.org; Sat, 17 Apr 2021 04:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=QRWqXlrbMIubQMDOxB7EvLPJpCHxS4gSFuGLDnX8F9U=; b=qx0cI63HuOCaOht2zw5tkbSLji
 qIoSp4Mq5exssYsi4R2zQj8DGQPVCa2d/bMMjx1e/LCNTwiU9uSpHzOswTaC7uuRYp3xke7SL8d2j
 Y4i+r/Er2rNyauArZ6iWKj3tXE228Ftu/W9Wq3pvzV5eBbbYWOFSYtLUaitjv/8RQcjNQSAYSI/Gz
 aKq5vyHm8UTqOIY1zFfaHjWPJEDDTSxYRvSr5ao6M8laLqgxlMOve74Y1x7OFJuTpb58E6JlQdwaf
 Be8vrrA7gTAL6cac8S5FqE+fUZvOAZkszTmy/A/fmGW31OqGHej9HpTt6RzEfUiemqsLLRdVAeQvB
 Nn0cO55A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXcwE-009s4l-BG
 for linux-riscv@lists.infradead.org; Sat, 17 Apr 2021 04:52:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EB4860FE8;
 Sat, 17 Apr 2021 04:52:07 +0000 (UTC)
Subject: Re: [PATCH v4 1/2] binfmt_flat: allow not offsetting data start
To: Damien Le Moal <damien.lemoal@wdc.com>, uclinux-dev@uclinux.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Christoph Hellwig <hch@lst.de>
References: <20210417011009.54569-1-damien.lemoal@wdc.com>
 <20210417011009.54569-2-damien.lemoal@wdc.com>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <5227b984-f415-98b5-dae8-0cf84a71bb46@linux-m68k.org>
Date: Sat, 17 Apr 2021 14:52:05 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210417011009.54569-2-damien.lemoal@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_215210_487198_F953E6A0 
X-CRM114-Status: GOOD (  27.96  )
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


On 17/4/21 11:10 am, Damien Le Moal wrote:
> Commit 2217b9826246 ("binfmt_flat: revert "binfmt_flat: don't offset
> the data start"") restored offsetting the start of the data section by
> a number of words defined by MAX_SHARED_LIBS. As a result, since
> MAX_SHARED_LIBS is never 0, a gap between the text and data sections
> always exists. For architectures which cannot support a such gap
> between the text and data sections (e.g. riscv nommu), flat binary
> programs cannot be executed.
> 
> To allow an architecture to request no data start offset to allow for
> contiguous text and data sections for binaries flagged with
> FLAT_FLAG_RAM, introduce the new config option
> CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET. Using this new option, the
> macro DATA_START_OFFSET_WORDS is conditionally defined in binfmt_flat.c
> to MAX_SHARED_LIBS for architectures tolerating or needing the data
> start offset (CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET disabled case)
> and to 0 when CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET is enabled.
> DATA_START_OFFSET_WORDS is used in load_flat_file() to calculate the
> data section length and start position.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>   fs/Kconfig.binfmt |  3 +++
>   fs/binfmt_flat.c  | 19 ++++++++++++++-----
>   2 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
> index c6f1c8c1934e..06fb7a93a1bd 100644
> --- a/fs/Kconfig.binfmt
> +++ b/fs/Kconfig.binfmt
> @@ -112,6 +112,9 @@ config BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>   config BINFMT_FLAT_OLD_ALWAYS_RAM
>   	bool
>   
> +config BINFMT_FLAT_NO_DATA_START_OFFSET
> +	bool
> +
>   config BINFMT_FLAT_OLD
>   	bool "Enable support for very old legacy flat binaries"
>   	depends on BINFMT_FLAT
> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
> index b9c658e0548e..1dc68dfba3e0 100644
> --- a/fs/binfmt_flat.c
> +++ b/fs/binfmt_flat.c
> @@ -74,6 +74,12 @@
>   #define	MAX_SHARED_LIBS			(1)
>   #endif
>   
> +#ifdef CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
> +#define DATA_START_OFFSET_WORDS		(0)
> +#else
> +#define DATA_START_OFFSET_WORDS		(MAX_SHARED_LIBS)
> +#endif
> +
>   struct lib_info {
>   	struct {
>   		unsigned long start_code;		/* Start of text segment */
> @@ -560,6 +566,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>   	 * it all together.
>   	 */
>   	if (!IS_ENABLED(CONFIG_MMU) && !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
> +

Random white space change...
Don't worry about re-spinning though, I will just edit this chunk out.


>   		/*
>   		 * this should give us a ROM ptr,  but if it doesn't we don't
>   		 * really care
> @@ -576,7 +583,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>   			goto err;
>   		}
>   
> -		len = data_len + extra + MAX_SHARED_LIBS * sizeof(unsigned long);
> +		len = data_len + extra +
> +			DATA_START_OFFSET_WORDS * sizeof(unsigned long);
>   		len = PAGE_ALIGN(len);
>   		realdatastart = vm_mmap(NULL, 0, len,
>   			PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE, 0);
> @@ -591,7 +599,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>   			goto err;
>   		}
>   		datapos = ALIGN(realdatastart +
> -				MAX_SHARED_LIBS * sizeof(unsigned long),
> +				DATA_START_OFFSET_WORDS * sizeof(unsigned long),
>   				FLAT_DATA_ALIGN);
>   
>   		pr_debug("Allocated data+bss+stack (%u bytes): %lx\n",
> @@ -622,7 +630,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>   		memp_size = len;
>   	} else {
>   
> -		len = text_len + data_len + extra + MAX_SHARED_LIBS * sizeof(u32);
> +		len = text_len + data_len + extra +
> +			DATA_START_OFFSET_WORDS * sizeof(u32);
>   		len = PAGE_ALIGN(len);
>   		textpos = vm_mmap(NULL, 0, len,
>   			PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, 0);
> @@ -638,7 +647,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>   
>   		realdatastart = textpos + ntohl(hdr->data_start);
>   		datapos = ALIGN(realdatastart +
> -				MAX_SHARED_LIBS * sizeof(u32),
> +				DATA_START_OFFSET_WORDS * sizeof(u32),
>   				FLAT_DATA_ALIGN);
>   
>   		reloc = (__be32 __user *)
> @@ -714,7 +723,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>   			ret = result;
>   			pr_err("Unable to read code+data+bss, errno %d\n", ret);
>   			vm_munmap(textpos, text_len + data_len + extra +
> -				MAX_SHARED_LIBS * sizeof(u32));
> +				  DATA_START_OFFSET_WORDS * sizeof(u32));
>   			goto err;
>   		}
>   	}
> 

Thanks, otherwise looks good.

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

I will push this into my m68knommu tree, for-next branch.
I just carry the flat format changes in that tree now to make my life easier.

Regards
Greg


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
