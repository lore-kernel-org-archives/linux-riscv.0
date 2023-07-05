Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6DDC001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 03:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srz63OYVBnhnVxJ3NoeFwIHChOuFSRgNKGNTFqd/pW4=; b=mOEomUg8A1ynbD
	0pyDCI1m6Ey/EH6Fd7tcpbRBYsxHnXsqPuoA8hSEfLASk8+kvUkaYLG8JBrFcfle0NkiZQjDeVFYQ
	lREWNtaCf4A3a5M6pI7xrZk/UXfzioKndRW7JbUtpBkSoauH1vV/vrLpgUl6o8Td4Wn+L571tJPHt
	gWQvhgEriwmhfyC2rUoBj6ijX4zCm6bIalvuiMO9yop7xo4h6aKFqpEtPaA6IokRbp6ixFN94HGXn
	MQhF53avD6XY5XqiAJwsZnsbWKt3b/Bk0QxHJ85/OYo8X3mC/VhS/eYPgoYSFi13FHnIZ9wO3pZF+
	ppbnKueNWeWcTfnV9UxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGtXq-00EiHk-1O;
	Wed, 05 Jul 2023 03:51:10 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGtXm-00EiH6-24
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 03:51:08 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb9fd28025so8796122e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 20:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1688529061; x=1691121061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7koUXTGnXZ2BN6z2esFRUBwMxdqNEeh2TLixxqJrG4=;
        b=OSqKEasXz+D9ihlXJxO0mUy6ubDPxeEKZuYFwWcv1krSfchWaAhS7DeDkLUx0QA1Nf
         Wcu+k24HmcXRRG4dk9tQLpIwPIu3uEjdR4nJ2/Bj76VhFoiO915GQtOijA6CpWMCQua2
         MGgf0fW4Y4QtDrv5sGIQnQBhQOaU8yWqO6kaG6X45nVOR753xmJYRC+Dkn0FO76gECQs
         qPFITbMHuDEsdbTfMcFUcHa2dRKWgfCIVllgI+0TGN7lZDNHOQVyYsH4+/5XqyeDBimG
         SUj6MOo6AiAD/D0foDLc5eKOc66iLEEIWux9Jcs5ACm39DbQ1IYsvBpH4CjGGGzcDBOY
         S0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688529061; x=1691121061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7koUXTGnXZ2BN6z2esFRUBwMxdqNEeh2TLixxqJrG4=;
        b=V59TchX2QxfB0bchhuUZLOIKvmaoF+DVRMqP+wC/rkRTuFIhyUE2GVwgMZmIJWYQ4c
         lm2uMbebHM/qx2MVo1zA/LTR4Ng23imaLqrH/m12FNuz3tbCzCsBQG2zdws5Sq0eXJ6h
         AuBr+GCjGTKb+vzoFs+aEtAYBQ0FGV+J3mziu7pXjf6EjoeXyj+5Fd+QfjYsegxsoZmq
         buOLoFcEbN/b2nOq42MZ3XSbtCoFXE/Um6Z43ilLPpSICSPL3l6e8bFAA/6uiTm5zPw7
         Z0bmysr2lqe/xfRfaWbeooZMFlS8InQEifwdVxptZbVejp4/8AU0MEyFyZhLiwnBjsjy
         TSow==
X-Gm-Message-State: ABy/qLa05a/fOMXIxEjG5dO1Y25mfVtwoSPbqiTlU4uWFxgGec7589S+
	UvSbKrg3EQcUhxWEV2D/POL7+UGIreDFqmfMN7/FtML0dRl5SO+fer8=
X-Google-Smtp-Source: APBJJlHOM2IZLucodj6HWgJHAsB+Q18K78EMjq0nn1drMe8tDHTaxF7UR7y9aWMrYrf3Z94KyBGdBYidCGb6JPA1epY=
X-Received: by 2002:a05:6512:3e10:b0:4fb:7bbf:daae with SMTP id
 i16-20020a0565123e1000b004fb7bbfdaaemr12214586lfv.64.1688529061686; Tue, 04
 Jul 2023 20:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230629142228.1125715-1-bjorn@kernel.org>
In-Reply-To: <20230629142228.1125715-1-bjorn@kernel.org>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 5 Jul 2023 11:50:50 +0800
Message-ID: <CABgGipVO35+CZUioxn2jFD8mFjVup84GRJXGQQ8wx4urjc0Y+Q@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: Discard vector state on syscalls
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux@rivosinc.com, 
	Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>, 
	Darius Rad <darius@bluespec.com>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_205106_723936_525AA2D8 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBKdW4gMjksIDIwMjMgYXQgMTA6MjLigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5j
LmNvbT4KPgo+IFRoZSBSSVNDLVYgdmVjdG9yIHNwZWNpZmljYXRpb24gc3RhdGVzOgo+ICAgRXhl
Y3V0aW5nIGEgc3lzdGVtIGNhbGwgY2F1c2VzIGFsbCBjYWxsZXItc2F2ZWQgdmVjdG9yIHJlZ2lz
dGVycwo+ICAgKHYwLXYzMSwgdmwsIHZ0eXBlKSBhbmQgdnN0YXJ0IHRvIGJlY29tZSB1bnNwZWNp
ZmllZC4KPgo+IFRoZSB2ZWN0b3IgcmVnaXN0ZXJzIGFyZSBzZXQgdG8gYWxsIDFzLCB2aWxsIGlz
IHNldCAoaW52YWxpZCksIGFuZCB0aGUKPiB2ZWN0b3Igc3RhdHVzIGlzIHNldCB0byBEaXJ0eS4K
Pgo+IFRoYXQgd2F5IHdlIGNhbiBwcmV2ZW50IHVzZXJzcGFjZSBmcm9tIGFjY2lkZW50YWxseSBy
ZWx5aW5nIG9uIHRoZQo+IHN0YXRlZCBzYXZlLgo+Cj4gUsOpbWkgcG9pbnRlZCBvdXQgWzFdIHRo
YXQgd3JpdGluZyB0byB0aGUgcmVnaXN0ZXJzIG1pZ2h0IGJlCj4gc3VwZXJmbHVvdXMsIGFuZCBz
ZXR0aW5nIHZpbGwgaXMgc3VmZmljaWVudC4KPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzEyNzg0MzI2LjlVUFBLM01BZUJAYmFzaWxlLnJlbWxhYi5uZXQvICMg
WzFdCj4gU3VnZ2VzdGVkLWJ5OiBEYXJpdXMgUmFkIDxkYXJpdXNAYmx1ZXNwZWMuY29tPgo+IFN1
Z2dlc3RlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gU3VnZ2Vz
dGVkLWJ5OiBSw6ltaSBEZW5pcy1Db3VybW9udCA8cmVtaUByZW1sYWIubmV0Pgo+IFNpZ25lZC1v
ZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKUmV2aWV3
ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
