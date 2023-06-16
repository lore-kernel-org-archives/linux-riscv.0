Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA28EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 18:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrxEXChs6QHxtplWnnKVroqn7VKPdxA33oh5jMQq06A=; b=XwPA1cInJ+bQYy
	3XkHEC0sCSsAjfG0N/LBAHDT4zprk05YvpdajQh1SrTkX9p1cQXg6NLm10n3Q7L+rluW+xGofkoLm
	mjnYy2NtrE09EFmPlqKpr8b7MnnR7u2Fw5Ilwa+0HH4N+xzeLB3Y3IaKoJlCaINLpDF+DDG763l3k
	/vZxzDlK1taup8S0xjQx2NoY9kP/TBi7z1QHHWo9TIJF7o+R4fH3Y7mkuwx8BEtSllAb1AxmMXiSm
	vvGVyTcGukvCZKCYHBaY9qy/Hg/Fz0A324nsWFDM1e05vcq5MzY1SA/D59W0JhOQXEJpYFSrfoEgK
	9T1s0d16AKAjuhuvFqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEJX-001S7r-1y;
	Fri, 16 Jun 2023 18:36:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEJU-001S5g-0V;
	Fri, 16 Jun 2023 18:36:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A4331630BF;
	Fri, 16 Jun 2023 18:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFC1C43397;
	Fri, 16 Jun 2023 18:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686940606;
	bh=JGylOLwsDlnOC/7zFFXP8rSDvCyOTlCYNV6rWd4f8mw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SeXeGZ/w86KmlurMiVm4UIF69ZGzlkmxJdFe2QmV6PX8IW+hDhUbuFBav3t/B8pWZ
	 vEzDIgk/zKEW5stVwEtyb8WYKsD74Cn5N7O03rsyRz3LX2xGotPEbMmsM7IV3g9Dxd
	 h5Uh6GrvB3LrnxzUUDOGdAi+YQl7sfLX58PmPPi1I/7ju04tDqO1xvj3P1oQrQvlEn
	 mq1rf5Tcp0oheWCmaw6RaW+tUKVhYkG7a6qCHK2MLKMhdZ/TjBbzmfPfgUfEdkhdA/
	 QK30NJOharxczGBPm79t0v2LgrZqJ5TBlW/fXRzSrlgo6PvG8f6QCwr2oWnE+7+dKS
	 y4wFdRFTvaw9Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-4f76b6db73fso2733649e87.1;
        Fri, 16 Jun 2023 11:36:46 -0700 (PDT)
X-Gm-Message-State: AC+VfDwAqpZLAHfzpRanofo0iPlSn9M81q440o3SU487hmJS61rTbcXO
	zs9hvcdDv9RrNnpzp0cZ/N1P3IBBkrECDxxJvgE=
X-Google-Smtp-Source: ACHHUZ7VgWfSxd734IfkdiKrgB+GJm0nBxE0sk2dQ8TAn5f7aSo4Y23dXvE8MnzKke3G84UjJ1bhxQV9PGC+v71U+NE=
X-Received: by 2002:a19:7913:0:b0:4f3:aa81:2a6e with SMTP id
 u19-20020a197913000000b004f3aa812a6emr797084lfc.19.1686940604495; Fri, 16 Jun
 2023 11:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-4-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-4-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:36:32 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6tDvY5G-qGMq3ymth3ip27=zAij8_UhJ-qP6Ct1U1-ZA@mail.gmail.com>
Message-ID: <CAPhsuW6tDvY5G-qGMq3ymth3ip27=zAij8_UhJ-qP6Ct1U1-ZA@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_113648_294122_DE55D9D2 
X-CRM114-Status: GOOD (  16.80  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTo1MeKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoSUJNKSIgPHJwcHRAa2Vy
bmVsLm9yZz4KPgo+IFNldmVyYWwgYXJjaGl0ZWN0dXJlcyBvdmVycmlkZSBtb2R1bGVfYWxsb2Mo
KSBvbmx5IHRvIGRlZmluZSBhZGRyZXNzCj4gcmFuZ2UgZm9yIGNvZGUgYWxsb2NhdGlvbnMgZGlm
ZmVyZW50IHRoYW4gVk1BTExPQyBhZGRyZXNzIHNwYWNlLgo+Cj4gUHJvdmlkZSBhIGdlbmVyaWMg
aW1wbGVtZW50YXRpb24gaW4gZXhlY21lbSB0aGF0IHVzZXMgdGhlIHBhcmFtZXRlcnMKPiBmb3Ig
YWRkcmVzcyBzcGFjZSByYW5nZXMsIHJlcXVpcmVkIGFsaWdubWVudCBhbmQgcGFnZSBwcm90ZWN0
aW9ucwo+IHByb3ZpZGVkIGJ5IGFyY2hpdGVjdHVyZXMuCj4KPiBUaGUgYXJjaGl0ZWN1cmVzIG11
c3QgZmlsbCBleGVjbWVtX3BhcmFtcyBzdHJ1Y3R1cmUgYW5kIGltcGxlbWVudAo+IGV4ZWNtZW1f
YXJjaF9wYXJhbXMoKSB0aGF0IHJldHVybnMgYSBwb2ludGVyIHRvIHRoYXQgc3RydWN0dXJlLiBU
aGlzCj4gd2F5IHRoZSBleGVjbWVtIGluaXRpYWxpemF0aW9uIHdvbid0IGJlIGNhbGxlZCBmcm9t
IGV2ZXJ5IGFyY2hpdGVjdXJlLAo+IGJ1dCByYXRoZXIgZnJvbSBhIGNlbnRyYWwgcGxhY2UsIG5h
bWVseSBpbml0aWFsaXphdGlvbiBvZiB0aGUgY29yZQo+IG1lbW9yeSBtYW5hZ2VtZW50Lgo+Cj4g
VGhlIGV4ZWNtZW0gcHJvdmlkZXMgZXhlY21lbV90ZXh0X2FsbG9jKCkgQVBJIHRoYXQgd3JhcHMK
PiBfX3ZtYWxsb2Nfbm9kZV9yYW5nZSgpIHdpdGggdGhlIHBhcmFtZXRlcnMgZGVmaW5lZCBieSB0
aGUgYXJjaGl0ZWN1cmVzLgo+IElmIGFuIGFyY2hpdGV0dXJlIGRvZXMgbm90IGltcGxlbWVudCBl
eGVjbWVtX2FyY2hfcGFyYW1zKCksCj4gZXhlY21lbV90ZXh0X2FsbG9jKCkgd2lsbCBmYWxsIGJh
Y2sgdG8gbW9kdWxlX2FsbG9jKCkuCj4KPiBUaGUgbmFtZSBleGVjbWVtX3RleHRfYWxsb2MoKSBl
bXBoYXNpemVzIHRoYXQgdGhlIGFsbG9jYXRlZCBtZW1vcnkgaXMKPiBmb3IgZXhlY3V0YWJsZSBj
b2RlLCB0aGUgYWxsb2NhdGlvbnMgb2YgdGhlIGFzc29jaWF0ZWQgZGF0YSwgbGlrZSBkYXRhCj4g
c2VjdGlvbnMgb2YgYSBtb2R1bGUgd2lsbCB1c2UgZXhlY21lbV9kYXRhX2FsbG9jKCkgaW50ZXJm
YWNlIHRoYXQgd2lsbAo+IGJlIGFkZGVkIGxhdGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWlrZSBS
YXBvcG9ydCAoSUJNKSA8cnBwdEBrZXJuZWwub3JnPgoKQWNrZWQtYnk6IFNvbmcgTGl1IDxzb25n
QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
