Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EC5C001B0
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 00:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QLDwBNmmyCLYDG4gujXzHZd/ReaUc4QSJYHy6q7/+I=; b=r5cs8gmGUxT4LC
	OIHIYtQISUKHnebdVR7AhulnUBGn71W0rLuRozSRFB56Lefe3MiahxRMfAnFmJ8c0N8hRXW6fNi2e
	8oNY3uxy17w1f33OlQUSttG+W2iMaGarQjEgriYVJb7eWZ9rtxTEGElAmO6hD6zm5wY03UwQsJfXr
	M7+7tK+pZIBH0DKXOFMDbq+mrVp834jtZvUYZPwofaeRDi79HhODorp9lnG6AdwzE/Q4PsDxwCNyV
	/al5H9dDi4bmFVGPXknDXltytj5PU8kkEcLSNeH6LN3jqpUoj3znkhq1dMljJN66Gz8p69LqEGGhp
	rW2CuMmauZ292pCXX1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKpTB-009jXc-2Q;
	Sun, 16 Jul 2023 00:18:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKpT9-009jX1-18
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 00:18:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F68260C4C
	for <linux-riscv@lists.infradead.org>; Sun, 16 Jul 2023 00:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D5DC433C7
	for <linux-riscv@lists.infradead.org>; Sun, 16 Jul 2023 00:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689466713;
	bh=418o5psNdMRdFlKcUS6XKpTnTtdjq3bya0znIgig6+A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nKRdrLu8bv5eYAJ2c5iKAM16xzr7Ue5vgO7pVwpFxT7Vms+/WnOwFUaEhqsj6db3M
	 TRmxINruQbTjtN7VeyujDj3dNERtdMd1JMAFFvwdBSlgiB0o0nUg8gpe6iIgom9Vr5
	 KqG/zIZyo0nXgQGNcB49jSvS5Zy1CsYvl2030kGlWnC3n/7BZ4+a4FQyr8vqv2ybMV
	 naL5FxDCer9WSF9PkfqHrIU4OxW+voC5TW8S8zwkz2FjdsVHKfnf4FRxx3DmLMdldg
	 gKXnakElPq1PJb83oeaTpXvy/kfpFlyUzkC9hHiLV0bjnmVcBp1QIFR0qd0hjyjqAd
	 lOBzCTqElYc4g==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5216f713f8bso1899306a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 17:18:33 -0700 (PDT)
X-Gm-Message-State: ABy/qLbXKI2qCHLnZFdG2BwlCUTOg6lyQBfy5SZK5KTOFPodjiUEvsrg
	3F/+5Atccch5kkLdcbHQvk9U8X0jTrLYWyxa96E=
X-Google-Smtp-Source: APBJJlHzxbR/lWTU76n+iCQzgJcyerhJDEeEMmfSWflH4fXXmY1WbVAGXQc9ps6hIg7/+8l7CUvwffdlnZUJTVsGn+Y=
X-Received: by 2002:aa7:d684:0:b0:51d:e7b5:547d with SMTP id
 d4-20020aa7d684000000b0051de7b5547dmr8017511edr.34.1689466712015; Sat, 15 Jul
 2023 17:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230715134552.3437933-1-guoren@kernel.org>
In-Reply-To: <20230715134552.3437933-1-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 16 Jul 2023 08:18:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ3CLatagXuSE-W4yZA=8XWJcNXRo8+mJN5iofMHdct3w@mail.gmail.com>
Message-ID: <CAJF2gTQ3CLatagXuSE-W4yZA=8XWJcNXRo8+mJN5iofMHdct3w@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: stack: Fixup independent softirq/irq stack for CONFIG_FRAME_POINTER=n
To: guoren@kernel.org, palmer@rivosinc.com, paul.walmsley@sifive.com, 
	falcon@tinylab.org, bjorn@kernel.org, conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_171835_496428_73EACC68 
X-CRM114-Status: GOOD (  14.19  )
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

