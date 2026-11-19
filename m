Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF54E60A2613
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 15:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HqYIS/ur;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=FBWA+95+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VGDV5Mo8ZM39XeqHRrJNuHDt5kPG5+YmH+lvRPudcSU=; b=HqYIS/ur/4o8pPxbUkR7P0BHzi
	I3idP/qOynX3i2W4iDWZAISyam6gBVHRDOy80D8n/ZW8MuoHfiNNQHXIRc9TvAJCNTCFXkDKEJ8rl
	NoLVrb5iO/PTIhYonclXA+sExO2RSV81knQOLL/9DbddY16z9DRdxoInmHVB4I7K5+91BDiw+p+/v
	i3l/HZr/vTlagt1YMxRvGL/7MwjF5p1vTomE6DUSAZEDh9H+4iNZOdkm0AzLXYHjvUJL3jEjuvLHv
	mWAHMlHaOmRmHnROMRRCK75cvm7AWcpEbwJz3fA5CfACofCTjM7tXydkNLYPMPf9/D7Gb4hjd1SzA
	AdEt6qQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4DN-0000000CVC7-0EcO;
	Thu, 19 Nov 2026 15:38:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4DH-0000000CVAs-0oUI
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 15:38:16 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48dee593f18so2386015f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 07:38:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795102693; cv=none;
        d=google.com; s=arc-20260327;
        b=OkCVFhY8NED7MrmklcD0PkPbCuyQFLv3ccgpmbyfSdJK1hBY4b52eqx5eTSQ3WRorA
         5/3MHtHHLJufABb2yu3ZQfZxcaWpo5rlVjFUAwvkINKFnjv2GDnf6ILumM1nBf4ZP93p
         Z7qlaM7SPt+dWCWWUu2DkjBiqfvyCzTYacKaGlwPTjgJBwRIokOk4bH24IP8Binf4cJf
         m5xuMO9yYE75hB6VFBUkUDvTMb0HYcoZSYcJa5jBhNpm1U2ZlElHoMVKziH4QV3PK1jI
         2SrVj2PC8u8bgF3lMTEiwZ5l2znGu4WKma35K/zTPRIaJHdg/ue30baQAVokErAkrdGI
         jg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
        fh=M7qKX7ZDDqpw9po5zbYomvScIaw31CgKZxrZviDEe1I=;
        b=YyoIU/Q49OthuE+J1IgOCdpGrDezWnePlCBLw9Ti7AOWQwYdqr37mDLICU0CLuQRbT
         WlMQ0cV4qOvVSr2NQ0QfhgX6RVbS1Oy35H1yOEo3ds1SsyDhNnFmCu9AUtfThDVdh4Ec
         DAh6E2O3SlqTHyY1NGFZkfCsx8wyfrlme18eMVGUNm9IJGslEBGtr+RDsH1fVXgsvUUV
         K/r0tSO4Toi8weYR3nP2Gq37hnNzEuJEcbajC1X6ozzMOWHBMwnd1Bm50i2fcEtY67RV
         e7YuWkXpH9MaJwpIlynmMNvW41TmjWQT11W8M7hJe7fjqXEzS1elHGUwL4QqSTLWN2C5
         8ngA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795102693; x=1795707493; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
        b=FBWA+95+6gSQSbg+9a54rHm3J5N2gmMQ3SjlnojzwwFh1yWKRKjEWjytlhNTeooKaO
         QMVPmocX3CL9ZqGM/qGtllEYc0z8+bcsdtI0GLUVWR98thmGTm2nqVgKTCkkdDTz1PWt
         rA2sz0XXt6NH+rNEpNM6brW33rqZH4mxM6NKbpGufFrCOLChhv4cc/1qX1cmrEUn23PO
         2/AmI2EdQWX/Qox6U/3ll84EhP0HObUDz0DzbudAzF8MUEO2l2zNly3kWOJOupKH4kQU
         jtC4CMpY7s99Khhmo/TeEPqfypMQRJXJtzS8PUzsVCvpuKknvWgVK4VU33LeX1dAcD2l
         49eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102693; x=1795707493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
        b=oSSDbCvI8V8bgGqaLLBW8gdXWrWkX5fvWScZZ1zskC+VT/lxFw0/L5HQ/+qrECIF6+
         iTGwVF12N228BmZl78kKXHkcx8ajLzVLg7y9EXPcf5eCBJvUbIu33Zyae93LZB3R+8ck
         KUWtDmRhW9L5uVyTNPtsWT/JZ3FQpQSibOLo88LtO7b3KyWQyT0LoHPGfRSKIZU33k2b
         +aTk4GUmI56/YPtsxYz6KmCQyMohyegfYBDXpeciCh2Ab8kMueuHIM5GoZOAJ8VLuhrh
         +WAr2yJgb0aDD/WpPD0aW1LrReK9pzRNqmtEe0duXj0nfpynT5BaFMPnGVwj+FKq9ngI
         Pxxg==
