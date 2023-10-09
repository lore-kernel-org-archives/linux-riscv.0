Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE35FE95A95
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eD883SqjVomhgjqGzt6gxP4RKYV2NJaIgUKHtYXaOWQ=; b=Ee29NFsgLzqLqdaY4iL5b80MlH
	wvSKtb8H0SWi1xfBUCDPwjpYpKTgUWTN2A8ACQPCiVMBo+1q99dCD98tPAWxAFDl+Ivp5fAfHNisH
	FLQJOKSLz/TXzB1tPu5dLjxikYgsS/P5zxyvjoG2XeA6pmJkB1uIwLVOkwC3QIj/AdSZPfnV+FM/j
	EAbBRVODZJLIe88ddFdIAqVkjxVLD3S9xHB9j/Jxhz9Wi/HfoTmOmeirQsIBYoFtCuJ4myGJJtSa3
	34Eg80Jhm8EIqkZWbN1QPIXuMbvGKRjD0dEynzrbeyIMrzYcTDlQS7w1P/vPhWJ7FAU6NfwpfEub5
	bMaWZ9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqIw-00Ao5E-1O;
	Mon, 09 Oct 2023 13:28:14 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqIq-00Ao2y-2h
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 13:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Upzz23gM7CFVJCcFBQEZrdbmDiHFsFQK+Y+xE1IddiY=; b=mXBfR6M937X0CooRhB5p1qQeET
	EpoVcaViV4YWfVL4jbUHqF4GhcQybjC4HJhD34LkZsM/yhGwaWaKbfOZ6/le5fvdVo1xE8YC9o0lN
	isHZXwpnl11W+AbBQ4JHPX7BTHDpvBlEqj8XbXBvmVuI3x9q6uO1Vaq/Oqx37EfbV//TEL5BjhTki
	s1Xe7UAYUBOn+gTzC9ey4jUNUJtRQfYMbN8EgnR5UZm/h7649fzmaHwqTl+BsO15nrB7aSzb/rP+w
	pW1UdujmrRQ+q04MI4kLxftupV3zerRcQEzU3qBAS6Z0SQOIoIsfWPjZ8e72g5nE7kT044vtqAi0F
	6njg/gUQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1qpqIa-000PVk-3i; Mon, 09 Oct 2023 15:27:52 +0200
Received: from [178.197.249.27] (helo=linux.home)
	by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1qpqIZ-000SIq-Ka; Mon, 09 Oct 2023 15:27:51 +0200
Subject: Re: [PATCH bpf 0/2] riscv, bpf: Properly sign-extend return values
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 bpf@vger.kernel.org, netdev@vger.kernel.org, Pu Lehui <pulehui@huawei.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, linux-riscv@lists.infradead.org
References: <20231004120706.52848-1-bjorn@kernel.org>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <6dbba8a3-b07c-5247-f2c1-c6b484e9a16e@iogearbox.net>
Date: Mon, 9 Oct 2023 15:27:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20231004120706.52848-1-bjorn@kernel.org>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27056/Mon Oct  9 09:40:11 2023)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_062808_874579_310D232C 
X-CRM114-Status: UNSURE (   8.70  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvNC8yMyAyOjA3IFBNLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IEZyb206IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KWy4uLl0KPiBUaGUgZm9sbG93aW5nIHRlc3RfcHJv
Z3Mgbm93IHBhc3MsIHdoaWNoIHdlcmUgcHJldmlvdXNseSBicm9rZW46Cj4gCj4gICAgfCAxMyAg
ICAgIGJwZl9jb29raWUKPiAgICB8IDE5ICAgICAgYnBmX21vZF9yYWNlCj4gICAgfCA2OCAgICAg
IGRlbnlfbmFtZXNwYWNlCj4gICAgfCAxMTkgICAgIGxpYmJwZl9nZXRfZmRfYnlfaWRfb3B0cwo+
ICAgIHwgMTM1ICAgICBsb29rdXBfa2V5Cj4gICAgfCAxMzcgICAgIGxzbV9jZ3JvdXAKPiAgICB8
IDI4NCAgICAgdGVzdF9sc20KClRoYW5rcyBmb3IgdGhlIGZpeGVzLCB0b29rIHRoZW0gaW50byBi
cGYgdHJlZS4gSSB3YXMgd29uZGVyaW5nIHdoZXRoZXIgdGhpcyBjb3VsZCBiZQpiYWNrZWQgYnkg
c3BlY2lmaWMgdGVzdHMsIGJ1dCBsb29rcyBsaWtlIHRoZSBhYm92ZSBsaXN0IGFscmVhZHkgdGFr
ZXMgY2FyZSBvZiBpdC4KClRoYW5rcywKRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
