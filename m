Return-Path: <SRS0=B3U6=2N=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5064FC2D0C0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2019 18:30:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E0E2073A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2019 18:30:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QYal8Wcc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="PMrDwuX6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E0E2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:References:
	In-Reply-To:To:Subject:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4s+YAIWTnpqbkvQsrs1kgFyI5PJQFh2IvW0x8pJusAk=; b=QYal8Wcca5WY0G
	mkj1F09bjrEQdOz5Yf37kVKErewVi/6SgK5h6SjRj+FNJQDnSEL0ZM0NEse5JU6gxD5J7fX0GLBH2
	G93a01XF36MvT1ZoizQ6wGVCbLYhk8gI6h8LUsOfmtkSOcx+9zdmFUZfNGIqXWqKPefI3hw8BiU4h
	OoZMgqDBclr1TmdLKzitWR0jvRZTA74fyuLXiGnzXmu+oyr74t6uTsqG1Rm8HZ7PlSO1/KBNyG2oO
	I0Pf9Oz6uUPEfqe7aetb4eIoK7xz4UGfFA7vQ/x0nmdczVr1hOSHVhIpB50gEI27IRmoBlIsWFzba
	Fv+2lGMF1DWJOL/W5Ynw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijSTc-0002o9-9y; Mon, 23 Dec 2019 18:30:44 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijSTa-0002nh-2j
 for linux-riscv@lists.infradead.org; Mon, 23 Dec 2019 18:30:43 +0000
Received: by mail-pg1-x543.google.com with SMTP id l24so9219143pgk.2
 for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2019 10:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:cc:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=4s+YAIWTnpqbkvQsrs1kgFyI5PJQFh2IvW0x8pJusAk=;
 b=PMrDwuX6oPEJOhMrPi5n1g3U7AyrFtjZL1PYFgy/GbhKxjcYPxgTuBWEThA3KTF1NK
 g+VL9Tzn8sDxGvVXEoe/4omE8SUgc4k/ySj8seyg0hkXJXsuHZ6TrIggTl4KhIvD6L7D
 hnjfgLhwvFPJmMBuusSh/sXZasEaSVi22bY6CT0VM0PkGg/dHHb2cZGy7B2qYaMlgoWY
 2PvcbWWtA6yJh453bsuMpOr8IAu7EHhh7Raeq6l2sCGhd/irHBdz5AxBBnx02lbGsLux
 fsO/uCSbk+DQOH4LcQTjOAmVEATd5fuTcg652PP37Z7vEsl+cw92BBf55B+4tgNt2LZq
 gd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:cc:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=4s+YAIWTnpqbkvQsrs1kgFyI5PJQFh2IvW0x8pJusAk=;
 b=JzZGeU2Ss915SaDg/Nupw1NjDIXWn2yqFcZwfpDgaGHp/xC7PgnERt60ASTdDiryyc
 gfbIgjvfDfqdstHPU7AU+pkz9Pa8vS5kaGVCuO/428dlu2W2/iDWTJfMTVw8CwCh8/6H
 dF89h6+7lca4Uj1JY29cDeOZo1LRu07Q1cefZYeIg9uT7aXyK4IUHgtHjsC8hDTlRV9A
 bA4LsaJgsJwJ6bzWK3l2N6aU995hyekG4tKX4DqYSiNHPOuFSHEjoZbx0onkpgzSqDfu
 XivRdANxHMOgSWR9nxGlntZy47b6hOk33RByW1s48EEZtHLBtRBjqo/WLBU6KY6pLbN1
 61NA==
X-Gm-Message-State: APjAAAX3iFvlKr0OFQudujEKJk8H8RHRTlt/OlG5eGEwDLiySRYoX9HY
 qtlsu6XfD5w9jAH5v5veI60Svg==
X-Google-Smtp-Source: APXvYqz9XqWvyxAlEWkNyD9bCzCDDMgxZw2M9kfQJPYDiGtuFIz2E7BxiGhn7rriK62yIKD4t4rHrA==
X-Received: by 2002:a63:1c64:: with SMTP id c36mr29162810pgm.302.1577125838483; 
 Mon, 23 Dec 2019 10:30:38 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id g26sm17328760pfo.130.2019.12.23.10.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 10:30:38 -0800 (PST)
Date: Mon, 23 Dec 2019 10:30:38 -0800 (PST)
X-Google-Original-Date: Mon, 23 Dec 2019 10:30:36 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH bpf-next v2 6/9] riscv,
 bpf: provide RISC-V specific JIT image alloc/free
To: Bjorn Topel <bjorn.topel@gmail.com>
In-Reply-To: <20191216091343.23260-7-bjorn.topel@gmail.com>
References: <20191216091343.23260-7-bjorn.topel@gmail.com>
 <20191216091343.23260-1-bjorn.topel@gmail.com>
Message-ID: <mhng-3299fb62-01d1-4e83-90fe-d706d2495bc1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_103042_124640_60D1B1A9 
X-CRM114-Status: GOOD (  17.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: daniel@iogearbox.net, netdev@vger.kernel.org, ast@kernel.org,
 Bjorn Topel <bjorn.topel@gmail.com>, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 16 Dec 2019 01:13:40 PST (-0800), Bjorn Topel wrote:
> This commit makes sure that the JIT images is kept close to the kernel
> text, so BPF calls can use relative calling with auipc/jalr or jal
> instead of loading the full 64-bit address and jalr.
>
> The BPF JIT image region is 128 MB before the kernel text.
>
> Signed-off-by: Björn Töpel <bjorn.topel@gmail.com>
> ---
>  arch/riscv/include/asm/pgtable.h |  4 ++++
>  arch/riscv/net/bpf_jit_comp.c    | 13 +++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ff0ed4f292e..cc3f49415620 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -404,6 +404,10 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>  #define VMALLOC_END      (PAGE_OFFSET - 1)
>  #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
>
> +#define BPF_JIT_REGION_SIZE	(SZ_128M)
> +#define BPF_JIT_REGION_START	(PAGE_OFFSET - BPF_JIT_REGION_SIZE)
> +#define BPF_JIT_REGION_END	(VMALLOC_END)
> +
>  /*
>   * Roughly size the vmemmap space to be large enough to fit enough
>   * struct pages to map half the virtual address space. Then
> diff --git a/arch/riscv/net/bpf_jit_comp.c b/arch/riscv/net/bpf_jit_comp.c
> index 8aa19c846881..46cff093f526 100644
> --- a/arch/riscv/net/bpf_jit_comp.c
> +++ b/arch/riscv/net/bpf_jit_comp.c
> @@ -1656,3 +1656,16 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
>  					   tmp : orig_prog);
>  	return prog;
>  }
> +
> +void *bpf_jit_alloc_exec(unsigned long size)
> +{
> +	return __vmalloc_node_range(size, PAGE_SIZE, BPF_JIT_REGION_START,
> +				    BPF_JIT_REGION_END, GFP_KERNEL,
> +				    PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> +				    __builtin_return_address(0));
> +}
> +
> +void bpf_jit_free_exec(void *addr)
> +{
> +	return vfree(addr);
> +}

Ah, I guess I should have read the whole patch set :)

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

and feel free to put the same on whatever patch I just asked that question
on, though maybe this one should go before the others as they sort of depend on
it?

