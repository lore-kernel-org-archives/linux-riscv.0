Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B81CF6493
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Sep 2024 09:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fczZeThyxi5iSwt+Gxtam8cF8klnauo59b/eo2APRm4=; b=CiKwu5MJ52Vb8G
	2Hw91UQ1nhsMTkOa3adk301EFYLhTf82IOGgKJZ6h20R7+4TIHqI/MmkGhGLAqkLPOsNOotH5N+Ik
	fmWRQwkcIQehmIor/lRF66E5jReNDuv20PtquknF0aOSmPJkv29VWwiycvHgCc10eIi+5g5lZcqLn
	Xi/f6yuI0Q0GZa72gkp4yv2d+wPcjw692ZLCf4hpPw14IUXLJzjq4r3z5CKfF4e+rar2EMx1KD/Qi
	eLtFE++iwClY03vk5A9d7TsmnZrtD1NN1PVjfw48yPJltoFOfweM8/G0SIPcFHKXSfsheEFD3fjFp
	mw7HxTUjNSzHuX//zegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suTU6-0000000CrON-2fsb;
	Sat, 28 Sep 2024 09:11:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suTU3-0000000CrNQ-2D4n
	for linux-riscv@lists.infradead.org;
	Sat, 28 Sep 2024 09:11:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3D975C056B
	for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 09:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B3AC4CECF
	for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727514682;
	bh=li0bXHR0TvXcwt8qhQR9j/FFiIA5/ek6EQTh0iCst/Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b1/fXMcyj6RG+4FeYlLcnEoKnbZmjb4NUFZjgiidVyDyPc5ve0S22mvTiw4BTahWd
	 lVLpFBvsUgtpKwHbj2sQpX3NtP6eiN4yh09Bg7NFhZa8zqs8S1tjQYUOj9+md/sM12
	 VQ+7+3cXXyXJJ7OVqEUMpPBZc8Jsts+AoISCxUfTrAsb10z4bInevJzE5Kj1arWjxL
	 jPed5Ds2y87JYWDbq7E6BbbNlgzMDXzglivDwOcaYKervxE/EThFLvDGuiH8hdJq+G
	 AOaoBRSopNeN+Wm/30PPeSpi4+lfbEbk5rqZMmCFNJAJi8jDQBIkY95cPcHsaM7Ppm
	 PGkE/TADjw+eA==
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a99fd5beb6so328218985a.0
        for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 02:11:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXe2d/XRsmdm9A+fkDGlGNKdVUSOrxBJGA7g0dVV2JW3/UWhX63F+Q/ypHt0BTGfGW/4s7AVfUXKW3YvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGTyJG+Vlv46lrDcw5gWPePPQyn1LrDcIYqb6x2f7frkvO+adf
	4ugQPvu0dD6O/uaU8KXIlE+yEcaaQZ575UT4t6gF85AsWSO5Xe1INz0Sg6bwB0TZ/a8qh8Kmjcd
	oblAbH1UfxWQTJ+hHhewNr22cxAU=
X-Google-Smtp-Source: AGHT+IGQzctwOpKFuOtCkRYlVjrpRKVgfRrk5wUSUePsrzDaXpPbQ/kK+OwI+9znW9FBFK+ZV1jb1ra9eyUnKzEamAU=
X-Received: by 2002:a05:6214:5012:b0:6b5:d90d:ea4f with SMTP id
 6a1803df08f44-6cb2f29730emr166967016d6.15.1727514681117; Sat, 28 Sep 2024
 02:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240927131355.350918-1-bjorn@kernel.org> <CAEf4BzYCf2+8JkCjWZWGaNQcEc_=WO_emP2GPBQGZyrWm8APUg@mail.gmail.com>
In-Reply-To: <CAEf4BzYCf2+8JkCjWZWGaNQcEc_=WO_emP2GPBQGZyrWm8APUg@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Sat, 28 Sep 2024 11:11:10 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNgrxUmHuY8b1AmWoR+YpBnsNZxSDCeUfBOQcC70POEU_w@mail.gmail.com>
Message-ID: <CAJ+HfNgrxUmHuY8b1AmWoR+YpBnsNZxSDCeUfBOQcC70POEU_w@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] libbpf: Add missing per-arch include path
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Mykola Lysenko <mykolal@fb.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_021123_810450_A367D386 
X-CRM114-Status: GOOD (  18.05  )
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

