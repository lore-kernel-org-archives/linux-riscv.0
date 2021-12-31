Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF63C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Dec 2021 06:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=luh9EXp6dG5IgxG2fCDfbbMxTVkUHcxz1UU0PBVFvYM=; b=djgrZ1GiuQDtfs
	j+ljbMXwiUAFCt5VO3u+BGFS6YD1l99nVVdhStXl9P11vNdHHL3MHnI2A3kwnilgrrdcg8ajQYs/x
	+m9F23BwudOY517YJK68OizqeoDpWWVg+rcAzJSEET8CFeCobVQJnbX8Rm4XTYBbDTuOjVrtw9dQP
	z2rU2wOib4Qk3YI64MCMPhAa8264xtp/kxB8AhPuqcLPOutfIwpYQK8RGjpZ7Dcjiu0ypocnWY6aZ
	9e+fntisZ5mlPh4PIGoe8cDlS8X+Etgiwhg2UxI4iht51D50/2AfqpeaWoEoeSHxnGtmCmyXA3c98
	FMEhyFbNHdMH0GITpR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3Bs3-005lIE-NV; Fri, 31 Dec 2021 06:58:35 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Bs0-005lHR-MA
 for linux-riscv@lists.infradead.org; Fri, 31 Dec 2021 06:58:34 +0000
Received: by mail-wr1-x435.google.com with SMTP id s1so54539332wra.6
 for <linux-riscv@lists.infradead.org>; Thu, 30 Dec 2021 22:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IPvWCWArFmIoJo6e3SOp/K7+W774iGoTLAEhKjFbcaM=;
 b=dSM1+9ApbR+hVWEQTXuqFoWRuF2F4OskLpLWSebcI5qH7YaRhtzyDrQ6O8S//o+Sed
 TVpKnAyqwT4pl06ZBCvkuNgkuEtp380NBzsCXOyu5x7A134l1RQBDM1zkDYDBhqsaN0B
 itO5qp62T5nZR+b3iNfVFZ6VZS5scV1Q3w05MkWo2UGSzx0P8vqMGGYRfA28RtrMwFu6
 1V+49vpa8EBXHvFnlPaSI+6sQAD/PoVKtd6FaUFYS5l9sI2LMFbwY+eM3zc9a+gp6V/n
 mflPV/80xEyUceQxQWFVDzLzaMLpFvXkbjEHkMzd+w8jgM/2QUlrMqCHVC7ssriChgDn
 wDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=IPvWCWArFmIoJo6e3SOp/K7+W774iGoTLAEhKjFbcaM=;
 b=SYe3Yx2nEQASWSoNoRTeWK9q/rIRphNekf2Ju9Pc9EkwEKha9Ou9MXOx77MEcC3gjC
 WVZQrlrBTXyCjXFDVztv8aDQaL5M3T0m5XtQ2nBcR/8N6i1lPnhRtIvDlcZxwGiHt8e4
 Xwc0c/UxvYp4S1Zjp0McX/FtpwI3mRdvn/Wx28SIoBmxZUKXX8OkCP1uHJAxH6VFpfID
 Jm+QfDbkGfLQj8jELONSFoUlkoreDWfoh7yRMAyd/mtbH6VxPJj5DRBZ6QcUkTOElGG3
 LYFZlGcvcv+AstLOyCX6timQPNToBY1DWqdCLJ0hDEYcCiCH2yMPIFtdOaX/bO+WbIZ5
 b0uQ==
X-Gm-Message-State: AOAM530grAAlX4NhCwDAsjW3eD3HUDfKK/4dYTCuKrTqjCVmP6RKlXfM
 7S/nRj/scK9ZuvXymudIeQUzvF4EVvykoa7W
X-Google-Smtp-Source: ABdhPJygojzvVzB67tBssVheNi//lj4PKhm+W1eQ9WhHYt1kuWqGvmaINV7eorhNEFDhpHAQ8BhDag==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr28425146wrs.527.1640933909153; 
 Thu, 30 Dec 2021 22:58:29 -0800 (PST)
Received: from [10.248.123.188] (global-5-144.nat-2.net.cam.ac.uk.
 [131.111.5.144])
 by smtp.gmail.com with ESMTPSA id j39sm23680532wms.0.2021.12.30.22.58.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Dec 2021 22:58:28 -0800 (PST)
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] riscv: dts: sifive unmatched: Add gpio poweroff
From: James Clarke <jrtc27@jrtc27.com>
X-Mailer: iPhone Mail (16H62)
In-Reply-To: <20211231061110.89403-1-w6rz@comcast.net>
Date: Fri, 31 Dec 2021 06:58:22 +0000
Cc: Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vincent Pelletier <plr.vincent@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <73F7FAE3-5113-48DD-B0F5-0EEAA0A8B0C1@jrtc27.com>
References: <20211231061110.89403-1-w6rz@comcast.net>
To: Ron Economos <w6rz@comcast.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_225832_755806_00AF454C 
X-CRM114-Status: GOOD (  11.44  )
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

T24gMzEgRGVjIDIwMjEsIGF0IDA2OjExLCBSb24gRWNvbm9tb3MgPHc2cnpAY29tY2FzdC5uZXQ+
IHdyb3RlOgo+IAo+IFRoaXMgcGF0Y2ggaXMgcmVxdWlyZWQgZm9yIHRoZSBmb2xsb3dpbmcgY29t
bWl0IHRvIHdvcmsuCj4gCj4gY29tbWl0IGYyOTI4ZTIyNGQ4NSAoInJpc2N2OiBzZXQgZGVmYXVs
dCBwbV9wb3dlcl9vZmYgdG8gTlVMTCIpCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9uIEVjb25vbW9z
IDx3NnJ6QGNvbWNhc3QubmV0Pgo+IC0tLQo+IGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hp
Zml2ZS11bm1hdGNoZWQtYTAwLmR0cyB8IDUgKysrKysKPiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hp
Zml2ZS11bm1hdGNoZWQtYTAwLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2
ZS11bm1hdGNoZWQtYTAwLmR0cwo+IGluZGV4IDZiZmExZjI0ZDNkZS4uYzRlZDllZmRmZjAzIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQt
YTAwLmR0cwo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNo
ZWQtYTAwLmR0cwo+IEBAIC0zOSw2ICszOSwxMSBAQCBydGNjbGs6IHJ0Y2NsayB7Cj4gICAgICAg
IGNsb2NrLWZyZXF1ZW5jeSA9IDxSVENDTEtfRlJFUT47Cj4gICAgICAgIGNsb2NrLW91dHB1dC1u
YW1lcyA9ICJydGNjbGsiOwo+ICAgIH07Cj4gKwo+ICsgICAgZ3Bpby1wb3dlcm9mZiB7Cj4gKyAg
ICAgICAgY29tcGF0aWJsZSA9ICJncGlvLXBvd2Vyb2ZmIjsKPiArICAgICAgICBncGlvcyA9IDwm
Z3BpbyAyIEdQSU9fQUNUSVZFX0xPVz47Cj4gKyAgICB9OwoKV2h5PyBJdOKAmXMgYWJzdHJhY3Rl
ZCBieSBmaXJtd2FyZSwgd2hpY2ggd29ya3MuCgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
