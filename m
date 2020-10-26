Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D19C4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 12:34:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E447A223AB
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 12:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KyTbWxYU";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hjKqf01N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E447A223AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7/MP/5j7I5GilxopYh6N6z3WGQ15It1aNf5kiH3tDDw=; b=KyTbWxYUE8pNqovWtie+V0S+c
	xRdPW+/Rb6mrB26gbAt9oFMCGo19fN3tMwm8e5ZVHRtuu9KPYXvFp4u3/D56LRhpDraCv3WeWs113
	i7KoU1hJXbeIj+2+QxEgoTwRh/oE3+RrdzA0cDqbLb3RPQcjGYzdOE/3ROWOWE92sn82bO/qcsYyd
	lN4FTe0dvnwngTWcDnJiou+UyIPDe3YHRp1Vb8ZmGMvhyw20lgiSctDJgByVDQoibuUlooN5094VV
	Wbn6zgDBakIOMwy+vW/OBMaWp/Xy0dxHkjvP8Czy0nOJsd1SSyp0sUyZcmr70qWXhjkk80Wq6Mj+B
	0BZUNQrGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX1hn-0007PP-DR; Mon, 26 Oct 2020 12:34:31 +0000
Received: from wforward5-smtp.messagingengine.com ([64.147.123.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX1hk-0007Ni-TK
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 12:34:30 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailforward.west.internal (Postfix) with ESMTP id 8A7D1970;
 Mon, 26 Oct 2020 08:34:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 26 Oct 2020 08:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vIbCuk
 91i6QGTraXt+/cjM/+gEv1M6E58T0Do/aXATs=; b=hjKqf01Nh66q4xQKCx8EyJ
 qkeL1su0cwwW8LIZXcQBCI/m+KPVAHmVgmjk4P4zlY21t33RbSJxcrDqDGZQ8x+s
 MCh3NyT+oBYx22wCfvstcslSJmW1ZVyZE/IEPBrA0oz0nRKSj5V3MSsjCzl2ip9P
 +oiuYCSnlkhb6Jko2AWEVvTbfS/3XTuXo1E0G18f0vPkrtx0/1em8JdVl0IjsRIV
 UZmeWZU9Z9PdMovU4Mokt+suwOLkXUkOZxeiuNNAjtQenUBhMEWVli85qu9mHb/+
 aY3E6XseuHr4mHoWWE2c6WrIjYEFnxtoUocRf8WACutkNdhQqioANImSS8snUxhg
 ==
X-ME-Sender: <xms:TMKWX32SpsWgjAY8abk3XxOrqo9nZxvfAURr4zQnZNa8k8lCPMNKfw>
 <xme:TMKWX2HJuoj_tAhjchawvySm1vW_-fjuUw5VQY7uBYxBh0DYs0IyApsB54QV3xVE2
 08WrylAzM-jWWocSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeejgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
 dttddvnecuhfhrohhmpefrvghkkhgrucfgnhgsvghrghcuoehpvghnsggvrhhgsehikhhi
 rdhfiheqnecuggftrfgrthhtvghrnhepgfffgeekteetvdejledufeelleeuudeigfevvd
 eileeludehiedugefhleehvdeunecukfhppeeivddrjeekrddujeelrddufedunecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvnhgsvghrgh
 esihhkihdrfhhi
X-ME-Proxy: <xmx:TMKWX348QcPt5zHbYrVn4uqgJvlkflWoA4eSeK4C2QmxMOBBoKWlpQ>
 <xmx:TMKWX81hKwyoIaIs0o5PJS4nfbUX0ZfZZijM0ITdoJ_w0hDzxLNHmQ>
 <xmx:TMKWX6GWllP0CNVPE2oEqiRnMyiuN0UhSfpaDV4TkfhdB4omm8EIeQ>
 <xmx:TsKWX4ZA0PYyTTWaBKYMwYeVdDjjztvCtGxr3E9ySOjomNHK2zqFv4svMk0LUlwu>
Received: from localhost (62-78-179-131.bb.dnainternet.fi [62.78.179.131])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C6E53280060;
 Mon, 26 Oct 2020 08:34:20 -0400 (EDT)
Date: Mon, 26 Oct 2020 14:34:18 +0200
From: Pekka Enberg <penberg@iki.fi>
To: liush <liush@allwinnertech.com>
Subject: Re: [PATCH v3] riscv: fix pfn_to_virt err in do_page_fault().
Message-ID: <20201026123418.GA1087529@nero>
References: <1603715214-29082-1-git-send-email-liush@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603715214-29082-1-git-send-email-liush@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_083429_069415_DAE42C5F 
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, peterx@redhat.com,
 penberg@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 akpm@linux-foundation.org, walken@google.com, linux-riscv@lists.infradead.org,
 vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 26, 2020 at 08:26:54PM +0800, liush wrote:
> From: Liu Shaohua <liush@allwinnertech.com>
> 
> The argument to pfn_to_virt() should be pfn not the value of CSR_SATP.
> 
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: liush <liush@allwinnertech.com>

Reviewed-by: Pekka Enberg <penberg@kernel.org>

> ---
>  arch/riscv/mm/fault.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 1359e21..3c8b9e4 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -86,6 +86,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
>  	pmd_t *pmd, *pmd_k;
>  	pte_t *pte_k;
>  	int index;
> +	unsigned long pfn;
>  
>  	/* User mode accesses just cause a SIGSEGV */
>  	if (user_mode(regs))
> @@ -100,7 +101,8 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
>  	 * of a task switch.
>  	 */
>  	index = pgd_index(addr);
> -	pgd = (pgd_t *)pfn_to_virt(csr_read(CSR_SATP)) + index;
> +	pfn = csr_read(CSR_SATP) & SATP_PPN;
> +	pgd = (pgd_t *)pfn_to_virt(pfn) + index;
>  	pgd_k = init_mm.pgd + index;
>  
>  	if (!pgd_present(*pgd_k)) {
> -- 
> 2.7.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
