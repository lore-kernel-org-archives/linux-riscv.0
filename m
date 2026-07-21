Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91922C4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 18:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q34PYP0fCTyUQdnHbbGQ+KrnSJoclCuNG6hoMksO510=; b=yUZBJagtzKpREU
	zfMfNOaDAC5rwjuZsjFSuqEq5DPVsdINwE5b6swsERnQP11vOjbnTzjfl4Priw4iTpxVKDtOGobkx
	/iygvYE4Q01HsszevlID3aNC94w+240R4zXfXtOiLRI2r8XFrFuOru/QnkcuQWQltYgjRzuglIQYZ
	BWDqYOP1G0MJJ4kSEyiRb9vr+SWbCh6wW4gZktCxR8fCUorxgZRz72jsy9f9nx2/tNU6KhIU70c5u
	Dc4fpsSEtaLCkjEQe3XBW+/87xKUkAgk/s1KspBWWxFFFvlYm5X2f5e1qfY73ZhW+gpd5E8AU3DTv
	fkCFgVxgvr/gHF+wUN5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmExk-0000000AAB4-3bxh;
	Tue, 21 Jul 2026 18:13:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmExj-0000000AAAy-3Gxf
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 18:13:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 29C01402B0;
	Tue, 21 Jul 2026 18:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739321F00A3A;
	Tue, 21 Jul 2026 18:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784657583;
	bh=GOTXWGIgTIVh86BYkheKLDzRC6QjKgkCZNGocWn65x8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YRXMj2GB8HnNWkit+emhpgq0tGFSHybyhqaOXXyxGkCY5y9MqMfLwnU+7QA5Ykzop
	 qBgBaE7Rv+eN8GMyir6jrBu8QqgyLbXQFx0HxIDnX4CQrwKDoCu2N328zsSZNg15rc
	 eMimnQqEZUOLmBR22gvYe3buFLCu/6otr3cuq1z+/QYETUB+/7y2VKBo9S6SHT0hku
	 jE2Qci53TJzRXdS+cMUTERPbB0Ey3OhepLamCkSZ7EM242Rj9yutV2YPGytmxgAGGa
	 dtn8bJhxGubIQlusoZlC3YBakGZI0IkdizIGcr1gy9WtQMIdKUJU/vS28DdNiL6j5K
	 /S5ymVaH37Yxg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, bot+bpf-ci@kernel.org,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
 eddyz87@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com,
 martin.lau@kernel.org, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf-next v6 6/7] riscv, bpf: Mixing bpf2bpf and tailcalls
In-Reply-To: <DK3GTYQ5UOMO.CVL471XPD0AT@gmail.com>
References: <20260708064436.2971933-7-pulehui@huaweicloud.com>
 <a721df30ec2f824295000183c8e91f2c19d0bd56ae115b835b402be9eacc1c71@mail.kernel.org>
 <b4aadfde-9745-4c71-8dd4-ce433331f91b@huaweicloud.com>
 <CAJ+HfNi_icVbeB=jw-xnXrwzigZwP2OVRbzaF3VC87i6fDpdDw@mail.gmail.com>
 <fc972c33-1b66-4979-97e9-71627fb6179f@huaweicloud.com>
 <CAJ+HfNgPWwX3dfu=62TSMKeLD8m9S0rc2k9G8rVN7r2SuzQ6MQ@mail.gmail.com>
 <23cb9eac-1775-44b8-a9ec-10edde808a30@huaweicloud.com>
 <326eda4a-39e6-4f1e-8fe5-dc1cc9ae6739@iogearbox.net>
 <dd20e3ea-4b3a-45d1-99f4-79e99e51e7fb@huaweicloud.com>
 <DK3GTYQ5UOMO.CVL471XPD0AT@gmail.com>
Date: Tue, 21 Jul 2026 20:12:59 +0200
Message-ID: <87mrvkus7o.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

Rm9sa3MsCgpTb3JyeSBmb3IgdGhlIGRlbGF5LiBUaGlzIHNsaXBwZWQgYmV0d2VlbiBuZXRkZXZj
b25mIGFuZCBvbmdvaW5nIFBUTyEKCiJLdW1hciBLYXJ0aWtleWEgRHdpdmVkaSIgPG1lbXhvckBn
bWFpbC5jb20+IHdyaXRlczoKCj4gT24gRnJpIEp1bCAxNywgMjAyNiBhdCA5OjM3IEFNIENFU1Qs
IFB1IExlaHVpIHdyb3RlOgo+PiBKdXN0IGEgcXVpY2sgbm90ZSB0aGF0IHRoZSB2ZXJpZmllciBm
aXggd2UgZGlzY3Vzc2VkIGhhcyBub3cgbGFuZGVkIGluCj4+IGJwZi1uZXh0IFswXS4gTG9va2lu
ZyBmb3J3YXJkIHRvIHlvdXIgZmVlZGJhY2sgb24gdjYgd2hlbmV2ZXIgeW91IGdldCBhCj4+IGNo
YW5jZS4gOikKCk5pY2Ugb25lISBIYXBweSB0byBzZWUgdGhhdCEKCj4gWWVwLCBpZiB0aGVyZSBh
cmUgbm8gbW9yZSBjb25jZXJucywgaXQgd291bGQgbWFrZSBzZW5zZSB0byBwdWxsIHRoaXMgaW4u
Cj4KPiBCasO2cm4sIHdoYXQgZG8geW91IHRoaW5rPwoKVGhhdCB3YXMgdGhlIG9ubHkgY29uY2Vy
biBJIGhhZCEKCkZvciB0aGUgd2hvbGUgc2VyaWVzOgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBl
bCA8Ympvcm5Aa2VybmVsLm9yZz4KQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