QW5kcmlpLAoKT24gRnJpLCAyNyBTZXB0IDIwMjQgYXQgMjI6NTEsIEFuZHJpaSBOYWtyeWlrbwo8
YW5kcmlpLm5ha3J5aWtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIFNlcCAyNywgMjAy
NCBhdCA2OjE04oCvQU0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pgo+ID4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+ID4KPiA+IGxp
YmJwZiBkb2VzIG5vdCBpbmNsdWRlIHRoZSBwZXItYXJjaCB0b29scyBpbmNsdWRlIHBhdGgsIGUu
Zy4KPiA+IHRvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS4gU29tZSBhcmNoaXRlY3R1cmVzIGRlcGVu
ZCB0aG9zZSBmaWxlcyB0bwo+ID4gYnVpbGQgcHJvcGVybHkuCj4gPgo+ID4gSW5jbHVkZSB0b29s
cy9hcmNoLyQoU1VCQVJDSCkvaW5jbHVkZSBpbiB0aGUgbGliYnBmIGJ1aWxkLgo+ID4KPiA+IEZp
eGVzOiA2ZDc0ZDE3OGZlNmUgKCJ0b29sczogQWRkIHJpc2N2IGJhcnJpZXIgaW1wbGVtZW50YXRp
b24iKQo+ID4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
Pgo+ID4gLS0tCj4gPiAgdG9vbHMvbGliL2JwZi9NYWtlZmlsZSB8IDMgKystCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS90b29scy9saWIvYnBmL01ha2VmaWxlIGIvdG9vbHMvbGliL2JwZi9NYWtlZmlsZQo+ID4g
aW5kZXggMWIyMmYwZjM3Mjg4Li44NTdhNWY3YjQxM2QgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9s
aWIvYnBmL01ha2VmaWxlCj4gPiArKysgYi90b29scy9saWIvYnBmL01ha2VmaWxlCj4gPiBAQCAt
NjEsNyArNjEsOCBAQCBpZm5kZWYgVkVSQk9TRQo+ID4gIGVuZGlmCj4gPgo+ID4gIElOQ0xVREVT
ID0gLUkkKG9yICQoT1VUUFVUKSwuKSBcCj4gPiAtICAgICAgICAgIC1JJChzcmN0cmVlKS90b29s
cy9pbmNsdWRlIC1JJChzcmN0cmVlKS90b29scy9pbmNsdWRlL3VhcGkKPiA+ICsgICAgICAgICAg
LUkkKHNyY3RyZWUpL3Rvb2xzL2luY2x1ZGUgLUkkKHNyY3RyZWUpL3Rvb2xzL2luY2x1ZGUvdWFw
aSBcCj4gPiArICAgICAgICAgIC1JJChzcmN0cmVlKS90b29scy9hcmNoLyQoU1JDQVJDSCkvaW5j
bHVkZQo+ID4KPiA+ICBleHBvcnQgcHJlZml4IGxpYmRpciBzcmMgb2JqCj4gPgo+Cj4gRG8geW91
IGtub3cgd2hhdCBleGFjdGx5IGlzIHVzZWQgZnJvbSB0b29scy9hcmNoLyQoU1JDQVJDSCkvaW5j
bHVkZQo+IGZvciAoSSBhc3N1bWUpIFJJU0MtVj8gSSdtIGFza2luZyBiZWNhdXNlIHdlJ2QgbmVl
ZCB0byBtYWtlIHN1cmUgdGhhdAo+IEdpdGh1YiB2ZXJzaW9uIG9mIGxpYmJwZiBNYWtlZmlsZSBh
bmQgaW5jbHVkZSBkaXJlY3RvcnkgaGFzIGFsbCB0aGUKPiBuZWNlc3NhcnkgcGllY2VzIGFzIHdl
bGwgKHNvIEknZCBhcHByZWNpYXRlIGlmIHlvdSBjb3VsZCB0YWtlIGEgbG9vawo+IGF0IHRoYXQg
YXMgd2VsbCwgaWYgeW91IGhhdmVuJ3QgYWxyZWFkeSkuCgpBaCwgYXBvbG9naWVzIGZvciBub3Qg
c3RhdGluZyB0aGF0IGV4cGxpY2l0bHkuIEl0J3MKdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS97YmFycmllci5oLGZlbmNlLmh9CgpDaGVlcnMsCkJqw7ZybgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
