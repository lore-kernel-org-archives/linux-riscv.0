Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E246C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4ljgyc1X3LGc3Y21I1ct5geHMRDOjeMQIFvAbs7HCc=; b=oYFpJ5yHASlhZG
	vIxoqZwq3wJvwJ/On9KbLfTNqL7/0K117qhqc3C0/fuo1lY6JUfwvJd4+DV0/TsV0IP3OrWnk/7bZ
	wb2ftDKYDWLvXMcw0qatnD/4RnchA+jwjsUmQsKM3rV7rMYTAgk0kDIF//uncZrx2jJWj2MZlLJlA
	0U06Yjv0PF7zfDwqRyesvOiYtFDXdRTj/7vfW97ySyLriQLZ0MXof2CTbLAi5IzWjhAOKNFjqAg9n
	WiheAQUX9UAk6WzaChk+VeMsUx6VIdXhUDiVMxux7F7KzUpAzog4sGtP+HbhryGD+5ZBcW++F3FMW
	HnZ5B+VD28rgPgTkRrGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbjxP-00000005ks5-3PWQ;
	Wed, 07 Aug 2024 16:56:15 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbjxN-00000005krc-1Dm5
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 16:56:14 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-530e2548dfdso23385e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723049770; x=1723654570; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZymBs+eKZ3wGkqZLs62iD/WC+luTl2cLwV7VzziwP8=;
        b=SPcokv6G7cLMYUquQn9WqCSbmeJ6qJT6y63yD9OjzugcEY7AHU8cPHO7x1N5KTCF1r
         gq9chtlovQGjTFORTBTIfID1pWgVYjrN0mf4YtApSnxon3XJrxyq+7uynwSaVF/4q288
         DFxt216U4Cu0LLTY9Cr+NYv0kGIEYb65TH5h7j0Na0dwbGbUHPe2hwTazVLOofytRPxH
         Iuy2PBwqZ7BZpascWfSh1rm8az9esSSC8AfuN5RDnJEdqAUdLEwx2sgLGNHM36cmlsSD
         qabwQqsB76M9t4jyuTLMmeSeqe0p7J1FgqhXPioolSt+lDBYTyWXfw+z+YXkQL1rhPky
         BSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723049770; x=1723654570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZymBs+eKZ3wGkqZLs62iD/WC+luTl2cLwV7VzziwP8=;
        b=T9WiVivuRQAebVGtjJXKhDuLW1PfBiAno27MQd6xb0qGI2LDR4un5kMLAWGXJ/sgW7
         0nmoNC9XcTqcTAhPNUeV2XkCiR+TkKJPSzNp0UmIayB0ma4MwWCH2moa+JdD35p1c2G/
         suhTZt0xrZZWA/XXVZeiJZke4O441gBZzymaW5dYp+cY4Ktt+BYYcbGbchKlBzZfjPQj
         FWjuHKxEUKVQoL+sVeEEwR9K3LreMT/FrFRs91QdnkdmyRe+0SSDeTmDpPtHj5p09nDF
         UsmGtm7Iu64M0GpmMOitV/q06P4Ky/AQVGBO2niJmwmBnj+EXPurZOJveHjSAp8BpBmo
         ALiw==
X-Forwarded-Encrypted: i=1; AJvYcCVeD3TKSQ5xYzAQIlSoZTSesMJic91h538mLzEUr2U1aWNcdjysO1ro3AhlMAG7quwO7KRg033uEhY5DUen6eoyH7+UHkznV1r4vaC3WOe4
X-Gm-Message-State: AOJu0YyT6rVhQOpOpfbbtQZxM/rNAXK84mHqwpPJaBtVf+YF2l16FG5u
	oRV8v2jpUlKsvm9vECSIVBpEsKwKwfcfrrRPRUWMjjun+Mga+MOAtps7RMPtHbH0AbUEbxPOKWF
	j+Q3z4I1BMg4q+/UKsr+4SWyinEI6TH+LL0CySA==
X-Google-Smtp-Source: AGHT+IF9pFh79hDfWpFT5gb/WrtkGcdEBNFXxPxoVpwAm5XZb1BzyG10CU2vBHyWrPgMN/JUxH+J7VLto5fpWiF3CS4=
X-Received: by 2002:a05:6512:1045:b0:52f:cc06:c483 with SMTP id
 2adb3069b0e04-530bb396ca8mr13337439e87.24.1723049770240; Wed, 07 Aug 2024
 09:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-underage-wheat-7dd65c2158e7@wendy>
 <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com> <20240806-breeze-crazily-84d4e4af8f4e@spud>
In-Reply-To: <20240806-breeze-crazily-84d4e4af8f4e@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Aug 2024 18:55:58 +0200
Message-ID: <CACRpkdbMxuhe2HQZ-Av1R7JW94rS0FosPO-utYNsFO8avR3TbQ@mail.gmail.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_095613_359505_4B00C58B 
X-CRM114-Status: GOOD (  13.31  )
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

T24gVHVlLCBBdWcgNiwgMjAyNCBhdCA3OjE44oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPiBPbiBNb24sIEF1ZyAwNSwgMjAyNCBhdCAxMDowNDo1M0FNICswMjAw
LCBMaW51cyBXYWxsZWlqIHdyb3RlOgoKPiA+IElzIGl0IHBvc3NpYmxlIHRvIHVzZSBhdWdtZW50
ZWQgZ2VuZXJpYyBNTUlPLCBpLmUganVzdCBvdmVycmlkZSB0aGVzZQo+ID4gdHdvIGZ1bmN0aW9u
cyB0aGF0Cj4gPiBuZWVkIHNwZWNpYWwgaGFuZGxpbmc/Cj4KPiBJJ2xsIGxvb2sgaW50byBpdCAt
IGFzIEkgbWVudGlvbmVkIHVuZGVyIHRoZSAtLS0gbGluZSwgSSByZWFsbHkgZGlkbid0Cj4gdG91
Y2ggbW9zdCBvZiB0aGUgZHJpdmVyIGFuZCB0aGVyZSdzIGNvbW1lbnRzIGZyb20gTGV3aXMnIHN1
Ym1pc3Npb24KPiB0aGF0IHN0aWxsIGFwcGx5LgoKVGhhbmtzIENvbm9yLCB0aGFua3MgZm9yIHRh
a2luZyB0aGlzIG92ZXIsIHRvbyBtYW55IHBhdGNoIHNldHMgZmFsbApvbiB0aGUgZmxvb3IuIEkn
bSBtb3N0bHkgZmluZSBtZXJnaW5nIGl0IGxpa2UgdGhpcyBhbmQgdGhlbiBpbXByb3ZpbmcKaXQg
aW4tdHJlZSBhcyB3ZWxsLCBJJ20gbm90IGFzIGluc2lzdGVudCBvbiB0aGluZ3MgYmVpbmcgcGVy
ZmVjdCBiZWZvcmUKbWVyZ2luZyBhcyBsb25nIGFzIHRoZXkgYXJlIG1haW50YWluZWQuCgpZb3Vy
cywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
