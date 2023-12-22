Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F48CC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 17:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpFk7t7mQd04+14UTm9ULtrsnDw6v7PeMgkntLXjLa4=; b=0IWhrBLwtQ/AFG
	wWSc2S4sYrkDeO2btRz9YlczfaInHNtNg+y2kvcF5oal36nlOLM/+UYC7Es+Uxn3v4/ngJOyMa2JZ
	dKVQ2Favr3Z+Ds60J4+NEYHSbmpLlvt/zBXw6HQs66HH4BSuXfRnIsAF5phdFueoNZ6XBQf4vjdq9
	uvLa75mvYkFvI5LLzRtzmisQLIN793qyI8JoP4U8xcky99ilvtPJ7pl1ljIlje1g6l2ihfJAmRv91
	e1yfyN98f9WG4bGonpuYL1OyyQbvJ7iQf+bjTbjuL/jmHbXjILMghPofz9be2jSzA3xLhZW3pmxPr
	V6MAlArhTB86cr8PJYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGjnf-006bqt-2y;
	Fri, 22 Dec 2023 17:59:07 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGjnd-006bqV-2E
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 17:59:06 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dbd4a10735eso2025589276.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 09:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703267943; x=1703872743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXO5LLAj4QYxQv9ZV22GFZ8aR0i5IaDWjNJqzoS+Cu0=;
        b=UX09IB1YJl3q+naSs3fWRGImKaFoOMWr5Z5nBcQAnP9wsteUxowQSx2nk4qu1l024H
         vy0+tNVcuZBWQ1XRhCV47xf2iUO659sXB647vRnYgP0dJE1e1Qm+qFOA5cAbHYRzS49W
         Pn48I3XcFLqST9ti89XaqwLn7ox/ROhlMp9yM2ChdDlK/UXQZUOnqonb9ykYW9TkvzSg
         TQfmMdIxGWr76uZQSkwUlhzswiShM62kUGy0+9OPBGZQX35T1WPEdhN51yP1y8Gu2p07
         M1ya3N85PZdMlA9zb/shWLi8m3MtN5rnsJfUn7mD8sn/5JQb0PQop8dhRqKoEwaEdrDi
         mxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703267943; x=1703872743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXO5LLAj4QYxQv9ZV22GFZ8aR0i5IaDWjNJqzoS+Cu0=;
        b=KFyze8XE2/B8fYE1BZzT72oIXSCw+njQEtFkoJuCUKs/N7vIk3lLZFV8iz0w27xj8X
         lwQ0wLIFX9mrS5WR7Lzqy6b5lttj3nYaxkuHwgFJaTs17js9zLbf9Mh1PCVwBPSGmCAr
         jsibJEkbJgJLO0nq0jr28BIuwLZ8g/DcG9Odegd7kmzYIsgGws6w6V2dQ12qguR1Q/qk
         hMexel79FvEHaIwJJsuXiS5n7CCUUCsau/2l45WmSDqdpXw9/Of8dKEzKRPdGCH75+kT
         5VJI9i3+34eaharm9THKprT87Rvaqbu/W8t+m7/fjdfZs8vF6JV/OZIMBoas/7BYWNhH
         J0hA==
X-Gm-Message-State: AOJu0YxAOeUi5BRqV05HXvc8Ath70WFuczHIkcnkI+azNDkox1JX5l/z
	7/NjKr0KnDarIqNBCwSKgcvIF46yCaGTg9HepS8A9OVCnUxTAKGLH6qi6Q2/
X-Google-Smtp-Source: AGHT+IFFvH5JIWmYxJbv9X2zBhzWMzPFLRuyOvj2wSlxJlPI+Sw5EQ6vaJ8v7l8wEiYlQw5zy6yOt1W4FquIjX/y+EY=
X-Received: by 2002:a25:d606:0:b0:dbd:d3a8:74c with SMTP id
 n6-20020a25d606000000b00dbdd3a8074cmr1266996ybg.48.1703267943739; Fri, 22 Dec
 2023 09:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20231221083622.3445726-1-yuklin.soo@starfivetech.com>
