Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C2CC88E77
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmEyWM4O61W2dPI+Fb8iMWgfiqB9LuILH/eDkM5L0DM=; b=nG+DlLnpkjGcub
	ggFc67o5KWXzWw0LRiuyUlSVNLKbmcx2L2j4aP99LahSUylvhWgnyKuZu2H3qbPkewVmd3LQddYSi
	CoqJWDjKSnov0ss9Z2QJ68NqjMvb7KysIElox9hRUaRsD0+eg3nDh4796X0IUC3717izwFc2yyNyv
	ljujZBXxaVJSsdVMjUQED4BXLmRFkM5fb7LJV29qmJFPsmJUROg+Aagfs0pLNZCbkSeRbeJttZBkp
	dkaDF9dY5RuFO/JzGKCPy5lSR/a9pHKJsJIPW5wxi6oZZniA+iQHAR+hXnzpeM1gXQRwJfVO2p4YF
	FJC+Q2zrxlOQoW716W7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qSe-00000009NrO-3isq;
	Wed, 16 Sep 2026 14:18:08 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qSb-00000009Nr0-3Ahn
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 14:18:07 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-93910c3d02aso33819585a.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789568284; x=1790173084; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlFUKUT2IfapdBX0ngXWnLICIsdlboN0BkEZmE+ZMG4=;
        b=HqklwVoUSFMvWJ+1D/B+tfGaBdgz/SONmiokD1dakyXOKT0G8g5xp7oF5lNc/smWLb
         tT71eoMQcsQcJZ6CTHi1KVIr/NZyOmh2MG1GDbWDC47bQa6IOUPpha5Iq+MVHUEwS2R6
         SWPg6T9z7u+NQXqlUIc7DdWDs90M/Ou9sAbJfSiUlDWLicnYERBaeIaUSUKnhBgtrEkq
         gP7ngWJLyPgKQRK8cXhNb7guxCXWOfmtcI79ejWsPxRZ3fS2gbhROsxy+CSWZ/42qMFv
         c2Nfwaz50VSF+fdll8RMwgquar1aOUvBt3qeGT2LAtM8i4d1rwXLMtHpl4R6RPdvpvEH
         kgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568284; x=1790173084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VlFUKUT2IfapdBX0ngXWnLICIsdlboN0BkEZmE+ZMG4=;
        b=PFkaLRCVN/gadLcopHV6qIwcJbG5r4XakEiAh4aVsJwSx/LOo8uu0Ab0aF+p4YpCrw
         SVcdLxYk/TSmh/r+MuEJvtBeIM1ZQOx8gby01AzSdFXUiKjGwAKe9g53KhV0JMqMPjJc
         FALcRUOrulL1fn0Us9r0EcSWPyayxuJnZqIgrFWAPAWS47M5RLK1ueKqPumv6afHR+mb
         TwVJUwhz2iM32dTSkARHkSLiqX2nsfT3WKhNSGQkBcF+APUDN9i9QKU5/NGULninGA4A
         6B6/NVGgh4fmFVbYrJKGKLAxWoJ81Owg2tR02NGm2mNRU+cMmykaV7ZCidV1BBbgTH7L
         Vbqg==
X-Forwarded-Encrypted: i=1; AKwUvBzDl7XJd1nk5ZOeaJGBdPO51JU+FTm1VUxPa2RoNgw4or1uMaBwCgyMFK4QFIW1XaxrOjSGZrepupmESQ==@lists.infradead.org
X-Gm-Message-State: AFuF++m26TtBOONzhuqx32V3J1tTptE7UE/tDdmmXForaR9px2Tk85Rj
	BXgRjM8po2I7JEebLJZ4A7Eji9EyfCuizNDzlWcJa3Cq3CKjG9VUBP1u
