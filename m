Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829AEC3ABDA
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 18:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=akZFM0frTzaoZD17ZqdXWPYx7jAivQgRRwuwE8ajris=; b=0VS9i/Bx7c/qnr
	+8kzIq5qeStx1l0ZNgKRPKrLKNlJwSFjQ8jCl++tdUmza0pyYkjnoYajtSgSLMBHu0PhbhQYusAsf
	ZhC3bWwjZnKr8+XBlMyYy3c3AVAIrHb8mvOna9wO9lmIPgTAsEOIv3xVkjtT32/reTEBlebylg8Qc
	vmNv+lsbr2raGyQOTeJPoPRS7cQtKtR9nFFBaSlhopuRMZ26maVroJ04oENJMECeQbYpfnJNMz8qU
	VhPcH3GUMejKB5Nt3uwntztosm6WekQvvcZWcQbWTE4NUxL0e2TuU4CUdAqHQK2ddXKuGOF2TdYDr
	Y7OPYEsNJDx8Q/bq7icw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHDb-0000000G5ZV-1hI6;
	Wed, 14 May 2025 18:52:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFF2p-0000000FlXM-206I
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 May 2025 16:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fkj+eXJWD3zKSY4LtYDXeZfa8DE+DGWzE6g5lQpJzPc=; b=F7acAI6nXox79SLmT8fAduUPwq
	g9gSBKcybmlfUnd1uSnjAlztuYucpwLnJhVXCxPglKErSQeVHIc7WD4vAngdKce97GbycqxWjeMFe
	jat3VJhlHi/Gy527us7DrFZ/XVS4/BR6EKVD/8+LvYaIBHUw6jg8y9dRkI50d4QuFIRYfU/dY7mvR
	AZ/VNp88/Fg+YsBDjljDTnsxHrBKQeEQD2prtqS2VEVcKWxxysOoekq4hOM/cRGd7i88jliZIg12Y
	p9EYGZIIGFFTpk5l+wAG8uv4pdulYt+CYodDIYldpMs4Ls5MjoQzVA+6NXSmHt3D611p8tU+s8v7n
	q8ma4F7g==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFF2m-0000000HGHY-2Kv2
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 16:33:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso291965e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 09:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240398; x=1747845198; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fkj+eXJWD3zKSY4LtYDXeZfa8DE+DGWzE6g5lQpJzPc=;
        b=St/kEVv1wGqspPTDTD5ihTdaQBlBFEHgAgAZBZFnvDzE4Jy9pv/Hb78jTW+LCNdE1i
         ioqhV96Uv4ls9KujPzlQ8wsQ70R+AIXNkSruPLoLbhS2qVdB2sCDsJkdzrysXqxiTHD5
         G9cUrxFUz2h/0bGhy9206vSDLloTO2QTwLxIy6Bzcpav0YK4v3L7kqwXSGxCC5QQ/JVr
         U2xVBxkG7+d0J5wudzP/uge07j/bmkTCh0gUGUkRnmFVYzMz6yRK407pgbDDXZ00N1YZ
         UnKiueaUcWx1Kn87cTFZlshchMGpFNL8c9YGlmuFqjAaPObHElnUDzGF3sDNnk80t7ZV
         D85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240398; x=1747845198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkj+eXJWD3zKSY4LtYDXeZfa8DE+DGWzE6g5lQpJzPc=;
        b=KztcOuxN5AVIa4ud89paPRl0viQpYp6DlJNGgNYaU4V9x/bcsDLOoqMIkEtTs1X6Vk
         nOhn4dWE4wNnqisypwvLBoZLp4C8YcRXu/UdkLh+ySQEYm5gFgN0j43n2x1UxoWyX1mq
         QVGGi5JeaysE7R+SF3saKeIXMfELHaLg7ruyibieruuH+MFajNVWRUwSZMbo92BvNpJb
         4jWV5ruCsZ2KRBjXsD3C0or3RzAAmMzI+e1aedkmIm4PVufDeMMJ5+tPxc6VBw0OcLR1
         JgwGbefjR4Z1k4QfS7lMX6Z4Ekdav2w0USfy/kvYRU/HhDkIPya5LM5hr7LaAlNSDs81
         DVXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl7CYD+9382ZNXkOaXoAurAJM/wQQcfI7A5R7tGETlpMnIH4qa9cLl7C8l/zPLNrJ5lFOfElMjL3b3Lg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx++koXfsSiin6Kqa68mlM7OK4rNWumiE4rFNmOmo8q9hptItnO
	wY1vgSc3uPCPxbG/OyorvUIlibvspkem7G0QyAXa7qXY8TwTpLGgeP90osrlRQ==
