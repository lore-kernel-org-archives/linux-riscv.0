Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5E8C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqpD8thO0be0GwGbPSKbvelel++zDJ+Vdl35wI+41PM=; b=PYpu7Ec+vt6qas
	lLL/OE5SMPQll9iuHIWHN9N4AKCsPLoD5gHgA4waXOf2RPZs1BSmFzd15nFTt5ref6kDrKFwktDpq
	bbeFx6rkyn75FHyBl6YU5XayaBhAuKeLdwYuIDRFclajdL5G02FaqiJdVRFNAbuaOmRvf6qDc6kiX
	u6fVbLl0kk4UMdkf5+9RuWNK38K1ymkFKGQUt507wZMeUtLIHMD8OMalexV5tp2iwEfkJtAR3HoMJ
	AYfCdVaORPShKl37Y2gs7FcoOJuxev7bee0II14D0uvvVGwCiWgAsSBS7NJDcG3hSyGSjrhrL7giQ
	Fs/hTxq26ca7XLVdOkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxpR-000000040RF-3i89;
	Mon, 17 Feb 2025 09:54:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxTm-00000003wCX-0CRk
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Feb 2025 09:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qwwfQspqK1CIaepn5O3N48Xj/62KJzh4txop3uOMjDc=; b=bpnwT3TBPfxHuldgmgRHUSJ9Y6
	YTh3jnRQhRrfUTBoCCdec2apuNH4gfN2JIXpMQN7jxtbkmskGHzXy4O0ScvQHRfyJIcpFqcZFSWj1
	WPDLh9LSOCGbzHWBVqgLqi6Xn0jsRSNItF7DELFMyRiggjrMF0IBfqHiAJGf7LSBjsnXqYT7s0FuU
	2i7w+cDfeXPNsEZzpOvM1GqkGPWnz5MIUap6pr5whiVQejjVgyiNEaU5eSn8Js6lDuiAytu3yfyx5
	lq4s/tdLU0jeZOXRSL0rCHVdbm0h0nKZfDr+f06FahDKk26nGJL3iZOrv/oQ257GTUlRld2y4el8f
	4blxDAbQ==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxTi-00000001l29-3Yx3
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 09:31:52 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abb8e405640so153548566b.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2025 01:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739784708; x=1740389508; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qwwfQspqK1CIaepn5O3N48Xj/62KJzh4txop3uOMjDc=;
        b=ku9xMDoXZejZ95TEFU/hbByLiQd6gewzh629cECirpRtSy4ufszKoz7ILt5BAaRoAJ
         AIHaZlapKtSL8t5fxfhqPYp8ue/5SOAK5Khl6BQ6lGUaOp2/HHaAT2ImcyVuKXFFOfqg
         ARCrlPboW6Hs2CuA2KFAcgOfnxuwF/m7FCsuA4Ord36DLjebHGsUwgVhGZoh1cnAOsda
         xI+KejyfXiK7oT8HR3L8yYlK4CPIj+ZqLGXM5T8WHnx2vh7izIPK9BGD91EeJ4jrWctE
         kHD5KKESQ3k7MKxCDQhvIeyrY9I0LZ6l9BtGk83c0CsGy4B3eM/ViOHAqnDTAXBLplnT
         emOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739784708; x=1740389508;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qwwfQspqK1CIaepn5O3N48Xj/62KJzh4txop3uOMjDc=;
        b=voeq4glhbltIJQkhsXyO1IkaR/XyFZXkVgFhxIrmD5UybwrX/sKPcj+dcVHDWSPqO9
         i+xB+i2x+gg/jRUIfBGhVPSdVJDzH0YTiMQWtGrQT3h6IQrC1HSy2rpwtYTp9Uk8GN1B
         0458hBGeM5/cZFf5qa20ZJRFqLdA6GLOvU/rZEaxzF/DUjjWmhsuQfdkqZpqn7HZYcJr
         njonal+zHrFXoZbFTqtTLSlZW25BWgUEYmiBRXv9LHlvHONMLlLwITy8Ioej2rBc8FCN
         ukOyQEp3c8FyS103qjKdsEILZt/t/inaGK7y0ZyGujp+D2bQcF+LqTryEKcYmzD7aQNu
         Zmvw==
X-Forwarded-Encrypted: i=1; AJvYcCWihWgu41i0o8O9hAm8k4puPZ9TY7iAlZSscix0C7vcI6wsFyP47qnmq55BGPhfYgDcgDGkneuBkeBgNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr9OrIw7tO1SBVWLC/ReAiOAy6jBBcgGkhVHOcNNCPM/hCvyNf
	++D7/Lb1HfzZiOGv+dUS1o/PVOMlJZx9Lg49HjxQndY36wqR0pZS
X-Gm-Gg: ASbGncscrTmFnG1BMNqbh68N8Qx3ZemSz6lLZ1m0CgU+IOW6bBbB+Pu3IPawQ2z8sLY
	kRlIdZcpxEPLoDrT7guZfUqIMwoncWgNZfTW6GMyiwJX9vpCdmAg0U3enIBcbE7cuDVq7GpwpNp
	p7DgGJQV/w74JR6uBUizITE0Izh/dJUfXsqq1odBbI+zMFNtb9F0JTotOg+trqg/zQUUd9t0zgX
	NMksvELjChvS+q1sfiX6U7aZqvX9Z9S/uBM3aulIeF2TwtOVCPxJvNtuLqkvtodoKSftLS21pIt
	Owafb8t6B9LK3qEPgrixja3F6A99slh0
