Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE51BEB64D8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 18:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ou8GxxNjTwCwLYfmZcD3hxBrg6PRV5wsCtsOgT9cNno=; b=cD1cup7S20kzEe
	6UekVSaojI3L9XXo5CsqhuxLhCNnRnc1UeMXPR8X1O52HkK6qdmATLu3ws7BobGYeiK4QoWiYYizL
	QEYD7oUnc1FBp4cjDJMYFwVlL2ays6ZfqMcwk4Nx5bybOhLzAQcUaTOK4d8yjJvDmwPNi5omu6X6r
	fWUsxEk6GE85exnOpBvnl2j6efYqEllCDIh+tE+zrP9cbZSHheHPHlFodNIVkZjYsfuLinJA4HFN7
	F2cfB3u+RppcO58n+OxGSsk9Dj+Xnr4xZf0JMxsZy7NQ93bCj01nELsmf8+DwQNSBZ740Sh8KWdpI
	RnPOajW3ZvCkzxw71VHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qADyF-001Oob-1t;
	Fri, 16 Jun 2023 18:14:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qADyB-001OmA-2r;
	Fri, 16 Jun 2023 18:14:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E4A76290C;
	Fri, 16 Jun 2023 18:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6375BC433D9;
	Fri, 16 Jun 2023 18:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686939285;
	bh=BGYZV1Km+8ZgDrE9neT/E0fU3u3ixvSh8AYCC3TbmE4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MRdJy0RgrSJF59KF/EC7N3hN4NM7JkZeq3KagnV0DWy1PIpTqhhanwN+rGe8zgC2V
	 MRnDgp8J0NexGL29v4Mucemw/3yZahpXPMUqiEhZDo6PLZ3uYpYsxd3ZL1fbGvwWwe
	 p/R8vyd2pT+khqUskQVZmRQf+jE0REJ8n2qSSkUm6kasMtDdPJCEzuxpbIe8qI0/Ui
	 gBxANtpHkUielBt2ehqqh3PqnGUAKKbbWba+orljx4X0xezuIPakLsTrSk3Gr6J6ZG
	 8yTxdvadfsX9qXvWVMaa8ZKkExpaD1sIFaCwY2WSngDPZW1skSPKVqWoP3yaiF1YJ9
	 Nln3oL3E93qMg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4f849605df4so1420924e87.3;
        Fri, 16 Jun 2023 11:14:45 -0700 (PDT)
X-Gm-Message-State: AC+VfDxdUhH9E9ThUQv53NPOzcIyoXmPXC8WpmSO9f4z625iJBn3OgMM
	KO7AuLtI6bDiNpsHLnJ20CQLXRnGj5rt1mrOTaQ=
X-Google-Smtp-Source: ACHHUZ76yiO622Uh9+9rKEsm8ImEC4jXzUaBUsNUHgrPnEQ5V1l0GL/PgIuvK/efbFnHaYtpj3eltn1zagg/5cT90Eo=
X-Received: by 2002:a19:ab11:0:b0:4f3:bbfe:db4e with SMTP id
 u17-20020a19ab11000000b004f3bbfedb4emr1747329lfe.56.1686939283176; Fri, 16
 Jun 2023 11:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-2-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-2-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:14:31 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4nDne7L=Qh142w+dMX2pqM_4k+SZSB=QBJ8ruG_j8dug@mail.gmail.com>
