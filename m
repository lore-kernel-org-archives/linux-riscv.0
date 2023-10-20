Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83533C001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 02:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VgxEeeFDaDtk45vNB6soAaTBCXZVLSbZxMfuWYocCkk=; b=RmDAmbFYb/541d
	WvP0MwZN+BOS29Ab/juA9NGPGkZ2RqlPEOQKyHEhk8ap81MNIdbMT14tB5Cksl3aK10hb1AEUUWqR
	IeKjQ0sqB0w+ScfukObcGaG7937dWQ08FMrs4YA0m+X+cvm1+TYkjQGC4IhDu2xGNhk9VVoSYYn6w
	7OGMDXCVYDnBN879itHSmNH8yv6s6e0Qy6kRYeoBA9JR1qU1BDqGQ4dtam9JR3WXDJ3hJGEDyG+cm
	zhhV8NJZBjQbkSMUP2xq0WCbKZLyQ8GcJ5fWqLLQkR+woHJbYPYwfzNBUcooDRecaFGoWfU20gNzE
	cd75K0m7L5cUF8M77PcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtfU8-0012V8-2Z;
	Fri, 20 Oct 2023 02:43:36 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtfU6-0012Uk-16
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 02:43:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cac80292aeso1709535ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 19:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697769812; x=1698374612; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDoTNufgUg8VIMedry3dGiEENRRb4/cr/7WsD8Tt8Go=;
        b=gZTs8QhxXsgZBF0jQCGiq8bK3GSYo5c8XRSpJAQEmh84Uraa4jtzRSwXV6SxYDlT0+
         rYeflHwIHkVZ+zyqK6ldk8Zp3bKFeScsiBwibiEIL7cWtyU5J9LE1uGSIsoVoqqeYxpn
         BV09Br6pKvsnAno0OWtrbgFcmtXRGewWw48SoRG4lwCcRAsPGBnIVT0zsg5HwZSLOxLy
         GX+W+T2dnRFiBwts82hPi/GKordb/GlFfibvEH4QOI0JZw2lVKtTF0RB8UhDv4cSFk7s
         QDhM3SJ/v6gFszrX4sqiItQILF6TfZqdakhqYX7MwBGKgJW64k/xaX3om2w8egOYPywy
         dhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697769812; x=1698374612;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDoTNufgUg8VIMedry3dGiEENRRb4/cr/7WsD8Tt8Go=;
        b=j2ALFyW6WbY8Ht1iUHmQaLj92h+yxLwQs7cczGQN3MZU/FVIJAe7mqVGCHquNy9Qmt
         dG72kQTmtfuJf8DG8culrmA0GwFZea5cGSqI/fTv4ccDml4hNepnkFbSCQHktHhwbNUm
         EjmkUHXEpxrdZBMHPdldsxCwwwADqSDweH71ld7GgL0V8H8ehbhxF+0xKth0c9Ex6H8I
         uXkMwMZk3HI7RkwmcVai1VsUGppqYM55NODQyOTbY0ApusBrmLscY315j6igmtRzRoOX
         1Dkeyf6ZsUhBR3jhW6kcWubaYGPx08QyZMQVwiAxcFk3GAnrvlWXpoebFPCZM76bMhBP
         HtKg==
X-Gm-Message-State: AOJu0Yyu3MDusp7mUnLqvhq/zcp0cqrLuUmamD+TEySR7gjECSDYae3E
	kLdbkwDD5A3Y6H8VuSvMBIrpiA==
X-Google-Smtp-Source: AGHT+IGXBA72PnmS62ZR4OQ5kEhD/+NqQEwfcdeZ7uNa3mZO/crAV6WwCtdwJk3FS8Io2v66p3iXrA==
X-Received: by 2002:a17:902:ed83:b0:1c5:9c73:c91c with SMTP id e3-20020a170902ed8300b001c59c73c91cmr718957plj.48.1697769812206;
        Thu, 19 Oct 2023 19:43:32 -0700 (PDT)
Received: from ?IPv6:2402:7500:5ce:a18a:15ff:8e1:37b4:22a1? ([2402:7500:5ce:a18a:15ff:8e1:37b4:22a1])
        by smtp.gmail.com with ESMTPSA id jk10-20020a170903330a00b001c3a8b135ebsm392221plb.282.2023.10.19.19.43.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Oct 2023 19:43:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com>
Date: Fri, 20 Oct 2023 10:43:26 +0800
Cc: Evan Green <evan@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>
Message-Id: <E30E7352-1FB0-4DB5-94C3-2C6FC2A6F484@sifive.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com>
 <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
 <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
 <7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_194334_398131_49BB2BAE 
