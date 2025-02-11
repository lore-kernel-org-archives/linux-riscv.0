Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA55C021A2
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 13:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZwXuGUKudZ3vhin+jZJsS3VGbfb6TIS/a4CrolK9EQ=; b=QKR5UtNnvYxANw
	0zKo+1ZIO4wmDcvHPpQrZNi83V5VHlE6D815HfWrC/DDn8O+qbGxYNVmH9iqIRZTcB6sfKeAz8rbP
	O5TNMmVvBoJjyjeSjUGZg+kINqec6TpPbzlGgXBHLQKMdzwefeSP3/w5ce5x4RJiZGMT2D4I77bPy
	ZCU+tVRzQMrg9T6PL/7zpdR+HW0wODBGxok8V4YKgkmj6jSEd3QRKOv+boMAKJ1DEfEIF/tPos5iy
	4V/Pwu8u/vu94Ae9K8Fclm+lKsY9TWfYxs+zLJ39597iq4/yjdCUbn4sTI8Bh/+2rXdo/5tLUnBb+
	Gz+Z3JvMyXrP+u8TyyNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thq2m-00000003tbZ-0Gki;
	Tue, 11 Feb 2025 13:11:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpc1-00000003oew-1Xcw;
	Tue, 11 Feb 2025 12:43:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43934d6b155so17930955e9.1;
        Tue, 11 Feb 2025 04:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739277815; x=1739882615; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uepduHjDPy55AkkCGXbAU8w+LO18qfkEQA77TDsyyXM=;
        b=IwNjN9ucm0txM/B+4pHQJRyyZUkZp5B41tS9kYa85tKPT/05ZSFIJ4rQLJSxEvoBKP
         zDA9FraQGNyJiZpWTwjQ1g8gTpvaSybkIm8MikW3PJ58ve8fLTwbE2bkvNnpsk79biO7
         PDYUiQNuyHK47aKrS2NVSHpM5Y+F99seq/cbg6UpNASpjU/OsAY8s8UelmuR+ndt3ALk
         xbsV4F7FCqKdpoRC2PPk106LXEHJkHMZoB0rzwW3l+rsTW7ewZfXxA8W+RMV8zoR+m95
         GpgP4uxIfCmeL9APjJhqkL+b597qi4JjMEimwQ38CmdfWWPBSyiG7bmVoNwpTxWT/ZWC
         8EjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739277815; x=1739882615;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uepduHjDPy55AkkCGXbAU8w+LO18qfkEQA77TDsyyXM=;
        b=rGL5ij4tquDPj//tk7Hpr0nueIRHMgPO8KcYH3djmtxmofX4RXO34Dfoz7kZV+5AFc
         E5vniWRTSb2pLAYlPV+S2LJ3P4+TOJbuuhe+SVy4wOvIdbn9jtBcbqrN/vTBdoWzRpbA
         ryNtDOd3YD6vxeDwBDoJ7BxXo9D+XPitE/aq1UYB2ylisxdeGFr6SV5qmv0ov/FyxY6K
         UcFBjEZkmRcrMNwl4roWUN4A2wKljFkGfUJAQme8iUcKL6pQd+8LAf42dPFMFTu9LlW4
         n4UC6LycO0DKFRq/x/+jZEx9yk/v7cascLjpfuZzbvSoGHansw5CcpjKl9owX3Q2TNxn
         nSlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWAfWpRVVEeQasNgLyHLoETtGO1eioELANFAUnbydlehfF0DWgJ/kyY7POLYUSLvs06bkEswGdGQdytkHUExE3@lists.infradead.org, AJvYcCXnd8I/B0b8D7DDXZVJoA81GnXi9h9qHgKIKsJY/k22o+HfMka86i3i23mhNA93VpoRwt1qRM/jw2wF+qo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnchlFA/HEcvnhULZQMV1SQZIjCau1+OPrMEYbVQwN87uF6JPD
	E1fhhRz4T88B2wMuvuvoogdaS1GX8deqkKD1j8t5ucy1IGose4xp
