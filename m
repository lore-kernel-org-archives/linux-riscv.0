Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA79C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 21:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4rPRbSPFIrjhFQ49Qq4C3uBS689Sbm4lpkXuboUV00=; b=E/7FXNKnc6Xxub
	JpKnTVUfS8hsYwCSegIeBN9W244he4b6yOYy2f063mMngsi035+EVgfU1FOIjVCAe4ZkSNcICLr1T
	WjWiJSK53yvSSWtzrVKj5aDpryyVJMhGFnGNGS/zH2M84HlZUX9GFgMcWeARhYkAjlfDWMvrcsmYb
	SWno4biioksc62l2ntvtMQyWcIUQuupgDG2D2EsU5D0P8i7eRWu5DWK16IGQNmOthIilFpeWRHOsA
	FrQ8/ascvApyXUdcLjQLcuuHabj1iwMPBDuSXZqMD7dldgX79JPPfrhlWvojzd0b5NgOyhnCfODkK
	XTlHSlDuw5/8Bo53Htew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb73p-001JUO-TM; Sat, 11 Mar 2023 21:47:29 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb73e-001JPq-LR
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 21:47:19 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-53916ab0c6bso169554297b3.7
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 13:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678571237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6Mw0ypF+8k7PLrY/7XQrGegOH0i0vAAhAg3d54HVCs=;
        b=F1dKTj5WejEHbCAqSmkG0MtDRsafkJzlKuv7Blx5gzzjMJoWDtTuJYNCEvgPDPOZvb
         crh7vTUcNgrZF5QmstwHiyQp+rOnLrZpcZyjxYVDzhwHevFX41PPFOq7zxcH0w4eQSxX
         3i3c9azeyCeScysourVSzlPP3Xk6Jaitc/Zk21n6pLdsotwLVIkXl9yHolrExYnCLW6w
         L+xfSEKlr4ApGzlwduG0FM7VNqiNX5NJS7KdIrl7AiYjnG3T7QxUnhb/QIxzuYTX9JUf
         RoyJWnWW/ElU/8SXQ5IOeIX3jU/N+0nV/W4pjg8qly9QE78i1Hn+lTc4rRbT3Zf+VbqZ
         6b8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6Mw0ypF+8k7PLrY/7XQrGegOH0i0vAAhAg3d54HVCs=;
        b=GM7+Q/X07Ods0lEhd4FZ8zPTgawUc0Ai228Lze3gLn0jZvjj3STKaKkbpW08kJY9wh
         nCI4Olz6+LGJNYlNlW2/vn8FfA9J/8YF8lpt4jfIZaV8nUb2sQZn2r0YaMAa4w7sOmZr
         v2+xNXDju0nVQp82ALAX288ySrwmLBMqG4u4nVr6XZSHicabOBz1/LonBKrsbXqPwdww
         opCVgRaSpNrA5n2c4YSM5uXkJ+emQ54X2VuYjBHJ0VZ34OwmDzh9pmLATUgmXFStG7/r
         laWY2qKpLnsAoGXeMnewOceIdr/DI5XqwOkJVEQb8YFTR7UHOUpySlNw2zNf0qZVKMkp
         JIWw==
X-Gm-Message-State: AO0yUKWXhsM/jhy3Q83u13auKKo1Stm0w0urVCnmZ2vXsTYMV5h98XS2
	u5jaylcDnXc8zX/lVK/IOPcMvhhgMM+Hp8AloTU2gA==
X-Google-Smtp-Source: AK7set+wqGujzuEzqpe0yUtH0QryUw6iAwkO3ZlCcQUkRUb09qFyUtqFnBmFWknIwDMk5oPEudc8Sc+vNQAvx0IRP08=
X-Received: by 2002:a81:b665:0:b0:541:8285:b25 with SMTP id
 h37-20020a81b665000000b0054182850b25mr902617ywk.10.1678571236874; Sat, 11 Mar
 2023 13:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20230311111307.251123-1-krzysztof.kozlowski@linaro.org> <20230311111307.251123-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111307.251123-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 11 Mar 2023 22:47:05 +0100
Message-ID: <CACRpkdYfmApW0m_2yCK8QLR+opdRvzi6a-ULTL_k5WG3bXqqpA@mail.gmail.com>
Subject: Re: [PATCH 2/8] gpio: altera: drop of_match_ptr for ID table
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
X-CRM114-CacheID: sfid-20230311_134718_713185_471F64EC 
X-CRM114-Status: UNSURE (   7.77  )
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
bWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgo+Cj4gICBkcml2ZXJzL2dwaW8vZ3Bpby1hbHRl
cmEuYzozMjQ6MzQ6IGVycm9yOiDigJhhbHRlcmFfZ3Bpb19vZl9tYXRjaOKAmSBkZWZpbmVkIGJ1
dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+Cj4gU2lnbmVkLW9m
Zi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3Jn
PgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4K
CllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