X-CRM114-Status: GOOD (  14.48  )
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
Reply-To: 7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gT2N0IDE5LCAyMDIzLCBhdCAxNzozNSwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPiB3cm90ZToKPiBPbiAxOC8xMC8yMDIzIDE5OjI2LCBFdmFuIEdyZWVuIHdyb3RlOgo+
PiBPbiBXZWQsIE9jdCAxOCwgMjAyMyBhdCA1OjUz4oCvQU0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVn
ZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPj4+IAo+Pj4gT24gMTgvMTAvMjAyMyAwMzo0NSwgSmVy
cnkgU2hpaCB3cm90ZToKPj4+PiAKPj4+PiBUaGUgYFp2a2JgIGlzIHRoZSBzdWJzZXQgb2YgYFp2
YmJgWzFdLiBTbywgdGhlIGBadmtiYCBzaG91bGQgYmUgYnVuZGxlZCB3aXRoIGBadmJiYC4KPj4+
IAo+Pj4gSGkgSmVycnksCj4+PiAKPj4+IFRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcywgSSB0aGlu
ayBzb21lIG90aGVyIGV4dGVuc2lvbnMgd2lsbCBmYWxsIGluCj4+PiB0aGlzIGNhdGVnb3J5IGFz
IHdlbGwgdGhlbiAoWnZrbmhhL1p2a25oYikuIEkgd2lsbCB2ZXJpZnkgdGhhdC4KPj4gCj4+IFRo
ZSBidW5kbGluZyBtZWNoYW5pc20gd29ya3Mgd2VsbCB3aGVuIGFuIGV4dGVuc2lvbiBpcyBhIHB1
cmUgbGFzc28KPj4gYXJvdW5kIG90aGVyIGV4dGVuc2lvbnMuIFdlJ2QgaGF2ZSB0byB0d2VhayB0
aGF0IGNvZGUgaWYgd2Ugd2FudGVkIHRvCj4+IHN1cHBvcnQgY2FzZXMgbGlrZSB0aGlzLCB3aGVy
ZSB0aGUgZXh0ZW5zaW9uIGlzIGEgc3VwZXJzZXQgb2Ygb3RoZXJzLAo+PiBidXQgYWxzbyBjb250
YWlucyBsb29zZSBjaGFuZ2Ugbm90IHByZXNlbnQgYW55d2hlcmUgZWxzZSAoYW5kCj4+IHRoZXJl
Zm9yZSBhbHNvIG5lZWRzIHRvIHN0YW5kIGFzIGEgc2VwYXJhdGUgYml0KS4KPiAKPiBGb3IgWnZi
YiBhbmQgWnZrbmhiLCBJIHVzZWQgdGhlIGZvbGxvd2luZyBjb2RlOgo+IAo+IHN0YXRpYyBjb25z
dCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZiYl9idW5kbGVkX2V4dHNbXSA9IHsKPiAJUklTQ1ZfSVNB
X0VYVF9aVktCLAo+IAlSSVNDVl9JU0FfRVhUX1pWQkIKPiB9Owo+IAo+IHN0YXRpYyBjb25zdCB1
bnNpZ25lZCBpbnQgcmlzY3ZfenZrbmhiX2J1bmRsZWRfZXh0c1tdID0gewo+IAlSSVNDVl9JU0Ff
RVhUX1pWS05IQSwKPiAJUklTQ1ZfSVNBX0VYVF9aVktOSEIKPiB9Owo+IAo+IFdoaWNoIGNvcnJl
Y3RseSByZXN1bHRzIGluIGJvdGggZXh0ZW5zaW9uIChzdXBlcnNldCArIGJhc2Ugc2V0KSBiZWlu
Zwo+IGVuYWJsZWQgd2hlbiBvbmx5IG9uZSBpcyBzZXQuIElzIHRoZXJlIHNvbWV0aGluZyB0aGF0
IEknbSBtaXNzaW5nID8KCldlIHNob3VsZCBub3QgYnVuZGxlIHp2a25oYSBhbmQgenZrbmhiIHRv
Z2V0aGVyLiBUaGV5IGFyZSBleGNsdXNpdmUuClBsZWFzZSBjaGVjazoKaHR0cHM6Ly9naXRodWIu
Y29tL3Jpc2N2L3Jpc2N2LWNyeXB0by9pc3N1ZXMvMzY0I2lzc3VlY29tbWVudC0xNzI2NzgyMDk2
CgotSmVycnkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
