Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30560C48BDF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 19:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E10126120E
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 19:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E10126120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v54ypURaWiLeDzXgYjr0X/zqluBqC7tFLuengvfgmTw=; b=b3Ev1GQ/Fs/G8L
	kGuR11XKvBHiH8V9Wzias06ai82b7nHOyEeyZnE+DOMFEGBR1DJYGp3yYfZ/v3SN8HRRzflhvXUwg
	aqwzPE8T7G3/5gJbr4pLMRWSDkJFusiG7CJCDl0AZwV15YzNSJJWlN+Uzz7TnOnCjIrxdfOMk9Z+Y
	3OFeCBNyW/mAlfPlDgQOT0kgV8TkBNZCIJBS/P4awnz54eQLgxv8p5ceQLotRjT32lxI3teTpo0j7
	CYOCyK8JOoPrpV+oOsUn4aiWzVwYDn1RScADfzYEyfZ+1Bs/woNqTwUUaBWvg6jDpId2PPAmxDSDE
	We4zl9v9gYGU336ggVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsW8U-00B5Ft-Qy; Sun, 13 Jun 2021 19:51:10 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsW8Q-00B5E3-Nt
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 19:51:09 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4G34vN64Cwz1qtQV;
 Sun, 13 Jun 2021 21:50:56 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4G34vN363qz1qsYj;
 Sun, 13 Jun 2021 21:50:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id HJAVNxtJklRu; Sun, 13 Jun 2021 21:50:54 +0200 (CEST)
X-Auth-Info: LElrgumow5j7MizGUQKNpWrnXWIF9Qr7mZEEQCIJzLKJl+b0lrS27gPvl8MTWt4G
Received: from igel.home (ppp-46-244-177-185.dynamic.mnet-online.de
 [46.244.177.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 13 Jun 2021 21:50:54 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id D34602C369D; Sun, 13 Jun 2021 21:50:53 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Andrey Ryabinin
 <ryabinin.a.a@gmail.com>,  Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,  Dmitry Vyukov
 <dvyukov@google.com>,  =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>,  Andrii
 Nakryiko <andrii@kernel.org>,  Martin KaFai Lau <kafai@fb.com>,  Song Liu
 <songliubraving@fb.com>,  Yonghong Song <yhs@fb.com>,  John Fastabend
 <john.fastabend@gmail.com>,  KP Singh <kpsingh@kernel.org>,  Luke Nelson
 <luke.r.nels@gmail.com>,  Xi Wang <xi.wang@gmail.com>,
 linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com,  netdev@vger.kernel.org,  bpf@vger.kernel.org
Subject: Re: [PATCH 7/9] riscv: bpf: Avoid breaking W^X
References: <20210330022144.150edc6e@xhacker>
 <20210330022521.2a904a8c@xhacker> <87o8ccqypw.fsf@igel.home>
 <20210612002334.6af72545@xhacker> <87bl8cqrpv.fsf@igel.home>
 <20210614010546.7a0d5584@xhacker>
X-Yow: ..  Once upon a time, four AMPHIBIOUS HOG CALLERS attacked a family
 of DEFENSELESS, SENSITIVE COIN COLLECTORS and brought DOWN their
 PROPERTY VALUES!!
Date: Sun, 13 Jun 2021 21:50:53 +0200
In-Reply-To: <20210614010546.7a0d5584@xhacker> (Jisheng Zhang's message of
 "Mon, 14 Jun 2021 01:05:46 +0800")
Message-ID: <87im2hsfvm.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_125107_107856_45329789 
X-CRM114-Status: GOOD (  21.52  )
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

On Jun 14 2021, Jisheng Zhang wrote:

> I think I found the root cause: commit 2bfc6cd81bd ("move kernel mapping
> outside of linear mapping") moves BPF JIT region after the kernel:
>
> #define BPF_JIT_REGION_START   PFN_ALIGN((unsigned long)&_end)
>
> The &_end is unlikely aligned with PMD SIZE, so the front bpf jit region
> sits with kernel .data section in one PMD. But kenrel is mapped in PMD SIZE,
> so when bpf_jit_binary_lock_ro() is called to make the first bpf jit prog
> ROX, we will make part of kernel .data section RO too, so when we write, for example
> memset the .data section, MMU will trigger store page fault.
>
> To fix the issue, we need to make the bpf jit region PMD size aligned by either
> patch BPF_JIT_REGION_START to align on PMD size rather than PAGE SIZE, or
> something as below patch to move the BPF region before modules region:
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 9469f464e71a..997b894edbc2 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -31,8 +31,8 @@
>  #define BPF_JIT_REGION_SIZE	(SZ_128M)
>  #ifdef CONFIG_64BIT
>  /* KASLR should leave at least 128MB for BPF after the kernel */
> -#define BPF_JIT_REGION_START	PFN_ALIGN((unsigned long)&_end)
> -#define BPF_JIT_REGION_END	(BPF_JIT_REGION_START + BPF_JIT_REGION_SIZE)
> +#define BPF_JIT_REGION_START	(BPF_JIT_REGION_END - BPF_JIT_REGION_SIZE)
> +#define BPF_JIT_REGION_END	(MODULES_VADDR)
>  #else
>  #define BPF_JIT_REGION_START	(PAGE_OFFSET - BPF_JIT_REGION_SIZE)
>  #define BPF_JIT_REGION_END	(VMALLOC_END)
> @@ -40,8 +40,8 @@
>  
>  /* Modules always live before the kernel */
>  #ifdef CONFIG_64BIT
> -#define MODULES_VADDR	(PFN_ALIGN((unsigned long)&_end) - SZ_2G)
>  #define MODULES_END	(PFN_ALIGN((unsigned long)&_start))
> +#define MODULES_VADDR	(MODULES_END - SZ_128M)
>  #endif
>  
>  
> can you please try it? Per my test, the issue is fixed.

I can confirm that this fixes the issue.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
