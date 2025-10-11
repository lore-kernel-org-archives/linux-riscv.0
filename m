Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F212FCCD183
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 07:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dPFNKorWp1gXL25poZeAI8J+LunpgyReBsvnzM5xso=; b=hCuPHOahwfuucV
	z4tXDYIvOIyDeE0CAJv6Zw0pJ66Aw7O76ZOvwtIXct28MikhRYZSGgG01ijXtx2oylU+sHsbeW4bq
	nwc+FmdvPG3Yec+Gn9UwSnpCDH+1qJWKk9punOn4vaDsZr2tNd4BiWNQ1V1AfoOybql+U5ZLmsWFP
	P853vkUsmFv8YLsaMMS1l0UZu5bNd8ivqWNecggfTlx8Kk7kO6e+anstR19yyeXcg69eRjqhDwf+L
	U3ACsxH3H+xYiSjMPJBHQzP9QQFKf7Kue2TVdJOpwmbG3DRWMv3VRahIqONF42zN/YMUh4XFLEAPW
	VSvjOUghr4gJjNH6C9zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7UG0-00000009v9w-0DQA;
	Sat, 11 Oct 2025 07:43:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7UFx-00000009v8j-39fy
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 07:43:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 37F2748822
	for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 07:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15ABCC4CEF9
	for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 07:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760168587;
	bh=kbm4votTa6BVKLQfFvb+lq1ndb0PM/xLDZ0aG+HAUR0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T4wvTaGvuy8oReUd69CQDXFvrY7CrVInOc98VNnRcLPUYmHnSXE+quOCm3pTn7mnI
	 lUYCnCiajp7hXJnE4MRw6EEgLhT8Yj/ACK0ZsD+Mv9/5oXClTCUwNHnBtkGhncLIlJ
	 c3dydXpfo9iCJgHHLdhjPeva1+xcWx8Yz21+7kq0WmS5yT2zd9gYq1LHftXI0ntJf8
	 Ii3jBJtD9JYStcrQISejHRLakFe1NgjXBjfmSx9QF3oxfQ86ha1Dwdi5apgcgIjwhW
	 AkEsgIzm1HIpncpi1gzUjOBIxuXekoMQVEPnKkfZ4GX9IAmH6FUibNJ/2sRXuPVjYk
	 kHL+fdUO2i1yw==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-639e1e8c8c8so5417987a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 00:43:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1Q3crJTiE6ZI3dvNDzJVv9bt7quqv/yDkvWR1JSewPEGCwwmiiPdwpIfd13fU86wqyJiY7vvYDg3o0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyebEKqVte6whAdgTIWYdOXxJQEWrzogrZmC5moP8tuBUsvhxzU
	YPoAb9b4sa6zIGUibInHybh9IAlUv0sPC28SrqBZNedz+2Q6Lh7grAfZe50TdDz9ErgpgM7a8um
	B8vIVXAs7o1jDhU0KePiMNvJBkNYo7TU=
X-Google-Smtp-Source: AGHT+IHymoFTpE0VemuGRZAWH2VyeEmGDgjl2npd4Xxrf1HM3gf6i9lmx5J4yXsxnXH2TOhTcQG67Wrs2yvvN78DNvc=
X-Received: by 2002:a05:6402:23c9:b0:634:c03f:c605 with SMTP id
 4fb4d7f45d1cf-639d5c75dbfmr12498031a12.36.1760168585660; Sat, 11 Oct 2025
 00:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
 <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn> <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
 <8091e8fa-3483-af39-2f7a-e4eb62b0944f@loongson.cn> <CAAhV-H4+UGLSkbjHbq9MerWfxnq0a13x+uzNfTsCoe1UxjbWsg@mail.gmail.com>
 <CAMj1kXH-rK0bRyHXdJ-crAyMyvJHApH0WR7_8Qd8vrSPBLK+yg@mail.gmail.com> <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn>
In-Reply-To: <0c9b8e6a-96a6-91d4-946f-2109f48a529b@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 11 Oct 2025 15:42:56 +0800
X-Gmail-Original-Message-ID: <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
X-Gm-Features: AS18NWBO_ZPqa7QTYu89pI0P7ab6zSJ33a0XruFytsPgVagYFaP8MLg8Jqce60M
Message-ID: <CAAhV-H41m96fvEWG5NqAE=tykPjyzt=50CseJDeCqdG-c_WMrQ@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_004309_831776_5F70DEF0 
X-CRM114-Status: GOOD (  27.20  )
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

