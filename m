Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EC2C3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 12:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HeWAuIN1HB+pI7GXOqgrs0cxSEgBbbQsKZSLH4pFlMo=; b=xqUvPG9jD507Ui
	o6tigOU4y3TGrJmwasJuRiUSKlYGBgFqad5FreyOjJRYmgbHWyVkjJz8BcDh3+KmNnlHY4tZm4iQv
	gDApSAXlwdExklEInuq3OgHbGmow1VVpuYgYw5sCzVZbcsmFlnpEOfdfzhthCAH+GON3VGYX4aC4B
	luutW+YM61e4K02J/GU/FOyHWsVJSWycSqsyEFc5NfzFGocl0S35GtuBRMEkVbc4lvJaKgP4ajXMC
	8I1GcwT1NBMFGWPFY2fn1LRKa8W9oyEq/1KaqgiQs8D/7Mfd7ZrhJoekM36k6PcDEynwZ30lMW+CB
	16y/RgIjF6zPxVNR9UCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTKyD-000000073Fs-2Mnh;
	Mon, 15 Jul 2024 12:38:21 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTKyA-000000073FQ-3r2T
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 12:38:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 418F624000E;
	Mon, 15 Jul 2024 12:38:14 +0000 (UTC)
Message-ID: <2b83b202-862d-4e9d-96c4-206d7698d76b@ghiti.fr>
Date: Mon, 15 Jul 2024 14:38:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/purgatory: align riscv_kernel_entry
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Daniel Maslowski <cyrevolt@googlemail.com>,
 linux-riscv@lists.infradead.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Daniel Maslowski <cyrevolt@gmail.com>
References: <20240709012606.748596-1-cyrevolt@gmail.com>
 <12cbeb6e-7f26-4104-bd95-9f65ce7bd635@ghiti.fr>
In-Reply-To: <12cbeb6e-7f26-4104-bd95-9f65ce7bd635@ghiti.fr>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_053819_122247_474E2D64 
X-CRM114-Status: GOOD (  15.06  )
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

T24gMTUvMDcvMjAyNCAxMzo0NiwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIERhbmllbCwK
Pgo+IE9uIDA5LzA3LzIwMjQgMDM6MjYsIERhbmllbCBNYXNsb3dza2kgd3JvdGU6Cj4+IFdoZW4g
YWxpZ25tZW50IGhhbmRsaW5nIGlzIGRlbGVnYXRlZCB0byB0aGUga2VybmVsLCBldmVyeXRoaW5n
IG11c3QgYmUKPj4gd29yZC1hbGlnbmVkIGluIHB1cmdhdG9yeSwgc2luY2UgdGhlIHRyYXAgaGFu
ZGxlciBpcyB0aGVuIHNldCB0byB0aGUKPj4ga2V4ZWMgb25lLiBXaXRob3V0IHRoZSBhbGlnbm1l
bnQsIGhpdHRpbmcgdGhlIGV4Y2VwdGlvbiB3b3VsZAo+PiB1bHRpbWF0ZWx5IGNyYXNoLiBPbiBv
dGhlciBvY2Nhc2lvbnMsIHRoZSBrZXJuZWwncyBoYW5kbGVyIHdvdWxkIHRha2UKPj4gY2FyZSBv
ZiBleGNlcHRpb25zLgo+PiBUaGlzIGhhcyBiZWVuIHRlc3RlZCB3aXRoIG9yZWJvb3QgYW5kIGl0
cyBTQkkgZGVsZWdhdGluZyB1bmFsaWduZWQKPj4gYWNjZXNzIGV4Y2VwdGlvbnMgYW5kIHRoZSBr
ZXJuZWwgY29uZmlndXJlZCB0byBoYW5kbGUgdGhlbS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIE1hc2xvd3NraSA8Y3lyZXZvbHRAZ21haWwuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNj
di9wdXJnYXRvcnkvZW50cnkuUyB8IDEgKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvcHVyZ2F0b3J5L2VudHJ5LlMgYi9h
cmNoL3Jpc2N2L3B1cmdhdG9yeS9lbnRyeS5TCj4+IGluZGV4IDViY2YzYWY5MDNkYS4uMjkxMjE2
NTBhOTQxIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9lbnRyeS5TCj4+ICsr
KyBiL2FyY2gvcmlzY3YvcHVyZ2F0b3J5L2VudHJ5LlMKPj4gQEAgLTM0LDYgKzM0LDcgQEAgU1lN
X0NPREVfRU5EKHB1cmdhdG9yeV9zdGFydCkKPj4gwqAgwqAgLmRhdGEKPj4gwqAgKy5hbGlnbiA0
Cj4KPgo+IElJUkMsIC5hbGlnbiBvbiByaXNjdiB0YWtlcyBhIHBvd2VyIG9mIHR3byBhcyBhcmd1
bWVudCwgd2hpY2ggbWVhbnMgCj4geW91IGFsaWduIHJpc2N2X2tlcm5lbF9lbnRyeSBzeW1ib2wg
dG8gMTZCIGhlcmUsIGFueSByZWFzb24gZm9yIHRoaXMgCj4gYWxpZ25tZW50PyBJIGd1ZXNzIHlv
dSB3YW50IDRCIG9uIHJ2MzIgYW5kIDhCIG9uIHJ2NjQgcmlnaHQ/IEluIHRoYXQgCj4gY2FzZSwg
dGhlIGJlc3QgaGVyZSB3b3VsZCBiZSB0byB1c2UgTEdSRUcgCj4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS5o
I0wyOQo+Cj4gVGhhbmtzLAo+Cj4gQWxleAo+Cj4KPj4gwqAgU1lNX0RBVEEocmlzY3Zfa2VybmVs
X2VudHJ5LCAucXVhZCAwKQo+PiDCoCDCoCAuZW5kCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKQW5kIHNpbmNlIHRoaXMgaXMgYSBmaXgs
IGNhbiB5b3UgYWRkIGEgRml4ZXMgdGFnIHBsZWFzZT8KClRoYW5rcywKCkFsZXgKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
