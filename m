Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D8AC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 21:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zpXVRayfX6BgkQSQIAXS5RHEQ0Qz0+j7sYsjFEahfI=; b=HhVmhnOgY9S4h0ieNVu56WbaTD
	bWDKM6SqIV3Ru3NvpWsROzpeLhfWTjdmm7ObpqqDTcTz/DegiBbEyK7RR7dLvwOZWJbY5hveC1jMk
	6X0AIilWlVYOrZAB72DbWXJjbldIkiZam6sDdkNJOEmiwq0CRE8OldrHKSj3EPW91LMeG5sO8PLvQ
	qq8uzSTJHOyAQBk6vnq/8C5Bqw2IEiHKqwb5Q53OT8XUiSx8XC9nBax8KwYjUCdQ+7MHxmwrdEcWt
	MoCxDj4AitBKhsX05ST9ch8rnYi6F8ufQKYX8nDriQYpdBhCPKYOacZEp2UHRsCbiEyY46iYXmj/V
	RfHsKaOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmXk-008JzR-Up; Mon, 30 May 2022 21:03:16 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvmXi-008JwL-4P
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 21:03:15 +0000
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92.3)
	(envelope-from <daniel@iogearbox.net>)
	id 1nvmXW-000Be0-Qm; Mon, 30 May 2022 23:03:02 +0200
Received: from [85.1.206.226] (helo=linux-2.home)
	by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1nvmXW-0009iv-CB; Mon, 30 May 2022 23:03:02 +0200
Subject: Re: [PATCH bpf-next v3 4/6] libbpf: Unify memory address casting
 operation style
To: Pu Lehui <pulehui@huawei.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20220530092815.1112406-1-pulehui@huawei.com>
 <20220530092815.1112406-5-pulehui@huawei.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <a31efed5-a436-49c9-4126-902303df9766@iogearbox.net>
Date: Mon, 30 May 2022 23:03:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20220530092815.1112406-5-pulehui@huawei.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.6/26557/Mon May 30 10:05:44 2022)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_140314_237263_932F43CA 
X-CRM114-Status: GOOD (  15.69  )
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

On 5/30/22 11:28 AM, Pu Lehui wrote:
> The members of bpf_prog_info, which are line_info, jited_line_info,
> jited_ksyms and jited_func_lens, store u64 address pointed to the
> corresponding memory regions. Memory addresses are conceptually
> unsigned, (unsigned long) casting makes more sense, so let's make
> a change for conceptual uniformity.
> 
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   tools/lib/bpf/bpf_prog_linfo.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/lib/bpf/bpf_prog_linfo.c b/tools/lib/bpf/bpf_prog_linfo.c
> index 5c503096ef43..7beb060d0671 100644
> --- a/tools/lib/bpf/bpf_prog_linfo.c
> +++ b/tools/lib/bpf/bpf_prog_linfo.c
> @@ -127,7 +127,8 @@ struct bpf_prog_linfo *bpf_prog_linfo__new(const struct bpf_prog_info *info)
>   	prog_linfo->raw_linfo = malloc(data_sz);
>   	if (!prog_linfo->raw_linfo)
>   		goto err_free;
> -	memcpy(prog_linfo->raw_linfo, (void *)(long)info->line_info, data_sz);
> +	memcpy(prog_linfo->raw_linfo, (void *)(unsigned long)info->line_info,
> +	       data_sz);

Took in patch 1-3, lgtm, thanks! My question around the cleanups in patch 4-6 ...
there are various other such cases e.g. in libbpf, perhaps makes sense to clean all
of them up at once and not just the 4 locations in here.

Thanks,
Daniel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
