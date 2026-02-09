Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D3DE81BC1
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 13:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkeQl5GF98erreCsn103uiE8UHjcacMynrfgFSzUXB4=; b=3hMkDjS83YtkCI
	McJXKxU1oNLNHYo1QFTJ/IueZysk73MlvDlN1N5vRIr/6E7fx5kaC9jbyjdW9NvoyZSQfK2Nttt01
	R8ZLFj5S25rxNWLASsXY70bAppq/lGGeKlhu3cwTV2x2PxQfW7/01fCE2guRNAx/ffModJJrx3HqX
	7Bom3aMQoJjAl3YA4Z2dIAFWh6wgB2nBpFPpRmqpd5VOVVVSIBOnDFjY/KUtmv/gv3kE8+9wN2M07
	6dPjoKdgQEss6He5vq3cbiDxYiryc6p/q6O4P6Z/KnY0i7Z0rZYZgQrSGWRzUBl4F4PBa3BWpi1le
	DCwTRE7LLcA2Sg/6JX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRAW-0000000FQQy-0rq3;
	Mon, 09 Feb 2026 13:19:12 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRAT-0000000FQOu-3tr7
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 13:19:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ZcnmD8/Oc5SbdX3u+nnGeYLputNhesaaUI5g9TCzBEU=;
	b=0eMI6mgkBu1Wr+5isJ1ZE9QEFCSdGsYtbQ+ZpZyzIEuRMUPDL7pYlRQQPXCXkpyCTXDMl+N63
	y/gZuDvq30Pf7CR7xobigbOmUSHc8AjRPx/cL7vizKJn0b2rStLY6hjn3nxul4S/amnZDk5QhR1
	BYIJiPtv6+PKheIvrteF7IQ=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4f8lXT4fDpzpStM;
	Mon,  9 Feb 2026 21:14:33 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 5F5744036C;
	Mon,  9 Feb 2026 21:18:53 +0800 (CST)
Received: from [10.67.110.198] (10.67.110.198) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Mon, 9 Feb 2026 21:18:52 +0800
Message-ID: <036eb7a9-1759-447b-ad94-2d66928f9d71@huawei.com>
Date: Mon, 9 Feb 2026 21:18:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 0/3] bpf: fsession support for riscv
To: Menglong Dong <menglong8.dong@gmail.com>, <ast@kernel.org>,
	<bjorn@kernel.org>
CC: <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
	<eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>,
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@fomichev.me>,
	<haoluo@google.com>, <jolsa@kernel.org>, <puranjay@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <jiang.biao@linux.dev>
References: <20260208053311.698352-1-dongml2@chinatelecom.cn>
Content-Language: en-US
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260208053311.698352-1-dongml2@chinatelecom.cn>
X-Originating-IP: [10.67.110.198]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_051910_141285_9AC3EB03 
X-CRM114-Status: UNSURE (   6.53  )
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


On 2026/2/8 13:33, Menglong Dong wrote:
> Implement bpf fsession for the riscv architecture.
> 
> Changes v4 -> v3:
> * fix the build error
> * v3: https://lore.kernel.org/bpf/20260206122002.1494125-1-dongml2@chinatelecom.cn/
> 
> Changes v3 -> v2:
> * fix some comments.
> * v2: https://lore.kernel.org/bpf/20260206115823.1070354-1-dongml2@chinatelecom.cn/T/#t
> 
> Changes v2 -> v1:
> * use bpf_prog_calls_session_cookie() in invoke_bpf() in the 2nd patch.
> * v1: https://lore.kernel.org/bpf/20260203055231.1088479-1-dongml2@chinatelecom.cn/
> 
> Menglong Dong (3):
>    bpf, riscv: introduce emit_store_stack_imm64() for trampoline
>    bpf, riscv: add fsession support for trampolines
>    selftests/bpf: enable fsession_test on riscv64
> 
>   arch/riscv/net/bpf_jit_comp64.c               | 97 +++++++++++++++----
>   .../selftests/bpf/progs/get_func_args_test.c  |  2 +-
>   .../selftests/bpf/progs/get_func_ip_test.c    |  2 +-
>   3 files changed, 79 insertions(+), 22 deletions(-)
> 

looks good to me, feel free to add

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
