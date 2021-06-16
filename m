Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB032C48BE6
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 10:45:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BB046100A
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 10:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BB046100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ir9js5zq0sdZf4c2Wj1xAF/4QD+dzFhnOvng1T9ZjWc=; b=Rk20YkXSIB95cwYxF9xc7ABD2N
	IHC7Kc+zRw106vMAE6JE5Z+7G0wcy4836odfNE8A8MYiYSE88YV+d8EiGUTzUZL8mkiYwJPdqxxe0
	oX49ztsVunxeaiOcbbfYZ8sSQxMtxGNchVvz3yZFZHcys3cb62tamiVvjS/dJ7zSubTiKA0wapX9O
	Jmodz8F5hUqeYbSN2sFaBYNNs9H1oFvONKGpIY7jcBQgjjfVmNJoNuwkqX9x/NnWcicCtA5ibvewt
	gCVBWpgflnH9/JNNSk0mzKXS29B98VQW6YtsCKiVJD+LglFmnvUwpJKKAi1zEuyyPpT3CInlopgMG
	zoHkTwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltT2R-005tVe-Kv; Wed, 16 Jun 2021 10:44:51 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltT1I-005szY-Hz
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 10:43:42 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 15GAhbJn078683
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 13:43:37 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1623840212; x=1626432212;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GvWDrpQ18tJYXKrSYhkofkZAxdsZKJZtHm7ZMn9f9q0=;
 b=Ox7pnLZpX/WR/RaCMSSFZyDMCrbV7+K6Fr9YaX95rJM7mpa+VHMmbiIKifK6D5pb
 vHZ74rjVGPrmiLeYPH52cBgB+M93USYDiDguv/5ykYyXnV8x2Z10ny3HJdlN2f6A
 FH2CD9lF1P88oTSc9bU6AhTwr9tLV2eIF8nSMvuqBkELPEl/cYBv9MMN5yuDSoJp
 WnpvgpbbnZ/RrR11EcHOyEBfPsKcGlk70+D+tJeQvkBDn30UYYaMwXq1bfvKEBFG
 fB9csLoGiO+0g4JCohqLVP8np14NKV/PbikgrPjtSFzD/a/WbRSqNuNFiHjru4ww
 X0nNMNpXzXYfBDSw314hJA==;
X-AuditID: 8b5b014d-96ef2700000067b6-d2-60c9d5d4bb02
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 89.7A.26550.4D5D9C06; Wed, 16 Jun 2021 13:43:32 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Wed, 16 Jun 2021 13:43:32 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Frank Rowand
 <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] riscv: Remove non-standard linux,elfcorehdr handling
Organization: FORTH
In-Reply-To: <CAMuHMdVRcN+y0kwxxEH8UGo6bRT9SvxRSLU8VzWJFx=yLQ5S0g@mail.gmail.com>
References: <cover.1623780059.git.geert+renesas@glider.be>
 <bcc5c666f4ada9a8bbc26f559751f0da67f769f8.1623780059.git.geert+renesas@glider.be>
 <abadee118c1945c44d9bff7675b12ec4@mailhost.ics.forth.gr>
 <CAL_JsqLU7GWDxdnR2-Yd2vbj7w=5pNr_fFocDQgPbs17EpBG0g@mail.gmail.com>
 <bdfbf7cc997a10a94331d77332dbe88e@mailhost.ics.forth.gr>
 <CAMuHMdVRcN+y0kwxxEH8UGo6bRT9SvxRSLU8VzWJFx=yLQ5S0g@mail.gmail.com>
