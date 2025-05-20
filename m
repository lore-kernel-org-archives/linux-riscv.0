Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DC8C54756
	for <linux-riscv@archiver.kernel.org>; Tue, 20 May 2025 17:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gAt0KEhHPWIA9v8RRpcaVupRkCdPCy6Y7lE+9Hz7UI=; b=GrDG0iM5eQD86Y
	ZNcjI7AG73xpr3FJxtMecFT+1Dk+DWMNuByg10RgJ335C2uWw8p8MpUJWeA6xjvgdq64q8YXFc5/u
	q1qwP95GPxfGtDQdE9ZmluO/99zpjFWpoOCf+sIUWXFCC7iZ8e7vQmAhYT8l2Bnmb/qSnSb3/S3KX
	sqZUr5co37GafQRo6Z/z/vQrKQj56CJF/eqIDTTD4ZqG+sgkiLyHN3JGnu6u51qGEvRTnBEXNfBdx
	PvhNW+uHjnB5P8zq7hdPqACpMhIP6HpwEdVNDfH8C4Ab0uRMPBsNDj47lxcSGZ4XtNh2P4voIo2+W
	gPrIixxyXfj86fBaFcsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQw7-0000000DhKC-3LY8;
	Tue, 20 May 2025 17:39:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQtx-0000000Dh1q-2RRA;
	Tue, 20 May 2025 17:37:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40D575C59AF;
	Tue, 20 May 2025 17:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BB4C4CEE9;
	Tue, 20 May 2025 17:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747762635;
	bh=0b42x+ivEyP5l3OMfgQmSLjAq9HIV5l+NtIDagsDl20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AkojSDDkAIrmtRBD4USDtEmsYxmSm8dpmPU33ULoquAZvqEMe8zz5SFVjDJPs5aST
	 UuQQ9BKPpRJRfnZPMMqLjFvS0mZjwiK9Z6QSRu6M2dNUQ4BsLHlbvp8O/9gtqVz0NU
	 KpcJll/+OLCCbkgqPv8HZHS/4lvjga7kkK5Wpw688Jj9UTWI9/Rbww4ayzjszSXLyR
	 a+epo8/UEJ0UuDKOVAPLBGwBY3weSQdcc5nIVsg4E4B+sknxeC04gBdH9awZ7RGO6p
	 PKBo3QfqNS59dFCVeA6Z9USSFeVHo12jnLII6MgoHQBUDvt5DUKCOu8WiZyapgAXVe
	 fROaenPCO1gog==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Himanshu
 Chauhan
 <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Xu Lu
 <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v4 0/4] riscv: add support for SBI Supervisor Software
 Events
In-Reply-To: <20250516152355.560448-1-cleger@rivosinc.com>
References: <20250516152355.560448-1-cleger@rivosinc.com>
Date: Tue, 20 May 2025 19:37:12 +0200
Message-ID: <87sekzi3p3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_103717_705875_41A9A918 
X-CRM114-Status: GOOD (  29.11  )
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