T24gU2F0LCBPY3QgMTEsIDIwMjUgYXQgMzoyOeKAr1BNIFRpZXpodSBZYW5nIDx5YW5ndGllemh1
QGxvb25nc29uLmNuPiB3cm90ZToKPgo+IE9uIDIwMjUvMTAvMTEg5LiK5Y2IMTE6NDAsIEFyZCBC
aWVzaGV1dmVsIHdyb3RlOgo+ID4gT24gRnJpLCAxMCBPY3QgMjAyNSBhdCAxOTo1NCwgSHVhY2Fp
IENoZW4gPGNoZW5odWFjYWlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBTYXQsIE9j
dCAxMSwgMjAyNSBhdCA5OjEz4oCvQU0gVGllemh1IFlhbmcgPHlhbmd0aWV6aHVAbG9vbmdzb24u
Y24+IHdyb3RlOgo+ID4+Pgo+ID4+PiBPbiAyMDI1LzEwLzExIOS4iuWNiDEyOjI1LCBBcmQgQmll
c2hldXZlbCB3cm90ZToKPiA+Pj4gLi4uCj4gPj4+PiBXaHkgZG8gd2UgbmVlZCBib3RoICgxKSBh
bmQgKDIpPwo+ID4+Pgo+ID4+PiBOb3QgYm90aCwgZWl0aGVyICgxKSBvciAoMikuCj4gPj4+IFdo
aWNoIG9uZSBkbyB5b3UgcHJlZmVyPyBPciBhbnkgb3RoZXIgc3VnZ2VzdGlvbnM/Cj4gPj4+Cj4g
Pj4+IFRha2luZyBhbGwgb2YgdGhlIGNvbnNpZGVyYXRpb25zIGluIGJhbGFuY2UsIHdlIHNob3Vs
ZCBkZWNpZGUKPiA+Pj4gd2hhdCBpcyB0aGUgcHJvcGVyIHdheS4KPiA+PiBBcyBhIHN1bW1hcnks
IHRoZXJlIGFyZSB0aHJlZSBtZXRob2RzOgo+ID4+ICgxKSBPbmx5IGxpbmsgbGlic3R1YiB3aXRo
IHZtbGludXgubyBkdXJpbmcgdGhlIGZpbmFsIHZtbGludXggbGluay4KPiA+PiAoMikgUmVtb3Zl
IHRoZSBhdHRyaWJ1dGUgX19ub3JldHVybiBmb3IgcmVhbF9rZXJuZWxfZW50cnkoKSBhbmQgYWRk
IHdoaWxlICgxKS4KPiA+PiAoMykgSWdub3JlICJfX2VmaXN0dWJfIiBwcmVmaXggaW4gb2JqdG9v
bC4KPiA+Pgo+ID4+IEpvc2ggcHJlZmVycyBtZXRob2QgKDEpLCBJIHByZWZlciBtZXRob2QgKDMp
IGJ1dCBhbHNvIGFjY2VwdCBtZXRob2QKPiA+PiAoMSkgaWYgaXQgaXMgbm90IG9ubHkgc3BlY2lm
aWMgdG8gbG9vbmdhcmNoLgo+ID4+Cj4gPgo+ID4gVGhpcyBpcyBhIGZhbHNlIHBvc2l0aXZlIHdh
cm5pbmcgaW4gb2JqdG9vbCwgd2hpY2ggY29tcGxhaW5zIGFib3V0IGEKPiA+IGZ1bmN0aW9uIHRo
YXQgZmFsbHMgdGhyb3VnaCwgZXZlbiB0aG91Z2ggdGhhdCBjYW4gbmV2ZXIgaGFwcGVuIGluCj4g
PiByZWFsaXR5Lgo+ID4KPiA+IFRvIG1lLCBpdCBpcyBub3QgYWNjZXB0YWJsZSB0byBtb2RpZnkg
aG93IHZtbGludXgubyBpcyBjb25zdHJ1Y3RlZAo+ID4gYWxzbyBmb3Igb3RoZXIgYXJjaGl0ZWN0
dXJlcywgaW4gb3JkZXIgdG8gaGlkZSBzb21lIG9mIGl0cyBjb25zdGl0dWVudAo+ID4gcGFydHMg
ZnJvbSBvYmp0b29sLCB3aGljaCBkbyBub3QgdXNlIG9ianRvb2wgdG8gYmVnaW4gd2l0aC4KPiA+
Cj4gPgo+ID4gSWYgeW91IGFyZSBub3Qgd2lsbGluZyB0byBmaXggb2JqdG9vbCwgSSBzdWdnZXN0
IGZpeGluZyB0aGUgbG9vbmdhcmNoCj4gPiBjb2RlIGxpa2UgdGhpczoKPgo+IFRoYW5rIHlvdS4K
Pgo+ID4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9sb29uZ2FyY2guYwo+ID4g
KysrIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9sb29uZ2FyY2guYwo+ID4gQEAgLTEw
LDcgKzEwLDcgQEAKPiA+ICAgI2luY2x1ZGUgImVmaXN0dWIuaCIKPiA+ICAgI2luY2x1ZGUgImxv
b25nYXJjaC1zdHViLmgiCj4gPgo+ID4gLXR5cGVkZWYgdm9pZCBfX25vcmV0dXJuICgqa2VybmVs
X2VudHJ5X3QpKGJvb2wgZWZpLCB1bnNpZ25lZCBsb25nIGNtZGxpbmUsCj4gPiArdHlwZWRlZiB2
b2lkICgqa2VybmVsX2VudHJ5X3QpKGJvb2wgZWZpLCB1bnNpZ25lZCBsb25nIGNtZGxpbmUsCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBzeXN0YWIpOwo+ID4KPiA+ICAgZWZpX3N0YXR1c190IGNoZWNrX3BsYXRmb3JtX2ZlYXR1cmVz
KHZvaWQpCj4gPiBAQCAtODEsNCArODEsNiBAQAo+ID4KPiA+ICAgICAgICAgIHJlYWxfa2VybmVs
X2VudHJ5KHRydWUsICh1bnNpZ25lZCBsb25nKWNtZGxpbmVfcHRyLAo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpZWZpX3N5c3RlbV90YWJsZSk7Cj4gPiArCj4g
PiArICAgICAgIHJldHVybiBFRklfTE9BRF9FUlJPUjsKPiA+ICAgfQo+Cj4gSSB0ZXN0ZWQgdGhl
IGFib3ZlIGNoYW5nZXMsIHRoZSBmYWxscyB0aHJvdWdoIG9ianRvb2wgd2FybmluZyBjYW4KPiBi
ZSBmaXhlZCBiZWNhdXNlIGVmaV9ib290X2tlcm5lbCgpIGVuZHMgd2l0aCBhIHJldHVybiBpbnN0
cnVjdGlvbiwKPiBJIHRoaW5rIHRoaXMgaXMgcmVhc29uYWJsZS4KPgo+IGVmaV9ib290X2tlcm5l
bCgpIGhhcyBhIHJldHVybiB2YWx1ZSwgdGhlcmUgYXJlICJyZXR1cm4gc3RhdHVzIiBpbgo+IG90
aGVyIHBhcnRzIG9mIGVmaV9ib290X2tlcm5lbCgpLCBpdCBzaG91bGQgYWxzbyByZXR1cm4gYXQg
dGhlIGVuZAo+IG9mIGVmaV9ib290X2tlcm5lbCgpIGluIHRoZW9yeSwgYWx0aG91Z2ggd2Ugc2hv
dWxkIG5ldmVyIGdldCBoZXJlLgo+Cj4gSWYgdGhlcmUgYXJlIG1vcmUgY29tbWVudHMsIHBsZWFz
ZSBsZXQgbWUga25vdy4KSSBzdGlsbCBkb24ndCB3YW50IExvb25nQXJjaCB0byBiZSBhIHNwZWNp
YWwgY2FzZSwgd2hpY2ggbWVhbnMKZWZpX2Jvb3Rfa2VybmVsKCkgaW4gZmR0LmMsIGp1bXBfa2Vy
bmVsX2Z1bmMgaW4gcmlzY3YuYyBhbmQKZW50ZXJfa2VybmVsIGluIGFybTY0LmMgc2hvdWxkIGFs
c28gYmUgbW9kaWZpZWQuCgpIdWFjYWkKCj4KPiBUaGFua3MsCj4gVGllemh1Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
