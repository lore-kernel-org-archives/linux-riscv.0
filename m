Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ED7E77180
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 13:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDsHtjN4/f2RBmCy9k/wIFGfe/JOsKR41Q1MZQn34Hs=; b=i3PFOOSqUwWJik
	cn2TxJoAxNm4pJYaLcLjk2u/DV1T4Hc/Pfg4mQ8uwOGzIj840Cu0ttOwWZ5Wy9D1QZT0Ucb/V2awY
	3aOVfReY+zeW0IHcOBTjBFlNHm191hpIzmBELR4QTLAV+WBq0Gi4ztr7QkRp38KHB91kCARUZQVAC
	wcZz2iGpedXesfo8ca0NDEX3e8oWjBknbzDzhxkTG32UxecCokBKHfxmDyORYOoG6QwEMcFWl7Orf
	SLG+KIY+dZs2MLPWcveDDWaRWHPA7pPpWGE3VINXtE/ExyubNn5PVz0ctTGrMW3TYGVuuPhQvzIGr
	sIwxtzntWJe1JB72b6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjQ5-00000000Vk1-3Dbn;
	Thu, 12 Dec 2024 13:39:57 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjPF-00000000VWd-3DfA
	for linux-riscv@lists.infradead.org;
	Thu, 12 Dec 2024 13:39:07 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5f2dee7d218so276521eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Dec 2024 05:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734010741; x=1734615541; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZFpmuGq8Hcysw1ltCrcXIg/0YmimJ8vHdWx8dLQ+nM=;
        b=leYFo4mS2UM8CYWDcXQaUOWPKVEBfeZe9t+h9lfabnEDTOnhipLMDXAKwvCFUgnEP/
         PZPi7FqbSUpjTseu8yJbGEMyX/8RwBDMQAIYHHPmx4CyqTe1aj20kNaIjGXtCrihPpuq
         YeEXIBMaeQd/5lepEsbmiqqH1YgbP+ZK9Bh1x+R59Xwg/ytfdr+5BcBV9vOQU358roSe
         UtKGpONJloH4NDNB57XwA8d2+50yohJpKYoVBuiqLUA77yHdOjpKC4HFoWStYtrQ3/GS
         l9BnmrBuE2h2uPWKkCZJqfruM/oHYrP8jfsduK7fF6j6c31AnBJu3EGu4t/PSSxoZgK1
         gICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734010741; x=1734615541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZFpmuGq8Hcysw1ltCrcXIg/0YmimJ8vHdWx8dLQ+nM=;
        b=wPif07OGLbZ+L0kqTrznwqDoGoAwUkg6YO0lKqxMo9ndF80OHOuh2Ekm6LyrA+BLf2
         /n0cULIJPw2PhMWsteycrWrDDtkoKcKKXMQK/ZVOhTe4o0TKAYOeIdC6EakECc/fql4L
         YTyzcM3O5yE6lqmQjEtdzYbzWJweS3YoROvxeKO/lsRiUunqRnCMyqTmUzjRRkuudLng
         bd3Bn9rjozHRL3lDUpAJNgHjpenKSDDS7Qj1Ai9pQTAxBTAz4eSwpf0/ymc8tpsYS4+b
         AO6jghdPsuYAZe2bDScIAbHMatF1xpLR0Rd4Aw2cH/r1+hB+qZackLh4vl94tGeQi3EH
         D4dw==
X-Forwarded-Encrypted: i=1; AJvYcCUeGNFSt/9ZXZniAi0oJ83iAA6NxdQyZWZOLfMi0ZneapxRRmZO5PJ/46w9BZw+qEzYP4ElM36oaArCWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9/bPoNHVtkNOqycmXDUae97FQ+Lx9WIsi12Q3S6HUiQlS+uaY
	wgh7y+i44N4aHt/wpRpFDZBC4FyzcIYQRTUwfuaH+p0dBkY7AW+7GV0JYd04V/pn14Qj2PwrxB4
	uhjSDYipOU8fa9m93z9y/hHC95OK209KHIXvFGQ==
X-Gm-Gg: ASbGnctDlcTiHY4pajh9o6i0KYVY3WDD6upgcy8pPclipfi5K6sfLJSYFOaLNMiXE8Q
	OzhsMh/Qgw9iNfIxqA8JMt/QFGXaUrWzEQxgakhpe
X-Google-Smtp-Source: AGHT+IHD6Qcrh2srXPJLHbja5JHfzEhRV/ZpqJWPNHK2/yvOTs/tJi6K/af6ItiRmPRwJ5PEr5Zhb5P3EQeLDRyb/Zw=
X-Received: by 2002:a05:6870:9a1c:b0:29e:6bcd:3ba7 with SMTP id
 586e51a60fabf-2a012d99e0cmr3460926fac.28.1734010741230; Thu, 12 Dec 2024
 05:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20241212131134.288819-1-alexghiti@rivosinc.com>
In-Reply-To: <20241212131134.288819-1-alexghiti@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 12 Dec 2024 21:38:50 +0800
Message-ID: <CAEEQ3w=siNTV4DdVj3N4tW5xBKR-WWByeSxL89_EyC0v=6YNMQ@mail.gmail.com>
Subject: Re: [External] [PATCH] MAINTAINERS: Add myself as a riscv reviewer
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_053905_818935_F5A9CEEE 
X-CRM114-Status: GOOD (  12.15  )
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

SGkgQWxleCwKCgpPbiBUaHUsIERlYyAxMiwgMjAyNCBhdCA5OjEy4oCvUE0gQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFRoZSBnb2FsIGlzIGZvciBt
ZSB0byBnZXQgYSBrZXJuZWwub3JnIGFjY291bnQgYW5kIHRoZW4gc2VuZCBwdWxsIHJlcXVlc3Rz
Cj4gaW4gb3JkZXIgdG8gcmVsaWV2ZSBzb21lIHByZXNzdXJlIGZyb20gUGFsbWVyIGFuZCBtYWtl
IG91ciB3b3JrZmxvdwo+IHNtb290aGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdo
aXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBNQUlOVEFJTkVSUyB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9NQUlOVEFJ
TkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggMTdkYWE5ZWU5Mzg0Li4xYzc4Mzg2NDIzOTggMTAw
NjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC0yMDEwOCw2
ICsyMDEwOCw3IEBAIFJJU0MtViBBUkNISVRFQ1RVUkUKPiAgTTogICAgIFBhdWwgV2FsbXNsZXkg
PHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KPiAgTTogICAgIFBhbG1lciBEYWJiZWx0IDxwYWxt
ZXJAZGFiYmVsdC5jb20+Cj4gIE06ICAgICBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVk
dT4KPiArUjogICAgIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4KPiAgTDogICAgIGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiAgUzogICAgIFN1cHBvcnRlZAo+ICBROiAg
ICAgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L2xpc3Qv
Cj4gLS0KPiAyLjM5LjIKPgo+CgpUaGFua3MgZm9yIHJldmlld2luZyBtYW55IHBhdGNoZXMgYmVm
b3JlLiBJdCBzb3VuZHMgZ29vZCBhbmQgSSBhbHNvIHN1cHBvcnQgaXQuCgpUaGFua3MsCll1bmh1
aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
