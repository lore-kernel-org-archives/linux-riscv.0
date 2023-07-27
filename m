Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A39C001DF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 02:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOwYOn9Ty9Qabaz1cPtbW5x4xOl/k2cE1/XJtSQ8u+0=; b=jDtyPaYIwGmZIp
	63dE2uGMe2GJn+nbugQp8xQWb5CH++IBavawtH/grhNhg71pOKhlgmgDhWc37x5sgzQ1V/+tzXvR3
	+InaqdURUfkhmY9X/Z9YFJaNsm+NRVYg0AWWswJbP8+8BPiAV2AdhmqbCs+UobixbXefRpMZbbPTX
	3xY4dry4hm9NqboH/cnLhfG2JHQSiTssGd8zERvLS7oN7jqOg2VArU068PR8+Ue1TTschlW/oskvS
	v38Gsara+k8Ys2imCH+rh53V9HaIgEdRmD9LEufB4WzC+Rs6n0sbigr/AUBP9abqdhLb6GUKWf4rp
	1MgRErFXUs0X2KB5DdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOqy1-00BxAb-0y;
	Thu, 27 Jul 2023 02:43:05 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOqxx-00Bx9i-1C
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 02:43:03 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7836164a08aso16940539f.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 19:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690425778; x=1691030578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8jyIXLWbiaPIfUNQUt/A1abaBSl99TewPn4xIRH3Gk=;
        b=dbnUFrMfJLqrJt66x+t87Cn30gCM4ssUP+qYJSr9zH+PptsSMCURpkLnIQbFBiFdWF
         UwmkDC+uzYwwo/JAe24bt9XBAXX5jibXHISDLWDE2RgZOu8QMSfQlEsLF+Xmi7TYK4vd
         3dm99tWY34wEeITB0N/MMMztVoxiOEyoYkyGXMl1fwYHaEB2EvDw/Tls3xlGbl86xO0o
         mN4FZMO+uTeKfCQD4mhLMrhm+InZmxPaxOWq7Ur1mTCqxH7JktdjtxDEvTZnlH8c1eDq
         fPvFX7HmSYvywfjg9RyMITrlL5aTIhpe7L+smnYu0PFl4Ir9Hyz9HlkgQleRn8QkxPrw
         izJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690425778; x=1691030578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8jyIXLWbiaPIfUNQUt/A1abaBSl99TewPn4xIRH3Gk=;
        b=aJQ4VUDLGxoAsM4knZZY08vuyDnpSLCikcNdVAe/h/xB517vGwkMKa0zQwiDX5yDWU
         4CIFJ47mVnAaUIylSCTyqB3yHUgqoibieWCztG2CEIr6whsfFBF1rZhsl+e/9Bh2dVte
         IlS8He0d9n3zP9M9LE04y5XLs0oFdjEDc/Oe9g1QizcBVZLhP4gxXOvji7gzXyNKmvXW
         g7onK7UrRc1etl0DGWd9I3zKp9Uj5ZTq/Aj+L2yOi6iTErftDZm6gPiJuhzjQusGMebS
         wiAx7HQRUq/wFRt5/o3ziCIdFUGMv/aRq32Tbki41A+24EVJtGSMl2jrPhG/1+CzkM7I
         FZQA==
X-Gm-Message-State: ABy/qLbkrNgBLxeM83tPxya8f1q8tN91ZsRW4EwnfKj/DOQb711J7VMF
	E/pZn69LWhnsOhURL817OF95B66z47mXqqmwSwtu6g==
X-Google-Smtp-Source: APBJJlHCjsq9WEkyIPdPbZnYZG7ki1pDsOSIOucj+Kdgdv9AAgadEJaEys0ZQLpivwimHm1HmO/UrXhpnSNMewQmKXo=
X-Received: by 2002:a6b:6014:0:b0:783:572c:9caa with SMTP id
 r20-20020a6b6014000000b00783572c9caamr3688832iog.0.1690425778618; Wed, 26 Jul
 2023 19:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <d62ceb33620cab766d809e6bbf30eaf5b46bc955.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0r=2eqpy9wLjVt1U0J7=LpnJLcKV7N9d90jvCss=7+Fzg@mail.gmail.com>
 <CAK9=C2Vg9eR5LJPeqDDQ0pHZcrT5DOUzA8_wYEVEjfnhb6s8pw@mail.gmail.com>
 <CANXhq0oTrU_-OQroW7H+hvxcU7YROhkgdCF9g_WtPTzVFQL7gA@mail.gmail.com>
 <CAK9=C2XoQjPzZ5yB5jfTbee4-Pb8GgFAZRbfcMwMk9pyo39WxQ@mail.gmail.com>
 <CANXhq0q7R9Srx6U=fReq7LDLFgW6rMmjKH=o6MzDT5AWNRXP6w@mail.gmail.com>
 <592edb17-7fa4-3b5b-2803-e8c50c322eee@linux.intel.com> <CANXhq0pS_=YxgrxSKbdfrFdGcBduzk3LTyC4vp_hqoJTbX3e0g@mail.gmail.com>
 <ZMEO1kNGfGjN6kZM@ziepe.ca>
