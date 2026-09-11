Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F03C88E53
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 17:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pbkh2ui9Km8u7t0akOTY2BdwPPTNyhTxND59crbt2zQ=; b=48lUHVvUXl7wD/
	xrviBymUTKsziQDCkPv1JIvWy/0122GV8svf2ei34f+76OgfJR0TPhXIUiubO5/wVlCp8BpR5hXFP
	0PZg7Adrvculv6AeLfOx83SKvZtspd+YKQsZc3u4gudR/PgF6t2nnjmVslhH0Y8q2PfKOxJ+yxOCn
	tXr4268WCZAmvK2UiJM8jm4o1ChUOe22dYyD65GZIrfS7cbCuZeWqYq6sog2iTs7lfbZSxS2nbjk8
	bBUoTh26+ZuNslEpYK9JkD7/hJAkK70tyljkr8D7s675+y+RkSvQjSU2Nr0Hzsb0gdYnKlIgFNB6P
	RPUc840GgDKacZL7l5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55EJ-0000000HNJz-3ZGM;
	Fri, 11 Sep 2026 17:40:03 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x55EH-0000000HNJA-0gTM
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 17:40:02 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-86927f9ba4dso1230116b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 10:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789148400; x=1789753200; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wl3IKortcFpGKddT3RAr007iJEhPfwcrwYUS/tqDJm4=;
        b=dTjKePpIFOJ/YmibQjKfbG5cY0MfCUtLrF2B8wtk8h0BkWh1P2aKyfS0XDlETkENIH
         i7pK7OAfQfs9MUTmQ4mMt/wATZqHYDRd97OHshEh6IfjfXJjNgmCCilDCn+I68y8zf5U
         ofyAbXeIGfSbN28udwmY4I3ImbXkEUb5RRjjd2xUuuexFvMtf4FFOgpPbyWkJw2Kl+Kf
         9kls16CJiMOhJj5wOkoVHcW/xB7dZaTdoQzGWiPXIBc8Pkuv7g9aknAUnKjCanE/VfPG
         y6pfOzxXwAoZoJU6hchkospB9Hhwj1FKJuauCCE559oT3xJCwCVRmM4NfjDioPV5HJCc
         u6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148400; x=1789753200;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wl3IKortcFpGKddT3RAr007iJEhPfwcrwYUS/tqDJm4=;
        b=LxUAQNtRA4BPcqQ+TlgXMj+O22w4xThPCdmu2kSePt4GNQcxv++CH85qC9XFMNgQiZ
         yqhWvj8HyKeOfKBt2DsvXF8oVS63XEduK10e6p+uCpeZOrch1Ya5QJIwuWwiMhV4DA4l
         +zezusG7UGi0wW7Mlb/AF5oEU5iJK55RFAnkMEDMO8HmH/dsEUN1JAHPgxPM22QEVR3W
         Sh5jvDIYVZQSzF5ozw485KNXcfi7y72/eu42+WHc1UAoZk3cUQkK/H5QAtil+h9e9ATq
         y3/pHVWj9PNoIkYLrK7Gp2P24oJYUQRC1hulZVFV615cCIaWSB6OdHB+vUwak+YdA+7z
         veFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3M2yAJhkjFYDeQHdHJVsP4K49X+Rq+60L4EEo3glzI24Lb2a7AbjmY1Oq8FBOXEdBJZx0n17qEqEm7A==@lists.infradead.org
X-Gm-Message-State: AFuF++mf3Wyb6XFSUeQJ4uF0xX+KmDPhPZvNtGcsIjlD6HA4XGtgrSId
	4sV17Epn1P7o5kXX4btql5LksMfz9UUuyeWUiVSGu4Xz1yOUjVqgSu5Y
