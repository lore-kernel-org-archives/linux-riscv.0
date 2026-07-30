Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A916C54FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWp+Sg0IfQVrcZyB4ls+rtLNNeWR3lYu1TrOT9terKY=; b=CHaHcjPDXoOsQI
	u6o3ENPNy/mybOMynWjcmm1KnZ1v0c/Ey93bAwBE4z0duEB72t8wMsa0VrC3WuzyfWt7s5+vCzRfs
	1dL72iwmd+yZ9i3BhySqvKkmza1HArPvBLbbKOt5tS8R3ONLf5u01sGuFywuJDQOwlaXbNWkeGTLF
	uaESdnBDyNwdvnDwtOzEerqMEnFUkXslEOdo4gay2C9HiMzzayqkQiFUmKSOiCpEk8xVDWgE+fR4j
	QaSvoVWAzpEESTGCqiO3nA7zTDmLJJFiStjS0EkYEdCFS2Hn7IatsdDXCwQf7BGNmbyEuwvPmC1BT
	Z0SKefKug+Uf+oNuK93A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpN4s-0000000A0l5-1rVB;
	Thu, 30 Jul 2026 09:29:22 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpN4o-0000000A0it-3Yle
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 09:29:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Q7eGxWeUTOOWWJ0HG9Gthaq9w4AqF6dQ7edb4y0jU48=;
	b=Z7rNdcLMVGFYz0ySL4KoOEr1jDgppBZMawlU60R2i3a8jS4Q7sTMJHCH80NPYkKLpglHC+DeB
	tk95OnRThOzqtQ2bcWcTzOBwM8Sfvsxkm60reFdGzE+MgBIAIB9u0rXkH7+aTEGg5fuy1A/Hil3
	BHeipydL41S+yga6NWpLEEg=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4h9kDc0bMnzmVWf;
	Thu, 30 Jul 2026 17:19:44 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id DA3734055B;
	Thu, 30 Jul 2026 17:29:11 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 30 Jul
 2026 17:29:10 +0800
Message-ID: <1161edc0-0dca-4317-96cb-9f14bba4a58f@huawei.com>
Date: Thu, 30 Jul 2026 17:29:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 6/6] riscv, bpf: Remove BPF exceptions from
 denylist
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
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
 <20260722140015.1982158-7-varunrmallya@gmail.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260722140015.1982158-7-varunrmallya@gmail.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_022919_044964_088458CC 
X-CRM114-Status: GOOD (  10.85  )
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



On 2026/7/22 22:00, Varun R Mallya wrote:
> This patch removes BPF exceptions from riscv64 denylist on
> BPF selftests since support for exceptions has been added now.
> Also, since the file is empty, delete the file.
> 
> Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
> ---
>   tools/testing/selftests/bpf/DENYLIST.riscv64 | 2 --
>   1 file changed, 2 deletions(-)
>   delete mode 100644 tools/testing/selftests/bpf/DENYLIST.riscv64
> 
> diff --git a/tools/testing/selftests/bpf/DENYLIST.riscv64 b/tools/testing/selftests/bpf/DENYLIST.riscv64
> deleted file mode 100644
> index ca1beae7fe8f..000000000000
> --- a/tools/testing/selftests/bpf/DENYLIST.riscv64
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# riscv64 deny list for BPF CI and local vmtest

let's keep this file with the above comment.

> -exceptions					# JIT does not support exceptions

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
