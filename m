Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118EBCAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2xGpcXqBgiWl1Ds+hTKenDJv3Ei1DXYnk5SjKcZy8k=; b=cjbdTsajceqNDj
	F3vPJM+2RCOSxAuI4gPTEMmnFO1PUX2zgFiWCTkqIn+Mrs3KVR47uzPcHPrVMYhmhRcQzhVgiWGXN
	a0l2SCCAS39Y6S/1Qch7qTR6khvm2Tf5NLnXqjiVbAlbbKVR5QSyZIYxAGmk0T8AgXHxkhrZuBNOu
	nObCnta+QTgtPB4AC5o9rA1QFA4DJX+KPUIwSVAjd86U5XqJo3h9V6MF6xp97xlQGs72RkZIUxHZt
	fifgEwuEDORhZiWj07NySXqBNrigBijjPXZg4/DrAu7uRZsuK0/m9shZiYephHp4N4oYiFm1w/g+Z
	n74fZGyseiAEolli67vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M9t-0000000Aper-2YHw;
	Thu, 02 Oct 2025 16:27:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M9r-0000000ApeW-0gVo
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 16:27:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-269639879c3so10070295ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Oct 2025 09:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759422474; x=1760027274; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MIx1cgazS4vSFCcdU3NLCPECgs+mJUW/PomE8mLbHI=;
        b=a6PPrys9ZgbNP/cZYdofCnoNyGET8T+m/6lUZTP66rDG9n06gvltDgGP1EBjvG3zlR
         J/Jmg4+zQPzI3k6TP14QNv/Ja1dujSl7M6GpLuaE764nJNd19P6MZBENSTuU7zFzYd/A
         lJo7vhslm+hautHuM/Y8sCqCwzERXDqjNHIM0Oq3aBbNrBMbpfm2AuW6+ErBLTHUiSHt
         D/bmLLhuTKjmtDpJKT24wMZJl424sCcJ+3FjNNyJOAw69gdq3GCjTVrdx6Jispu4TKjd
         Cth/p4JDD19CAHmBcj6lWYubB3+HFREIprVzXpF25lYpnM2x5kjnPehBtNANL6r8+lkn
         vSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759422474; x=1760027274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MIx1cgazS4vSFCcdU3NLCPECgs+mJUW/PomE8mLbHI=;
        b=hiFa0r/Fp8IX0k/5lIk47A8zKwis2RaBGkg3DCWbUJqYtdLJmUi1ldrn0Qcx3wJEHu
         QycVbFhcgsUn7MI1H+DsvdCwH9Xl6vrhdhw8vOppZp2Cejb7wY8RekUeb5ePQysXjuSN
         u7/0SC6H04h2Q+M8gUGzP+zxo4srJ0mYwCBEA1bLGJcY4yxyUuXuJSslihHO4JW8ht66
         FjRUC0vnKoe6cLq6klre1sK5MH6lc0jIyUH1jcRnyd/QJJRIttcf5pdo64luoPHLCB0g
         NsTdN0YJ485H/cqluHaXs+M/TGwj1lv10n0HU3x5O10IjkzprdkaEalvFQXPntmwzOlS
         OopA==
X-Forwarded-Encrypted: i=1; AJvYcCW249pln60Bb6u4CgEnp5rz0my4XrMsXjemEzkhzBDknQUCo6eqs1o00xOTJyKAzrXm8wtKYd26DTiePA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0VAVnsrqhYv2SCenkOuAuI/0HAIrlYCrKECSpj2KdHrUXwN5D
	0D70mbliLYyllQc5ESYZqGSJb9cx3m4QsiOBqNo4KlKAdv6AK3qcU+lVsFPxbJKBx1264D5QTRt
	sTeueR4JMJmjoE+nadf6/z5m23k7N1Rw=
X-Gm-Gg: ASbGncvNTr/Xg8Dii/r8c9eZnO972jOeKpYOzEb8bfXgvPLJrCkS2ir8OnD/KJedF5o
	znBCszZMm7iU+dE0ypovrxXmHL+J+HvuZWHeRARtNA/mKASz4RPr8uAsfiTS7aumBcYaKSLnE3S
	1jWbVEIe3wEYP1+rW2lovGjHzU9g23TIzw5ulCLcUHQyE8iuKlqiBAq1n7z3Qb8pLd4ZjOG77IO
	20QiiocBg5HkFgkFWBPDCWhaEKb8Bg=
