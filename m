Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6AED2F7EC
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 05:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpIuQQxhkZeAq/2+JyjfEaYUxpAMarIIzoAtsOgOCBA=; b=XGY9bwz9SIBhvB
	3T2oEL2wUA4X4K6UKji4OyQEaPhvMCjQhhL2DiK8ObyMfNLWAoZOQ4jQAj5fvlwgjcZmQwXbOYYVh
	7fyUYs1Zz9lGaeQz4SBJrSW0VsCcJHmUv4PXgmUDL/3vj5V8CofmaZKOrjOCnwcAW23pmUoYetuWD
	P3sPBjZ/MTVlZp3e9JnMaeWH1G6N/utXC5jRaodbZCPlbm2R8m+Y9szRG1y14dGYaaIZrIqFl2Z7A
	XK2njj2xX2mlDUu+vSOzMkOwOEpgdEgy5VB18QHHGs4Wl6GjKMsyCgf274sG0EacqrrUtLx4KcAWA
	OroxdTBwqYjibn6LPKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1JSn-0000000DoYl-0Fk2;
	Thu, 17 Oct 2024 05:54:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1JSg-0000000DoYG-18m5
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 05:54:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 373755C575C
	for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 05:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CF6C4CECD
	for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 05:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729144453;
	bh=rf9ilj578leRVSdBOA3jdQ7Vm8kKGM+K24C3lNxNn8s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ngkLjROeLbybFUogtTtdGZQuULfHzkcoot0qI3DJZK4v+Zf+yjCm2UI8piyTiM5FX
	 UaUjNdawOu1lamUhQ8wzpe+Hbz9rgUDdQXWBagUpXCcYCT7W/wooldlc0tV8A9NwRO
	 3j0kNdydJkNyzI/aZ/QL6J5DNIlgkr7MXJs4H7XlbjFKvzkK7GlxOOTL+zrFlml+cS
	 xDuU1H5loV4zvzYgi85MG8sntQ7diRBNlceTxaaMPa8wiE1rPunTN1OWsD9Z05ldgk
	 recqzgOLCkEqGMSWiFaa8zsevPwjYUnYDOnoI+0nxlcD66n8Y9KKpDzJoIOQh34mk4
	 N6Uo5ELyJh0dw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a0474e70eso68421366b.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 22:54:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoSTn0GjcDP4ns32H6BsX0roJ6nXUQFMvflx5hi9zCEUnruy9wxzYxgvoYjj9yluq+BoGsN0xHkdUaLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRbosuDCIf+XxjEErv6I7uxXA/gyrpG2/hX2pbPZ+x5GZXZQuQ
	fguyf/4QqoeAXRex2pVO4D63yHwCHuCJ726LdAjRYaCGsKjgWyq9HjLB60ehhfPn4r4zsO/Qq6y
	x1nnH701FU+hA8Pjz+doS1nXowFI=
X-Google-Smtp-Source: AGHT+IHQPSw+9LSERgrudwoQwlV8Gyq55s+wiQ8rDc2iFREFlO16JC84fvdsqs/7jJwLLb9FfypcfY0W3RnLAZwUFVo=
X-Received: by 2002:a17:907:80b:b0:a99:375f:4523 with SMTP id
 a640c23a62f3a-a99e3e4ca7amr1699443166b.44.1729144451796; Wed, 16 Oct 2024
 22:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241016083625.136311-1-alexghiti@rivosinc.com> <20241016083625.136311-3-alexghiti@rivosinc.com>
In-Reply-To: <20241016083625.136311-3-alexghiti@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 17 Oct 2024 13:54:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT5AzU0kPz1NeAyWAohNbWC4Dp_PVdu5A2s_ytN4djQYA@mail.gmail.com>
Message-ID: <CAJF2gTT5AzU0kPz1NeAyWAohNbWC4Dp_PVdu5A2s_ytN4djQYA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: Check that vdso does not contain any
 dynamic relocations
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Vladimir Isaev <vladimir.isaev@syntacore.com>, 
	Roman Artemev <roman.artemev@syntacore.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_225414_425685_7119E689 
