Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C385C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0oM3k7FAcpwEgdA1pRcV5Xkmhtk/ka8PMUcbPMTUeQ=; b=BgQnKkX+hBUCZw
	lDzqWj+gz3YHGqCTLPSenaOYjBxSfHmZWI/s4b6LbgSyva0rywdNq6Nrfd/b/O6zLjBTUXXVb0ORY
	9j5aE7UIwld1Dn++0nYi4H1gNJyBtr3PemnkDovHMezrO2CfAUAWQ7rwWuw4z/ewCwNyFkHnVlypp
	jaAzBsX9fIPst2tP2JAVDnvGl2fwR2eoBjkmrgmZQe3xdOVo4mBFsFtmMZyE/bUl+ixKYBE+Q/Slv
	UajZ29rmDiPX9TZcEo/Oz14Uh9rUYl739Ol/8iWamaHtXkIXoXKj0DP7B8Dyo3LV3Qo+Q3ZTL+0oz
	TyI77IyEzc0SkmymsMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6y6q-00CTKv-Dp; Mon, 10 Jan 2022 17:05:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6y6n-00CTJM-Hp
 for linux-riscv@lists.infradead.org; Mon, 10 Jan 2022 17:05:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6CB3CCE13E0;
 Mon, 10 Jan 2022 17:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C0EC36AE5;
 Mon, 10 Jan 2022 17:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641834319;
 bh=UdWl8wuXbg1UuKvjSdkNKobDow52EvDCA/OGcUygQ/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XJ/yRtAPWqZqjqWTSZ71bZIPdXqhZ8DKLpL9knwVx9Ug11TfhQsKEoUjAryftb85P
 f1DXOl4Y8ESsSLSYUCCpIpL/TwliJNnl9+kPC8rTN9owRqd4KVyQlAZKCo34ekNNiQ
 NymiGFChxwnQ8rc+PN1TzpZd3WH9nMq3JTgrCkxSztrtd8o+INWtNqzgTHmkMyWLg6
 tdXPvorVIGwGQzSdACUW52BV0r97eXx+26IP5sFuIxalbNp1gJgh+gLklNcrNCKpFY
 e2z1EVdEOjsjkXA5JMHXgbypDV+yh9NxR/cr1XYWVvQSFuBXt6abCGSrw3rLeD4Mfr
 osfV4HyLqJHOg==
Date: Tue, 11 Jan 2022 00:57:50 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH riscv-next] riscv: bpf: Fix eBPF's exception tables
Message-ID: <Ydxljv2Q4YNDYRTx@xhacker>
References: <20220110165208.1826-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110165208.1826-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_090525_806522_9D7F475B 
X-CRM114-Status: GOOD (  19.07  )
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

On Tue, Jan 11, 2022 at 12:52:08AM +0800, Jisheng Zhang wrote:
> eBPF's exception tables needs to be modified to relative synchronously.
> 
> Suggested-by: Tong Tiangen <tongtiangen@huawei.com>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/net/bpf_jit_comp64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
> index 69bab7e28f91..44c97535bc15 100644
> --- a/arch/riscv/net/bpf_jit_comp64.c
> +++ b/arch/riscv/net/bpf_jit_comp64.c
> @@ -498,7 +498,7 @@ static int add_exception_handler(const struct bpf_insn *insn,
>  	offset = pc - (long)&ex->insn;
>  	if (WARN_ON_ONCE(offset >= 0 || offset < INT_MIN))
>  		return -ERANGE;
> -	ex->insn = pc;
> +	ex->insn = offset;

Hi Palmer,

Tong pointed out this issue but there was something wrong with my email
forwarding address, so I didn't get his reply. Today, I searched on
lore.kernel.org just found his reply, sorry for inconvenience.

Thanks

>  
>  	/*
>  	 * Since the extable follows the program, the fixup offset is always
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
