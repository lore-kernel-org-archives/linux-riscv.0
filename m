Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6E7C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 06:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Se3LqUj5Gdr2LoH8/Gz+o5954YF3vUQSbB+nARGlit8=; b=OAuX/4qdgovGKS
	AeVwl9woHPrdbXsTDUAegbaIMQTq0OG9ZPLJJQuo16wxd8trnZMBAm2EIjcfzn3gW88cegjhxcf4P
	Um7Jfr9frERqg7yxybp3LLNp9p5Q206cAZeQmO7wmvN7PfsBLmv+shQ+imDALMqIlTnz1KEFDDUGc
	Zn73SRLf6WO+w+wa+FB8bsFvSzoZ5vYlimFry/aBs0N39W49RSmBRC7JMEdJhLFQZka8s1MNBtaqi
	Ls38ZIWVJnbJT39Iil1PRe6Q9Cfnpc7qD/+1uz3jHjE0DrxvNI0OfCv7mJk/Xnh01UaHIV2GIEAKV
	0JpRx9lHURMseBMP3lZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOXIR-00000005lLP-1hyi;
	Tue, 02 Jul 2024 06:47:23 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOXIO-00000005lKg-1zgw
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 06:47:21 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a727d9dd367so408006166b.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 23:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719902839; x=1720507639; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sWHf/BPCxqcOmPmDzQLfmK1gpdpTOLdypHsiZNysuI=;
        b=s0XY6BSlzQUesJUUmNL2acf9ZnGjuaYIGWuxyKESrsZOm8N/Pd9WGN9j3T4Fib+6M1
         +QUfANoG/w79etcRPeMWB8cz+YX0pT7ke+YmuZom4du2gDB7GJiNjRtYbd2WEmCU0hWl
         sGHAnwRsIIYet1fm+xtx6p0S9ibe2PqNtmzo541VTeNk1RWjIJ29dhSWeUkXNQQg3PD9
         jjMEGLPg8VxGE8oTgxXhMFn5MkdVs2XoEy9cO0c0Z0PkTaaevGZz+Ksi9uvKb40zJThH
         yRdijPc2PuBjrxf1KRkay93n4OhqC6IgMRwbcxYoUuksm7hRYJm370eou6TUJhqEFugK
         /MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719902839; x=1720507639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sWHf/BPCxqcOmPmDzQLfmK1gpdpTOLdypHsiZNysuI=;
        b=K+BOK2AnY7iYBkSteFSlWhBFlZhI6jZfFXDJSI7jwldE+Q1nXPLUCrEvRrZ62ujRRO
         DUa5Mn5VqmmqiJeMNyfioq/hU7l9JQRN3zElAp8wxQ+1YsW6gSlpdGlZPWbKn9bVapGj
         N00iX3fhy4fvvmrwNSAVX2XvQ6OKtgS5GWScULtHUKCABBV8P+yEO2TJXpOJlXplgp1/
         QId8CgDGYP6UiBQjhrpQAq9Z0Xf8yq3hoXFE+ud2aQUHq/YFc5s2yibTiomEszVn7yLX
         lZSkwywifp6R36pBVdRiiKENiI7vnpLFGQ4I/hlbW93681LwWuKkDVI9z3WDbUy41VYl
         J1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVFWfhAT4oAAuMJSBgzL0YICBzgeeNIs9dkmrmbBH3WYQYh/d3ZBK5Aj/BFVAEXL7zOTUWDmu+Wp4IR8jbcUGwkHITYviOjA5rkyQgaBWU/
X-Gm-Message-State: AOJu0YygvwubSX6A8ZXedaC/Z7ci3Ve1miXmd6kmsfC1cE2x7NKQL+Ig
	3UkYHSEztlm9IYZA3oFYy+t4ca/GmcA6BTU8BSD/STrv+vclQZm3pB9aQswPQnenPE2dupCeaLl
	VaeHXDvjB3WSkzWZtOFIAKZs1QJlhyMYli6mczg==
X-Google-Smtp-Source: AGHT+IE7C7ietJ4Y/0+uH2m6mHvh2YOlBatLgbz6q8AofuEHMi7jepOQs6Xhd/J9ZNKB8Vfix6LAyfaQ9R7VRjkSy+0=
X-Received: by 2002:a17:907:980a:b0:a6f:501d:c224 with SMTP id
 a640c23a62f3a-a75144ba407mr634036266b.57.1719902838709; Mon, 01 Jul 2024
 23:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240701185132.319995-1-jesse@rivosinc.com> <20240701185132.319995-3-jesse@rivosinc.com>
 <ZoNtrXawP8nvXUds@ghost>
