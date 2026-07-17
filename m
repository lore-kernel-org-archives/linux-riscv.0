Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAFEC4450F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 03:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAvgsXAt1CgmzUktKjrrAuPt1Wa9vQHcZYZFSHAe8Y8=; b=ULppNvcKEaHXwt
	IzHGJg1QVMq7PJpESy5lLrwGpKpypq0C6ZTxJYIN782h2XMAbQXqWD/33bVgzvQi1i7WtztjB43QN
	B8Vh/aZAtuHIJZ5wDIlJaEWZOF8M2lFZMkbnjxeh3OeMGjnLOB6AOeZsGkPn82sH+lPQFDrlw5OP8
	V1P9yVFMoTNXtqKoWb87xXTJPsFPkHhLBpRX+2VfEu5zpOVdXr5ha6YrpTr39lUUjok1QaPCyOPq/
	HXs3fWScZbxi8xdki0rw8JVDhLQ4hBhprGCH9a0c9uaaP0KUcLYxBospiVfMMDRL1mlJQUtao9BzW
	PrNUXzFbXAerBiSfN+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZFv-00000001310-3L7L;
	Fri, 17 Jul 2026 03:28:55 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZFs-0000000130L-1dDd
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 03:28:54 +0000
X-UUID: 9e7d2a60818f11f1aa26b74ffac11d73-20260717
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d811b572-e5b2-42bd-a1ba-c30d82780afe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:bc5ead1f839908384fe6a72a23752c91,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|865|898,TC:nil,Content:0
	|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9e7d2a60818f11f1aa26b74ffac11d73-20260717
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1940698584; Fri, 17 Jul 2026 11:28:46 +0800
Message-ID: <b4281b16-5c87-423b-bcc3-d6f623c8cd6b@kylinos.cn>
Date: Fri, 17 Jul 2026 11:28:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] selftests/bpf: enable timed may_goto tests for
 riscv64
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, Pu Lehui <pulehui@huawei.com>,
 Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260715-riscv-bpf-timed-may-goto-v3-0-cf2a9c3d843f@kylinos.cn>
 <20260715-riscv-bpf-timed-may-goto-v3-2-cf2a9c3d843f@kylinos.cn>
 <877bmvwekq.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <877bmvwekq.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_202852_737123_D88B74FD 
X-CRM114-Status: UNSURE (   3.44  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyNi83LzE2IDE1OjU4LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IEZlbmcgSmlhbmcgPGpp
YW5nZmVuZ0BreWxpbm9zLmNuPiB3cml0ZXM6Cj4gCj4+IEVuYWJsZSB2ZXJpZmllcl9tYXlfZ290
b18xIChyYXcgaW5zdHJ1Y3Rpb24gdGVzdHMpLCBzdHJlYW1fY29uZF9icmVhawo+PiAoMjUwbXMg
dGltZW91dCBwYXRoKSwgYW5kIHRoZSBtYXlfZ290b19pbnRlcmFjdGlvbl9hcm02NCBmYXN0Y2Fs
bCB0ZXN0Cj4+IG9uIHJpc2N2NjQgbm93IHRoYXQgdGhlIEpJVCBzdXBwb3J0cyB0aW1lZCBtYXlf
Z290by4KPiAKPiBSZWFsbHkgYSBuaXQsIGJ1dCBub3cgdGhhdCBtYXlfZ290b19pbnRlcmFjdGlv
bl9hcm02NCgpIGhhbmRsZXMgbW9yZQo+IHRoYW4ganVzdCBhYXJjaDY0LCBtYXliZSByZW5hbWUg
dGhhdCBmdW5jdGlvbj8KIApNYWtlcyBzZW5zZSwgd2lsbCByZW5hbWUgaXQgdG8gbWF5X2dvdG9f
aW50ZXJhY3Rpb24gaW4gdjQuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkZlbmcgSmlhbmcKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