Message-ID: <ef1a9a97e0238a0ff2d8e044487602a5@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42Lpjp6urHvl6skEgzkPRCy2/p7FbvF+WQ+j
 xfwj51gtZr75z2bx7NZeJotNj6+xWlzeNYfNYtvnFjaL5nfn2C1eXu5htmibxW/RuvcIu0XL
 HVMHXo8189Ywerx5+ZLF43DHF3aPnbPusns83HSJyWPTqk42j0OHOxg9Ni+p97jUfJ3d4/Mm
 uQCuKC6blNSczLLUIn27BK6Mn837WQq+sVX07L7A1sB4h7WLkZNDQsBE4v6kx8xdjFwcQgJH
 GSUuf5jKApEwlZi9t5MRxOYVEJQ4OfMJWJxZwEJi6pX9jBC2vETz1tnMIDaLgKrE57+dYEPZ
 BDQl5l86CFTPwSEioCsx5ycTyHxmgYmsEpv2zgGrERbwlfg18yI7iM0vICzx6e5FsDinQKDE
 hFUH2SAOmsQs8fPVeRaII1wkrsxZyQxxnIrEh98P2EEWiALZm+cqTWAUnIXk1FlITp2F5NQF
 jMyrGAUSy4z1MpOL9dLyi0oy9NKLNjGCY4vRdwfj7c1v9Q4xMnEwHmKU4GBWEuHVLT6RIMSb
 klhZlVqUH19UmpNafIhRmoNFSZyXV29CvJBAemJJanZqakFqEUyWiYNTqoGJxT+6LTRK5EzI
 IwXmXUYeiqUrtvmIsam93uS22E1vpT1TwMHCToGLjgccH+112Nm6Mj0//+T2hqPBR+0NN3T7
 /HtbfuxCUfVz9ygZfmNWzcU+h2YEfPtieCowYoKP8EbDLRNv//hm+0Axbd+99VIm7z2m/pRs
 vpOlV7pDQf/yvscs8xwN3j7Kc9w4d8ae3Wdm5laWvf5SdGI+z7OcibvtRdYLvf+UcnLzD57Z
 1kb6Rnf0Dqxbxvx/zSXl/vqVySbdCVa5brXn97lLz7wzk/vC5+5tddPZs7ueXd2sFJbjOlOL
 a9YCtkkLutV9bwvejP1c2rfrpk5ftEKO0fu1jrMqFyx1Lz25X2Kh9tv1GTIzlFiKMxINtZiL
 ihMBoMjLOxwDAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_034341_006469_5034A27B 
X-CRM114-Status: GOOD (  12.16  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMS0wNi0xNiAxMDo1NiwgR2VlcnQgVXl0dGVyaG9ldmVuIM6tzrPPgc6xz4jO
tToKPiAKPiBJIGNhbid0IGNvbW1lbnQgb24gdGhlIGR1cGxpY2F0aW9uIG9uIGFybTY0LCBidXQg
dG8gbWUsIC9jaG9zZW4KPiBzb3VuZHMgbGlrZSB0aGUgbmF0dXJhbCBwbGFjZSBmb3IgYm90aCAi
bGludXgsZWxmY29yZWhkciIgYW5kCj4gImxpbnV4LHVzYWJsZS1tZW1vcnktcmFuZ2UiLiAgRmly
c3QgcnVsZSBvZiBEVCBpcyAiRFQgZGVzY3JpYmVzCj4gaGFyZHdhcmUsIG5vdCBzb2Z0d2FyZSBw
b2xpY3kiLCB3aXRoIC9jaG9zZW4gZGVzY3JpYmluZyBzb21lIHNvZnR3YXJlCj4gY29uZmlndXJh
dGlvbi4KPiAKCldlIGFscmVhZHkgaGF2ZSAibGludXgsdXNhYmxlLW1lbW9yeSIgb24gL21lbW9y
eSBub2RlOgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xMy1yYzYvc291cmNl
L2RyaXZlcnMvb2YvZmR0LmMjTDEwMTEKYW5kIGl0IG1ha2VzIHBlcmZlY3Qgc2Vuc2UgdG8gYmUg
dGhlcmUgc2luY2UgaXQgb3ZlcnJpZGVzIC9tZW1vcnkncyByZWcgCnByb3BlcnR5LgoKV2h5IGRl
ZmluZSBhbm90aGVyIGJpbmRpbmcgZm9yIHRoZSBzYW1lIHRoaW5nIG9uIC9jaG9zZW4gPwoKPiAK
PiBPSywgdGhhbmtzIQo+IEJ1dCBkbyB5b3UgbmVlZCB0aGUgZW50cnkgb24gdGhlIHJlc2VydmF0
aW9uIG1hcD8KPiAKCkknbGwgYWRkIHRoZSBlbnRyeSBmcm9tIGtleGVjLXRvb2xzLCBzbyB0aGF0
IHRoZSBrZXJuZWwgd2lsbCByZXNlcnZlIHRoZSAKcmVnaW9uIGFzIHBhcnQgb2Y6Cmh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjEzLXJjNi9zb3VyY2UvZHJpdmVycy9vZi9mZHQu
YyNMNjA1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