X-Gm-Gg: ASbGncvk8pfv0sfY4l89m7G+5QtF2d6Ft7Irz0PEa6bEEKkiCE3IkCskBQqiZwocnuI
	OzpgJBldYV0zSV9PbwlxeciYsRS5aJ2K5kM3B4tlSNloBxDXV72HyLXQYy96+PPGU80OZeqAVxY
	XtH7QWXKtReOLX5SlZKRCJH2hQFqhGSaameRzurQhdtN/xWCIEkVBj0lKOTwZy1amufx6T3SH7P
	d2IEBtTxutFjdzLDloMu4fSqO20WPj9Bg9fivCkWDs2lbYRsp3gy1HafLpxPEeqn5NWNQl7OGSJ
	V7zBwH8XfQTeUcFhERivKIW6UHAFrNJCkfrNcKZd/zZzpOM+mS8LqkMhqMmEa/NkMKZ5Zdn3YWM
	cXH/+JeKxZDHL5w==
X-Google-Smtp-Source: AGHT+IFPC9mL+DlWLaHagO2PQibPE5IAsRnVspZO3QJiVtK+BzyLXCvkMi6qfUPBM+PpkrIO8X/e5g==
X-Received: by 2002:a05:600c:b8c:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-442f4c8fe71mr33161715e9.16.1747240397611;
        Wed, 14 May 2025 09:33:17 -0700 (PDT)
