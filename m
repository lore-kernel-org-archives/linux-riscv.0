Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520CFC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 06:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8zwkvPH3a8yyVI3VT+877dkMkUJyCa5Ai4xXo14LNQE=; b=PKcOnOHG5bGgWj
	jHf3xajxS1iw6FrBfAEXgOCSreUAcCs5r7c9d0GegwK/h4tBE43LDozf06fJjWpoMNyFzRALnS5Us
	ouVdkLi9N2KfV2ovqcJZk+s0delLJ4dfJ+fn/MkFRPb7N+uHmcioQ8B29NaOSUercxhJCUQpzuW42
	NNGp1OGBE4shKb5VMg75e+w08TljsmlkVsgKsZmxTUWCc9XbtHhaDI2vAOJfrFVufdb8EJRxdDNqU
	U+eREaQPQw00KSsmvgdHvssrf5S85ZBqvfjgweV+WUFqZGx09sZM9/iPNscxhXk/dQR8OzjZpvBjq
	Xe8CVmHM4xyfY2/HksBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Khk-00000001hiF-0YPT;
	Mon, 29 Apr 2024 06:41:36 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Khg-00000001hfC-3UZF
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 06:41:35 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5aa27dba8a1so2566573eaf.0
        for <linux-riscv@lists.infradead.org>; Sun, 28 Apr 2024 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714372890; x=1714977690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgBY4OmPcqw82XexSWZuwlH1PM0/PzczUye2q4AdVKI=;
        b=BCnn7GxmjFh1E0S0tuSvCLl7yTuwPHIi0XvfSoVmd2iHq81g4/jfEEl7ZlBu9oZlCA
         PSNIz8GDthUYLQ3626qoxeXc9Wqfd8XSNC4Gb/mNhVBYfMZrkpYGErfFwF0ybNcyrGgY
         38N16Dn40turpTP/r8MYhLSpefKqed1+kTa0r1INXoh6bS9qFnTypPS0/IaTU/ilJCs5
         BI3D5t0qqY2lGoGS2RfUP/b+zv0lyp2JvtqlDHZLVqEzl/QjvzRbnyLoWTPgpU3Lhgl4
         HasDzCP9tEXNsNaQ3I6toZzPOV6CmViY/chyZOKAh97/2mDv75goJ/4ZheWLpW92s1iz
         Nu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714372890; x=1714977690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgBY4OmPcqw82XexSWZuwlH1PM0/PzczUye2q4AdVKI=;
        b=J858S2Q3kmJQixEpal+tueAbWmeK5lbTxu3GtwRnt++GWu8A9bTlIv9wQfwGU4AR04
         Hr7/v0MlWVTI+CVdFbr5st5+TOmZOJwuUgTdRaLbIzrLciadsFncKVfOHS/G9bbCglrj
         rwilsW7Hbtz5fqNPtT3hc40+GugPyB3V8yNgj5TAnLoZ33oMfAGYzRVtoT14rwbbeXgB
         tVbN7PIaqNqk8V6KFmPeVYtwOjJ5hM2R2Dsq+dhdgta7m03r9kLuEYL4tJBIFMEpbxf8
         0ZGKna4fdko8+qohIvptoJdfOD40vvZFP8VKuQdUryjCO1lTqIBuakxF/4AjIJDDndUn
         RTnA==
X-Forwarded-Encrypted: i=1; AJvYcCWCREiFjif1KC193Ez49P0E+uXH9pTMYWf56wroV2E9HzYJWgRX2fBOXl50Q+seVk46pNsT6ZeJmpgZ01tfzRAQuI1HAY+3ccVXBpJJQt9K
X-Gm-Message-State: AOJu0YzgQhSfHAHo6d2m2EpR9ptkjS5XtcV8NRoCX9kZPFTyX56i1lxE
	8QBIQS7c4gbDbD9DUyewlOoEhtWemoq5utx9TDZUIOONyfMy34CQxaTQf/BDPsBQ9Z9uGYHE8fw
	rwj6DTeMEqrf5U5/JPCXpddhM6YU=
