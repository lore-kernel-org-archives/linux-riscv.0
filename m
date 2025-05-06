Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E73C3ABBC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 18:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+G0NPzyP3D/Ac0IMZKFpvgSKWAPXZMmL4ViXiAOQ/I=; b=gigN5f8ez39fa1
	5q5v8RKPHeZ+zp+ybdQINF1L3Xk1Q46jz46Uhic42S9NXhkqLUEw99txUMb0go4/gOsdyjtlN38Tb
	tQQum2Y/I/QSqp5f79IB7UqrIheXkqo3OAHjQR08dm4pdmB3oUif0rTAw8ShCCNvj8MFGNjOiat7Z
	82fWlxuxtVClMNmn1nJ1KN06Q7z6+iEYkBw+x8KwWXVfaN/XIGLGiwkCmsG1aVpxtSQBCMkr9C0IV
	vM7neLjss9/b0CE3JXAmWGX/92T3nWA0jfsn70stOpfqqQQQgBnBUhv5MNhs6j0HvsF74zAq25KGy
	PNa6hFtNp+83nNy7K4ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMsX-0000000CxUs-3kTG;
	Tue, 06 May 2025 18:18:53 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJCn-0000000CIsz-064M
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 14:23:34 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4ZsLG927n5zsTBf;
	Tue,  6 May 2025 22:22:57 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 5CF521A016C;
	Tue,  6 May 2025 22:23:31 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 6 May 2025 22:23:30 +0800
Message-ID: <2116c5b4-4bdd-47fd-8af1-0956f8339651@huawei.com>
Date: Tue, 6 May 2025 22:23:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 8/8] selftests/bpf: Enable non-arena
 load-acquire/store-release selftests for riscv64
Content-Language: en-US
To: Peilin Ye <yepeilin@google.com>, <bpf@vger.kernel.org>
CC: <linux-riscv@lists.infradead.org>, Andrea Parri <parri.andrea@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko
	<mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Josh Don
	<joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu
	<neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
References: <cover.1745970908.git.yepeilin@google.com>
 <755e831c84af2e7a4fc65fb52bc4724a6a7c2e53.1745970908.git.yepeilin@google.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <755e831c84af2e7a4fc65fb52bc4724a6a7c2e53.1745970908.git.yepeilin@google.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_072333_248775_D40F636B 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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



On 2025/4/30 8:51, Peilin Ye wrote:
> For riscv64, enable all BPF_{LOAD_ACQ,STORE_REL} selftests except the
> arena_atomics/* ones (not guarded behind CAN_USE_LOAD_ACQ_STORE_REL),
> since arena access is not yet supported.
> 
> Signed-off-by: Peilin Ye <yepeilin@google.com>
> ---
>   tools/testing/selftests/bpf/progs/bpf_misc.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing/selftests/bpf/progs/bpf_misc.h
> index 863df7c0fdd0..6e208e24ba3b 100644
> --- a/tools/testing/selftests/bpf/progs/bpf_misc.h
> +++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
> @@ -225,8 +225,9 @@
>   #define CAN_USE_BPF_ST
>   #endif
>   
> -#if __clang_major__ >= 18 && defined(ENABLE_ATOMICS_TESTS) && \
> -	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
> +#if __clang_major__ >= 18 && defined(ENABLE_ATOMICS_TESTS) &&		\
> +	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) ||	\
> +	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
>   #define CAN_USE_LOAD_ACQ_STORE_REL
>   #endif
>   
Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
