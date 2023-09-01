Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87168CA0FE1
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 07:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k5qguvMthFfoHJXImV6aXnUAltxRmjYY9qZrp0p+M+k=; b=vkPvOefnEImIvA
	TeRXLmDLTNAxLjuCeuCMZ6BQNpXMPGxrMWroJ7YUYNMQIyLEd1xQ2cWvbdRhq7Xycaqi/DVYUcfgQ
	M0Yr+QIFZdTHy8yIRfBioEGQ2na0kSFjwWvOKQZwTkF6W+0BVljjmOFea388Lo8/sdzZXyMrUvPaR
	NL4oXCaokhLTphcmCDzkIQHziIMPhjvsCL/pm3lZXDTWClyDRVA2PIhqw5NF/6IKKTv++bhv3RT6N
	JmgH1Y3YmjtJEiHom2ze/VoRKBkij36Hz2rAsLLS9WuhEuDNNEPC5vd+Tx2s99W9gIrj90PolS3TB
	O2tRTa17sTxJKbh2D/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbyP2-00GauJ-2c;
	Fri, 01 Sep 2023 07:17:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbyOz-00Gatd-2Z
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 07:17:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31c63cd4ec2so1397861f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 00:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1693552622; x=1694157422; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwsUiHSBSvIQRknRmzUEvnXIncuNFizpbiIrIMgBrD4=;
        b=Z1yvXeYNBlTHGWPxexb/8lukkZGXz6q1K5bg3x7USG6fQ3DeYMQslcN0UdRJUjaCyG
         7BEQ8+PImBOMkF19/XG9LA/EBHUvp3gCeHoVhmPZ1kJcSttG4hSunGBeArM54FpGh99Q
         HZOmzTwEDk6HO2L7X9mlb690sGZkvE2Pm9IE8/SMARhDG8tUPU69hbnB/rKduLnKPY7g
         NJOphfSQDmG1/wlx1wgTFz9uWeqnAMzdlj3AflIFyGN0kTe7HEFsRWshCjGgwqJPkS9u
         jyFVmqO3Ze8ISkIOeY3FyfNFKhze8mK2vXCHw606Ff/Qh51cuci4bMwYgmZ5WA6ubBpI
         Kddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693552622; x=1694157422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwsUiHSBSvIQRknRmzUEvnXIncuNFizpbiIrIMgBrD4=;
        b=IXpnaHeeeDfH/X3/wZs7Mue3j2ygVW50mfgzAxPPClDCYmQJUwrYTdwSOp/JaYm0XV
         GI+3ZaFdD3nTvqsVxWYFTVb5yaJDdzOo9yhA31x+1EXB5XNorBI9icmacKe30RdBqk40
         KhMO5A07K02MBcR89TaUYR1O5npJaN5dItfx2XnaR627+j1z/2/n5KMKsTETpsXDTkNx
         buzSpUqgVu9NcDatrZLYVFZ7Y6QQY3letp5PgfSXwhpHeoO10qSuz2AOA5VzwYw6L7S3
         ksSESAl1K7KewqyU4DnJGHwxnfvz5UKuCg0FuRlLwykN09KWx7F0tCTEiZRjMYLTuUkZ
         bHZQ==
X-Gm-Message-State: AOJu0YxiSYdB71BQmB0Xqar/RSAdI5V+9/SymfqsSDxoXUqOEKcEQUdK
	l7iufsszHpGYoJQAX1SQen+31lAiBFfp9dnb4rXgXw==
X-Google-Smtp-Source: AGHT+IGsHp15JavXEMV06Q0MxKz6Y7Z/ayog654/+XZZ2uCOs9hkOmfmxXwHyeBsCkrvABzY1qEDtAKPsVIHYQLZFZs=
X-Received: by 2002:a5d:4089:0:b0:314:3bd7:6a0c with SMTP id
 o9-20020a5d4089000000b003143bd76a0cmr1263055wrp.33.1693552621943; Fri, 01 Sep
 2023 00:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230818121504.60492-1-cuiyunhui@bytedance.com> <878ra8o4qa.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <878ra8o4qa.fsf@all.your.base.are.belong.to.us>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 1 Sep 2023 15:16:50 +0800
Message-ID: <CAEEQ3wmL90oOZcmpv8G34u7kg44zGscpHJiiRHLi=_LAm=C1jg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4] riscv: add userland instruction dump to
 RISC-V splats
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	guoren@kernel.org, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	jszhang@kernel.org, andy.chiu@sifive.com, dave.hansen@linux.intel.com, 
	elver@google.com, glider@google.com, cyphar@cyphar.com, 
	kirill.shutemov@linux.intel.com, keescook@chromium.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_001709_836277_3EB74483 
X-CRM114-Status: GOOD (  10.00  )
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