X-Google-Smtp-Source: AGHT+IGJ4iLg2RHmdalKHLkfEPhg76eu7dX0uQvjEQn76xhlDTojLONLF3y7p8r9FUHtq//1J+Dn5+ECE3mnTZgr0BY=
X-Received: by 2002:a4a:ad4b:0:b0:5ac:6891:cee7 with SMTP id
 s11-20020a4aad4b000000b005ac6891cee7mr10929162oon.3.1714372889534; Sun, 28
 Apr 2024 23:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240427075426.662671-1-qiujingbao.dlmu@gmail.com>
 <20240427075426.662671-2-qiujingbao.dlmu@gmail.com> <40eee0ca-fb15-40c7-80be-a1198f37663d@linaro.org>
In-Reply-To: <40eee0ca-fb15-40c7-80be-a1198f37663d@linaro.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Mon, 29 Apr 2024 14:41:18 +0800
Message-ID: <CAJRtX8RztQfeoBhGjdAZZBW5h9PQT_pYhyKCRsbXwx83SbCExA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mtd: add sophgo spi-nor-controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@outlook.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	dlan@gentoo.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_234132_958760_54DCACC8 
X-CRM114-Status: GOOD (  15.96  )
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

T24gTW9uLCBBcHIgMjksIDIwMjQgYXQgMjoxOOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyNy8wNC8yMDI0IDA5
OjU0LCBKaW5nYmFvIFFpdSB3cm90ZToKPiA+IEFkZCBZQU1MIGJpbmRpbmdzIGZvciBjdjE4MDAg
c3BpIG5vciBjb250cm9sbGVyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEppbmdiYW8gUWl1IDxx
aXVqaW5nYmFvLmRsbXVAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL3NwaS9z
b3BoZ28sc3BpLWN2MTgwMC1ub3IueWFtbCAgIHwgMzMgKysrKysrKysrKysrKysrKysrKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc29waGdvLHNwaS1jdjE4MDAt
bm9yLnlhbWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NwaS9zb3BoZ28sc3BpLWN2MTgwMC1ub3IueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zcGkvc29waGdvLHNwaS1jdjE4MDAtbm9yLnlhbWwKPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjEyMWE4MGZiZjJkNQo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NwaS9zb3BoZ28sc3BpLWN2MTgwMC1ub3IueWFtbAo+Cj4gRmlsZW5hbWUgbGlrZSBjb21wYXRp
YmxlLgo+CgpJIHdpbGwgZml4IGl0LgoKPgo+ID4gQEAgLTAsMCArMSwzMyBAQAo+ID4gKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4g
KyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvc3BpL3NvcGhnbyxzcGktY3YxODAwLW5vci55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBT
UEkgY29udHJvbGxlciBmb3IgU29waGdvIFJJU0MtViBTb0NzCj4gPiArCj4gPiArbWFpbnRhaW5l
cnM6Cj4gPiArICAtIEppbmdiYW8gUWl1IDxxaXVqaW5nYmFvLmRsbXVAZ21haWwuY29tPgo+ID4g
Kwo+ID4gK2FsbE9mOgo+ID4gKyAgLSAkcmVmOiAvc2NoZW1hcy9zcGkvc3BpLWNvbnRyb2xsZXIu
eWFtbCMKPiA+ICsKPiA+ICtwcm9wZXJ0aWVzOgo+ID4gKyAgY29tcGF0aWJsZToKPiA+ICsgICAg
Y29uc3Q6IHNvcGhnbyxjdjE4MDBiLW5vcgo+Cj4gQSBiaXQgdW51c3VhbCB0aGF0IGNvbXBhdGli
bGUgaGFzIG5vdGhpbmcgaW4gY29tbW9uIHdpdGggdGlsZSBvZiB0aGUKPiBiaW5kaW5nLCB0aHVz
IHRoZSBuYW1lIG9mIHRoZSBoYXJkd2FyZSBibG9jay4KCkkgd2lsbCBtb2RpZnkgdGhlIHRpdGxl
LgoKPgo+ID4gKwo+ID4gKyAgcmVnOgo+ID4gKyAgICBtYXhJdGVtczogMQo+Cj4gTm8gY2xvY2tz
PyBObyBpbnRlcnJ1cHRzPyBUaGlzIGxvb2tzIGluY29tcGxldGUuCgpJZiBuZWNlc3NhcnksIEkg
d2lsbCBhZGQgY2xvY2tzIGFuZCBpbnRlcnJ1cHRzLgoKVGhhbmsgeW91IGZvciB5b3VyIHN1Z2dl
c3Rpb24uCgpCZXN0IHJlZ2FyZHMsCkppbmdiYW8gUWl1CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