Q2zDqW1lbnQhCgpDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+IHdyaXRlczoK
Cj4gVGhlIFNCSSBTdXBlcnZpc29yIFNvZnR3YXJlIEV2ZW50cyAoU1NFKSBleHRlbnNpb25zIHBy
b3ZpZGVzIGEgbWVjaGFuaXNtCj4gdG8gaW5qZWN0IHNvZnR3YXJlIGV2ZW50cyBmcm9tIGFuIFNC
SSBpbXBsZW1lbnRhdGlvbiB0byBzdXBlcnZpc29yCj4gc29mdHdhcmUgc3VjaCB0aGF0IGl0IHBy
ZWVtcHRzIGFsbCBvdGhlciBzdXBlcnZpc29yIGxldmVsIHRyYXBzIGFuZAo+IGludGVycnVwdHMu
IFRoaXMgZXh0ZW5zaW9uIGlzIGludHJvZHVjZWQgYnkgdGhlIFNCSSB2My4wIHNwZWNpZmljYXRp
b25bMV0uCj4KPiBWYXJpb3VzIGV2ZW50cyBhcmUgZGVmaW5lZCBhbmQgY2FuIGJlIHNlbmQgYXN5
bmNocm9ub3VzbHkgdG8gc3VwZXJ2aXNvcgo+IHNvZnR3YXJlIChSQVMsIFBNVSwgREVCVUcsIEFz
eW5jaHJvbm91cyBwYWdlIGZhdWx0KSBmcm9tIFNCSSBhcyB3ZWxsCj4gYXMgcGxhdGZvcm0gc3Bl
Y2lmaWMgZXZlbnRzLiBFdmVudHMgY2FuIGJlIGVpdGhlciBsb2NhbCAocGVyLWhhcnQpIG9yCj4g
Z2xvYmFsLiBFdmVudHMgY2FuIGJlIG5lc3RlZCBvbiB0b3Agb2YgZWFjaCBvdGhlciBiYXNlZCBv
biBwcmlvcml0eSBhbmQKPiBjYW4gaW50ZXJydXB0IHRoZSBrZXJuZWwgYXQgYW55IHRpbWUuCj4K
PiBGaXJzdCBwYXRjaCBhZGRzIHRoZSBTU0UgZGVmaW5pdGlvbnMuIFNlY29uZCBvbmUgYWRkcyBz
dXBwb3J0IGZvciBTU0UKPiBhdCBhcmNoIGxldmVsIChlbnRyeSBjb2RlIGFuZCBzdGFjayBhbGxv
Y2F0aW9ucykgYW5kIHRoaXJkIG9uZSBhdCBkcml2ZXIKPiBsZXZlbC4gRmluYWxseSwgdGhlIGxh
c3QgcGF0Y2ggYWRkIHN1cHBvcnQgZm9yIFNTRSBldmVudHMgaW4gdGhlIFNCSSBQTVUKPiBkcml2
ZXIuIEFkZGl0aW9uYWwgdGVzdGluZyBmb3IgdGhhdCBwYXJ0IGlzIGhpZ2hseSB3ZWxjb21lZCBz
aW5jZSB0aGVyZQo+IGFyZSBhIGxvdCBvZiBwb3NzaWJsZSBwYXRoIHRoYXQgbmVlZHMgdG8gYmUg
ZXhlcmNpc2VkLgo+Cj4gQW1vbmdzdCB0aGUgc3BlY2lmaWMgcG9pbnRzIHRoYXQgbmVlZHMgdG8g
YmUgaGFuZGxlIGlzIHRoZSBpbnRlcnJ1cHRpb24KPiBhdCBhbnkgcG9pbnQgb2YgdGhlIGtlcm5l
bCBleGVjdXRpb24gYW5kIG1vcmUgc3BlY2lmaWNhbGx5IGF0IHRoZQo+IGJlZ2lubmluZyBvZiBl
eGNlcHRpb24gaGFuZGxpbmcuIER1ZSB0byB0aGUgZmFjdCB0aGF0IHRoZSBleGNlcHRpb24gZW50
cnkKPiBpbXBsZW1lbnRhdGlvbiB1c2VzIHRoZSBTQ1JBVENIIENTUiBhcyBib3RoIHRoZSBjdXJy
ZW50IHRhc2sgc3RydWN0IGFuZAo+IGFzIHRoZSB0ZW1wb3JhcnkgcmVnaXN0ZXIgdG8gc3dpdGNo
IHRoZSBzdGFjayBhbmQgc2F2ZSByZWdpc3RlciwgaXQgaXMKPiBkaWZmaWN1bHQgdG8gcmVsaWFi
bHkgZ2V0IHRoZSBjdXJyZW50IHRhc2sgc3RydWN0IGlmIHdlIGdldCBpbnRlcnJ1cHRlZAo+IGF0
IHRoaXMgc3BlY2lmaWMgbW9tZW50IChpZSwgaXQgbWlnaHQgY29udGFpbiAwLCB0aGUgdGFzayBw
b2ludGVyIG9yIHRwKS4KPiBBIGZpeHVwLWxpa2UgbWVjaGFuaXNtIGlzIG5vdCBwb3NzaWJsZSBk
dWUgdG8gdGhlIG5lc3RlZCBuYXR1cmUgb2YgU1NFCj4gd2hpY2ggbWFrZXMgaXQgcmVhbGx5IGhh
cmQgdG8gb2J0YWluIHRoZSBvcmlnaW5hbCBpbnRlcnJ1cHRpb24gc2l0ZS4gSW4KPiBvcmRlciB0
byByZXRyaWV2ZSB0aGUgdGFzayBpbiBhIHJlbGlhYmxlIG1hbm5lciwgYWRkIGFuIGFkZGl0aW9u
YWwKPiBfX3NzZV9lbnRyeV90YXNrIHBlcl9jcHUgYXJyYXkgd2hpY2ggc3RvcmVzIHRoZSBjdXJy
ZW50IHRhc2suIElkZWFsbHksCj4gd2Ugd291bGQgbmVlZCB0byBtb2RpZnkgdGhlIHdheSB3ZSBy
ZXRyaWV2ZS9zdG9yZSB0aGUgY3VycmVudCB0YXNrIGluCj4gZXhjZXB0aW9uIGhhbmRsaW5nIHNv
IHRoYXQgaXQgZG9lcyBub3QgZGVwZW5kIG9uIHRoZSBwbGFjZSB3aGVyZSBpdCdzCj4gaW50ZXJy
dXB0ZWQuCj4KPiBDb250cmFyeSB0byBwc2V1ZG8gTk1JIFsyXSwgU1NFIGRvZXMgbm90IG1vZGlm
aWVzIHRoZSB3YXkgaW50ZXJydXB0cyBhcmUKPiBoYW5kbGVkIGFuZCBkb2VzIG5vdCBhZGRzIGFu
eSBvdmVyaGVhZCB0byBleGlzdGluZyBjb2RlLiBNb3Jlb3ZlciwgaXQKPiBwcm92aWRlcyAidHJ1
ZSIgTk1JLWxpa2UgaW50ZXJydXB0cyB3aGljaCBjYW4gaW50ZXJydXB0IHRoZSBrZXJuZWwgYXQK
PiBhbnkgdGltZSAoZXZlbiBpbiBleGNlcHRpb24gaGFuZGxpbmcpLiBUaGlzIGlzIHBhcnRpY3Vs
YXJseSBjcnVjaWFsIGZvcgo+IFJBUyBlcnJvcnMgd2hpY2ggbmVlZHMgdG8gYmUgaGFuZGxlZCBh
cyBmYXN0IGFzIHBvc3NpYmxlIHRvIGF2b2lkIGFueQo+IGZhdWx0IHByb3BhZ2F0aW9uLgo+Cj4g
V2hpbGUgT3BlblNCSSBTU0Ugc3VwcG9ydCBpcyBhbHJlYWR5IHVwc3RyZWFtLCBhbiBhZGRpdGlv
bmFsIHBhdGNoIGlzCj4gbmVlZGVkIGZvciB0aGUgUE1VIHBlcmYgZHJpdmVyIHRvIHdvcmsgYXMg
ZXhwZWN0ZWQgWzJdLgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2Ev
cmlzY3Ytc2JpLWRvYy9yZWxlYXNlcy9kb3dubG9hZC92My4wLXJjNy9yaXNjdi1zYmkucGRmIFsx
XQo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXZvc2luYy9vcGVuc2JpL3RyZWUvZGV2L2Ns
ZWdlci9zc2VfcG11X2lycSBbMl0KCkZpbmFsbHkgZ290IGFyb3VuZCBoYXZpbmcgYSBsb29rL3Rl
c3QhCgpUaGFua3MgZm9yIGFkZGluZyBhbGwgdGhlIFNTRSB0ZXN0cyB0byBrdm0tdW5pdC10ZXN0
cyBbMV0hIFdoYXQgYSBoaWRkZW4KZ2VtIC0tIGF0IGxlYXN0IHRvIG1lIQoKSXQgd291bGQgYmUg
bmljZSB3aXRoIHNpbWlsYXIgdGVzdHMgaW4ga3NlbGZ0ZXN0LCBzbyB0aGF0IHdlIGNhbgpleGVy
Y2lzZSB0aGUgU1NFIHBhdGhzIG9uIHRoZSBDSSB3b3JrZXIhCgouLi5hbmQgYSBjb3VwbGUgb2Yg
Z2VuZXJhbCBjb21tZW50cyB0aGF0IGFwcGx5IHRvIGFsbCBwYXRjaGVzLgoKICAqIFRoZXJlIGFy
ZSBhIGJ1bmNoIG9mIGNoZWNrcGF0Y2ggd2FybmluZ3MvZXJyb3JzIC0tIG5vdCBhbGwgbWFrZQog
ICAgc2Vuc2UsIGJ1dCBzb21lIGRvIQogICogTWlub3Igc3BlbGxpbmcgZXJyb3JzIGluIHRoZSBj
b21taXQgbWVzc2FnZXMsIHRoYXQgY29kZXNwZWxsCiAgICBjYXRjaGVzLgogICogVGhlcmUgYXJl
IHNvbWUgbmV3IHVudXNlZCB2YXJpYWJsZXMgd2FybmluZ3MgaW4gdGhlIGJ1aWxkLgoKTW9zdCBv
ZiB0aGF0IChtb2R1bG8gdGhlIHNwZWxsY2hlY2tzKSBpbiBQVyBbMl0uCiAgCkknbGwgaGF2ZSBz
b21lIG1pbm9yIHRoaW5ncyBpbiB0aGUgb3RoZXIgcGF0Y2hlcy4KCgpUaGFua3MgZm9yIHdvcmtp
bmcgb24gdGhpcywgYW5kIGxvb2tpbmcgZm9yd2FyZCB0byBoYXZpbmcgaXQgbGFuZCEKQmrDtnJu
CgpbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzClsy
XSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvbGlzdC8/
c2VyaWVzPTk2MzY4MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
