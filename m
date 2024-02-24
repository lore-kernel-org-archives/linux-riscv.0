Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3EAC54798
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Feb 2024 03:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDAnhe1lubPLa57WeVk1njOBnB9jnQwH0GX+GnUVlfY=; b=AnCOIvgsLqDuqs
	Si8KE7d2uOYxwg1gEDDeKVvtwtWNkcI8Jk2w7PuzuMBC8xcPZIogkkOi3N3RtNKQgVdQGbDFF6YmC
	rNcBF7NjhKjHI32j2izwq037B58hzjhAkbKHIpZgex5EtWX3darqsKCVlNAjihjKzAeSYo6gSvgwX
	ttt4BlUHtQAhGrUUSA5QcDvIz+gj5WfCPXaTq5aFMOGV0hTZMZTMH/QdIK8rimfHXleKdnknoQaHL
	iGId+pkB3NciKGXdieQgY78WPR6VdSGcNbVJv7ul7RtQB7ChXBFyBjbLpdZpDZCwRuzqTdxuY+cuF
	MgrbYPDzSi4ytT/vT36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdiro-0000000Bxcg-1FOG;
	Sat, 24 Feb 2024 03:38:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdirl-0000000Bxbl-2yVA
	for linux-riscv@lists.infradead.org;
	Sat, 24 Feb 2024 03:38:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF227CE2FAB
	for <linux-riscv@lists.infradead.org>; Sat, 24 Feb 2024 03:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298E6C43390
	for <linux-riscv@lists.infradead.org>; Sat, 24 Feb 2024 03:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708745896;
	bh=0UyBVbjjB7xZ7/uiZ6nqYEtd67m13HSbB9f2AsarlwI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f7iEKudfDaChDcQf9i96NUqzTUg9WsuvD+PUSCL2i3TAttePQa1+D563WT2unIKAd
	 FHgAqlD4l/hZAJfgdTlA8Kso8r5k+7cBrAAWORTrHxDHPwMvxJOvI6XNRp+PpydJvJ
	 UcJ6ig2DYgqgBFutktoU+mg2usQd2mY5DVkNqsWqs0CUNuRC04WFONe3buyqfXjyGg
	 E866aMbDGm4Prst2pivIoH2HsU8ZQ4sgdr8HW6AMha2tIHEiHtsX/kRnh5jGFobsUw
	 oi8K6roPY1P5BfKjDW2on+B/Ucp+bl99eVYrHtZJrR0DVP9saC1gczpEe5Rhh/6Y//
	 2QDfrupX6hk2A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512be6fda52so1360362e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 19:38:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVj1AUhw6YLNF2ZKbvxKYv3PhXSHNosW7UYtvFJ3wCxxXBJgolFpLfuowY7VEsrQfj71rLBQNQemdOeEAmKGxk7GSrMShHx7LqvPm3Gl1mc
X-Gm-Message-State: AOJu0YxHaHvBbbe4p+CYbZPh+Tq8mwDw16P8HOwugZxXMKa8TLLAX4R6
	T2FXDu3ytS3XJWV5jBt766C+anjv2ArztnVhloJaJwPInb7Sk5Oj5iNfdMhWEX3/ef0Agg/nzLD
	dUxDbPS4RLWPe+CC5uU/95egWEyQ=
X-Google-Smtp-Source: AGHT+IF1YHlALszowlOjSXLQhJwz872+dn+dGasb9uen+19ee3lm9MCkJGP4q8NuMluRVvXYtxvnsbABpPv2bg82/A4=
X-Received: by 2002:a05:6512:1053:b0:512:bf09:624a with SMTP id
 c19-20020a056512105300b00512bf09624amr953640lfb.66.1708745894613; Fri, 23 Feb
 2024 19:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20231117125807.1058477-1-masahiroy@kernel.org> <CAK7LNAStoCja1gnoFmsKikbzGZmKTcTu+Vc7v9zg8B9hwsH+iQ@mail.gmail.com>
