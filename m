Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A67ECD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LD1lB/EXYN1SvFKJESQHCPSfdwhzXonbybWSMuWnp10=; b=2t2mYxRlQxbm4h
	hncOkABn7bIrTMevYu2rktNy/3VXEO9OElwnGkJPOVJlfKD+JTRwsMdoHEkSyqmCQq2iaYYSux8Vy
	nq/VmalCi4rm2QP/KCVXODQF11vcdeTJrzPlenzVQU8/sF8NULYWBMqHGt0iwnz3eakuxW9W1RB2d
	JHIWxKnKWRo4jEmErGG5JgLs8GO9EnmGgn5Ubnwkx07F2aTvov/OxFuIGc9MIARgj04+1LqYc/443
	L3RUhPaqUvDrjAile8mQktp4STPUs3aFF0GoVO3yEP+2mvZdARmPlHQaLkwF13IdbZz+9adOJSQt6
	sq9cxeNKlyhLjznZD1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQF8-0000000B2rk-4AmP;
	Fri, 22 May 2026 13:48:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQF7-0000000B2r0-0hct
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 13:48:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BA706021A
	for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 13:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3051F00A3E
	for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 13:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779457727;
	bh=XAdkVdHYlcySFUBOB9d60INI0VTqn7iPCNrUckiEfSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fssRPY20Dyxz/cYAZdo1qxjF95zNf6DPwfqO4+J6MWEGH93cmB3q0+MsnYtIf4mOu
	 yb2F/LO4bgXDVVZtWJM+4ct2qMqAk527UXL9PHuTUlPYGw8oHZlNwVpv2sEzAnkcrW
	 rYoPk72XF8cMrkAdvU+bjT79H8QBrkkrFnU3POv8SQ9y83JqXAiA2qGn+LwaCE7CbH
	 mydY4KMHGknk/wbzPm/k4VXT2aMv/tt5hKvMmQYuGoY0PrpI9XAnuVQcyxvRoLuNWj
	 8uaBe6X3EksWrohYip6eKCS7TiRDlXSyUEYD1+I0+oxJ/3PXuXltrCZPf7+nmrAZEo
	 4IW9Ggc3VmhZA==
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-95d439bd3a5so1813239241.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 06:48:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ832zWLxDcb6PzZA3suZuSKMChcsSSPcKMPviyVp8rJ1RZ0RwO4liVrtPdeFCmbtkGrPWNZCzX8Jc/Uxw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2AIQfk7csniwFupcwPUcvxz+tvlEDVNi3DJz40LzCAF7SzJca
	KOASZlu0H+3C+y0UIOPdOR7y/9oipJ83R58cGD/iYUN/QtSabpjRwktFCwWGMp112IkIcpQFPKO
	wpcSZ90mZpkzeUGQqrsXStAO3TV1bh/c=
X-Received: by 2002:a05:6102:3f8e:b0:607:97b7:c283 with SMTP id
 ada2fe7eead31-67c7fff0701mr1602325137.14.1779457727053; Fri, 22 May 2026
 06:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <ag4kj84EcKqamdB-@casper.infradead.org> <20260522023305.98223-1-baohua@kernel.org>
 <ahBVh4NM2uoyhPNm@casper.infradead.org> <CAGsJ_4zQuJx1reJxgV387Gh0AqWF0KdoFn9KahQ1BNLPRm57TQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4zQuJx1reJxgV387Gh0AqWF0KdoFn9KahQ1BNLPRm57TQ@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 22 May 2026 21:48:35 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zrm3sCp8Uz0Gh+sAwRcdtNF8rDLqX250sFVG3rZy9HNw@mail.gmail.com>
