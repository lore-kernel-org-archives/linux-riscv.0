Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CD4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 03:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMN0YSdTcQmKiG+cyLbretGvFkHHhZUUQwSgN0HLJ3k=; b=uyZO9hWI8W3npg
	EhYIFn5EBxolV2NVwC/300AyWj/K5GNBQPKtmR9I2GKFXbtYtoTHILZXjUB9isCnBV7pIzOMuGqKA
	wLp20GBqKzw8iJ2sEr+SHznps2lUrH7Y/5+NJaqo3nyPJF07h8hwBY/u4yD8aDfLci9pJ1/3D9SFk
	cQTrAsot3bDEWpkosi6uce54l/+jGhzE8ENqVP9xx/PCHRo0M2w+P+DCcyIAcSVOv1bDj2ShRJhOM
	X9Z1tfJevs158ywZbVjmyN8qlzAI2ZERWRuPoMNAILbvTUmNpLNRY8Zmme/n90sarnMTZFWJbKQsE
	Rw561NU4mSdrWIBCYW6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzru9-0092jd-OL; Wed, 22 Dec 2021 03:03:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzrtx-0092i7-VE; Wed, 22 Dec 2021 03:02:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 937DB6178C;
 Wed, 22 Dec 2021 03:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A2DC36AE8;
 Wed, 22 Dec 2021 03:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640142168;
 bh=WSyHhrcXZ9EjPtj2ifCKZZNJIhxwOB+mDw+QIlWtL/g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I2KaiqF5sYXZhMucQyRMZ10uvWNMNCbOBPKkDU+x1dqk7UWRqUZ2RdJCp1LbqcZfP
 4AL6AvRzcrDYPQXxabUQQs5Z6cLlj71D8cuX1hvRKDOjnPeUAndFB01QTsiwCm/075
 W0DoSxxoRWZlm/9t+3Of2qRglSaD7QGIAqWgv+X7xVyf1pBiswScZdYQNFhVYqSbCD
 F/KsLko7lfMmgVwoqS4c4kR7QVSlJxrFzWKq8SIbX6it/O+zaZLQzgMWYJfoGwJlE1
 3oTzZvqCuS/x8icsHcGV9tBSwTldeAuoAUAAoBnB9OEgc6l9S9wef4OpcPHsUv5D9B
 6dB8M+u94N5ug==
Received: by mail-ua1-f52.google.com with SMTP id n7so1588285uaq.12;
 Tue, 21 Dec 2021 19:02:47 -0800 (PST)
X-Gm-Message-State: AOAM531soIIguzDoFj6hcXBGSH4doOXEH0DjeRqVYAE/31Vf+8v5WCWq
 GJ1UzBzoKoNgI3NVvuo2C7kRxe6fMpipPGBEQKA=
X-Google-Smtp-Source: ABdhPJzfN/S3U1di5WXrgKLqFzURs4/ZUuNwOZaTWJPgOpxekWFKl2Xv/1LYWtbuDbIFhbJWM7A7WQmzLZESZuK+tLE=
X-Received: by 2002:a67:f94b:: with SMTP id u11mr409927vsq.51.1640142167064;
 Tue, 21 Dec 2021 19:02:47 -0800 (PST)
MIME-Version: 1.0
References: <20211221170057.2637763-1-guoren@kernel.org>
 <20211221170057.2637763-5-guoren@kernel.org>
 <c084037b-1f30-53be-bf6b-06e3401b20e8@csgroup.eu>
In-Reply-To: <c084037b-1f30-53be-bf6b-06e3401b20e8@csgroup.eu>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Dec 2021 11:02:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQbpVczn=Zz9rgvgNRSM9AFaoc2zVz9YaL_hWpgYSaR2w@mail.gmail.com>
Message-ID: <CAJF2gTQbpVczn=Zz9rgvgNRSM9AFaoc2zVz9YaL_hWpgYSaR2w@mail.gmail.com>
Subject: Re: [PATCH 4/8] sched: powerpc: Remove unused TASK_SIZE_OF
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "will@kernel.org" <will@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>, 
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>, 
 "juri.lelli@redhat.com" <juri.lelli@redhat.com>, 
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, "x86@kernel.org" <x86@kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "sparclinux@vger.kernel.or" <sparclinux@vger.kernel.or>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
 "inux-parisc@vger.kernel.org" <inux-parisc@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_190250_108050_94D75485 
