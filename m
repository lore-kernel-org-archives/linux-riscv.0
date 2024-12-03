Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6EEE64A82
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 11:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nsa4nXldkjHeHCqz9d2EOlvvB222h0OvgUnnWZZu7FU=; b=uyOhmRLJCSkXhS
	mTy+faUAxHMaGub1NvRLpseBetNc05SPGQkxnN3Fe1EzDZGSZ3Zzk1yC/cWeA35PMmsXzgDSjS7qC
	3mT9imCJBRN4q5lu5IEHnmn4kw5Nzsd4aGw3UZBrlxoZPMQCpJzMWP7593piWT7ZCPZCypfEapu4m
	LOSg5qxK6HRHNCis7IFOlVp/6KhI6MGHFvYYk22FN4VF5rQ6hNxHT/wbZxZJOS1+UG3JPxCTzymMA
	kbCFXiH2G1CtT3U+ncrp/iKFld30gIFrNuPL+Yjie8PB491s5BUtLVTnQiMFdA4CIvkRXZ8/PXKsD
	lGY+18tahBDXNq0Zty/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRRb-00000009KUO-0gX4;
	Tue, 03 Dec 2024 11:51:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRPd-00000009K1u-0zGO
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 11:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6C9C5C6C70;
	Tue,  3 Dec 2024 11:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257EDC4CEDE;
	Tue,  3 Dec 2024 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733226592;
	bh=5UcwQIsn40BIxdhHcGTQTDp+iAklLtu32KB1efUjEP0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EHzPgPeGpADcqtB+nzAh6/4gOdxWmEBX62EIAAwIQZz49u3DB3zDevlgwVGv3NVDK
	 hys0rXPTPkwgaf6dc60Fh1Q8xydQWjJfh+RecyQ8ShoxW2/va2WrTVAFFIgwaXUgOS
	 lqUI246kZ7QHpcSWmSALaj4h/Dky0zw9lohK+wCm9ktUuPp/fPaD82SAL7q0KgDEFn
	 ZE4GL8m7CAjLKuPkfmkp2rqi1+8K5ttdU6Rz/EKIX3PEkeJ17o0n3o8FI6h5ewrGli
	 ssjh4P89ACmzAlUxFuFVePtodkuIv9PFOXk/6pxfSgz8n6/wcqejwTr9pm4JoIhBHT
	 PYgXoTYn/7vKg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Xu Lu <luxu.kernel@bytedance.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: lihangjing@bytedance.com, xieyongji@bytedance.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Xu Lu
 <luxu.kernel@bytedance.com>
Subject: Re: [PATCH] riscv: mm: Fix alignment of phys_ram_base
In-Reply-To: <20241202101601.48284-1-luxu.kernel@bytedance.com>
References: <20241202101601.48284-1-luxu.kernel@bytedance.com>
Date: Tue, 03 Dec 2024 12:49:49 +0100
Message-ID: <871pypq942.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_034953_314280_631066C7 
X-CRM114-Status: GOOD (  19.68  )
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

WHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+IHdyaXRlczoKCj4gVGhpcyBjb21taXQg
Zml4ZXMgdGhlIGFsaWdubWVudCBvZiBwaHlzX3JhbV9iYXNlIGluIFJJU0MtVi4KPgo+IEluIHNw
YXJzZSB2bWVtbWFwIG1vZGVsLCB0aGUgdmlydHVhbCBhZGRyZXNzIG9mIHZtZW1tYXAgaXMgY2Fs
Y3VsYXRlZCBhczoKPiAnKHN0cnVjdCBwYWdlICopVk1FTU1BUF9TVEFSVCAtIChwaHlzX3JhbV9i
YXNlID4+IFBBR0VfU0hJRlQpJy4KPiBBbmQgdGhlIHN0cnVjdCBwYWdlJ3MgdmEgY2FuIGJlIGNh
bGN1bGF0ZWQgd2l0aCBhbiBvZmZzZXQ6Cj4gJ3ZtZW1tYXAgKyAocGZuKScuCj4KPiBIb3dldmVy
LCB3aGVuIGluaXRpYWxpemluZyBzdHJ1Y3QgcGFnZXMsIGtlcm5lbCBhY3R1YWxseSBzdGFydHMg
ZnJvbSB0aGUKPiBmaXJzdCBwYWdlIGZyb20gdGhlIHNhbWUgc2VjdGlvbiB0aGF0IHBoeXNfcmFt
X2Jhc2UgYmVsb25ncyB0by4gSWYgdGhlCj4gZmlyc3QgcGFnZSdzIHBoeXNpY2FsIGFkZHJlc3Mg
aXMgbm90ICdwaHlzX3JhbV9iYXNlID4+IFBBR0VfU0hJRlQnLCB0aGVuCj4gd2UgZ2V0IGFuIHZh
IGJlbG93IFZNRU1NQVBfU1RBUlQgd2hlbiBjYWxjdWxhdGluZyB2YSBmb3IgaXQncyBzdHJ1Y3Qg
cGFnZS4KCk5pY2UgY2F0Y2ghIEkgbWFuYWdlZCB0byByZXByb2R1Y2UgdGhpcyBvbiBhIGhhY2tl
ZCBxZW11IHZpcnQgbWFjaGluZS4KCj4gRm9yIGV4YW1wbGUsIGlmIHBoeXNfcmFtX2Jhc2Ugc3Rh
cnRzIGZyb20gMHg4MjAwMDAwMCB3aXRoIHBmbiAweDgyMDAwLCB0aGUKPiBmaXJzdCBwYWdlIGlu
IHRoZSBzYW1lIHNlY3Rpb24gaXMgYWN0dWFsbHkgcGZuIDB4ODAwMDAuIER1cmluZwo+IGluaXRf
dW5hdmFpbGFnZV9yYW5nZSwgd2Ugd2lsbCBpbml0aWFsaXplIHN0cnVjdCBwYWdlIGZvciBwZm4g
MHg4MDAwMAoKImluaXRfdW5hdmFpbGFibGVfcmFuZ2UoKSIgc3BlbGxpbmcgZm9yIGdyZXBwYWJp
bGl0eS4KCj4gd2l0aCB2aXJ0dWFsIGFkZHJlc3MgJyhzdHJ1Y3QgcGFnZSAqKVZNRU1NQVBfU1RB
UlQgLSAweDIwMDAnLCB3aGljaCBpcwo+IGJlbG93IFZNRU1NQVBfU1RBUlQgYXMgd2VsbCBhcyBQ
Q0lfSU9fRU5ELgo+Cj4gVGhpcyBjb21taXQgZml4ZXMgdGhpcyBidWcgYnkgYWxpZ25pbmcgcGh5
c19yYW1fYmFzZSB3aXRoIFNFQ1RJT05fU0laRS4KPgo+IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxs
dXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgoKUGxlYXNlIGFkZCBhIGZpeGVzIHRhZy4KCj4gLS0t
Cj4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9t
bS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IGluZGV4IDBlOGMyMGFkY2Q5OC4uOTg2
NmRlMjY3Yjc0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gKysrIGIvYXJj
aC9yaXNjdi9tbS9pbml0LmMKPiBAQCAtNTksNiArNTksOCBAQCBFWFBPUlRfU1lNQk9MKHBndGFi
bGVfbDRfZW5hYmxlZCk7Cj4gIEVYUE9SVF9TWU1CT0wocGd0YWJsZV9sNV9lbmFibGVkKTsKPiAg
I2VuZGlmCj4gIAo+ICsjZGVmaW5lIFJJU0NWX01FTVNUQVJUX0FMSUdOCSgxVUwgPDwgU0VDVElP
Tl9TSVpFX0JJVFMpCj4gKwo+ICBwaHlzX2FkZHJfdCBwaHlzX3JhbV9iYXNlIF9fcm9fYWZ0ZXJf
aW5pdDsKPiAgRVhQT1JUX1NZTUJPTChwaHlzX3JhbV9iYXNlKTsKPiAgCj4gQEAgLTI0MSw3ICsy
NDMsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfYm9vdG1lbSh2b2lkKQo+ICAJICogYXQg
d29yc3QsIHdlIG1hcCB0aGUgbGluZWFyIG1hcHBpbmcgd2l0aCBQTUQgbWFwcGluZ3MuCj4gIAkg
Ki8KPiAgCWlmICghSVNfRU5BQkxFRChDT05GSUdfWElQX0tFUk5FTCkpCj4gLQkJcGh5c19yYW1f
YmFzZSA9IG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0oKSAmIFBNRF9NQVNLOwo+ICsJCXBoeXNfcmFt
X2Jhc2UgPSByb3VuZF9kb3duKG1lbWJsb2NrX3N0YXJ0X29mX0RSQU0oKSwKPiArCQkJCQkgICBS
SVNDVl9NRU1TVEFSVF9BTElHTik7CgpObyBuZWVkIHRvIHdyYXAgdGhpcyBsaW5lLiBBbHNvLCBp
cyB0aGUgUklTQ1ZfTUVNU1RBUlRfQUxJR04gZGVmaW5lCnJlYWxseSBuZWVkZWQ/CgpUaGUga2Vy
bmVsIHRlc3Qgcm9ib3QgaGFkIHNvbWUgYnVpbGQgaXNzdWVzIGFzIHdlbGwhCgoKQmrDtnJuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
