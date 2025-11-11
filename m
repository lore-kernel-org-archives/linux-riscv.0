Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FAECCFA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 16:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/aYNhfPy2Mup/9aQRSXRV5pN0QbqusYamKd5FvBr7c=; b=Q3cxWSErxdLohi
	wcQwE+gPGeCUWqGTZ/XQRQQywzZeG/bDmfWdU/n2Yt3r9BphJv3xl3LJ3VVmUYqMuCIuo3W9wMFxm
	DTIysEeaW3k5bg+9Fsuyk391+H3C9s8Wg8DKDJrcWrOYZP6Hcxx9YmNlCUyRmj5y5nj9Bz6ScGyHZ
	vuBkOtu937TEtojloWyrOfR6YBanVSQ8G4qvsOn/fQWmGlgxT5977o3Ky1v6qNVB34N6xMv/IFYAG
	c2akVXFDlg0izuGhqN61X4NFxPl1gIKwDr4gIfG5FWsBaEGUwVfmzeXYY2vPsg1P80urL5FHYfY9z
	7Zu4CBzGuB1YrMw+wosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrZ2-00000007UbA-1Tn4;
	Tue, 11 Nov 2025 16:49:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIrYz-00000007UZl-3S8Z
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 16:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28AA644055
	for <linux-riscv@lists.infradead.org>; Tue, 11 Nov 2025 16:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034CDC116D0
	for <linux-riscv@lists.infradead.org>; Tue, 11 Nov 2025 16:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762879789;
	bh=wq1eQ9leJJwsRbg+q/+CeM5Q/J0QheoRni5LdAnm06o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fiwtCZI/RQq4oBC46/xhxQq3J73AlgQ6n72JGFoufSVUBodKPipPpSXecDmCOtlcN
	 l9DmQpbKhP0jUakBR/mK/b175IhYWYq/lC0EpGarLBQLnFG8rVduIR0o4yDDNsffBr
	 rLyNcQrZDDVvXw9ofETH3N5GzZgEzDR4cGR/oLHarLh6SLU1zb7ik+0sPkL7TkrNHF
	 Bjc5JXOCiHW2/JlcBD2hG4TGtDQSELoUQRBpcPZ064efLGTrO6LkEdCSCmYvpMc/sO
	 KYQuxKwFVZcNnzpw1nic3w+p9E/bPzGz5rz25JWvo/qgJbCHjzStzXmVddonm6IxCn
	 2X89RgecCdRQQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59435d82c1fso4522809e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Nov 2025 08:49:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEYZfc7XfU1twND96Bl4ac/XfFWDiw2NtwzQgAzT0F1lzdHohRvBXyVricvGTJutqFjVhwENlwfrfAag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmdEXh0s+I7fr2ce4IZezg9x8973MxSJmAC/U6+GDANYiGWUgJ
	dNWjOKqZlzLVHAEvC7GrkNLdJBYxdeNqjM7/Grfxj7iioxINblQtP3erMy1xAreXtRd4VSATqhp
	6uDRYxVYtZgHTqYtVmo25hifdLU5xgOA=
X-Google-Smtp-Source: AGHT+IGZvHuVSe5iJqYbExFs6eVBWwDag21rIO8Pvby8ZgKm1I1ZyqlWZO+zj9tOa/l1dRnmZWL6TeMz7UocLRGfN6w=
X-Received: by 2002:a05:6512:39cb:b0:594:2f38:4604 with SMTP id
 2adb3069b0e04-5945f1b757emr3766330e87.41.1762879787245; Tue, 11 Nov 2025
 08:49:47 -0800 (PST)
MIME-Version: 1.0
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn> <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
 <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
 <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
 <421c08e1-255b-447b-b5e3-ee6544fbefd2@loongson.cn> <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
In-Reply-To: <CAAhV-H5KsFShDJ_Cxu+1_ces8oojn8+S-7PLmE7aUj8gX5_GEw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 11 Nov 2025 17:49:36 +0100
X-Gmail-Original-Message-ID: <CAMj1kXELVc6AMXgUnjEuoetEYqBkBE3+nFH4--hFQaFGBTF3hA@mail.gmail.com>
X-Gm-Features: AWmQ_blkkBK4eB_glR3-UhpCiwa3bDzaFeiiqfcHKYfJl_7P3Ja2j5gP_FB4hrI
Message-ID: <CAMj1kXELVc6AMXgUnjEuoetEYqBkBE3+nFH4--hFQaFGBTF3hA@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_084949_898435_0A8FE765 
X-CRM114-Status: GOOD (  32.82  )
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