In-Reply-To: <20231221083622.3445726-1-yuklin.soo@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Dec 2023 18:58:53 +0100
Message-ID: <CACRpkdZEu5AcdPtaH7MQSC88+CT-PhgegEVcWk6KAzAipzasPw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Add Pinctrl driver for Starfive JH8100 SoC
To: Alex Soo <yuklin.soo@starfivetech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Hal Feng <hal.feng@starfivetech.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_095905_738549_13943C23 
X-CRM114-Status: GOOD (  10.77  )
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

SGkgQWxleCwKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFRodSwgRGVjIDIxLCAyMDIzIGF0
IDk6MzbigK9BTSBBbGV4IFNvbyA8eXVrbGluLnNvb0BzdGFyZml2ZXRlY2guY29tPiB3cm90ZToK
Cj4gICBwaW5jdHJsOiBzdGFyZml2ZTogamg4MTAwOiBhZGQgcGluY3RybCBkcml2ZXIgZm9yIHN5
c19lYXN0IGRvbWFpbgo+ICAgcGluY3RybDogc3RhcmZpdmU6IGpoODEwMDogYWRkIHBpbmN0cmwg
ZHJpdmVyIGZvciBzeXNfd2VzdCBkb21haW4KPiAgIHBpbmN0cmw6IHN0YXJmaXZlOiBqaDgxMDA6
IGFkZCBwaW5jdHJsIGRyaXZlciBmb3Igc3lzX2dtYWMgZG9tYWluCj4gICBwaW5jdHJsOiBzdGFy
Zml2ZTogamg4MTAwOiBhZGQgcGluY3RybCBkcml2ZXIgZm9yIEFPTiBkb21haW4KClRvIG15IGV5
ZSBpdCBsb29rcyBsaWtlIGEgbG90IG9mIGNvZGUgaXMgZHVwbGljYXRlZCBiZXR3ZWVuIHRoZSBm
b3VyIHN1YmRyaXZlcnMuCgpUaGUgcGF0dGVybiBmcm9tIG90aGVyIHBpbiBjb250cm9sbGVycyBp
cyB0byBjcmVhdGUgYSBmaWxlIHdpdGggYWxsIHRoZSBjb21tb24KY29kZSBhbmQgdGhlbiBzdWJk
cml2ZXJzIGZvciBlYWNoIHN1Yi1waW5jb250cm9sbGVyIHRoYXQgaGF2ZSB0aGVpciBvd24KcHJv
YmUgYnV0IGNhbGxzIGludG8gdGhlIGxpYnJhcnkuCgpDLmYuCmRyaXZlcnMvcGluY3RybC9xY29t
L3BpbmN0cmwtYXBxODA2NC5jOgoKc3RhdGljIGludCBhcHE4MDY0X3BpbmN0cmxfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKewogICAgICAgIHJldHVybiBtc21fcGluY3RybF9w
cm9iZShwZGV2LCAmYXBxODA2NF9waW5jdHJsKTsKfQoKQW5kIHRoYXQgZnVuY3Rpb24gaXMgaW4g
ZHJpdmVycy9waW5jdHJsL3Fjb20vcGluY3RybC1tc20uYwphbmQgeW91IGZpbmQgZ3JlYXQgaW5z
cGlyYXRpb24gaW4gdGhlIHFjb20gS2NvbmZpZyBhbmQgTWFrZWZpbGUKYW5kIGRyaXZlcnMvcGlu
Y3RybC9xY29tL3BpbmN0cmwtbXNtLmgKdGhhdCB5b3UgY2FuIGNvcHlwYXN0ZSB0byBwdWxsIHRo
aXMgb2ZmLgoKTWF5YmUgeW91IHNob3VsZCBzdGFydCB3aXRoIGEgcGF0Y2ggdGhhdCBleHRyYWN0
IHRoZSBjb21tb24gc3R1ZmYKZnJvbSB0aGUgZXhpc3Rpbmcgamg3MTAwL2poNzExMCBkcml2ZXJz
IGFuZCB0aGVuIHJldXNlIHRoYXQgZm9yCmpoODEwMD8KCllvdXJzLApMaW51cyBXYWxsZWlqCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
