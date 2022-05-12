Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA616C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 15:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oqvcv7uDyHyd2PTtx2yRNSumCjBf8qaGJymCXv/qiys=; b=5A91ArTUq1IJpS
	xjDVduJePYsGy5N9YMF4gYScYp5Nk8b3ANw8yb7/cN+/JX+CCx52RSiL4ZDb0NYZ4BaU/ui94RRf7
	lpQY6Be2yfwft3Uw0y84baEXE9E2VoshLxQEU9kLL9Z/NsszbkgMCHPoLW1D23sa9FZ42MzZIqlZn
	QXAEZooZT8pSWVkyGWhoEBYEAgriqfh+AT7ahu8B0gvsBwhJxx5RCflgb0X/fg45UFFlz54igQoHV
	h1oknKjf6cVzk2vpUuMupJLlsDD3E4WWLb9Blf5tOQMoM+Jh68/fJtocCw79YTMlxFaNjo7xB3aAT
	bJPPchrL7Fz5E0SShR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npArS-00CffH-K5; Thu, 12 May 2022 15:36:18 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npArP-00Cfd0-L0
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 15:36:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id j25so6782512wrc.9
 for <linux-riscv@lists.infradead.org>; Thu, 12 May 2022 08:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=en7uzZk89o5hiivHxHfeVnKjtCja2ainFuPxfO59LJI=;
 b=IMzreN6mpfvDJ7SDc6lwv2jKc96texJOTvhPVBk52GlqyMl1FGxxf6T5IIeRo5Kqac
 efDy9w7j3bmlF0L0HzNbH81bNcJMZgRSpsTPt/vihNNNPVH3n3s2orO+/NaMm8VSpCmE
 QMnZ926A3Or6BMlO4dyXNcQowOht8RYkLEFghKF9dEOgmdRMQ4Fd2X1qo/MByTNGKolo
 VgnhuzSbYhKrpQoL7pOK87aCCyh+JxwnkJC+mLxOHZ6mF0NIkcabR/Ln0aHbvoZOuG9K
 a6NcvYDxEA3v4DUtP8d0GcIyz7skG3IDlu+Hux9m1sU1Tr6I/ouaOI8CVpamOwfE6HH/
 cZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=en7uzZk89o5hiivHxHfeVnKjtCja2ainFuPxfO59LJI=;
 b=kNDmHj29CMAEa37Vmw+8o/X1CQt4GP2vE0Nr+FEMgJPXnJDjqktFciCi5ERgBL62eC
 N3OV/zehsNBqaK0iSZoqWSAVmwIsYipUYuy+I/89oqxfp7DwV4OkKgia3pjmPgFkmhsx
 pKb+YIL9wmRWVc6CWLfcAXFlUGT6FtzXkfCmg9mCmWRS5lsVwdW/3I4XT0Yvpom3p5uy
 ODJU3KvDEdNUmkxm6t4yT7mPRPe7sGYAcufZm2oD8TsaJ3hrh2wutiD+Tc0Fh7f6H0aN
 ErfgoZTxRSL8lPfVBsztgelTc0WqdNqphRha9iccsmLj4vaw30Hmkk5MyY29SnCNtZZY
 WZog==
X-Gm-Message-State: AOAM531CCfVFxzFkVB2JP118vtIyfccyUa6vzkG71doVlx7Z90gWPCaj
 SzXdorM+3GU0x32Cl8NhIg49kUmOCjzoR5i1Nh5ZtVtWiqYvCeWD
X-Google-Smtp-Source: ABdhPJwsP4fnvpNb9Kz5Vr1C+7g8TOLYnj9DUFzPUdTfvI/li/yFAn6LhCXOZ20Ez7Okhijet9CC7BSvcnhiYu5zenQ=
X-Received: by 2002:a05:6000:12d1:b0:20a:d901:3828 with SMTP id
 l17-20020a05600012d100b0020ad9013828mr197269wrx.313.1652369773255; Thu, 12
 May 2022 08:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220511201107.2311757-1-atishp@rivosinc.com>
 <CAAhSdy3mbGdK9LrLxZX0JL0mQxP5FrFUuneX1cQS2SABpO=7dw@mail.gmail.com>
 <23274575.ouqheUzb2q@diego>
In-Reply-To: <23274575.ouqheUzb2q@diego>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 May 2022 21:06:01 +0530
Message-ID: <CAAhSdy3t6cnfR02kfHvnKdCcDPvyX4jwccV7qkR_=-dV_m0aGQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Fix counter restart during overflow for RV32
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Atish Patra <atishp@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_083615_949245_C7FAC4DE 
X-CRM114-Status: GOOD (  20.35  )
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

