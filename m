Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D48EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 20:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMuDZIjV95p3kQf8AT4MKrsQJHyQY7b4k7XblqELcZY=; b=tv+jFwdJ0ooEgV
	uWWeskRyWNpCo/ZJCTwYNDM6T5krsCYDP4Y3BILzOFGfkNVjbJFblyIYPCD6YpEJ0py94RoYc3P/T
	SdHJ2wqRj9g1RgAFwl9ZZZayOuVZOv1YifuADkUl3Va8oKW4ZMN7lvAYWeeUudv+XB0dLXEjmGVqm
	HIElx4mKNJijiYb32eGz3WGP2nR3GMm85yAsYos6DTzi7HkE1zlQAAall4q9pktlgC4yidXeQ/68p
	KBMB7UQeFvLHjdONBqiRmfwpqgZM92Lzyw70Ltwfcxuh9MxuEc9ED/GQawyiWmfqIeDgcdCwd/leJ
	lHVfdS1wc0pbZAQ3LnXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFhc-001jT0-2a;
	Fri, 16 Jun 2023 20:05:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFhZ-001jQl-1e;
	Fri, 16 Jun 2023 20:05:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D013963A56;
	Fri, 16 Jun 2023 20:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E21C4339A;
	Fri, 16 Jun 2023 20:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686945943;
	bh=WtL681uu0xgDuNDCtnoYcQSLjySma9uSe62fWHoJUhA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f6jdPi0vbCVqLqgQDDmD+GO6OBfmTAAnNSnv31ejf0X579gkscpmfn1bTrsu+q2ra
	 40XK5tgjD4Pn3DEwgEMNXaNpAJoNV7jL4P4r8shZe9dBhyksUMC8rwkwFkvZkFVkCR
	 IGp3JmtLPxLnrzx47G+lStd1hKB4UgLYKewi3Ki/K5woVsZktBsRAZ2Di1MUFiXRWn
	 1YkJryPbn+hll4loxeYSz5PcOp11n7V/droF7ZpB0pqIuzSutJSGr0pq7VRjU9BgpD
	 r54x5CfpgaRK4fVGltSX9D3VAd0D4uJxrcV171/lcN7V+Y7pDOa0WYzp0o27UZTPXi
	 Y80FFy3waZkgA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f6370ddd27so1591512e87.0;
        Fri, 16 Jun 2023 13:05:43 -0700 (PDT)
X-Gm-Message-State: AC+VfDx0TAu8Np/zSpx2CzRlbGZvUdAw3lBQMY3AXv4Ia4oWPTlIvfTS
	vPwUZKCHhNvLLeMvNCpjiv+SgCNZGxih0zKgD0A=
X-Google-Smtp-Source: ACHHUZ7v0OG7lj710Dpkky2x3Qwl+xOOMZ2WmKSKGrGJ24Aq4/yPm9YniFAuyGWs2DWPlG6NvD65kdAaVeIKyOd6PQ8=
X-Received: by 2002:a19:644e:0:b0:4e9:9e45:3470 with SMTP id
 b14-20020a19644e000000b004e99e453470mr2381818lfj.3.1686945941704; Fri, 16 Jun
 2023 13:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-8-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-8-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:05:29 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
Message-ID: <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] arm64, execmem: extend execmem_params for
 generated code definitions
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
X-CRM114-CacheID: sfid-20230616_130545_623359_7FA468E7 
X-CRM114-Status: GOOD (  19.98  )
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
bmVsLm9yZz4KPgo+IFRoZSBtZW1vcnkgYWxsb2NhdGlvbnMgZm9yIGtwcm9iZXMgb24gYXJtNjQg
Y2FuIGJlIHBsYWNlZCBhbnl3aGVyZSBpbgo+IHZtYWxsb2MgYWRkcmVzcyBzcGFjZSBhbmQgY3Vy
cmVudGx5IHRoaXMgaXMgaW1wbGVtZW50ZWQgd2l0aCBhbiBvdmVycmlkZQo+IG9mIGFsbG9jX2lu
c25fcGFnZSgpIGluIGFybTY0Lgo+Cj4gRXh0ZW5kIGV4ZWNtZW1fcGFyYW1zIHdpdGggYSByYW5n
ZSBmb3IgZ2VuZXJhdGVkIGNvZGUgYWxsb2NhdGlvbnMgYW5kCj4gbWFrZSBrcHJvYmVzIG9uIGFy
bTY0IHVzZSB0aGlzIGV4dGVuc2lvbiByYXRoZXIgdGhhbiBvdmVycmlkZQo+IGFsbG9jX2luc25f
cGFnZSgpLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCAoSUJNKSA8cnBwdEBrZXJu
ZWwub3JnPgo+IC0tLQo+ICBhcmNoL2FybTY0L2tlcm5lbC9tb2R1bGUuYyAgICAgICAgIHwgIDkg
KysrKysrKysrCj4gIGFyY2gvYXJtNjQva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgfCAgNyAtLS0t
LS0tCj4gIGluY2x1ZGUvbGludXgvZXhlY21lbS5oICAgICAgICAgICAgfCAxMSArKysrKysrKysr
Kwo+ICBtbS9leGVjbWVtLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKysr
Ky0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL21vZHVsZS5jIGIvYXJjaC9hcm02NC9r
ZXJuZWwvbW9kdWxlLmMKPiBpbmRleCBjM2Q5OTlmM2EzZGQuLjUyYjA5NjI2YmMwZiAxMDA2NDQK
PiAtLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9tb2R1bGUuYwo+ICsrKyBiL2FyY2gvYXJtNjQva2Vy
bmVsL21vZHVsZS5jCj4gQEAgLTMwLDYgKzMwLDEzIEBAIHN0YXRpYyBzdHJ1Y3QgZXhlY21lbV9w
YXJhbXMgZXhlY21lbV9wYXJhbXMgPSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgLmFsaWdu
bWVudCA9IE1PRFVMRV9BTElHTiwKPiAgICAgICAgICAgICAgICAgfSwKPiAgICAgICAgIH0sCj4g
KyAgICAgICAuaml0ID0gewo+ICsgICAgICAgICAgICAgICAudGV4dCA9IHsKPiArICAgICAgICAg
ICAgICAgICAgICAgICAuc3RhcnQgPSBWTUFMTE9DX1NUQVJULAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIC5lbmQgPSBWTUFMTE9DX0VORCwKPiArICAgICAgICAgICAgICAgICAgICAgICAuYWxp
Z25tZW50ID0gMSwKPiArICAgICAgICAgICAgICAgfSwKPiArICAgICAgIH0sCj4gIH07CgpUaGlz
IGlzIGdyb3dpbmcgZmFzdC4gOikgV2UgaGF2ZSAzIG5vdzogdGV4dCwgZGF0YSwgaml0LiBBbmQg
aXQgd2lsbCBiZQo1IHdoZW4gd2Ugc3BsaXQgZGF0YSBpbnRvIHJ3IGRhdGEsIHJvIGRhdGEsIHJv
IGFmdGVyIGluaXQgZGF0YS4gSSB3b25kZXIKd2hldGhlciB3ZSBzaG91bGQgc3RpbGwgZG8gc29t
ZSB0eXBlIGVudW0gaGVyZS4gQnV0IHdlIGNhbiByZXZpc2l0CnRoaXMgdG9waWMgbGF0ZXIuCgpP
dGhlciB0aGFuIHRoYXQKCkFja2VkLWJ5OiBTb25nIExpdSA8c29uZ0BrZXJuZWwub3JnPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