SSdtIHNvcnJ5LCB0aGlzIHBhdGNoIHdvdWxkIGJyZWFrIENPTkZJR19GUkFNRV9QT0lOVEVSPXks
IHNvIHBsZWFzZSBhYmFuZG9uIGl0LgoKSSd2ZSB1cGRhdGVkIGEgdjIgd2l0aCB0aGUgc3RhYmxl
QHZlci5rZXJuZWwub3JnIHRhZyBmaXhlZDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvMjAyMzA3MTYwMDE1MDYuMzUwNjA0MS0xLWd1b3JlbkBrZXJuZWwub3JnLwoKCk9uIFNh
dCwgSnVsIDE1LCAyMDIzIGF0IDk6NDbigK9QTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Cj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+Cj4gVGhlIGluZGVw
ZW5kZW50IHNvZnRpcnEvaXJxIHN0YWNrIHVzZXMgczAgdG8gc2F2ZSAmIHJlc3RvcmUgc3AsIGJ1
dCBzMAo+IHdvdWxkIGJlIGNvcnJ1cHRlZCB3aGVuIENPTkZJR19GUkFNRV9QT0lOVEVSPW4uIFNv
IGFkZCBzMCBpbiB0aGUgY2xvYmJlcgo+IGxpc3QgdG8gZml4IHRoZSBwcm9ibGVtLgo+Cj4gPCsw
PjogICAgIGFkZGkgICAgc3Asc3AsLTMyCj4gPCsyPjogICAgIHNkICAgICAgczAsMTYoc3ApCj4g
PCs0PjogICAgIHNkICAgICAgczEsOChzcCkKPiA8KzY+OiAgICAgc2QgICAgICByYSwyNChzcCkK
PiA8Kzg+OiAgICAgc2QgICAgICBzMiwwKHNwKQo+IDwrMTA+OiAgICBtdiAgICAgIHMwLGEwICAg
ICAgICAgLS0+IGNvbXBpbGVyIGFsbG9jYXRlIHMwIGZvciBhMCB3aGVuIENPTkZJR19GUkFNRV9Q
T0lOVEVSPW4KPiA8KzEyPjogICAgamFsICAgICByYSwweGZmZmZmZmZmODAwYmMwY2UgPGlycWVu
dHJ5X2VudGVyPgo+IDwrMTY+OiAgICBsZCAgICAgIGE1LDU2KHRwKSAjIDB4MzgKPiA8KzIwPjog
ICAgbHVpICAgICBhNCwweDQKPiA8KzIyPjogICAgbXYgICAgICBzMSxhMAo+IDwrMjQ+OiAgICB4
b3IgICAgIGE1LGE1LHNwCj4gPCsyOD46ICAgIGJnZXUgICAgYTUsYTQsMHhmZmZmZmZmZjgwMGJj
MDkyIDxkb19pcnErODg+Cj4gPCszMj46ICAgIGF1aXBjICAgczIsMHg1ZAo+IDwrMzY+OiAgICBs
ZCAgICAgIHMyLDExMTgoczIpICMgMHhmZmZmZmZmZjgwMTE5NGI4IDxpcnFfc3RhY2tfcHRyPgo+
IDwrNDA+OiAgICBhZGQgICAgIHMyLHMyLGE0Cj4gPCs0Mj46ICAgIGFkZGkgICAgc3Asc3AsLTgK
PiA8KzQ0PjogICAgc2QgICAgICByYSwwKHNwKQo+IDwrNDY+OiAgICBhZGRpICAgIHNwLHNwLC04
Cj4gPCs0OD46ICAgIHNkICAgICAgczAsMChzcCkKPiA8KzUwPjogICAgYWRkaSAgICBzMCxzcCwx
NiAgICAgIC0tPiBvdXIgY29kZSBjbG9iYmVyIHRoZSBzMAo+IDwrNTI+OiAgICBtdiAgICAgIHNw
LHMyCj4gPCs1ND46ICAgIG12ICAgICAgYTAsczAgICAgICAgICAtLT4gYTAgZ290IHdyb25nIHZh
bHVlIGZvciBoYW5kbGVfcmlzY3ZfaXJxCj4gPCs1Nj46ICAgIGphbCAgICAgcmEsMHhmZmZmZmZm
ZjgwMGJiYjNhIDxoYW5kbGVfcmlzY3ZfaXJxPgo+Cj4gR3VvIFJlbiAoMik6Cj4gICByaXNjdjog
c3RhY2s6IEZpeHVwIGluZGVwZW5kZW50IGlycSBzdGFjayBmb3IgQ09ORklHX0ZSQU1FX1BPSU5U
RVI9bgo+ICAgcmlzY3Y6IHN0YWNrOiBGaXh1cCBpbmRlcGVuZGVudCBzb2Z0aXJxIHN0YWNrIGZv
cgo+ICAgICBDT05GSUdfRlJBTUVfUE9JTlRFUj1uCj4KPiAgYXJjaC9yaXNjdi9rZXJuZWwvaXJx
LmMgICB8IDIgKy0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDIgKy0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMzYu
MQo+CgoKLS0KQmVzdCBSZWdhcmRzCgogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
