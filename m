Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E069CD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 03:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeQVWlrpmFF6Nq09CCwrMQ6tg0lgPLlnH0nPAU+Mcgo=; b=foV2KkcIKxdZRM
	2wXYqRaN1Rgbxeq4vjfu45mSMdrUMl8sJ1neFdxLcMwfke0/39QNfhVQvkLKOA3f5CesiHcks3oKQ
	/zrCH2vA8Spk0/lWVPKsiHHX7ZYhnBu+HhokBf+X1CHdHcMh/V+DaStB8oUuS2mSD3eK26tczN52z
	/ub7LmhNSMlEtHPiDId2Xx6xgHLQQkFqCTzHEbY0qkNg+9NSinvgqy5PI5FPMxQxOOqy5lpHYYh/F
	4CzooRflNzWm8lMVG2OAroK9fBVQcgGGz8cDlxDSkA6EyBG3oohfaX7bZmF3W1fsigMX2AavMHTCA
	uXzgP+6fet5TUfLHWJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOp45-0000000E6fw-1Ph7;
	Mon, 18 May 2026 03:54:49 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOp42-0000000E6fD-26zF
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 03:54:47 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-bd4f81505ccso290142166b.1
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 20:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779076484; cv=none;
        d=google.com; s=arc-20240605;
        b=WESD3sv4RQdHpNPxlMQ5WTJFzOsBTiGtT1QAHzAod9dDDtW9azeC2PCPR5y+kn6ovT
         b4yZpsQi2sTKxB6peJuOECkOCybhg/SfF0g3aN25ACdsqiscsjDEwtaegDSCyHgHadXd
         r1/zlS3AIujKVu4PeN5RZWB4R5Ipi06Oh87u8yTbfVHeUlr1cNl0wRYt9MhvxeHBSxTB
         kfM1QDhRILyi7wk/RDd6NMlwk9kIy9BZh7m/dc5IheBsqL6yXzvww0HB6mjwZphV7+Fr
         hanTbrTjQsW264Qahf8qNbc6uh254RkKXci76YCSvffMQGrhq4uZMwS0lzeYjA3rAT9E
         9IAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7CvT4HhBCYlPudOGji0zps1EDVNCe5kF6RE+1sNMHv8=;
        fh=ZhRAEn4JXxs84PVt4kbdE9+jA9ZEp9K9AR6deygOYa8=;
        b=aTcm1FqResj2ht+KeyXHR4e1SdRVnQ1DbzWfQufLEIEdAkiy7z1Ncm54VuPrLQmr92
         GxAZFqKGDsj0oQ7uNMLMeRDOs5Q7WoCpq8cMg7rDtwXr1aVOw7DRy219vSafjLN/Yu4D
         Sswlqazv+Ze62lg0/oKLKYnKiH3oB93R+rv87j3jeKwLLI83CZxL2eimm0w/1QjHm0+u
         DxmMwcG9fM6MNooPenzuqfvfAFIbPYhFHvyc7BBAuKKZ6lvqj2HfxtW/+yJ2hvoR0nAH
         D0ykv8SSLnBhexrADy7Sk3aX/61/+JOBifj9cbWkOUVSF0THGgrUwZcN2F/h8UKuhI1y
         XUXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779076484; x=1779681284; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CvT4HhBCYlPudOGji0zps1EDVNCe5kF6RE+1sNMHv8=;
        b=BqF/UG6HEdQByaEEZN/aPSsBIqqNT9CHAfOkkju8Ht4BB5tgKlEsrU2/pnNy0y6bKF
         uNywKhreHl1vAFlqMiBDVTv+UlnTO4p+Zvakw4ONIDt4oQ9cwwOiB74sgE8aMQHHbP9q
         /PihgIWuuzIF3LtIoQtvxNl2ygStNA4ycN0mv3EC0ZBYPwt5GJU7vUf+lz5TlpfAMMUr
         OTC07hXUCITKMW1AdOXF777SFZrIYxb76Lx1P5inXdf0co9k9jDcAC5slSNJxSsFkmKU
         ntngdqT1MMOaOQ8SPAyYOD/N0uo6O/f2+SCoB+7uB3Y8UJtgAs/sO5YZgpsKjS8kdjI6
         IJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779076484; x=1779681284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7CvT4HhBCYlPudOGji0zps1EDVNCe5kF6RE+1sNMHv8=;
        b=hLNw1cbw3A1XB9sCp2/9AqGawpj7UQeJbgP8Vo7RSPL23N4Vx1K0R8WUz4+SIeI2hy
         JgJYl8LlQngB4R8YE/B3kP+IPvKzelsUpAhuvdiB28in3J5+ZCV9TbZAw2GVNd8eVn/K
         ikCauNAOu6DIZ9uu0wxTzMxwLf1WbhzYE3riDOaQL5al+xSk2gtF8A33iYN4WIB2LwF0
         ZVvCckenIZm4q2ZSK3jYpwbsbAH7F98ffcw7c+NcQEQLmtQ1TQ/12K1Pa0oxImHfto2r
         yQ86/ETtBDvtBXEMh9hb1cSHEZ4Dl2OVBNB4TNzWfw7VjNrJjGd+d4cIAEjlo1sO/LM+
         fNWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+EJ0F+ll+v/ZYC1nRL1vlZQ6/KBI3W9ZXAKXXuRu10rsgPoqJPGNIvVzXWdsydWkjCXijWInSWsIGBOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlxUtPdFzHK4TDZEe6fX2HZ33TxpgFHfQnoHEAPxy0dpGS+aHf
	v+Po6mqN9vKgMijGYtY+ZdkHivHn3999EP8M0dZUrp/oGCAqbfFotbUx2y1Yjk/a7/r1GOS3bsH
	iKAPJPPkoU3B8iSL0BefVm2IcjZNJzy6A/AcoxzYXbA==