X-Gm-Gg: AYBFou3Gz5JrV4A6J59zRN615OP5aBFyQKEzPbAl2sloyCO/myW7s1ag0jbvGS5ABu2
	y7/a0bnyCh7wbmlZsUG+acejvwVurhbVOG0Ye9xJ25I8hb3wejB6cVLJ8e5jfcdYZ6IdSTpDHVT
	Iz7iBDUrTUHxvoQmGVCSrpVHVQSIFYp4F5QpcxQNNwq7LbDhTYXMx2T2rtuH0YH9HSk7dQMK5lh
	8HAkninvdrQqqYjldDDvFJGBI5Rwbx7CkxmqswW2P1StXFA4Xbr0IImjRsLI/nroGgNlF+Kw/9u
	17zJ5m2lIas8iv21TtOLzci2ZTw1h/nkpuJg+YZupfd7PaulvRhQKKviqCyy+/02zdxfKgvuctT
	SWk/zUP9n7v+7l6K8tASLFzvmQyqC6msXg9Wh9+6PXJyTz7jQtFDXh/beZyJdsvQQMK7hmrGr8N
	DinRXDYVkRBKxooIYqhTIPs4UqAOWigHedoDdijWVqpb9ugx1NskjftRqJVj2CgvAjVw/CLWbQw
	qin6rZAlh52pvyLuHJ4KjwXPNtMmf+zVpbjXe2HyNa4ZA==
X-Received: by 2002:a05:620a:318c:b0:939:83c1:d8c6 with SMTP id af79cd13be357-93bb71b6f5cmr340423285a.8.1789568284122;
        Wed, 16 Sep 2026 07:18:04 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81d19df1sm228561685a.45.2026.09.16.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:18:03 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:47:47 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, ynorov@nvidia.com, david@davidgow.net, 
	joelagnelf@nvidia.com, fujita.tomonori@gmail.com, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH V5 2/2] rust: kernel: Add KUnit tests for powerpc
 ARCH_WARN_ASM bug table emission
Message-ID: <aqqk-YRcGcUsqOiI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260915090453.1227034-1-mkchauras@gmail.com>
 <20260915090453.1227034-3-mkchauras@gmail.com>
 <20260916.230658.2266384286281034372.tomo@flapping.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916.230658.2266384286281034372.tomo@flapping.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_071806_265320_50D474AF 
X-CRM114-Status: GOOD (  27.54  )
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

