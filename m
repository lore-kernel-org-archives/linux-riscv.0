Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D689BCDE00C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 10:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxesRHwDpYIx4D8SIIDdDAbwfSTahYuOtMoc4/HEIhQ=; b=KQghhKRo2p3vb9
	hdXsFDA8Ei3NfZsT+UeqrXLSS79tY0cNpJ3Dd2CeW1sGzqfmn1JMkRXz4vNYMFVq3geSezF+GB05M
	gc8gSEQjnhJ6kjIBvvjDv9FcSww8mnZ74typnZrJqoS04/x692MfDwMk5oMexSI6rwZj9f7F1QlEH
	GPnz//TTY9yJF4ZPNRR0yYypSMYpryNPgkeYdksVDx9tJtINF2lwHmB6Wltpb74pNhGDgJb33dus0
	sbkFyVPkHpjpdrWhLhbQcBIHxw6k6udtkzokK00ziW18ds6ItPk40Mmpty324p+ne6+ePH5oqiFJz
	is4JyViiqBVyJAiPLFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4Hb-0000000BA1Q-3UJt;
	Fri, 26 Jun 2026 10:59:39 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4HW-0000000B9zj-1lkK
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 10:59:36 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-662bf1dab83so1291596d50.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2026 03:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782471573; cv=none;
        d=google.com; s=arc-20260327;
        b=AjXSx94V0uvDNL/Df3iHlNWzRrd2ak6KS4bpwup1mak39wJZW0Au4dT191Ks6KP/J/
         GG/Piautw7dJ0f4nXNkHoiXH+5K0lJr6SHh7uAXHeOb+SF7MVLA7+TcnPZmWMxaLCUbi
         0Z0nPwnRRKKIrq33h7XwpqI2UDfjEfmNREnvKdcNG8Jki+DnzOedLl/ygzlOIY6dwXzc
         TRj2J34YtTW7vhOF3d/jtLwiY+JHso36BH3gt0N7+qA+unkg25vZdJlXEF9Brh2wyDWD
         SPhOj5sj3ve0X44h1NPeibpgX3q34brOVhn2hKftWJtYJfy4tMv2rOgyVthDPaaikqSe
         A6XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5D+Arq0OSsap3F+LvB7ekAuzrcd4vf6SH4pb1GLsatI=;
        fh=stl4S+KHGrzbE6xA9mj6+vDGf4gFnW4M5erN8CdMwHE=;
        b=PAFmJIaqMDKkHmFo3RqMJ2WJD71zE1l3KWqajF8xgjAXZ9uvRW55DkX3mGGaK1HWFQ
         PGZcrD8nLYpx70redHhEN723Grigkqp58JYJ2/Hwz61XD7q/8YAGm2YrZNRrgfXcjdB8
         wT7fR+xcAb/yRcZwM/rpHAJU/gak60uX5ib3ppy3twZGyh917ixK1ol9P/zFvT89sAft
         PbJ9v1ynPA38kEeYfB9uvpC4RTHeJCnWRXD9KMPxNFNAEx6DTVsULfYhO2l7kU12cEf4
         GsuoakcImfCc8z/IzBNSerKqaibLUH4s0bsj2xq5amkvJjfqdX339uDSnOIu8w8xi+i/
         JM3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782471573; x=1783076373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D+Arq0OSsap3F+LvB7ekAuzrcd4vf6SH4pb1GLsatI=;
        b=Mfu0ONAp1+r4q+t+DNyaNF5X1KRPlbpypYYbWNrfjAzhcDOyC8AVr0GONV4SEuYJHh
         NuV3tTWf9/C8BZ9/NBl9CWozx9VR8PyTlW5SA/QDjCq9esmeZi86OVJZN/t3od7b0jYO
         KgCusc4hAL4XjLEDzRcsEdU2zH+ycBnt2GbAD9+P+dHc0PCUTW5P/vgh+gRVpFBr7BIY
         7XV8FkiGE7c2KvHruWX6RWos0ZOsEtfqjGTEhxcptpfoX743dZkcIKgmlF7vD9QqFOH/
         i7dtMgk9uDfp/IGZwpRiKfFbnqmae5uRDO7HPwR5ssudQgh0SOnK6lqU2P1CrbxYV9Tr
         pNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782471573; x=1783076373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5D+Arq0OSsap3F+LvB7ekAuzrcd4vf6SH4pb1GLsatI=;
        b=NQQZ2wKYVewMmZZgo94M63qZFeRYs9NnK6XZU4OMdHSKEKeAgXe0jC8nyLpe3iAcDL
         kxwCbtLRBPbfYnyVGg+vFr5NrRcCdsWkl4xrLf0kcaCLxT8E6rOXXPQGDgqJImKbHo9y
         XGv4mGvJ7ZZvWrPh85PHToKQAbjnfMOfOYpc7wp274Nxv6mVTjKAvueoFpumLEYRcadG
         XthlyTHcg017HqMQfsMQZd+uOGWrFg5b83+93Z91plv2hJW4OHMeMZ5to2eFTBARIiMV
         /xzOKFk+UXmCGCRuOp+r2sOiZU23Nd7t0mxwguCQaz3TFgYVSZUoW66ZjVGWuppBXkOB
         GdmA==
