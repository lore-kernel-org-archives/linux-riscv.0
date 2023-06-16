Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D5CEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKk+fZO9/2PIUo9UxrQVuXW2TITq59orHB9mJXl5OXI=; b=aI9kIEhslXjaEc
	bFc2OZUfRPiDg1KKtm9q6lutKbqMV0YG+0PXvnCVWWa6fW8jmX6Z9H8Y1slBmJ/yNFOuxNXeExP77
	BL39UrxXTxFVF/5q0w8w13n8ohbpQjOb1a0/WCXv5G2zpHJ+66PfrzMGtTDDlJjAg36E31iME416L
	QM+CWlH8IbOQnAKqbpmPBkpnAoiilg3t9leUb2XeVprWufIca2Q8B4u1FIF6uU1Zdo9/rhjYu/Hi7
	+4HUCai2s2RivhTp2Kh2hf5Yr8P2v9rBm3HK8mkilW9iKAiwjzjtgYzXJDmjxbNCWj1oUKv4fdovq
	xEuLfq+uNlMwW5RwmVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFl2-001jx0-1F;
	Fri, 16 Jun 2023 20:09:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFkz-001jvn-30;
	Fri, 16 Jun 2023 20:09:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6235D63C73;
	Fri, 16 Jun 2023 20:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47916C433CD;
	Fri, 16 Jun 2023 20:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686946156;
	bh=OgYjmmyzs2EjPHttaKLNX98CAQTU+jc+5TBMU4O7+WI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LxCbm5cDIUCYF8vZ7/LSzW/JsLhlLxX2d0fFu2V1HgTidoI9d4L/VcB0ImMydV0Ee
	 8YO3x9rZwXIg0Q8DSxAacAiTV2XZF+Tx6U090kqCtI27PsdZZcqcz9z/jPPmjP/BO+
	 +hkLjrbWsn0v25jP1pDPME4x+2gpLpEY35EjhkIKvEuKe2/3rsozkAcXaNwJmCkb+A
	 X7bmvsPi5j2j5SwoGSlbvPVi8ziT05b2vTUayZaz5G8lhTX7m8dLb1/JKFPYnoJ/IR
	 mFM5oymVsHdTAn2VYpKaZ+WPpolrWfQDdRU+ChUXiqnpZHojozka+L/klHYc/ncUUT
	 POOaZ9hxvTPSA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b3424edd5fso15872831fa.0;
        Fri, 16 Jun 2023 13:09:16 -0700 (PDT)
X-Gm-Message-State: AC+VfDz+TsUL2cepmpl6uLU3Ov8oL+auziW+ktT2K/vnwtF27YxlBDSr
	ytDp62n+cep7+yYRami+b8MVB0SG7CTvSwRZc8A=
X-Google-Smtp-Source: ACHHUZ5jllDYgbNtI+72IVu/75j7amNBljuYpY3fpVnJlR5XF3n+gM7EWdkroNHXMw4vgK3ry1o4z8o6D6rXoRQsv1A=
X-Received: by 2002:a2e:b705:0:b0:2b4:4a0b:8fad with SMTP id
 j5-20020a2eb705000000b002b44a0b8fadmr2685993ljo.29.1686946154254; Fri, 16 Jun
 2023 13:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-9-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-9-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:09:02 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4xrU5vfpwOmP6KC2jzVaovjO_-zo+07YvJL3r9masQ2Q@mail.gmail.com>