X-Forwarded-Encrypted: i=1; AL+hErG8jCg+jmUodERhta/CcQl0XgUThX8wJcFaW/Elk6022TaNd92ldIEX9aqgWhOrzhPVVSielcAbemqxuQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8+pHwvKR7D5Fy52KB57sMX/0EesDbXqAdOOMgE3N8GenyysQll
	m2GYWK1n/suvm7CJUFb3gAmfEoR3mropWovWGRNoIkK6TpM+1uBqrYeuk0mauHnOm15SKRwPsRu
	ksryQV2MeUdFii4XusdbkecN8tMWD8ZFTNfSgsXHYFw==
X-Gm-Gg: AZFdTZdXfRxV0qCZZrt/iDtgsUXvq8RQFfB6UrYBPSmCK1NS0tQXaE80LnVwGud7kxi
	VnuWm6WjlSgZn+jd1gGb+o0PRoi/Tk3C9upJaki/2ac+bWgaD1Q4r/0tal3hihnbi5Ol66jZ4QK
	P2pDnQrEhBCRtnTX46aZoz33k9dLJHClkbpTRHFuYqgCWzA8m+Me/LTxjGZijYcjSevIdMWTz78
	tVlnl7xzh1uLImclfGEZi1YMNp5pnvv+hBNqKvHf8NmDV+LGfYA29AB2W9gC+mxik5fMOekJ5D+
	1LLVIoyZ6jeVSGpF15NMfHtJAF9pmsWmelw75d0WnaYwQ09aM0+0CfBuTJ9lS300t1VFUrHAasV
	x64hRau8dSOI7AQXA3hAPqIqbBSw7oczqpVrb+gCwweh4uTWv5IJTU0giUyZROvj16BSsFM1kXW
	Xu1UoPyywDAZLv76PCbfWcK/0b096q1/KG5Hxo+csRJjVl91ANilTLu3Dj
X-Received: by 2002:adf:e009:0:20b0:490:1881:80ec with SMTP id
 ffacd0b85a97d-4a63a895742mr10073341f8f.36.1795102692730; Thu, 19 Nov 2026
 07:38:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-8-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-8-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 21:08:01 +0530
