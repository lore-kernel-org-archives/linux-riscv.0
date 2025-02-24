Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0B0C021B3
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 06:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tav3vXpsbUzQaJxHgqhAt9iUxN3sEXfWI6RDJu46+4=; b=i03/EzdfYlQD68
	JBkFvYNPGwIGaSOfytzISzsj7YKZRo2xo5wQOSc9uWCDCsZPO4R/vBm2RQT0mOi9JzEtTAbUtm2eh
	UDH9Lihuv5Hx9nnByEMLJYaCw0/Mqb2CuQiGYeErcgaV9H5MLsvdErdoZJeU+E3e2xSkTMozRx795
	CEn7Q+d5SrqCslpf6FBkVSUNEEhZFmMO76UqAEGJVg4NJMI4ymOXSu1GWTC+YFwUtfcC2Xqha4fHL
	PwClAaVtIFayRZrdX+jtRQlsxL1EOoexiuutIgVXpkiaOXuJTrKjU5lQkNdt2KwuIO99St5aMd1Tg
	8KQLnZIIwiURlpr+3fZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRwh-0000000CReL-3bA7;
	Mon, 24 Feb 2025 06:28:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmRwe-0000000CRdr-3MZL
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 06:28:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220c8eb195aso86987405ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 23 Feb 2025 22:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740378480; x=1740983280; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PETCcKuB37T/wvrGB8m2s5znMowGvGlKoqhimbx768Q=;
        b=NYBW5jNcjFy0KIyTBptClzRu1RRGTtWKweJ+SHvL/d2GAyotOiHXwpYhrQWdA2ojql
         /9gVYpO+KV+nTgZfTyDc5xqUhFDODm4iJgF/xwrjKQ+ehoHrd0Eu3FJBzcYbGcZXQ58c
         p83ZnGRPsE/sc6KjMFYSUNZhe60Jo0sn74DDvLoaEslE6WpvsQleTAdaaosDUdA9XpWd
         QgCP5LE54cVhJzHV+giQrIcKfspoZpXvXnDQI2Jkuh02VBqGe4YBJBLGFTMzqfmHBY3t
         a4YkPISksQo2wtVJdsjdCwusDpMd/B7rGOJeWCuFU9eff7S+rLOAHPdccSvkb/ku9XTt
         hqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740378480; x=1740983280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PETCcKuB37T/wvrGB8m2s5znMowGvGlKoqhimbx768Q=;
        b=mWS7/KyG/qWR3a9NJqR40NGZFucv5L+crEYvW3vNIyo1cLGslF9ws3/ZajBI8L19WH
         Kthu6Nc8krvv+pYaS93ZcUOQ7vR/PcyMx/owH28LK9iqOP39iVF40wzpItb464INRuuj
         4y1xxp/pQHNlwEsBSEPNesQU32RyD58jJIoj2RaK2lCAYFVre3WTv1c6XhI0qxYjgRX0
         4oMHGIv8AXZIUxp+Hm+1Y9IfmfT/o7AbAmf8dNiX0QkTsxZs5vsxPb0xqmvyTW0uRNR/
         /RDJXry7HpWC5/ngl4HPLXs8weebjxv7qE2+A2UWyB8c5ZytMqHnUUgSCzDtuk+G98r/
         QrdA==
X-Forwarded-Encrypted: i=1; AJvYcCU9mBunL0zmSgBhxfdfCEalFlqDpeByVkUbxg4ovEzM2TG0v2zldfhIwTO9EzrtDzU1aJEYQhz1jcmdqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjEN4xf+DMPO4BaJWX43WquzavvjdQ8WF422NjA49S0sfqYYtK
	YhKyCncv92OkUs0GnoAIUmLBBBCymXXiRMAYd6oS9BYMqU+MkTg7xhALvCCv5w==