X-Gm-Gg: AYBFou2CfqmfhUP71XRa1eE2MKEGN65NK74Op3Pltllkrpq9lsRvHGPVHydWgXIJVni
	W6fBrXwGPyUD4ci1QVdHaqYiUGHDdfPtpdAhmLKQB2Ni5GT8LtI+rRgBrpA2gTRWFyM7pXQM9IH
	kJMIlpEJ/wlZ1vnTcNFmfmkQVrNSG89EYvjjvS9EAKa5jVSGXaPg1ITdpuov6yh5eGR6fGN6k0R
	+zTfk+30J45nbA+kxxKCTkGuuTo8nmvY4v/kty7kf/t5hVawI2qFxX27d5QFNL9sTuFDXdGio0b
	Z8pacJopH0s+XQy12Je1LzhUjTyUDVLIApJodq2s1A/doR+voX3hR+QgJDtiFeFfVuDSCZOpLbc
	mXePqPNaeB7b7B2PlBMtf7aKc9WuIN/jSFjvGVt1GT+sixVcf9g0tu+i7dDH27YWWpHE3AF3ru6
	FlfDF/4dXE2srjEbQwLcdNFwGIHEiVqW3P2xPC5cEpxGrjTts29zmtB8xLBLG09grwZ79FE5Yq2
	ag03HFtrO/fxcFb5akC1bBHCcr8h5bKzi0nNe6Dx5qSbw==
X-Received: by 2002:a05:6a00:28c3:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-86b3011a6efmr8754763b3a.16.1789148399726;
        Fri, 11 Sep 2026 10:39:59 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29bb9ecesm1428361b3a.43.2026.09.11.10.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:39:59 -0700 (PDT)
Date: Fri, 11 Sep 2026 23:09:48 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kees@kernel.org, amachhiw@linux.ibm.com, ritesh.list@gmail.com, 
	robh@kernel.org, sayalip@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org, 
	linux-hardening@vger.kernel.org, Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kasan: require memintrinsic prefix support for
 KASAN
Message-ID: <aqOrCdvUB5lFjNsS@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260908064948.999530-1-mkchauras@gmail.com>
 <b3b1fa5a-c836-447f-a658-ad66183c23c5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3b1fa5a-c836-447f-a658-ad66183c23c5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_104001_213784_811D5FB4 
X-CRM114-Status: GOOD (  26.22  )
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

