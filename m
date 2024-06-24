Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD69EC2BD05
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4exv4fnr+dfBqP7hIgNqfsBiHcS3+hcVxSBzgoJCWDs=; b=gG1sG8jA5Juon9FeS+4sYdnb0W
	YOjRRzGYp886GyEw/8V09/vwSiklqZvrlqExVIFSPa6PHFg7/caemOskuaBsxeDWWFWrLfI+dc3xO
	J8Z6bARH8brjqKR7b30vSEaHTAVXamHxFaWeqVSfjR0/Zyp+xMa7tLQ5HJV8W1EMEYb+EsE4iuRKg
	RqpRk/9kFYkZmQDbaOFMLNDhB9mLqBk4Eyz09wpCqvHK4z1ibrPwWgSDwATEnNwGffJjTkDzXvxA3
	n69e6IdOKuwWb4B8GdcoF+YE+UAPOWw8E2aB/IkdyGN0bHum6h3tzbPjJmpqPQN5qMhi6pmkw9pW5
	IcFNLCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLgG5-0000000GITk-1LRn;
	Mon, 24 Jun 2024 09:45:09 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLgG1-0000000GISq-1sP3
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 09:45:08 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7FFE43FB6E
	for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1719222301;
	bh=32drQnFIrbuxDvjj7GlWyJnnbwD5qvJD5a/OqydxWbw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=nGt2aBknfeorYHHdVQP7KrTpmmeViKKvb9zdRk6FaFuunMJBEFxVNY4hsy2hsbpUS
	 FuEhIKDZBSdzF9/z71twJJPWUIdHe++rJEkAS9w7R2DztDli1NnnLWNPH1MztdSo/m
	 dmfImvHH6/stsENuer1BZmyTJX+uTX98GqlPpScGUkObEhsf2w9agz+mJuUHPiwQGw
	 a1F/ApqJg/YCdqudJ5pHgjEfZUsBANdQzYScO2OQ7sm+nqqUvZPyWdUB33LxiWPO8+
	 +6YAvK4rTcVch84El0Bzn9dQRVxDQ46jRbf22iycvjwbCIyQpmu4k4Lt+pydn3/mzM
	 9oCxnm6w4vZrQ==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-444ab7d5202so63663811cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 02:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719222300; x=1719827100;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=32drQnFIrbuxDvjj7GlWyJnnbwD5qvJD5a/OqydxWbw=;
        b=PuAD5AQxgl7vDej/TdGQKh1Qp9qU/6BoFhcqKdqbwS7IHBcCCwt0+PzHbNdih4cuCP
         ygdcUWNHKEiOU4MM7uHuN7M8nny1eh00/+RYPoaF6y3IuwbACUAxKLHFjcmz4eRdKQdv
         Df+1Jyg/Kem9PzpnZ9NTTmYL3LJy9kd1u3oo1z/tFFPBgjq0grwV4y6PQYiBm5kuwXxj
         d+xI6oiSEE/bWqmoF9sKKOamYr2B2nrA9eiJUNuovU6fKPZQCw3fSB7DobUjFGiDpqnB
         RgoIH5s9lwMD2neVdDuAzEZnlOxw/POcTmKnljugHVVNrN7zc6gMStZBaW2sC2h2fJP1
         KC6g==
X-Forwarded-Encrypted: i=1; AJvYcCWV97Ifhju9bXWOVWt6jgweGtYVbWz+d0eSHUFITVyni+HQ+hYjuMNwuPbue9EpQvH0wUorSrmnQteTf/FqdEK8fJHMiyADtHPGPqCvEoWU
X-Gm-Message-State: AOJu0Yx6H52j9IIstU0mDygLjeLIChHZKT1TO3kPP4LQIV76gk2V5ONT
	B+sBJ03WwjRJnkoPRhMVC1+gflILXNcqXZNAR9D0JWznqzdqdcsdujT6YO3p1xGEKeC6rCkVQmH
	Jxv8c+bsMEOEPvdYVYT5vmmUPFFfnuOUOtSmSZ3j46GyaiMA84uInTPJ6DfB2TqozqmB+qXXfVY
	yP1yT+wyH+NR4wOnwx/f2Hpa0NRAsLtk1NeGlPhZrFkOJvDDDmsBVhbNoSiLLYsOli7fk=
X-Received: by 2002:ac8:5fcd:0:b0:441:531f:e06c with SMTP id d75a77b69052e-444d9218d2fmr52829521cf.30.1719222300010;
        Mon, 24 Jun 2024 02:45:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4u6cFs7jB94YopaLyGNwRvqbcbcIUJSolGuohIAL0lCFWbKp8n8kEuV3PjIDPEkyp1X9I5ZqTuPulZcyAGW0=
X-Received: by 2002:ac8:5fcd:0:b0:441:531f:e06c with SMTP id
 d75a77b69052e-444d9218d2fmr52829421cf.30.1719222299655; Mon, 24 Jun 2024
 02:44:59 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Jun 2024 02:44:59 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <2C13D76B7FA9727D+6cf7c812-5cf9-4fd6-a79b-8f2899c7c3de@milkv.io>
References: <20240613024827.36512-1-naoki@milkv.io> <20240613024827.36512-2-naoki@milkv.io>
 <8ceef5c1-03b3-4468-96e3-d86db5434e82@canonical.com> <AC74C056BD8A7945+7d7e4fa9-25e6-40a0-b571-ff3d01cb575f@milkv.io>
 <2C13D76B7FA9727D+6cf7c812-5cf9-4fd6-a79b-8f2899c7c3de@milkv.io>