In-Reply-To: <ZoNtrXawP8nvXUds@ghost>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 2 Jul 2024 08:47:07 +0200
Message-ID: <CAHVXubgq8YRTmp5ah2RmfQ6BoPRZDbkrYOuNvGX5yScUcNM7cw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] RISC-V: lib: Add pi aliases for string functions
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Wende Tan <twd2.me@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Sami Tolvanen <samitolvanen@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_234720_536128_F2FE8ACE 
X-CRM114-Status: GOOD (  16.03  )
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

T24gVHVlLCBKdWwgMiwgMjAyNCBhdCA1OjAy4oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAwMSwgMjAyNCBhdCAwMjo1MToz
MFBNIC0wNDAwLCBKZXNzZSBUYXViZSB3cm90ZToKPiA+IG1lbXNldCwgc3RyY21wLCBhbmQgc3Ry
bmNtcCBhcmUgYWxsIHVzZWQgaW4gdGhlIHRoZSBfX3BpXyBzZWN0aW9uLgo+ID4gYWRkIFNZTV9G
VU5DX0FMSUFTIGZvciB0aGVtLgo+ID4KPiA+IFdoZW4gS0FTQU4gaXMgZW5hYmxlZCBpbiA8YXNt
L3N0cmluZy5oPiBfX3BpX19fbWVtc2V0IGlzIGFsc28gbmVlZGVkLgo+ID4KPiA+IFN1Z2dlc3Rl
ZC1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+IFYyIC0+
IFYzOgo+ID4gIC0gTmV3IHBhdGNoCj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2xpYi9tZW1zZXQu
UyAgfCAyICsrCj4gPiAgYXJjaC9yaXNjdi9saWIvc3RyY21wLlMgIHwgMSArCj4gPiAgYXJjaC9y
aXNjdi9saWIvc3RybmNtcC5TIHwgMSArCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9saWIvbWVtc2V0LlMgYi9hcmNo
L3Jpc2N2L2xpYi9tZW1zZXQuUwo+ID4gaW5kZXggMzVmMzU4ZTcwYmRiLi5kYTIzYjgzNDdlMmQg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2xpYi9tZW1zZXQuUwo+ID4gKysrIGIvYXJjaC9y
aXNjdi9saWIvbWVtc2V0LlMKPiA+IEBAIC0xMTEsMyArMTExLDUgQEAgU1lNX0ZVTkNfU1RBUlQo
X19tZW1zZXQpCj4gPiAgICAgICByZXQKPiA+ICBTWU1fRlVOQ19FTkQoX19tZW1zZXQpCj4gPiAg
U1lNX0ZVTkNfQUxJQVNfV0VBSyhtZW1zZXQsIF9fbWVtc2V0KQo+ID4gK1NZTV9GVU5DX0FMSUFT
KF9fcGlfbWVtc2V0LCBfX21lbXNldCkKPiA+ICtTWU1fRlVOQ19BTElBUyhfX3BpX19fbWVtc2V0
LCBfX21lbXNldCkKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2xpYi9zdHJjbXAuUyBiL2Fy
Y2gvcmlzY3YvbGliL3N0cmNtcC5TCj4gPiBpbmRleCA2ODdiMmJlYTVjNDMuLmJjNzMzMjViMmZk
MSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbGliL3N0cmNtcC5TCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2xpYi9zdHJjbXAuUwo+ID4gQEAgLTEyMCwzICsxMjAsNCBAQCBzdHJjbXBfemJiOgo+
ID4gIC5vcHRpb24gcG9wCj4gPiAgI2VuZGlmCj4gPiAgU1lNX0ZVTkNfRU5EKHN0cmNtcCkKPiA+
ICtTWU1fRlVOQ19BTElBUyhfX3BpX3N0cmNtcCwgc3RyY21wKQo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbGliL3N0cm5jbXAuUyBiL2FyY2gvcmlzY3YvbGliL3N0cm5jbXAuUwo+ID4gaW5k
ZXggYWJhNWIzMTQ4NjIxLi5iMzYzMjVhNTdmNmEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2
L2xpYi9zdHJuY21wLlMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbGliL3N0cm5jbXAuUwo+ID4gQEAg
LTEzNiwzICsxMzYsNCBAQCBzdHJuY21wX3piYjoKPiA+ICAub3B0aW9uIHBvcAo+ID4gICNlbmRp
Zgo+ID4gIFNZTV9GVU5DX0VORChzdHJuY21wKQo+ID4gK1NZTV9GVU5DX0FMSUFTKF9fcGlfc3Ry
bmNtcCwgc3RybmNtcCkKPiA+IC0tCj4gPiAyLjQ1LjIKPiA+Cj4KPiBSZXZpZXdlZC1ieTogQ2hh
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPgoKWW91IGNhbiBhZGQ6CgpSZXZp
ZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtz
LAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
