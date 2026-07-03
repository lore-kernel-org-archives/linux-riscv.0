Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF05C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5lliJuG/omvSg8Hl3BHEfpx9wKlJs2cvg/h/4A0b1g=; b=rZTYmE1aZx33dN
	7Q87Skbvnuq9VLj2ncaWMJjHoAx5wZxKCnVqoRj3h8a2p7vWVt+VmpLc5JjMrXv96dQEsLnF4klFr
	i8ACy8u48ENoOUcNBNwEGj43A2dOIHNeCME4k7PnfGBfIUndgImbTGDxBT1UtXeoTyl80yuvXlCtV
	pCZ/SY39frwb9C6DeEW4aBk2mRhu4+jEPK5aqX7CWOcNPWrTi9/iPyShufNFSGnlFthJzaFuNzQXr
	3elzlp+yL3yBxLpXs2uuVTwvo4eCCf+3ohzxvRYxFrgYM0azP89BwNyZGh/+tBEKI4dLBETYNerKs
	ftiFh4G5c0B15xxWOIwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfl1t-00000007uku-05da;
	Fri, 03 Jul 2026 21:02:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfl1s-00000007ukj-11QE
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 21:02:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FED1418BC;
	Fri,  3 Jul 2026 21:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E9A1F000E9;
	Fri,  3 Jul 2026 21:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783112551;
	bh=Kxy/nHrA/YPl3oQA1s1YUJFp/UiroxEca2CIOkGyN+4=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=QxG157Of+hFM+LFQ7BvmTo4/2xtWWbjNv088utFW0+XMcajzFhzht7bVw+dS/5+ve
	 z13t+B9J2d3OEuDdefTJaMFUi/E8wR9R4/Gm8FumDxvtidM05Sl+GmAf2UF3yFReVv
	 mqr0Uto/z7L5q4vJJuYvvkeRGjFR+vVDM1RsyJd1bHmq1AjopoNWuiUQKDN+DOiMd5
	 UKtcLljh6CArSl8nMs/YrmJNWbVz3y0ScJwJjIVzXckAgbDblGcbOkJB3HG6JTvDY7
	 ze5vM6LRITBpSbB+6er3+uBCHXU5LgTycppqNNQ6CQSegRpkLv+Lmifi7rpWsij9EC
	 tLM3kGlume1GQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 eddyz87@gmail.com, memxor@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, bjorn@kernel.org,
 pulehui@huawei.com, puranjay@kernel.org, thuth@redhat.com,
 ajones@ventanamicro.com, ben.dooks@codethink.co.uk,
 rkrcmar@ventanamicro.com, cuiyunhui@bytedance.com,
 samuel.holland@sifive.com, zong.li@sifive.com, conor.dooley@microchip.com,
 debug@rivosinc.com, seanwascoding@gmail.com, andybnac@gmail.com,
 menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
 wangruikang@iscas.ac.cn, atishp@rivosinc.com, apatel@ventanamicro.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, bpf@vger.kernel.org, arnd@arndb.de, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 qingfang.deng@siflower.com.cn, linux-arch@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v8 3/3] riscv: store percpu offset into thread_info
In-Reply-To: <20260703122832.15984-4-cuiyunhui@bytedance.com>
References: <20260703122832.15984-1-cuiyunhui@bytedance.com>
 <20260703122832.15984-4-cuiyunhui@bytedance.com>
Date: Fri, 03 Jul 2026 23:02:28 +0200
Message-ID: <87bjcnlrbv.ffs@fw13>
MIME-Version: 1.0
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

On Fri, Jul 03 2026 at 20:28, Yunhui Cui wrote:
> +
>  extern struct task_struct *__switch_to(struct task_struct *,
>  				       struct task_struct *);
>  
> @@ -122,6 +129,7 @@ do {							\
>  	if (switch_to_should_flush_icache(__next))	\
>  		local_flush_icache_all();		\
>  	__switch_to_envcfg(__next);			\
> +	__switch_to_pcpu_offset(__next);		\

Why do you want to go through the indirection of current:

> +static inline void __switch_to_pcpu_offset(struct task_struct *next)
> +{
> +#ifdef CONFIG_SMP
> +	next->thread_info.pcpu_offset = __my_cpu_offset;
> +#endif
> +}

instead of using __prev->.....offset, which is right there available?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
