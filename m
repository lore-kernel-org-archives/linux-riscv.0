Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CF9EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 20:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4WM3i5iWGJeCh9Pl3jnM6PMMMRJass/8UthnARTuCk=; b=cZfmorTtdD6Nxr
	xlshDr0D+8aZeesmbyVRIkMJLu1gLoePOeTUnNx4BjDx/RN7tTnW7W557x39kmj38ik7QndJAOYYA
	PjAklMD72rQY9zVdPNM0XWpWzW3Kr0011UceEd4hRDOz8gFQlXiwmTqhaJ8ms8lBBYctA2IegOM99
	NuLJgIUwH3tOzErAfV/idKbnc/XbUWdyv7fGkiqWF6BaHs9J0lztMbLwLpd2aRnwbmb6SD/7PmC4h
	jlQDLvPz5P6urPC/E3CLayncIeQXdinVgOk1xVRaqufsJoDI2Xmh3EDKBGJhXWQ53f2fXJS8K6jPL
	jo+yE92k+Eq/lhIf/YHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFuU-001lyA-1r;
	Fri, 16 Jun 2023 20:19:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFuR-001lwD-18;
	Fri, 16 Jun 2023 20:19:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D9DEC63EB1;
	Fri, 16 Jun 2023 20:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A48C433C9;
	Fri, 16 Jun 2023 20:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686946742;
	bh=2gFsvIXhZCi6KoizK2mVR8ubH1d6zKHpuStaPaewE2c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UDI57R+Ac8F87HdvmrIejvjCHM49LTC4REb6jwcTgaWly1GGKsFbDi3ghmDp0sH5F
	 dyADcSB+eIU3pbcZs4WY9WOy0Qfue9ZKueQFrHo6+fN0pFBb6x0I9BFxnKIQnZ0f6m
	 zoeRxS58zso8o8K5cKrj75Ci+DjJ2i0NK5f/ruazAus2+TOpX2RWJhZX7p+ZAwMaoZ
	 7/IjfjgHld/4MT6CtRzHW+8wrzT/BS827SmRNHxio26g9lEtfuPfj6kxYVksHyp6iy
	 q4wBjLvMwutEo9bQbQ0iSwXG+SX0mZCYXiK84cI+EMmphh55ZOB3JRt4P0s1ApMmst
	 2YeyFD5vvx/Xg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f611ac39c5so1588958e87.2;
        Fri, 16 Jun 2023 13:19:02 -0700 (PDT)
X-Gm-Message-State: AC+VfDwSikXA+E8YU+///QJIKIuyzzhV5TCSNHZMcxFmmYYfVsah5eXt
	GNIOspUcRyr1abdxcxtedv0TIw9+1zlz7BZmUj8=
X-Google-Smtp-Source: ACHHUZ4xCjWLdj6bUZgrYEqyfT0+mWbIpLp7dl+h+OA2H/SetbsgMpyruMyrfqh6ldv/ey70g6BKmUQ4Jmh+AiNCLf0=
X-Received: by 2002:a19:5e02:0:b0:4f7:69b9:fa07 with SMTP id
 s2-20020a195e02000000b004f769b9fa07mr2191315lfb.45.1686946740318; Fri, 16 Jun
 2023 13:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-12-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-12-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:18:48 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5N3RuBijpyXrzVk_mpAyUQ5TeTuS2jic6Y-ybFVJpBjg@mail.gmail.com>
