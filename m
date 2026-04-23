Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C54FAD3F9
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2026 03:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IEW6CRvH80LEixwTwKW/9aKEYt9MGi7Eg3YL0PyqtS4=; b=Ts7GBb2DYo5CmN
	H+ZEFA2yH/dAYdUxKdJrFexrL+7RDdAU6xBIgHecL3xBK8sWE5X2MikWa8l3dkJjiSE+vVyNuD13C
	nYedJuc6M/7hQxnJPInLSaj1GExc7ra4xLAOmaXxgvulwsbBo7ZmAuiZHdI9nmwbxtdN0QHDfznwL
	bDauNNYyvw5ffIS5doWukaP8QAE5huDMwaYnxzf/wTh0iVlEsNpkgNTstjmtVKh1zWo1mwIVQUtbb
	T5XZyeIozZqxToBfacyP+ywxMoEsNpkC/VvrrFI64nV/CWJAPNJ8/dNrVnUk1NnY3Bwyo+c+zN7uq
	7y0Kki13x+dolGOJPd/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFl1q-0000000AzR9-0IFU;
	Thu, 23 Apr 2026 03:47:02 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFl1n-0000000AzQm-1VRF
	for linux-riscv@lists.infradead.org;
	Thu, 23 Apr 2026 03:47:00 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b8f97c626aaso41394666b.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Apr 2026 20:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776916016; cv=none;
        d=google.com; s=arc-20240605;
        b=PcWLa2PaJUI2Zd1Zk7usxm09te4fXJWApOHDvwsaFgUxqmfmzYN5bpuwxtRKXz8irv
         afFKDKAmO+ewNwz2j7mZ46g0VNzaWwzPJA8Dufx93Zm6XpHIDfVRyCdAOp6jZ8Rt9mTi
         otdXzG3QLclx43wVd3YFcBbaMUBf59okranuPcSjtHUhz1PsJoSgB/ZbA/NsE5Z134u8
         HCthNBAmVDmF9BaVCdy1gS04HEUvWCYRXzs2CFWvyDKRMsn3wVeNszJ+FCoB3Wm/ppAU
         ngwN6oTXFt4r/ZiZO7egG1/P7L9+s0re7q9BOX2wKIfn8H42wXaCL0B3hw//dFvZ6dyM
         1kmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9GSW2Phd9oXEma1/9uB2odB8s4SQeX9sU39sUkX9FY=;
        fh=x9u3yxsW3K1Pj6QpoqzYbsIp/VccSxGXLeohLpFe738=;
        b=fKBxO0fC6QbpoSv50QTf2Dy61PWdl9rVO3c88MOcNWJIgkSOsZhOLWSIrvxgkmP03L
         DtJPoeV/gE+MogdOjpBjd+KoY9TQVmCCNdHYQXBATnShFHP9bOYFhqWqxQAD1R856MjA
         OSGEYyEiXxNlICNtXW8X3dMEXhgTzJeTPnOhQhsm+q/yLxc/WYeUWwOl9OcwfwjuGYs2
         SjlfDTX6FFNCjzgn9i0r0g6xTKEZtaCcGMmsiTUSf1kkW9d0LJnVw4MZGC2J0iFJNOD7
         UmIfMhByhzjZnOn3O13wm3brZkPuot+RgdVt596gueUXGy9DPwaNPdKzFlGnXPUxGoJQ
         4KPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776916016; x=1777520816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9GSW2Phd9oXEma1/9uB2odB8s4SQeX9sU39sUkX9FY=;
        b=UX0N/Lj0/GqpDAb4iZNCr/kIYG0Q596v34XV7v+hlX/wbGTIY4gJ87lSLDKvGOofKv
         5q0bcubQAPlVr9xv7Jf9t7jBESYBwXlkEUIKSxYMFY74WQi8pHyHgnYTy5zSPe9nEauI
         6bFoR1RMigMb2VPmgzFsEL08p3xgNOilfhPsHSBjdN2Hcqbmq12tLDzS9YJlO1x2gY5X
         9uXmNd3u3cIqxuw5EZORjQg1f6Acsi53szAw4yW9890TJ5eWbiCseYiL/ChH8t2NCjKX
         AwmiY3Ok731rCMQjVwYHtiS92UVOZx7LRxtZiuuE7HQq45rY8K3N4iT8vvMW8eH93bI7
         3rJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776916016; x=1777520816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9GSW2Phd9oXEma1/9uB2odB8s4SQeX9sU39sUkX9FY=;
        b=cKErXih4UItVmDpuIX8dUVH+vfHblswSqkVNI0/HtekuJZ7dVWkZBiEL3xSyG4HZ0m
         gmwQwwW+Ld5OuY4/oqePHRGDoeS50oiCYNxqnfChbNzYPXJ6An/WOqJdIfyzeOgWrntP
         ao6rWW89IeI8yxZ9y275U2JKJlNIMpdyV4sqqj/ltdFq/bN0iyOEwOr3eq0S185Pn8md
         4WoMJIbHzQQNrnjAUX+sX/CuIR10PyGnDOjlgpg5m8eEsy6p2U5fAdBrxX+TORcPjnFL
         en1CS0NyJEJIVYlJdXlzrNmawEmnDkZ9h4szqrC4yM0fw8kYNiywxFNw2VM7bndf0Y/x
         KH8g==
