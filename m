Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC311C77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 04:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJRJU5e+L/7jyGJ9WhwuKHCVOqnYwN6AcLj6Ydl8+VY=; b=KIJahOXfkiGZyu
	5aIq1fyfbtcjL+XYsjx3vsTxzIYnapp5IHAcxOiU6Oc6DL7XFMvY8E/saw3iQbHJDS1W4dfRA2F6g
	bJvG3krSe4ujxBxU1mACOL/3EOoCey/wUqxsHqJxGUHfll5LAMgzBdweEmb9GNK4eycELlWTV5JKT
	wQiVjlonCTcZUP2BAN54AjXh+tkQ/06K3K0WSF15tH6sN5x3+YKmnT51d9SrjY1lpnEl+gfkYBT9M
	BxMoHiGgesX1j4JsCC/KFZka8GV3ZJ98+xnFnAt6GibqUC9SCCm6RjiSp8leBZrgrRC87KXBaK7ur
	hP5pT+aCp5E3o/gIvspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4aOt-001yZp-19;
	Thu, 01 Jun 2023 04:59:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4aOq-001yZ4-0v
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 04:59:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D76B639CF
	for <linux-riscv@lists.infradead.org>; Thu,  1 Jun 2023 04:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E273C433D2
	for <linux-riscv@lists.infradead.org>; Thu,  1 Jun 2023 04:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685595538;
	bh=oy+X/QJ3AfHmQ6ri3oCJZOqvE65HhGdDFqeIhvw+j2w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cGspRzDXsJ+v96uxCgHPr/fCogXpgNBasA0a0CnaPzD7cF0M69b/DdT8w205r8vVS
	 G9t7oxTm8ZpTJESvfJN62tn8wv8i1WoH7OchVRxL+Ajf3/hyscSOX3vD4ZBsR5VTQd
	 Y170qv9lfaLjV09gwZc8HzCYTsiXUI3jVsW2hTRwglOIf2OuXF+WBLT2YH1qmZlJT9
	 2VJ/nGfQrY/SkMlNuEeRZDxoaBqiyQM4lMGgT180TrxvB82HGTPdJLQEuBAklxfFpP
	 hGnnRDa4Ip4P1QKHyuV6r5yoIIYjBxWzZucX4ZYCrcHVy/NBp95GDDo/peZRBYUD5O
	 33wtoTiIlMJWw==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51458e3af68so684987a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 21:58:58 -0700 (PDT)
X-Gm-Message-State: AC+VfDzZ8R6zVXNbpSScNNjrr9kNeJ2zs5gZXyQ8IqQU8S6piKQHGI6c
	d/eGIm5AyS4H4SiX1BbLWDPlsVosAsNNjg1GYTg=
X-Google-Smtp-Source: ACHHUZ4VH8QZzGD0vgHngiLn8kY9qiolxuEmItJ/iPkVQJfez9e0G79jdsMCAJfKfVfjnw+gwizmiu/fiLhzz3PYeZM=
X-Received: by 2002:aa7:df0e:0:b0:514:9248:d1dd with SMTP id
 c14-20020aa7df0e000000b005149248d1ddmr5631785edy.24.1685595536880; Wed, 31
 May 2023 21:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230511141211.2418-1-jszhang@kernel.org> <20230511141211.2418-4-jszhang@kernel.org>
In-Reply-To: <20230511141211.2418-4-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 1 Jun 2023 12:58:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSCLLviJ_JzjetU3ajRQtU+L7epeWOOVOeN_pqrfhKLHg@mail.gmail.com>
Message-ID: <CAJF2gTSCLLviJ_JzjetU3ajRQtU+L7epeWOOVOeN_pqrfhKLHg@mail.gmail.com>
Subject: Re: [PATCH 3/4] vmlinux.lds.h: use correct .init.data.* section name
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_215900_366445_4305094A 
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

T24gVGh1LCBNYXkgMTEsIDIwMjMgYXQgMTA6MjfigK9QTSBKaXNoZW5nIFpoYW5nIDxqc3poYW5n
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSWYgYnVpbGRpbmcgd2l0aCAtZmRhdGEtc2VjdGlvbnMg
b24gcmlzY3YsIExEX09SUEhBTl9XQVJOIHdpbGwgd2Fybgo+IHNpbWlsYXIgYXMgYmVsb3c6Cj4K
PiByaXNjdjY0LWxpbnV4LWdudS1sZDogd2FybmluZzogb3JwaGFuIHNlY3Rpb24gYC5pbml0LmRh
dGEuZWZpX2xvZ2xldmVsJwo+IGZyb20gYC4vZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9w
cmludGsuc3R1Yi5vJyBiZWluZyBwbGFjZWQgaW4KPiBzZWN0aW9uIGAuaW5pdC5kYXRhLmVmaV9s
b2dsZXZlbCcKPgo+IEkgYmVsaWV2ZSB0aGlzIGlzIGNhdXNlZCBieSBhIGEgdHlwbzoKPiBpbml0
LmRhdGEuKiBzaG91bGQgYmUgLmluaXQuZGF0YS4qCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5n
IFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+ClNlZW1zIGl0J3MgYSBmaXh1cCBmb3IgYWxsIGFy
Y2hpdGVjdHVyZXMsIHdoYXQncyB0aGUgRml4OiB0YWc/Cgo+IC0tLQo+ICBpbmNsdWRlL2FzbS1n
ZW5lcmljL3ZtbGludXgubGRzLmggfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMv
dm1saW51eC5sZHMuaCBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdm1saW51eC5sZHMuaAo+IGluZGV4
IGQxZjU3ZTQ4NjhlZC4uMzcxMDI2Y2E3MjIxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvYXNtLWdl
bmVyaWMvdm1saW51eC5sZHMuaAo+ICsrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdm1saW51eC5s
ZHMuaAo+IEBAIC02ODgsNyArNjg4LDcgQEAKPiAgLyogaW5pdCBhbmQgZXhpdCBzZWN0aW9uIGhh
bmRsaW5nICovCj4gICNkZWZpbmUgSU5JVF9EQVRBICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgS0VFUCgqKFNPUlQoX19fa2Vu
dHJ5KyopKSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAg
ICooLmluaXQuZGF0YSBpbml0LmRhdGEuKikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gKyAgICAgICAqKC5pbml0LmRhdGEgLmluaXQuZGF0YS4qKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgTUVNX0RJU0NBUkQoaW5pdC5k
YXRhKikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAg
IEtFUk5FTF9DVE9SUygpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gICAgICAgICBNQ09VTlRfUkVDKCkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0tCj4gMi40MC4xCj4KCgotLSAKQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
