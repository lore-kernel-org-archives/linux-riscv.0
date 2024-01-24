Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4540DC47DDC
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYwzREzyVJpdoXIKda+/8PRAwVV/X3lH5acXX3MaQdA=; b=DS7L5cEKsg4GP+
	Q7v3rFnF0+0VJXtCJUXn/2CZcBhm13fj9HqYgHSAEfZ5HXH/FgDw9Y4XOFYZIrn/27HFOW8/hUPxE
	hVFpEHDV6U2HlE7HjklszNyDJe19HXUJsGEqzA84JNaRmSluvH0nPWRalUoZ7MaQzIIWM4ox4Zbw5
	GOYO0BArWE3bjRgx4e+nS8Nro7wJT8Q2J/VXmn79nd9nolDYVxDAYCevt1RX09w2TD+2lnoU/1WqD
	5HOMcGcEtOxd4x4Cc/DCiMDtr3dvmtlhARCZm3YqyJeeAmFiVUlkFld6zC8klLbRZyP97L7fh5ngr
	zfr/ccT5boirMLaVJbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYTp-001zAI-2F;
	Wed, 24 Jan 2024 08:19:29 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYTn-001z9E-0V
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 08:19:28 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d750660a0aso15253465ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 00:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706084364; x=1706689164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBK6o6GnY6AtPw3FK1bbWWcrmikSYA/tE1QF6tcz4rQ=;
        b=GX2ZFfKvpv2Yba/QmadRO/eRodmxXUIsWCla8gM6lzPSXcTgIUlFty8kk7R+foKlSB
         URe6snCseUc+QxVQ0VZWmmEB6HMfbu4viyK7RrEmjaNtWipwhKvpxFzMApjmSPkWQazT
         RLKlcfILxV3VZtaftMqFycvkxGqWdoPxbJP/Un+aPZqRU4dGm5ITgvNxavp4zlfEuOgC
         YNwjo48GR+0VFrngAs/c5e7a4xV/vWqDMACfFlZ6vhj1CxEqGJSx8Lh+1WcQPPyj98D9
         w08DORjKNdDbFit5faBnd+MGeLZh1KPNlFfeVTEWaqu2198QcgN8ipvjCRyz0Ep8rbwP
         /30g==
X-Gm-Message-State: AOJu0YyRrkQlg1zzGqxGFt0gcuJhl4fUvj38y7+j9NnGP4vVaj6ToLM9
	6/tIcGvuo2ruSNaN3rPEcAexJU7s6DGE6VSivZtpKnhMCrgHx84C
X-Google-Smtp-Source: AGHT+IHGYSTBITu5TdF72Mqb7p/EFgLgmwcQH5OP/zO5BiOYdJdq9HCi0fQxs2Uu9CxsF44i0Po/pQ==
X-Received: by 2002:a17:902:f68e:b0:1d7:88f7:678a with SMTP id l14-20020a170902f68e00b001d788f7678amr187989plg.10.1706084364211;
        Wed, 24 Jan 2024 00:19:24 -0800 (PST)
Received: from snowbird ([136.25.84.107])
        by smtp.gmail.com with ESMTPSA id y4-20020a170902d64400b001d7465c213bsm5106477plh.197.2024.01.24.00.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 00:19:23 -0800 (PST)
Date: Wed, 24 Jan 2024 00:19:21 -0800
From: Dennis Zhou <dennis@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [External] [PATCH] riscv: Fix wrong size passed to
 local_flush_tlb_range_asid()
Message-ID: <ZbDICZkatO3/lGf/@snowbird>
References: <20240123132730.2297719-1-alexghiti@rivosinc.com>
 <CAEEQ3wk5edUFTuE3H3KDGkCXj0+=i7Z1BM2M+6X-Tk9_m8X_iQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wk5edUFTuE3H3KDGkCXj0+=i7Z1BM2M+6X-Tk9_m8X_iQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_001927_190661_C5F0A228 
X-CRM114-Status: GOOD (  23.47  )
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