T24gV2VkLCBTZXAgMTYsIDIwMjYgYXQgMTE6MDY6NThQTSArMDkwMCwgRlVKSVRBIFRvbW9ub3Jp
IHdyb3RlOgo+IE9uIFR1ZSwgMTUgU2VwIDIwMjYgMTQ6MzQ6NTMgKzA1MzAKPiAiTXVrZXNoIEt1
bWFyIENoYXVyYXNpeWEgKElCTSkiIDxta2NoYXVyYXNAZ21haWwuY29tPiB3cm90ZToKPiAKPiA+
IFZlcmlmeSB0aGF0IHRoZSBfX2J1Z190YWJsZSBlbnRyeSBlbWl0dGVkIGJ5IEFSQ0hfV0FSTl9B
U00gaGFzIGEgY29ycmVjdAo+ID4gYnVnX2FkZHIgZGlzcGxhY2VtZW50IOKAlSBpLmUuIHRoZSAn
MWInIGxhYmVsIHJlZmVyZW5jZSBpbiBfRU1JVF9CVUdfRU5UUlkKPiA+IHJlc29sdmVzIHRvIHRo
ZSB0cmFwIGluc3RydWN0aW9uIOKAlSBieSBjYWxsaW5nIGZpbmRfYnVnKCkgd2l0aCB0aGUgZXhh
Y3QKPiA+IHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgdHdpIGluc3RydWN0aW9uLCBtaXJyb3Jpbmcg
d2hhdCB0aGUgcmVhbCBwb3dlcnBjCj4gPiB0cmFwIGhhbmRsZXIgZG9lcy4KPiA+IAo+ID4gVGhl
IHRyYXAgYWRkcmVzcyBpcyBjYXB0dXJlZCBhdCBsaW5rIHRpbWUgdmlhIGEgLmRjLmEgMWIgcmVs
b2NhdGlvbiBwbGFjZWQKPiA+IGluIC5kYXRhIGJ5IHRoZSBnbG9iYWxfYXNtISBibG9jay4gZ2xv
YmFsX2FzbSEgaXMgdXNlZCBpbnN0ZWFkIG9mIGFzbSEKPiA+IGJlY2F1c2UgTExWTSBlbGltaW5h
dGVzIGFzbSEgYmxvY2tzIGluIGRlYWQgYnJhbmNoZXM7IGdsb2JhbF9hc20hIGlzCj4gPiBmaWxl
LXNjb3BlIGFuZCBhbHdheXMgZW1pdHRlZC4gQlVHX0tVTklUX1RSQVBfQUREUiBpcyBkZWZpbmVk
IGFzIGEgLmdsb2JhbAo+ID4gc3ltYm9sIGRpcmVjdGx5IG9uIHRoZSAuZGMuYSB3b3JkIHNvIHRo
ZSBsaW5rZXIgcmVsb2NhdGlvbiBsYW5kcyBvbiBpdCDigJUKPiA+IGEgUnVzdCBzdGF0aWMgaW5p
dGlhbGl6ZWQgdG8gemVybyB3b3VsZCBlbmQgdXAgaW4gQlNTIHdoZXJlIHJlbG9jYXRpb25zIGFy
ZQo+ID4gbm90IGFwcGxpZWQuCj4gPiAKPiA+IC5kYy5hIGVtaXRzIGEgcG9pbnRlci13aWR0aCB3
b3JkICg0IGJ5dGVzIG9uIHBwYzMyLCA4IGJ5dGVzIG9uIHBwYzY0KSwKPiA+IHNvIEJVR19LVU5J
VF9UUkFQX0FERFIgaXMgZGVjbGFyZWQgYXMgdXNpemUgb24gdGhlIFJ1c3Qgc2lkZSwgbWFraW5n
IHRoZQo+ID4gdGVzdHMgY29ycmVjdCBvbiBib3RoIHBwYzMyIGFuZCBwcGM2NC4gVGhlIGdsb2Jh
bF9hc20hIGJsb2NrIGlzIHNwbGl0IGludG8KPiA+IHR3byBjZmctZ2F0ZWQgdmFyaWFudHMgKENP
TkZJR19QUEM2NCAvICFDT05GSUdfUFBDNjQpIHRvIHNlbGVjdCB0aGUgcmlnaHQKPiA+IC5iYWxp
Z24gc2luY2UgY29uY2F0ISgpIG9ubHkgYWNjZXB0cyBsaXRlcmFscy4KPiA+IAo+ID4gRml2ZSB0
ZXN0cyBhcmUgaW5jbHVkZWQgaW4gdGhlIHJ1c3Rfa2VybmVsX2J1Z19wb3dlcnBjIHN1aXRlOgo+
ID4gCj4gPiAgIGJ1Z19lbnRyeV9mb3VuZCAgICAgICAgIC0gZmluZF9idWcoKSByZXR1cm5zIG5v
bi1OVUxMIGZvciB0aGUgdHJhcCBhZGRyZXNzLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHByb3ZpbmcgdGhlIGJ1Z19hZGRyIGRpc3BsYWNlbWVudCBpcyBjb3JyZWN0Cj4gPiAgIGJ1
Z19lbnRyeV9pc193YXJuaW5nICAgIC0gdGhlIGVtaXR0ZWQgZW50cnkgaGFzIEJVR0ZMQUdfV0FS
TklORyBzZXQKPiA+ICAgYnVnX2VudHJ5X2ZpbGUgICAgICAgICAgLSBidWdfZ2V0X2ZpbGVfbGlu
ZSgpIHJldHVybnMgdGhlIGNvcnJlY3Qgc291cmNlCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZmlsZSAocmVxdWlyZXMgQ09ORklHX0RFQlVHX0JVR1ZFUkJPU0UpCj4gPiAgIGJ1Z19l
bnRyeV9saW5lICAgICAgICAgIC0gdGhlIHJlY29yZGVkIGxpbmUgbnVtYmVyIGlzIG5vbi16ZXJv
LCBjb25maXJtaW5nCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGhlIHtsaW5lfSBv
cGVyYW5kIHdhcyBzdWJzdGl0dXRlZCBjb3JyZWN0bHkKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAocmVxdWlyZXMgQ09ORklHX0RFQlVHX0JVR1ZFUkJPU0UpCj4gPiAgIGJ1Z19lbnRy
eV9hZGRyX2lzX2luX3RleHQgLSBrZXJuZWxfdGV4dF9hZGRyZXNzKCkgY29uZmlybXMgdGhlIHRy
YXAgYWRkcmVzcwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpZXMgaW4ga2VybmVs
IHRleHQsIG5vdCBkYXRhIG9yIHplcm8KPiA+IAo+ID4gVGhlIHN1aXRlIGlzIG5hbWVkIHJ1c3Rf
a2VybmVsX2J1Z19wb3dlcnBjIGFuZCB0aGUgS2NvbmZpZyBvcHRpb24KPiA+IENPTkZJR19SVVNU
X0JVR19QT1dFUlBDX0tVTklUX1RFU1QgZGVwZW5kcyBvbiBQUEMgJiYgR0VORVJJQ19CVUcsCj4g
PiBjb3ZlcmluZyBib3RoIHBwYzMyIGFuZCBwcGM2NC4KPiA+IAo+ID4gVGVzdGVkIG9uIHBwYzY0
bGUgKGx0Y2Z1amlhYWMtbHAzLCA3LjMuMC1yYzErKTogcGFzczo1IGZhaWw6MCBza2lwOjAuCj4g
PiBUZXN0ZWQgb24gcHBjMzIgQm9vazNTIChRRU1VIG1hYzk5IEc0LCBjaHJwMzJfZGVmY29uZmln
KTogcGFzczo1IGZhaWw6MCBza2lwOjAuCj4gPiBUZXN0ZWQgb24gcHBjNjRsZSAoUUVNVSBwc2Vy
aWVzLCBwc2VyaWVzX2xlX2RlZmNvbmZpZyk6IHBhc3M6NSBmYWlsOjAgc2tpcDowLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBNdWtlc2ggS3VtYXIgQ2hhdXJhc2l5YSAoSUJNKSA8bWtjaGF1cmFz
QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHJ1c3Qva2VybmVsL0tjb25maWcudGVzdCB8ICAxMyAr
KysKPiA+ICBydXN0L2tlcm5lbC9idWcucnMgICAgICAgfCAyMDkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMjIgaW5zZXJ0aW9u
cygrKQo+IAo+IEkgdGhpbmsgdGhhdCB0ZXN0aW5nIHdhcm5fb24hLCBpbiBwYXJ0aWN1bGFyIHRo
YXQgdGhlIHJpZ2h0IGFkZHJlc3MgaXMKPiBwdXQgaW4gdGhlIGJ1ZyBlbnRyeSwgaXMgYSBnb29k
IGlkZWEuCj4gCj4gSSdkIHByZWZlciBzdWNoIGEgdGVzdCB0byB3b3JrIG9uIGV2ZXJ5IGFyY2hp
dGVjdHVyZS4gVGhpcyBvbmUgZGVwZW5kcyBvbgo+IGRldGFpbHMgb2YgcG93ZXJwYydzIEFSQ0hf
V0FSTl9BU00sIHN1Y2ggYXMgdGhlICcxYicgbGFiZWwuIEtVbml0IGhhcyBhCj4gd2FybmluZyBz
dXBwcmVzc2lvbiBBUEkuIEEgdGVzdCBjYW4gY2FsbCB3YXJuX29uISBpbnNpZGUgYSBzdXBwcmVz
c2lvbgo+IGJsb2NrIGFuZCBjaGVjayB0aGF0IG9uZSB3YXJuaW5nIHdhcyBjb3VudGVkLiBUaGUg
Y291bnRlciBpcyBvbmx5Cj4gaW5jcmVtZW50ZWQgYWZ0ZXIgZmluZF9idWcoKSBmb3VuZCB0aGUg
ZW50cnksIHNvIGEgd3JvbmcgYWRkcmVzcyBpcyBjYXVnaHQKPiB0b28uCj4gCj4gSSdsbCBzZW5k
IGEgcGF0Y2ggZm9yIHRoYXQgc2hvcnRseS4KCnllYWgsCgptYWtlcyBzZW5zZS4KClJlZ2FyZHMs
Ck11a2VzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