X-Gm-Gg: ASbGnct03lmOOi6yBxVO2RSgrX2eDPRWwuycUej45SMGMYeAZ+YfVFCiHq6wOrevfcu
	Rf1RNTRNMByOuk5Idjl/ukaWxirV3lOhjqIgyqA8AEKbeiuuzzWYjayzufeGWrR0x/4JnZ1r9k1
	BHxh4qarI3eRlOcNB7VH28ujALKuVGM39xQEp0E1coIrVjkRAHKqEShE7VWgSsRlO9b92AwxpeF
	E+GKk9DT1kXeCAhRkak8FmrtHw3xXPbDZ+5ZTjJ7MNo0BNIDDVESkF/659XrHVrQsf7V1JyE4r8
	gl8sS61DT6GX4o9bkIcRVkG1jTZ8uO84miUU
X-Google-Smtp-Source: AGHT+IH1vvCmbqlYXXcs0TtiIJdkasozODilOIXoG9XWVanlEyl8M/uGy74MbXPTQ47Drg6++WedGA==
X-Received: by 2002:a17:903:18e:b0:220:c178:b3e with SMTP id d9443c01a7336-2219ff50bf0mr205208335ad.16.1740378479832;
        Sun, 23 Feb 2025 22:27:59 -0800 (PST)