SGVsbG8sCgpPbiBXZWQsIEphbiAyNCwgMjAyNCBhdCAxMDo0NDoxMkFNICswODAwLCB5dW5odWkg
Y3VpIHdyb3RlOgo+IEhpIEFsZXhhbmRyZSwKPiAKPiBPbiBUdWUsIEphbiAyMywgMjAyNCBhdCA5
OjMx4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToK
PiA+Cj4gPiBsb2NhbF9mbHVzaF90bGJfcmFuZ2VfYXNpZCgpIHRha2VzIHRoZSBzaXplIGFzIGFy
Z3VtZW50LCBub3QgdGhlIGVuZCBvZgo+ID4gdGhlIHJhbmdlIHRvIGZsdXNoLCBzbyBmaXggdGhp
cyBieSBjb21wdXRpbmcgdGhlIHNpemUgZnJvbSB0aGUgZW5kIGFuZAo+ID4gdGhlIHN0YXJ0IG9m
IHRoZSByYW5nZS4KPiA+Cj4gPiBGaXhlczogN2E5MmZjOGI0ZDIwICgibW06IEludHJvZHVjZSBm
bHVzaF9jYWNoZV92bWFwX2Vhcmx5KCkiKQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9tbS90
bGJmbHVzaC5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMg
Yi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiA+IGluZGV4IDhkMTJiMjZmNWFjMy4uOTYxOTk2
NWY2NTAxIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiArKysg
Yi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiA+IEBAIC02OCw3ICs2OCw3IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBsb2NhbF9mbHVzaF90bGJfcmFuZ2VfYXNpZCh1bnNpZ25lZCBsb25nIHN0YXJ0
LAo+ID4KPiA+ICB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9u
ZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpCj4gPiAgewo+ID4gLSAgICAgICBsb2NhbF9mbHVz
aF90bGJfcmFuZ2VfYXNpZChzdGFydCwgZW5kLCBQQUdFX1NJWkUsIEZMVVNIX1RMQl9OT19BU0lE
KTsKPiA+ICsgICAgICAgbG9jYWxfZmx1c2hfdGxiX3JhbmdlX2FzaWQoc3RhcnQsIGVuZCAtIHN0
YXJ0LCBQQUdFX1NJWkUsIEZMVVNIX1RMQl9OT19BU0lEKTsKPiA+ICB9Cj4gCgpXZWxsIHRoaXMg
d2FzIGEgbWlzcyBkdXJpbmcgY29kZSByZXZpZXcuLiBJJ20gZ29pbmcgdG8gdGFrZSBhbm90aGVy
IGxvb2sKdG9tb3Jyb3cgYW5kIHRoZW4gbGlrZWx5IHB1bGwgdGhpcyBpbnRvIGEgZml4ZXMgYnJh
bmNoLgoKPiBXaGF0IG1ha2VzIG1lIGN1cmlvdXMgaXMgdGhhdCB0aGlzIHBhdGNoIGhhcyBub3Qg
YmVlbiB0ZXN0ZWQ/Cj4gQlRXLCBJdCBpcyBiZXN0IHRvIGtlZXAgdGhlIHBhcmFtZXRlciBvcmRl
ciBvZiBhbGwgZnVuY3Rpb25zIGluCj4gdGxiZmx1c2guYyBjb25zaXN0ZW50OiBjcHVtYXNrLCBz
dGFydCwgc2l6ZSwgc3RyaWRlLCBhc2lkLgo+IAoKSSBjYW4ndCBzcGVhayB0byB0aGUgcmlzY3Yg
Y29tbXVuaXRpZXMgdGVzdGluZy9yZWdyZXNzaW9uIHN1aXRlcywgYnV0CnRoaXMgd291bGQgb25s
eSBiZSBjYXVnaHQgaW4gYSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uIHRlc3QuCgpUaGF0IGJlaW5n
IHNhaWQsIEFsZXhhbmRyZSwgY2FuIHlvdSBwbGVhc2UgbG1rIHdoYXQgbGV2ZWwgb2YgdGVzdGlu
Zwp0aGlzIGhhcyBnb25lIHRocm91Z2g/CgpUaGFua3MsCkRlbm5pcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
