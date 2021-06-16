Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D3EC48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 16:31:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7547A61019
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 16:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7547A61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBPj3jL56ZWZFBNweCBo5AsdrALqYZt4j+z7xV20/gA=; b=F7Bd8WSLiQYiWL
	iaJSYRbnDaerR28zJKHB8DaHl7bOerpMgkwMSffu4IVi8G4OlTEDJ+h+8NIRCsnbPOJg8Jh+X4cH4
	a8ulbLY/Ay3dHLRUhLqoszq5Q3vixcwkori0Hy3L9ZHbTxYJHVhMtP9knOCY9s2W+eoPjLQLWYefU
	bN/Wqy9OEG7ZkeJKaNPMMZRrDKdagb+N7UIe6rAoZ/f8ckx2ZCDiMuPn60P765ZZh9qnvN9Cb9vp8
	YO6rqZlCy8zrJUqha6BT41EdbQbPRJRUdVegg4Yd2qdF6WkulqVXi3/9vTbrBtlihKaJCGeO4+kDi
	51Nc1sX8lTvYacfxWBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltYRe-0078VT-Cj; Wed, 16 Jun 2021 16:31:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltYRb-0078Ty-AE
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 16:31:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB779613B9
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 16:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623861071;
 bh=exkQJNSPkDaseMRDwokpCtaWrpnVtJkBzMN5rRvGQlo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y3nr9kGP16Y/4BC+VMoz6lNdMwQWz+q6AWGe4KmcKPFvsHRpckbjzLthoG5NFp7vA
 sitKaErMl0pPbSgjc+4xmre2Urlw1FSneUB16MUKMYL6lAu7syhu5H4QB0O+NZXtZ9
 rzBUnnDQ3i9qJ/JkPpATwItH0mxh7HrGJRDdEmwP0+1o2v6nGu8rC/5ksAflkGfWWq
 ZO+d33qaXUqKBWJe0wu748MdD/b0eYoo8J87dcqVKQ84ln+1xzj1ZkstsFv6OmKkUA
 6uDcEgR3OHcJx6wyvs0xTSi6Aod5OALVKkndcPpvtZTKru4IP6tjOJbVH4kdK/cQCM
 EPAFyDetWiEeg==
Received: by mail-ot1-f49.google.com with SMTP id
 b18-20020a0568301052b0290449ba7eff3cso1283351otp.7
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 09:31:10 -0700 (PDT)
X-Gm-Message-State: AOAM530ezq2ZmlKWDSXD5U71boeIkGqi7xcSjbNsMOSqQa2/xE7y9JWc
 A9Of+74SCSBItFejMcmKut4ByR6nE6718Bmz0ao=
X-Google-Smtp-Source: ABdhPJx9WT46czKGqGKZTMvu1g4TggAjHcYFrL9Wpp+S02PENnTUGH/uK+7MSGI2Zj6GCjUZrEQ4dXYVZrT4krxuSyw=
X-Received: by 2002:a9d:4c83:: with SMTP id m3mr638863otf.77.1623861070211;
 Wed, 16 Jun 2021 09:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210419005539.22729-1-mick@ics.forth.gr>
 <20210419005539.22729-6-mick@ics.forth.gr>
 <CAMuHMdW=23SPXwqcjD+30M_d0azdze2=ChZM-PF1brf9bCNtrA@mail.gmail.com>
 <fe02eb618eee141e8bc021e8e30906fc@mailhost.ics.forth.gr>
 <CAMuHMdXtT1L3yfzkTkbhqz3zgUQj89Bcm7mqz+m126NprAsK8Q@mail.gmail.com>
 <CAL_JsqLHOmZ6az0bYGC3dg__YX3aq=+Un4_x4+R2nNksc0hM2g@mail.gmail.com>
 <a488d802940f7fc2ae34a4fe583ec187@mailhost.ics.forth.gr>
 <CAL_Jsq+9eBSHUwzWBipgoSHNDvxqfrTuY4Un0PrRhoaAHugJNw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+9eBSHUwzWBipgoSHNDvxqfrTuY4Un0PrRhoaAHugJNw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 16 Jun 2021 18:30:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFfG5Sr+ix9xG3OBM8kgg8ARKNt0HFkL6MafB6vp2_xxQ@mail.gmail.com>
Message-ID: <CAMj1kXFfG5Sr+ix9xG3OBM8kgg8ARKNt0HFkL6MafB6vp2_xxQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] RISC-V: Add crash kernel support
To: Rob Herring <robh+dt@kernel.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_093111_493428_043E0408 
X-CRM114-Status: GOOD (  31.23  )
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