Message-ID: <CAPhsuW4nDne7L=Qh142w+dMX2pqM_4k+SZSB=QBJ8ruG_j8dug@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] nios2: define virtual address space for modules
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
X-CRM114-CacheID: sfid-20230616_111448_025853_49C7E241 
X-CRM114-Status: GOOD (  20.32  )
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
bmVsLm9yZz4KPgo+IG5pb3MyIHVzZXMga21hbGxvYygpIHRvIGltcGxlbWVudCBtb2R1bGVfYWxs
b2MoKSBiZWNhdXNlIENBTEwyNi9QQ1JFTDI2Cj4gY2Fubm90IHJlYWNoIGFsbCBvZiB2bWFsbG9j
IGFkZHJlc3Mgc3BhY2UuCj4KPiBEZWZpbmUgbW9kdWxlIHNwYWNlIGFzIDMyTWlCIGJlbG93IHRo
ZSBrZXJuZWwgYmFzZSBhbmQgc3dpdGNoIG5pb3MyIHRvCj4gdXNlIHZtYWxsb2MgZm9yIG1vZHVs
ZSBhbGxvY2F0aW9ucy4KPgo+IFN1Z2dlc3RlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+Cj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCAoSUJNKSA8cnBwdEBr
ZXJuZWwub3JnPgo+IEFja2VkLWJ5OiBEaW5oIE5ndXllbiA8ZGluZ3V5ZW5Aa2VybmVsLm9yZz4K
CkFja2VkLWJ5OiBTb25nIExpdSA8c29uZ0BrZXJuZWwub3JnPgoKCj4gLS0tCj4gIGFyY2gvbmlv
czIvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgIDUgKysrKy0KPiAgYXJjaC9uaW9zMi9rZXJuZWwv
bW9kdWxlLmMgICAgICAgfCAxOSArKysrLS0tLS0tLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L25pb3MyL2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvbmlvczIvaW5jbHVkZS9hc20vcGd0
YWJsZS5oCj4gaW5kZXggMGY1YzI1NjRlOWY1Li4wMDczYjI4OWM2YTQgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9uaW9zMi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9hcmNoL25pb3MyL2luY2x1
ZGUvYXNtL3BndGFibGUuaAo+IEBAIC0yNSw3ICsyNSwxMCBAQAo+ICAjaW5jbHVkZSA8YXNtLWdl
bmVyaWMvcGd0YWJsZS1ub3BtZC5oPgo+Cj4gICNkZWZpbmUgVk1BTExPQ19TVEFSVCAgICAgICAg
ICBDT05GSUdfTklPUzJfS0VSTkVMX01NVV9SRUdJT05fQkFTRQo+IC0jZGVmaW5lIFZNQUxMT0Nf
RU5EICAgICAgICAgICAgKENPTkZJR19OSU9TMl9LRVJORUxfUkVHSU9OX0JBU0UgLSAxKQo+ICsj
ZGVmaW5lIFZNQUxMT0NfRU5EICAgICAgICAgICAgKENPTkZJR19OSU9TMl9LRVJORUxfUkVHSU9O
X0JBU0UgLSBTWl8zMk0gLSAxKQo+ICsKPiArI2RlZmluZSBNT0RVTEVTX1ZBRERSICAgICAgICAg
IChDT05GSUdfTklPUzJfS0VSTkVMX1JFR0lPTl9CQVNFIC0gU1pfMzJNKQo+ICsjZGVmaW5lIE1P
RFVMRVNfRU5EICAgICAgICAgICAgKENPTkZJR19OSU9TMl9LRVJORUxfUkVHSU9OX0JBU0UgLSAx
KQo+Cj4gIHN0cnVjdCBtbV9zdHJ1Y3Q7Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9uaW9zMi9rZXJu
ZWwvbW9kdWxlLmMgYi9hcmNoL25pb3MyL2tlcm5lbC9tb2R1bGUuYwo+IGluZGV4IDc2ZTBhNDJk
NmUzNi4uOWM5N2I3NTEzODUzIDEwMDY0NAo+IC0tLSBhL2FyY2gvbmlvczIva2VybmVsL21vZHVs
ZS5jCj4gKysrIGIvYXJjaC9uaW9zMi9rZXJuZWwvbW9kdWxlLmMKPiBAQCAtMjEsMjMgKzIxLDEy
IEBACj4KPiAgI2luY2x1ZGUgPGFzbS9jYWNoZWZsdXNoLmg+Cj4KPiAtLyoKPiAtICogTW9kdWxl
cyBzaG91bGQgTk9UIGJlIGFsbG9jYXRlZCB3aXRoIGttYWxsb2MgZm9yIChvYnZpb3VzKSByZWFz
b25zLgo+IC0gKiBCdXQgd2UgZG8gaXQgZm9yIG5vdyB0byBhdm9pZCByZWxvY2F0aW9uIGlzc3Vl
cy4gQ0FMTDI2L1BDUkVMMjYgY2Fubm90IHJlYWNoCj4gLSAqIGZyb20gMHg4MDAwMDAwMCAodm1h
bGxvYyBhcmVhKSB0byAweGMwMDAwMDAwMCAoa2VybmVsKSAoa21hbGxvYyByZXR1cm5zCj4gLSAq
IGFkZHJlc3NlcyBpbiAweGMwMDAwMDAwKQo+IC0gKi8KPiAgdm9pZCAqbW9kdWxlX2FsbG9jKHVu
c2lnbmVkIGxvbmcgc2l6ZSkKPiAgewo+IC0gICAgICAgaWYgKHNpemUgPT0gMCkKPiAtICAgICAg
ICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gLSAgICAgICByZXR1cm4ga21hbGxvYyhzaXplLCBHRlBf
S0VSTkVMKTsKPiAtfQo+IC0KPiAtLyogRnJlZSBtZW1vcnkgcmV0dXJuZWQgZnJvbSBtb2R1bGVf
YWxsb2MgKi8KPiAtdm9pZCBtb2R1bGVfbWVtZnJlZSh2b2lkICptb2R1bGVfcmVnaW9uKQo+IC17
Cj4gLSAgICAgICBrZnJlZShtb2R1bGVfcmVnaW9uKTsKPiArICAgICAgIHJldHVybiBfX3ZtYWxs
b2Nfbm9kZV9yYW5nZShzaXplLCAxLCBNT0RVTEVTX1ZBRERSLCBNT0RVTEVTX0VORCwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMLCBQQUdFX0tFUk5FTF9F
WEVDLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZNX0ZMVVNIX1JFU0VU
X1BFUk1TLCBOVU1BX05PX05PREUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApKTsKPiAgfQo+Cj4gIGludCBhcHBseV9yZWxv
Y2F0ZV9hZGQoRWxmMzJfU2hkciAqc2VjaGRycywgY29uc3QgY2hhciAqc3RydGFiLAo+IC0tCj4g
Mi4zNS4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
