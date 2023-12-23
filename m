Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442E5C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 02:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2NQn2xEd7m3Dqf7mwiC/91Uu56Qv243GTqfcYFv5d4=; b=O/984lNLLquD5r
	/vQx05Y8npsLo22COhZSKnLXiAdZA46Je7z4RVsWRRKaNQq35HCbt8YJeLWGFaB5DgtvT7nicj8y+
	zGoGqh9d35yAu/WJzLBLeXP6K+jcSHdr3mzK2o0LVs5JZeFaJHzO5U1/rRSRy7Q/pNy2d6CvALc+M
	w4lp2m0bd7zWPZpxGcL1kGFRvORAfSxmi1SVmFdZJZ80pw5xX/GyUfVCWmUud5Efz0GJZ79eONEsP
	2uTQ1rDA8tVNFpKu8+Ujcz8XZmhI8hrguIFIb7DG3sHAts0bV7iPRf8rAqXVNfppWBQ20Nl0BbcLp
	dPErIxShBOfDgwaaFkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGrui-007D21-10;
	Sat, 23 Dec 2023 02:38:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGrue-007D1d-2g
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 02:38:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B344AB823D1
	for <linux-riscv@lists.infradead.org>; Sat, 23 Dec 2023 02:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B53C433C9
	for <linux-riscv@lists.infradead.org>; Sat, 23 Dec 2023 02:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703299128;
	bh=ssxnbrs5lADEShxHeiKZ8wSBXwAdgfEiXXPglxhgwOc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c6avuW8uy5XifohaPpgHWSrPD9jmiJML7ekXvrmQvcSLRPkqXYLvZlyc6iLOFX0ct
	 lgh08EXQqV3Fl1IJO6HwjV5zFPSgBSXhNh9PWptfdYtULpSPsP22++OBRLqROktoA0
	 Lb+FeUwWkqHLSXQOjIOhBdu9HzuxZcP0pl3HHTmAR66rIgNjW4FJE69d4QodHiOohI
	 SBIMOgGJgL5N/BqaNEmlUyVdEG03LJiwdJWTS0/nJmVAYeCLqHL73WrrKZh0r4Xtot
	 0Sv3ISfrTrNNs69VvY91QPCmEKiOwqradJCUbXFCp+q+8vge/6n3Y4z/XtDG9nPYA7
	 eLXXTBqBKa0ug==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a236456fee1so298772766b.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 18:38:48 -0800 (PST)
X-Gm-Message-State: AOJu0YzyB3UIIrZiuyfMdAjT6slEN7CydR/Hid+79GwSNKK/TG7brn5l
	f3Ki5H5t8kupqqyIKRxCWrmkBHp0X6fqAo+Ql5A=
X-Google-Smtp-Source: AGHT+IEqOWfNyNc0/2v+zmiTSbh5yAwMykeA5i+bkdNvuDjfrKJEBmZ1aTCmcj3ZE2zi0ct9AEndKv+r+ugoTgCdULE=
X-Received: by 2002:a17:906:e20a:b0:a26:9963:5e58 with SMTP id
 gf10-20020a170906e20a00b00a2699635e58mr1287608ejb.69.1703299126789; Fri, 22
 Dec 2023 18:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-5-guoren@kernel.org>
 <ZYUZ8QUJxCL93Fgv@LeoBras> <CAJF2gTTX7AjexoRUw=ZS34HEWno7H3zvnXA+Q7TYsztNU=k2cg@mail.gmail.com>
 <e3f1521a9f04463587d07d0c99534d5a@AcuMS.aculab.com>
In-Reply-To: <e3f1521a9f04463587d07d0c99534d5a@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 23 Dec 2023 10:38:35 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQb=P2+0OY+KL0aQ4=0wgfHP-R-PfjO_b0_vxvqM+t0mQ@mail.gmail.com>
Message-ID: <CAJF2gTQb=P2+0OY+KL0aQ4=0wgfHP-R-PfjO_b0_vxvqM+t0mQ@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] riscv: mm: Optimize TASK_SIZE definition
To: David Laight <David.Laight@aculab.com>
Cc: Leonardo Bras <leobras@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>, "charlie@rivosinc.com" <charlie@rivosinc.com>, 
	"xiao.w.wang@intel.com" <xiao.w.wang@intel.com>, "david@redhat.com" <david@redhat.com>, 
	"panqinglin2020@iscas.ac.cn" <panqinglin2020@iscas.ac.cn>, 
	"rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>, "willy@infradead.org" <willy@infradead.org>, 
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>, 
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>, "cleger@rivosinc.com" <cleger@rivosinc.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_183853_189263_23AA7483 
X-CRM114-Status: GOOD (  12.84  )
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

SGkgRGF2aWQsCgpPbiBGcmksIERlYyAyMiwgMjAyMyBhdCA3OjUy4oCvUE0gRGF2aWQgTGFpZ2h0
IDxEYXZpZC5MYWlnaHRAYWN1bGFiLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBHdW8gUmVuCj4gPiBT
ZW50OiAyMiBEZWNlbWJlciAyMDIzIDExOjI1Cj4gLi4uCj4gPiA+ID4gKyNkZWZpbmUgVEFTS19T
SVpFICAgIChpc19jb21wYXRfdGFzaygpID8gXAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgVEFTS19TSVpFXzMyIDogVEFTS19TSVpFXzY0KQo+ID4gSSB3b3VsZCByZW1vdmUgaXNfY29t
cGF0X3Rhc2soKSBpbiB0aGUgbmV4dCB2ZXJzaW9uIGJlY2F1c2UgeW91ciBwYXRjaAo+ID4gY29u
dGFpbnMgdGhhdC4KPgo+IERvZXMgVEFTS19TSVpFIGdldCB1c2VkIGluIGFjY2Vzc19vaygpID8K
PiBJZiBzbyB0aGUgcmVwZWF0ZWQgZXhwYW5zaW9uIG9mIHRoYXQgJ21lc3MnIHdpbGwgc2xvdyB0
aGluZ3MgZG93bi4KPgo+IE9UT0ggYWNjZXNzX29rKHB0ciwgbGVuKSBjYW4ganVzdCBjaGVjayAo
cHRyIHwgKHB0ciArIGxlbikpIDwgMCkKPiBhbmQgcmVseSBvbiB0aGUgcGFnZSBmYXVsdHMgZm9y
IGV2ZXJ5dGhpbmcgZWxzZS4KSSBtZWFuLCBJIHdvdWxkIHJlbW92ZSBpc19jb21wYXRfdGFzaygp
IG9wdGltaXphdGlvbi4KdGVzdF90aHJlYWRfZmxhZyhUSUZfMzJCSVQpIC0+IChpc19jb21wYXRf
dGFzaygpID8KU29ycnkgZm9yIHRoZSBiYWQgd29yZGluZy4KCkxlb25hcmRvJ3MgbmV3IHBhdGNo
IHNlcmllcyBjb250YWlucyB0aGUgb3B0aW1pemF0aW9uIG9uCmlzX2NvbXBhdF90YXNrKCksIHNv
IEkgY2FuY2VsZWQgbWluZS4KCgo+Cj4gICAgICAgICBEYXZpZAo+Cj4gLQo+IFJlZ2lzdGVyZWQg
QWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVz
LCBNSzEgMVBULCBVSwo+IFJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpCgoKCi0tIApC
ZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