X-Google-Smtp-Source: AGHT+IE264pwEl1Py+B5Xh9WvrM0/n0gzZfa2yw7thnQZLAo0gAAHCDysz98mjnnKEJ1frpS6mNIZHS1sZMZP+3Dyfg=
X-Received: by 2002:a17:902:f54f:b0:278:bfae:3244 with SMTP id
 d9443c01a7336-28e7f31f073mr119647195ad.54.1759422474219; Thu, 02 Oct 2025
 09:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250729141142.13907-1-e@freeshell.de> <20250819-sushi-change-1254c2d2a08d@spud>
In-Reply-To: <20250819-sushi-change-1254c2d2a08d@spud>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:32:49 -0400
X-Gm-Features: AS18NWBxdQwDblikz4B95tTiZeIyNZADBMQZlumlTwR7d0S68rpJfqzNjYf7xEo
Message-ID: <CALC8CXcAGobb__cs65bPT-vL-YVbpG-4f0j6FuiTgANFY7uw=w@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: starfive: jh7110-common: drop no-sdio
 property from mmc1
To: Conor Dooley <conor@kernel.org>
Cc: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hal Feng <hal.feng@starfivetech.com>, Minda Chen <minda.chen@starfivetech.com>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_092755_203385_0B12183C 
X-CRM114-Status: GOOD (  17.01  )
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

RSwgQ29ub3IuClRoYXQgd2hpdGUgYm95IHlvdSB1c2VkIHRvIHBsYXkgcGFpbnRiYWxsIHdpdGgu
CgpPbiBUdWUsIEF1ZyAxOSwgMjAyNSBhdCAyOjEz4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVsIDI5LCAyMDI1IGF0IDA3OjExOjM1QU0g
LTA3MDAsIEUgU2hhdHRvdyB3cm90ZToKPiA+IFJlbGF4IG5vLXNkaW8gcmVzdHJpY3Rpb24gb24g
bW1jMSBmb3Igamg3MTEwIGJvYXJkcy4gUHJvcGVydHkgd2FzCj4gPiBpbnRyb2R1Y2VkIGZvciBT
dGFyRml2ZSBWaXNpb25GaXZlMiBkdHMgdG8gY29uZmlndXJlIG1tYzEgZm9yIFNEIENhcmQKPiA+
IGJ1dCB0aGlzIGlzIG5vdCBuZWNlc3NhcnksIHRoZSByZXN0cmljdGlvbiBpcyBvbmx5IG5lZWRl
ZCB0byBibG9jayB1c2Ugb2YKPiA+IGNvbW1hbmRzIHRoYXQgd291bGQgY2F1c2UgYSBkZXZpY2Ug
dG8gbWFsZnVuY3Rpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRSBTaGF0dG93IDxlQGZyZWVz
aGVsbC5kZT4KPgo+IEknbSBnb2luZyB0byBhcHBseSB0aGlzIG9uZSB0byBmb3ItbmV4dCwgdG8g
Z2l2ZSBpdCBtb3JlIG9mIGEgY2hhbmNlIHRvCj4gc29hay4KPgo+ID4gLS0tCj4gPiAgYXJjaC9y
aXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kgfCAxIC0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1jb21tb24uZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNpCj4gPiBpbmRleCA0YmFlYjk4MWQ0ZGYuLmIx
NTZmODcwMzAxNiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUv
amg3MTEwLWNvbW1vbi5kdHNpCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZl
L2poNzExMC1jb21tb24uZHRzaQo+ID4gQEAgLTI5MCw3ICsyOTAsNiBAQCAmbW1jMSB7Cj4gPiAg
ICAgICBhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDw1MDAwMDAwMD47Cj4gPiAgICAgICBidXMtd2lk
dGggPSA8ND47Cj4gPiAgICAgICBib290cGgtcHJlLXJhbTsKPiA+IC0gICAgIG5vLXNkaW87Cj4g
PiAgICAgICBuby1tbWM7Cj4gPiAgICAgICBjZC1ncGlvcyA9IDwmc3lzZ3BpbyA0MSBHUElPX0FD
VElWRV9MT1c+Owo+ID4gICAgICAgZGlzYWJsZS13cDsKPiA+Cj4gPiBiYXNlLWNvbW1pdDogMDM4
ZDYxZmQ2NDIyNzhiYWI2M2VlOGVmNzIyYzUwZDEwYWIwMWU4Zgo+ID4gLS0KPiA+IDIuNTAuMAo+
ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
