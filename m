Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A653EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 20:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gy2IFHT9IzdnQrWKMLnMtW/YGlcaaL8C74AFVgeq+5I=; b=r7Uzew1iWG+rJf
	g+Xp7+H9U6/a4p3MrF5DSpgrqZXk9prhvMgyl536adjq9keBHQDgTDPjrEhF0DvWVBIdGh8Y4qcAz
	dVJdMbVhJnEW3SJ0VGvemI66URw9cS0TEHiJ6Qxyjv/6pNNO0x8IsLVcuczK5MyW2PkY/VeLFFI1f
	wuuZmqBrg158I/KgC7hiio1pL+1U2YTocuWOHJbG1qaZ9bnZVPRdJW23kxhM2TAlaYEw1FSwtBoM5
	YraLrk9PFlhz8dV1Ut28REGPDYYeMybhXTBQutyIZU5t+UIDFs2hJ3Ib1novp+bLA3ZKt7tyytLaY
	t5nv24Sv7G+2CZ+qJ2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFll-001kC1-1I;
	Fri, 16 Jun 2023 20:10:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFlh-001k8b-0V;
	Fri, 16 Jun 2023 20:10:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 74CA763148;
	Fri, 16 Jun 2023 20:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57059C433B7;
	Fri, 16 Jun 2023 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686946199;
	bh=WUwJ/CcnS7KQMIGc+n1lO6t7DBapdJHs3PtzN2L5DOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TK7lwF2dgyhLjZz3axawLmkbuign1yOCHmc3Tx1v0nJMLzHE4AMIBuiBwMBtxulD8
	 Z3Vut6IBWtk2ssQ8ijhfs8vBi+Qy0HXySzPTA15IW8YrnEaB7IlHu2VlzDPnGeCZmI
	 K6M5pS/g15siuIekZ5t1I3/fk6k5aKAJaEj6SrOz/PCsDCt5E2f7BsT9bm6PGwrWgg
	 43Q6XfEEqBYd9YLn7kuhpOmt+nKESiRp8navYHM6l1x9CJMp/jkfUZ7Re+m79aLMHD
	 kbDq8gJyNG5Gays0CHzsM1Js8nifxRWQM5ErJCnC9FUIgd0MSE3JJ4Wb0UcNmLCkft
	 Ujy1yQtMOaDZQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f762b3227dso1482610e87.1;
        Fri, 16 Jun 2023 13:09:59 -0700 (PDT)
X-Gm-Message-State: AC+VfDxTkPS6879sehYwA8zX3EZgujY2VbWCkZ+yfhY7kIqJXXwyoFEk
	0ztcQ2Bk95MUbGGsBUGUY95PVbfi+tycjTFI1Nk=
X-Google-Smtp-Source: ACHHUZ7ituqSYIn1SCVORmrSh+1n8O6ydQ9eZHh9b53aIx4zqNf09sKQF/S2prJ95SKqvJfHTGetd9Upy9eJLOlNi04=
X-Received: by 2002:a05:6512:3052:b0:4f7:47bb:2ce0 with SMTP id
 b18-20020a056512305200b004f747bb2ce0mr3066562lfb.4.1686946197316; Fri, 16 Jun
 2023 13:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-10-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-10-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:09:45 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6TmwsBmP4NQroE5OEFsaHh+S9zweXa4Fs_ZeJURguqAg@mail.gmail.com>
