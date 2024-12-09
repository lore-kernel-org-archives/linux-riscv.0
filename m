Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59ECE7717D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 13:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOxsqPKM2Pp1U7VjzwQksV+aX8lVDcYy90VzpAJxMac=; b=hdQBfq9mqCLDK2
	BvBWe2mVMQl45GtKjVRhC7YRD1Yjex1jjlHfgnJ7srd/qqOfb2aR2xOLn/eK8dY/pwOHAX/eqyEUD
	vqRZRLsTvPZxtb7jcxjfkPEMD+RZ1uSU/kBxRXxdmTmt+GAD6iM5AJxooOoJY1VoIOdJwC57lS9vN
	BPe0RcQYg2C/8F7/lnERcob55kg6rf/39+7L2yfz36GMVdzTzCzzp6PIdXyyxGOUeCoTIdAlpZxtA
	4A2DxWlAPGwIrnBRuDWugb6MicMefT3M7r0UH80zjxAyhRIkmlHRoLfbNAVzNPZg4a+q4kgKVbQQk
	T9W/Avfo7lIdIW5vpbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdkd-00000007xz4-0mbq;
	Mon, 09 Dec 2024 13:24:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdXH-00000007tNg-1hjn
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 13:10:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19D52A41507;
	Mon,  9 Dec 2024 13:08:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05009C4CEDD;
	Mon,  9 Dec 2024 13:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733749850;
	bh=55YEyJVUZ+5Y5/XJDnP+9mjqMg06KWMzQ0/tsjFl5RA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IyTWFuubcBBCb+QXnGxAImTSR05A0ZNLKM83An0ajlmcmkVvzIvSkdTzA7bAGtC6F
	 98/aZVXpWXGAjsNsqULzKfRZEDG3X9dC9Tq2zK/S/nMxh8nCuQlqwGd1H8o7uoZZdP
	 GZ2CHPCGEhlq0qvgY5yo79DXeJotErG9vt+N/zyBKy3T24gVVfOkRWnYCi3XPjdjad
	 TNGOGgNv2Y5TyFMJz+WFqfA74IohmTCK+o6d5GKJZLGDVZbYPzc3dTzxmbz8vGfxf/
	 RC/i9X+vLtNEVu0yYnrtuopyEOWJwvNbT8C7tw0m0BbID/0uHpjMStJbzEOeDMhvWm
	 j/e3+dODuBACA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Xu Lu <luxu.kernel@bytedance.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alexghiti@rivosinc.com, bjorn@rivosinc.com
Cc: lihangjing@bytedance.com, xieyongji@bytedance.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Xu Lu
 <luxu.kernel@bytedance.com>
Subject: Re: [PATCH v4] riscv: mm: Fix the out of bound issue of vmemmap
 address
In-Reply-To: <20241209122617.53341-1-luxu.kernel@bytedance.com>
References: <20241209122617.53341-1-luxu.kernel@bytedance.com>
Date: Mon, 09 Dec 2024 14:10:47 +0100
Message-ID: <87r06h3stk.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_051051_512148_20F27AD5 
X-CRM114-Status: GOOD (  10.62  )
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

WHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+IHdyaXRlczoKCj4gSW4gc3BhcnNlIHZt
ZW1tYXAgbW9kZWwsIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgb2Ygdm1lbW1hcCBpcyBjYWxjdWxhdGVk
IGFzOgo+ICgoc3RydWN0IHBhZ2UgKilWTUVNTUFQX1NUQVJUIC0gKHBoeXNfcmFtX2Jhc2UgPj4g
UEFHRV9TSElGVCkpLgo+IEFuZCB0aGUgc3RydWN0IHBhZ2UncyB2YSBjYW4gYmUgY2FsY3VsYXRl
ZCB3aXRoIGFuIG9mZnNldDoKPiAodm1lbW1hcCArIChwZm4pKS4KPgo+IEhvd2V2ZXIsIHdoZW4g
aW5pdGlhbGl6aW5nIHN0cnVjdCBwYWdlcywga2VybmVsIGFjdHVhbGx5IHN0YXJ0cyBmcm9tIHRo
ZQo+IGZpcnN0IHBhZ2UgZnJvbSB0aGUgc2FtZSBzZWN0aW9uIHRoYXQgcGh5c19yYW1fYmFzZSBi
ZWxvbmdzIHRvLiBJZiB0aGUKPiBmaXJzdCBwYWdlJ3MgcGh5c2ljYWwgYWRkcmVzcyBpcyBub3Qg
KHBoeXNfcmFtX2Jhc2UgPj4gUEFHRV9TSElGVCksIHRoZW4KPiB3ZSBnZXQgYW4gdmEgYmVsb3cg
Vk1FTU1BUF9TVEFSVCB3aGVuIGNhbGN1bGF0aW5nIHZhIGZvciBpdCdzIHN0cnVjdCBwYWdlLgo+
Cj4gRm9yIGV4YW1wbGUsIGlmIHBoeXNfcmFtX2Jhc2Ugc3RhcnRzIGZyb20gMHg4MjAwMDAwMCB3
aXRoIHBmbiAweDgyMDAwLCB0aGUKPiBmaXJzdCBwYWdlIGluIHRoZSBzYW1lIHNlY3Rpb24gaXMg
YWN0dWFsbHkgcGZuIDB4ODAwMDAuIER1cmluZwo+IGluaXRfdW5hdmFpbGFibGVfcmFuZ2UoKSwg
d2Ugd2lsbCBpbml0aWFsaXplIHN0cnVjdCBwYWdlIGZvciBwZm4gMHg4MDAwMAo+IHdpdGggdmly
dHVhbCBhZGRyZXNzICgoc3RydWN0IHBhZ2UgKilWTUVNTUFQX1NUQVJUIC0gMHgyMDAwKSwgd2hp
Y2ggaXMKPiBiZWxvdyBWTUVNTUFQX1NUQVJUIGFzIHdlbGwgYXMgUENJX0lPX0VORC4KPgo+IFRo
aXMgY29tbWl0IGZpeGVzIHRoaXMgYnVnIGJ5IGludHJvZHVjaW5nIGEgbmV3IHZhcmlhYmxlCj4g
J3ZtZW1tYXBfc3RhcnRfcGZuJyB3aGljaCBpcyBhbGlnbmVkIHdpdGggbWVtb3J5IHNlY3Rpb24g
c2l6ZSBhbmQgdXNpbmcKPiBpdCB0byBjYWxjdWxhdGUgdm1lbW1hcCBhZGRyZXNzIGluc3RlYWQg
b2YgcGh5c19yYW1fYmFzZS4KPgo+IEZpeGVzOiBhMTFkZDQ5ZGNiOTMgKCJyaXNjdjogU3BhcnNl
LU1lbW9yeS92bWVtbWFwIG91dC1vZi1ib3VuZHMgZml4IikKPiBTaWduZWQtb2ZmLWJ5OiBYdSBM
dSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KClZlcmlmaWVkIHRoYXQgdGhlIGtlcm5lbCBp
cyBub3QgdHJ5aW5nIHRvIGFjY2VzcyB2bWVtbWFwL3N0cnVjdCBwYWdlcwpiZWxvdyBWTUVNTUFQ
X1NUQVJULgoKVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClJl
dmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