Message-ID: <CAPhsuW5N3RuBijpyXrzVk_mpAyUQ5TeTuS2jic6Y-ybFVJpBjg@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] x86/ftrace: enable dynamic ftrace without CONFIG_MODULES
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
X-CRM114-CacheID: sfid-20230616_131903_474953_9716F8F6 
X-CRM114-Status: GOOD (  20.69  )
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
bmVsLm9yZz4KPgo+IER5bmFtaWMgZnRyYWNlIG11c3QgYWxsb2NhdGUgbWVtb3J5IGZvciBjb2Rl
IGFuZCB0aGlzIHdhcyBpbXBvc3NpYmxlCj4gd2l0aG91dCBDT05GSUdfTU9EVUxFUy4KPgo+IFdp
dGggZXhlY21lbSBzZXBhcmF0ZWQgZnJvbSB0aGUgbW9kdWxlcyBjb2RlLCBleGVjbWVtX3RleHRf
YWxsb2MoKSBpcwo+IGF2YWlsYWJsZSByZWdhcmRsZXNzIG9mIENPTkZJR19NT0RVTEVTLgo+Cj4g
UmVtb3ZlIGRlcGVuZGVuY3kgb2YgZHluYW1pYyBmdHJhY2Ugb24gQ09ORklHX01PRFVMRVMgYW5k
IG1ha2UKPiBDT05GSUdfRFlOQU1JQ19GVFJBQ0Ugc2VsZWN0IENPTkZJR19FWEVDTUVNIGluIEtj
b25maWcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IChJQk0pIDxycHB0QGtlcm5l
bC5vcmc+CgpBY2tlZC1ieTogU29uZyBMaXUgPHNvbmdAa2VybmVsLm9yZz4KCj4gLS0tCj4gIGFy
Y2gveDg2L0tjb25maWcgICAgICAgICB8ICAxICsKPiAgYXJjaC94ODYva2VybmVsL2Z0cmFjZS5j
IHwgMTAgLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMCBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9LY29uZmlnIGIvYXJjaC94ODYv
S2NvbmZpZwo+IGluZGV4IDUzYmFiMTIzYThlZS4uYWI2NGJiZWY5ZTUwIDEwMDY0NAo+IC0tLSBh
L2FyY2gveDg2L0tjb25maWcKPiArKysgYi9hcmNoL3g4Ni9LY29uZmlnCj4gQEAgLTM1LDYgKzM1
LDcgQEAgY29uZmlnIFg4Nl82NAo+ICAgICAgICAgc2VsZWN0IFNXSU9UTEIKPiAgICAgICAgIHNl
bGVjdCBBUkNIX0hBU19FTEZDT1JFX0NPTVBBVAo+ICAgICAgICAgc2VsZWN0IFpPTkVfRE1BMzIK
PiArICAgICAgIHNlbGVjdCBFWEVDTUVNIGlmIERZTkFNSUNfRlRSQUNFCj4KPiAgY29uZmlnIEZP
UkNFX0RZTkFNSUNfRlRSQUNFCj4gICAgICAgICBkZWZfYm9vbCB5Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2tlcm5lbC9mdHJhY2UuYyBiL2FyY2gveDg2L2tlcm5lbC9mdHJhY2UuYwo+IGluZGV4
IGY3N2M2M2JiMzIwMy4uYTgyNGE1ZDNiMTI5IDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2tlcm5l
bC9mdHJhY2UuYwo+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9mdHJhY2UuYwo+IEBAIC0yNjEsOCAr
MjYxLDYgQEAgdm9pZCBhcmNoX2Z0cmFjZV91cGRhdGVfY29kZShpbnQgY29tbWFuZCkKPiAgLyog
Q3VycmVudGx5IG9ubHkgeDg2XzY0IHN1cHBvcnRzIGR5bmFtaWMgdHJhbXBvbGluZXMgKi8KPiAg
I2lmZGVmIENPTkZJR19YODZfNjQKPgo+IC0jaWZkZWYgQ09ORklHX01PRFVMRVMKPiAtLyogTW9k
dWxlIGFsbG9jYXRpb24gc2ltcGxpZmllcyBhbGxvY2F0aW5nIG1lbW9yeSBmb3IgY29kZSAqLwo+
ICBzdGF0aWMgaW5saW5lIHZvaWQgKmFsbG9jX3RyYW1wKHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiAg
ewo+ICAgICAgICAgcmV0dXJuIGV4ZWNtZW1fdGV4dF9hbGxvYyhzaXplKTsKPiBAQCAtMjcxLDE0
ICsyNjksNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdHJhbXBfZnJlZSh2b2lkICp0cmFtcCkKPiAg
ewo+ICAgICAgICAgZXhlY21lbV9mcmVlKHRyYW1wKTsKPiAgfQo+IC0jZWxzZQo+IC0vKiBUcmFt
cG9saW5lcyBjYW4gb25seSBiZSBjcmVhdGVkIGlmIG1vZHVsZXMgYXJlIHN1cHBvcnRlZCAqLwo+
IC1zdGF0aWMgaW5saW5lIHZvaWQgKmFsbG9jX3RyYW1wKHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiAt
ewo+IC0gICAgICAgcmV0dXJuIE5VTEw7Cj4gLX0KPiAtc3RhdGljIGlubGluZSB2b2lkIHRyYW1w
X2ZyZWUodm9pZCAqdHJhbXApIHsgfQo+IC0jZW5kaWYKPgo+ICAvKiBEZWZpbmVkIGFzIG1hcmtl
cnMgdG8gdGhlIGVuZCBvZiB0aGUgZnRyYWNlIGRlZmF1bHQgdHJhbXBvbGluZXMgKi8KPiAgZXh0
ZXJuIHZvaWQgZnRyYWNlX3JlZ3NfY2FsbGVyX2VuZCh2b2lkKTsKPiAtLQo+IDIuMzUuMQo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