X-Gm-Gg: ASbGncsuX1hLNDBuAAtmJ+Bok5TY204e8UGOjh7uyvJGUBvEc9KAoGGyzOqZfi5WNSf
	rWVkUlOqzUbLc5iCWppSafRsGQnW+ewJDoURBo7LZgieoZbQwbaX2iNxr9DXfgJwaGCCqXlc8wP
	1QtkG76IeFDSntDJu1GjfeWnVAfCOGufA2xGRx0eyRruf6X3DgKIceS96DtmTMpe8CDLqLe3c8o
	kEqHndBzNK+FTrEHhNGoayduxSN5uilIDHr+pG2aPdJki4ftgKKfLpQOHuvkssS0ls0pqhG8T6c
	lxAGIkkfPZ6omzJeGOaGW5z8XD2hn03q
X-Google-Smtp-Source: AGHT+IEBhVLUgJKyLV9yDCk2soLE+OEkOUesnwWNG1Lpa/Ktin9FkzYLpEqwqMjhtsNnoPajSZttXg==
X-Received: by 2002:a7b:ce8c:0:b0:439:31a6:276a with SMTP id 5b1f17b1804b1-4394ceaf874mr28491015e9.2.1739277815164;
        Tue, 11 Feb 2025 04:43:35 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcd8213f2sm11711856f8f.67.2025.02.11.04.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:43:34 -0800 (PST)
Message-ID: <b1f05bff1d6c3f0cb1b381c15dcf222ec4c7f1b1.camel@gmail.com>
Subject: Re: [PATCH v2 0/7] arm64 support for Milk-V Duo Module 01 EVB
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
	 <inochiama@outlook.com>, Lee Jones <lee@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Sebastian
 Reichel <sre@kernel.org>, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, 	linux-pm@vger.kernel.org, Jisheng Zhang
 <jszhang@kernel.org>, Chao Wei	 <chao.wei@sophgo.com>
Date: Tue, 11 Feb 2025 13:43:31 +0100
In-Reply-To: <20250211-backwash-jester-2fdd6740000e@spud>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
	 <20250211-backwash-jester-2fdd6740000e@spud>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_044337_404520_F94C5D48 
X-CRM114-Status: GOOD (  13.83  )
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

