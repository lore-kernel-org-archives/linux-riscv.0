Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6ADC74A44
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 21:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWuec9ZvrUDmkAQ/gta4QjzqpjQTF89Mb1HmekNLCqM=; b=ckPknzynbDOjin
	mErpCtp+cpZ5ndYBdhh3YbFs7omDbxAWP2v7I+xyyVJyCQDEI5HYji1oXWUGhtlXabrq75GuJ78j7
	akKbzffyICWtUhc+fdEikY0Qp2QF0wiyvZDeVOau/kN6wAyihnSA1MNF8gi4dqfHmuRKOBteoy4a/
	fDm3aLjIErvCNfFNyMiJjX91GOHigWmWcf+alkrzvsWZwa8NrnB8x622dHxdVrdZwBdSWSzjwufvd
	fiX0he2AxcDL/Adk9pNXslIzb5Pp0ba8KTsGByRvk3gD8LpIl5Aa1IgGaMp2vFJbBzFUOVDMhWdSi
	JgLQwW3235Lq8lQbwfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb77O-001LHx-El; Sat, 11 Mar 2023 21:51:10 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb768-001KdK-Lo
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 21:49:54 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-540cb2fb5b9so64997617b3.3
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 13:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqNxoqG+lZ6oxesXMP4M9SwCu/22j7feF4x6heHwhek=;
        b=zeNdXMivIRquGUcJj0m5PLawOYA3UBvnBq+haPzTIA8zsJCogWC/b3TGY5fFD8qFGu
         kFJG/uEMB+nme3nCu4INlEbwdAfHt8kAY67t0xnFV/oDy3EddeCvh3l/U+LUWcC4T/Jd
         MwqP1jx6Hd/VtdY8XDy1Ms80eTyE/Rt32/DJ6KUbRV/9LbM5GunG9h9dOkGNreXPIo0i
         qj5u/pDZWDf6crKH502d3nwnY96PAyAek9VkwkyHW7WYJTZg2n3e0qP8iBccZ2kfyk5w
         ONsgA+oKdmKmrZ8bgrEBMFXV298D2VpeSNLBw8tiJ3O/czDVy4J0ZqLLoBaxaFIYWIe5
         IHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqNxoqG+lZ6oxesXMP4M9SwCu/22j7feF4x6heHwhek=;
        b=d4k6g4pXaGemcXnUPNVvOgypZrReFZYG3q0Zd/tICo/V2XYtaxDf7yozfH06apOXWn
         Qy4NxyHcOLp67l9pWCcxjcaFcx6TRbm0oCOWVzE7KvcQJeZpTQ9+DSjtjf1+a1v3cEeT
         xXnvD5Gq+HBDhKkMOV8AND/gGHREn+cHpXjahydi836KPAehzjHSRR7wPBRIvRuhUfE3
         kTPUT1GD1GdD2vBI8CsEgAK26m0tDDMpjWKCYSMI95IlQtLQioiWXypkSMf/7++2alTx
         qBCT5WO5w0nrhni3kWp5uTAml64oAx+QU3PlfN02nfsZscL/iiTS0jIzdiCgAWXFJo+T
         bHSg==
X-Gm-Message-State: AO0yUKXpd9Ut+8HkbMvrQnHY1xh1CFh2sDZr4/KtXloXGpx66BEvCGtY
	A6/3uYW8G+XOgvHq1H5ZPLBiRA/in4+/i4g6P7JfUA==
X-Google-Smtp-Source: AK7set9q4t0wVmeyByvkjybAxdRp4Q1NPAg7CDNjCXq8sbQysHoXIGebF7m7NGtkwbo3qp32nNJ3Te+zjQEcOjXmNLk=
X-Received: by 2002:a81:ac51:0:b0:540:b6c9:66cd with SMTP id
 z17-20020a81ac51000000b00540b6c966cdmr2722485ywj.10.1678571391838; Sat, 11
 Mar 2023 13:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org> <20230311111307.251123-8-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-8-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Mar 2023 22:49:40 +0100
Message-ID: <CACRpkdbqbrEZfX7S93ueN7S_ywwvE7ZWS-L7r7h9QcGXNRWnXQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] gpio: raspberrypi-exp: mark OF related data as maybe unused
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
X-CRM114-CacheID: sfid-20230311_134952_727112_462A1042 
X-CRM114-Status: UNSURE (   6.24  )
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
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgZHJpdmVyIGNhbiBi
ZSBjb21waWxlIHRlc3RlZCB3aXRoICFDT05GSUdfT0YgbWFraW5nIGNlcnRhaW4gZGF0YQo+IHVu
dXNlZDoKPgo+ICAgZHJpdmVycy9ncGlvL2dwaW8tcmFzcGJlcnJ5cGktZXhwLmM6MjM3OjM0OiBl
cnJvcjog4oCYcnBpX2V4cF9ncGlvX2lkc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJv
cj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IExp
bnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxs
ZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