Received: from thinkpad ([36.255.17.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7326a52f865sm15679226b3a.80.2025.02.23.22.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 22:27:59 -0800 (PST)
Date: Mon, 24 Feb 2025 11:57:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh+dt@kernel.org>,
	Chen Wang <unicornxw@gmail.com>, kw@linux.com,
	u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
	bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
	inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
	lpieralisi@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	pbrobinson@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
Subject: Re: [PATCH v3 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Message-ID: <20250224062750.nqgugglenzp76z3d@thinkpad>
References: <PN0PR01MB5662DF3C3D71A274A2E5B9C2FEC72@PN0PR01MB5662.INDPRD01.PROD.OUTLOOK.COM>
 <20250221221330.GA367172@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221221330.GA367172@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_222800_858009_5671C53E 
X-CRM114-Status: GOOD (  22.11  )
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

T24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMDQ6MTM6MzBQTSAtMDYwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBbY2MtPnRvOiBSb2JdCj4gCj4gT24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMTE6Mjk6
MjBBTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+ID4gT24gMjAyNS8yLzIwIDI6MjIsIEJqb3Ju
IEhlbGdhYXMgd3JvdGU6Cj4gPiA+IE9uIFdlZCwgRmViIDEyLCAyMDI1IGF0IDAxOjU0OjExUE0g
KzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPiA+ID4gPiBPbiAyMDI1LzIvMTIgMTI6MjUsIEJqb3Ju
IEhlbGdhYXMgd3JvdGU6Cj4gPiA+ID4gWy4uLi4uLl0KPiA+ID4gPiA+ID4gcGNpZV9yYzEgYW5k
IHBjaWVfcmMyIHNoYXJlIHJlZ2lzdGVycyBpbiBjZG5zX3BjaWUxX2N0cmwuIEJ5IHVzaW5nCj4g
PiA+ID4gPiA+IGRpZmZlcmVudCAic29waGdvLGNvcmUtaWQiIHZhbHVlcywgdGhleSBjYW4gZGlz
dGluZ3Vpc2ggYW5kIGFjY2Vzcwo+ID4gPiA+ID4gPiB0aGUgcmVnaXN0ZXJzIHRoZXkgbmVlZCBp
biBjZG5zX3BjaWUxX2N0cmwuCj4gPiA+ID4gPiBXaGVyZSBkb2VzIGNkbnNfcGNpZTFfY3RybCBm
aXQgaW4gdGhpcyBleGFtcGxlPyAgRG9lcyB0aGF0IGVuY2xvc2UKPiA+ID4gPiA+IGJvdGggcGNp
ZV9yYzEgYW5kIHBjaWVfcmMyPwo+ID4gPiA+IGNkbnNfcGNpZTFfY3RybCBpcyBkZWZpbmVkIGFz
IGEgc3lzY29uIG5vZGUswqAgd2hpY2ggY29udGFpbnMgcmVnaXN0ZXJzCj4gPiA+ID4gc2hhcmVk
IGJ5IHBjaWVfcmMxIGFuZCBwY2llX3JjMi4gSW4gdGhlIGJpbmRpbmcgeWFtbCBmaWxlLCBJIGRy
ZXcgYSBkaWFncmFtCj4gPiA+ID4gdG8gZGVzY3JpYmUgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVu
IHRoZW0sIGNvcHkgaGVyZSBmb3IgeW91ciBxdWljawo+ID4gPiA+IHJlZmVyZW5jZToKPiA+ID4g
PiAKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgKy0tIENvcmUgKExpbmswKSA8LS0tPiBw
Y2llX3JjMSAgKy0tLS0tLS0tLS0tLS0tLS0tKwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICB8Cj4g
PiA+ID4gKyAgICAgIENhZGVuY2UgSVAgMiAtLSsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgY2Ruc19wY2llMV9jdHJsIHwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgfAo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICArLS0gQ29yZSAoTGluazEpIDwtLS0+IHBjaWVfcmMyICAr
LS0tLS0tLS0tLS0tLS0tLS0rCj4gPiA+ID4gCj4gPiA+ID4gVGhlIGZvbGxvd2luZyBpcyBhbiBl
eGFtcGxlIHdpdGggY2Ruc19wY2llMV9jdHJsIGFkZGVkLiBGb3Igc2ltcGxpY2l0eSwgSQo+ID4g
PiA+IGRlbGV0ZWQgcGNpZV9yYzAuCj4gPiA+Cj4gPiA+IExvb2tzIGdvb2QuICBJdCB3b3VsZCBi
ZSBuaWNlIGlmIHRoZXJlIHdlcmUgc29tZSBuYW1pbmcgc2ltaWxhcml0eSBvcgo+ID4gPiBjb21t
ZW50IG9yIG90aGVyIGhpbnQgdG8gY29ubmVjdCBzb3BoZ28sY29yZS1pZCB3aXRoIHRoZSBzeXNj
b24gbm9kZS4KPiA+ID4gCj4gPiA+ID4gcGNpZV9yYzE6IHBjaWVANzA2MjAwMDAwMCB7Cj4gPiA+
ID4gIMKgwqDCoCBjb21wYXRpYmxlID0gInNvcGhnbyxzZzIwNDItcGNpZS1ob3N0IjsKPiA+ID4g
PiAgwqDCoMKgIC4uLi4uLiAvLyBob3N0IGJyaWRlIGxldmVsIHByb3BlcnRpZXMKPiA+ID4gPiAg
wqDCoMKgIGxpbnV4LHBjaS1kb21haW4gPSA8MT47Cj4gPiA+ID4gIMKgwqDCoCBzb3BoZ28sY29y
ZS1pZCA9IDwwPjsKPiA+ID4gPiAgwqDCoMKgIHNvcGhnbyxzeXNjb24tcGNpZS1jdHJsID0gPCZj
ZG5zX3BjaWUxX2N0cmw+Owo+ID4gPiA+ICDCoMKgwqAgcG9ydCB7Cj4gPiA+ID4gIMKgwqDCoMKg
wqDCoMKgIC8vIHBvcnQgbGV2ZWwgcHJvcGVydGllcwo+ID4gPiA+ICDCoMKgwqDCoMKgwqDCoCB2
ZW5kb3ItaWQgPSA8MHgxZjFjPjsKPiA+ID4gPiAgwqDCoMKgwqDCoMKgwqAgZGV2aWNlLWlkID0g
PDB4MjA0Mj47Cj4gPiA+ID4gIMKgwqDCoMKgwqDCoMKgIG51bS1sYW5lcyA9IDwyPjsKPiA+ID4g
PiAgwqDCoMKgIH07Cj4gPiA+ID4gfTsKPiA+ID4gPiAKPiA+ID4gPiBwY2llX3JjMjogcGNpZUA3
MDYyODAwMDAwIHsKPiA+ID4gPiAgwqDCoMKgIGNvbXBhdGlibGUgPSAic29waGdvLHNnMjA0Mi1w
Y2llLWhvc3QiOwo+ID4gPiA+ICDCoMKgwqAgLi4uLi4uIC8vIGhvc3QgYnJpZGUgbGV2ZWwgcHJv
cGVydGllcwo+ID4gPiA+ICDCoMKgwqAgbGludXgscGNpLWRvbWFpbiA9IDwyPjsKPiA+ID4gPiAg
wqDCoMKgIHNvcGhnbyxjb3JlLWlkID0gPDE+Owo+ID4gPiA+ICDCoMKgwqAgc29waGdvLHN5c2Nv
bi1wY2llLWN0cmwgPSA8JmNkbnNfcGNpZTFfY3RybD47Cj4gPiA+ID4gIMKgwqDCoCBwb3J0IHsK
PiA+ID4gPiAgwqDCoMKgwqDCoMKgwqAgLy8gcG9ydCBsZXZlbCBwcm9wZXJ0aWVzCj4gPiA+ID4g
IMKgwqDCoMKgwqDCoMKgIHZlbmRvci1pZCA9IDwweDFmMWM+Owo+ID4gPiA+ICDCoMKgwqDCoMKg
wqDCoCBkZXZpY2UtaWQgPSA8MHgyMDQyPjsKPiA+ID4gPiAgwqDCoMKgwqDCoMKgwqAgbnVtLWxh
bmVzID0gPDI+Owo+ID4gPiA+ICDCoMKgwqAgfQo+ID4gPiA+IAo+ID4gPiA+IH07Cj4gPiA+ID4g
Cj4gPiA+ID4gY2Ruc19wY2llMV9jdHJsOiBzeXNjb25ANzA2MzgwMDAwMCB7Cj4gPiA+ID4gIMKg
wqDCoCBjb21wYXRpYmxlID0gInNvcGhnbyxzZzIwNDItcGNpZS1jdHJsIiwgInN5c2NvbiI7Cj4g
PiA+ID4gIMKgwqDCoCByZWcgPSA8MHg3MCAweDYzODAwMDAwIDB4MCAweDgwMDAwMD47Cj4gPiA+
ID4gfTsKPiA+IAo+ID4gSSBmaW5kIGR0YiBjaGVjayB3aWxsIHJlcG9ydCBlcnJvciBkdWUgdG8g
InBvcnQiIGlzIG5vdCBhIGV2YXVsYXRlZCBwcm9wZXJ0eQo+ID4gZm9yIHBjaWUgaG9zdC4gU2hv
dWxkIHdlIGFkZCBhIHZlbmRyb3Igc3BlY2lmaWMgcHJvcGVydHkgZm9yIHRoaXM/Cj4gPiAKPiA+
IE9yIGRvIHlvdSBoYXZlIGFueSBleGFtcGxlIGZvciByZWZlcmVuY2U/Cj4gCgoncG9ydCcgaXMg
bm90IGEgdmFsaWQgbm9kZSBuYW1lLiBJdCBzaG91bGQgYmUgJ3BjaWUnIGFuZCBzaG91bGQgaGF2
ZSB0aGUgdW5pdAphZGRyZXNzIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGJyaWRnZSBCREYuIFBsZWFz
ZSByZWZlciBEVCBub2RlcyBvZiBvdGhlcgpwbGF0Zm9ybXM6CgpodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9hcmNo
L2FybTY0L2Jvb3QvZHRzL3Fjb20vc204NDUwLmR0c2kjbjIwNzEKCi0gTWFuaQoKLS0gCuCuruCu
o+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