T24gVGh1LCBNYXkgMTIsIDIwMjIgYXQgNjoxMiBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEFtIERvbm5lcnN0YWcsIDEyLiBNYWkgMjAyMiwgMDY6NDQ6MTIg
Q0VTVCBzY2hyaWViIEFudXAgUGF0ZWw6Cj4gPiBPbiBUaHUsIE1heSAxMiwgMjAyMiBhdCAxOjQx
IEFNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4g
UGFzcyB0aGUgdXBwZXIgaGFsZiBvZiB0aGUgaW5pdGlhbCB2YWx1ZSBvZiB0aGUgY291bnRlciBj
b3JyZWN0bHkKPiA+ID4gZm9yIFJWMzIuCj4gPiA+Cj4gPiA+IEZpeGVzOiA0OTA1ZWMyZmI3ZTYg
KCJSSVNDLVY6IEFkZCBzc2NvZnBtZiBleHRlbnNpb24gc3VwcG9ydCIpCj4gPiA+Cj4gPiA+IFNp
Z25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+ID4gPiAtLS0K
PiA+ID4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgfCAyICstCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgYi9kcml2ZXJzL3BlcmYvcmlzY3Zf
cG11X3NiaS5jCj4gPiA+IGluZGV4IGExMzE3YTQ4MzUxMi4uMjRjZWE1OTYxMmJlIDEwMDY0NAo+
ID4gPiAtLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiA+ICsrKyBiL2RyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+ID4gQEAgLTUyNiw3ICs1MjYsNyBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgcG11X3NiaV9zdGFydF9vdmVyZmxvd19tYXNrKHN0cnVjdCByaXNjdl9wbXUg
KnBtdSwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgbWF4X3BlcmlvZCA9IHJpc2N2X3Bt
dV9jdHJfZ2V0X3dpZHRoX21hc2soZXZlbnQpOwo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBpbml0X3ZhbCA9IGxvY2FsNjRfcmVhZCgmaHdjLT5wcmV2X2NvdW50KSAmIG1heF9wZXJpb2Q7
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHNiaV9lY2FsbChTQklfRVhUX1BNVSwgU0JJ
X0VYVF9QTVVfQ09VTlRFUl9TVEFSVCwgaWR4LCAxLAo+ID4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZmxhZywgaW5pdF92YWwsIDAsIDApOwo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZmxhZywgaW5pdF92YWwsIGluaXRfdmFsID4+IDMyLCAwKTsK
PiA+Cj4gPiBUaGlzIHNob3VsZCBiZSB1bmRlciAiI2lmIF9fcmlzY3ZfeGxlbiA9PSAzMiIuCj4K
PiBXaGF0J3MgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB1c2luZyBDT05GSUdfMzJCSVQKPiBhbmQg
Y2hlY2tpbmcgdGhlIF9fcmlzY3ZfeGxlbiBmbGFnIHZhbHVlPwoKSXQncyBvbmUgYW5kIHRoZSBz
YW1lLgoKPgo+IENPTkZJR18zMkJJVCBzZWVtcyB0byBiZSBhIGJpdCB0aGUgbW9yZSBrZXJuZWwn
aXNoCj4gd2F5IHRvIGRvIHRoaXMsIGJ1dCBpdCBsb29rcyBsaWtlIG1vc3QgU0JJIHBhcnRzIGNo
ZWNrIHRoZQo+IF9fcmlzY3ZfeGxlbiBpbnN0ZWFkLgoKSSBhZ3JlZSB3aXRoIHlvdS4gV2Ugc2hv
dWxkIHByZWZlciAiI2lmZGVmIENPTkZJR18zMkJJVCIKaW4gdGhpcyBjYXNlIHRvIG1hdGNoIHRo
ZSBrZXJuZWwgY29kaW5nIHN0eWxlLgoKQ3VycmVudGx5LCBPcGVuU0JJIGRvZXMgbm90IGhhdmUg
Q09ORklHX3h5eiBkZWZpbmVzIHNvCm92ZXIgdGhlcmUgd2UgdXNlICIjaWYgX19yaXNjdl94bGVu
ID09IDMyIi4KClJlZ2FyZHMsCkFudXAKCj4KPgo+IEluIGFueSBjYXNlLCBsb29raW5nIGF0IHRo
ZSBvcGVuc2JpLXNpZGUgb2YgdGhlIGNhbGwsCj4gdGhpcyBmaXggaXMgYWJ2aW91c2x5IGNvcnJl
Y3QsIHNvCj4KPiBSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4K
Pgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