In-Reply-To: <ZMEO1kNGfGjN6kZM@ziepe.ca>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 27 Jul 2023 10:42:47 +0800
Message-ID: <CANXhq0qMWS_j0n_aUO8BVFSedYCjuMM=Z_tsnK05ZhG+Ob6pqw@mail.gmail.com>
Subject: Re: [PATCH 03/11] dt-bindings: Add RISC-V IOMMU bindings
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Baolu Lu <baolu.lu@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, 
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_194301_456117_AA31FD13 
X-CRM114-Status: GOOD (  24.53  )
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

T24gV2VkLCBKdWwgMjYsIDIwMjMgYXQgODoxN+KAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPiB3cm90ZToKPgo+IE9uIFdlZCwgSnVsIDI2LCAyMDIzIGF0IDEyOjI2OjE0UE0gKzA4
MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAyNiwgMjAyMyBhdCAxMToyMeKAr0FN
IEJhb2x1IEx1IDxiYW9sdS5sdUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBP
biAyMDIzLzcvMjQgMjE6MjMsIFpvbmcgTGkgd3JvdGU6Cj4gPiA+ID4+Pj4+IEluIFJJU0MtViBJ
T01NVSwgY2VydGFpbiBkZXZpY2VzIGNhbiBiZSBzZXQgdG8gYnlwYXNzIG1vZGUgd2hlbiB0aGUK
PiA+ID4gPj4+Pj4gSU9NTVUgaXMgaW4gdHJhbnNsYXRpb24gbW9kZS4gVG8gaWRlbnRpZnkgdGhl
IGRldmljZXMgdGhhdCByZXF1aXJlCj4gPiA+ID4+Pj4+IGJ5cGFzcyBtb2RlIGJ5IGRlZmF1bHQs
IGRvZXMgaXQgYmUgc2Vuc2libGUgdG8gYWRkIGEgcHJvcGVydHkgdG8KPiA+ID4gPj4+Pj4gaW5k
aWNhdGUgdGhpcyBiZWhhdmlvcj8KPiA+ID4gPj4+PiBCeXBhc3MgbW9kZSBmb3IgYSBkZXZpY2Ug
aXMgYSBwcm9wZXJ0eSBvZiB0aGF0IGRldmljZSAoc2ltaWxhciB0byBkbWEtY29oZXJlbnQpCj4g
PiA+ID4+Pj4gYW5kIG5vdCBvZiB0aGUgSU9NTVUuIE90aGVyIGFyY2hpdGVjdHVyZXMgKEFSTSBh
bmQgeDg2KSBuZXZlciBhZGRlZCBzdWNoCj4gPiA+ID4+Pj4gYSBkZXZpY2UgcHJvcGVydHkgZm9y
IGJ5cGFzcyBtb2RlIHNvIEkgZ3Vlc3MgaXQgaXMgTk9UIEFEVklTQUJMRSB0byBkbyBpdC4KPiA+
ID4gPj4+Pgo+ID4gPiA+Pj4+IElmIHRoaXMgaXMgUkVBTExZIHJlcXVpcmVkIHRoZW4gd2UgY2Fu
IGRvIHNvbWV0aGluZyBzaW1pbGFyIHRvIHRoZSBRQ09NCj4gPiA+ID4+Pj4gU01NVSBkcml2ZXIg
d2hlcmUgdGhleSBoYXZlIGEgd2hpdGVsaXN0IG9mIGRldmljZXMgd2hpY2ggYXJlIGFsbG93ZWQg
dG8KPiA+ID4gPj4+PiBiZSBpbiBieXBhc3MgbW9kZSAoaS5lLiBJT01NVV9ET01BSU5fSURFTlRJ
VFkpIGJhc2VkIHRoZWlyIGRldmljZQo+ID4gPiA+Pj4+IGNvbXBhdGlibGUgc3RyaW5nIGFuZCBh
bnkgZGV2aWNlIG91dHNpZGUgdGhpcyB3aGl0ZWxpc3QgaXMKPiA+ID4gPj4+PiBibG9ja2VkIGJ5
IGRlZmF1bHQuCj4KPiBJIGhhdmUgYSBkcmFmdCBwYXRjaCBzb21lcGxhY2UgdGhhdCBjb25zb2xp
ZGF0ZWQgYWxsIHRoaXMgcXVpcmsKPiBjaGVja2luZyBpbnRvIHRoZSBjb3JlIGNvZGUuIEdlbmVy
YWxseSB0aGUgZXhwZWN0YXRpb24gaXMgdGhhdCBhbnkKPiBkZXZpY2UgYmVoaW5kIGFuIGlvbW11
IGlzIGZ1bGx5IGZ1bmN0aW9uYWwgaW4gYWxsIG1vZGVzLiBUaGUgZXhpc3RpbmcKPiBxdWlya3Mg
YXJlIGZvciBIVyBkZWZlY3RzIHRoYXQgbWFrZSBzb21lIGRldmljZXMgbm90IHdvcmsgcHJvcGVy
bHkuIEluCj4gdGhpcyBjYXNlIHRoZSByaWdodCBvdXRjb21lIHNlZW1zIHRvIGJlIGVmZmVjdGl2
ZWx5IGJsb2NraW5nIHRoZW0gZnJvbQo+IHVzaW5nIHRoZSBpb21tdS4KPgo+IFNvLCB5b3Ugc2hv
dWxkIGV4cGxhaW4gYSBsb3QgbW9yZSB3aGF0ICJyZXF1aXJlIGJ5cGFzcyBtb2RlIiBtZWFucyBp
bgo+IHRoZSBSSVNDViB3b3JsZCBhbmQgd2h5IGFueSBkZXZpY2Ugd291bGQgbmVlZCBpdC4KClBl
cmhhcHMgdGhpcyBxdWVzdGlvbiBjb3VsZCBiZSByZWxhdGVkIHRvIHRoZSBzY2VuYXJpb3MgaW4g
d2hpY2gKZGV2aWNlcyB3aXNoIHRvIGJlIGluIGJ5cGFzcyBtb2RlIHdoZW4gdGhlIElPTU1VIGlz
IGluIHRyYW5zbGF0aW9uCm1vZGUsIGFuZCB3aHkgSU9NTVUgZGVmaW5lcy9zdXBwb3J0cyB0aGlz
IGNhc2UuIEN1cnJlbnRseSwgSSBjb3VsZAplbnZpc2lvbiBhIHNjZW5hcmlvIHdoZXJlIGEgZGV2
aWNlIGlzIGFscmVhZHkgY29ubmVjdGVkIHRvIHRoZSBJT01NVQppbiBoYXJkd2FyZSwgYnV0IGl0
IGlzIG5vdCBmdW5jdGlvbmluZyBjb3JyZWN0bHksIG9yIHRoZXJlIGFyZQpwZXJmb3JtYW5jZSBp
bXBhY3RzLiBJZiBtb2RpZnlpbmcgdGhlIGhhcmR3YXJlIGlzIG5vdCBmZWFzaWJsZSwgYQpkZWZh
dWx0IGNvbmZpZ3VyYXRpb24gdGhhdCBhbGxvd3MgYnlwYXNzIG1vZGUgY291bGQgYmUgcHJvdmlk
ZWQgYXMgYQpzb2x1dGlvbi4gVGhlcmUgbWlnaHQgYmUgb3RoZXIgc2NlbmFyaW9zIHRoYXQgSSBt
aWdodCBoYXZlIG92ZXJsb29rZWQuCkl0IHNlZW1zIHRvIG1lIHNpbmNlIElPTU1VIHN1cHBvcnRz
IHRoaXMgY29uZmlndXJhdGlvbiwgaXQgd291bGQgYmUKYWR2YW50YWdlb3VzIHRvIGhhdmUgYW4g
YXBwcm9hY2ggdG8gYWNoaWV2ZSBpdCwgYW5kIERUIG1pZ2h0IGJlIGEKZmxleGlibGUgd2F5LgoK
Pgo+IEphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