X-Gm-Gg: Acq92OGsjFZxgBTsqoc+tLMNgxaBY9p2YbzOED/iK6wuHGX71ZMbfzmqjN6GigLpG+u
	blhMKtO3skTxqMX0qQGd/Pbed4rzpKcEdslM0QFd2ws/VZVcWQynwt59qJUmiR2uOLp8YWqYLXF
	balCJWicHf2f2kaOcvJk1F3qBxHAi7abqpHX2dAIT2SLEFpQYJS7YifVW0QuUI/RJ3htJ37H/mq
	/oajX5IAbw1BjnVM3vFvHfO5pe/yNNXkjuzq4H/qEfaE1Sxbslz16oQXZ3oKJYxkogAYjlKFKsK
	K48fodYJt/sh+eXdSsjO
X-Received: by 2002:a17:907:1b1c:b0:bd2:387:6d2 with SMTP id
 a640c23a62f3a-bd5177acfc4mr498914066b.5.1779076483806; Sun, 17 May 2026
 20:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260514075036.1432352-1-zong.li@sifive.com> <20260514095605.2c7d8761@pumpkin>
 <CANXhq0rY8wb-0x2whLGMSuWLujtZwrEsmpWh_PUhxoZ0gpA96w@mail.gmail.com>
 <20260515102411.4d3e868a@pumpkin> <CANXhq0p-YeNHGtQGHVvHSRvSaDtEvoY=KHc019iRBfQM7aV+ZA@mail.gmail.com>
 <20260515201613.243ea49b@pumpkin>
In-Reply-To: <20260515201613.243ea49b@pumpkin>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 18 May 2026 11:54:32 +0800
X-Gm-Features: AVHnY4LgDNmY_w0AsED_8He0SPdjkAfwDzN-nnlNdhqAT8NqjIod9TW-f-RNIQY
Message-ID: <CANXhq0qOjCVOQfCe5QqNU+UksAzK3F4OLYAFSfsBrRP3zo9GUg@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: cif: reduce shadow stack size limit from 4GB to 2GB
To: David Laight <david.laight.linux@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	debug@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_205446_593912_56D21062 
X-CRM114-Status: GOOD (  35.94  )
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

