Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6657F34C65
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 16:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6x6o26b1vgedoHkfRCL116WXqtHu5p8kpU2dpYe6ALo=; b=nzOZ1zbmGV5TME
	Yyj5XNswnZTQxTSUSYM9tKJMOdRvf6ESRcC49xbwCNpBfbgHXDyq6BgDwl3GjJVd68Qi48Jj+JndY
	NDwHDGWSTu6OtVulTewArwpftvImsw2bgfipJtJjemgEGiQTZvGO3W0/ph/GQb6OoGLlIorSs4JnA
	UkYzgKjJ39AgKU9ZTNlay7HfiZMhJs2sZNOD39o2kuoYfZ+7gOmCZlty04DdOZwwwx+f4UXJikiCS
	hkN1Ths8O5YiOIvIlmu7WlOIizpE3wOIRv2fmKPaY4BhP7R1sG8/W2rQLBiGZq8YanVCHO8Kpmaru
	oEsb1aaJkEJ8/KX/vsOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKac-0000000G5l4-3bsH;
	Mon, 13 Apr 2026 16:56:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKab-0000000G5jh-0KEO
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 16:56:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5D876184C
	for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 16:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71577C2BCB7
	for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776099403;
	bh=h2aM87LBp2ambqCZSnTPbSPCg4/IJ24tetHqkm6TuZ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A1/LSmdy8yQDvjhZ3UN23Bo1McCQ+BT+1wnSom64e8RPslCZBRZLZIP6DRRf0pIiu
	 AYUhIYTPlTfs63sOgeuMTapnP+rp30KAelHN3fiI7E0FL9IIN4468pLK6etoZQqowd
	 Brmmh/BJ2JTJLKuhww2KBw9Lqm+n57uNrYTJb7VSEd62ymZC4mvO1GHqDbQt1jKcNs
	 gClElEadOplATXbg2ENOVpUiy0Eeo64gftDYX8vYoWNMVxk02iYF9WT0cI6nCOI4C4
	 ftBfR9n2a7QwTBDniLN8evg6WYEqH/5xzu3IzSDok+J9OoT1JrU0gIeVjU5mbKJSbS
	 N82p1DC4TX89g==
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8acb856a674so5670416d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 09:56:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+VMZtMyh0+3lDIcUU7ebEt79VNZNosnSE3zxwbHppcoGNjAFFsKSYJZR65RYX+7w2clIfcsQHS9xedeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeZBnYwkx74JcvZyv+0NWVoEwHNVy8OXPvQso5/eDJVsK7HGXu
	hXiMCOtQ017o4EuzTJquD4ceZoLoOuMvdnKpDXjx5PQcs51pudahOYK5t+WmQLwrDNKWbWb/Plq
	Zn4GykD/lWYpB8uDDmROrjTYjAdrZEx4=
X-Received: by 2002:a05:6214:3307:b0:8ac:b2e1:3798 with SMTP id
 6a1803df08f44-8acb2e17026mr38597226d6.28.1776099402680; Mon, 13 Apr 2026
 09:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260413123256.3296452-1-puranjay@kernel.org> <20260413123256.3296452-2-puranjay@kernel.org>
In-Reply-To: <20260413123256.3296452-2-puranjay@kernel.org>
From: Song Liu <song@kernel.org>
Date: Mon, 13 Apr 2026 09:56:30 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5M6-9HdYhGnerZiSnZM=VdgN-H91ND=Qop+thEASfvQQ@mail.gmail.com>
X-Gm-Features: AQROBzA1h53NIbW6wB2_ufILfMN6eHhnFaWBiPdIcTkHfEIuA00ldjcsm5gEbB8
Message-ID: <CAPhsuW5M6-9HdYhGnerZiSnZM=VdgN-H91ND=Qop+thEASfvQQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, arm64: Remove redundant
 bpf_flush_icache() after pack allocator finalize
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pu Lehui <pulehui@huawei.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gTW9uLCBBcHIgMTMsIDIwMjYgYXQgNTozM+KAr0FNIFB1cmFuamF5IE1vaGFuIDxwdXJhbmph
eUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IGJwZl9mbHVzaF9pY2FjaGUoKSBjYWxscyBmbHVzaF9p
Y2FjaGVfcmFuZ2UoKSB0byBjbGVhbiB0aGUgZGF0YSBjYWNoZQo+IGFuZCBpbnZhbGlkYXRlIHRo
ZSBpbnN0cnVjdGlvbiBjYWNoZSBmb3IgdGhlIEpJVGVkIGNvZGUgcmVnaW9uLiBIb3dldmVyLAo+
IHNpbmNlIGNvbW1pdCAxZGFkMzkxZGFlZjEgKCJicGYsIGFybTY0OiB1c2UgYnBmX3Byb2dfcGFj
ayBmb3IgbWVtb3J5Cj4gbWFuYWdlbWVudCIpLCB0aGlzIGZsdXNoIGlzIHJlZHVuZGFudC4KPgo+
IGJwZl9qaXRfYmluYXJ5X3BhY2tfZmluYWxpemUoKSBjb3BpZXMgdGhlIEpJVGVkIGluc3RydWN0
aW9ucyB0byB0aGUgUk9YCj4gcmVnaW9uIHZpYSBicGZfYXJjaF90ZXh0X2NvcHkoKSAtPiBhYXJj
aDY0X2luc25fY29weSgpIC0+IF9fdGV4dF9wb2tlKCksCj4gYW5kIF9fdGV4dF9wb2tlKCkgYWxy
ZWFkeSBjYWxscyBmbHVzaF9pY2FjaGVfcmFuZ2UoKSBvbiB0aGUgd3JpdHRlbgo+IHJhbmdlLiBU
aGUgc3Vic2VxdWVudCBicGZfZmx1c2hfaWNhY2hlKCkgcmVwZWF0cyB0aGUgc2FtZSBjYWNoZQo+
IG1haW50ZW5hbmNlIG9uIGFuIG92ZXJsYXBwaW5nIHJhbmdlLCBpbmNsdWRpbmcgYW4gdW5uZWNl
c3Nhcnkgc2Vjb25kCj4gc3luY2hyb25vdXMgSVBJIHRvIGFsbCBDUFVzIHZpYSBraWNrX2FsbF9j
cHVzX3N5bmMoKS4KPgo+IFJlbW92ZSB0aGUgcmVkdW5kYW50IGJwZl9mbHVzaF9pY2FjaGUoKSBj
YWxsIGFuZCBpdHMgbm93LXVudXNlZAo+IGRlZmluaXRpb24uCj4KPiBGaXhlczogMWRhZDM5MWRh
ZWYxICgiYnBmLCBhcm02NDogdXNlIGJwZl9wcm9nX3BhY2sgZm9yIG1lbW9yeSBtYW5hZ2VtZW50
IikKPiBTaWduZWQtb2ZmLWJ5OiBQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXlAa2VybmVsLm9yZz4K
CldlIGNhbiBub3cgcmVtb3ZlICIjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4iLgoKT3RoZXIg
dGhhbiB0aGF0LAoKQWNrZWQtYnk6IFNvbmcgTGl1IDxzb25nQGtlcm5lbC5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
