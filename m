Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2163CE7C4E3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 16:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDMyZoqL5Eieur8NSngq/xXPUjndgI51pguooBMOljA=; b=I+stM5u3Wo6YTA
	c5+KVDe1NHgPg1My4XFbN9f3p+xsjUIdPpn3/1uDwyq8yv4GljaEv0KZSHoB04IJXU/LpNh4xjRaN
	SvpDS8PivtSPFwuRzYfV1nR8kQsj2WFrCI4t4r9y2MmiZiEnbmu135uTS2gIi8MzmtuUsdiGLgO8f
	1zONqycI2qNLQC589tuaLvFfDQb43DhB2cSC5BD36wnzdZu+waM2pFX3LAPqL2MuRmrf+ZsMBRCBo
	pkuOwB9zxdmh18qOwhpp+TdYwp1dQdHdz+sVEnzbaNQAoAn7vzUi49R4xdf9IbzF56cNDyPuhYIp3
	opL4nlh43PveH/XRn0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo56J-000Wlc-2B;
	Wed, 04 Oct 2023 16:51:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo56G-000Wkx-1O
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 16:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9EDB61593;
	Wed,  4 Oct 2023 16:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B86C433C8;
	Wed,  4 Oct 2023 16:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696438311;
	bh=8Q4QopUgWo8aKbA+HXXLKdUEg6EbLI8JyQNYO6KZYoE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=av2hGOlj3qAsSnrueTTJhKBE6PxCl//Zeuh3VoO/XfdvnzQf4ElpbWiVioyKym912
	 2wNq2wRpALOw0C4+aFyLNXq1+E5/t5PjmVOWgYZUYqHxnWdx3OlItAMIbZPzcxnayy
	 i+s7LRfYPiJM/UtUqeO2b0ZhixyI/nUolKM0t6Oyw61eAHZ900r7+sXn2I7lny412q
	 PsyaDz/Ey6ecMa6rWEmf0UkUTrpFiWMkbVf8U8ITB4ErYK5MrXNkii0ZiUX7aCNfQL
	 rpMrDNVxi09+zgmQJUObmc/ljp6wvb34uzkDksZOfi+m38zyudH5I/EmRuhmdaegEW
	 b6o8l7E2kjLGA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Cc: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Atish Patra
 <atishp@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 =?utf-8?Q?Bj=C3=B6rn?= Topel <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ron Minnich <rminnich@gmail.com>, Daniel
 Maslowski <cyrevolt@googlemail.com>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 1/8] riscv: remove unused functions in
 traps_misaligned.c
In-Reply-To: <20231004151405.521596-2-cleger@rivosinc.com>
References: <20231004151405.521596-1-cleger@rivosinc.com>
 <20231004151405.521596-2-cleger@rivosinc.com>
Date: Wed, 04 Oct 2023 18:51:48 +0200
Message-ID: <877co2gwkb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_095152_538353_B3507196 
X-CRM114-Status: GOOD (  10.61  )
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

Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IFJlcGxhY2Ug
bWFjcm9zIGJ5IHRoZSBvbmx5IHR3byBmdW5jdGlvbiBjYWxscyB0aGF0IGFyZSBkb25lIGZyb20g
dGhpcwo+IGZpbGUsIHN0b3JlX3U4KCkgYW5kIGxvYWRfdTgoKS4KPgo+IFNpZ25lZC1vZmYtYnk6
IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgNDYgKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiBpbmRleCAzNzhmNWIxNTE0NDMu
LmU3YmZiMzMwODljMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNh
bGlnbmVkLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiBA
QCAtMTUxLDUxICsxNTEsMTkgQEAKPiAgI2RlZmluZSBQUkVDSVNJT05fUyAwCj4gICNkZWZpbmUg
UFJFQ0lTSU9OX0QgMQo+ICAKPiAtI2RlZmluZSBERUNMQVJFX1VOUFJJVklMRUdFRF9MT0FEX0ZV
TkNUSU9OKHR5cGUsIGluc24pCQkJXAo+IC1zdGF0aWMgaW5saW5lIHR5cGUgbG9hZF8jI3R5cGUo
Y29uc3QgdHlwZSAqYWRkcikJCQlcCj4gLXsJCQkJCQkJCQlcCj4gLQl0eXBlIHZhbDsJCQkJCQkJ
XAo+IC0JYXNtICgjaW5zbiAiICUwLCAlMSIJCQkJCQlcCj4gLQk6ICI9JnIiICh2YWwpIDogIm0i
ICgqYWRkcikpOwkJCQkJXAo+IC0JcmV0dXJuIHZhbDsJCQkJCQkJXAo+IC19Cj4gK3N0YXRpYyBp
bmxpbmUgdTggbG9hZF91OChjb25zdCB1OCAqYWRkcikKClJlYWxseSBhIG5pdCwgYW5kIGFwcGxp
ZXMgdG8gdGhlIHdob2xlIGZpbGU6ICJzdGF0aWMgaW5saW5lIiBpbiBhIC5jCmZpbGUgaXMganVz
dCB1c2VsZXNzLgoKPiArewo+ICsJdTggdmFsOwo+ICAKPiAtI2RlZmluZSBERUNMQVJFX1VOUFJJ
VklMRUdFRF9TVE9SRV9GVU5DVElPTih0eXBlLCBpbnNuKQkJCVwKPiAtc3RhdGljIGlubGluZSB2
b2lkIHN0b3JlXyMjdHlwZSh0eXBlICphZGRyLCB0eXBlIHZhbCkJCQlcCj4gLXsJCQkJCQkJCQlc
Cj4gLQlhc20gdm9sYXRpbGUgKCNpbnNuICIgJTAsICUxXG4iCQkJCQlcCj4gLQk6IDogInIiICh2
YWwpLCAibSIgKCphZGRyKSk7CQkJCQlcCj4gLX0KPiArCWFzbSB2b2xhdGlsZSgibGJ1ICUwLCAl
MSIgOiAiPSZyIiAodmFsKSA6ICJtIiAoKmFkZHIpKTsKCldoeSBkbyB5b3UgbmVlZCBlYXJseSBj
bG9iYmVyIGhlcmU/CgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
