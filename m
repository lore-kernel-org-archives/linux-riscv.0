Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA6DC28B28
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 08:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juIuOpbpIqLsZmk6rjVuJo4PHAp8kRIK2jU8OoZFycg=; b=e6+c8pA9flxeAk
	uiFZt44vjGFT07jJFIh+CO7WvX2S+pWv1bnaHp2WceUb3DIO9mjoplVGtYjyomZPvMC4c/bnKU5vU
	CD9YgJssFSS9EoD4AERcbhNPGC/SbxWNbltEqWZDcN2IJArNnpIG2+dlGS38OCUA1P4Oyv5b46i3T
	J+7sKXxN4e7tqI7sfvCvyxoDgCGK7aJQyBN7lAGvBE0j8J9NIQ4dd1Rik46D/IS8SobpjUZ092qXw
	5Zt+I34SM2L3O/ULtdc6pCHq9oOCynxykyrFFnoUR+gujZeYDxhojwqlGmHNknXgDuc6dk19UIev5
	dajL+KeUDSfnscJRfRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdil-0000000AW60-0Oft;
	Thu, 13 Mar 2025 08:15:15 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdih-0000000AW5F-3vOV
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 08:15:13 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3d439dc0548so2209305ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 01:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741853711; x=1742458511; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8zp8y94UhZUEACB7TqzzlRpM4uzvhufLGfU6PVFDtss=;
        b=gzl0aVaOqJNTuuzQdv1DlQ8huKnga9+FMOZw0V7K3Aex3yYEvhLVazXLwuOKmtiuHN
         21irN/tagz9xUZqDF/nsIMT5thvx0G5KIqtpDKEqdd03JQMIZ3IB7rv/xTyJSRZZDPgr
         N6CG760lD6ZqBCI5YkzM5s+zqOOnG2Ad4lOEeAW4KxWwXPr+q6xtPHIESTj4dQaR0Aae
         ZGZI3jwWh4Ifhd7FPCEiC97NmLeDmTFdSfJlHubYE/eNWjYsCLNyXFggr2cpps+KkWZB
         igwGlaPsF4ORMY9XPLjP7SV/0mmSAyWl6i84lJRSUvlhwpinAhUuZqJt3ja7JPGolRZj
         iYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741853711; x=1742458511;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zp8y94UhZUEACB7TqzzlRpM4uzvhufLGfU6PVFDtss=;
        b=UhDwEmlJvJMdSMsXe06LUgRTr3qJ63THW9AWXLmH9uwxZJYwe54RZyr0eA9ps+02R/
         Md6GyRFIDo9ItNVdzsJJRm1nbMsEtkMWgV0Pgr65HtYNHkM3Np+GudHI9B84xU0vA4fW
         zSsw2VD4V/HbBsxCaRWGa+lO7inzlgLN0F6PXN0h1BX7aY+ZCqebqaK+Xo0ouLePaCl8
         cslBCoUB7Kgrs9LnJGu40G7bjOqdkwme2ok2ELjeX/3jngd0X68+HfeLYSy47pCz4VKZ
         v0ZWqzeb+piz8i1fVv6hBOH41qAAz3+4RIB6LgGS3sByFgil69qGl5pPYUApiwTKBZt4
         pLiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9xTbpi1aD+flsu4ljpZnlXHlqrVljIdtikJqHDDY5XmzD3xFxR5vET3Co6aY/JNqh57wACvYuG2PVvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyK7iflGUk6DU0B4VR1m2ceOQKtQG5rrajA++JJ/4uWltWXxOxm
	NRl2g0TRirxxB+EVT0BT4U5xSg6oAwoB8SE/BXkNlsFrSft785j4u3nrJPzmImw=
X-Gm-Gg: ASbGnctCUM/UQMAO+jrWOmku2RScHcNIhY6vFoidTfaA2INYTHXj4LwhVZqB2uAd8Ot
	tHUOMvf1/H55wEe28brthMLCsjrkvqrMbicZnZb/g+GRvpGJ0isj+YemQrR7RWpM9v5mJQYUVYG
	n3eAhNT5GK7HEanwyOq+ic9veBO+vaYNnoeKaF21qkvz33A551qzdaT6Jogc+PUAR/EUkVQcFW1
	g5lEqX/S5w6fke9haXUcY9J6lnnAu+67tJHSx13wW3UjrXWrGg2aBRRw5GoDW0dSW8SXII7l2C+
	QR1+eI2eVrtPSLIkH/54lpltLUPxJKGIK7ZnHfBYSFhj+SGanhaXPx8+EiDlLfumn++9tDCo
X-Google-Smtp-Source: AGHT+IEZzp8PPH96NPX1KFV4JopgGuWHkLcCnrS6Ve2nlvM2ZsgakuGkYSRd4eUdHSshmqdOMBXrfg==
X-Received: by 2002:a92:b710:0:b0:3d4:6ff4:260a with SMTP id e9e14a558f8ab-3d46ff428d9mr65574915ab.2.1741853710972;
        Thu, 13 Mar 2025 01:15:10 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d47a6475cfsm2559245ab.13.2025.03.13.01.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 01:15:10 -0700 (PDT)
