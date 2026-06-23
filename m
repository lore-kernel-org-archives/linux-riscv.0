Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42213CDB466
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 02:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3VkKX4tpxtzMx20HaNDemyX9GwzMatL3/4LgOj5Kkc=; b=G9UyPEnlDo5JwF
	Ga040hnOpkncj5VgVOAmZG0RKCeFSPeUvM7aDhXoHgkxj3V6sWoJ/FkfHe6EOsbbbi1eydjZrlIzp
	3o5gSl1Lk2BnAxLUCFnaBoWn60azk4kYFhvov9KnfHRV5sBd/Gi7jrEOhCUa2RDRNq4z9PK2mQwMf
	wWb7iP/fzjSfwGc1Bb4/F6foUzUoyDfWLLGrNkJsVgukIsj3L+9XuPDmpAM46w/a44OPQF1vcB//H
	kcN0kwDdzC673P/eoh6Zkz48kYOjTt7s0rAWgcb9e2Zp4YSxZAY9Nhjtogu+fH6/cphxTguQSJ7X/
	+pgjwC0DcPuOuoWz3SCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqeE-00000005ahF-3k72;
	Tue, 23 Jun 2026 02:13:58 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbqeC-00000005agX-0X9F
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 02:13:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3Vb/PnkYOFt85gJn7XLqDp/ZtRTv4hAY9hRhCUGKh4E=;
	b=eeoYL3e0Zu1mP/0OSHxjgDrdU4jVdWeAw7OzSkoccbiHzZNuSraWYKRufOcBtzcBqpqVzpVDY
	3BQWRCe9cJnn/VtDUzKI3wB/hX/2WFoCCZZu+WY4vt/ingytYL6WCvFTLV52P349v073PyrWP+o
	fK0JG+Qv3Y1hNijwrt+8Yd4=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gkpLn4jYWzpT05;
	Tue, 23 Jun 2026 10:05:37 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id CB69040569;
	Tue, 23 Jun 2026 10:13:50 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 23 Jun
 2026 10:13:49 +0800
Message-ID: <4a52f4fb-8695-4ef1-a5e4-04d3f2533b9d@huawei.com>
Date: Tue, 23 Jun 2026 10:13:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 3/3] riscv, bpf: Remove BPF exceptions from BPF
 CI denylist
Content-Language: en-US
To: Varun R Mallya <varunrmallya@gmail.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
	<memxor@gmail.com>, <bjorn@kernel.org>
CC: <alex@ghiti.fr>, <martin.lau@linux.dev>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
	<puranjay@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
References: <20260621144259.288135-1-varunrmallya@gmail.com>
 <20260621144259.288135-4-varunrmallya@gmail.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260621144259.288135-4-varunrmallya@gmail.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_191356_349782_8B3E9AF1 
X-CRM114-Status: GOOD (  10.68  )
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


On 2026/6/21 22:42, Varun R Mallya wrote:
> This patch removes BPF exceptions from riscv64 denylist on
> BPF selftests since support for exceptions has been added now.
> 
> Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
> ---
>   tools/testing/selftests/bpf/DENYLIST.riscv64 | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
> index 4fc4dfdde293..9268351ce4c1 100644
> --- a/tools/testing/selftests/bpf/DENYLIST.riscv64
> +++ b/tools/testing/selftests/bpf/DENYLIST.riscv64
> @@ -1,3 +1,2 @@
>   # riscv64 deny list for BPF CI and local vmtest
> -exceptions					# JIT does not support exceptions
>   tailcalls/tailcall_bpf2bpf*			# JIT does not support mixing bpf2bpf and tailcalls

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
