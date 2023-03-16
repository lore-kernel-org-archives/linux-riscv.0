Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A29C6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmWl8x0V60fhObAmb8O8UHNnqjFftb4cqDx9Aq/ShW4=; b=UHTntouacSs8s9
	MH52WtVyw05JjX2MkgUSMQkxr8XZ1kAfT1lroaw5DeTfvgB/cP/XDim3zTv1nK3PN1wUOESau7l2D
	C+czx0UjoS4bw6NDQnP89RbMZTXQyGN5UJniT4W3fHTMaBGDqSqigT5WX+w8fR93Jc8NKmOtuDyp7
	/6BKsnQNWlHXhcRuL/X6wpNVNjXEirH1hNZ0uXd67yEsS/XoJvVcbukZXa4r9NfS9olQAsaQlB5rO
	6c54JnL5713I3FVx0SXth8iJAFWNSANB0qWriG6cV6XKG65cmZqtybCj9q1GvX/UD0+5s1s4sqh0l
	C+xArqfdF06MxWAyZMfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcltx-00GFrg-2h;
	Thu, 16 Mar 2023 11:36:09 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcltr-00GFpn-2I
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 11:36:08 +0000
Received: by mail-ed1-x52a.google.com with SMTP id x13so6392664edd.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Mar 2023 04:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678966559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqDI/M1Af8/sNqbCpEB0H1SmBWIzYviu82ZtF7Bi/bY=;
        b=rRiEU5oazgQw0R1aSrCBttAqFSEJbGCKYqagvYeE7JYF//DJybGNz6QSbv2vA07802
         dlLfQ+Yulm4Iqsuz0cMhG7nEGJfRGeZqyJVaah9azQkwJm1F46Ci4e1AgEY8zzju++/g
         cEqoPpZjBM7kZVe2+ZcrvrjK6G1JXhVTodHZjT1QIGOE2dIBKG9C5jGGQzviDkwWfDQN
         C/sdbca1RYlv1W6tQHtImGRS3uNb4EZrh9ITaYedh8GcRQs9VXcnn4NnAAY76T8sdI8F
         wHLDEHsJcnRzHbhyrcGYBykxBR3sGVENScBstgDamWjuJOIk5QttOiqcWZQMSclPr9PO
         XkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678966559;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqDI/M1Af8/sNqbCpEB0H1SmBWIzYviu82ZtF7Bi/bY=;
        b=Vldt7NwrUNIHRueGlnH58HDNHn8Muak2Qyb2p7lYwbKAPkgO9hZl0Qhtem3IwGb4oo
         1a/PfzS0UkdDEuTN8QYIW8qC6FBSZJh0pvl0JLLx0nC13doY2uw0/9xFvq/0gJgXQeyV
         s7FLu0IbAL5V4RUmopp/58Ux3wdrp2U608Ur7ccvamLyHGsZNelicV5xgV9E7sE7/rLc
         jmKA3XXVZaADKdQ8ExgwuE7Rfhwkav7ojpYLmhLsuI4qwDbcOtwr/X7AYtq5ycvYeX5O
         3+RttkNXPSo2DXXt5oGCkNHfIlMZ8+YkNG4yULtrEt+coHxmZEoEFVMBXe37bXhaf2Pd
         5Aig==
X-Gm-Message-State: AO0yUKWKglCikbtEZclSsf1PvSynjq83TT67Xgzhv4UgIYCq45SzY14R
	KyElpj9BZRbP1GXrt8IYTLiACw==
X-Google-Smtp-Source: AK7set8sYZiwje7c5FUEwR9UZNt5fMGvnqOF2tI01ccg9IOBFjG/kdx4xLMiQvZ3K+XFDGc8yi4+vg==
X-Received: by 2002:aa7:c94e:0:b0:4fb:5089:6e01 with SMTP id h14-20020aa7c94e000000b004fb50896e01mr6438016edt.6.1678966559627;
        Thu, 16 Mar 2023 04:35:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id g24-20020a50d0d8000000b004fd29e87535sm3714492edf.14.2023.03.16.04.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 04:35:59 -0700 (PDT)
Message-ID: <2751a83d-d3ff-8dbf-4fa3-dedc40d23d45@linaro.org>
Date: Thu, 16 Mar 2023 12:35:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
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
 <d2eda9a8-f532-d7f0-7ef3-b3b8e1a0a79f@linaro.org>
 <ed8dbe90-ee1d-405a-5aa6-cbc16a0057ac@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ed8dbe90-ee1d-405a-5aa6-cbc16a0057ac@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_043603_775785_C6C82951 
X-CRM114-Status: GOOD (  14.08  )
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