T24gU2F0LCBNYXkgMTYsIDIwMjYgYXQgMzoxNuKAr0FNIERhdmlkIExhaWdodAo8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIDE1IE1heSAyMDI2IDIyOjI5
OjA1ICswODAwCj4gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPgo+ID4gT24g
RnJpLCBNYXkgMTUsIDIwMjYgYXQgNToyNOKAr1BNIERhdmlkIExhaWdodAo+ID4gPGRhdmlkLmxh
aWdodC5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIDE1IE1heSAy
MDI2IDExOjQyOjQ1ICswODAwCj4gPiA+IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+ID4gT24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgNDo1NuKAr1BNIERhdmlk
IExhaWdodAo+ID4gPiAuLgo+ID4gPiA+ID4gSSBhbHNvIGRvbid0IHVuZGVyc3RhbmQgdGhlIHJh
dGlvbmFsIGZvciBqdXN0IC8yIGFuZCB0aGUgMkcgdXBwZXIgbGltaXQuCj4gPiA+ID4gPiBZb3Ug
bmVlZCA1MTIgbmVzdGVkIGZ1bmN0aW9uIGNhbGxzIHRvIGV2ZW4gdXNlIDRrLgo+ID4gPiA+ID4g
VGhhdCB3b3VsZCBoYXZlIHRvIGJlIHF1aXRlIGRlZXAgcmVjdXJzaW9uLgo+ID4gPiA+Cj4gPiA+
ID4gRHVyaW5nIHRoZSBkaXNjdXNzaW9ucyBhYm91dCB0aGUgQVJNIEdDUyB2MyBzZXJpZXMsIGNv
bW11bml0eSBwb2ludGVkCj4gPiA+ID4gb3V0IHRoYXQgYSA0RyBzaGFkb3cgc3RhY2sgbWlnaHQg
YmUgdG9vIGxhcmdlLiBUaGlzIHNpemUgaXMgaGFyZCB0bwo+ID4gPiA+IHN1cHBvcnQgaW4gbWVt
b3J5LWNvbnN0cmFpbmVkIGVudmlyb25tZW50cyBsaWtlIEFuZHJvaWQuIEhvd2V2ZXIsIHRoZQo+
ID4gPiA+IHNpemUgY2Fubm90IGJlIHRvbyBzbWFsbCBlaXRoZXIsIG9yIHdlIG1pZ2h0IGZhY2Ug
c3RhY2sgb3ZlcmZsb3cKPiA+ID4gPiBpc3N1ZXMuIEF0IHRoYXQgdGltZSwgYSBwZXJmZWN0IHNp
emUgd2FzIG5vdCBkZWNpZGVkLgo+ID4gPgo+ID4gPiBJdCBpcyBvbmx5IFZBIG5vdCByZWFsIG1l
bW9yeSBzbyBzaG91bGRuJ3QgbWFrZSBtdWNoIGRpZmZlcmVuY2UgdG8gbWVtb3J5Cj4gPiA+IHVz
ZSAoZXhjZXB0IGZvciBub21tdSB3aGVyZSB0aGUgYWN0dWFsIG1lbW9yeSBoYXMgdG8gYmUgYWxs
b2NhdGVkKS4KPiA+ID4KPiA+Cj4gPiBZb3UgcmFpc2UgYSB2YWxpZCBwb2ludCB0aGF0IHNoYWRv
dyBzdGFja3MgYXJlIHByaW1hcmlseSBhIFZBCj4gPiBhbGxvY2F0aW9uLiBIb3dldmVyLCBpbiBM
aW51eCwgdGhlIG1lbW9yeSBvdmVyY29tbWl0IG1lY2hhbmlzbSBjcmVhdGVzCj4gPiBhIHByYWN0
aWNhbCBsaW5rIGJldHdlZW4gVkEgYWxsb2NhdGlvbiBhbmQgcGh5c2ljYWwgbWVtb3J5IGNhcGFj
aXR5Lgo+ID4gQXMgSSBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBtZW1vcnkgYWxs
b2NhdGlvbiB3aWxsIGZhaWwgd2hlbgo+ID4gdGhlIG92ZXJjb21taXQgbW9kZSBpcyBzZXQgdG8g
T1ZFUkNPTU1JVF9HVUVTUyBvciBPVkVSQ09NTUlUX05FVkVSLgo+ID4KPiA+IEluIF9fdm1fZW5v
dWdoX21lbW9yeToKPiA+ICAgICAgICAgaWYgKHBhZ2VzID4gdG90YWxyYW1fcGFnZXMoKSArIHRv
dGFsX3N3YXBfcGFnZXMpCj4gPiAgICAgICAgICAgICAgICAgZ290byBlcnJvcjsKPiA+Cj4gPiBN
YW55IHBhZ2UgcmVxdWVzdHMgZm9yIFZBIHdpbGwgZmFpbCBpZiB0aGUgcmVxdWVzdGVkIHNpemUg
ZXhjZWVkcyB0aGUKPiA+IHN5c3RlbSdzIHRvdGFsIFJBTSBwbHVzIFN3YXAuIE9uIG1lbW9yeS1j
b25zdHJhaW5lZCBzeXN0ZW1zLAo+ID4gYWxsb2NhdGluZyBhIG1hc3NpdmUgNEdCIHNoYWRvdyBz
dGFjayBwZXIgdGhyZWFkIHdvdWxkIGltbWVkaWF0ZWx5Cj4gPiB0cmlnZ2VyIHRoaXMgZXJyb3Iu
Cj4KPiBCdXQgcmVkdWNpbmcgdGhlIHNpemUgYnkgaGFsZiBtYWtlcyBsaXR0bGUgZGlmZmVyZW5j
ZS4KPiBZb3UnZCBuZWVkIGEgbXVjaCBiaWdnZXIgcmVkdWN0aW9uIHRvIG1ha2UgYW55IHJlYWwg
ZGlmZmVyZW5jZS4KPgoKSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IGEgc21hbGxlciBzaXplIHdvdWxk
IGNvdmVyIG1vcmUgY2FzZXMuIEkgYW0gdmVyeQpvcGVuIHRvIHlvdXIgaWRlYXMgcmVnYXJkaW5n
IHRoZSBzaXplLiBXb3VsZCB5b3UgcHJlZmVyIHRvIHVzZSAxR0Igb3IKNTEyTUIgYXMgdGhlIGRl
ZmF1bHQgaW5zdGVhZD8KQXMgSSBtZW50aW9uZWQgaW4gbXkgcHJldmlvdXMgZW1haWxzLCB1c2lu
ZyAyR0Igc2VlbXMgdG8gYmUgYSBzYWZlCnN0YXJ0aW5nIHBvaW50LiBUaGlzIGlzIGJlY2F1c2Ug
aXQgaXMgYWxyZWFkeSBhY2NlcHRlZCBieSB0aGUKY29tbXVuaXR5IGFuZCB0aGUgQW5kcm9pZCBz
eXN0ZW0gKGluIEdDUyBpbXBsZW1lbnRhdGlvbikuCkFkZGl0aW9uYWxseSwgYWx0aG91Z2ggdGhl
IENGSSBmZWF0dXJlIGRvZXNuJ3Qgc3VwcG9ydCAzMi1iaXQgc3lzdGVtcwp5ZXQsIG5vcm1hbCAz
Mi1iaXQgc3lzdGVtcyBjYW4gb25seSBzdXBwb3J0IHVwIHRvIDRHQiBvZiBwaHlzaWNhbAptZW1v
cnkuIElmIHRoZSBkZWZhdWx0IHNoYWRvdyBzdGFjayBzaXplIGlzIDRHQiwgaXQgd291bGQgYmUg
YWxtb3N0CmltcG9zc2libGUgdG8gcnVuIG9uIGEgMzItYml0IHN5c3RlbS4gVXNpbmcgYXQgbGVh
c3QgMkdCIGNhbiBoZWxwCmF2b2lkIHRoaXMgaXNzdWUgaW4gdGhlIGZ1dHVyZS4gSWYgeW91IGRv
bid0IGhhdmUgYSBwcmVmZXJyZWQgZGVmYXVsdAp2YWx1ZSwgbWF5YmUgd2UgY291bGQgc3RhcnQg
d2l0aCAyRz8KCgo+IC0tIERhdmlkCj4KPiA+Cj4gPiA+IEJ1dCAzMmJpdCBwcm9ncmFtcyB3aXRo
IGxvdHMgb2YgdGhyZWFkcyBjYW4gcnVuIG91dCBvZiBWQS4KPiA+ID4gSW5jcmVhc2luZyB0aGUg
c3RhY2sgVkEgc2l6ZSBieSA1MCUgbWlnaHQgZXZlbiBnaXZlIHByb2JsZW1zIGZvciA2NGJpdAo+
ID4gPiBwcm9ncmFtcyAtIGlmIHRoZXkgYXJlIGFscmVhZHkgcmVkdWNpbmcgdGhlIHRocmVhZCBz
dGFjayBzaXplIGF2b2lkCj4gPiA+IHJ1bm5pbmcgb3V0IG9mIFZBLgo+ID4gPgo+ID4gPiBJJ3Zl
IG5vdCBjaGVja2VkLCBidXQgcHRocmVhZF9hdHRyX3NldHN0YWNrc2l6ZSgpIHNldHMgYSBsaW1p
dCBmb3IgdGhlCj4gPiA+IHRocmVhZCBzdGFjayBzaXplICh3aGljaCB3b3VsZCBvdGhlcndpc2Ug
ZGVmYXVsdCBzbyBybGltaXQoU1RBQ0spKS4KPiA+ID4gSSBkb24ndCBiZWxpZXZlIGl0IHNob3Vs
ZCB1cGRhdGUgdGhlIHJsaW1pdCB2YWx1ZSBpdHNlbGYuCj4gPiA+IEluIHdoaWNoIGNhc2UgeW91
IGFyZSB1c2luZyB0aGUgd3Jvbmcgc2l6ZS4KPiA+ID4KPiA+ID4gQnV0IGZvciBhIHRocmVhZCB3
aXRoIGEgdmVyeSByZWR1Y2VkIHN0YWNrIChzYXkgMTI4aykgeW91IHByb2JhYmx5IG9ubHkKPiA+
ID4gbmVlZCAxIHBhZ2Ugb2Ygc2hhZG93IHN0YWNrLCBhbnkgbW9yZSBjb3VsZCBlYXNpbHkgbGVh
ZCB0byBydW5uaW5nIG91dAo+ID4gPiBvZiBWQS4KPiA+ID4KPiA+ID4gLS0gRGF2aWQKPiA+Cj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
