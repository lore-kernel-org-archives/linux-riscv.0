Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549F9C71151
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 15:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xx5DuAILpWE136bfy9jHFZ2nhJSNi6Q7Q/5gBosA3c=; b=G99w81i7RQZAhg
	Wnj2fZ7mnspRKIcssnegEdTBnxGt4efBBYrS+nHCZBhwOkaTcimm8KMf7y7vvjOaIDuGzHcpqAI3y
	1Az+B0ELLsjSWWYtAHIfHahIWjgt5iXbeDfVK43dA5cM+LGvCbS0IcUm+6MhgmJGBjh+ajCRF2xJj
	12Wa8QyrUI7r1JL35suQiAgeX3ntfAyPZqAPXaltkYL7g/hxheIEOzRmZaxwBpNjpMlhuolDT3+aj
	Qq76FA6XuRRLguHPK2dWdYtpdAocbeHQqHFGNfpzvPLG3GkUZY8sjrdFmENlWmMGM/dI/YdF0Jd9M
	ZeN1TAHDf04Wu6aegvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpRi-00000002buN-0W3q;
	Sun, 15 Jun 2025 15:38:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpRf-00000002bt3-39ZH
	for linux-riscv@lists.infradead.org;
	Sun, 15 Jun 2025 15:38:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso32594595e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 15 Jun 2025 08:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001934; x=1750606734; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qe6Shilu7HNdH7Cf+5SwJEQwPbJdRgtKIZLinXtUYwU=;
        b=DKuA1lFzIQGa0KZ/PzNNY4J8zvAdKD6FXuhvBcRxp56ng4gI60RUbxal9UDABQzLrP
         2o2bf4FFj27/PVYFJL9gzASnFiBcoCNMkRTOr98JcW1XzzmiIdaAf51MO6bMENWfhzWw
         yD7T1xjjJ36k0kqZoAS6KTvID2pEofniISiqAFcD/Df8W8VkDPgNawyUiLYHh9k9AaVJ
         C+duZ+c/bt5PzgiU1KyFaVhF4t/giwZScTL0VV1fithwybmfqOXMv7QQA3uPedTJ4rUg
         LGUkmASpYpe786TytxgEHoLgoX66k57BNSaLLzXhuXOhRT6xwnSN/NTeWOqwNWea/puZ
         nJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001934; x=1750606734;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qe6Shilu7HNdH7Cf+5SwJEQwPbJdRgtKIZLinXtUYwU=;
        b=FgVvtuGUm5fn/tITYz6fsRZYChbGrsvzqPVGQ5/4ik1Bqu5fV97Z+whCfIR1Va6p4i
         O5rIPDLnm0iaOsXtcHSqa5eGKWZHQTw6JNoRX+uSooo1OoYlAg4wpX9IEV5v3m8r3UHC
         ArMEF3yLP8BDvUHZJ4pvJyyTrQAsvozE5i1Xz1Rw7JDTfd4bTpJc76GQvbZ31FD2n0aD
         uonkzYtq5qJTLzj+vBxyD3C/eeBsdA1sC84VImgF3Mt55Z+0DRcOVOcdFnFpi5DFimcn
         BW2/H82HkreQ5yACFrWlIR/yE2hXIvJiXlGa/iLCnHoBN0cHjpmuGSGrsJPKwxvmR6TI
         Wnuw==
X-Forwarded-Encrypted: i=1; AJvYcCVAYaMspxUSCrzUWm9Kn08ZWKmcNeOot+C35RlX4Q6b/zX95cAYfBRNnLYQMDLkfTh9/3ehmNBoj81Erw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtO2k2Wk3idlb1v9sg5MSclNVFR9gDI+iH6bhJ0H4S6TH4V4+N
	Y4d2OabS11HiOcid/W9z4+A/l7oUCW57+7+bq8uRvlrqlKv0rZ3WsGC+
X-Gm-Gg: ASbGncsTL0bAs+tlz5HQdsjKCnCr7WHt9FkXt29cdzlK3spr6F9dYNCkSKGmhg0cmLk
	2JahAzQez+Xu0Z1266movvLdD1GeVTaB31eZTWmIbNd2udi52Sbmdc2v9jG0MXR82WzDY4Y2ihw
	J8GqJez0M+W46E6vw7CmFit5wTPgMa8WtXz9e5z4FUE8/QWnwA+H2wPYGtycw9P2JVSVDhwBvCx
	mZfDFsJKu1+AC2KIh7ZeNyIEj24lmC+VwXszG14EHwUQzjFQpxPcC7Vh2UeHTuHAcwRqoDJ2wLy
	fGL+d/rqTuZ2mv1iA67Zfz1+1dBX3WbXBoajYXt6K7NK7+7VeBasMiXcwGTxmUaMAsGYN4iR+qu
	FQIuzUA==
X-Google-Smtp-Source: AGHT+IGM1N0DYCxpTEmsEntEQYJyHGWXdzg0ibk6tQMpo/pKHCYqDtPWIrJWX2KzhfQvaFKskAJ3Jg==
X-Received: by 2002:a05:600c:46cb:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-4533ca5f35emr60057845e9.4.1750001934191;
        Sun, 15 Jun 2025 08:38:54 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e232b68sm111179995e9.10.2025.06.15.08.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:38:53 -0700 (PDT)
Message-ID: <efce5e1909ead19a46c87fa36652be70e9233161.camel@gmail.com>
Subject: Re: [PATCH v14 2/2] dmaengine: add driver for Sophgo CV18XX/SG200X
 dmamux
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Paul
 Walmsley	 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li
	 <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 17:39:06 +0200
In-Reply-To: <20250611081000.1187374-3-inochiama@gmail.com>
References: <20250611081000.1187374-1-inochiama@gmail.com>
	 <20250611081000.1187374-3-inochiama@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_083855_792378_3876F043 
X-CRM114-Status: UNSURE (   8.79  )
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

VGhhbmtzIGZvciB0aGUgcGF0Y2gsIElub2NoaSEKCk9uIFdlZCwgMjAyNS0wNi0xMSBhdCAxNjow
OSArMDgwMCwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBTb3BoZ28gQ1YxOFhYL1NHMjAwWCB1c2Ug
RFcgQVhJIENPUkUgd2l0aCBhIG11bHRpcGxleGVyIGZvciByZW1hcHBpbmcKPiBpdHMgcmVxdWVz
dCBsaW5lcy4gVGhlIG11bHRpcGxleGVyIHN1cHBvcnRzIGF0IG1vc3QgOCByZXF1ZXN0IGxpbmVz
Lgo+IAo+IEFkZCBkcml2ZXIgZm9yIFNvcGhnbyBDVjE4WFgvU0cyMDBYIERNQSBtdWx0aXBsZXhl
ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29t
PgoKU3VjY2Vzc2Z1bGx5IHRlc3RlZCB3aXRoIFVTQiBzZXJpZXMgaW4gaG9zdCBtb2RlIG9uIE1p
bGstViBEdW8gTW9kdWxlIDAxIEVWQjoKClRlc3RlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxh
bGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoKPiAtLS0KPiDCoGRyaXZlcnMvZG1hL0tjb25m
aWfCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOSArKwo+IMKgZHJpdmVycy9kbWEvTWFrZWZpbGXC
oMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+IMKgZHJpdmVycy9kbWEvY3YxODAwYi1kbWFtdXgu
YyB8IDI1OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+IMKgMyBmaWxlcyBj
aGFuZ2VkLCAyNjkgaW5zZXJ0aW9ucygrKQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
ZG1hL2N2MTgwMGItZG1hbXV4LmMKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
