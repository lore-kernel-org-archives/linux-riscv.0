Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90F8C001B0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 22:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6Z9k2oxITLDvK7VKa8QvJAMm0DFfvLgVnRBt4Udbis=; b=dRpu0H1kN6eEDf
	traeNZjV9QSfrXHf6NUo8gQ8q/sFiKJYZ9ArQgy6vQ+YofnUc6eoYJuP6YKaybruK+MLiEgeO+rIj
	RMT/y3jAV2ulkfPcRCpcLklM398aEAapwDXaTS/GIQMedTf4+lo/VFOZGme/hgGuavgG+mk+QBqCX
	nXlWxB/BzlnXcs84vNi6Q2TKbZNMKQJqrRKL6QWXpxozBOwu3PQVjsAk5F8hal3ZoZVbZxWWd3xBU
	vHHy+dQtxd5wj4tCfv1AYHnXOAvRl2g+4qQanekBZ6nSG2j2IV0v/+sl2L5s3qR9uKbuhOpD8DkzR
	+MfDOtx8jyFS8QauJuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUaLT-00Bl2d-0U;
	Fri, 11 Aug 2023 22:10:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUaLP-00Bl1g-2Q;
	Fri, 11 Aug 2023 22:10:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DF50632A5;
	Fri, 11 Aug 2023 22:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50AEC433C9;
	Fri, 11 Aug 2023 22:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691791852;
	bh=N8lpigPkvlxlig325fbyaTImOPZkDbDukkfY6bibi4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UCVGRzoX9Uigyqo5+1fiPFWPwNic7v9sviQgPcfVDJjRJFuvbMwdb/QXxOtg1Nh1P
	 bknIvsJHn4Tnq8hk/bM2yGc67CLpqZ1jFQHxoDxsqtWftPAxIZBc047xx1Z4BcvMgD
	 ntBaVEZCH7KhQ3fTC3yEK3HsM/Q6wjEOylDdxVKeFfSJs5arLCQhSp42eHl1RE5sJr
	 80Bp0YdoC/uuNtJyLF5AvM7871S4CIfqm7rKcnC4tFmPaHXL0O4FaZITRjOU1v7qbl
	 l8VW4y85saRR5t8MUIitCrtW5/rOuiXDgXhicaGZD0kwtZPMljUg/AOdolH+J6klsZ
	 +0SLP0e1EVp2w==
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-56d2fe54863so1583611eaf.0;
        Fri, 11 Aug 2023 15:10:52 -0700 (PDT)
X-Gm-Message-State: AOJu0YyGtFkNp4C4k7ilk2AdhnJMl63M1v3YOYUVY/2LCjEMaQFCzFBp
	pMuPhNuO6c8qv0gfkg2x3ukyuJERCUqsCVpSVkI=
X-Google-Smtp-Source: AGHT+IGn1gQn4CG7x4Y66qfsYEz2RYlI/GdSoTxRIWymQmm7uMPiGClKZum+y67wV7ik5jOQYxKVmHuCQntmPwL9x1A=
X-Received: by 2002:a4a:240c:0:b0:564:e465:5d5c with SMTP id
 m12-20020a4a240c000000b00564e4655d5cmr2107496oof.2.1691791852125; Fri, 11 Aug
 2023 15:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230810141947.1236730-1-arnd@kernel.org> <20230810141947.1236730-3-arnd@kernel.org>
In-Reply-To: <20230810141947.1236730-3-arnd@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 12 Aug 2023 07:10:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQo5hri-9JmS_kot1mQ6WHCWAeu+SnW19daWMC1YK5BWA@mail.gmail.com>
Message-ID: <CAK7LNAQo5hri-9JmS_kot1mQ6WHCWAeu+SnW19daWMC1YK5BWA@mail.gmail.com>
Subject: Re: [PATCH 02/17] [RESEND] irq_work: consolidate arch_irq_work_raise prototypes
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Russell King <linux@armlinux.org.uk>, 
	Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_151055_902248_85E3C578 
X-CRM114-Status: GOOD (  15.61  )
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

T24gRnJpLCBBdWcgMTEsIDIwMjMgYXQgMTA6MDDigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
Pgo+IFRoZSBwcm90b3R5cGUgd2FzIGhpZGRlbiBvbiB4ODYsIHdoaWNoIGNhdXNlcyBhIHdhcm5p
bmc6CgoKV2hhdCBkbyB5b3UgbWVhbiBieSAiaGlkZGVuIG9uIHg4NiI/CgphcmNoX2lycV93b3Jr
X3JhaXNlKCkgd2FzIGRlY2xhcmVkIG9uIDcgYXJjaGl0ZWN0dXJlcywKaW5jbHVkaW5nIHg4Ni4K
CgoKCj4KPiBrZXJuZWwvaXJxX3dvcmsuYzo3MjoxMzogZXJyb3I6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3IgJ2FyY2hfaXJxX3dvcmtfcmFpc2UnIFstV2Vycm9yPW1pc3NpbmctcHJvdG90eXBl
c10KPgo+IEZpeCB0aGlzIGJ5IHByb3ZpZGluZyBpdCBpbiBvbmx5IG9uZSBwbGFjZSB0aGF0IGlz
IGFsd2F5cyB2aXNpYmxlLgo+Cj4gQWNrZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5t
YXJpbmFzQGFybS5jb20+Cj4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3Np
bmMuY29tPgo+IEFja2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiBSZXZpZXdl
ZC1ieTogQWxleGFuZGVyIEdvcmRlZXYgPGFnb3JkZWV2QGxpbnV4LmlibS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgYXJjaC9hcm0v
aW5jbHVkZS9hc20vaXJxX3dvcmsuaCAgICAgfCAyIC0tCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9h
c20vaXJxX3dvcmsuaCAgIHwgMiAtLQo+ICBhcmNoL2Nza3kvaW5jbHVkZS9hc20vaXJxX3dvcmsu
aCAgICB8IDIgKy0KPiAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2lycV93b3JrLmggfCAxIC0K
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pcnFfd29yay5oICAgfCAyICstCj4gIGFyY2gvczM5
MC9pbmNsdWRlL2FzbS9pcnFfd29yay5oICAgIHwgMiAtLQo+ICBhcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9pcnFfd29yay5oICAgICB8IDEgLQo+ICBpbmNsdWRlL2xpbnV4L2lycV93b3JrLmggICAgICAg
ICAgICB8IDMgKysrCj4gIDggZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMCBkZWxl
dGlvbnMoLSkKPgoKCi0tCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
