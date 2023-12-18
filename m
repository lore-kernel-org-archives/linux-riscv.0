Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4094C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 10:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y59LZXe8zh5S1qzzXfA+rEplEjVEZA7Nq6BdDMuj7Ig=; b=2zh+moR7M/87Lw
	y5y+rFjwJJaZll8EN1Gj/9WnfXN7WO1GtTD3K6ZEBUoJe70eaTizaloIgRu/GgxjrJZbek/EU+ZCf
	gghoId7GZkOk2lLgwdpCoCjF3RfZ9NVjOTItHmQ89R/IPcqrmEoxYoIYLnA/WcTMVJ83NSyVT577A
	Eb9ksx1ByYuOq8BWKaGnR7RzcM9o19+4iMMlj9wKbqnGqlFQm9FzrkPtVRosLqeMj2FY+XYaCn6mT
	qAE4wgy47sPJA8D8w6jK4JqnlOxMsgPVwTFdzQS9BxA9KNRxpA/4vzng0CETrMBIlCd6cqGYGOmMU
	cVDhiJ2NZfw6W8JUD6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFAUv-009leS-1Y;
	Mon, 18 Dec 2023 10:05:17 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFAUr-009ldw-3D
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 10:05:15 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4669bebc10aso320062137.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 02:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702893912; x=1703498712; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6wrxzNiJLPICSs0iPNMafimclxZEX+Zib5f22SAc0I=;
        b=NxXLkjUgg59rUaYZoiav3wd22l/2hdjh/icY7T7CsQe6dcVoHk3/UVd/PF7HJMq2Lw
         ftg/OCKfWwhIqi4h0pasP+1ydHemYoVU/KXzeAfKK4CcDqb75BeTOV+Hf8uH91RLol5I
         prg6g9tcuthDTE2+gFE8GNkJWAyRwtE5R+mHzMzPs8yBcN2tOHcS5xAIuhRI9aWsllFw
         dPsYDbpY1O+mne8UXGqAn0VVlnbVUN3F9Dzv9eqKjR6Vee/CM6ixaXnUzp3UZpV1eeYv
         MIs7izQ1Jc9ELb3IzgBpt+uaMzoSD0/vaWNM7EpChyvqR3zV85e6zzVGdg6Ya8kRARUK
         +WcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702893912; x=1703498712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6wrxzNiJLPICSs0iPNMafimclxZEX+Zib5f22SAc0I=;
        b=pM2VpjRSGHf150dUd2ia4sWKEMmkL3gWND3nmuPCZLRGyosfUqDP+Gk1o1vJPuQ8rd
         kY3Y9V5BMDbJrLq4yShRQeS9M4Y3vKahPXmj0vCV5taZctx+gGMGxdtRWA+zcj9eChHU
         M/76duf8WK++pkQMiFLdn0unTRxGNRXIkZIcQdmbq8OSVcbF+BVa0PwPATlDwlrdmTeZ
         qLJV+PP7WAJoCXPdYYDgEJRD7xHayt2lyL+GlgGJTtozgT6famv8nfh94aTjpK2TDjDa
         Ua1ErDFBnaWUoa2gVR40aIkVIllQ0uoEqR02L0/Vw+cqA/7G64gZhbQf5A29ux4Z52sS
         H2qw==
X-Gm-Message-State: AOJu0YwKaic0a5NZIMzVvmlO95l2l403ToHqa1gUoWvn2n+y+HVMmk5l
	VM/pd3uMW7ZwezMvlx4J7YeOgJ92mQpk6haM6/yL+w==
X-Google-Smtp-Source: AGHT+IHxszukyE2ttJO6zuq02rDfSZeRaEjzppPvuzY0whsH7Q37cz7BAVBbB7KrH+ZPYf13rsSeNKkUCMPPIVQXCPo=
X-Received: by 2002:a05:6102:3e8e:b0:466:5bd2:a2f2 with SMTP id
 m14-20020a0561023e8e00b004665bd2a2f2mr6539984vsv.1.1702893912242; Mon, 18 Dec
 2023 02:05:12 -0800 (PST)
MIME-Version: 1.0
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com> <20231215143906.3651122-5-emil.renner.berthing@canonical.com>
In-Reply-To: <20231215143906.3651122-5-emil.renner.berthing@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 18 Dec 2023 11:05:01 +0100
Message-ID: <CAMRc=MfovbsbxDGvheHkhE-oiXyMfpCpcqwKcZRwHbCjKvwJYg@mail.gmail.com>
Subject: Re: [PATCH v1 4/8] dt-bindings: gpio: dwapb: allow gpio-ranges
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_020514_230252_54400153 
X-CRM114-Status: GOOD (  14.40  )
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

T24gRnJpLCBEZWMgMTUsIDIwMjMgYXQgMzozOeKAr1BNIEVtaWwgUmVubmVyIEJlcnRoaW5nCjxl
bWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IEFsbG93IHRoZSBn
ZW5lcmljIGdwaW8tcmFuZ2VzIHByb3BlcnR5IHNvIEdQSU9zIGNhbiBiZSBtYXBwZWQgdG8gdGhl
aXIKPiBjb3JyZXNwb25kaW5nIHBpbi4gVGhpcyB3YXkgY29udHJvbCBvZiBHUElPIG9uIHBpbnMg
dGhhdCBhcmUgYWxyZWFkeSB1c2VkCj4gYnkgb3RoZXIgcGVyaXBoZXJhbHMgY2FuIGJlIGRlbmll
ZCBhbmQgYmFzaWMgcGluY29uZiBjYW4gYmUgZG9uZSBvbiBwaW4KPiBjb250cm9sbGVycyB0aGF0
IHN1cHBvcnQgaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1p
bC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc25wcyxkdy1hcGItZ3Bpby55YW1sIHwgMiArKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc25wcyxkdy1hcGItZ3Bpby55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc25wcyxkdy1hcGItZ3Bpby55YW1s
Cj4gaW5kZXggZWVmZTdiMzQ1Mjg2Li5hYjJhZmMwZTQxNTMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc25wcyxkdy1hcGItZ3Bpby55YW1sCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc25wcyxkdy1hcGIt
Z3Bpby55YW1sCj4gQEAgLTY1LDYgKzY1LDggQEAgcGF0dGVyblByb3BlcnRpZXM6Cj4gICAgICAg
ICAgbWluSXRlbXM6IDEKPiAgICAgICAgICBtYXhJdGVtczogMzIKPgo+ICsgICAgICBncGlvLXJh
bmdlczogdHJ1ZQo+ICsKPiAgICAgICAgbmdwaW9zOgo+ICAgICAgICAgIGRlZmF1bHQ6IDMyCj4g
ICAgICAgICAgbWluaW11bTogMQo+IC0tCj4gMi40MC4xCj4KCkFwcGxpZWQsIHRoYW5rcyEKCkJh
cnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