Mime-Version: 1.0
Date: Mon, 24 Jun 2024 02:44:59 -0700
Message-ID: <CAJM55Z_ORHP2P01CqTN192TBmgfj93aLNhrw4cz4b-itnn5TBw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: starfive: enable heartbeat LED for Milk-V Mars
To: FUKAUMI Naoki <naoki@milkv.io>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, kernel@esmil.dk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_024505_966841_10EEEC92 
X-CRM114-Status: GOOD (  15.10  )
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

RlVLQVVNSSBOYW9raSB3cm90ZToKPiBIaSwKPgo+IE9uIDYvMjEvMjQgMTA6MDIsIEZVS0FVTUkg
TmFva2kgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiA2LzIxLzI0IDA4OjEzLCBIZWlucmljaCBT
Y2h1Y2hhcmR0IHdyb3RlOgo+ID4+IE9uIDYvMTMvMjQgMDQ6NDgsIEZVS0FVTUkgTmFva2kgd3Jv
dGU6Cj4gPj4+IE1pbGstViBNYXJzIGhhcyBhIGdyZWVuIExFRCB0byBzaG93IHN5c3RlbSBsb2Fk
LiBUaGlzIHBhdGNoIGVuYWJsZXMKPiA+Pj4gYSBncmVlbiBMRUQgYXMgYSBoZWFydGJlYXQgTEVE
Lgo+ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBGVUtBVU1JIE5hb2tpIDxuYW9raUBtaWxrdi5p
bz4KPiA+Pj4gLS0tCj4gPj4+IMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEw
LW1pbGt2LW1hcnMuZHRzIHwgMTMgKysrKysrKysrKysrKwo+ID4+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9i
b290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMKPiA+Pj4gYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1taWxrdi1tYXJzLmR0cwo+ID4+PiBpbmRleCBmYTBl
YWM3OGUwYmEuLjRmNGJiZjY0ZGJlNCAxMDA2NDQKPiA+Pj4gLS0tIGEvYXJjaC9yaXNjdi9ib290
L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMKPiA+Pj4gKysrIGIvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFycy5kdHMKPiA+Pj4gQEAgLTQsMTEg
KzQsMjQgQEAKPiA+Pj4gwqDCoCAqLwo+ID4+PiDCoCAvZHRzLXYxLzsKPiA+Pj4gKyNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4KPiA+Pj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9s
ZWRzL2NvbW1vbi5oPgo+ID4+PiDCoCAjaW5jbHVkZSAiamg3MTEwLWNvbW1vbi5kdHNpIgo+ID4+
PiDCoCAvIHsKPiA+Pj4gwqDCoMKgwqDCoCBtb2RlbCA9ICJNaWxrLVYgTWFycyI7Cj4gPj4+IMKg
wqDCoMKgwqAgY29tcGF0aWJsZSA9ICJtaWxrdixtYXJzIiwgInN0YXJmaXZlLGpoNzExMCI7Cj4g
Pj4+ICsKPiA+Pj4gK8KgwqDCoCBsZWRzIHsKPiA+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGli
bGUgPSAiZ3Bpby1sZWRzIjsKPiA+Pj4gKwo+ID4+PiArwqDCoMKgwqDCoMKgwqAgbGVkLTAgewo+
ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBncGlvcyA9IDwmYW9uZ3BpbyAzIEdQSU9fQUNU
SVZFX0hJR0g+Owo+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb2xvciA9IDxMRURfQ09M
T1JfSURfR1JFRU4+Owo+ID4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaW51eCxkZWZhdWx0
LXRyaWdnZXIgPSAiaGVhcnRiZWF0IjsKPiA+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnVu
Y3Rpb24gPSBMRURfRlVOQ1RJT05fSEVBUlRCRUFUOwo+ID4+Cj4gPj4gQWNjb3JkaW5nIHRvIHRo
ZSBzY2hlbWF0aWNzIHRoZSBTdGFyRml2ZSBWaXNpb25GaXZlIDIgYm9hcmQgbGlrZSB0aGUKPiA+
PiBNYXJzIGJvYXJkIGhhcyBSR1BJTzMgY29ubmVjdGVkIHRvIGEgZ3JlZW4gTEVEIHRvIGRpc3Bs
YXkgdGhlIHBvd2VyCj4gPj4gc3RhdHVzLiBTaG91bGRuJ3Qgd2UgY29uc2lkZXIgYm90aCBib2Fy
ZHM/Cj4gPgo+ID4gSSB0aGluayBMRUQgdXNhZ2UgaXMgdmVuZG9yL2JvYXJkIHNwZWNpZmljLgo+
Cj4gZG8gSSBuZWVkIHRvIGRvIHNvbWV0aGluZyBmb3IgVkYyIHRvIG1lcmdlIG15IHBhdGNoPwoK
SXQncyBub3Qgc3RyaWN0bHkgcmVxdWlyZWQsIGJ1dCBpdCB3b3VsZCBiZSBncmVhdCBpZiB5b3Ug
Y291bGQgYWRkIHRoZSBMRUQgdG8KdGhlIFZGMiB0b28sIHRoYW5rIHlvdS4KCkFsc28gSSdtIG5v
dCBzdXJlIGlmIHlvdSBzYXcgbXkgcHJldmlvdXMgcmVwbHk6Cmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2L0NBSk01NVpfajhnV0Z5S3ZzaXUtb0dEVjdIYWNyNEFtdDVGZGtIZGpL
bmhad1pneG5jQUBtYWlsLmdtYWlsLmNvbS8KCi9FbWlsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
