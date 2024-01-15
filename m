Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B9FC3DA79
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAD0mvpkJWjW0IbOSe/21ocOuI62hipoEBJwXc92qY0=; b=Rt06xRksfiJxNT
	Td791JUgoRN6PExotLFHw+wMCsBvNf1QhYqjWbVp+IvAQmrIORyuTMm/4bkqcft76Oq3U/BIqZHuT
	0Qrr/UJfbH9m6sTOLQ/wB2He6nw7oEDqXIrxMudHbJtXzOKhBNAp6xEG8ZkRBAbk/vPVrxIjsWcvf
	K0cf5ubyNx7nXv4VT0iV8p4Sh7ScgDOSuDQS7pnRTti0vC4AxBapXDXUgPUVxbvIDZTEJPXyQnzBO
	DNJ20aIpUeM0x3Hv1tnN/26B9SxrFzq534mfTfY5nwzlO7auwn/UzM1xsii93/Mk3Lul8D0ilH1bG
	cFsA4jzlty3pf5AunZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPNcf-009AUI-0q;
	Mon, 15 Jan 2024 14:07:29 +0000
Received: from mail-yb1-f174.google.com ([209.85.219.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPNcc-009AT5-0v
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 14:07:27 +0000
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dbd721384c0so6884675276.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 06:07:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705327643; x=1705932443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOou55N2EN6e58V59PT+366RWYrogOI3loiDbYwDF18=;
        b=QG5RsGkExZiC/w9nG45pBaHA/8rQdf8y0r4Wng6c7ovBOcmp/FYEquKuTS6hO/1XvO
         +5LXWJat9LqXq3tqyTNPlgzjR+U+/KdJw/DmwQDDbT+K8G1MfOKgG59kJgoBDghhmnkP
         /e+SgUTzkFoLrajFAzbW9hwCJtkdiNAcyB4od64K9iRzEoJtJ12hIr4iZwxpYQELyUBG
         TJBwfimU3TXGCfrm7Hw9NtD7bsWTHqthf76ae6W1vHqC2JdtrlNZ/vLGYWpflCTSm8NH
         ixeEiBzYvhS8aF+yf57UT/Bawkx6NoH/+3UmK9t2JTzG0o1bfdPuBrj218qoVnjL+3TH
         6L3A==
X-Gm-Message-State: AOJu0Yzvwsd094XyidsTJD5ffvKalzqS45ubOV7mZ7LXirCaTfQYWQIk
	Sj2+Yze4KD2erkCyKRkOXyIFqyfeJhZkYQ==
X-Google-Smtp-Source: AGHT+IEZ5rdgOG3DWvZGqmEN0ddbfI1wWTszjlyHjo4mgs7Rk27qInMKOmlhwlcR0Ynq9Ks7gV2/Zw==
X-Received: by 2002:a25:660e:0:b0:dbd:47a6:d558 with SMTP id a14-20020a25660e000000b00dbd47a6d558mr2591909ybc.44.1705327642165;
        Mon, 15 Jan 2024 06:07:22 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id v35-20020a25aba6000000b00dc21c76e351sm47444ybi.34.2024.01.15.06.07.21
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 06:07:21 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc21d926b9aso30554276.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 06:07:21 -0800 (PST)
X-Received: by 2002:a25:268b:0:b0:dbf:11e:d0a5 with SMTP id
 m133-20020a25268b000000b00dbf011ed0a5mr2764196ybm.123.1705327641690; Mon, 15
 Jan 2024 06:07:21 -0800 (PST)
MIME-Version: 1.0
References: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240115130817.88456-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240115130817.88456-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jan 2024 15:07:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXGBxFbjy+WZYzCq3ARB7HrKUAQpYmKea1bDmvny3myag@mail.gmail.com>
Message-ID: <CAMuHMdXGBxFbjy+WZYzCq3ARB7HrKUAQpYmKea1bDmvny3myag@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] riscv: dts: renesas: r9a07g043f: Update
 gpio-ranges property
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_060726_322280_2423E66C 
X-CRM114-Status: GOOD (  18.11  )
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

T24gTW9uLCBKYW4gMTUsIDIwMjQgYXQgMjowOOKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IE9uIFJaL0ZpdmUgd2UgaGF2ZSBhZGRp
dGlvbmFsIHBpbnMgY29tcGFyZWQgdG8gdGhlIFJaL0cyVUwgU29DIHNvIHVwZGF0ZQo+IHRoZSBn
cGlvLXJhbmdlcyBwcm9wZXJ0eSBpbiBSWi9GaXZlIFNvQyBEVFNJLgo+Cj4gU2lnbmVkLW9mZi1i
eTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29t
PgoKTXkKUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlk
ZXIuYmU+Cm9uIHYzIGlzIHN0aWxsIHZhbGlkLgoKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9yZW5l
c2FzL3I5YTA3ZzA0M2YuZHRzaQo+IEBAIC00Niw2ICs0NiwxMCBAQCBjcHUwX2ludGM6IGludGVy
cnVwdC1jb250cm9sbGVyIHsKPiAgICAgICAgIH07Cj4gIH07Cj4KPiArJnBpbmN0cmwgewo+ICsg
ICAgICAgZ3Bpby1yYW5nZXMgPSA8JnBpbmN0cmwgMCAwIDIzMj47Cj4gK307Cj4gKwo+ICAmc29j
IHsKPiAgICAgICAgIGRtYS1ub25jb2hlcmVudDsKPiAgICAgICAgIGludGVycnVwdC1wYXJlbnQg
PSA8JnBsaWM+OwoKSSBiZWxpZXZlIHRoaXMgaGFzIGEgaGFyZCBkZXBlbmRlbmN5IG9uIHRoZSBw
aW5jdHJsIGRyaXZlciBjaGFuZ2VzLCBkdWUgdG8KdGhlIGZvbGxvd2luZyBjaGVjayBpbiBpbiBy
emcybF9ncGlvX3JlZ2lzdGVyKCk6CgogICAgaWYgKG9mX2FyZ3MuYXJnc1swXSAhPSAwIHx8IG9m
X2FyZ3MuYXJnc1sxXSAhPSAwIHx8CiAgICAgICAgb2ZfYXJncy5hcmdzWzJdICE9IHBjdHJsLT5k
YXRhLT5uX3BvcnRfcGlucykgewogICAgICAgICAgICBkZXZfZXJyKHBjdHJsLT5kZXYsICJncGlv
LXJhbmdlcyBkb2VzIG5vdCBtYXRjaCBzZWxlY3RlZCBTT0NcbiIpOwogICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKICAgIH0KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGlu
dXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVy
IiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
