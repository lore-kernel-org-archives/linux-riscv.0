Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAA0C4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ss4KTgmEAZXR9Ej/evrEHxkJrOQJNMBpBDXRYdcKADM=; b=N/clGMllTYgdra
	4+UMDaHLM9nXhSMhcHwGfWtXUMe/pp1WDhZkzwzGqrVHsKzquJePDDN+u/mjySgipVTNPRhjbsioC
	oITWX4mQOv8CtROYUk76aBu94mTyjDOPEaU3jhdVAS0BZM7k4xueOeYQMx8BK7TPKSzE5rgAbrU1U
	QZduIvJ+JYy+kZrp1KofRNgwaWBvDAC92vnIZERiw8bW2A6tsOaWeD1gCWqYxah0UjUjRVjMDb55n
	CIDYZvlCQNSHXPn8Ygpat535a057vJgnNREnyI7HweI9UQq6yeHpqmCOvLB+fI37eFJi1yOJSkSsT
	snyD/3D4naFEi1Ml5/aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHdd-0000000Gm2c-3HGj;
	Thu, 16 Jul 2026 08:40:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHdc-0000000Gm2U-2oC4
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 08:40:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AEFF160054;
	Thu, 16 Jul 2026 08:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93601F00A3A;
	Thu, 16 Jul 2026 08:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784191211;
	bh=1qGYz+P3LBTYY4lqZ9Zhy3LPOk8R0ED0gCCmiSwGKck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=f/TJ4nbjQCqXI1omOteC2TYbo6r5M0zldVEySpvhbsFDQFGzy2Kca2CMIk7c+axwe
	 iefAC/8RodCLuOM2wqTCAZXEQDWC2P+W8OFLexG6SL8NNSdSfCLl/jBGxsf1Id657H
	 DUIAWKf4cpi6CoJg5MrIN1qd1POVfHdILoRGWXJpM6JmV4ONeSe2wzTlHKZxZKhsk/
	 3NlVagn5PZEcteDbnXjRcLrMxDZmyeovsF9iN6n0/5wg/Uu4/ZVx7sMGeA0fY0fg/+
	 4EPF9pKZLwtOOXQqw7FsPWwA8NmJxGAWiCxw32E5cOsKdJF2s7hl9EH/8DDW0A9eAx
	 VqE87F0M3l1kQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song
 Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Pu Lehui
 <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Feng Jiang
 <jiangfeng@kylinos.cn>
Subject: Re: [PATCH v2] bpf, riscv: fix missing extable entry for arena
 load_acquire
In-Reply-To: <20260716-bpf-riscv-fix-extable-v2-1-421f75812533@kylinos.cn>
References: <20260716-bpf-riscv-fix-extable-v2-1-421f75812533@kylinos.cn>
Date: Thu, 16 Jul 2026 10:40:08 +0200
Message-ID: <87wluvuy3b.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

RmVuZyBKaWFuZyA8amlhbmdmZW5nQGt5bGlub3MuY24+IHdyaXRlczoKCj4gZW1pdF9hdG9taWNf
bGRfc3QoKSByZXR1cm5zIDEgdG8gaGF2ZSBidWlsZF9ib2R5KCkgc2tpcCB0aGUgemV4dCBhZnRl
cgo+IGEgc3ViLXdvcmQgbG9hZF9hY3F1aXJlLiBUaGUgY2FsbGVyIGRvZXMgInJldCA9IHJldCA/
Ogo+IGFkZF9leGNlcHRpb25faGFuZGxlciguLi4pIiwgd2hpY2ggc2tpcHMgYWRkX2V4Y2VwdGlv
bl9oYW5kbGVyKCkgb24gYW55Cj4gbm9uLXplcm8gcmV0LCBzbyB0aGUgZXh0YWJsZSBlbnRyeSBp
cyBtaXNzaW5nIGFuZCBhIGZhdWx0aW5nCj4gUFJPQkVfQVRPTUlDIGxvYWRfYWNxdWlyZSBvb3Bz
ZXMuCj4KPiBDaGVjayByZXQgPj0gMCBiZWZvcmUgY2FsbGluZyBhZGRfZXhjZXB0aW9uX2hhbmRs
ZXIoKSwgYW5kIHJldHVybiByZXQKPiB1bmNoYW5nZWQgc28gYnVpbGRfYm9keSgpIHN0aWxsIHNr
aXBzIHRoZSB6ZXh0Lgo+Cj4gRml4ZXM6IGZiN2NlZmFiYWU4MSAoInJpc2N2LCBicGY6IEFkZCBz
dXBwb3J0IGFyZW5hIGF0b21pY3MgZm9yIFJWNjQiKQo+IFN1Z2dlc3RlZC1ieTogUHUgTGVodWkg
PHB1bGVodWlAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBGZW5nIEppYW5nIDxqaWFuZ2Zl
bmdAa3lsaW5vcy5jbj4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gRHJvcCBleHRyYSB2YXJp
YWJsZSBhcyBzdWdnZXN0ZWQgYnkgUHUgTGVodWkuCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjYwNzE2LWJwZi1yaXNjdi1maXgtZXh0YWJsZS12MS0xLWFmMDIz
Y2MxN2FmNEBreWxpbm9zLmNuCj4gLS0tCj4gIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0
LmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIGIv
YXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+IGluZGV4IGY5ZDUzNDdiYTk2Ni4uMGRi
ODkwOTNmZjg5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMK
PiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gQEAgLTE5ODYsNyArMTk4
NiwxMCBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNuICppbnNu
LCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKPiAgCQllbHNlCj4gIAkJCXJldCA9IGVtaXRf
YXRvbWljX3JtdyhyZCwgcnMsIGluc24sIGN0eCk7Cj4gIAo+IC0JCXJldCA9IHJldCA/OiBhZGRf
ZXhjZXB0aW9uX2hhbmRsZXIoaW5zbiwgUkVHX0RPTlRfQ0xFQVJfTUFSS0VSLCBjdHgpOwo+ICsJ
CS8qIHJldCBjYW4gYmUgMSAoc2tpcC16ZXh0KTsgZXh0YWJsZSBlbnRyeSBzdGlsbCBuZWVkcyB0
byBiZSBhZGRlZCAqLwo+ICsJCWlmIChyZXQgPj0gMCkKPiArCQkJcmV0ID0gYWRkX2V4Y2VwdGlv
bl9oYW5kbGVyKGluc24sIFJFR19ET05UX0NMRUFSX01BUktFUiwgY3R4KSA/OiByZXQ7CgpJIGRv
bid0IGFncmVlIHdpdGggU2FzaGlrbyB0aGF0IHRoaXMgd2FzIGZ1bGx5IHByZS1leGlzdGluZy4g
VGhpcyBmaXgKY2hhbmdlcyB0aGUgZXhpc3RpbmcgYmVoYXZpb3VyIG9mIEJQRl9EVyB8IEJQRl9M
T0FEX0FDUS4gV2UgY2FuIG5vdyBlbmQKdXAgd2l0aCBzdGFsZSByZWdpc3RlciBkYXRhLgoKSSdk
IGxpa2UgdG8gc2VlIGEgdjMgdGhhdCBhZGRyZXNzZXMgUkVHX0RPTlRfQ0xFQVJfTUFSS0VSIGZv
ciBhdG9taWMKbG9hZHMgKHpleHQgaW5jbHVkZWQpLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