X-Forwarded-Encrypted: i=1; AFNElJ9CZ2PIfDKdvXTe2Fa9bqf/yyPtcW4p12958KsRg22C7slq2D6rcTyJr6PS/6AcRUz4t4aNk8fONEOvQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIOE6pxmJ6RP0VgW9+37ihlhDjlwP8jjwUwYp6qM5Zvy79dPbL
	rOtPGM/zgno1X1dza/pF4pkHUjLWjQkMHbUMaIPyiFhCqIe3PvzbWfiwrUtEmpXcPIOnk9lzTHl
	evFDTriAJfeWCx6paM9H3NeFPSqDVLRA=
X-Gm-Gg: AeBDiesWzHBFRKI8zSuXMsMxx70OIoykeuYQuI6FTSqUxDiuqKaEe2n04/Cp+lqzRgl
	ZcanUXW/JmEFKDh4dT5S2Rcn+burZVRdwjnqKsB2U6NRiFEVddY28RPtcoGaqKoRc1ubGgAgtsx
	c1rVa6WeKQ/kVnwlhODgJ5/2QmEc5WsBhUBqU++cr1pxDHitk8VV3HwkvKLysA/7c6rVQC/le9g
	EaYNP4y919fL0NLZOah+7X0JbGqbKLF+ABUL8EeAHDgUnmQeJVPRZvR/xQ1RqN8sT6WhADHBSM+
	naltNPm4/Ya6wRY=
X-Received: by 2002:a17:907:1c10:b0:ba8:7b3:176b with SMTP id
 a640c23a62f3a-ba807b322c2mr525199966b.49.1776916015972; Wed, 22 Apr 2026
 20:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260119-patchv2-k1-thermal-v3-0-3d82c9ebe8a4@163.com>
 <20260119-patchv2-k1-thermal-v3-3-3d82c9ebe8a4@163.com> <CANAwSgTOmbb+Vzhck1riVaFM89zYLdMe3dn6DRHrc7p+rkR2DQ@mail.gmail.com>
 <DHZM9D696P6G.NVPMN20XXM3H@mailbox.org>
In-Reply-To: <DHZM9D696P6G.NVPMN20XXM3H@mailbox.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 23 Apr 2026 09:16:40 +0530
X-Gm-Features: AQROBzAWkvO9UaeaqqzBdwiPl2IRb1rnMdxCjeOVlETl66PPfZzCcgEwKW1aUrg
Message-ID: <CANAwSgQCOoC7aZWhekqmVS3OTTyzTyDaSxsTsdfMUphxx8vX+Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: Add thermal sensor for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: Shuwei Wu <shuweiwoo@163.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_204659_450765_13CA10A2 
X-CRM114-Status: GOOD (  26.70  )
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

