Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11E8C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 15:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odP+WrEffexqtFOTzo/GCuXAGVDbRJgFsM1p6UXRAqg=; b=gHRnhhHUuJlp4g
	K/uAdW9m0K08dYusEVj6aBss2e0yk24CHKeEyRINiNJP3qjcCXEqhxkfXm2JQ7kIpen8zBptsKDaK
	gGLSXDDWW+i1tzXWnmKJPnoOe5TqWjkKPIdfyEuX434ZDn2IuKW/ZVXy2dKCZD+ZYnWGRPohYEmt3
	4i+Qlb5Ws+4nx4HIdtX47FVmQtTboV73/6inxu+N10NTNMd9wqhNwf/R3v8sDvIrhB44U8F2QOILv
	Ye59C4Uz4Fx1SIipmMCEA3xY5ca2o3P9KIqQnKwLf0SgM5UR0TF5tbmbF6d6r7lh2/l369LG+J/yE
	uFGE2iIUbrX0uBkBZ9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxrn-000000004xU-0hdJ;
	Wed, 20 Mar 2024 15:28:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmxrj-000000004wE-2Xvb
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 15:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2019E61027
	for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 15:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE88C43394
	for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710948509;
	bh=/fEHtW7aypddLpjPedD9VARMwM6kx3oj5E6k6UkOmFA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qyal7BuWeyisRlRbs8KsVC1L3JkToIlQQd6L/B4AjobBMj+4BqjdnlQW3FKWJqbdN
	 yljhAQxgU13XpoTJG2bUU3YpeHMDpvFcf7/e4eNnZMSTMAE0MNQ++BQlucqgooy0In
	 xiDBIsbjmj9VaT3yl7R5guqkwG9wPGfvLHoNRra8aSLp6X7x69zrfm/Chzd1gJZmZ2
	 xE1GwIYJBI+/4PpFor7u/0NfjRNh/l3McE9483Fq4CCBLg/bW7+GBPINyTz84EI5NX
	 Iie8ht2rKw7ZfgLlXB4IA4/JiV8j5ACPvJvwjpxFyC8fwkMkGptc0CLU9SYpR8Yio+
	 R60ze6L2I59bA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513c8b72b24so7743252e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2024 08:28:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvmR40ZFrkBGFgxXtixcCrX0d6iJUtZVD1SyWNH5s7FrqtpeFrUZzb0QZg5yTsH+Bw1qGo9hMtHAeZ/rmx/X0iP4BgMmXnXbn4wQGhisrh
X-Gm-Message-State: AOJu0Yw+8McoghQTFDAm+/uJIxIDajCyXadPe+c09l+NgSPMw2DqXgwN
	3Jh2eGufWz6P+REy7EY9bqcE0FMxFaMiGYHhyjNj7XW8mFC31ko2ew09dzmsQzP/vpD8LP2resP
	huv+OF83ZzpWKaSWGK5Bxbei3Ypc=
X-Google-Smtp-Source: AGHT+IF2X9xhNyqu+N2vAFSUAKeLj50RJZdHqEPAxAqqLyIIPd7+uRyCyFPngBuwG671YiMvxNquU+rvfXLnjdPZLt0=
X-Received: by 2002:a19:6408:0:b0:513:a7ce:5264 with SMTP id
 y8-20020a196408000000b00513a7ce5264mr4658635lfb.44.1710948508495; Wed, 20 Mar
 2024 08:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231117125807.1058477-1-masahiroy@kernel.org>
 <CAK7LNAStoCja1gnoFmsKikbzGZmKTcTu+Vc7v9zg8B9hwsH+iQ@mail.gmail.com> <CAK7LNATVAcj-pa_G-NGBTr9doCACGk1nKCNbxM50-M0mi9q=7w@mail.gmail.com>
