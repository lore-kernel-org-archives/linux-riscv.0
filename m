Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7311CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 16:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1/kgEVuAmAD+UwRMfLhibb1DOis63isGngj2X7Ylts=; b=BIGkMUn/yD7Ru34J9OSZJtsvS1
	FlQLmKYgbY/RVxNP6fPAI+HpvXfhHohd5y/Xiog2SaOaNRzxkucv7K1Lb9UX/bdTF9gqYwiXUD177
	kZwmgi/FyxN72V0lpjIgvdEkB2E4eWNeZ8iHj1L1cJ/cMTdtNkiLNOnKnYbXChF4z9j6v2DdIFYhP
	7VwpIEhGVzDQVOuymBVis83hS9Wl8RCtGXXyvZakPtIeGNkyYPuqT7/sKTJHUM8Bz3xU6cEbL8/rB
	cq6ru+ZhCa+f4/XZpTsFbrymMkOy4LRwXSuj58jCcqdKqJ7I8WyHr8CM5dXrif2g67beKT4f0wy1l
	vhi4tNRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgwE-0000000C28Q-3jC2;
	Tue, 02 Apr 2024 16:24:42 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrgwB-0000000C26U-2Ntp
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 16:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CyIVajsnrqIc9aPmFtNlh8ytag8an+QEap4fj/7NjHc=; b=h3c5A5VJAAgv6qoUjBFB4+v+xA
	zM6zctkJmzQ3myEg1AcdGCislp6xYaCnF/M9CnmRRZdD40PstebrZhf2DPyzdTkwsAAYA7U57N+Xr
	xM/bMzKwagk47WFPqXCpKAVOgEzvIp2HehrBcGBxzne1QO4/TSbzcnAhsx0Y4N6Hkjm1qYtYjyc4i
	rDvdi4N5oNIrwn+ITgg+UQ38iYGk6deZMweqj0A/VlhqMOA5wLy1NfXmz5LGSK/bm1qNN9DKLdjB/
	frOjcFCG2rOrwzsltny3/YZleAw00FsyNqdSEAnwExHYQTUt2JQ5NrtOE2FtbqefD7JYMMypG5CL5
	xznMnodQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1rrgbX-0002E0-Kh; Tue, 02 Apr 2024 18:03:19 +0200
Received: from [178.197.248.12] (helo=linux.home)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <daniel@iogearbox.net>)
	id 1rrgbW-0002En-1Y;
	Tue, 02 Apr 2024 18:03:18 +0200
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Manu Bretelle <chantr4@gmail.com>, Pu Lehui <pulehui@huawei.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <878r1vrga9.fsf@all.your.base.are.belong.to.us>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <5005fb56-086c-2aa7-e28b-83f0fc51f988@iogearbox.net>
Date: Tue, 2 Apr 2024 18:03:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <878r1vrga9.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27233/Tue Apr  2 10:26:21 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_092439_625389_EC4040B2 
X-CRM114-Status: GOOD (  10.08  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNC8yLzI0IDQ6MjcgUE0sIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1bGVo
dWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cj4+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1
YXdlaS5jb20+Cj4+Cj4+IFRoaXMgcGF0Y2ggcmVsYXhlcyB0aGUgcmVzdHJpY3Rpb25zIG9uIHRo
ZSBaYmIgaW5zdHJ1Y3Rpb25zLiBUaGUgaGFyZHdhcmUKPj4gaXMgY2FwYWJsZSBvZiByZWNvZ25p
emluZyB0aGUgWmJiIGluc3RydWN0aW9ucyBpbmRlcGVuZGVudGx5LCBlbGltaW5hdGluZwo+PiB0
aGUgbmVlZCBmb3IgcmVsaWFuY2Ugb24ga2VybmVsIGNvbXBpbGUgY29uZmlndXJhdGlvbnMuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4gCj4gU2hv
dWxkIHRoaXMgcGF0Y2ggcmVhbGx5IGJlIHBhcnQgb2YgdGhpcyBzZXJpZXM/CgpObywgdGhhdCBz
aG91bGQgYmUgc3VibWl0dGVkIGluZGVwZW5kZW50bHkuCgpBbHNvLCBnaXZlbiBFZHVhcmQncyBj
b21tZW50LCBpdCB3b3VsZCBiZSBncmVhdCBpZiB5b3UgY291bGQgYWRkIHRoZQppbnN0cnVjdGlv
bnMgdG8gdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL1JFQURNRS5yc3QgZXZlbiBpZiBub3Qg
aW4KYSBwZXJmZWN0IHNoYXBlLCBidXQgaXQgd291bGQgZ2l2ZSBkZXZlbG9wZXJzIGEgY2hhbmNl
IHRvIGdldCBzdGFydGVkLgoKVGhhbmtzLApEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