X-Forwarded-Encrypted: i=1; AHgh+RrYYMcc/SIar+VEdEmVFBAFiViLyFrGAAkFZXRaM98I1pHq6A+vyHSzXNul40QgZ0uGvCcQ4JmsU2kdxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuZeU0Zb15R3yNuVZJ7mCrFsTI+pULHE/eaZFU+S7RY8jz9RVi
	S4bQRYiMIyQ3dNdFWG+Z5yp9yhNGwIMfH4w/lwLrCiNwJp+4Xc4SiTaGFGDPuVTKSkQ0jKpNuK2
	nqRL0/HZKqs8B8yQIdf/N3dPu6/HMLDZc5zvhJjw=
X-Gm-Gg: AfdE7cmrjsK9vpVKyF8FJB/Py9lzB+OGwG8wCuuLW7hR/c3PzCxjnManoHVR1/ZXjw/
	Bkp+FfGSondnYTou6TQUplpecKD1j82Y8rMQIp+Mf8VW2IPTRZAW3M49hhOjm0u4NsIbodSXQHK
	j5cS3KP2kQtFSz1J78e1KEGQ5H0g5iJob5wGdID6elxHwCT5k4hG/Fqf7gKVUxlMixKNxJ7z/sP
	GOXlj60DKLLVBcHZNZoBpxueu+NBicqRdNSbDBl+7uL4DYNM4/pSakYLKlJE6dh/SZV0w==
X-Received: by 2002:a05:690e:1686:b0:660:48b1:50fc with SMTP id
 956f58d0204a3-66487e2f1b4mr5328375d50.29.1782471573329; Fri, 26 Jun 2026
 03:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260621145919.1453-1-ekffu200098@gmail.com> <aj426bA-YiOKt06m@kernel.org>
In-Reply-To: <aj426bA-YiOKt06m@kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Fri, 26 Jun 2026 19:59:22 +0900
X-Gm-Features: AVVi8CeTYWPFnSIqmIZ3cUOMnriJoMgLi6dkY_72NuzlW0NxE1cDivKv2fvqfq8
Message-ID: <CABFDxME8wej3m8T5gn8y4dmpOLZutm=tDTa7ZcfhbWwScTu_5Q@mail.gmail.com>
Subject: Re: [PATCH 0/6] treewide: remove unnecessary invalid range checks in
 memblock iteration loops