X-CRM114-Status: GOOD (  13.29  )
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

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgNDozOOKAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBMaWtlIG90aGVyIGFyY2hpdGVjdHVyZXMsIHVz
ZSB0aGUgY29tbW9uIGNtZF92ZHNvX2NoZWNrIHRvIG1ha2Ugc3VyZSBvZgo+IHRoYXQuCj4KPiBS
ZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IFRlc3RlZC1i
eTogVmxhZGltaXIgSXNhZXYgPHZsYWRpbWlyLmlzYWV2QHN5bnRhY29yZS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgOSArKysrKy0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRz
by9NYWtlZmlsZQo+IGluZGV4IDNmMWM0YjJkMGIwNi4uOWExYjU1NWU4NzMzIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC92ZHNvL01ha2VmaWxlCj4gQEAgLTQ1LDcgKzQ1LDcgQEAgJChvYmopL3Zkc28ubzogJChv
YmopL3Zkc28uc28KPgo+ICAjIGxpbmsgcnVsZSBmb3IgdGhlIC5zbyBmaWxlLCAubGRzIGhhcyB0
byBiZSBmaXJzdAo+ICAkKG9iaikvdmRzby5zby5kYmc6ICQob2JqKS92ZHNvLmxkcyAkKG9iai12
ZHNvKSBGT1JDRQo+IC0gICAgICAgJChjYWxsIGlmX2NoYW5nZWQsdmRzb2xkKQo+ICsgICAgICAg
JChjYWxsIGlmX2NoYW5nZWQsdmRzb2xkX2FuZF9jaGVjaykKPiAgTERGTEFHU192ZHNvLnNvLmRi
ZyA9IC1zaGFyZWQgLXNvbmFtZT1saW51eC12ZHNvLnNvLjEgXAo+ICAgICAgICAgLS1idWlsZC1p
ZD1zaGExIC0taGFzaC1zdHlsZT1ib3RoIC0tZWgtZnJhbWUtaGRyCj4KPiBAQCAtNjUsNyArNjUs
OCBAQCBpbmNsdWRlL2dlbmVyYXRlZC92ZHNvLW9mZnNldHMuaDogJChvYmopL3Zkc28uc28uZGJn
IEZPUkNFCj4gICMgYWN0dWFsIGJ1aWxkIGNvbW1hbmRzCj4gICMgVGhlIERTTyBpbWFnZXMgYXJl
IGJ1aWx0IHVzaW5nIGEgc3BlY2lhbCBsaW5rZXIgc2NyaXB0Cj4gICMgTWFrZSBzdXJlIG9ubHkg
dG8gZXhwb3J0IHRoZSBpbnRlbmRlZCBfX3Zkc29feHh4IHN5bWJvbCBvZmZzZXRzLgo+IC1xdWll
dF9jbWRfdmRzb2xkID0gVkRTT0xEICAkQAo+IC0gICAgICBjbWRfdmRzb2xkID0gJChMRCkgJChs
ZF9mbGFncykgLVQgJChmaWx0ZXItb3V0IEZPUkNFLCReKSAtbyAkQC50bXAgJiYgXAo+ICtxdWll
dF9jbWRfdmRzb2xkX2FuZF9jaGVjayA9IFZEU09MRCAgJEAKPiArICAgICAgY21kX3Zkc29sZF9h
bmRfY2hlY2sgPSAkKExEKSAkKGxkX2ZsYWdzKSAtVCAkKGZpbHRlci1vdXQgRk9SQ0UsJF4pIC1v
ICRALnRtcCAmJiBcCj4gICAgICAgICAgICAgICAgICAgICAkKE9CSkNPUFkpICQocGF0c3Vic3Qg
JSwgLUcgX192ZHNvXyUsICQodmRzby1zeW1zKSkgJEAudG1wICRAICYmIFwKPiAtICAgICAgICAg
ICAgICAgICAgIHJtICRALnRtcAo+ICsgICAgICAgICAgICAgICAgICAgcm0gJEAudG1wICYmIFwK
PiArICAgICAgICAgICAgICAgICAgICQoY21kX3Zkc29fY2hlY2spCkZvbGxvd2luZyBvdGhlciBh
cmNoaXRlY3R1cmVzIHRvIGFwcGVuZCBhICQoY21kX3Zkc29fY2hlY2spIGlzIG9rYXkuCgpSZXZp
ZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cgo+IC0tCj4gMi4zOS4yCj4KCgot
LSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
