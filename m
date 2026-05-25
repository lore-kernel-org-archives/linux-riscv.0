Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26367CD5BD0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JUhYM759BH92JvjBvaGbUtnCKg/b77LBxCazb04J6Y=; b=0k5aD6k0+DNoaP
	3l2wIuqVhX+NYbAcuUFS7b5Ew5Eq9H5JyrmwHARVqcJdQnwLthj00tWHOxTs8pwksAwhTLwk9BZW7
	j4frZraw2q0whO1wOvgfw2iXUplsXQEIjgjNRA9Dp5u/vXh8nnpcs/EbfQeav0VRIwU1gZs07ZtYA
	To0zNjV/84jGsu+dd6j+kPk9oC1EY5n7d4YT8yW4RO9XL0/2dHFstHXX053yJsad0zDfu84f2El6Z
	eo9I3XiqapBkRaYpvf4eZZV+5V+i7QojhkzJc3J97oIfk8qj8aU2tMgN9mSz6pE7ofj9k+RJ5cFb6
	vtieyHYbTG7UmlvEyP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTcc-0000000H6h6-1qIt;
	Mon, 25 May 2026 11:37:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTca-0000000H6gd-2DnF;
	Mon, 25 May 2026 11:37:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41F3A600BB;
	Mon, 25 May 2026 11:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BBD1F000E9;
	Mon, 25 May 2026 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779709043;
	bh=kPbn/f1fuyb07lSfD/0s4GT4WdFio8z3401p2vvqFyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W9sT/QL/8R3LJxQuJnqULPdrM1nsn4daH1Hjg/KpYXguHjTqD086qv20sIL6mYl7R
	 XvOBmsbGn+aUBuuD7YmCOeIBLyz0kPBoaqx8/W3s5VRN8Uno0zD9eWzhOy98TVtqHK
	 uA5YsM6E1BhscTKFZqCHI7pnI0htTV0tK3UF7zLRCukCjMI3DNJkV8VmQGJ6ffOdN0
	 iYCyXUqWwY3mrHjVk0kX4Rj4QjgL5c4kWpv5gUyVC+8qN/Ciuck/k/UyX3sdsCSWpw
	 EdG7Pg1gWabsDFCJzyUMK6eYBu2NWAC8UFjZF4q/8uJvLDBi9zqnwL/M3hikizHgFZ
	 G0HKwZWWlmGyg==
Date: Mon, 25 May 2026 14:36:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
	skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	ruirui.yang@linux.dev, rdunlap@infradead.org, pmladek@suse.com,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	kees@kernel.org, elver@google.com, kuba@kernel.org,
	lirongqing@baidu.com, ebiggers@kernel.org, paulmck@kernel.org,
	thuth@redhat.com, ardb@kernel.org, masahiroy@kernel.org,
	mark.rutland@arm.com, maz@kernel.org, james.morse@arm.com,
	leitao@debian.org, sourabhjain@linux.ibm.com, yeoreum.yun@arm.com,
	coxu@redhat.com, jbohac@suse.cz, ryan.roberts@arm.com,
	cfsworks@gmail.com, tangyouling@kylinos.cn, ritesh.list@gmail.com,
	songshuaishuai@tinylab.org, junhui.liu@pigmoral.tech,
	vishal.moola@gmail.com, kas@kernel.org, debug@rivosinc.com,
	namcao@linutronix.de, liaoyuanhong@vivo.com,
	fuqiang.wang@easystack.cn, seanjc@google.com, guoren@kernel.org,
	chenjiahao16@huawei.com, hbathini@linux.ibm.com, bgwin@google.com,
	takahiro.akashi@linaro.org, lizhengyu3@huawei.com, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [PATCH v14 00/17] arm64/riscv: Add support for crashkernel CMA
 reservation
Message-ID: <ahQ0WRiMsB011tym@kernel.org>
References: <20260525084932.934910-1-ruanjinjie@huawei.com>
 <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com>
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

