Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40ED3CCD190
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 07:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QkcbaDuwlNa7OsqTj9+v4q6vmrb5jc7eFg7nnLW5JMc=; b=rKPWxQ/Mu2apj+
	yiu7cdQkDukpFO+kVEtlqDWPyDg9ZOQ+cNYpWxX8VcADhOVOfnWGV06OJDHRdjul50igg/IaPWp9z
	yrj2D/migCMencSHG1ErCXB2yHQh0GqcdGAq5QooILHl7No+jwh9MdhJDrg4ociQt/zOZ4+mfAKOd
	m/BuwUCbKJNc83PvomB4ygfJIK+T3CaXmkx2z7X0g+vgZoqjCjsgZA9OKOOieJyNYJlYJwPjxex3A
	jZSTDYxXUbPYlAOFkGGghwVci6HoC+t3wBfudMtqq2ETiVJq2hSzAAz22HtNlcJeJ71L9/jipDZN/
	dZH/SLOsyafGc0bElAYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wKK-00000000oVQ-0YRk;
	Wed, 15 Oct 2025 07:53:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wKI-00000000oV6-0vo3
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 07:53:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6462C44011
	for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 07:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460C8C4CEF8
	for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 07:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760514817;
	bh=BXvOyevxKfYoxJEXrDcR2Vvt+5aQfsIM3B8CoUKdleI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R/qxvVESojI/jrSmvJMfmHPQ+nB2asAKG+TouvLyltUIAlUlGOyEreXOBKaBlWm7C
	 ujgm1NuxqJIM3vjR05UwRrY70e4jRWRfqnneY1FzdBNmdFNA8X/4gvdO0mn1BPuuIG
	 TlmB7XTP4GX9sSuJuWnLSQcsG4Q3WqM6/Es9sEN4QhaHkoKd7pTkBB63mS6CAkj9Tk
	 NZAdC0bvKrrGKqj4I8jzQPpVgclaisrfC7h5NMd262xJ7n9G9KjE+Y5vXCjQQYm//7
	 uFS0UWDw/wDR2xmq6ZprjMV+a7WEB4sApFfT6a/RaWeza7rhl5Wh9eUbrIjuSfgAcD
	 9f6qUM7xMDGyQ==
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-421b93ee372so3297871f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 00:53:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUm11l9ng0Nl1nyBvElkp7UGFL5hWdJMH4IyTWT1N2zhusAXvHk6JyKy/4nyi7ltSocxigpy821huvvcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUbrvCtQWEIu4iD6ZnJZ//zwee1hjt2cuBmIeZ2U9nVK8qgu1A
	VE2mWacdafF0FELg2JvxXVJ4GktZGLAS5E+yIbg67lSyhWDqC4LYuJ3DTt3nW25/goeUhcYV8XH
	41bFm+EHQZPEqrEnIZN3WbpSIrlTMIok=
X-Google-Smtp-Source: AGHT+IFLEko3zxqnJBBQYMghgC3Bi+KtEQ0BPBa4eVFzxD0JBAF+8qpqRM8uz9NOfmKaFfho5SP9a5sDu6xtu3nyJlk=
X-Received: by 2002:a05:6000:4a12:b0:426:d549:5bf7 with SMTP id
 ffacd0b85a97d-426d5495c4fmr11812293f8f.53.1760514815907; Wed, 15 Oct 2025
 00:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250713155321.2064856-1-guoren@kernel.org> <20250713155321.2064856-3-guoren@kernel.org>
 <1cfdf6c1-a384-43ad-9588-284335d073f7@ghiti.fr> <CAAT7Ki9_Vm0+v9RHpa2w-Bg3agJy2Tp4d6+tcPJ=M7XX3GV-7Q@mail.gmail.com>
 <CAHVXubgrbjHXAPSLjk6uZmUoa52fTYBvutk4q0GFYJPQ0swrGA@mail.gmail.com> <6c45ed33-d6f8-d385-8b89-9caf2ec18c77@kernel.org>
