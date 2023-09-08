Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E84EE57E6
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BFvOuhExtFJs6X/qbYzxYcOrvEYma+l7w1uBcrPFIY=; b=yFj7aVSH+/8LHZ
	xj7TV7yZ46ldvU9hvwNp6BAFF5QMC6vzPX3pA+wS2VpyyiZrCfKHPUnGaqPhWHJbwzXrd8aArIE4F
	NNckDLWqZl1ATjdSh2fr3Vkxs7MA1ssbLrlRr+iZUP8FamkSbjHNq1dk1niiVCm6q1UBnaJG6JHni
	1xMhXIzVTshwk3EFD0YcyW9nwazSWDX+6il1sgZEzFuk9I4M0SdGQj/1f6GInJ3K6J7QnunsBWrtm
	HDz6s8+3XbUIwH+f2ScsPaOHUlzbeqf2AI5dPTJKgRk6/kGOIBzmWeapyhRIJe3gbVfaSQBVS973i
	47ArGUzGXfm7iWobS8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeXNi-00DMbz-0C;
	Fri, 08 Sep 2023 09:02:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeXNe-00DMaj-1l;
	Fri, 08 Sep 2023 09:02:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D429ECE1B68;
	Fri,  8 Sep 2023 09:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC73C433C8;
	Fri,  8 Sep 2023 09:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694163739;
	bh=rRKEvIB0lVb2uGUWPoA0+XeAQvNtg/fARJrpqhmZI3E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bOXNj24SHdKL79z6qfM1jz0YMFFEnZqcAWfQGXW2LdIVaQDbeY0DQhD5/JprtiyDj
	 5D1k99+9Ug9dFN3lpUVgUMFb+noK4GaCPvJKFCJwg7T2e2+JUsNC8ryA59UAI/MjA+
	 nhZly7RSUCbgUDXu5rbOkRxYN7fIeaweU9f951Eubr4hYUupmCp3r0d0X0xr56GoG7
	 TSWC4FWPFYAvPS4fSD21+7m/TJTDKv1lgcMSbfjITw67g2TtEjYcmoKItUG7Y97Hw0
	 VZNeNKEm7ZluvzqobouSn1v3ioXDS3dPfdRUJCnjtDuu6e2FCsvfTpz6bPkSMQxquU
	 qkfRaTdEcE2/w==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-52c9f1bd05dso2459759a12.3;
        Fri, 08 Sep 2023 02:02:19 -0700 (PDT)
X-Gm-Message-State: AOJu0YwvQt1zAOWJDcLzx4HIF9ZJyPkrMNmHxa4hW/krCapwxYbK6Jny
	aOxb2Tmur7Av9qc9Zr3Qldae8cFyI6lkVyKvmOM=
X-Google-Smtp-Source: AGHT+IHIxkho9CXfRVQdHREUP1Ny9xnSRZ4p9AxmPd+t8Z6hWpbhNEsJKkVWz7HAOHHA2nwechuLx9pmYabZgwNqZ0U=
X-Received: by 2002:a17:906:18aa:b0:9a1:c42e:5e5e with SMTP id
 c10-20020a17090618aa00b009a1c42e5e5emr1264248ejf.42.1694163717201; Fri, 08
 Sep 2023 02:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
 <20230906-jag-sysctl_remove_empty_elem_arch-v1-8-3935d4854248@samsung.com>
In-Reply-To: <20230906-jag-sysctl_remove_empty_elem_arch-v1-8-3935d4854248@samsung.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 8 Sep 2023 17:01:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRFrd4zs_8vv5-n5p_+GYxnTJcRBtYDJaMZQQMOVKKOTw@mail.gmail.com>
Message-ID: <CAJF2gTRFrd4zs_8vv5-n5p_+GYxnTJcRBtYDJaMZQQMOVKKOTw@mail.gmail.com>
Subject: Re: [PATCH 8/8] c-sky: rm sentinel element from ctl_talbe array
To: j.granados@samsung.com
Cc: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, josh@joshtriplett.org, 
	Kees Cook <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-fsdevel@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-ia64@vger.kernel.org, linux-csky@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_020222_949141_47D8F03D 
X-CRM114-Status: GOOD (  19.96  )
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

QWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gV2VkLCBTZXAgNiwgMjAy
MyBhdCA2OjA04oCvUE0gSm9lbCBHcmFuYWRvcyB2aWEgQjQgUmVsYXkKPGRldm51bGwrai5ncmFu
YWRvcy5zYW1zdW5nLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEpvZWwgR3JhbmFk
b3MgPGouZ3JhbmFkb3NAc2Ftc3VuZy5jb20+Cj4KPiBUaGlzIGNvbW1pdCBjb21lcyBhdCB0aGUg
dGFpbCBlbmQgb2YgYSBncmVhdGVyIGVmZm9ydCB0byByZW1vdmUgdGhlCj4gZW1wdHkgZWxlbWVu
dHMgYXQgdGhlIGVuZCBvZiB0aGUgY3RsX3RhYmxlIGFycmF5cyAoc2VudGluZWxzKSB3aGljaAo+
IHdpbGwgcmVkdWNlIHRoZSBvdmVyYWxsIGJ1aWxkIHRpbWUgc2l6ZSBvZiB0aGUga2VybmVsIGFu
ZCBydW4gdGltZQo+IG1lbW9yeSBibG9hdCBieSB+NjQgYnl0ZXMgcGVyIHNlbnRpbmVsIChmdXJ0
aGVyIGluZm9ybWF0aW9uIExpbmsgOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9aTzVZ
eDVKRm9nR2klMkZjQm9AYm9tYmFkaWwuaW5mcmFkZWFkLm9yZy8pCj4KPiBSZW1vdmUgc2VudGlu
ZWwgZnJvbSBhbGlnbm1lbnRfdGJsIGN0bF90YWJsZSBhcnJheS4KPgo+IFNpZ25lZC1vZmYtYnk6
IEpvZWwgR3JhbmFkb3MgPGouZ3JhbmFkb3NAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGFyY2gvY3Nr
eS9hYml2MS9hbGlnbm1lbnQuYyB8IDMgKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2Nza3kvYWJpdjEvYWxp
Z25tZW50LmMgYi9hcmNoL2Nza3kvYWJpdjEvYWxpZ25tZW50LmMKPiBpbmRleCBiNjAyNTlkYWVk
MWIuLjBkNzVjZTdiMDMyOCAxMDA2NDQKPiAtLS0gYS9hcmNoL2Nza3kvYWJpdjEvYWxpZ25tZW50
LmMKPiArKysgYi9hcmNoL2Nza3kvYWJpdjEvYWxpZ25tZW50LmMKPiBAQCAtMzI4LDggKzMyOCw3
IEBAIHN0YXRpYyBzdHJ1Y3QgY3RsX3RhYmxlIGFsaWdubWVudF90YmxbNV0gPSB7Cj4gICAgICAg
ICAgICAgICAgIC5tYXhsZW4gPSBzaXplb2YoYWxpZ25fdXNyX2NvdW50KSwKPiAgICAgICAgICAg
ICAgICAgLm1vZGUgPSAwNjY2LAo+ICAgICAgICAgICAgICAgICAucHJvY19oYW5kbGVyID0gJnBy
b2NfZG9pbnR2ZWMKPiAtICAgICAgIH0sCj4gLSAgICAgICB7fQo+ICsgICAgICAgfQo+ICB9Owo+
Cj4gIHN0YXRpYyBpbnQgX19pbml0IGNza3lfYWxpZ25tZW50X2luaXQodm9pZCkKPgo+IC0tCj4g
Mi4zMC4yCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