T24gMTYvMDMvMjAyMyAxMToxOCwgR3VvIFNhbWluIHdyb3RlOgo+IAo+IAo+IC0tLS0tLS0tIOWO
n+Wni+S/oeaBryAtLS0tLS0tLQo+IFJlOiBbUEFUQ0ggdjcgNC82XSBkdC1iaW5kaW5nczogbmV0
OiBBZGQgc3VwcG9ydCBTdGFyRml2ZSBkd21hYwo+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPiB0byA6IEd1byBTYW1pbiA8c2FtaW4u
Z3VvQHN0YXJmaXZldGVjaC5jb20+LCBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnLCBu
ZXRkZXZAdmdlci5rZXJuZWwub3JnLCBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZywgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZwo+IGRhdGE6IDIwMjMvMy8xNgo+IAo+PiBPbiAxNi8wMy8y
MDIzIDA5OjI4LCBHdW8gU2FtaW4gd3JvdGU6Cj4+Pgo+Pj4KPj4+IC0tLS0tLS0tIOWOn+Wni+S/
oeaBryAtLS0tLS0tLQo+Pj4g5Li76aKYOiBSZTogW1BBVENIIHY3IDQvNl0gZHQtYmluZGluZ3M6
IG5ldDogQWRkIHN1cHBvcnQgU3RhckZpdmUgZHdtYWMKPj4+IEZyb206IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPj4+IOaUtuS7tuS6ujogR3Vv
IFNhbWluIDxzYW1pbi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbT4sIGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcsIGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+PiDml6XmnJ86IDIwMjMvMy8x
Ngo+Pj4KPj4+PiBPbiAxNi8wMy8yMDIzIDA5OjE1LCBHdW8gU2FtaW4gd3JvdGU6Cj4+Pj4+Pj4+
IGludGVycnVwdHM6ID8/Pwo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gSGkgS3J6eXN6dG9mLCAK
Pj4+Pj4+Pgo+Pj4+Pj4+IHNucHMsZHdtYWMueWFtbCBoYXMgZGVmaW5lZCB0aGUgcmVnL2ludGVy
cnVwdC9pbnRlcnJ1cHQtbmFtZXMgbm9kZXMsCj4+Pj4+Pj4gYW5kIHRoZSBKSDcxMTAgU29DIGlz
IGFsc28gYXBwbGljYWJsZS4KPj4+Pj4+PiBNYXliZSBqdXN0IGFkZCByZWcvaW50ZXJydXB0L2lu
dGVycnVwdC1uYW1lcyB0byB0aGUgcmVxdWlyZWQgPwo+Pj4+Pj4KPj4+Pj4+IFlvdSBuZWVkIHRv
IGNvbnN0cmFpbiB0aGVtLgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBJIHNlZS4gSSB3aWxsIGFkZCByZWcg
Y29uc3RyYWludHMgaW4gdGhlIG5leHQgdmVyc2lvbiwgdGhhbmtzLgo+Pj4+Pgo+Pj4+PiBJIGhh
dmUgb25lIG1vcmUgcXVlc3Rpb24sIHRoZSBpbnRlcnJ1cHRzL2ludGVycnVwLW5hbWVzIG9mIEpI
NzExMCBTb0MncyBnbWFjIGFyZSBleGFjdGx5IHRoZSBzYW1lIGFzIHNucHMsZHdtYWMueWFtbCwK
Pj4+Pj4gZG8gdGhlc2UgYWxzbyBuZWVkIHRvIGJlIGNvbnN0cmFpbmVkPwo+Pj4+Cj4+Pj4gVGhl
IGludGVycnVwdHMgb24gY29tbW9uIGJpbmRpbmcgYXJlIHZhcmlhYmxlLCBzbyB5b3UgbmVlZCB0
byBjb25zdHJhaW4KPj4+PiB0aGVtIC0geW91IGhhdmUgZml4ZWQgbnVtYmVyIG9mIHRoZW0sIHJp
Z2h0Pwo+Pj4+Cj4+Pj4gQmVzdCByZWdhcmRzLAo+Pj4+IEtyenlzenRvZgo+Pj4+Cj4+Pgo+Pj4g
WWVzLCBKSDcxMTAgZml4ZWQgaXMgMyBwY3MuIFRoYW5rcywgSSB3aWxsIGNvbnN0cmFpbiB0aGVt
Lgo+Pgo+PiBUaGVuIGp1c3QgbWluSXRlbXM6IDMsIG1heEl0ZW1zOiAzIGhlcmUgc2hvdWxkIGJl
IGVub3VnaAo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IEtyenlzenRvZgo+Pgo+IAo+IEhpIEtyenlz
enRvZiwKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBzdWdnZXN0aW9uLiAKPiBJJ2xsIGNoYW5nZSBp
dCBsaWtlIHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbiwgaXMgcmlnaHQ/CgpZZXMsIGxvb2tzIGdv
b2QgZm9yIG1lLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