X-Gm-Features: Aa3M54qqVopLHoNkItX81APze_rfhpoAK0QlJ8DY6gdjSieSVn8liCJp7Smx0no
Message-ID: <CAAhSdy3KUqSqERnw6khG13mXKcaCf3UeG+FqQAZzeeNZ7S7GfQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] dt-bindings: riscv: add Sxctr ISA extension description
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_073815_294457_DFC22CD3 
X-CRM114-Status: GOOD (  15.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMzoyMeKAr1BNIFZpa3JhbSBTaW5naAo8dmlrcmFtLnNp
bmdoM0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEFkZCB0aGUgU1ttfHNdY3RyIElTQSBl
eHRlbnNpb24gZGVzY3JpcHRpb24uCj4KPiBDby1kZXZlbG9wZWQtYnk6IFJham5lc2ggS2Fud2Fs
IDxyYWpuZXNoLmthbndhbDQ5QGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSYWpuZXNoIEth
bndhbCA8cmFqbmVzaC5rYW53YWw0OUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmlrcmFt
IFNpbmdoIDx2aWtyYW0uc2luZ2gzQG9zcy5xdWFsY29tbS5jb20+Cj4gTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDI2MTEwNjE3Mzk0Mi4zMTc1MDY5LTgtdmlrcmFtLnNpbmdoM0Bv
c3MucXVhbGNvbW0uY29tCj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4KCkFzIG1lbnRpb25lZCBpbiBQQVRDSDEsIGRyb3AgdGhlICJMaW5rOiIgYW5kIHRo
ZSBzdWJzZXF1ZW50CiJTaWduZWQtb2ZmLWJ5OiIgbGluZXMuCgo+IC0tLQo+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCAyOSArKysrKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwK
PiBpbmRleCA3OTQ5MWVmOGY4NmEuLmRkZTJmMjhjZmRhNSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+
IEBAIC0yMDIsNiArMjAyLDEzIEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAgICAgIG1lY2hhbmlz
bSBpbiBNLW1vZGUgYXMgcmF0aWZpZWQgaW4gdGhlIDIwMjQwMzI2IHZlcnNpb24gb2YgdGhlCj4g
ICAgICAgICAgICAgIHByaXZpbGVnZWQgSVNBIHNwZWNpZmljYXRpb24uCj4KPiArICAgICAgICAt
IGNvbnN0OiBzbWN0cgo+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiArICAgICAgICAgICAg
VGhlIHN0YW5kYXJkIFNtY3RyIHN1cGVydmlzb3ItbGV2ZWwgZXh0ZW5zaW9uIGZvciB0aGUgbWFj
aGluZSBtb2RlCj4gKyAgICAgICAgICAgIHRvIGVuYWJsZSByZWNvcmRpbmcgbGltaXRlZCBicmFu
Y2ggaGlzdG9yeSBpbiBhIHJlZ2lzdGVyLWFjY2Vzc2libGUKPiArICAgICAgICAgICAgaW50ZXJu
YWwgY29yZSBzdG9yYWdlIGFzIHJhdGlmaWVkIGF0IGNvbW1pdCA5Yzg3MDEzICgiTWVyZ2UgcHVs
bAo+ICsgICAgICAgICAgICByZXF1ZXN0ICM0NCBmcm9tIHJpc2N2L2lzc3VlLTQyLWZpeCIpIG9m
IHJpc2N2LWNvbnRyb2wtdHJhbnNmZXItcmVjb3Jkcy4KPiArCj4gICAgICAgICAgLSBjb25zdDog
c21tcG0KPiAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gICAgICAgICAgICAgIFRoZSBzdGFu
ZGFyZCBTbW1wbSBleHRlbnNpb24gZm9yIE0tbW9kZSBwb2ludGVyIG1hc2tpbmcgYXMKPiBAQCAt
MjYzLDYgKzI3MCwxMyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgICAgICBtZWNoYW5pc20gaW4g
Uy1tb2RlIGFzIHJhdGlmaWVkIGluIHRoZSAyMDI0MDMyNiB2ZXJzaW9uIG9mIHRoZQo+ICAgICAg
ICAgICAgICBwcml2aWxlZ2VkIElTQSBzcGVjaWZpY2F0aW9uLgo+Cj4gKyAgICAgICAgLSBjb25z
dDogc3NjdHIKPiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gKyAgICAgICAgICAgIFRoZSBz
dGFuZGFyZCBTc2N0ciBzdXBlcnZpc29yLWxldmVsIGV4dGVuc2lvbiBmb3IgcmVjb3JkaW5nIGxp
bWl0ZWQKPiArICAgICAgICAgICAgYnJhbmNoIGhpc3RvcnkgaW4gYSByZWdpc3Rlci1hY2Nlc3Np
YmxlIGludGVybmFsIGNvcmUgc3RvcmFnZSBhcwo+ICsgICAgICAgICAgICByYXRpZmllZCBhdCBj
b21taXQgOWM4NzAxMyAoIk1lcmdlIHB1bGwgcmVxdWVzdCAjNDQgZnJvbQo+ICsgICAgICAgICAg
ICByaXNjdi9pc3N1ZS00Mi1maXgiKSBvZiByaXNjdi1jb250cm9sLXRyYW5zZmVyLXJlY29yZHMu
Cj4gKwo+ICAgICAgICAgIC0gY29uc3Q6IHNzbnBtCj4gICAgICAgICAgICBkZXNjcmlwdGlvbjog
fAo+ICAgICAgICAgICAgICBUaGUgc3RhbmRhcmQgU3NucG0gZXh0ZW5zaW9uIGZvciBuZXh0LW1v
ZGUgcG9pbnRlciBtYXNraW5nIGFzCj4gQEAgLTExODksNiArMTIwMywyMSBAQCBwcm9wZXJ0aWVz
Ogo+ICAgICAgICAgICAgICAtIGNvbnRhaW5zOgo+ICAgICAgICAgICAgICAgICAgY29uc3Q6IHpp
Y250cgo+Cj4gKyAgICAgICMgU21jdHIgZGVwZW5kcyBvbiBTc2NzcmluZAo+ICsgICAgICAtIGlm
Ogo+ICsgICAgICAgICAgY29udGFpbnM6Cj4gKyAgICAgICAgICAgIGNvbnN0OiBzbWN0cgo+ICsg
ICAgICAgIHRoZW46Cj4gKyAgICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICAgY29uc3Q6
IHNzY3NyaW5kCj4gKyAgICAgICMgU3NjdHIgZGVwZW5kcyBvbiBTc2NzcmluZAo+ICsgICAgICAt
IGlmOgo+ICsgICAgICAgICAgY29udGFpbnM6Cj4gKyAgICAgICAgICAgIGNvbnN0OiBzc2N0cgo+
ICsgICAgICAgIHRoZW46Cj4gKyAgICAgICAgICBjb250YWluczoKPiArICAgICAgICAgICAgY29u
c3Q6IHNzY3NyaW5kCj4gKwo+ICBhbGxPZjoKPiAgICAjIFpjZiBleHRlbnNpb24gZG9lcyBub3Qg
ZXhpc3Qgb24gcnY2NAo+ICAgIC0gaWY6Cj4gLS0KPiAyLjQzLjAKPgoKT3RoZXJ3aXNlLCBMR1RN
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRz
LApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
