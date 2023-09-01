Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEEDCA0FEC
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3LBwmpi0jr69ZFFPxLTJx3clA+MZyveZnmdIxkVM7w=; b=QeDT1nfP0T/ylw
	BuHnNpukgId9NIQeg/Qvww8GuY7IBnUuyx0E5018FjtNqcGIGwGPTnGLxlY5tHT4FQZuJpFpAa9bF
	VQI64Y7ayWwCeO1NkjDgme1ELMI0lZU2PZedB9OV9UMYi1zjU+daud9YVEXwHUh/KDQzCsAQEiiNl
	warC0QbJGun4trD9gurDjFOiTvssttvLEN026uQ9R6XzdIgSFu4mapF92Pu/TOFVWkY+RWWiOYRsl
	Iy2ISElf45hdgzDHiKN9IlWfWiBCU5pj7KHxIvpWLqtT3iTSlV3ehuEt1BxYHNi+yLfnvOmJW2V8k
	2Yd+dkRggXKnA00Osqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc7pG-000E7K-31;
	Fri, 01 Sep 2023 17:20:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc7pE-000E6X-0n
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 17:20:53 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-401bdff4cb4so22780065e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1693588849; x=1694193649; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDaCSxGqWC92if0Z6Klm60VC2KBJe3DiYPIYkSgGiOQ=;
        b=mhpgTF3LM21JhDFEW5U6ryT84SOflUm5bJexXVGRAtmox0SUTowMBHFgfLhnxIUL6+
         1xLf6pZCAx7izJbpkwEUF417Nbxr66vXO1DwXzGaDfXWVCY10rNgSGj9vaBVz9eP1Ybg
         UWsX5Ozn/sTaEv11aqn4qPypsyE9uQbrZ+4qJqxIpevor0c+A08lkfMm4VPaOg4bNRhc
         vsgy5zmHACeO3XFo6r3Cv3ACRuF+cNHei4uNYsNYQehWuluoNlkKNgh9OJ2WKrlAjfk/
         2mOTNAsc1sNpSVeGZoOR7kU8hwSu0/MBVrLUe1Rb/M0BxSVMkqEynNeNwRFwzHv9UBxi
         lf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693588849; x=1694193649;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDaCSxGqWC92if0Z6Klm60VC2KBJe3DiYPIYkSgGiOQ=;
        b=R7N6nF3S3Fc7o7N5G+tNeaWHaBODHXuX0ZZf4ctNaS0O+EauVhZvAJuLaej07/HF6Q
         ZgfBSvLlJnD8C8NtsXnbhbq72p/8ECoBMORrRf7aABLM2lhXGTmUYfcDzdGYR2MwyrMT
         oOs67O9RVsR7enpO2MRrSdmi2Fhu4W+qorI/ZCz+NVAHp04XmgFbUWiRgVwTNykg5phu
         Ebw89io2YeIc6ILO4gRzJ/CVjdioweamF4QMNedGgFsLAhlDKoMiAywWftx3brXYTXT9
         d5gNA9algZksLXrmegjN9q3ShDsO5t5QHP9w7gK26Q2yPdsooKxzFEPro20dKiJpAh+g
         pNug==
X-Gm-Message-State: AOJu0YxhbUDEHmTYO2Jq1BHcSHTWkcPIW+YZZS9JpCte0n/uWqzk2Lpq
	N8i0SEWEXPY5CKaHF5fSFxqFlg==
X-Google-Smtp-Source: AGHT+IECMKtsA+xfilTzTOfsxwiwD+SvpSlL+xDbbYz66S7ZDqBzHrbSSow55DnE6Tmpy7BohAAzHQ==
X-Received: by 2002:a5d:69c5:0:b0:317:e1a2:dccf with SMTP id s5-20020a5d69c5000000b00317e1a2dccfmr2843222wrw.62.1693588849653;
        Fri, 01 Sep 2023 10:20:49 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id m12-20020adff38c000000b0031ad5fb5a0fsm5780460wro.58.2023.09.01.10.20.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Sep 2023 10:20:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230901-remold-sublease-a1ddb1fc6348@spud>
Date: Fri, 1 Sep 2023 18:20:38 +0100
Cc: William Qiu <william.qiu@starfivetech.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-mmc@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh+dt@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Message-Id: <9EF26965-10E5-4BCA-AC5E-93C5AA55A0DF@jrtc27.com>
References: <20230830031846.127957-1-william.qiu@starfivetech.com>
 <20230830031846.127957-2-william.qiu@starfivetech.com>
 <20230830-commence-trickery-40eaa193cb15@wendy>
 <b375b88c-0d9c-30a9-21f6-283083cf3880@linaro.org>
 <20230830-procedure-frostbite-56c751f7c276@wendy>
 <efab6f52-4d7f-ea3c-0fc3-4e3ad03c14c7@starfivetech.com>
 <20230901-remold-sublease-a1ddb1fc6348@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_102052_374601_79F6B059 
X-CRM114-Status: GOOD (  20.93  )
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