X-Google-Smtp-Source: AGHT+IF19rIOBPRe3FreKmfKhGzofepgR2PC8/BYqtWn5SXsysFWGgg87ztwsvGb53f3Baqru+RpWg==
X-Received: by 2002:a17:907:3d8e:b0:ab7:4641:a72d with SMTP id a640c23a62f3a-abb70de28admr913177666b.51.1739784707261;
        Mon, 17 Feb 2025 01:31:47 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba64fbabfsm75995966b.172.2025.02.17.01.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 01:31:46 -0800 (PST)
Message-ID: <3ba76f2162841ab91ef823315e7ce4b5b7526984.camel@gmail.com>
Subject: Re: [PATCH v11 1/3] dt-bindings: rtc: sophgo: add RTC support for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Jingbao Qiu
	 <qiujingbao.dlmu@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, dlan@gentoo.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, 	linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org
Date: Mon, 17 Feb 2025 10:31:43 +0100
In-Reply-To: <MA0PR01MB567164E6BE03750F2200CBDBFEFB2@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
	 <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
	 <MA0PR01MB567164E6BE03750F2200CBDBFEFB2@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_093151_019458_2CA61A0E 
X-CRM114-Status: GOOD (  16.68  )
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

SGkgQ2hlbiEKCk9uIE1vbiwgMjAyNS0wMi0xNyBhdCAxNzoyNiArMDgwMCwgQ2hlbiBXYW5nIHdy
b3RlOgo+ID4gQWRkIFJUQyBkZXZpY2V0cmVlIGJpbmRpbmcgZm9yIFNvcGhnbyBDVjE4MDAgU29D
Lgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtv
emxvd3NraUBsaW5hcm8ub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogSmluZ2JhbyBRaXUgPHFpdWpp
bmdiYW8uZGxtdUBnbWFpbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgU3ZlcmRs
aW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+IMKgwqAgLi4uL2Jp
bmRpbmdzL3J0Yy9zb3BoZ28sY3YxODAwLXJ0Yy55YW1swqDCoMKgwqDCoMKgIHwgNTMgKysrKysr
KysrKysrKysrKysrKwo+ID4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKQo+
ID4gwqDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3J0Yy9zb3BoZ28sY3YxODAwLXJ0Yy55YW1sCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3NvcGhnbyxjdjE4MDAtcnRjLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3NvcGhnbyxjdjE4MDAtcnRj
LnlhbWwKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmIz
NmI1MWE2OTE2Ngo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3J0Yy9zb3BoZ28sY3YxODAwLXJ0Yy55YW1sCj4gPiBAQCAtMCwwICsx
LDUzIEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9ydGMvc29waGdvLGN2MTgwMC1ydGMueWFtbCMKPiA+ICskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsK
PiA+ICt0aXRsZTogUmVhbCBUaW1lIENsb2NrIG9mIHRoZSBTb3BoZ28gQ1YxODAwIFNvQwo+ID4g
Kwo+ID4gK2Rlc2NyaXB0aW9uOgo+ID4gK8KgIFJlYWwgVGltZSBDbG9jayAoUlRDKSBpcyBhbiBp
bmRlcGVuZGVudGx5IHBvd2VyZWQgbW9kdWxlCj4gPiArwqAgd2l0aGluIHRoZSBjaGlwLCB3aGlj
aCBpbmNsdWRlcyBhIDMyS0h6IG9zY2lsbGF0b3IgYW5kIGEKPiA+ICvCoCBQb3dlciBPbiBSZXNl
dC9QT1Igc3VibW9kdWxlLiBJdCBjYW4gYmUgdXNlZCBmb3IgdGltZSBkaXNwbGF5Cj4gPiArwqAg
YW5kIHRpbWVkIGFsYXJtIGdlbmVyYXRpb24uIEluIGFkZGl0aW9uLCB0aGUgaGFyZHdhcmUgc3Rh
dGUKPiA+ICvCoCBtYWNoaW5lIHByb3ZpZGVzIHRyaWdnZXJpbmcgYW5kIHRpbWluZyBjb250cm9s
IGZvciBjaGlwCj4gPiArwqAgcG93ZXIgb24sIG9mZiwgYW5kIHJlc2V0Lgo+ID4gKwo+ID4gK21h
aW50YWluZXJzOgo+ID4gK8KgIC0gSmluZ2JhbyBRaXUgPHFpdWppbmdiYW8uZGxtdUBnbWFpbC5j
b20+Cj4gCj4gSSBndWVzcyBKaW5nYmFvIHdpbGwgbm90IHRha2UgdGhpcyByb2xlLiBJZiBoZSBk
b2Vzbid0IHJhaXNlIGFueSAKPiBvYmplY3Rpb25zLCBwbGVhc2UganVzdCBjaGFuZ2UgdGhpcy4K
PiAKPiBKaW5nYmFvLCBkbyB5b3UgaGF2ZSBhbnkgY29tbWVudCBvbiB0aGlzPwoKTmV3IHZlcnNp
b24gd2lsbCBsb29rIHJhdGhlciBsaWtlIHRoaXM6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LWRldmljZXRyZWUvMjAyNTAyMTYxODA5MjQuMjUwNjQxNi0xLWFsZXhhbmRlci5zdmVyZGxp
bkBnbWFpbC5jb20vCgpCdXQgSSdsbCBiZSBoYXBweSB0byB0YWtlIHlvdSBzdWdnZXN0aW9uIGFu
ZCByZXBsYWNlIG15IG5hbWUgaW4gdGhlCm5ldyB2ZXJzaW9uIHdpdGggc29tZW9uZSBtb3JlIGFm
aWxpYXRlZCB3aXRoIFNvcGhnbyA7LSkKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
