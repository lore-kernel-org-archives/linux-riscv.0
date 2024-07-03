Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEF4C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 12:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPwr8Lykc98Yix1nK8xiOP17netGhU80r/DvlLOL2Qc=; b=M+dmq+zfiVS2Lk
	2g0ZUC7Gnc0DQpWpXzVkNyH5LZFVIyrJgp4BV2cAIM0bBnhG5uo6y0TosGvDovsF8UAJ00f7SPRhw
	ScBET795gW5E6FkeOx9dz3EpTzXf7Ti/lExqesbi4rC8LQZMNFD8qyailITrhm6hhC7FS0Pb4d31m
	go6gj9B7m84mcGdS4Wlf1ibaBUGZHe6VsiS6Ritk2LbB8eBScumD457wqw8THyP2khXlCIIMGvdVg
	4iN6QgdxwCvnXiumUmgmntThY+0ROoLclFcf6o9QOvSgr1j3xjNK5wJ3vqHv5L+BVUsoMuq5sd6U4
	Kh1AuE81jlZcCLeN89EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzB6-0000000AAP5-0oPp;
	Wed, 03 Jul 2024 12:33:40 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzB0-0000000AAMT-1WIM
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 12:33:38 +0000
Date: Wed, 3 Jul 2024 14:33:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1720010011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDPoLxI9NH/aFITSbCBsDGXY1dOCvCtqoSXbykJCa0c=;
	b=mfmP2bPKHWJoowzLNkm74Vig2mbb+Vzj3OqMHpv4RhltkyCiL0P18PVWQcZMS46PnvM37W
	o1KwoOppFuvndqXeTilmxoVnsRoXt80g0CEk4a5w9twbgqVCFgn8JPZCC5YvWW8jPebnJP
	lO77aBCKWycybtBMtYCsN9w9ycnssi6tHnzYXfBuSReab9UDuoYQ2BaYmTVb77lWRJOj6u
	nIV3Vho0RFD42SmnY5CwBkXvv64NeGFDnZPQ1Ri+obumSWJquPaWdFd9HQL5ngRr82m4WF
	zdBOZAFelA7x+RyQPzjTFIe9BkflltEhgyrdIP66xhBchJDgyWNXLNFy24Qdpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1720010011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vDPoLxI9NH/aFITSbCBsDGXY1dOCvCtqoSXbykJCa0c=;
	b=ga+ErfbMWebK9O1GxU2wc/vhhIwk8YtNz6H0DVC/gUeoNdMRrmGhvFx+6sQW1C6q9z6WkQ
	GQE5ko4H0HHy2lBw==
From: Nam Cao <namcao@linutronix.de>
To: Anup Patel <anup@brainfault.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	b.spranger@linutronix.de, Christoph Hellwig <hch@lst.de>,
	Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] irqchip/sifive-plic: Fix plic_set_affinity() only
 enables 1 cpu
Message-ID: <20240703123327.CvOiP2Jb@linutronix.de>
References: <20240703072659.1427616-1-namcao@linutronix.de>
 <CAAhSdy0ZGD-p0iBVPqHF0RKTwvAAMWwYZ0ufioRrO75JzSh1qQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0ZGD-p0iBVPqHF0RKTwvAAMWwYZ0ufioRrO75JzSh1qQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_053334_566523_1D3A1732 
X-CRM114-Status: GOOD (  22.20  )
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