Message-ID: <CAPhsuW6TmwsBmP4NQroE5OEFsaHh+S9zweXa4Fs_ZeJURguqAg@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] powerpc: extend execmem_params for kprobes allocations
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
X-CRM114-CacheID: sfid-20230616_131001_276855_E238E056 
X-CRM114-Status: GOOD (  22.81  )
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
bmVsLm9yZz4KPgo+IHBvd2VycGMgb3ZlcnJpZGVzIGtwcm9iZXM6OmFsbG9jX2luc25fcGFnZSgp
IHRvIHJlbW92ZSB3cml0YWJsZQo+IHBlcm1pc3Npb25zIHdoZW4gU1RSSUNUX01PRFVMRV9SV1gg
aXMgb24uCj4KPiBBZGQgZGVmaW5pdGlvbiBvZiBqaXQgYXJlYSB0byBleGVjbWVtX3BhcmFtcyB0
byBhbGxvdyB1c2luZyB0aGUgZ2VuZXJpYwo+IGtwcm9iZXM6OmFsbG9jX2luc25fcGFnZSgpIHdp
dGggdGhlIGRlc2lyZWQgcGVybWlzc2lvbnMuCj4KPiBBcyBwb3dlcnBjIHVzZXMgYnJlYWtwb2lu
dCBpbnN0cnVjdGlvbnMgdG8gaW5qZWN0IGtwcm9iZXMsIGl0IGRvZXMgbm90Cj4gbmVlZCB0byBj
b25zdHJhaW4ga3Byb2JlIGFsbG9jYXRpb25zIHRvIHRoZSBtb2R1bGVzIGFyZWEgYW5kIGNhbiB1
c2UgdGhlCj4gZW50aXJlIHZtYWxsb2MgYWRkcmVzcyBzcGFjZS4KPgo+IFNpZ25lZC1vZmYtYnk6
IE1pa2UgUmFwb3BvcnQgKElCTSkgPHJwcHRAa2VybmVsLm9yZz4KCkFja2VkLWJ5OiBTb25nIExp
dSA8c29uZ0BrZXJuZWwub3JnPgoKCj4gLS0tCj4gIGFyY2gvcG93ZXJwYy9rZXJuZWwva3Byb2Jl
cy5jIHwgMTQgLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9wb3dlcnBjL2tlcm5lbC9tb2R1bGUuYyAg
fCAxMyArKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
MTQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9rcHJv
YmVzLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL2twcm9iZXMuYwo+IGluZGV4IDVkYjhkZjVlMzY1
Ny4uMTRjNWRkZWMzMDU2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwva3Byb2Jl
cy5jCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9rcHJvYmVzLmMKPiBAQCAtMTI2LDIwICsx
MjYsNiBAQCBrcHJvYmVfb3Bjb2RlX3QgKmFyY2hfYWRqdXN0X2twcm9iZV9hZGRyKHVuc2lnbmVk
IGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBvZmZzZQo+ICAgICAgICAgcmV0dXJuIChrcHJvYmVf
b3Bjb2RlX3QgKikoYWRkciArIG9mZnNldCk7Cj4gIH0KPgo+IC12b2lkICphbGxvY19pbnNuX3Bh
Z2Uodm9pZCkKPiAtewo+IC0gICAgICAgdm9pZCAqcGFnZTsKPiAtCj4gLSAgICAgICBwYWdlID0g
aml0X3RleHRfYWxsb2MoUEFHRV9TSVpFKTsKPiAtICAgICAgIGlmICghcGFnZSkKPiAtICAgICAg
ICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gLQo+IC0gICAgICAgaWYgKHN0cmljdF9tb2R1bGVfcnd4
X2VuYWJsZWQoKSkKPiAtICAgICAgICAgICAgICAgc2V0X21lbW9yeV9yb3goKHVuc2lnbmVkIGxv
bmcpcGFnZSwgMSk7Cj4gLQo+IC0gICAgICAgcmV0dXJuIHBhZ2U7Cj4gLX0KPiAtCj4gIGludCBh
cmNoX3ByZXBhcmVfa3Byb2JlKHN0cnVjdCBrcHJvYmUgKnApCj4gIHsKPiAgICAgICAgIGludCBy
ZXQgPSAwOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL21vZHVsZS5jIGIvYXJj
aC9wb3dlcnBjL2tlcm5lbC9tb2R1bGUuYwo+IGluZGV4IDRjNmMxNWJmMzk0Ny4uOGU1YjM3OWQ2
ZGExIDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlLmMKPiArKysgYi9h
cmNoL3Bvd2VycGMva2VybmVsL21vZHVsZS5jCj4gQEAgLTk2LDYgKzk2LDExIEBAIHN0YXRpYyBz
dHJ1Y3QgZXhlY21lbV9wYXJhbXMgZXhlY21lbV9wYXJhbXMgPSB7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgLmFsaWdubWVudCA9IDEsCj4gICAgICAgICAgICAgICAgIH0sCj4gICAgICAgICB9
LAo+ICsgICAgICAgLmppdCA9IHsKPiArICAgICAgICAgICAgICAgLnRleHQgPSB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgLmFsaWdubWVudCA9IDEsCj4gKyAgICAgICAgICAgICAgIH0sCj4g
KyAgICAgICB9LAo+ICB9Owo+Cj4KPiBAQCAtMTMxLDUgKzEzNiwxMyBAQCBzdHJ1Y3QgZXhlY21l
bV9wYXJhbXMgX19pbml0ICpleGVjbWVtX2FyY2hfcGFyYW1zKHZvaWQpCj4KPiAgICAgICAgIGV4
ZWNtZW1fcGFyYW1zLm1vZHVsZXMudGV4dC5wZ3Byb3QgPSBwcm90Owo+Cj4gKyAgICAgICBleGVj
bWVtX3BhcmFtcy5qaXQudGV4dC5zdGFydCA9IFZNQUxMT0NfU1RBUlQ7Cj4gKyAgICAgICBleGVj
bWVtX3BhcmFtcy5qaXQudGV4dC5lbmQgPSBWTUFMTE9DX0VORDsKPiArCj4gKyAgICAgICBpZiAo
c3RyaWN0X21vZHVsZV9yd3hfZW5hYmxlZCgpKQo+ICsgICAgICAgICAgICAgICBleGVjbWVtX3Bh
cmFtcy5qaXQudGV4dC5wZ3Byb3QgPSBQQUdFX0tFUk5FTF9ST1g7Cj4gKyAgICAgICBlbHNlCj4g
KyAgICAgICAgICAgICAgIGV4ZWNtZW1fcGFyYW1zLmppdC50ZXh0LnBncHJvdCA9IFBBR0VfS0VS
TkVMX0VYRUM7Cj4gKwo+ICAgICAgICAgcmV0dXJuICZleGVjbWVtX3BhcmFtczsKPiAgfQo+IC0t
Cj4gMi4zNS4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
