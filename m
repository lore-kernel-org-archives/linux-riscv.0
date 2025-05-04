Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB30CC369DC
	for <linux-riscv@archiver.kernel.org>; Sun,  4 May 2025 10:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZtSXCOETj0xf9CVY91NhvmSAOKUDf07AhvBPRPKM3Q=; b=FjUwP8xVFqEqHm
	KNWhk1Sx+lrTS0NHddZcqExpVncypn0Gp3ormgaP2FCF5m8TedtC3pDdKsME7VCuu5xFTjOyguBtg
	ouV0gb1xEUKDevNhbr318TBXyNXTA/KZM7tVb/Ospqsy3CK4oTDNBFle9CO93PX7adQPrzDo460vy
	Fx8UBEsr7S8KuUZWZacJ0Kee5dvzkrUccN42KQ7/scWteEOolcYhWHDK4OqbAHTyhQYIsK1s4nNMz
	qXxAkWTDUxgqne1LKpxEcANw0cTeCHgWGRO1YHzlkI8C2zkJxnox58EW0mAfAKBByEQb56mpTlWJY
	hzcCaUfYt6mGlsje4Etw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBX0X-00000005DBq-3HsQ;
	Sun, 04 May 2025 10:55:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBX0V-00000005DAw-2B3T
	for linux-riscv@lists.infradead.org;
	Sun, 04 May 2025 10:55:40 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac2c663a3daso678014866b.2
        for <linux-riscv@lists.infradead.org>; Sun, 04 May 2025 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746356138; x=1746960938; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JHticgXyIuVL8fJ2I1XWOAHd1k7KFWJZtBwgTOARLQE=;
        b=lje+hdl+s6r9XCTEtd+cqJETPFoWJzY2lACico5OyMmYKMOS3nhksVbOhBeIRLUdzv
         +82aZLm52Dd534Bmb2m2DUjAKZn27d0bFs1oZbhi/qYbzzvn56xhugMKdMzEmm/eSl+P
         FSPl6aUMbfYoR9uymbTeb3dWrZ13MXaRSinjngG5O/HlfaNPS+OAlGheoiVVM90qXvwL
         Bw4vH43p6UmIOovOw3ZdslaraGQjsMpnilxDTS3vkHhZRsYRy8BHGuKbonOxgHM1RsHK
         AxfquhUbOZ69uMBhN6s9zw0HL/jb1jW9DA/AR111X3IaEM1RZssfGZk3eh6KsNp0FKMX
         YXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746356138; x=1746960938;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JHticgXyIuVL8fJ2I1XWOAHd1k7KFWJZtBwgTOARLQE=;
        b=cKWV95Ktm0dVQ9tFt3gFO1VZVoC2CP1y1u3nnnSvH0xtydfv1+97SuoeRPBxdKz8MY
         HiTh0jnVZfdh4LRf+pQFIlobHVtNe1J84uPWEZY79F3STFUjQOWViksBf1CO7MF5z8bz
         TOFnYNhXBjRWdf4apFZKf8/ZEkXy9N+IMETeKAjuF47YA572dM9K7ZPikvbEnw8ly4r+
         9pE9Wgh4xvK4ZlnsogwY9YBenwXtYezgRbm9Brv9dujBhKqlEzTGu2ZnfQwfsCgLSns9
         TQm6OD9m8aPFDRSnGFcZaJSa61R02hmdD62YB+PbRMp2KJT+TbSJ+OmuNAQ3F7do2ytD
         JZMg==
X-Forwarded-Encrypted: i=1; AJvYcCWAqSs3J679+JQ0B/9YWrIZew2A8RXu5OjNeH52y8VC1xhmlu6kvDgE7pN9yi4iOJ/PULV5RdOzO36yuw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz+uH2Jd0n1zdi50LLpnw4/23l5VQQMAsS/RyIZ2lTEO6NFXP1
	iBCYSVfRQmdn2bAIvaLwuvXJP9OmknxLuHR5sn888Y+fv9+1N3Oe
X-Gm-Gg: ASbGncswWFa3BQn5YrEnUUwQyzfcptA0cGDS78J21+rdHirOaxTT7KRjjRNmkLgoRcj
	aOVBLaUQYcw9C5EN0Zxq0PlPJIbH9N2mBAKetesfV9W0QqenfA4eLdvHjHs2wol31DkdGDu8p12
	iT73la3jOR4BoigzT5+JUpaH6V0VFSEGxR+QfRfDIqmZ3muCqcRB0p0U0NGnnLicApqMvSzQxaf
	KlYV5rSM/XneTEaWaw+XoQik+FD5ZxKHuF9z9+lwMh7BxwcPdEYp9ZOakB3eoUb58hWwewMx74y
	O1UEMi6jRG9dFRFaoS114rapWZ8TRjFb2opFL8uaexpG0178KW+7ipF2dcyLHqzIaEAqiEQ=
X-Google-Smtp-Source: AGHT+IGPBRqZ8nAL71n+j3b7Cwv7/Y14UgPdPJpAj77aNr8QGSe9maFrY5B6bcLyEAGl4PoeZoym2g==
X-Received: by 2002:a17:907:980d:b0:ac7:d23d:b3ac with SMTP id a640c23a62f3a-ad1a4b3773amr291859166b.53.1746356137751;
        Sun, 04 May 2025 03:55:37 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147329sm313852266b.1.2025.05.04.03.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:55:37 -0700 (PDT)
Message-ID: <284f4158408d4047a52d427c9189910064b24d97.camel@gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: switch precise compatible
 for existed clock device for CV18XX
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Sun, 04 May 2025 12:55:41 +0200
In-Reply-To: <20250504104553.1447819-4-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
	 <20250504104553.1447819-4-inochiama@gmail.com>
User-Agent: Evolution 3.56.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_035539_554647_ACB9259F 
X-CRM114-Status: UNSURE (   8.03  )
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

T24gU3VuLCAyMDI1LTA1LTA0IGF0IDE4OjQ1ICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+
IHJlcGxhY2UgbmV3bHkgYWRkZWQgcHJlY2lzZSBjb21wYXRpYmxlIHdpdGggb2xkIG9uZSBmb3Ig
ZXhpc3RlZAo+IGNsb2NrIGRldmljZSBvZiBDVjE4WFggc2VyaWVzIFNvQ3MuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5
OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+Cgo+IC0t
LQo+IMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNpIHwgMiArLQo+IMKg
YXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODEyaC5kdHNpIHwgMiArLQo+IMKgYXJjaC9y
aXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDAyLmR0c2nCoCB8IDIgKy0KPiDCoDMgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKLS0gCkFsZXhhbmRlciBTdmVy
ZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