In-Reply-To: <CAK7LNAStoCja1gnoFmsKikbzGZmKTcTu+Vc7v9zg8B9hwsH+iQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 24 Feb 2024 12:37:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNATVAcj-pa_G-NGBTr9doCACGk1nKCNbxM50-M0mi9q=7w@mail.gmail.com>
Message-ID: <CAK7LNATVAcj-pa_G-NGBTr9doCACGk1nKCNbxM50-M0mi9q=7w@mail.gmail.com>
Subject: Re: [PATCH] riscv: compat_vdso: install compat_vdso.so.dbg to /lib/modules/*/vdso/
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_193822_120382_A0448A87 
X-CRM114-Status: GOOD (  16.26  )
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

UGluZyB4IDIgPwoKCgoKCk9uIFN1biwgSmFuIDIxLCAyMDI0IGF0IDY6NDjigK9BTSBNYXNhaGly
byBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDE3
LCAyMDIzIGF0IDk6NTjigK9QTSBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Cj4gPiAnbWFrZSB2ZHNvX2luc3RhbGwnIGluc3RhbGxzIGRlYnVnIHZkc28g
ZmlsZXMgdG8gL2xpYi9tb2R1bGVzLyovdmRzby8uCj4gPgo+ID4gT25seSBmb3IgdGhlIGNvbXBh
dCB2ZHNvIG9uIHJpc2N2LCB0aGUgaW5zdGFsbGF0aW9uIGRlc3RpbmF0aW9uIGRpZmZlcnM7Cj4g
PiBjb21wYXRfdmRzby5zby5kYmcgaXMgaW5zdGFsbGVkIHRvIC9saWIvbW9kdWxlLyovY29tcGF0
X3Zkc28vLgo+ID4KPiA+IFRvIGZvbGxvdyB0aGUgc3RhbmRhcmQgaW5zdGFsbCBkZXN0aW5hdGlv
biBhbmQgc2ltcGxpZnkgdGhlIHZkc29faW5zdGFsbAo+ID4gbG9naWMsIGNoYW5nZSB0aGUgaW5z
dGFsbCBkZXN0aW5hdGlvbiB0byBzdGFuZGFyZCAvbGliL21vZHVsZXMvKi92ZHNvLy4KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPgo+
ID4gLS0tCj4KPgo+IFBpbmc/Cj4gKGluIGNhc2UgInlldCBtb3JlIFJJU0MtViB1cGRhdGVzIiBo
YXBwZW5zKQo+Cj4KPgo+Cj4gPgo+ID4gIGFyY2gvcmlzY3YvTWFrZWZpbGUgfCAyICstCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gPiBp
bmRleCBhNzRiZTc4Njc4ZWIuLjVjYmU1OTYzNDVjMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvTWFrZWZpbGUKPiA+ICsrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiA+IEBAIC0xNDYsNyAr
MTQ2LDcgQEAgZW5kaWYKPiA+ICBlbmRpZgo+ID4KPiA+ICB2ZHNvLWluc3RhbGwteSAgICAgICAg
ICAgICAgICAgKz0gYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92ZHNvLnNvLmRiZwo+ID4gLXZkc28t
aW5zdGFsbC0kKENPTkZJR19DT01QQVQpICArPSBhcmNoL3Jpc2N2L2tlcm5lbC9jb21wYXRfdmRz
by9jb21wYXRfdmRzby5zby5kYmc6Li4vY29tcGF0X3Zkc28vY29tcGF0X3Zkc28uc28KPiA+ICt2
ZHNvLWluc3RhbGwtJChDT05GSUdfQ09NUEFUKSAgKz0gYXJjaC9yaXNjdi9rZXJuZWwvY29tcGF0
X3Zkc28vY29tcGF0X3Zkc28uc28uZGJnCj4gPgo+ID4gIGlmbmVxICgkKENPTkZJR19YSVBfS0VS
TkVMKSx5KQo+ID4gIGlmZXEgKCQoQ09ORklHX1JJU0NWX01fTU9ERSkkKENPTkZJR19BUkNIX0NB
TkFBTikseXkpCj4gPiAtLQo+ID4gMi40MC4xCj4gPgo+Cj4KPiAtLQo+IEJlc3QgUmVnYXJkcwo+
IE1hc2FoaXJvIFlhbWFkYQoKCgotLQpCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