T24gMSBTZXAgMjAyMywgYXQgMTY6NDIsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gCj4gT24gRnJpLCBTZXAgMDEsIDIwMjMgYXQgMTA6MzM6MTNBTSArMDgwMCwgV2ls
bGlhbSBRaXUgd3JvdGU6Cj4+IAo+PiAKPj4gT24gMjAyMy84LzMwIDE2OjM0LCBDb25vciBEb29s
ZXkgd3JvdGU6Cj4+PiBPbiBXZWQsIEF1ZyAzMCwgMjAyMyBhdCAwOToyOToyMEFNICswMjAwLCBL
cnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+IE9uIDMwLzA4LzIwMjMgMDg6NTAsIENvbm9y
IERvb2xleSB3cm90ZToKPj4+Pj4gT24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgMTE6MTg6NDRBTSAr
MDgwMCwgV2lsbGlhbSBRaXUgd3JvdGU6Cj4+Pj4+PiBEdWUgdG8gdGhlIGNoYW5nZSBvZiB0dW5p
bmcgaW1wbGVtZW50YXRpb24sIGl0J3Mgbm8gbG9uZ2VyIG5lY2Vzc2FyeSB0bwo+Pj4+Pj4gdXNl
IHRoZSAic3RhcmZpdmUsc3lzcmVnIiBwcm9wZXJ0eSBpbiBkdHMsIHNvIGRyb3AgdGhlIHJlbGV2
YW50Cj4+Pj4+PiBkZXNjcmlwdGlvbiBpbiBkdC1iaW5kaW5ncyBoZXJlLgo+Pj4+PiAKPj4+Pj4g
SG93IGRvZXMgY2hhbmdpbmcgeW91ciBzb2Z0d2FyZSBpbXBsYW50YXRpb24gaW52YWxpZGF0ZSBh
IGRlc2NyaXB0aW9uIG9mCj4+Pj4+IHRoZSBoYXJkd2FyZT8KPj4+Pj4gCj4+Pj4gCj4+Pj4gV2hp
Y2ggaXMga2luZCBvZiBwcm9vZiB0aGF0IHRoaXMgc3lzY29uIHdhcyBqdXN0IHRvIHN1YnN0aXR1
dGUKPj4+PiBpbmNvbXBsZXRlIGhhcmR3YXJlIGRlc2NyaXB0aW9uIChlLmcuIG1pc3NpbmcgY2xv
Y2tzIGFuZCBwaHlzKS4gV2UKPj4+PiBzaG91bGQgaGF2ZSByZWplY3RlZCBpdC4gSnVzdCBsaWtl
IHdlIHNob3VsZCByZWplY3QgdGhlbSBpbiB0aGUgZnV0dXJlLgo+Pj4gCj4+PiA6cyBJIGR1bm5v
IHdoYXQgdG8gZG8gd2l0aCB0aGlzLi4uIEknbSBpbmNsaW5lZCB0byBzYXkgbm90IHRvIHJlbW92
ZSBpdAo+Pj4gZnJvbSB0aGUgYmluZGluZyBvciBkdHMgYXQgYWxsICYgb25seSBjaGFuZ2UgdGhl
IHNvZnR3YXJlLgo+Pj4gCj4+Pj4gVGhlcmUgYXJlIGp1c3QgZmV3IGNhc2VzIHdoZXJlIHN5c2Nv
biBpcyByZWFzb25hYmxlLiBBbGwgb3RoZXJzIGlzIGp1c3QKPj4+PiBsYXppbmVzcy4gSXQncyBu
b3Qgb25seSBzdGFyZml2ZXRlY2gsIG9mIGNvdXJzZS4gU2V2ZXJhbCBvdGhlcgo+Pj4+IGNvbnRy
aWJ1dG9ycyBkbyB0aGUgc2FtZS4KPj4+IAo+Pj4gSSdtIG5vdCBzdXJlIGlmIGxhemluZXNzIGlz
IGZhaXIsIGxhY2sgb2YgdW5kZXJzdGFuZGluZyBpcyB1c3VhbGx5IG1vcmUKPj4+IGxpa2VseS4K
Pj4gCj4+IEZvciB0aGlzLCBJIHRlbmQgdG8ga2VlcCBpdCBpbiBiaW5kaW5nLCBidXQgcmVtb3Zl
IGl0IGZyb20gcmVxdWlyZWQuIEJlY2F1c2UKPj4gd2Ugb25seSBtb2RpZnkgdGhlIHR1bmluZyBp
bXBsZW1lbnRhdGlvbiwgaXQgZG9lc24ndCBtZWFuIHRoYXQgdGhpcyBwcm9wZXJ0eQo+PiBuZWVk
IHRvIGJlIHJlbW92ZWQsIGl0J3MganVzdCBubyBsb25nZXIgYmUgdGhlIHJlcXVpcmVkIG9uZS4K
PiAKPiBQbGVhc2Ugb25seSByZW1vdmUgaXQgZnJvbSByZXF1aXJlZCBpZiB0aGUgY3VycmVudCBk
cml2ZXIgZG9lc24ndCBicmVhawo+IGlmIHRoZSByZWdtYXAgaXMgcmVtb3ZlZC4KCkVpdGhlciB3
YXkgcGxlYXNlIG1ha2Ugc3VyZSB0aGUgZG9jdW1lbnRhdGlvbiBjbGVhcmx5IHN0YXRlcyDigJxu
ZXZlciB1c2UKdGhpcywgaWYgeW914oCZcmUgdXNpbmcgaXQgeW914oCZcmUgZG9pbmcgaXQgd3Jv
bmcsIHRoaXMgb25seSBleGlzdHMKYmVjYXVzZSBpdCB3YXMgd3JvbmdseSB1c2VkIGluIHRoZSBw
YXN04oCdLiBPdGhlcndpc2UgcGVvcGxlIHdyaXRpbmcKZHJpdmVycyBmb3Igb3RoZXIgT1NlcyB3
aWxsIHByb2JhYmx5IHVzZSBpdCB0b28gdGhpbmtpbmcgdGhleSBuZWVkIHRvLgoKSmVzcwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
