Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8DECA0ECD
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 05:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAuz4xIzh95ULnhV8RGxKj9/ZQ5OvSkKqbv5UNrryCM=; b=gUCg4y0DyKZH7Q
	s7PyiSb4iNi4y5/QKNWQF2CKMZn7dEwgX+5dTbVXnb+aPvQKGhUwWpJns4Duusiez9tbUk9dUMZWE
	8oYbnDxJvt1jXNkGyIBmZR03n24AF6aGA7wpWmw5+8FcYO7ExS11gOWKqxXSRZTGvfs5uc19BwUOW
	Bx/L7KCwnI0PDOAm/Jadc+fJ+2+4/86qEJwCL6FdcRq4pjOAqAbcqIES2t8gZbLuWWIiUtStmiDuk
	EjhzL7vbFUgR/vEgpQ9MNxGpQOKTrgi65bFuigXyzc3XxiHP7pLW3IH7xNxacVnkq9j+1WsdlSOgt
	jl22Olk4I3n0K20vbjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgeSO-007Nuq-1s;
	Thu, 14 Sep 2023 05:00:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgeSM-007Ntx-0D
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 04:59:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2794A60E94
	for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 04:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D49C43391
	for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 04:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694667596;
	bh=Rl6KtUOR7lGfXDB0ACl29fli7qsumtq8Sa3pkYraR3o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sBtFRPlktiqUqWJ+qVtOTrvRJgzAdsvLUIzHPGybTJHNovqa3e34YDzYRAPD2W6fs
	 10aCoKyxQ+XQEjYns8tKii8l5+PKnCmGipho2s+RKuc19K30+3kQ5Od2f/MWRSzqLh
	 oriprnAmtCDrdqWvgABl/PRqo8RJhu6CBpA7C/Kyq6NX80dG/PR84MueSd2Os0krqw
	 2wOU+y/9OAEwtRx7WyxkW2o1FVnZJAl8u4YWjquECx2qX2jfNMlCJ2jqRtrNT/JIQx
	 +55S4uS0lHZyrbEJLPHqDT5qJ5CUXmtpO8cKHx2se4GegXUnprhUdtoszmUR/WaqT5
	 OnUALmnm5IOqg==
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-307d20548adso484501f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 21:59:55 -0700 (PDT)
X-Gm-Message-State: AOJu0YxVjhq0UtTOuJ9PIgesuzz0MxpKAF0wYIbdtuFJx6k+s+40Qpxs
	hi8IB8qHeof9VeQ9htLFsANWMLEybch8NisQ4ow=
X-Google-Smtp-Source: AGHT+IGAi8FBXeB97ec9p2Mj3AW5CWMiKE3sfA3yzAud6DIT7z8hpM7qtM6fK02eb/Fx6LARynCbCqmKWtUPEGFFP18=
X-Received: by 2002:a5d:490a:0:b0:31a:d5fa:d710 with SMTP id
 x10-20020a5d490a000000b0031ad5fad710mr3912116wrq.2.1694667594424; Wed, 13 Sep
 2023 21:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230809031023.3575407-1-songshuaishuai@tinylab.org>
In-Reply-To: <20230809031023.3575407-1-songshuaishuai@tinylab.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 14 Sep 2023 12:59:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRHbvwyZR_qUNsc3E9X=Y1H7yTcZo3NLgXQ45=jm1jbTg@mail.gmail.com>
Message-ID: <CAJF2gTRHbvwyZR_qUNsc3E9X=Y1H7yTcZo3NLgXQ45=jm1jbTg@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: Update the comment of CONFIG_PAGE_OFFSET
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ajones@ventanamicro.com, alexghiti@rivosinc.com, anup@brainfault.org, 
	samuel@sholland.org, rppt@kernel.org, suagrfillet@gmail.com, 
	panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_215958_172635_18E31BD1 
X-CRM114-Status: GOOD (  17.37  )
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

T24gV2VkLCBBdWcgOSwgMjAyMyBhdCAxMToxMeKAr0FNIFNvbmcgU2h1YWkgPHNvbmdzaHVhaXNo
dWFpQHRpbnlsYWIub3JnPiB3cm90ZToKPgo+IEZyb206IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0
QGdtYWlsLmNvbT4KPgo+IFNpbmNlIHRoZSBjb21taXQgMDExZjA5ZDEyMDUyIHNldCBzdjU3IGFz
IGRlZmF1bHQgZm9yIENPTkZJR182NEJJVCwKPiB0aGUgY29tbWVudCBvZiBDT05GSUdfUEFHRV9P
RkZTRVQgc2hvdWxkIGJlIHVwZGF0ZWQgdG9vLgo+Cj4gRml4ZXM6IDAxMWYwOWQxMjA1MiAoInJp
c2N2OiBtbTogU2V0IHN2NTcgb24gZGVmYXVsdGx5IikKPiBTaWduZWQtb2ZmLWJ5OiBTb25nIFNo
dWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGFnZS5oIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdl
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAo+IGluZGV4IGI1NWJhMjA5MDNlYy4u
NTNjMDAxNjRjMDQyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5o
Cj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKPiBAQCAtMzMsOCArMzMsOCBA
QAo+ICAjZGVmaW5lIFBBR0VfT0ZGU0VUICAgICAgICAgICAgX0FDKENPTkZJR19QQUdFX09GRlNF
VCwgVUwpCldoeSBub3QgcmVtb3ZlIENPTkZJR19QQUdFX09GRlNFVCBhbmQgZGVmaW5lIFBBR0Vf
T0ZGU0VUX0wyID8KCj4gICNlbmRpZgo+ICAvKgo+IC0gKiBCeSBkZWZhdWx0LCBDT05GSUdfUEFH
RV9PRkZTRVQgdmFsdWUgY29ycmVzcG9uZHMgdG8gU1Y0OCBhZGRyZXNzIHNwYWNlIHNvCj4gLSAq
IGRlZmluZSB0aGUgUEFHRV9PRkZTRVQgdmFsdWUgZm9yIFNWMzkuCj4gKyAqIEJ5IGRlZmF1bHQs
IENPTkZJR19QQUdFX09GRlNFVCB2YWx1ZSBjb3JyZXNwb25kcyB0byBTVjU3IGFkZHJlc3Mgc3Bh
Y2Ugc28KPiArICogZGVmaW5lIHRoZSBQQUdFX09GRlNFVCB2YWx1ZSBmb3IgU1Y0OCBhbmQgU1Yz
OS4KPiAgICovCj4gICNkZWZpbmUgUEFHRV9PRkZTRVRfTDQgICAgICAgICBfQUMoMHhmZmZmYWY4
MDAwMDAwMDAwLCBVTCkKPiAgI2RlZmluZSBQQUdFX09GRlNFVF9MMyAgICAgICAgIF9BQygweGZm
ZmZmZmQ4MDAwMDAwMDAsIFVMKQo+IC0tCj4gMi4yMC4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBH
dW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