Message-ID: <2b240ccb-e18b-49f1-ba15-7c7c6c647bcc@sifive.com>
Date: Thu, 13 Mar 2025 03:15:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] dt-bindings: riscv: Add SiFive HiFive Premier P550
 board
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Min Lin <linmin@eswincomputing.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Yangyu Chen
 <cyy@cyyself.name>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>, rafal@milecki.pl,
 Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311073432.4068512-5-pinkesh.vaghela@einfochips.com>
 <f6601929-3d1e-49ae-8120-c3005f99e57b@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <f6601929-3d1e-49ae-8120-c3005f99e57b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_011511_989633_97A16A20 
X-CRM114-Status: GOOD (  14.68  )
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

SGkgS3J6eXN6dG9mLAoKT24gMjAyNS0wMy0xMiA3OjU1IEFNLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOgo+IE9uIDExLzAzLzIwMjUgMDg6MzQsIFBpbmtlc2ggVmFnaGVsYSB3cm90ZToKPj4g
RnJvbTogUHJpdGVzaCBQYXRlbCA8cHJpdGVzaC5wYXRlbEBlaW5mb2NoaXBzLmNvbT4KPj4KPj4g
QWRkIERUIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIEVTV0lOIEVJQzc3MDAgU29DIGFu
ZAo+PiBIaUZpdmUgUHJlbWllciBQNTUwIEJvYXJkCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFByaXRl
c2ggUGF0ZWwgPHByaXRlc2gucGF0ZWxAZWluZm9jaGlwcy5jb20+Cj4+IFJldmlld2VkLWJ5OiBT
YW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiAKPiAKPiBUaGlzIFJi
IHRhZyBhcHBlYXJzIGV2ZXJ5d2hlcmUsIHdoaWxlIHRoaXMgaXMgYSB2MSBhbmQgaXQgd2FzIG5v
dCBnaXZlbgo+IG9uIHRoZSBsaXN0cywgc28gSSB3YW50IHRvIGJlIHN1cmUgdGhpcyB3YXMgbm90
IHNvbWUgYmxhbmsgdGFnIGFkZGVkIHRvCj4gc2VyaWVzIGJlY2F1c2Ugc29tZW9uZSBzYWlkICJ5
ZWFoLCBsZ3RtIi4gV2FzIGl0IHJlYWxseSByZXZpZXcgYXMgaW4KPiAqcmV2aWV3ZXJzIHN0YXRl
bWVudCBvZiBvdmVyc2lnaHQqPwoKWWVzLCB0byBiZSBjbGVhciwgdGhlIHNlcmllcyBoYXMgbXk6
CgpSZXZpZXdlZC1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+
CgpwZXIgdGhlIHJldmlld2Vy4oCZcyBzdGF0ZW1lbnQgb2Ygb3ZlcnNpZ2h0LgoKUmVnYXJkcywK
U2FtdWVsCgo+PiBTaWduZWQtb2ZmLWJ5OiBQaW5rZXNoIFZhZ2hlbGEgPHBpbmtlc2gudmFnaGVs
YUBlaW5mb2NoaXBzLmNvbT4KPj4gLS0tCj4gLi4KPiAKPiAKPj4gKwo+PiArLi4uCj4+IGRpZmYg
LS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4+IGluZGV4IDI1Yzg2ZjQ3MzUzZC4u
OTAxZDBlMGFkYjI1IDEwMDY0NAo+PiAtLS0gYS9NQUlOVEFJTkVSUwo+PiArKysgYi9NQUlOVEFJ
TkVSUwo+PiBAQCAtODU3Miw2ICs4NTcyLDEyIEBAIEw6CWxpbnV4LWNhbkB2Z2VyLmtlcm5lbC5v
cmcKPj4gIFM6CU1haW50YWluZWQKPj4gIEY6CWRyaXZlcnMvbmV0L2Nhbi91c2IvZXNkX3VzYi5j
Cj4+ICAKPj4gK0VTV0lOIERFVklDRVRSRUVTCj4+ICtNOglNaW4gTGluIDxsaW5taW5AZXN3aW5j
b21wdXRpbmcuY29tPgo+PiArTToJUGlua2VzaCBWYWdoZWxhIDxwaW5rZXNoLnZhZ2hlbGFAZWlu
Zm9jaGlwcy5jb20+Cj4+ICtNOglQcml0ZXNoIFBhdGVsIDxwcml0ZXNoLnBhdGVsQGVpbmZvY2hp
cHMuY29tPgo+PiArUzoJTWFpbnRhaW5lZAo+IAo+IElmIHlvdSBhZGQgdGhpcyBlbnRyeSBoZXJl
LCB0aGVuIGFkZCB0aGUgcGF0aCBmb3IgdGhlIGVzd2luIGJpbmRpbmcuCj4gCj4gQmVzdCByZWdh
cmRzLAo+IEtyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