In-Reply-To: <6c45ed33-d6f8-d385-8b89-9caf2ec18c77@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 15 Oct 2025 15:53:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR9zriPBtOLx5Kt0hFZveL23uHV4W0SvPFLQrzdDU=mkg@mail.gmail.com>
X-Gm-Features: AS18NWA1yg3OGEsR23zhZBTCd3Fqa8-V1EkK33wNCF_O98hwKc-l8831O0GBPzg
Message-ID: <CAJF2gTR9zriPBtOLx5Kt0hFZveL23uHV4W0SvPFLQrzdDU=mkg@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
To: Paul Walmsley <pjw@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, palmer@dabbelt.com, conor@kernel.org, 
	paul.walmsley@sifive.com, bjorn@rivosinc.com, eobras@redhat.com, 
	corbet@lwn.net, peterlin@andestech.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Leonardo Bras <leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_005338_279430_B6463AA8 
X-CRM114-Status: GOOD (  16.82  )
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

T24gV2VkLCBPY3QgMTUsIDIwMjUgYXQgMTE6MzfigK9BTSBQYXVsIFdhbG1zbGV5IDxwandAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIZWxsbyBIYW4gR2FvLCBHdW8gUmVuLAo+Cj4gU29ycnkgZm9y
IHRoZSBkZWxheSBpbiByZXNwb25kaW5nIC0KPgo+IE9uIFR1ZSwgT2N0IDcsIDIwMjUgYXQgMTE6
MzbigK9QTSBIYW4gR2FvIDxyYWJlbmRhLmNuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+ICAgICAg
VGhpcyBwYXRjaCBpcyBpbmNsdWRlZCBpbiB0aGUgNi4xNyBtZXJnZSB3aW5kb3cgYnV0IG5vdCBp
biB0aGUKPiA+IDYuMTggbWVyZ2Ugd2luZG93Lgo+ID4gICAgICBJcyBpdCBwb3NzaWJsZSB0aGF0
IHRoZSBwYXRjaCB3YXMgbWlzc2VkPwo+Cj4gVGhpcyB3YXMgYWxtb3N0IHNlbnQgdXBzdHJlYW0g
YXMgcGFydCBvZiB0aGUgdjYuMTggbWVyZ2Ugd2luZG93LCBidXQgZ2l2ZW4KPiB0aGF0IGl0IGFk
ZHMgdGhlIGFiaWxpdHkgZm9yIGFyY2hpdGVjdHVyZXMgdG8gb3ZlcnJpZGUgV1JJVEVfT05DRSwg
SSB0aGluawo+IGl0IG5lZWRzIG9uZSBtb3JlIGF0dGVtcHQgYXQgZ2F0aGVyaW5nIGZlZWRiYWNr
IGJlZm9yZSB3ZSBkby4gIEknbGwgc2VuZAo+IHRoYXQgb3V0IHRoaXMgd2Vlay4KVGhhbmtzLCBQ
YXVsLCBmb3IgdGhlIGVmZm9ydCBvbiB0aGlzIHBhdGNoLiBZZXMsIG92ZXJyaWRpbmcgV1JJVEVf
T05DRQpuZWVkcyBtb3JlIHB1YmxpYyBmZWVkYmFjazsgaXQgbWFrZXMgc2Vuc2UgdG8gdXMuIFRo
aXMgZXJyYXRhIGZyb20gdGhlCmM5MTAgZWFybHkgdmVyc2lvbiBjYXVzZXMgaXNzdWVzIGZvciB0
aGUgY29tbXVuaXR5LCBidXQgc29tZSBTb0NzLApzdWNoIGFzIHRoMTUyMCBhbmQgc2cyMDQyLCBu
ZWVkIGl0IHRvIHByZXZlbnQgcG90ZW50aWFsIHJpc2tzLgoKCj4KPiB0aGFua3MgZm9yIHlvdXIg
cGF0aWVuY2UsCj4KPiAtIFBhdWwKCgoKLS0KQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