In-Reply-To: <CAK7LNATVAcj-pa_G-NGBTr9doCACGk1nKCNbxM50-M0mi9q=7w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 21 Mar 2024 00:27:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNARbyP0aLMUf0zka3VXwSkoDYZcav0EBOjkosjFsAeZPyw@mail.gmail.com>
Message-ID: <CAK7LNARbyP0aLMUf0zka3VXwSkoDYZcav0EBOjkosjFsAeZPyw@mail.gmail.com>
Subject: Re: [PATCH] riscv: compat_vdso: install compat_vdso.so.dbg to /lib/modules/*/vdso/
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_082832_055135_17F9B991 
X-CRM114-Status: GOOD (  18.21  )
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

SGVsbG8gUGFsbWVyLAoKClBpbmcgeCAzLiAgQW55IGNoYW5jZSBmb3IgdGhpcyB0byBsYW5kIGR1
cmluZyB0aGUgTVc/CgpJdCBoYXMgYmVlbiA0IG1vbnRocyBzaW5jZSB0aGUgc3VibWlzc2lvbi4K
CgoKTWFzYWhpcm8KCgoKCgoKCgpPbiBTYXQsIEZlYiAyNCwgMjAyNCBhdCAxMjozN+KAr1BNIE1h
c2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gUGluZyB4IDIg
Pwo+Cj4KPgo+Cj4KPiBPbiBTdW4sIEphbiAyMSwgMjAyNCBhdCA2OjQ44oCvQU0gTWFzYWhpcm8g
WWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBOb3Yg
MTcsIDIwMjMgYXQgOTo1OOKAr1BNIE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4gPgo+ID4gPiAnbWFrZSB2ZHNvX2luc3RhbGwnIGluc3RhbGxzIGRlYnVn
IHZkc28gZmlsZXMgdG8gL2xpYi9tb2R1bGVzLyovdmRzby8uCj4gPiA+Cj4gPiA+IE9ubHkgZm9y
IHRoZSBjb21wYXQgdmRzbyBvbiByaXNjdiwgdGhlIGluc3RhbGxhdGlvbiBkZXN0aW5hdGlvbiBk
aWZmZXJzOwo+ID4gPiBjb21wYXRfdmRzby5zby5kYmcgaXMgaW5zdGFsbGVkIHRvIC9saWIvbW9k
dWxlLyovY29tcGF0X3Zkc28vLgo+ID4gPgo+ID4gPiBUbyBmb2xsb3cgdGhlIHN0YW5kYXJkIGlu
c3RhbGwgZGVzdGluYXRpb24gYW5kIHNpbXBsaWZ5IHRoZSB2ZHNvX2luc3RhbGwKPiA+ID4gbG9n
aWMsIGNoYW5nZSB0aGUgaW5zdGFsbCBkZXN0aW5hdGlvbiB0byBzdGFuZGFyZCAvbGliL21vZHVs
ZXMvKi92ZHNvLy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDxt
YXNhaGlyb3lAa2VybmVsLm9yZz4KPiA+ID4gLS0tCj4gPgo+ID4KPiA+IFBpbmc/Cj4gPiAoaW4g
Y2FzZSAieWV0IG1vcmUgUklTQy1WIHVwZGF0ZXMiIGhhcHBlbnMpCj4gPgo+ID4KPiA+Cj4gPgo+
ID4gPgo+ID4gPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiA+ID4gaW5kZXgg
YTc0YmU3ODY3OGViLi41Y2JlNTk2MzQ1YzEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
TWFrZWZpbGUKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ID4gPiBAQCAtMTQ2LDcg
KzE0Niw3IEBAIGVuZGlmCj4gPiA+ICBlbmRpZgo+ID4gPgo+ID4gPiAgdmRzby1pbnN0YWxsLXkg
ICAgICAgICAgICAgICAgICs9IGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vdmRzby5zby5kYmcKPiA+
ID4gLXZkc28taW5zdGFsbC0kKENPTkZJR19DT01QQVQpICArPSBhcmNoL3Jpc2N2L2tlcm5lbC9j
b21wYXRfdmRzby9jb21wYXRfdmRzby5zby5kYmc6Li4vY29tcGF0X3Zkc28vY29tcGF0X3Zkc28u
c28KPiA+ID4gK3Zkc28taW5zdGFsbC0kKENPTkZJR19DT01QQVQpICArPSBhcmNoL3Jpc2N2L2tl
cm5lbC9jb21wYXRfdmRzby9jb21wYXRfdmRzby5zby5kYmcKPiA+ID4KPiA+ID4gIGlmbmVxICgk
KENPTkZJR19YSVBfS0VSTkVMKSx5KQo+ID4gPiAgaWZlcSAoJChDT05GSUdfUklTQ1ZfTV9NT0RF
KSQoQ09ORklHX0FSQ0hfQ0FOQUFOKSx5eSkKPiA+ID4gLS0KPiA+ID4gMi40MC4xCj4gPiA+Cj4g
Pgo+ID4KPiA+IC0tCj4gPiBCZXN0IFJlZ2FyZHMKPiA+IE1hc2FoaXJvIFlhbWFkYQo+Cj4KPgo+
IC0tCj4gQmVzdCBSZWdhcmRzCj4gTWFzYWhpcm8gWWFtYWRhCgoKCi0tIApCZXN0IFJlZ2FyZHMK
TWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
