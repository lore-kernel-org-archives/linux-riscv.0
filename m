Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6282C27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 13:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pq/8X7zi5e7h03lYjX4/eHVeQLatcxM2f/3Zry5/S30=; b=qh0LsxrbN6Vx8+
	eyD8Yk6c80FQ0qIAlBqSSoz587WaidUvJcLqcVDyVwX4xczB+z6k5ChXnD/QvW0PoC6doFwRjOTzJ
	jYiSAqQF9fcN+68JZYhX2gK6fiULuLxAf54dftEmulcOcu1qCEOX3U7rQsZ8Dd6IMSswhoRkDT3L5
	POMPJYMPIHdSTJ42atY8xkWZHzBWoR3XSr1vFsKCQDvduoC01c685FdvJO6yZR9DGkwv3xuvzRlNS
	bBN3gqHG4FvAkgAbqSY+OUaWtHDxsfARUq1stJYrQx71W/ZKUKfNPfTxhTQUn1leJA0fzs1NcJrYZ
	imYqI25heCouMpwFgkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCeG-0000000Av4O-41Pd;
	Mon, 17 Jun 2024 13:43:52 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCeC-0000000Av0a-070x
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 13:43:49 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7e23dc4bda0so175263539f.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 06:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718631826; x=1719236626; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGKpj5AvHTsEbrLmF9bNmz/D9P/h+ZMX1niQukt3LXM=;
        b=JJXAbDXywl5L9fYzjqxvc3oc3YKNoSPwFoKR/fwvL9GoHSxwaLRV1bKUm8QASm/dia
         MJU2jHfc7EpLPtkkddJ2+eOyWiBLdznbhx3XIOnaWx3UaeECUJD1A8gIGbf55aMcy0Lv
         SiGbsMZ8o/vssqOpVQ/lEb+L4U8zKphJowTsAueqsz3D9YB/zcFqzgIrWx/XW1GnY+BG
         epGOC9T0k3AtchaiE5Lx8ZFF9wzZWFBWdhsx0MoniL/2W0x/tsiQo5LCYO9dnyqjSwPc
         XvgXH81CmMabBwY2orZiBYTzREveAk/hvHpi2b1sP7zNAkYrrk/O6iiihewGTg5wajIA
         tiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718631826; x=1719236626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGKpj5AvHTsEbrLmF9bNmz/D9P/h+ZMX1niQukt3LXM=;
        b=LiPGMwet94v3HD2MapZFB3zrEu+z7d82mqpU9KzO5Y+embZ2e4PQxXOJQQKSwAV85y
         3YRY8HaqXcTCyVzuU/taz7eJ2icCdAaXF4Tx7W8hoCHCafnVCobp/ziidJL1smOFEi9b
         ZSSwBwTgzvUfEkLXzNLZ6MrH0dqnburdfb8+THt2Fuzp3OAcEaZe5i0mgc6CNfRMw4fO
         FcLo9JdLH2PelWlj4xWw8SlutCFxtszosN2AeQAR5qynMyGK+4z32sm5acAyPfUxO7lY
         zAcmq5HJbZqy0aMz33YG8zZxexXSGo9f7sE1nRJlozfm/DIUVrgXql3sQD6t9KKG8Iq7
         zHew==
X-Forwarded-Encrypted: i=1; AJvYcCXGzdq4WB0RPN37xozeJa6Scafj+6ZCM8F2z7mVl48X5pjA1EYkvwymA3Qytc/zmKIZELpDucOR6dFvwWcx4hJf1wdGjzBrn/nJTf2JMIPp
X-Gm-Message-State: AOJu0YyKptLoJvu486e5e/5DDQhOQn8ChimWzYe0i13vjFs5gGngvQc2
	EyhJXzcll8lfi8YTCvi16uVJLgy79lx33d2BgHIbLLkF8f08/wqdD/BQItpcCoYl71CGZRVrMJf
	6wQRr/01U+pYtNEqldh2RYhJChQqp8lf91n7fnA==