SGkgQmrDtnJu77yMCgpPbiBGcmksIEF1ZyAxOCwgMjAyMyBhdCA5OjMz4oCvUE0gQmrDtnJuIFTD
tnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBZdW5odWkgQ3VpIDxjdWl5dW5odWlA
Ynl0ZWRhbmNlLmNvbT4gd3JpdGVzOgo+Cj4gPiBBZGQgdXNlcmxhbmQgaW5zdHJ1Y3Rpb24gZHVt
cCBhbmQgcmVuYW1lIGR1bXBfa2VybmVsX2luc3RyKCkKPiA+IHRvIGR1bXBfaW5zdHIoKS4KPiA+
Cj4gPiBBbiBleGFtcGxlOgo+ID4gWyAgICAwLjgyMjQzOV0gRnJlZWluZyB1bnVzZWQga2VybmVs
IGltYWdlIChpbml0bWVtKSBtZW1vcnk6IDY5MTZLCj4gPiBbICAgIDAuODIzODE3XSBSdW4gL2lu
aXQgYXMgaW5pdCBwcm9jZXNzCj4gPiBbICAgIDAuODM5NDExXSBpbml0WzFdOiB1bmhhbmRsZWQg
c2lnbmFsIDQgY29kZSAweDEgYXQgMHgwMDAwMDAwMDAwMDViZTE4IGluIGJiWzEwMDAwKzVmYjAw
MF0KPiA+IFsgICAgMC44NDA3NTFdIENQVTogMCBQSUQ6IDEgQ29tbTogaW5pdCBOb3QgdGFpbnRl
ZCA1LjE0LjAtcmM0LTAwMDQ5LWdiZDY0NDI5MGFhNzItZGlydHkgIzE4Nwo+ID4gWyAgICAwLjg0
MTM3M10gSGFyZHdhcmUgbmFtZTogICwgQklPUwo+ID4gWyAgICAwLjg0MTc0M10gZXBjIDogMDAw
MDAwMDAwMDA1YmUxOCByYSA6IDAwMDAwMDAwMDAwNzllNzQgc3AgOiAwMDAwMDAzZmZmY2FmZGEw
Cj4gPiBbICAgIDAuODQyMjcxXSAgZ3AgOiBmZmZmZmZmZjgxNmU5ZGM4IHRwIDogMDAwMDAwMDAw
MDAwMDAwMCB0MCA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgICAgMC44NDI5NDddICB0MSA6IDAw
MDAwMDNmZmZjOWZkZjAgdDIgOiAwMDAwMDAwMDAwMDAwMDAwIHMwIDogMDAwMDAwMDAwMDAwMDAw
MAo+ID4gWyAgICAwLjg0MzQzNF0gIHMxIDogMDAwMDAwMDAwMDAwMDAwMCBhMCA6IDAwMDAwMDNm
ZmZjYTAxOTAgYTEgOiAwMDAwMDAzZmZmY2FmZTE4Cj4gPiBbICAgIDAuODQzODkxXSAgYTIgOiAw
MDAwMDAwMDAwMDAwMDAwIGEzIDogMDAwMDAwMDAwMDAwMDAwMCBhNCA6IDAwMDAwMDAwMDAwMDAw
MDAKPiA+IFsgICAgMC44NDQzNTddICBhNSA6IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiAwMDAwMDAw
MDAwMDAwMDAwIGE3IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgICAwLjg0NDgwM10gIHMyIDog
MDAwMDAwMDAwMDAwMDAwMCBzMyA6IDAwMDAwMDAwMDAwMDAwMDAgczQgOiAwMDAwMDAwMDAwMDAw
MDAwCj4gPiBbICAgIDAuODQ1MjUzXSAgczUgOiAwMDAwMDAwMDAwMDAwMDAwIHM2IDogMDAwMDAw
MDAwMDAwMDAwMCBzNyA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgICAgMC44NDU3MjJdICBzOCA6
IDAwMDAwMDAwMDAwMDAwMDAgczkgOiAwMDAwMDAwMDAwMDAwMDAwIHMxMDogMDAwMDAwMDAwMDAw
MDAwMAo+ID4gWyAgICAwLjg0NjE4MF0gIHMxMTogMDAwMDAwMDAwMGQxNDRlMCB0MyA6IDAwMDAw
MDAwMDAwMDAwMDAgdDQgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbICAgIDAuODQ2NjE2XSAgdDUg
OiAwMDAwMDAwMDAwMDAwMDAwIHQ2IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgICAwLjg0NzIw
NF0gc3RhdHVzOiAwMDAwMDAwMjAwMDAwMDIwIGJhZGFkZHI6IDAwMDAwMDAwZjAwMjgwNTMgY2F1
c2U6IDAwMDAwMDAwMDAwMDAwMDIKPiA+IFsgICAgMC44NDgyMTldIENvZGU6IGYwNmYgZmY1ZiAz
ODIzIGZhMTEgMDExMyBmYjAxIDJlMjMgMDIwMSAwMjkzIDAwMDAgKDgwNTMpIGYwMDIKPiA+IFsg
ICAgMC44NTEwMTZdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBBdHRlbXB0ZWQgdG8ga2ls
bCBpbml0ISBleGl0Y29kZT0weDAwMDAwMDA0Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVp
IEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4KPiBOaWNlIQo+Cj4gUmV2aWV3ZWQtYnk6
IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCldoZW4gY2FuIHRoaXMgcGF0Y2gg
YmUgYXBwbGllZCB0byB0aGUgbGludXgtbmV4dCBicmFuY2g/CgpUaGFua3MsCll1bmh1aQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
