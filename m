Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2EBC6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 21:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyFW000bWcbySgN+z4CizuavW2dMtZiX6EUrv+kT+oQ=; b=xVQ51ednlOFluy
	AFyJ+Utn9r3Gx2Z9NjAruSTRDxugFu3VlRvHwQlLw1xgtbUuTvzKTzELfnzlMPpzdfRRlq/hOlAtL
	xtHU0FLBgG8aYbWXZkJtHpDLSWZYMhFZ7s72cBmfhlgoJeu6I8mdqP71GVQSeeHjTfViqv7ro5EHy
	llPem24u27GNZ12ELbs64fO7xBJoeMQEvMplKoE4VtG0IbpMB9qo9xxmlvxwwZnKyBvf2P8cYOJlN
	PU9qW5AL/TJJ41amYnCreOYsXa5AdmGABZ/42oBCJcjeX6vrghCh4iZrzSQGM759vZrQU6luKI3WR
	aFizJv2tFXd7s+u+GDOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb75p-001KS8-8A; Sat, 11 Mar 2023 21:49:33 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb75B-001K7j-60
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 21:48:54 +0000
Received: by mail-yb1-xb30.google.com with SMTP id t4so8436506ybg.11
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 13:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avxORhp0kgP64csxpACe2lIp7clmoiWT+buAVHFj3Nc=;
        b=SvB+Yt3B6vMI7SzhX+OqMjxdEcXKooqniB7M4emFHM4IrJv22AHfu3/pshLPOfpNcf
         IXFPOGOLNYpvg/LdcyF/kb4wfrtQllkGahShUydijKp2tQWFdDLGXovERBdh/GMeBjMk
         Yd3DtDXsGeXtupKttlzPTcrPPPl/cTDS2VLNMGIBe30qV0HR14fkgW5Pu5ETBaBLYWzl
         nxrP1gupaRueT/AzRVwMF/NLmmwpi1SMmJtiPykyGDdfrbEclKRUGRcX57yZcNrFoCFM
         36Q306aZjNUZ+oiN7/mnz9Z15rA2YP34rCnqUswxgNLRMsmDzriXz9+R2nUaNdQ1UNbE
         wqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avxORhp0kgP64csxpACe2lIp7clmoiWT+buAVHFj3Nc=;
        b=PyT73vfQ73jsvMnIiqwroQmvC7Cb5A7UXs7j2nYyidwvXuk5bCC1TOwRRQfgq5XLSM
         6u4rzk+hS0WSSq47nV+F0D8pC1Qn1KwG+wFNHh50lul4Jz/pEUS8O7JwsoknJVn7TjNk
         seZdTG1PrMsa/qiFshsiVGlsH/nMeHuaEAUCN5J5xGI1iEreK5TvDwVkE9+E1k0fW2Qz
         x6gmQ3mOsGSH7L01bPvUU/eaUWuPNs4BIrK90e2xZuYMdDKb1LWgOeKUosZR3qwHouZ1
         VTb1dINZq3Ao+fUrYebHYnw9wFNRITJCkvVxB7YnNoxotEpENFETxcxseiRpqhTThGOK
         1mKQ==
X-Gm-Message-State: AO0yUKVp4VBr+TgDqoXIiwcVthOrl591DbxaAUdL8ppQ3y+DUQNC0fju
	5GsvoOnu1TIAeB8Fp2N+vsidVuHw12pspsc7W5q6sA==
X-Google-Smtp-Source: AK7set9WUuzYTIu0VGcBjZgeP3fzHchaShWW88niS1CjTGA6sYt4+6dioF4aKW72ufcsWNGNH6ODRKgk4q9A3qI7nbk=
X-Received: by 2002:a5b:647:0:b0:932:8dcd:3a13 with SMTP id
 o7-20020a5b0647000000b009328dcd3a13mr18396213ybq.5.1678571331687; Sat, 11 Mar
 2023 13:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org> <20230311111307.251123-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-5-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Mar 2023 22:48:40 +0100
Message-ID: <CACRpkdbou26bxA1vkm2C2X_Ncg_O_R_X8UV=U3__iw+4g2ED3g@mail.gmail.com>
Subject: Re: [PATCH 5/8] gpio: sifive: drop of_match_ptr for ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mun Yew Tham <mun.yew.tham@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Nandor Han <nandor.han@ge.com>, 
	Semi Malinen <semi.malinen@ge.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_134853_303464_F003D49F 
X-CRM114-Status: UNSURE (   7.87  )
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMTI6MTPigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgZHJpdmVyIGNhbiBt
YXRjaCBvbmx5IHZpYSB0aGUgRFQgdGFibGUgc28gdGhlIHRhYmxlIHNob3VsZCBiZSBhbHdheXMK
PiB1c2VkIGFuZCB0aGUgb2ZfbWF0Y2hfcHRyIGRvZXMgbm90IGhhdmUgYW55IHNlbnNlICh0aGlz
IGFsc28gYWxsb3dzIEFDUEkKPiBtYXRjaGluZyB2aWEgUFJQMDAwMSwgZXZlbiB0aG91Z2ggaXQg
bWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgo+Cj4gICBkcml2ZXJzL2dwaW8vZ3Bpby1zaWZp
dmUuYzoyNjM6MzQ6IGVycm9yOiDigJhzaWZpdmVfZ3Bpb19tYXRjaOKAmSBkZWZpbmVkIGJ1dCBu
b3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+Cj4gU2lnbmVkLW9mZi1i
eTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoK
UmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllv
dXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
