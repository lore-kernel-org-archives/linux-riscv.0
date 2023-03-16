Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89724C7618A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 09:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UB4rfcmuE712wYVfvU39dDRge68RIxAasV7HN3qn5gg=; b=EP2cPvCNTbj2Uh
	d1S5eQl+nUAJHgmj7PERI0+CXIIq6If70ZfeJqgw+2PbIBG2kWLbwkTfWzUpUj9SAk1587pIWOnam
	LMM+YW49gAMaG6AINDGBo3yeU2FYfglEz0BmW/Furqv6xlKx5MERmXVKxINRjxBskFKTg5orsO3dD
	E+V4SxaL3rK7TvIFoc0TdqBaHbKTtn2veJTt2O+kE35WAL2CbtfvGMQmBJg4gninxm0nNncUxKp5Y
	j/aAPPkE8PLcIKCA7ocAC7CShF3qyCwDhjyRLZgfw42CbVpkSS/UAMiMYItIHSCsV3eoWeEOqpgRF
	LmwBL4+OquIC1aD+4pOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckNT-00FxCT-0k;
	Thu, 16 Mar 2023 09:58:31 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pckNQ-00FxBO-0O
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 09:58:29 +0000
Received: by mail-ed1-x533.google.com with SMTP id h8so5182598ede.8
        for <linux-riscv@lists.infradead.org>; Thu, 16 Mar 2023 02:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678960704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7rGyVHn72S3f+yP1Dpa8iV3gyVbOxOtWl0FDsXatOAo=;
        b=wotGgL7cieAvnZJI1ayV9RrXnV5X/12AOH5ogveYXgGa4RTFpKtGAdB5mDKcpBO8+D
         7s9zugMXv9XO4iJWNTddZo58NpTxi4FkZVJwn/6/InkPGE9hc2Zo3n8PdZCc41z/gN+L
         I0dNoX/+1vJ9MIeb51CJC8m0HBeXhe8KylNjXAw5JrPwgcfMy5FJGIwaW8NLsPOmaxFh
         suzxwhZmovIFO2X7pDnjfCboClsW+ASPPqV3xMg42Ep4BYR6aAjnRAlCWNQY0kKF+gUj
         JcXs8ddLMCkHZvP9D0FSskVVRkXal0qqppGP91erVttch6wFrtMzNYB5BDnx6BJKIZgx
         aP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678960704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rGyVHn72S3f+yP1Dpa8iV3gyVbOxOtWl0FDsXatOAo=;
        b=fXVCr/cIaUvzzlXNfG0ElaiP3UdkP8xPXx/7xiTro4W5DYvhradm8pIuujKi3UHo32
         qteK/s6PbFDmHK1QNmPTT4U0kZp9nlMvtZKjYEqRGi6vIkUlL6+cKackAtpobVnWAFx7
         9/IdDu/If1vsJbfzN4fk0JWGvJouCoOeNlB9b/22ph+i5ml1Sx0C1+LGsVyVEcMiPkDe
         VNeW9WQPxwwxKCyOJMR8xGyQf8Lmpj9MMzB67w86XozxBUFazmZtkrSTKMF2nS8Y+aff
         Rj61CQjc61iHFFWU1VVGNMNVamfZgqHZPzBVAsIgW9ySMtu5TwcWONhVCG5+LCHVjf5A
         bQIA==
X-Gm-Message-State: AO0yUKWbvq2dmC8h6CGWSjaWSEU4BLvDkiePCqeJlAWQuYceppufTsqD
	0ofXqvXGBgsGcPuFk84TY73wiA==
X-Google-Smtp-Source: AK7set+uFvdmcmTzTE5XT99s0No3h1JbE0DG2UjhiIjcQ+/02A3xmqNlG8+ZhcJq7kpCG02F0bNZag==
X-Received: by 2002:a17:907:d482:b0:8e5:2a12:8ec0 with SMTP id vj2-20020a170907d48200b008e52a128ec0mr9457794ejc.31.1678960704057;
        Thu, 16 Mar 2023 02:58:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id l9-20020a50d6c9000000b004fc649481basm3614242edj.58.2023.03.16.02.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 02:58:23 -0700 (PDT)