T24gVHVlLCBTZXAgMDgsIDIwMjYgYXQgMTE6NTk6MTRBTSArMDIwMCwgQ2hyaXN0b3BoZSBMZXJv
eSAoQ1MgR1JPVVApIHdyb3RlOgo+IAo+ClsuLi5dCj4gPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20va2FzYW4uaAo+ID4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2thc2Fu
LmgKPiA+IEBAIC0yLDIwICsyLDE3IEBACj4gPiAgICNpZm5kZWYgX19BU01fS0FTQU5fSAo+ID4g
ICAjZGVmaW5lIF9fQVNNX0tBU0FOX0gKPiA+IC0jaWYgZGVmaW5lZChDT05GSUdfS0FTQU4pICYm
ICFkZWZpbmVkKENPTkZJR19DQ19IQVNfS0FTQU5fTUVNSU5UUklOU0lDX1BSRUZJWCkKPiA+IC0j
ZGVmaW5lIF9HTE9CQUxfS0FTQU4oZm4pCQkJXAo+ID4gLQlfR0xPQkFMKGZuKTsJCQkJXAo+ID4g
LQlfR0xPQkFMKF9fIyNmbikKPiA+IC0jZGVmaW5lIF9HTE9CQUxfVE9DX0tBU0FOKGZuKQkJCVwK
PiA+IC0JX0dMT0JBTF9UT0MoZm4pOwkJCVwKPiA+IC0JX0dMT0JBTF9UT0MoX18jI2ZuKQo+ID4g
LSNkZWZpbmUgRVhQT1JUX1NZTUJPTF9LQVNBTihmbikJCQlcCj4gPiAtCUVYUE9SVF9TWU1CT0wo
X18jI2ZuKQo+ID4gLSNlbHNlIC8qIENPTkZJR19LQVNBTiAmJiAhQ09ORklHX0NDX0hBU19LQVNB
Tl9NRU1JTlRSSU5TSUNfUFJFRklYICovCj4gPiArLyoKPiA+ICsgKiBwb3dlcnBjIHJlcXVpcmVz
IENDX0hBU19LQVNBTl9NRU1JTlRSSU5TSUNfUFJFRklYIHdoZW5ldmVyIEtBU0FOIGlzCj4gPiAr
ICogZW5hYmxlZCAoc2VlIFBQQ19DQ19IQVNfS0FTQU5fTUVNSU5UUklOU0lDX1BSRUZJWCBpbiBh
cmNoL3Bvd2VycGMvS2NvbmZpZyksCj4gPiArICogc28gdGhlIGNvbXBpbGVyIGFsd2F5cyBlbWl0
cyBfX2FzYW5fbWVtKigpIGF0IGluc3RydW1lbnRlZCBjYWxsIHNpdGVzIGFuZAo+ID4gKyAqIGJh
cmUgbWVtKigpIGluc2lkZSBfX25vX3Nhbml0aXplX2FkZHJlc3MgLyBub2luc3RyIGNvZGUuICBU
aGUgb2xkIGR1YWwKPiA+ICsgKiBlbnRyeS1wb2ludCB0cmljayAoX0dMT0JBTF9LQVNBTiBlbWl0
dGluZyBib3RoIG1lbXNldCBhbmQgX19tZW1zZXQpIGlzCj4gPiArICogdGhlcmVmb3JlIG5ldmVy
IG5lZWRlZC4KPiA+ICsgKi8KPiAKPiBUaGlzIGV4cGxhbmF0aW9uIGJlbG9uZ3MgdG8gdGhlIGNv
bW1pdCBtZXNzYWdlIG5vdCB0byB0aGUgc291cmNlIGNvZGUuCj4gCkhleSBDaHJpc3RvcGhlLAoK
U3VyZSBpJ2xsIG1vdmUgdGhpcyBhbmQgcmVzdCBhaGVhZC4KClsuLi5dCj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9jcHV0YWJsZS5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9j
cHV0YWJsZS5jCj4gPiBpbmRleCA2ZjY4MDFkYTlkYzEuLjQ0MTE1ZjkwNGMyYyAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvY3B1dGFibGUuYwo+ID4gKysrIGIvYXJjaC9wb3dl
cnBjL2tlcm5lbC9jcHV0YWJsZS5jCj4gPiBAQCAtMzYsOCArMzYsOCBAQCB2b2lkIF9faW5pdCBz
ZXRfY3VyX2NwdV9zcGVjKHN0cnVjdCBjcHVfc3BlYyAqcykKPiA+ICAgCXQgPSBQVFJSRUxPQyh0
KTsKPiA+ICAgCS8qCj4gPiAtCSAqIHVzZSBtZW1jcHkoKSBpbnN0ZWFkIG9mICp0ID0gKnMgc28g
dGhhdCBHQ0MgcmVwbGFjZXMgaXQKPiA+IC0JICogYnkgX19tZW1jcHkoKSB3aGVuIEtBU0FOIGlz
IGFjdGl2ZQo+ID4gKwkgKiB1c2UgbWVtY3B5KCkgaW5zdGVhZCBvZiAqdCA9ICpzIHNvIHRoYXQg
dGhlIGNvbXBpbGVyIHJlcGxhY2VzIGl0Cj4gPiArCSAqIGJ5IF9fYXNhbl9tZW1jcHkoKSB3aGVu
IEtBU0FOIGlzIGFjdGl2ZQo+ID4gICAJICovCj4gCj4gRG9lcyB0aGUgaW5pdGlhbCBwcm9ibGVt
IHN0aWxsIGV4aXN0IHdpdGggdGhlIG5ldyBfX2FzYW5fbWVtY3B5KCkgYXBwcm9hY2ggPwo+IElm
IG5vdCB0aGUgY29tbWVudCBzaG91bGQgYmUgcmVtb3ZlZC4KPiAKSGV5IENocmlzdG9waGUsCgpU
aGFua3MgZm9yIHBvaW50aW5nIGl0IG91dCwgaSB0b29rIGEgZGVlcGVyIGxvb2sgaW50byB0aGlz
LCBoZXJlJ3MgbXkKdW5kZXJzdGFuZGluZyBvbiBpdC4KCk9uIFBvd2VyUEMgZHVyaW5nIHZlcnkg
ZWFybHkgYm9vdCB0aGUga2VybmVsIGlzIGxvYWRlZCBieSB0aGUKYm9vdGxvYWRlci9maXJtd2Fy
ZSBhdCBzb21lIHBoeXNpY2FsIGFkZHJlc3MsIGJ1dCB0aGUga2VybmVsIHdhcyBsaW5rZWQKZXhw
ZWN0aW5nIGl0IHRvIHJ1biBhdCBLRVJORUxCQVNFKHZpcnR1YWwgYWRkcmVzcyBsaWtlCjB4YzAw
MDAwMDAwMDAwMDAwMCkuIFRoZSBNTVUgbWFwcGluZyB0aGF0IG1ha2VzIHRoYXQgdmlydHVhbCBh
ZGRyZXNzCnZhbGlkIGhhc24ndCBiZWVuIHNldCB1cCB5ZXQuIFNvIGZhciBmb3IgYSB3aW5kb3cg
b2YgZWFybHkgYm9vdCwgY29kZSBpcwpleGVjdXRpbmcgYXQgdGhlIHBoeXNpY2FsIGxvYWQgYWRk
cmVzcyB3aGlsZSBhbGwgc3ltYm9sIGFkZHJlc3NlcyBpbiB0aGUKYmluYXJ5IHJlZmVyIHRvIHRo
ZSB2aXJ0dWFsIGxpbmtlZCBhZGRyZXNzLiByZWxvY19vZmZzZXQoKSBjb21wdXRlcyB0aGUKZ2Fw
IGJldHdlZW4gdGhlc2UgdHdvIGFuZCBQVFJSRUxPQyBhcHBsaWVzIGl0IHRvIGFueSBwb2ludGVy
LgoKU28gUFRSUkVMT0MoJnRoZV9jcHVfc3BlYykgZ2l2ZXMgdGhlIHBoeXNpY2FsIGFkZHJlc3Mg
d2hlcmUgdGhlIHN0cnVjdAphY3R1YWxseSBsaXZlcyBpbiBtZW1vcnkgcmlnaHQgbm93LCBub3Qg
d2hlcmUgdGhlIGxpbmtlciB0aGlua3MgaXQgbGl2ZXMuCgpXaHkgKnQgPSAqcyB3b3VsZCBiZSB3
cm9uZz8KCkluIHNldF9jdXJfY3B1X3NwZWM6CgpzdHJ1Y3QgY3B1X3NwZWMgKnQgPSAmdGhlX2Nw
dV9zcGVjOyAgLy8gbGlua2VkICh2aXJ0dWFsKSBhZGRyZXNzCnQgPSBQVFJSRUxPQyh0KTsgICAg
ICAgICAgICAgICAgICAgICAvLyBwaHlzaWNhbCBhZGRyZXNzIOKAlCB3aGVyZSBpdCBhY3R1YWxs
eSBpcwptZW1jcHkodCwgcywgc2l6ZW9mKCp0KSk7ICAgICAgICAgICAgLy8gY29weSBpbnRvIHRo
ZSByaWdodCBwbGFjZQoKSWYgeW91IHdyb3RlICp0ID0gKnMgaW5zdGVhZCwgdGhlIGNvbXBpbGVy
IGdlbmVyYXRlcyBhIHN0cnVjdCBhc3NpZ25tZW50LgpGb3IgYSBsYXJnZSBzdHJ1Y3QgbGlrZSBj
cHVfc3BlYywgR0NDIGlzIGZyZWUgdG8gaW1wbGVtZW50IHRoYXQgaG93ZXZlcgppdCBsaWtlcyDi
gJQgaW5jbHVkaW5nIGVtaXR0aW5nIGEgY2FsbCB0byBtZW1jcHkoKS4gQnV0IGNydWNpYWxseSwg
YSAKY29tcGlsZXItZ2VuZXJhdGVkIG1lbWNweSBjYWxsIHJlc29sdmVzIHRocm91Z2ggdGhlIEdP
VC9QTFQgb3IgZGlyZWN0CnN5bWJvbCDigJQgd2hpY2ggcG9pbnRzIHRvIHRoZSBsaW5rZWQgdmly
dHVhbCBhZGRyZXNzIG9mIG1lbWNweSwgbm90IHRoZQpwaHlzaWNhbCBhZGRyZXNzLiBBdCB0aGlz
IHBvaW50IGluIGJvb3QsIGNhbGxpbmcgdGhyb3VnaCB0aGUgd3JvbmcKYWRkcmVzcyB3b3VsZCBq
dW1wIHRvIGdhcmJhZ2Ugb3IgYW4gdW5tYXBwZWQgcGFnZS4KCm1lbWNweSh0LCBzLCBzaXplb2Yo
KnQpKSB3cml0dGVuIGV4cGxpY2l0bHkgaXMgZGlmZmVyZW50OiB0IGlzIGFscmVhZHkKdGhlIGNv
cnJlY3RlZCBwaHlzaWNhbCBhZGRyZXNzLCBzIHBvaW50cyBpbnRvIHRoZSBjcHVfc3BlY3MgdGFi
bGUgd2hpY2gKaGFzIGFsc28gYmVlbiBQVFJSRUxPQydkLiBUaGUgZXhwbGljaXQgY2FsbCBnb2Vz
IHRocm91Z2ggdGhlIG5vcm1hbAplYXJseS1ib290IGNhbGwgbWVjaGFuaXNtIHdoaWNoIGlzIHNh
ZmUuCgpUaGUgb3JpZ2luYWwgY29tbWVudCBzYWlkOgoKInVzZSBtZW1jcHkoKSBpbnN0ZWFkIG9m
ICp0ID0gKnMgc28gdGhhdCBHQ0MgcmVwbGFjZXMgaXQgYnkgX19tZW1jcHkoKQp3aGVuIEtBU0FO
IGlzIGFjdGl2ZSIKClRoaXMgd2FzIGFkZGVkIGJlY2F1c2UgdW5kZXIgdGhlIG9sZCBLQVNBTiBz
Y2hlbWUKKCFDQ19IQVNfS0FTQU5fTUVNSU5UUklOU0lDX1BSRUZJWCksIEtBU0FOIG92ZXJyb2Rl
IHRoZSBtZW1zZXQvbWVtY3B5CmxpbmtlciBzeW1ib2xzIGdsb2JhbGx5IHdpdGggQyB3cmFwcGVy
cyB0aGF0IGNhbGxlZCBrYXNhbl9jaGVja19yYW5nZSgpLgpJZiB0aGUgY29tcGlsZXIgdHVybmVk
ICp0ID0gKnMgaW50byBhbiBpbXBsaWNpdCBtZW1jcHkoKSwgdGhhdCB3b3VsZCBoaXQKdGhlIEtB
U0FOIHdyYXBwZXIg4oCUIGNhbGxpbmcga2FzYW5fY2hlY2tfcmFuZ2UoKSBhdCBhIHBvaW50IGlu
IGVhcmx5IGJvb3QKd2hlcmUgdGhlIEtBU0FOIHNoYWRvdyBpc24ndCBtYXBwZWQgeWV0LCBjYXVz
aW5nIGEgY3Jhc2guCgpXcml0aW5nIG1lbWNweSh0LCBzLCBzaXplb2YoKnQpKSBleHBsaWNpdGx5
IG1hZGUgR0NDIGVtaXQgX19tZW1jcHkoKQoodGhlIHJhdyBhc3NlbWJseSBhbGlhcyBleHBvc2Vk
IGJ5IF9HTE9CQUxfS0FTQU4pIGluc3RlYWQgb2YgdGhlCktBU0FOLXdyYXBwZWQgbWVtY3B5KCks
IGJ5cGFzc2luZyB0aGUgc2hhZG93IGNoZWNrLgoKVGhhdCB3YXMgdGhlIHNlY29uZGFyeSByZWFz
b24uIFRoZSBwcmltYXJ5IHJlYXNvbiB0aGF0IHQgaXMgYQpQVFJSRUxPQy1hZGp1c3RlZCBwaHlz
aWNhbCBwb2ludGVyIGFuZCB0aGUgY29weSBtdXN0IGdvIHRocm91Z2ggaXQKY29ycmVjdGx5IHdh
cyBuZXZlciBzdGF0ZWQuCgpTbyB0aGUgS0FTQU4gY29tbWVudCBpcyBub3QgcmVxdWlyZWQgYnV0
IGkgdGhpbmsgd2Ugc3RpbGwgbmVlZCB0byBzdGF0ZQp3aHkgbWVtY3B5IGlzIHJlcXVpcmVkLiBG
b3IgUFRSUkVMT0MgYWRqdXN0bWVudCwgY29tbWVudCBzaG91bGQgcmVmbGVjdAp0aGF0LgoKSSds
bCB1cGRhdGUgdGhlIGNvbW1lbnQgYW5kIGNvbW1pdCBtZXNzYWdlIGFuZCBzZW5kIG91dCBhIG5l
dyB2ZXJzaW9uLgoKUmVnYXJkcywKTXVrZXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