T24gTW9uLCAxMCBOb3YgMjAyNSBhdCAwODowMCwgSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIE5vdiAxMCwgMjAyNSBhdCA5OjE54oCvQU0gVGll
emh1IFlhbmcgPHlhbmd0aWV6aHVAbG9vbmdzb24uY24+IHdyb3RlOgo+ID4KPiA+IE9uIDIwMjUv
MTAvMjgg5LiL5Y2IOTo0NywgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4gPiA+IE9uIFN1biwgMjYg
T2N0IDIwMjUgYXQgMTI6MjAsIEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5lbC5vcmc+IHdy
b3RlOgo+ID4gPj4KPiA+ID4+IE9uIFRodSwgT2N0IDIzLCAyMDI1IGF0IDQ6MDfigK9QTSBBcmQg
Qmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4+Pgo+ID4gPj4+IE9uIFRo
dSwgMjMgT2N0IDIwMjUgYXQgMTA6MDEsIEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4gPj4+Pgo+ID4gPj4+PiBPbiBUaHUsIE9jdCAyMywgMjAyNSBhdCAyOjU1
4oCvUE0gVGllemh1IFlhbmcgPHlhbmd0aWV6aHVAbG9vbmdzb24uY24+IHdyb3RlOgo+ID4gPj4+
Pj4KPiA+ID4+Pj4+IEhpIEpvc2ggYW5kIEFyZCwKPiA+ID4+Pj4+Cj4gPiA+Pj4+PiBPbiAyMDI1
LzEwLzIwIOS4i+WNiDI6NTUsIEh1YWNhaSBDaGVuIHdyb3RlOgo+ID4gPj4+Pj4+IE9uIE1vbiwg
T2N0IDIwLCAyMDI1IGF0IDk6MjTigK9BTSBUaWV6aHUgWWFuZyA8eWFuZ3RpZXpodUBsb29uZ3Nv
bi5jbj4gd3JvdGU6Cj4gPiA+Pj4+Pj4+Cj4gPiA+Pj4+Pj4+IEhpIEpvc2gsIEFyZCBhbmQgSHVh
Y2FpLAo+ID4gPj4+Pj4+Pgo+ID4gPj4+Pj4+PiBPbiAyMDI1LzEwLzE4IOS4iuWNiDE6MDUsIEpv
c2ggUG9pbWJvZXVmIHdyb3RlOgo+ID4gPj4+Pj4+Pgo+ID4gPj4+Pj4+PiAuLi4KPiA+ID4+Pj4+
Pj4KPiA+ID4+Pj4+Pj4+IEJ1dCBJSVVDLCB0aGUgbGlic3R1YiBjb2RlIHJ1bnMgKnZlcnkqIGVh
cmx5LCBhbmQgd291bGRuJ3Qgc2hvdyB1cCBpbiBhCj4gPiA+Pj4+Pj4+PiBzdGFjayB0cmFjZSBh
bnl3YXksIGJlY2F1c2UgdGhlcmUgYXJlIG5vIHRyYWNlcyBvZiBpdCBvbiB0aGUgc3RhY2sgb25j
ZQo+ID4gPj4+Pj4+Pj4gaXQgYnJhbmNoZXMgdG8gaGVhZC5TIGNvZGUgKHdoaWNoIGRvZXNuJ3Qg
c2F2ZSB0aGUgbGluayByZWdpc3RlcikuCj4gPiA+Pj4+Pj4+Cj4gPiA+Pj4+Pj4+IFRoYW5rcyBm
b3IgeW91ciBkaXNjdXNzaW9ucy4KPiA+ID4+Pj4+Pj4KPiA+ID4+Pj4+Pj4gQXJlIHlvdSBPSyB3
aXRoIHRoaXMgY3VycmVudCBwYXRjaD8KPiA+ID4+Pj4+PiBGb3IgbWUgdGhlIGN1cnJlbnQgcGF0
Y2ggaXMganVzdCBPSy4KPiA+ID4+Pj4+Cj4gPiA+Pj4+PiBXZSBoYXZlIGRpc2N1c3NlZCB0aGlz
IGEgZmV3IHRpbWVzIGJ1dCB0aGVyZSBpcyBhbG1vc3Qgbm8gY29uc2Vuc3VzCj4gPiA+Pj4+PiBv
ZiB3aGF0IHNob3VsZCBoYXBwZW4gbmV4dCBhbmQgbm90aGluZyBjaGFuZ2VzLgo+ID4gPj4+Pj4K
PiA+ID4+Pj4+IENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBtZSBhIGNsZWFyIHJlcGx5PyBUaGVuIEkg
Y2FuIG1ha2UgcHJvZ3Jlc3MgZm9yCj4gPiA+Pj4+PiB0aGUgZm9sbG93aW5nIHNlcmllczoKPiA+
ID4+Pj4+Cj4gPiA+Pj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sb29uZ2FyY2gvMjAyNTA5
MTcxMTI3MTYuMjQ0MTUtMS15YW5ndGllemh1QGxvb25nc29uLmNuLwo+ID4gPj4+PiBGb3IgbWUs
IHRoaXMgcGF0Y2ggaXMgT0ssIGlnbm9yZSBfX2VmaXN0dWJfIHByZWZpeCBpbiBvYmp0b29sIGlz
IGFsc28KPiA+ID4+Pj4gT0sgWzFdLiBCdXQgSSBjYW5ub3QgYWNjZXB0IHRoZSB3YXkgdGhhdCBt
b2RpZnlpbmcgdGhlIGVmaXN0dWIgcGFydAo+ID4gPj4+PiBvbmx5IGZvciBMb29uZ0FyY2guCj4g
PiA+Pj4+Cj4gPiA+Pj4+IENsZWFyIGVub3VnaD8KPiA+ID4+Pj4KPiA+ID4+Pgo+ID4gPj4+IExv
b25nQXJjaCBpcyB0aGUgb25seSBhcmNoaXRlY3R1cmUgd2hpY2ggaGFzIHRoZSBwcm9ibGVtLCBz
byBJIGRvbid0Cj4gPiA+Pj4gc2VlIGEgcmVhc29uIHRvIG1vZGlmeSBvdGhlciBhcmNoaXRlY3R1
cmVzLgo+ID4gPj4gIEZyb20geW91ciByZXBseSBJIHRoaW5rIHRoZSBlZmlzdHViIGNvZGUgaXMg
Y29tcGxldGVseSByaWdodCwgYnV0Cj4gPiA+PiBvYmp0b29sIGNhbm5vdCBoYW5kbGUgdGhlICJu
b3JldHVybiIgZnVuY3Rpb24gcG9pbnRlci4gQW5kIHRoaXMgcGF0Y2gKPiA+ID4+IGlzIGEgd29y
a2Fyb3VuZCByYXRoZXIgdGhhbiBhIHByb3BlciBmaXggKHNvIHlvdSBkb24ndCB3YW50IHRvIHRv
dWNoCj4gPiA+PiBvdGhlciBhcmNoaXRlY3R1cmVzKSwgcmlnaHQ/Cj4gPiA+Pgo+ID4gPgo+ID4g
PiBUaGF0IGlzIG15IHJlYXNvbmluZywgeWVzLiBCdXQgSm9zaCBpcyByaWdodCB0aGF0IGl0IHNo
b3VsZG4ndCBtYWtlIGEKPiA+ID4gZGlmZmVyZW5jZSBpbiBwcmFjdGljZSwgSSBhbSBqdXN0IHJl
bHVjdGFudCB0byBtYWtlIGNoYW5nZXMgdG8gdGhlCj4gPiA+IGNvZGUgcnVubmluZyBvbiB0aGUg
dGFyZ2V0IHRvIGFjY29tbW9kYXRlIGEgZmxhd2VkIGJ1aWxkIHRpbWUgdG9vbC4KPiA+Cj4gPiBJ
ZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBJIHNob3VsZCBtb2RpZnkgdGhpcyBwYXRjaCB0byBy
ZW1vdmUgdGhlCj4gPiBjaGFuZ2VzIG9mIGFybSBhbmQgcmlzY3YgZm9yIG5vdywgZG8gdGhlIGNo
YW5nZXMgb25seSB3aGVuIHRoZXJlIGlzCj4gPiBhIHJlYWwgcHJvYmxlbSBvciByZXF1aXJlbWVu
dCBzb21lIGRheSwgcmlnaHQ/IElmIG5vIG1vcmUgY29tbWVudHMsCj4gPiBJIHdpbGwgc2VuZCB2
MyBsYXRlci4KPiBOb3cgZXZlcnlvbmUgaW52b2x2ZWQgYWdyZWVzIHRoYXQgdGhlIGVmaXN0dWIg
Y29kZSBpcyBjb3JyZWN0LCBzbyB0aGUKPiBwcm9wZXIgc29sdXRpb24gaXMgdG8gZml4IHRoZSBj
b21waWxlci4gQ2hhbmdpbmcgZWZpc3R1YiBjb2RlIGFuZAo+IGNoYW5naW5nIG9ianRvb2wgKGln
bm9yZSBfX2VmaXN0dWIgcHJlZml4KSBhcmUgYm90aCB3b3JrYXJvdW5kcywgYnV0IEkKPiB0aGlu
ayBjaGFuZ2luZyBvYmp0b29sIGlzIGEgbGl0dGxlIG1vcmUgcmVhc29uYWJsZS4gTWF5YmUgSm9z
aCBoYXMKPiBkaWZmZXJlbnQgaWRlYXM/Cj4KCldlbGwsIGdpdmVuIHRoYXQgb2JqdG9vbCBjYW5u
b3QgZXZlbiBpbmZlciB0aGlzIGZvciBkaXJlY3QgY2FsbHMgKGFuZApuZWVkcyB0byBidWlsdCB3
aXRoIGEgbGlzdCBvZiBrbm93biBub3JldHVybiBmdW5jdGlvbnMgaW4gdGhlIGVudGlyZQprZXJu
ZWwpLCBJIHRoaW5rIGl0IGlzIHNhZmUgdG8gYXNzdW1lIHRoYXQgZG9pbmcgdGhpcyBmb3IgaW5k
aXJlY3QKY2FsbHMgc3VjaCBhcyB0aGlzIG9uZSBpcyBpbnRyYWN0YWJsZS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