Message-ID: <d2eda9a8-f532-d7f0-7ef3-b3b8e1a0a79f@linaro.org>
Date: Thu, 16 Mar 2023 10:58:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 4/6] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Guo Samin <samin.guo@starfivetech.com>, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230316043714.24279-1-samin.guo@starfivetech.com>
 <20230316043714.24279-5-samin.guo@starfivetech.com>
 <cfeec762-de75-f90f-7ba1-6c0bd8b70dff@linaro.org>
 <93a3b4bb-35a4-da7c-6816-21225b42f79b@starfivetech.com>
 <9038dba0-6f72-44a1-9f57-1c08b03b9c31@linaro.org>
 <d2bb7fa5-206f-2059-bde0-b65e1acc44de@starfivetech.com>
 <c716e535-7426-56da-ca6f-51c7d7d69bb3@linaro.org>
 <b7766151-cf21-a5b4-e0ef-7b070e9e5c33@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b7766151-cf21-a5b4-e0ef-7b070e9e5c33@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_025828_234091_2C91299B 
X-CRM114-Status: GOOD (  11.33  )
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

T24gMTYvMDMvMjAyMyAwOToyOCwgR3VvIFNhbWluIHdyb3RlOgo+IAo+IAo+IC0tLS0tLS0tIOWO
n+Wni+S/oeaBryAtLS0tLS0tLQo+IOS4u+mimDogUmU6IFtQQVRDSCB2NyA0LzZdIGR0LWJpbmRp
bmdzOiBuZXQ6IEFkZCBzdXBwb3J0IFN0YXJGaXZlIGR3bWFjCj4gRnJvbTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+IOaUtuS7tuS6ujogR3Vv
IFNhbWluIDxzYW1pbi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbT4sIGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcsIGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4g5pel5pyfOiAyMDIzLzMvMTYK
PiAKPj4gT24gMTYvMDMvMjAyMyAwOToxNSwgR3VvIFNhbWluIHdyb3RlOgo+Pj4+Pj4gaW50ZXJy
dXB0czogPz8/Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBIaSBLcnp5c3p0b2YsIAo+Pj4+Pgo+Pj4+PiBz
bnBzLGR3bWFjLnlhbWwgaGFzIGRlZmluZWQgdGhlIHJlZy9pbnRlcnJ1cHQvaW50ZXJydXB0LW5h
bWVzIG5vZGVzLAo+Pj4+PiBhbmQgdGhlIEpINzExMCBTb0MgaXMgYWxzbyBhcHBsaWNhYmxlLgo+
Pj4+PiBNYXliZSBqdXN0IGFkZCByZWcvaW50ZXJydXB0L2ludGVycnVwdC1uYW1lcyB0byB0aGUg
cmVxdWlyZWQgPwo+Pj4+Cj4+Pj4gWW91IG5lZWQgdG8gY29uc3RyYWluIHRoZW0uCj4+Pgo+Pj4K
Pj4+IEkgc2VlLiBJIHdpbGwgYWRkIHJlZyBjb25zdHJhaW50cyBpbiB0aGUgbmV4dCB2ZXJzaW9u
LCB0aGFua3MuCj4+Pgo+Pj4gSSBoYXZlIG9uZSBtb3JlIHF1ZXN0aW9uLCB0aGUgaW50ZXJydXB0
cy9pbnRlcnJ1cC1uYW1lcyBvZiBKSDcxMTAgU29DJ3MgZ21hYyBhcmUgZXhhY3RseSB0aGUgc2Ft
ZSBhcyBzbnBzLGR3bWFjLnlhbWwsCj4+PiBkbyB0aGVzZSBhbHNvIG5lZWQgdG8gYmUgY29uc3Ry
YWluZWQ/Cj4+Cj4+IFRoZSBpbnRlcnJ1cHRzIG9uIGNvbW1vbiBiaW5kaW5nIGFyZSB2YXJpYWJs
ZSwgc28geW91IG5lZWQgdG8gY29uc3RyYWluCj4+IHRoZW0gLSB5b3UgaGF2ZSBmaXhlZCBudW1i
ZXIgb2YgdGhlbSwgcmlnaHQ/Cj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4+Cj4g
Cj4gWWVzLCBKSDcxMTAgZml4ZWQgaXMgMyBwY3MuIFRoYW5rcywgSSB3aWxsIGNvbnN0cmFpbiB0
aGVtLgoKVGhlbiBqdXN0IG1pbkl0ZW1zOiAzLCBtYXhJdGVtczogMyBoZXJlIHNob3VsZCBiZSBl
bm91Z2gKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
