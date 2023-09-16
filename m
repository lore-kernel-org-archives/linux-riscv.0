Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2889ACD37BC
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 14:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eiGbXs9rXcZQSntHVLhMSQkEUjLhwqjve8BqfTtT9Z0=; b=tLCP/XcSarTrHq
	//HfwxiVJKNBSP04bKVBG5THzejLdgC3HbNVtjg+IWfsrKI/Z9D1B90ywVJIGDIgHdniBsicVyXLF
	7pJ+XM3yA/L6OTpPdduTTfpIypruSNE+cbTqSy3R40+L5spR+DCvByKZyt1NxDQi/4lC3J5GX9I0z
	YB1RJF9i99u+EhDdri8gz40UbHkT2oFsO2ipWM9o8CAyJV5lVh4sV7x3QZYzGhBtnJtjkasoVNmxS
	yhdbmyGO+JGSrdtaAx9hsQgwhWNxpbh/04kCUMFGOO8Fh+bNDF4tpyO+2zrkQFkEjgkEHkhV8SHQL
	3Cj5fnuz8V94IPwtfEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhWaP-00CaCl-1y;
	Sat, 16 Sep 2023 14:47:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhWaM-00CaC5-1A
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 14:47:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EEC6D60F7A;
	Sat, 16 Sep 2023 14:47:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4018C433C7;
	Sat, 16 Sep 2023 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694875668;
	bh=DrpFaRSh/IAeouBerVCYqiVaRBz09LVTL2zZXjVhk0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BcGZXd7tGQX9f5peC25KLnAHHnsRMglQ2tX2ZQlXPodNBeeEDSPRM7LaDVUwchSK/
	 aGU6cA7qLoXcoqcfKRaoydd98XmsKv7GZOS/LlXhPk7q480dXWJG3xedTzLac2/Vtj
	 +RrsniiJQHOplMRj9R0agcXR6IgVBKnUqwLSyneJ0os+zB6TD2vm3GfzubIBSIshVh
	 XDS2Y9MJAjZ+wQsdDdr7q1B1bQJj6MUlDEX2FyR00OcO4loRd5/40PVIQUW77Bx6i1
	 qrvl27ZSLI5oiokE6B7zjD88dfkhIKS+0R5xygnHUnSTMAAhV6FkC4MyaFQi0AnTtO
	 rJ2GwPydVg5uA==
Date: Sat, 16 Sep 2023 16:47:42 +0200
From: Simon Horman <horms@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH bpf-next 3/6] riscv, bpf: Simplify sext and zext logics
 in branch instructions
Message-ID: <20230916144742.GB1125562@kernel.org>
References: <20230913153413.1446068-1-pulehui@huaweicloud.com>
 <20230913153413.1446068-4-pulehui@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230913153413.1446068-4-pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_074750_463950_5B9B4A80 
X-CRM114-Status: GOOD (  13.87  )
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

On Wed, Sep 13, 2023 at 11:34:10PM +0800, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> There are many extension helpers in the current branch instructions, and
> the implementation is a bit complicated. We simplify this logic through
> two simple extension helpers with alternate register.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>  arch/riscv/net/bpf_jit_comp64.c | 82 +++++++++++++--------------------
>  1 file changed, 31 insertions(+), 51 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 4a649e195..1728ce16d 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -141,6 +141,19 @@ static bool in_auipc_jalr_range(s64 val)
>  		val < ((1L << 31) - (1L << 11));
>  }
>  
> +/* Modify rd pointer to alternate reg to avoid corrupting orignal reg */

Hi Pu Lehui,

nit: original

I suggest running checkpatch --codespell over this series before submitting
v2.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