X-CRM114-Status: GOOD (  19.88  )
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

T24gV2VkLCBEZWMgMjIsIDIwMjEgYXQgMjo0MyBBTSBDaHJpc3RvcGhlIExlcm95CjxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Cj4KPgo+IExlIDIxLzEyLzIwMjEgw6AgMTg6
MDAsIGd1b3JlbkBrZXJuZWwub3JnIGEgw6ljcml0IDoKPiA+IEZyb206IEd1byBSZW4gPGd1b3Jl
bkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBUaGlzIG1hY3JvIGlzbid0IHVzZWQgaW4gTGlu
dXggc2NoZWQsIG5vdy4gRGVsZXRlIGluCj4gPiBpbmNsdWRlL2xpbnV4L3NjaGVkLmggYW5kIGFy
Y2gncyBpbmNsdWRlL2FzbS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+Cj4gPiAtLS0KPiA+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L3Rhc2tfc2l6ZV82NC5oIHwgNiArKy0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3Rhc2tfc2l6ZV82NC5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Rh
c2tfc2l6ZV82NC5oCj4gPiBpbmRleCBjOTkzNDgyMjM3ZWQuLjdlMmVjYTRmYWM0ZCAxMDA2NDQK
PiA+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS90YXNrX3NpemVfNjQuaAo+ID4gKysr
IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3Rhc2tfc2l6ZV82NC5oCj4gPiBAQCAtNDQsMTIg
KzQ0LDEwIEBACj4gPiAgICAqLwo+ID4gICAjZGVmaW5lIFRBU0tfU0laRV9VU0VSMzIgKDB4MDAw
MDAwMDEwMDAwMDAwMFVMIC0gKDEgKiBQQUdFX1NJWkUpKQo+ID4KPiA+IC0jZGVmaW5lIFRBU0tf
U0laRV9PRih0c2spICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiAtICAgICAodGVzdF90c2tfdGhyZWFkX2ZsYWcodHNrLCBUSUZfMzJCSVQpID8gVEFTS19T
SVpFX1VTRVIzMiA6ICAgICAgXAo+ID4gKyNkZWZpbmUgVEFTS19TSVpFICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICh0ZXN0X3Rz
a190aHJlYWRfZmxhZyhjdXJyZW50LCBUSUZfMzJCSVQpID8gVEFTS19TSVpFX1VTRVIzMiA6ICBc
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVEFTS19T
SVpFX1VTRVI2NCkKPgo+IEkgdGhpbmsgeW91IHNob3VsZCB1c2UgdGVzdF90aHJlYWRfZmxhZygp
IGluc3RlYWQuCj4KPiBPciBldmVuIGJldHRlcjogdXNlIGlzXzMyYml0X3Rhc2soKSBhbmQgYnJp
bmcgYmFjayB0aGlzIG1hY3JvIGFzIGEKPiBzaW5nbGUgbGluZSwgc29tZXRoaW5nIGxpa2U6Cj4K
PiAjZGVmaW5lIFRBU0tfU0laRSAoaXNfMzJiaXRfdGFzaygpID8gVEFTS19TSVpFX1VTRVIzMiA6
IFRBU0tfU0laRV9VU0VSNjQpCk9rYXksIGxvb2tzIGJldHRlci4gSSB3b3VsZCBmaXggaXQgaW4g
dGhlIG5leHQgdmVyc2lvbi4KCj4KPiA+Cj4gPiAtI2RlZmluZSBUQVNLX1NJWkUgVEFTS19TSVpF
X09GKGN1cnJlbnQpCj4gPiAtCj4gPiAgICNkZWZpbmUgVEFTS19VTk1BUFBFRF9CQVNFX1VTRVIz
MiAoUEFHRV9BTElHTihUQVNLX1NJWkVfVVNFUjMyIC8gNCkpCj4gPiAgICNkZWZpbmUgVEFTS19V
Tk1BUFBFRF9CQVNFX1VTRVI2NCAoUEFHRV9BTElHTihERUZBVUxUX01BUF9XSU5ET1dfVVNFUjY0
IC8gNCkpCj4gPgo+ID4KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKTUw6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