To: Mike Rapoport <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Will Deacon <will@kernel.org>, Alexander Potapenko <glider@google.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrey Konovalov <andreyknvl@gmail.com>, David Hildenbrand <david@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, WANG Xuerui <kernel@xen0n.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_035934_465395_F5C7CBAD 
X-CRM114-Status: GOOD (  15.39  )
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgNToyM+KAr1BNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIEp1biAyMSwgMjAyNiBhdCAxMTo1OToxMFBNICsw
OTAwLCBTYW5nLUhlb24gSmVvbiB3cm90ZToKPiA+IFRoZSBtZW1ibG9jayBBUEkgZ3VhcmFudGVl
cyB0aGF0IGZvcl9lYWNoX21lbV9yYW5nZSgpIGFuZAo+ID4gZm9yX2VhY2hfbWVtX3Bmbl9yYW5n
ZSgpIG5ldmVyIHJldHVybiBhbiBpbnZhbGlkIHJhbmdlLCBtZWFuaW5nIHN0YXJ0IGlzCj4gPiBh
bHdheXMgbGVzcyB0aGFuIGVuZC4KPiA+Cj4gPiBTZXZlcmFsIG1lbWJsb2NrIGNhbGxlcnMgc3Rp
bGwgaGF2ZSB1bm5lY2Vzc2FyeSBpbnZhbGlkIHJhbmdlIGNoZWNrcyBpbgo+ID4gdGhlaXIgbG9v
cCBib2RpZXMsIHNvIHJlbW92ZSB0aGVtLgo+ID4KPiA+IFNhbmctSGVvbiBKZW9uICg2KToKPiA+
ICAgYXJtNjQ6IG1tOiByZW1vdmUgdW5yZWFjaGFibGUgaW52YWxpZCByYW5nZSBjaGVjayBpbgo+
ID4gICAgIGthc2FuX2luaXRfc2hhZG93KCkKPiA+ICAgTG9vbmdBcmNoOiByZW1vdmUgdW5yZWFj
aGFibGUgaW52YWxpZCByYW5nZSBjaGVjayBpbiBrYXNhbl9pbml0KCkKPiA+ICAgcmlzY3Y6IHJl
bW92ZSB1bnJlYWNoYWJsZSBpbnZhbGlkIHJhbmdlIGNoZWNrIGluCj4gPiAgICAgY3JlYXRlX2xp
bmVhcl9tYXBwaW5nX3BhZ2VfdGFibGUoKQo+ID4gICByaXNjdjogcmVtb3ZlIHVucmVhY2hhYmxl
IGludmFsaWQgcmFuZ2UgY2hlY2sgaW4ga2FzYW5faW5pdCgpCj4gPiAgIG1tOiByZW1vdmUgdW5u
ZWNlc3NhcnkgZW1wdHkgcmFuZ2UgY2hlY2sgaW4KPiA+ICAgICBlYXJseV9jYWxjdWxhdGVfdG90
YWxwYWdlcygpCj4gPiAgIG1tL2h1Z2V0bGI6IHJlbW92ZSB1bm5lY2Vzc2FyeSBlbXB0eSByYW5n
ZSBjaGVjayBpbgo+ID4gICAgIGh1Z2V0bGJfYm9vdG1lbV9zZXRfbm9kZXMoKQo+Cj4gSSBxdWV1
ZWQgdGhpcyBmb3IgaW5jbHVzaW9uIGludG8gbWVtYmxvY2sgdHJlZS4KClRoYW5rIHlvdSwgTWlr
ZS4KCkNvdWxkIHlvdSBwbGVhc2UgcmV2aWV3IGFuZCBxdWV1ZSB0aGlzIHBhdGNoIFsxXSBhcyB3
ZWxsPyBJdCBkb2VzIHRoZQpzYW1lIGtpbmQgb2YgY2xlYW4gdXAsIEkganVzdCBtaXNzZWQgaXQg
YXQgdGhlIHRpbWUuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNjI2MDMy
OTAyLjcwMzk0NC0xLWVrZmZ1MjAwMDk4QGdtYWlsLmNvbS8KCj4gPiAgYXJjaC9hcm02NC9tbS9r
YXNhbl9pbml0LmMgICAgIHwgMyAtLS0KPiA+ICBhcmNoL2xvb25nYXJjaC9tbS9rYXNhbl9pbml0
LmMgfCAzIC0tLQo+ID4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICB8IDIgLS0KPiA+
ICBhcmNoL3Jpc2N2L21tL2thc2FuX2luaXQuYyAgICAgfCAzIC0tLQo+ID4gIG1tL2h1Z2V0bGIu
YyAgICAgICAgICAgICAgICAgICB8IDMgKy0tCj4gPiAgbW0vbW1faW5pdC5jICAgICAgICAgICAg
ICAgICAgIHwgMyArLS0KPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTUg
ZGVsZXRpb25zKC0pCj4gPgo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KPgo+IC0tCj4gU2luY2VyZWx5
IHlvdXJzLAo+IE1pa2UuCgpCZXN0IFJlZ2FyZHMsClNhbmctSGVvbiBKZW9uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