X-Google-Smtp-Source: AGHT+IG/B3WypjhzIUOJZbLMxyurBmwQdjlcHydZzcumzgrC9Dze6gAT7/km/QnYVaq8ae6CKJ08zdbpc3jZxjOCGIk=
X-Received: by 2002:a05:6602:1503:b0:7eb:78b4:faee with SMTP id
 ca18e2360f4ac-7ebeb4909cbmr1147213239f.3.1718631826563; Mon, 17 Jun 2024
 06:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240614142156.29420-1-zong.li@sifive.com> <20240614142156.29420-5-zong.li@sifive.com>
 <a1a99374-dc40-4d57-9773-e660dc33beb2@linux.intel.com>
In-Reply-To: <a1a99374-dc40-4d57-9773-e660dc33beb2@linux.intel.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 17 Jun 2024 21:43:35 +0800
Message-ID: <CANXhq0pQuoriKfHF51fXUtrZLkJBNOCe6M8Z6JbDjoRvbe1nWg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/10] iommu/riscv: add iotlb_sync_map operation support
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgg@ziepe.ca, kevin.tian@intel.com, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_064348_272528_4C888FD8 
X-CRM114-Status: GOOD (  23.96  )
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

T24gU2F0LCBKdW4gMTUsIDIwMjQgYXQgMTE6MTfigK9BTSBCYW9sdSBMdSA8YmFvbHUubHVAbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIDYvMTQvMjQgMTA6MjEgUE0sIFpvbmcgTGkgd3Jv
dGU6Cj4gPiBBZGQgaW90bGJfc3luY19tYXAgb3BlcmF0aW9uIGZvciBmbHVzaCBJT1RMQi4gU29m
dHdhcmUgbXVzdAo+ID4gZmx1c2ggdGhlIElPVExCIGFmdGVyIGVhY2ggcGFnZSB0YWJsZS4KPiA+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+IC0tLQo+
ID4gICBkcml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlIHwgIDEgKwo+ID4gICBkcml2ZXJzL2lv
bW11L3Jpc2N2L2lvbW11LmMgIHwgMTEgKysrKysrKysrKysKPiA+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlz
Y3YvTWFrZWZpbGUgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlCj4gPiBpbmRleCBkMzY2
MjVhMWZkMDguLmYwMmNlNmViZmJkMCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaW9tbXUvcmlz
Y3YvTWFrZWZpbGUKPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvTWFrZWZpbGUKPiA+IEBA
IC0xLDMgKzEsNCBAQAo+ID4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkKPiA+ICAgb2JqLSQoQ09ORklHX1JJU0NWX0lPTU1VKSArPSBpb21tdS5vIGlvbW11LXBsYXRm
b3JtLm8gaW9tbXUtcG11Lm8KPiA+ICAgb2JqLSQoQ09ORklHX1JJU0NWX0lPTU1VX1BDSSkgKz0g
aW9tbXUtcGNpLm8KPiA+ICtvYmotJChDT05GSUdfU0lGSVZFX0lPTU1VKSArPSBpb21tdS1zaWZp
dmUubwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyBiL2RyaXZl
cnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+ID4gaW5kZXggOWFlYjRiMjBjMTQ1Li5kZjdhZWIyNTcx
YWUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiA+ICsrKyBi
L2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+ID4gQEAgLTExMTUsNiArMTExNSwxNiBAQCBz
dGF0aWMgdm9pZCByaXNjdl9pb21tdV9pb3RsYl9zeW5jKHN0cnVjdCBpb21tdV9kb21haW4gKmlv
bW11X2RvbWFpbiwKPiA+ICAgICAgIHJpc2N2X2lvbW11X2lvdGxiX2ludmFsKGRvbWFpbiwgZ2F0
aGVyLT5zdGFydCwgZ2F0aGVyLT5lbmQpOwo+ID4gICB9Cj4gPgo+ID4gK3N0YXRpYyBpbnQgcmlz
Y3ZfaW9tbXVfaW90bGJfc3luY19tYXAoc3RydWN0IGlvbW11X2RvbWFpbiAqaW9tbXVfZG9tYWlu
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBp
b3ZhLCBzaXplX3Qgc2l6ZSkKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZG9t
YWluICpkb21haW4gPSBpb21tdV9kb21haW5fdG9fcmlzY3YoaW9tbXVfZG9tYWluKTsKPiA+ICsK
PiA+ICsgICAgIHJpc2N2X2lvbW11X2lvdGxiX2ludmFsKGRvbWFpbiwgaW92YSwgaW92YSArIHNp
emUgLSAxKTsKPgo+IERvZXMgdGhlIFJJU0MtViBJT01NVSBhcmNoaXRlY3R1cmUgYWx3YXlzIGNh
Y2hlIHRoZSBub24tcHJlc2VudCBvcgo+IGVycm9uZW91cyB0cmFuc2xhdGlvbiBlbnRyaWVzPyBJ
ZiBzbywgY2FuIHlvdSBwbGVhc2UgcHJvdmlkZSBtb3JlCj4gY29udGV4dCBpbiB0aGUgY29tbWl0
IG1lc3NhZ2U/Cj4KPiBJZiBub3QsIHdoeSBkbyB5b3Ugd2FudCB0byBmbHVzaCB0aGUgY2FjaGUg
d2hlbiBidWlsZGluZyBhIG5ldwo+IHRyYW5zbGF0aW9uPwo+CgpJdCBzZWVtcyB0byBtZSB0aGF0
IHdlIGNhbiBpbmRlZWQgcmVtb3ZlIHRoaXMgb3BlcmF0aW9uLCBiZWNhdXNlIGl0Cm1heSBiZSB0
b28gYWdncmVzc2l2ZSBnaXZlbiB0aGUgZm9sbG93aW5nIHNpdHVhdGlvbi4KCkkgYWRkZWQgaXQg
Zm9yIHVwZGF0aW5nIHRoZSBNU0kgbWFwcGluZyB3aGVuIHdlIGNoYW5nZSB0aGUgaXJxCmFmZmlu
aXR5IG9mIGEgcGFzcy10aHJvdWdoIGRldmljZSB0byBhbm90aGVyIHZDUFUuIFRoZSBSSVNDLVYg
SU9NTVUKc3BlYyBhbGxvd3MgTVNJIHRyYW5zbGF0aW9uIHRvIGdvIHRocm91Z2ggdGhlIE1TSSBm
bGF0IHRhYmxlLCBNUklGLCBvcgp0aGUgbm9ybWFsIHBhZ2UgdGFibGUuIEluIHRoZSBjYXNlIG9m
IHRoZSBub3JtYWwgcGFnZSB0YWJsZSwgdGhlIE1TSQptYXBwaW5nIGlzIGNyZWF0ZWQgaW4gdGhl
IHNlY29uZC1zdGFnZSBwYWdlIHRhYmxlLCBtYXBwaW5nIHRoZSBHUEEgb2YKdGhlIGd1ZXN0J3Mg
c3VwZXJ2aXNvciBpbnRlcnJ1cHQgZmlsZSB0byB0aGUgSFBBIG9mIGhvc3QncyBndWVzdAppbnRl
cnJ1cHQgZmlsZS4gVGhpcyBNU0kgbWFwcGluZyBuZWVkcyB0byBiZSB1cGRhdGVkIHdoZW4gdGhl
IEhQQSBvZgpob3N0J3MgZ3Vlc3QgaW50ZXJydXB0IGZpbGUgaXMgY2hhbmdlZC4KCkkgdGhpbmsg
d2UgY2FuIGludmFsaWRhdGUgdGhlIGNhY2hlIGFmdGVyIHVwZGF0aW5nIHRoZSBNU0kgbWFwcGlu
ZywKcmF0aGVyIHRoYW4gYWRkaW5nIHRoZSBpb3RsYl9zeW5jX21hcCgpIG9wZXJhdGlvbiBmb3Ig
ZXZlcnkgbWFwcGluZwpjcmVhdGVkLiBEb2VzIGl0IGFsc28gbWFrZSBzZW5zZSB0byB5b3U/IElm
IHNvLCBJIHdpbGwgcmVtb3ZlIGl0IGluCnRoZSBuZXh0IHZlcnNpb24uIFRoYW5rcy4KCj4gQmVz
dCByZWdhcmRzLAo+IGJhb2x1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