T24gV2VkLCBKdWwgMDMsIDIwMjQgYXQgMDU6Mjg6MjNQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBXZWQsIEp1bCAzLCAyMDI0IGF0IDEyOjU34oCvUE0gTmFtIENhbyA8bmFtY2FvQGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+ID4KPiA+IHBsaWNfc2V0X2FmZmluaXR5KCkgb25seSBlbmFi
bGVzIGludGVycnVwdCBmb3IgdGhlIGZpcnN0IHBvc3NpYmxlIENQVSBpbgo+ID4gdGhlIG1hc2su
IFRoZSBwb2ludCBpcyB0byBwcmV2ZW50IGFsbCBDUFVzIHRyeWluZyB0byBjbGFpbSBhbiBpbnRl
cnJ1cHQsCj4gPiBidXQgb25seSBvbmUgQ1BVIHN1Y2NlZWRzIGFuZCB0aGUgb3RoZXIgQ1BVcyB3
YXN0ZWQgc29tZSBjbG9jayBjeWNsZXMgZm9yCj4gPiBub3RoaW5nLgo+ID4KPiA+IEhvd2V2ZXIs
IHRoZXJlIGFyZSB0d28gcHJvYmxlbXMgd2l0aCB0aGF0Ogo+ID4gMS4gVXNlcnMgY2Fubm90IGVu
YWJsZSBpbnRlcnJ1cHQgb24gbXVsdGlwbGUgQ1BVcyAoZm9yIGV4YW1wbGUsIHRvIG1pbmltaXpl
Cj4gPiBpbnRlcnJ1cHQgbGF0ZW5jeSkuCj4gCj4gV2VsbCwgeW91IGFyZSBhc3N1bWluZyB0aGF0
IG11bHRpcGxlIENQVXMgYXJlIGFsd2F5cyBpZGxlIG9yIGF2YWlsYWJsZQo+IHRvIHByb2Nlc3Mg
aW50ZXJydXB0cy4gSW4gb3RoZXIgd29yZHMsIGlmIHRoZSBzeXN0ZW0gaXMgbG9hZGVkIHJ1bm5p
bmcKPiBzb21lIHdvcmtsb2FkIG9uIGVhY2ggQ1BVIHRoZW4gcGVyZm9ybWFuY2Ugb24gbXVsdGlw
bGUgQ1BVcwo+IHdpbGwgZGVncmFkZSBzaW5jZSBtdWx0aXBsZSBDUFVzIHdpbGwgd2FzdGVmdWxs
eSB0cnkgdG8gY2xhaW0gaW50ZXJydXB0Lgo+IAo+IEluIHJlYWxpdHksIHdlIGNhbid0IG1ha2Ug
c3VjaCBhc3N1bXB0aW9ucyBhbmQgaXQgaXMgYmV0dGVyIHRvIHRhcmdldCBhCj4gcGFydGljdWxh
ciBDUFUgZm9yIHByb2Nlc3NpbmcgaW50ZXJydXB0cyAoanVzdCBsaWtlIHZhcmlvdXMgb3RoZXIg
aW50ZXJydXB0Cj4gY29udHJvbGxlcnMpLiBGb3IgYmFsYW5jaW5nIGludGVycnVwdCBwcm9jZXNz
aW5nIGxvYWQsIHdlIGhhdmUgc29mdHdhcmUKPiBpcnEgYmFsYW5jZXJzIHJ1bm5pbmcgaW4gdXNl
ci1zcGFjZSAob3Iga2VybmVsIHNwYWNlKSB3aGljaCBkbyBhCj4gcmVhc29uYWJseSBmaW5lIGpv
YiBvZiBwaWNraW5nIGFwcHJvcHJpYXRlIENQVSBmb3IgaW50ZXJydXB0IHByb2Nlc3NpbmcuCgpU
aGVuIHdlIHNob3VsZCBsZWF2ZSB0aGUgam9iIG9mIGRpc3RyaWJ1dGluZyBpbnRlcnJ1cHRzIHRv
IHRob3NlIHRvb2xzLApyaWdodD8gTm90IGFsbCB1c2UgY2FzZXMgd2FudCBtaW5pbWFsbHkgd2Fz
dGVkIENQVSBjeWNsZXMuIEZvciBleGFtcGxlLCBpZgphIHBhcnRpY3VsYXIgaW50ZXJydXB0IGRv
ZXMgbm90IGFycml2ZSB2ZXJ5IG9mdGVuLCBidXQgd2hlbiBpdCBkb2VzLCBpdApuZWVkcyB0byBi
ZSBoYW5kbGVkIGZhc3Q7IGluIHRoaXMgZXhhbXBsZSwgY2xlYXJseSBlbmFibGluZyB0aGlzIGlu
dGVycnVwdApmb3IgYWxsIENQVXMgaXMgc3VwZXJpb3IuCgpCdXQgSSBhbSBzdXJlIHRoZXJlIGFy
ZSB1c2VycyB3aG8gZG9uJ3QgdXNlIHNvbWV0aGluZyBsaWtlIGlycWJhbGFuY2UgYW5kCmp1c3Qg
bGV0IHRoZSBzeXN0ZW0gZG8gdGhlIGRlZmF1bHQgYmVoYXZpb3IuIFNvIEkgc2VlIHlvdXIgcG9p
bnQgb2Ygbm90Cndhc3RpbmcgQ1BVIGN5Y2xlcy4gU28sIGhvdyBhYm91dCB3ZSBrZWVwIHRoaXMg
cGF0Y2gsIGJ1dCBhbHNvIGFkZCBhCiJkZWZhdWx0IHBvbGljeSIgd2hpY2ggZXZlbmx5IGRpc3Ry
aWJ1dGVzIHRoZSBpbnRlcnJ1cHRzIHRvIGluZGl2aWR1YWxseQpDUFVzIChiZXN0IGVmZm9ydCBv
bmx5KS4gU29tZXRoaW5nIGxpa2UgdGhlIHVuLXRlc3RlZCBwYXRjaCBiZWxvdz8KCkJlc3QgcmVn
YXJkcywKTmFtCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5j
IGIvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCmluZGV4IGYzMGJkYjk0Y2VlYi4u
OTUzZjM3NTgzNWIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1wbGlj
LmMKKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCkBAIC0zMTIsNyArMzEy
LDcgQEAgc3RhdGljIGludCBwbGljX2lycWRvbWFpbl9tYXAoc3RydWN0IGlycV9kb21haW4gKmQs
IHVuc2lnbmVkIGludCBpcnEsCiAJaXJxX2RvbWFpbl9zZXRfaW5mbyhkLCBpcnEsIGh3aXJxLCAm
cGxpY19jaGlwLCBkLT5ob3N0X2RhdGEsCiAJCQkgICAgaGFuZGxlX2Zhc3Rlb2lfaXJxLCBOVUxM
LCBOVUxMKTsKIAlpcnFfc2V0X25vcHJvYmUoaXJxKTsKLQlpcnFfc2V0X2FmZmluaXR5KGlycSwg
JnByaXYtPmxtYXNrKTsKKwlpcnFfc2V0X2FmZmluaXR5KGlycSwgY3B1bWFza19vZihjcHVtYXNr
X2FueV9kaXN0cmlidXRlKCZwcml2LT5sbWFzaykpKTsKIAlyZXR1cm4gMDsKIH0KIAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