SGkgQ29ub3IhCgpPbiBUdWUsIDIwMjUtMDItMTEgYXQgMTA6NTAgKzAwMDAsIENvbm9yIERvb2xl
eSB3cm90ZToKPiBPbiBNb24sIEZlYiAxMCwgMjAyNSBhdCAxMTowOTo0MFBNICswMTAwLCBBbGV4
YW5kZXIgU3ZlcmRsaW4gd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyBhZGRzIHZlcnkgYmFzaWMgc3Vw
cG9ydCBmb3IgTWlsay1WIER1byBNb2R1bGUgMDEgRVZCIFsxXSBpbgo+ID4gYXJtNjQgbW9kZS4g
VGhlIFNvQyAoU0cyMDAwKSBpcyBkdWFsLWFyY2gsIFJpc2NWIGFuZCBBUk02NCwgdGhlIGxhdHRl
ciBoYXMKPiA+IGJlZW4gY2hvc2VuIGJlY2F1c2UgdGhlIHVwc3RyZWFtIHRvb2xjaGFpbiBjYW4g
YmUgdXRpbGl6ZWQuCj4gCj4gPiDCoCAuLi4ve3Jpc2N2ID0+IHNvYy9zb3BoZ299L3NvcGhnby55
YW1swqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArLQo+ID4gwqAgYXJjaC9hcm02NC9LY29uZmlnLnBs
YXRmb3Jtc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDYgKysKPiA+IMKg
IGFyY2gvYXJtNjQvYm9vdC9kdHMvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCAxICsKPiA+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvc29waGdvL01ha2VmaWxl
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKwo+IAo+IEknZCBleHBlY3QgdGhpcyB0byBiZSBt
YWludGFpbmVkIGFsb25nc2lkZSB0aGUgcmlzY3Ygc3VwcG9ydCwgaG93IGNvbWUKPiB0aGVyZSdz
IG5vIG1haW50YWluZXJzIGVudHJ5IGNoYW5nZSBoZXJlPwoKTUFJTlRBSU5FUlMgZmlsZSBoYXMg
Iks6IHNvcGhnbyIgZW50cnkgYWxyZWFkeSwgSSBzdXBwb3NlIG5ldyBmaWxlcyB3aWxsCmZhbGwg
aW50byB0aGlzIGNhdGVnb3J5PyBUaGF0J3Mgd2h5IEkndmUgaWdub3JlZCB0aGlzIHNwZWNpZmlj
IGNoZWNrcGF0Y2ggd2FybmluZwppbiBhbGwgcGF0Y2hlcy4gQW0gSSB3cm9uZz8KCj4gPiDCoCAu
Li4vc29waGdvL3NnMjAwMC1taWxrdi1kdW8tbW9kdWxlLTAxLWV2Yi5kdHMgfCAzMSArKysrKysr
Cj4gPiDCoCAuLi4vc29waGdvL3NnMjAwMC1taWxrdi1kdW8tbW9kdWxlLTAxLmR0c2nCoMKgwqAg
fCA4NSArKysrKysrKysrKysrKysrKwo+ID4gwqAgYXJjaC9hcm02NC9ib290L2R0cy9zb3BoZ28v
c2cyMDAwLmR0c2nCoMKgwqDCoMKgwqDCoCB8IDc1ICsrKysrKysrKysrKysrKwo+ID4gwqAgYXJj
aC9hcm02NC9jb25maWdzL2RlZmNvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDUgKwo+ID4gwqAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNp
wqDCoMKgwqDCoMKgIHwgNjQgKysrKysrKysrKy0tLQo+ID4gwqAgYXJjaC9yaXNjdi9ib290L2R0
cy9zb3BoZ28vY3YxODEyaC5kdHNpwqDCoMKgwqDCoMKgIHwgNjQgKysrKysrKysrKy0tLQo+ID4g
wqAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODF4LmR0c2nCoMKgwqDCoMKgwqDCoCB8
wqAgMiArLQo+ID4gwqAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxOHh4LWNwdS5kdHNp
wqDCoMKgIHwgNTcgKysrKysrKysrKysrCj4gPiDCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhn
by9jdjE4eHguZHRzacKgwqDCoMKgwqDCoMKgIHwgOTEgKysrKystLS0tLS0tLS0tLS0tLQo+ID4g
wqAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDAyLmR0c2nCoMKgwqDCoMKgwqDCoCB8
IDY0ICsrKysrKysrKystLS0KPiA+IMKgIDE0IGZpbGVzIGNoYW5nZWQsIDQ1MSBpbnNlcnRpb25z
KCspLCAxMDMgZGVsZXRpb25zKC0pCj4gPiDCoCByZW5hbWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3tyaXNjdiA9PiBzb2Mvc29waGdvfS9zb3BoZ28ueWFtbCAoODAlKQo+ID4g
wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvc29waGdvL01ha2VmaWxl
Cj4gPiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9zb3BoZ28vc2cy
MDAwLW1pbGt2LWR1by1tb2R1bGUtMDEtZXZiLmR0cwo+ID4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvYXJtNjQvYm9vdC9kdHMvc29waGdvL3NnMjAwMC1taWxrdi1kdW8tbW9kdWxlLTAxLmR0
c2kKPiA+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL3NvcGhnby9z
ZzIwMDAuZHRzaQo+ID4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMv
c29waGdvL2N2MTh4eC1jcHUuZHRzaQoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