X-Gm-Features: AVHnY4Kzckk2STAPsRlCTXxCXlI9-5Kzu1EhehIrviADTgZ0pSseIwikwC-HrOY
Message-ID: <CAGsJ_4zrm3sCp8Uz0Gh+sAwRcdtNF8rDLqX250sFVG3rZy9HNw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, bhe@redhat.com, chentao@kylinos.cn, 
	chrisl@kernel.org, david@kernel.org, jack@suse.cz, kasong@tencent.com, 
	kunwu.chan@gmail.com, liam@infradead.org, lianux.mm@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	liyangouwen1@oppo.com, ljs@kernel.org, loongarch@lists.linux.dev, 
	mhocko@suse.com, nphamcs@gmail.com, nzzhao@126.com, pfalcato@suse.de, 
	rppt@kernel.org, shikemeng@huaweicloud.com, surenb@google.com, 
	vbabka@kernel.org, wanglian@kylinos.cn, youngjun.park@lge.com
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

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgOTozNuKAr1BNIEJhcnJ5IFNvbmcgPGJhb2h1YUBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDIyLCAyMDI2IGF0IDk6MDnigK9QTSBNYXR0
aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBN
YXkgMjIsIDIwMjYgYXQgMTA6MzM6MDVBTSArMDgwMCwgQmFycnkgU29uZyAoWGlhb21pKSB3cm90
ZToKPiA+ID4gbmVlZCB0byB0b3VjaCBgZmlsZW1hcC5jYCBhdCBhbGwgKHByb2JhYmx5IGJlY2F1
c2UgeW91IGFyZSBhbHJlYWR5Cj4gPiA+IG1haW50YWluaW5nIGBmaWxlbWFwLmNgIHBlcmZlY3Rs
eSk6Cj4gPgo+ID4gSSdtIGdvaW5nIHRvIGdpdmUgeW91IG9uZSBjaGFuY2UgdG8gYXBvbG9naXNl
IGZvciB0aGF0Lgo+Cj4gQXBvbG9naWVzIGlmIG15IHdvcmRpbmcgY2F1c2VkIGFueSBtaXN1bmRl
cnN0YW5kaW5nLgo+IFRoYXQgd2FzIG5vdCBteSBpbnRlbnRpb24gYXQgYWxsLgo+Cj4gV2hhdCBJ
IG1lYW50IGlzIHRoYXQgZmlsZW1hcC5jIGFscmVhZHkgaGFzIGEgdmVyeQo+IHNvbGlkIGRlc2ln
bi4KPgo+IEZvciBtZW1vcnkuYywgSSBoYWQgdG8gdG91Y2ggc2V2ZXJhbCBwbGFjZXMgZm9yIHRo
ZQo+IGJsYWNrbGlzdDsgb3RoZXJ3aXNlLCB0aGUga2VybmVsIHdvdWxkIGhhbmcuCj4KPiBCdXQg
Zm9yIGZpbGVtYXAuYywgSSBiYXNpY2FsbHkgZGlkbid0IG5lZWQgdG8gdG91Y2gKPiBhbnl0aGlu
ZywgYW5kIHByZWxpbWluYXJ5IHRlc3Rpbmcgc2hvd3Mgbm8gaXNzdWVzIGFmdGVyCj4gbW92aW5n
IGl0IGZyb20gdGhlIHdoaXRlbGlzdCB0byB0aGUgYmxhY2tsaXN0LiBUaGlzIGlzCgpTb3JyeSwg
SSBmZWVsIEkgbWF5IGJlIGNhdXNpbmcgc29tZSBtaXN1bmRlcnN0YW5kaW5nCmFnYWluLgoKQnkg
IndoaXRlbGlzdCIsIEkgbWVhbiBJIHVzZWQgdG8gYWxsb3cgY2VydGFpbiBjYXNlcwp0byB1c2Ug
cGVyLXZtYSByZXRyeS4KCkJ5ICJibGFja2xpc3QiLCBJIG1lYW4gSSBhbSBub3cgbW92aW5nIHRv
IGRpc2FsbG93CmNlcnRhaW4gY2FzZXMgZnJvbSB1c2luZyBwZXItdm1hIHJldHJ5LgoKUmlnaHQg
bm93LCBJIGhhdmUgdG8gYWRkIHNldmVyYWwgY2FzZXMgaW4gbWVtb3J5LmMKdG8gdGhlIGJsYWNr
bGlzdDsgb3RoZXJ3aXNlLCB0aGUga2VybmVsIHdvdWxkIGhhbmcuCgpCdXQgaXQgc2VlbXMgdGhh
dCBldmVyeXRoaW5nIGluIGZpbGVtYXAuYyBpcyBmaW5lIHNvCmZhciBiYXNlZCBvbiB0ZXN0aW5n
LgoKSSdtIG5vdCBzdXJlIGlmIEkndmUgZXhwbGFpbmVkIHRoaW5ncyBjbGVhcmx5LiBQbGVhc2UK
bGV0IG1lIGtub3cgaWYgYW55dGhpbmcgaXMgc3RpbGwgdW5jbGVhciBvciBpbnN1ZmZpY2llbnQu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