Received: from thinkpad (112.8.30.213.rev.vodafone.pt. [213.30.8.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951b57sm37447745e9.21.2025.05.14.09.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:33:17 -0700 (PDT)
Date: Wed, 14 May 2025 17:33:15 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <dglc4iqxxrjnbpqazi2xuzdblpcszcdb7q5nlz2ezzzyeujpvc@672myo6djcji>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
 <8006a0ae-b45d-d22f-65a9-20a65f3224b0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8006a0ae-b45d-d22f-65a9-20a65f3224b0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_173320_699404_CAA6EE0A 
X-CRM114-Status: GOOD (  29.63  )
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

T24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgMTI6MDA6MTFQTSArMDUzMCwgS3Jpc2huYSBDaGFpdGFu
eWEgQ2h1bmRydSB3cm90ZToKPiAKPiAKPiBPbiA1LzgvMjAyNSAxMjo0MCBQTSwgTWFuaXZhbm5h
biBTYWRoYXNpdmFtIHdyb3RlOgo+ID4gVGhlIFBDSSBsaW5rLCB3aGVuIGRvd24sIG5lZWRzIHRv
IGJlIHJlY292ZXJlZCB0byBicmluZyBpdCBiYWNrLiBCdXQgdGhhdAo+ID4gY2Fubm90IGJlIGRv
bmUgaW4gYSBnZW5lcmljIHdheSBhcyBsaW5rIHJlY292ZXJ5IHByb2NlZHVyZSBpcyBzcGVjaWZp
YyB0bwo+ID4gaG9zdCBicmlkZ2VzLiBTbyBhZGQgYSBuZXcgQVBJIHBjaV9ob3N0X2hhbmRsZV9s
aW5rX2Rvd24oKSB0aGF0IGNvdWxkIGJlCj4gPiBjYWxsZWQgYnkgdGhlIGhvc3QgYnJpZGdlIGRy
aXZlcnMgd2hlbiB0aGUgbGluayBnb2VzIGRvd24uCj4gPiAKPiA+IFRoZSBBUEkgd2lsbCBpdGVy
YXRlIHRocm91Z2ggYWxsIHRoZSBzbG90cyBhbmQgY2FsbHMgdGhlIHBjaWVfZG9fcmVjb3Zlcnko
KQo+ID4gZnVuY3Rpb24gd2l0aCAncGNpX2NoYW5uZWxfaW9fZnJvemVuJyBhcyB0aGUgc3RhdGUu
IFRoaXMgd2lsbCByZXN1bHQgaW4gdGhlCj4gPiBleGVjdXRpb24gb2YgdGhlIEFFUiBGYXRhbCBl
cnJvciBoYW5kbGluZyBjb2RlLiBTaW5jZSB0aGUgbGluayBkb3duCj4gPiByZWNvdmVyeSBpcyBw
cmV0dHkgbXVjaCB0aGUgc2FtZSBhcyBBRVIgRmF0YWwgZXJyb3IgaGFuZGxpbmcsCj4gPiBwY2ll
X2RvX3JlY292ZXJ5KCkgaGVscGVyIGlzIHJldXNlZCBoZXJlLiBGaXJzdCB0aGUgQUVSIGVycm9y
X2RldGVjdGVkCj4gPiBjYWxsYmFjayB3aWxsIGJlIHRyaWdnZXJlZCBmb3IgdGhlIGJyaWRnZSBh
bmQgdGhlIGRvd25zdHJlYW0gZGV2aWNlcy4gVGhlbiwKPiA+IHBjaV9ob3N0X3Jlc2V0X3Nsb3Qo
KSB3aWxsIGJlIGNhbGxlZCBmb3IgdGhlIHNsb3QsIHdoaWNoIHdpbGwgcmVzZXQgdGhlCj4gPiBz
bG90IHVzaW5nICdyZXNldF9zbG90JyBjYWxsYmFjayB0byByZWNvdmVyIHRoZSBsaW5rLiBPbmNl
IHRoYXQncyBkb25lLAo+ID4gcmVzdW1lIG1lc3NhZ2Ugd2lsbCBiZSBicm9hZGNhc3RlZCB0byB0
aGUgYnJpZGdlIGFuZCB0aGUgZG93bnN0cmVhbSBkZXZpY2VzCj4gPiBpbmRpY2F0aW5nIHN1Y2Nl
c3NmdWwgbGluayByZWNvdmVyeS4KPiA+IAo+ID4gSW4gY2FzZSBpZiB0aGUgQUVSIHN1cHBvcnQg
aXMgbm90IGVuYWJsZWQgaW4gdGhlIGtlcm5lbCwgb25seQo+ID4gcGNpX2J1c19lcnJvcl9yZXNl
dCgpIHdpbGwgYmUgY2FsbGVkIGZvciBlYWNoIHNsb3RzIGFzIHRoZXJlIGlzIG5vIHdheSB3ZQo+
ID4gY291bGQgaW5mb3JtIHRoZSBkcml2ZXJzIGFib3V0IGxpbmsgcmVjb3ZlcnkuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IE1hbml2YW5uYW4gU2FkaGFzaXZhbSA8bWFuaXZhbm5hbi5zYWRoYXNp
dmFtQGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2kt
aG9zdC1jb21tb24uYyB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAg
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLWhvc3QtY29tbW9uLmggfCAgMSArCj4gPiAgIGRy
aXZlcnMvcGNpL3BjaS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgIGRyaXZl
cnMvcGNpL3BjaWUvZXJyLmMgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gPiAgIDQgZmlsZXMg
Y2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9wY2ktaG9zdC1jb21tb24uYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
cGNpLWhvc3QtY29tbW9uLmMKPiA+IGluZGV4IGY5M2JjNzAzNGU2OTcyNTA3MTE4MzNhNTE1MWY3
ZWYxNzdjZDYyYTAuLmY5MTZmMGE4NzRhNjFkZGZiZmQ5OWY5Njk3NWMwMGZiNjZkZDIyNGMgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1ob3N0LWNvbW1vbi5jCj4g
PiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS1ob3N0LWNvbW1vbi5jCj4gPiBAQCAt
MTIsOSArMTIsMTEgQEAKPiA+ICAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gPiAgICNpbmNsdWRl
IDxsaW51eC9vZl9hZGRyZXNzLmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9vZl9wY2kuaD4KPiA+
ICsjaW5jbHVkZSA8bGludXgvcGNpLmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9wY2ktZWNhbS5o
Pgo+ID4gICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gPiArI2luY2x1ZGUg
Ii4uL3BjaS5oIgo+ID4gICAjaW5jbHVkZSAicGNpLWhvc3QtY29tbW9uLmgiCj4gPiAgIHN0YXRp
YyB2b2lkIGdlbl9wY2lfdW5tYXBfY2ZnKHZvaWQgKnB0cikKPiA+IEBAIC05Niw1ICs5OCw2MSBA
QCB2b2lkIHBjaV9ob3N0X2NvbW1vbl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiA+ICAgfQo+ID4gICBFWFBPUlRfU1lNQk9MX0dQTChwY2lfaG9zdF9jb21tb25fcmVtb3Zl
KTsKPiA+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfUENJRUFFUikKPiA+ICtzdGF0aWMgcGNpX2Vy
c19yZXN1bHRfdCBwY2lfaG9zdF9yZXNldF9zbG90KHN0cnVjdCBwY2lfZGV2ICpkZXYpCj4gPiAr
ewo+ID4gKwlpbnQgcmV0Owo+ID4gKwo+ID4gKwlyZXQgPSBwY2lfYnVzX2Vycm9yX3Jlc2V0KGRl
dik7Cj4gPiArCWlmIChyZXQpIHsKPiA+ICsJCXBjaV9lcnIoZGV2LCAiRmFpbGVkIHRvIHJlc2V0
IHNsb3Q6ICVkXG4iLCByZXQpOwo+ID4gKwkJcmV0dXJuIFBDSV9FUlNfUkVTVUxUX0RJU0NPTk5F
Q1Q7Cj4gPiArCX0KPiA+ICsKPiA+ICsJcGNpX2luZm8oZGV2LCAiU2xvdCBoYXMgYmVlbiByZXNl
dFxuIik7Cj4gPiArCj4gPiArCXJldHVybiBQQ0lfRVJTX1JFU1VMVF9SRUNPVkVSRUQ7Cj4gPiAr
fQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIHBjaV9ob3N0X3JlY292ZXJfc2xvdHMoc3RydWN0IHBj
aV9ob3N0X2JyaWRnZSAqaG9zdCkKPiA+ICt7Cj4gPiArCXN0cnVjdCBwY2lfYnVzICpidXMgPSBo
b3N0LT5idXM7Cj4gPiArCXN0cnVjdCBwY2lfZGV2ICpkZXY7Cj4gPiArCj4gPiArCWZvcl9lYWNo
X3BjaV9icmlkZ2UoZGV2LCBidXMpIHsKPiA+ICsJCWlmICghcGNpX2lzX3Jvb3RfYnVzKGJ1cykp
Cj4gYnVzIGhlcmUgaXMgYWx3YXlzIGNvbnN0YW50IGhlcmUsIHdlIG1heSBuZWVkIHRvIGhhdmUg
Y2hlY2sKPiBmb3IgZGV2IGhlcmUgbGlrZSBpZiAoIXBjaV9pc19yb290X2J1cyhkZXYtPmJ1cykp
CgpHb29kIGNhdGNoISBBbW1lbmRlZCBpdCB3aGlsZSBhcHBseWluZy4KCi0gTWFuaQoKLS0gCuCu
ruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
