Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A364CC3DA42
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jul 2024 07:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6pfyy6yNIBb3UzZb9P9I2Ij9c/C0qlfsumnlP8hWt8=; b=mr6sn1ur1iezYA
	DgYHOrjPc1KTNldTwItESu7uiUO3U3KXk/EhzBmx8Z752+pr/SRng4ZlyZv+S2M+tbjkSxJzkS52j
	so1NExrmUwT2L/SK7sT0IQjVkTJ45QO+fOR2BCf+wLMjtkMzdjKWwrHXs0GQpjhOTYHue/pCJA0Yq
	/iLZuNk1V3kpktlXPcsNRKtRclI8KZ1gNQuE9uAnqQ2/Dw7sEPxtA94e0eMWsOoTqs74gXeqC2ojt
	edktEj8a/AzUIcS+X3SMLmFEQCJ/hQXjQu1rSF7sX2MVMCNCxC8qs+DlbaOK2yvPHaeUqWLfuvHII
	wgRCcuAE5wU4hIfFVcug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sStP5-00000003vGQ-3rT1;
	Sun, 14 Jul 2024 07:12:15 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sStP2-00000003vFv-2ECc
	for linux-riscv@lists.infradead.org;
	Sun, 14 Jul 2024 07:12:14 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52ea33671ffso3332741e87.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jul 2024 00:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720941130; x=1721545930; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFSie2i7sjpFsA5Rr/G39xQcQML22E6TVNyJ7SgAY1c=;
        b=TaMV2hd07aI7rtNa69EKXzK8SNdL/OxH0jPS/DKKqId/530NVLsV+cxBZz13y0xEdD
         qFXqYVFeVK519jLqG8D9a356DrW9UbMxh1VYYwrv3fGl4nNHZpo6T8FyzuMFvdtbGyCz
         yQMRPVzqNG6DMrNF76BZrCP4qeUm0lEyvetaRV4WjDu6Qou0RXbdLi+nIS9A3xSukcrK
         8PO5L1xyCogzrtafzjtp/VhwQw8dh8ojzO3lt7aVOjS3KUED9Kpm33OqB5CzpddemvmY
         aSGdgWfXSMM2jeldRXVVvVQ14xETk8Zii7+abV5MLO0HI6xDtyw/r0AzlEk1/evKljYb
         upvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720941130; x=1721545930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFSie2i7sjpFsA5Rr/G39xQcQML22E6TVNyJ7SgAY1c=;
        b=wYW/Bq4USuACTYvUIn9ifw9G0ud/XOP0476EQwUcNbFclCqCbdD3ANqkPpr8rCZg0n
         e7lN3hBrkbjnvSKZJKqc9ngH7TOskBZzV0irfC2fpIsOBfu7A2kQ/gJv518geeyWUUKc
         twOY/6fR8ao7wmGEvbNUZCHcqJ2TfbSKxuvueOQBc3b9f9I7Bu0uKnRS28mT3wBq0M1W
         N/ZYJ23y9ySLQNJGj8xcuQaluBaS04fauMU+DqAqhMEVVi0ToEP2IzPGGr5DJAv0TISL
         B7usHP9frMtCnbej3TyR1Vjzb+JsVzIH+PskOfamemI0tiW7Ne+S/qn9a/lCJAYr40GI
         5bug==
X-Forwarded-Encrypted: i=1; AJvYcCUfVROrTIXuXY7sR52oOZ1XwxOywJGaDxADwRxG5MBarEWagQtayb8Efks2i8lEgx9qQq9nr31p2UGFkkIFvjGXMx3Omb9zPeI47qRIwzms
X-Gm-Message-State: AOJu0Yybi/aYMOV9CWk72mVzhQOcPfvUTTAD7Xp1L+zFK80VfW9U60d/
	PTlogjIxPMwW88vgtMFFF4QWSmq8YSJ20uPEmqtZ3tLFbMlSt/LEqI4cCA2JHRPAUbXGZazV2wX
	QxQScmvvtBs/e98nxg5nAg6IIfLs=
X-Google-Smtp-Source: AGHT+IFEo559tIWaynh0P0z994mlLiLsIV3oCE1GH/oEj3En9LzmZCbT5rpgbnSo2wWU2k37H9y+uG/VWcq2H7QCT8g=
X-Received: by 2002:a05:6512:3985:b0:52c:cc46:d59 with SMTP id
 2adb3069b0e04-52eb9999d90mr12150508e87.18.1720941129573; Sun, 14 Jul 2024
 00:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240705093503.215787-1-kanakshilledar@gmail.com>
 <20240705093503.215787-2-kanakshilledar@gmail.com> <CAGLn_=tT08KUX0J+WURq=EXKDPj=--Wg3qmCjnzGxNeMcz3NOg@mail.gmail.com>
 <20240712-denote-disprove-ce271b70c78c@spud> <ZpFUWJ9ujDyeGORh@x1>
In-Reply-To: <ZpFUWJ9ujDyeGORh@x1>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Sun, 14 Jul 2024 12:41:58 +0530
Message-ID: <CAGLn_=tg_V+ZL2NM9i0MjxG+qAdQeJVhvChFL44Nm3pLRV9hCQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] riscv: dts: thead: add basic spi node
To: Drew Fustini <drew@pdp7.com>
Cc: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_001212_610119_5DBA39C8 
X-CRM114-Status: GOOD (  14.36  )
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

SGksClRoYW5rcyBmb3IgdGhlIHVwZGF0ZXMgb24gdGhpcyBwYXRjaC4KCkNoZWVycywKS2FuYWsg
U2hpbGxlZGFyCgpPbiBGcmksIEp1bCAxMiwgMjAyNCBhdCA5OjM14oCvUE0gRHJldyBGdXN0aW5p
IDxkcmV3QHBkcDcuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVsIDEyLCAyMDI0IGF0IDAyOjQ4
OjQ2UE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+IE9uIEZyaSwgSnVsIDEyLCAyMDI0
IGF0IDAyOjExOjE4UE0gKzA1MzAsIEthbmFrIFNoaWxsZWRhciB3cm90ZToKPiA+ID4gSGksCj4g
PiA+IEFueSB1cGRhdGVzIG9uIHRoaXMgcGF0Y2g/Cj4gPgo+ID4gSXQncyB0b28gbGF0ZSBmb3Ig
Ni4xMSwgaXQnbGwgaGF2ZSB0byB3YWl0IHVudGlsIDYuMTIuIElmIERyZXcgaGFzIGhpcwo+ID4g
dHJlZSBzZXQgdXAgYWxyZWFkeSwgaGUgY2FuIGF0IGxlYXN0IHF1ZXVlIGl0Lgo+ID4KPiA+IENo
ZWVycywKPiA+IENvbm9yLgo+Cj4gWWVzLCBJJ20gaW4gdGhlIHByb2Nlc3Mgb2Ygc2V0dGluZyB1
cCB0aGUgYXBwcm9wcmlhdGUgYnJhbmNoZXMgaW4gbXkKPiB0cmVlIFsxXSBhbmQgdGhlbiBJIGNh
biBzZW5kIGFuIGFwcGxpZWQgdG8gZm9yLW5leHQgZW1haWwuIFRoZSBwbGFuIGlzCj4gdGhhdCBJ
IHdpbGwgc2VuZCBQUiB0byBBcm5kIHN0YXJ0aW5nIHdpdGggdGhlIDYuMTIgbWVyZ2Ugd2luZG93
Lgo+Cj4gVGhhbmtzLAo+IERyZXcKPgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcGRwNy9saW51
eAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