Message-ID: <CAPhsuW4xrU5vfpwOmP6KC2jzVaovjO_-zo+07YvJL3r9masQ2Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] riscv: extend execmem_params for kprobes allocations
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
X-CRM114-CacheID: sfid-20230616_130918_075497_D3F01555 
X-CRM114-Status: GOOD (  20.33  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTo1MuKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoSUJNKSIgPHJwcHRAa2Vy
bmVsLm9yZz4KPgo+IFJJU0MtViBvdmVycmlkZXMga3Byb2Jlczo6YWxsb2NfaW5zbl9yYW5nZSgp
IHRvIHVzZSB0aGUgZW50aXJlIHZtYWxsb2MgYXJlYQo+IHJhdGhlciB0aGFuIGxpbWl0IHRoZSBh
bGxvY2F0aW9ucyB0byB0aGUgbW9kdWxlcyBhcmVhLgo+Cj4gU2xpZ2h0bHkgcmVvcmRlciBleGVj
bWVtX3BhcmFtcyBpbml0aWFsaXphdGlvbiB0byBzdXBwb3J0IGJvdGggMzIgYW5kIDY0Cj4gYml0
IHZhcmlhbnRzaSBhbmQgYWRkIGRlZmluaXRpb24gb2Ygaml0IGFyZWEgdG8gZXhlY21lbV9wYXJh
bXMgdG8gc3VwcG9ydAo+IGdlbmVyaWMga3Byb2Jlczo6YWxsb2NfaW5zbl9wYWdlKCkuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IChJQk0pIDxycHB0QGtlcm5lbC5vcmc+CgpBY2tl
ZC1ieTogU29uZyBMaXUgPHNvbmdAa2VybmVsLm9yZz4KCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9tb2R1bGUuYyAgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrLQo+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIHwgMTAgLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL21vZHVsZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMKPiBp
bmRleCBlZTVlMDRjZDNmMjEuLmNjYTZlZDRlOTM0MCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9tb2R1bGUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCj4gQEAg
LTQzNiw3ICs0MzYsNyBAQCBpbnQgYXBwbHlfcmVsb2NhdGVfYWRkKEVsZl9TaGRyICpzZWNoZHJz
LCBjb25zdCBjaGFyICpzdHJ0YWIsCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLSNpZiBk
ZWZpbmVkKENPTkZJR19NTVUpICYmIGRlZmluZWQoQ09ORklHXzY0QklUKQo+ICsjaWZkZWYgQ09O
RklHX01NVQo+ICBzdGF0aWMgc3RydWN0IGV4ZWNtZW1fcGFyYW1zIGV4ZWNtZW1fcGFyYW1zID0g
ewo+ICAgICAgICAgLm1vZHVsZXMgPSB7Cj4gICAgICAgICAgICAgICAgIC50ZXh0ID0gewo+IEBA
IC00NDQsMTIgKzQ0NCwyNiBAQCBzdGF0aWMgc3RydWN0IGV4ZWNtZW1fcGFyYW1zIGV4ZWNtZW1f
cGFyYW1zID0gewo+ICAgICAgICAgICAgICAgICAgICAgICAgIC5hbGlnbm1lbnQgPSAxLAo+ICAg
ICAgICAgICAgICAgICB9LAo+ICAgICAgICAgfSwKPiArICAgICAgIC5qaXQgPSB7Cj4gKyAgICAg
ICAgICAgICAgIC50ZXh0ID0gewo+ICsgICAgICAgICAgICAgICAgICAgICAgIC5wZ3Byb3QgPSBQ
QUdFX0tFUk5FTF9SRUFEX0VYRUMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgLmFsaWdubWVu
dCA9IDEsCj4gKyAgICAgICAgICAgICAgIH0sCj4gKyAgICAgICB9LAo+ICB9Owo+Cj4gIHN0cnVj
dCBleGVjbWVtX3BhcmFtcyBfX2luaXQgKmV4ZWNtZW1fYXJjaF9wYXJhbXModm9pZCkKPiAgewo+
ICsjaWZkZWYgQ09ORklHXzY0QklUCj4gICAgICAgICBleGVjbWVtX3BhcmFtcy5tb2R1bGVzLnRl
eHQuc3RhcnQgPSBNT0RVTEVTX1ZBRERSOwo+ICAgICAgICAgZXhlY21lbV9wYXJhbXMubW9kdWxl
cy50ZXh0LmVuZCA9IE1PRFVMRVNfRU5EOwo+ICsjZWxzZQo+ICsgICAgICAgZXhlY21lbV9wYXJh
bXMubW9kdWxlcy50ZXh0LnN0YXJ0ID0gVk1BTExPQ19TVEFSVDsKPiArICAgICAgIGV4ZWNtZW1f
cGFyYW1zLm1vZHVsZXMudGV4dC5lbmQgPSBWTUFMTE9DX0VORDsKPiArI2VuZGlmCj4gKwo+ICsg
ICAgICAgZXhlY21lbV9wYXJhbXMuaml0LnRleHQuc3RhcnQgPSBWTUFMTE9DX1NUQVJUOwo+ICsg
ICAgICAgZXhlY21lbV9wYXJhbXMuaml0LnRleHQuZW5kID0gVk1BTExPQ19FTkQ7Cj4KPiAgICAg
ICAgIHJldHVybiAmZXhlY21lbV9wYXJhbXM7Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJv
YmVzLmMKPiBpbmRleCAyZjA4YzE0YTkzM2QuLmU2NGYyZjMwNjRlYiAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvYmVzL2twcm9iZXMuYwo+IEBAIC0xMDQsMTYgKzEwNCw2IEBAIGludCBfX2twcm9iZXMg
YXJjaF9wcmVwYXJlX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+ICAgICAgICAgcmV0dXJuIDA7
Cj4gIH0KPgo+IC0jaWZkZWYgQ09ORklHX01NVQo+IC12b2lkICphbGxvY19pbnNuX3BhZ2Uodm9p
ZCkKPiAtewo+IC0gICAgICAgcmV0dXJuICBfX3ZtYWxsb2Nfbm9kZV9yYW5nZShQQUdFX1NJWkUs
IDEsIFZNQUxMT0NfU1RBUlQsIFZNQUxMT0NfRU5ELAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBHRlBfS0VSTkVMLCBQQUdFX0tFUk5FTF9SRUFEX0VYRUMsCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZNX0ZMVVNIX1JFU0VUX1BFUk1TLCBOVU1B
X05PX05PREUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fYnVpbHRp
bl9yZXR1cm5fYWRkcmVzcygwKSk7Cj4gLX0KPiAtI2VuZGlmCj4gLQo+ICAvKiBpbnN0YWxsIGJy
ZWFrcG9pbnQgaW4gdGV4dCAqLwo+ICB2b2lkIF9fa3Byb2JlcyBhcmNoX2FybV9rcHJvYmUoc3Ry
dWN0IGtwcm9iZSAqcCkKPiAgewo+IC0tCj4gMi4zNS4xCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