T24gV2VkLCAxNiBKdW4gMjAyMSBhdCAxNjo1NSwgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiArQXJkCj4KPiBPbiBUdWUsIEp1biAxNSwgMjAyMSBhdCA1OjI5IFBN
IE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+IHdyb3RlOgo+ID4KPiA+IM6jz4TO
uc+CIDIwMjEtMDYtMTUgMjI6MjEsIFJvYiBIZXJyaW5nIM6tzrPPgc6xz4jOtToKPiA+ID4gT24g
VHVlLCBKdW4gMTUsIDIwMjEgYXQgMTI6NDggUE0gR2VlcnQgVXl0dGVyaG9ldmVuCj4gPiA+IDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiA+Pgo+ID4gPj4gSGkgTmljaywKPiA+ID4+
Cj4gPiA+PiBPbiBUdWUsIEp1biAxNSwgMjAyMSBhdCA4OjI5IFBNIE5pY2sgS29zc2lmaWRpcyA8
bWlja0BpY3MuZm9ydGguZ3I+Cj4gPiA+PiB3cm90ZToKPiA+ID4+ID4gzqPPhM65z4IgMjAyMS0w
Ni0xNSAxNjoxOSwgR2VlcnQgVXl0dGVyaG9ldmVuIM6tzrPPgc6xz4jOtToKPiA+ID4+ID4gPiBU
aGlzIGRvZXMgbm90IG1hdGNoCj4gPiA+PiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2RldmljZXRy
ZWUtb3JnL2R0LXNjaGVtYS9ibG9iL21hc3Rlci9zY2hlbWFzL2Nob3Nlbi55YW1sI0w3NzoKPiA+
ID4+ID4gPgo+ID4gPj4gPiA+ICAgICAkcmVmOiB0eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50
NjQtYXJyYXkKPiA+ID4+ID4gPiAgICAgbWF4SXRlbXM6IDIKPiA+ID4+ID4gPiAgICAgZGVzY3Jp
cHRpb246Cj4gPiA+PiA+ID4gICAgICAgVGhpcyBwcm9wZXJ0eSAoY3VycmVudGx5IHVzZWQgb25s
eSBvbiBhcm02NCkgaG9sZHMgdGhlIG1lbW9yeQo+ID4gPj4gPiA+IHJhbmdlLAo+ID4gPj4gPiA+
ICAgICAgIHRoZSBhZGRyZXNzIGFuZCB0aGUgc2l6ZSwgb2YgdGhlIGVsZiBjb3JlIGhlYWRlciB3
aGljaCBtYWlubHkKPiA+ID4+ID4gPiBkZXNjcmliZXMKPiA+ID4+ID4gPiAgICAgICB0aGUgcGFu
aWNrZWQga2VybmVsXCdzIG1lbW9yeSBsYXlvdXQgYXMgUFRfTE9BRCBzZWdtZW50cyBvZiBlbGYK
PiA+ID4+ID4gPiBmb3JtYXQuCj4gPiA+PiA+ID4KPiA+ID4+ID4gPiBIZW5jZSAibGludXgsZWxm
Y29yZWhkciIgc2hvdWxkIGJlIGEgcHJvcGVydHkgb2YgdGhlIC9jaG9zZW4gbm9kZSwKPiA+ID4+
ID4gPiBpbnN0ZWFkIG9mIGEgbWVtb3J5IG5vZGUgd2l0aCBhIGNvbXBhdGlibGUgdmFsdWUgb2Yg
ImxpbnV4LGVsZmNvcmVoZHIiLgo+ID4gPj4gPiA+Cj4gPiA+PiA+Cj4gPiA+PiA+IFRoYXQncyBh
IGJpbmRpbmcgZm9yIGEgcHJvcGVydHkgb24gdGhlIC9jaG9zZW4gbm9kZSwgdGhhdCBhcyB0aGUg
dGV4dAo+ID4gPj4gPiBzYXlzIGl0J3MgZGVmaW5lZCBmb3IgYXJtNjQgb25seSBhbmQgdGhlIGNv
ZGUgdGhhdCBoYW5kbGVkIGl0IHdhcyBhbHNvCj4gPiA+Pgo+ID4gPj4gVGhhdCBkb2Vzbid0IG1l
YW4gaXQgbXVzdCBub3QgYmUgdXNlZCBvbiBvdGhlciBhcmNoaXRlY3R1cmVzIDstKQo+ID4gPj4g
QXJtNjQgd2FzIGp1c3QgdGhlIGZpcnN0IG9uZSB0byB1c2UgaXQuLi4KPiA+ID4KPiA+ID4gSXQg
aXMgdXNlZCBvbiBhcm02NCBiZWNhdXNlIG1lbW9yeSBpcyBvZnRlbiBwYXNzZWQgYnkgVUVGSSB0
YWJsZXMgYW5kCj4gPiA+IG5vdCB3aXRoIC9tZW1vcnkgbm9kZS4gQXMgcmlzY3YgaXMgYWxzbyBz
dXBwb3J0aW5nIEVGSSwgSSdkIHRoaW5rIHRoZXkKPiA+ID4gd291bGQgZG8gdGhlIHNhbWUuCj4g
PiA+Cj4gPgo+ID4gV2UndmUgaGFkIHRoaXMgZGlzY3Vzc2lvbiBiZWZvcmUsIHJpc2N2IHVzZXMg
L21lbW9yeSBmb3Igbm93IGFuZCBldmVuIGlmCj4gPiB3ZSBzd2l0Y2hlZCB0byBnZXR0aW5nIG1l
bW9yeSBmcm9tIEFDUEkvVUVGSSB0YWJsZXMsIHRoZSBlbGYgY29yZSBoZWFkZXIKPiA+IGlzIHBh
c3NlZCBmcm9tIHRoZSBjcmFzaGVkIGtlcm5lbCB0byB0aGUga2R1bXAga2VybmVsLCBpdCBoYXMg
bm90aGluZyB0bwo+ID4gZG8gd2l0aCBVRUZJIHNpbmNlIHRoZSBib290bG9hZGVyIGlzIHRoZSBr
ZXJuZWwgaXRzZWxmLiBBbSBJIG1pc3NpbmcKPiA+IHNvbWV0aGluZyA/Cj4KPiBJIGJlbGlldmUg
aWYgd2Ugb3JpZ2luYWxseSBib290ZWQgdXNpbmcgVUVGSSB0YWJsZXMsIHRoZW4gdGhvc2UgYXJl
Cj4gcGFzc2VkIHRoZSBrZHVtcCBrZXJuZWwgYXMgd2VsbC4gVGhlIG9yaWdpbmFsIERUIG1heSBo
YXZlIGhhZCBhCj4gL21lbW9yeSBub2RlLCBidXQgaXQncyBwb3NzaWJsZSBpdCBkaWRuJ3QgbWF0
Y2ggd2hhdCB3YXMgaW4gdGhlIFVFRkkKPiB0YWJsZXMuIFNvIHVzaW5nIHRoZSBEVCAvbWVtb3J5
IG5vZGVzIGZvciBrZHVtcCBjb3VsZCBnaXZlIHN1cnByaXNpbmcKPiByZXN1bHRzLiBJIHRoaW5r
IHJlc2VydmVkIHJlZ2lvbnMgYWxzbyBjb21lIGZyb20gVUVGSS4gQXJkIGNhbgo+IHByb2JhYmx5
IGNvbW1lbnQgYmV0dGVyLgo+CgpBbnl0aGluZyB0aGF0IGV4ZWN1dGVzIGluIHRoZSBjb250ZXh0
IG9mIHRoZSBVRUZJIGJvb3QgZmlybXdhcmUKKGxvYWRlcnMsIGRyaXZlcnMsIGV0YykgbWF5IHVz
ZSB0aGUgVUVGSSBtZW1vcnkgYWxsb2NhdGlvbiByb3V0aW5lcyB0bwphbGxvY2F0ZSBtZW1vcnks
IGFuZCB0aGVzZSBhbGxvY2F0aW9ucyBhcmUgY29tbXVuaWNhdGVkIHZpYSB0aGUgVUVGSQptZW1v
cnkgbWFwLCBub3QgdmlhIHRoZSAvbWVtb3J5IG5vZGUuCgpTbyBpdCBkZXBlbmRzIHdoZXRoZXIg
aXQgbWF0dGVycyBpZiB0aGUga2V4ZWMga2VybmVsIHRyYW1wbGVzIG92ZXIKdGhvc2UgcmVnaW9u
cy4gRm9yIGtkdW1wIHNjZW5hcmlvcywgaXQgbWlnaHQgYmUgcmVhc29uYWJsZSwgYnV0IGluIHRo
ZQpnZW5lcmFsIGNhc2UsIHdlIHNob3VsZCByZWFsbHkgcmVzcGVjdCB3aGF0IFVFRkkgdGVsbHMg
dXMgYWJvdXQgdGhlCm1lbW9yeSBtYXAgd2hlbiBib290aW5nIHZpYSBVRUZJLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