SGkgU2h1d2VpLAoKT24gV2VkLCAyMiBBcHIgMjAyNiBhdCAxNjowNywgU2h1d2VpIFd1IDxzaHV3
ZWkud3VAbWFpbGJveC5vcmc+IHdyb3RlOgo+Cj4gSGkgQW5hbmQsCj4KPiBUaGFuayB5b3UgZm9y
IHRoZSBjYXJlZnVsIHJldmlldy4KPgo+IE9uIFdlZCBBcHIgMjIsIDIwMjYgYXQgMTo1NiBQTSBD
U1QsIEFuYW5kIE1vb24gd3JvdGU6Cj4gPiBIaSBTaHV3ZWksCj4gPgo+ID4gT24gTW9uLCAxOSBK
YW4gMjAyNiBhdCAwODoxMywgU2h1d2VpIFd1IDxzaHV3ZWl3b29AMTYzLmNvbT4gd3JvdGU6Cj4g
Pj4KPiA+PiBJbmNsdWRlIHRoZSBUaGVybWFsIFNlbnNvciBub2RlIGluIHRoZSBTcGFjZW1pVCBL
MSBkdHNpCj4gPj4gd2l0aCBkZWZpbml0aW9ucyBmb3IgcmVnaXN0ZXJzLCBjbG9ja3MsIGFuZCBp
bnRlcnJ1cHRzLgo+ID4+IEFkZGl0aW9uYWxseSwgY29uZmlndXJlIHRoZXJtYWwgem9uZXMgZm9y
IHRoZSBzb2MsIHBhY2thZ2UsIGdwdSwgYW5kCj4gPj4gY2x1c3RlcnMgdG8gZW5hYmxlIHRlbXBl
cmF0dXJlIG1vbml0b3JpbmcgdmlhIHRoZSB0aGVybWFsIGZyYW1ld29yay4KPiA+Pgo+ID4+IFNp
Z25lZC1vZmYtYnk6IFNodXdlaSBXdSA8c2h1d2Vpd29vQDE2My5jb20+Cj4gPj4gLS0tCj4gPj4g
Q2hhbmdlcyBpbiB2MjoKPiA+PiAtIFVwZGF0ZSBjb21wYXRpYmxlIHRvICJzcGFjZW1pdCxrMS10
c2Vuc29yIgo+ID4+IC0tLQo+ID4+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0
c2kgfCAxMDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+PiAgMSBmaWxl
IGNoYW5nZWQsIDEwMSBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMS5kdHNpCj4gPj4gaW5kZXggNzgxOGNhNDk3OWI2Li4wZmU3Mzk2ZWE2ZTQgMTAwNjQ0
Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpCj4gPj4gKysr
IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpCj4gPj4gQEAgLTMzOCw2ICsz
MzgsOTYgQEAgb3NjXzMyazogY2xvY2stMzJrIHsKPiA+PiAgICAgICAgICAgICAgICAgfTsKPiA+
PiAgICAgICAgIH07Cj4gPj4KPiA+IEkgZmVlbCB0aGUgdGhlcm1hbCB6b25lcyBhcHBlYXIgdG8g
YmUgY29uZmlndXJlZCBhdCBzaWduaWZpY2FudGx5Cj4gPiBoaWdoZXIgdGVtcGVyYXR1cmVzCj4g
PiBjb21wYXJlZCB0byB0aGUgdGhyZXNob2xkcyB0eXBpY2FsbHkgdXNlZCBpbiBjb21tZXJjaWFs
LWdyYWRlIGFuZAo+ID4gaW5kdXN0cmlhbC1ncmFkZSBkZXZpY2UKPiA+IHRlc3QgZW52aXJvbm1l
bnRzIDEuMiBUZXN0IEVudmlyb25tZW50Cj4gPgo+ID4gWzFdIGh0dHBzOi8vd3d3LnNwYWNlbWl0
LmNvbS9jb21tdW5pdHkvZG9jdW1lbnQvaW5mbz9sYW5nPWVuJm5vZGVwYXRoPWhhcmR3YXJlL2tl
eV9zdG9uZS9rMS9rMV9ody9hdmxfdmVyaV9zb3AubWQKPgo+IFRoZSBvZmZpY2lhbCBkZWZpbml0
aW9uIG9mIHRoaXMgdGVtcGVyYXR1cmUgcmFuZ2UgaXMgYXMgZm9sbG93czoKPiAiVGhlIENQVSBk
ZWxpdmVycyBzdGFibGUgYW5kIHJlbGlhYmxlIGNvbXB1dGluZyBwb3dlciBmcm9tIC00MMKwQyB0
byA4NcKwQywKPiBjb21wbHlpbmcgd2l0aCB0aGUgZGVtYW5kaW5nIHJlcXVpcmVtZW50cyBvZiBp
bmR1c3RyaWFsIGFwcGxpY2F0aW9ucy4iCj4KPiBbMV0gaHR0cHM6Ly93d3cuc3BhY2VtaXQuY29t
L2NvbW11bml0eS9kb2N1bWVudC9pbmZvP2xhbmc9ZW4mbm9kZXBhdGg9aGFyZHdhcmUva2V5X3N0
b25lCj4gL2sxL2sxX2RvY3Mvcm9vdF9vdmVydmlldy5tZAo+Cj4gVGhlcmVmb3JlLCB0aGlzIGRv
ZXMgbm90IG1lYW4gdGhhdCB0aGUgY2hpcCBjYW5ub3QgY29udGludWUgdG8gd29yayBhYm92ZQo+
IHRoaXMgdGVtcGVyYXR1cmUuCj4KPiBUaGUgZGF0YXNoZWV0IGFsc28gZGVmaW5lcyBhbm90aGVy
IHRlbXBlcmF0dXJlLCB0aGUgSnVuY3Rpb24gVGVtcGVyYXR1cmUsCj4gd2hpY2ggcmVwcmVzZW50
cyB0aGUgY2hpcCdzIHRlbXBlcmF0dXJlIGxpbWl0LiBFeGNlZWRpbmcgdGhpcyB0ZW1wZXJhdHVy
ZQo+IG1heSBwZXJtYW5lbnRseSBkYW1hZ2UgdGhlIGNoaXAuCj4KPiBbMl0gaHR0cHM6Ly93d3cu
c3BhY2VtaXQuY29tL2NvbW11bml0eS9kb2N1bWVudC9pbmZvP2xhbmc9ZW4mbm9kZXBhdGg9aGFy
ZHdhcmUva2V5X3N0b25lCj4gL2sxL2sxX2RvY3MvazFfdXNlcm1hbnVhbC80LkVsZWN0cmljYWxf
Q2hhcmFjdGVyaXN0aWNzLm1kCj4KT2ssCj4gPgo+ID4gVGhlcm1hbCB6b25lcyBzaG91bGQgYmUg
ZGVmaW5lZCBhcyBwYXJ0IG9mIHRoZSBTQkMgYm9hcmQgZGVzaWduLAo+ID4gd2l0aCB0aGUgb3B0
aW9uIHRvIGludGVncmF0ZSBQV00tY29udHJvbGxlZCBmYW4gc3VwcG9ydCBpbiB0aGUgZnV0dXJl
Lgo+Cj4gVGhlc2UgdGhlcm1hbCB6b25lcyBkZXNjcmliZSBmaXhlZCBoYXJkd2FyZSBwcm9wZXJ0
aWVzIG9mIHRoZSBLMSBTb0MgaXRzZWxmLAo+IGFuZCBhcmUgY29tbW9uIGZvciBhbGwgSzEtYmFz
ZWQgYm9hcmRzLgo+Ck9rLAo+IEFuZCB0aGlzIGlzIGFsc28gZG9uZSBpbiBBbGx3aW5uZXIgRDEs
IFN0YXJGaXZlIEpINzExMCBhbmQgc29tZSBvdGhlciBjaGlwcy4KPgpPayB0aGFua3MuCj4gPgo+
ID4gVGhhbmtzCj4gPiAtQW5hbmQKPiBCZXN0IHJlZ2FyZHMsCj4gU2h1d2VpIFd1ClRoYW5rcwot
QW5hbmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