SGkgSHVhY2FpLAoKT24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgMDY6MTQ6NTJQTSArMDgwMCwgSHVh
Y2FpIENoZW4gd3JvdGU6Cj4gT24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgNDo1MOKAr1BNIEppbmpp
ZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+IHdyb3RlOgo+ID4KPiA+IEppbmppZSBSdWFu
ICgxNik6Cj4gPiAgIHJpc2N2OiBrZXhlY19maWxlOiBGaXggY3Jhc2hrX2xvd19yZXMgbm90IGV4
Y2x1ZGUgYnVnCj4gPiAgIHBvd2VycGMvY3Jhc2g6IEZpeCBwb3NzaWJsZSBtZW1vcnkgbGVhayBp
biB1cGRhdGVfY3Jhc2hfZWxmY29yZWhkcigpCj4gPiAgIGFybTY0OiBrZXhlYzogRml4IGltYWdl
LT5lbGZfaGVhZGVycyBtZW1vcnkgbGVhayBkdXJpbmcgcmV0cnkgbG9vcAo+ID4gICB4ODYva2V4
ZWM6IEZpeCBwb3RlbnRpYWwgYnVmZmVyIG92ZXJmbG93IGluIHByZXBhcmVfZWxmX2hlYWRlcnMo
KQo+ID4gICBhcm02NDoga2V4ZWNfZmlsZTogRml4IHBvdGVudGlhbCBidWZmZXIgb3ZlcmZsb3cg
aW4KPiA+ICAgICBwcmVwYXJlX2VsZl9oZWFkZXJzKCkKPiA+ICAgcmlzY3Y6IGtleGVjX2ZpbGU6
IEZpeCBwb3RlbnRpYWwgYnVmZmVyIG92ZXJmbG93IGluCj4gPiAgICAgcHJlcGFyZV9lbGZfaGVh
ZGVycygpCj4gPiAgIExvb25nQXJjaDoga2V4ZWM6IEZpeCBwb3RlbnRpYWwgYnVmZmVyIG92ZXJm
bG93IGluCj4gPiAgICAgcHJlcGFyZV9lbGZfaGVhZGVycygpCj4gPiAgIGNyYXNoOiBBZGQgY3Jh
c2hfcHJlcGFyZV9oZWFkZXJzKCkgdG8gZXhjbHVkZSBjcmFzaCBrZXJuZWwgbWVtb3J5Cj4gPiAg
IGFybTY0OiBrZXhlY19maWxlOiBVc2UgY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKCkgaGVscGVyIHRv
IHNpbXBsaWZ5IGNvZGUKPiA+ICAgeDg2L2tleGVjOiBVc2UgY3Jhc2hfcHJlcGFyZV9oZWFkZXJz
KCkgaGVscGVyIHRvIHNpbXBsaWZ5IGNvZGUKPiA+ICAgcmlzY3Y6IGtleGVjX2ZpbGU6IFVzZSBj
cmFzaF9wcmVwYXJlX2hlYWRlcnMoKSBoZWxwZXIgdG8gc2ltcGxpZnkgY29kZQo+ID4gICBMb29u
Z0FyY2g6IGtleGVjOiBVc2UgY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKCkgaGVscGVyIHRvIHNpbXBs
aWZ5IGNvZGUKPiA+ICAgY3Jhc2g6IFVzZSBjcmFzaF9leGNsdWRlX2NvcmVfcmFuZ2VzKCkgb24g
cG93ZXJwYwo+ID4gICBhcm02NDoga2V4ZWM6IEFkZCBzdXBwb3J0IGZvciBjcmFzaGtlcm5lbCBD
TUEgcmVzZXJ2YXRpb24KPiA+ICAgcmlzY3Y6IGtleGVjOiBBZGQgc3VwcG9ydCBmb3IgY3Jhc2hr
ZXJuZWwgQ01BIHJlc2VydmF0aW9uCj4gPiAgIGFybTY0L2NyYXNoOiBBZGQgY3Jhc2ggaG90cGx1
ZyBzdXBwb3J0Cj4gSSBoYXZlIHNvbWUgYmlrZXNoZWVkaW5ncyBhYm91dCB0aGUgc3ViamVjdHMu
IENhbiB3ZSB1bmlmeSB0aGUgcHJlZml4IGZvcm1hdHM/Cj4geDg2L2tleGVjLCBhcm02NDoga2V4
ZWNfZmlsZSwgcmlzY3Y6IGtleGVjX2ZpbGUsIExvb25nQXJjaDoga2V4ZWMgLi4uLi4KCkl0IG1p
Z2h0IGxvb2sgd2VpcmQgaW4gdGhlIHNlcmllcywgYnV0IHBvd2VycGMgYW5kIHg4NiB1c2UgJy8n
IGFuZCBhcm02NCBhbmQKcmlzY3YgdXNlICc6JyBzbyBpbiB0aGUgbG9ncyBpbiBhcmNoLyB0aGlz
IHdvdWxkIGJlIGFjdHVhbGx5IGZpbmUuCgpXaXRoIHRoZSBvbmx5IGV4Y2VwdGlvbiBvZiBhcm02
NC9jcmFzaCB0aGF0IHNob3VsZCBoYXZlIGJlZW4gYXJtNjQ6IGNyYXNoOgogCj4gSHVhY2FpCgot
LSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
