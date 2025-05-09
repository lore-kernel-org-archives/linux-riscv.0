Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885E8C3ABC3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 06:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EzuA6cSICuxKBDV63HyQ6RSayfsmfdNqbTMUXFVheVA=; b=QIA6NhsuEv0AZV
	pPlCTSzh9FNlGzzCbpZFhnjn09MYrBrLv0FOuAD4d49yvg54Dy/BRFamD9SyAeh1on893OtwQeRAs
	R4I1ZVk8LmqNYZYj9WIGwy3/eU5U6Jj+IjewJ5wjxtZZPteXGU0OG9tn2QSL91NKDD8oXt7Qf+Qxx
	NgegTBKjqQky820rzGaVOd1oQoTCTI+/WYXmXw19sRaVY3QRjSlL7CqMpkLWGMC1usWRHakofws9I
	RGOjyt3kcsCFyPzbodKiugytTFPCMqJLtTmCRsWbOaECi+7rWwr14RpXyTYymIzaHnnq6FK9QkurF
	ckO7dHxClDb9qIJVqdAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHbf-00000002fTf-2Sku;
	Fri, 09 May 2025 06:53:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHZe-00000002fBS-0aR4
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 06:51:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so17118835e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 23:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746773468; x=1747378268; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ypnr2THvthLLCavYo7AZWLvgkehzz9yqDu3s2kWxJOs=;
        b=v00CNR3rots8+3PghErsyw85A+3TtG0Pdv/nmUbhqm0faqUp/UHwemLNrrB796qKTy
         +gl7kTn5FwsPch/TlzMVMqFBWv6vSXb+wk8f3X+cwoOAE1yekpN6UbQ5J2dEZ03XODuN
         2/BTGtf5wV0AuQubg8PDCrUih3FEUXAAceL1beNdQPfz4ej9/YCErYLqKqiBQK2gfUXx
         e63gpnRj1bCNY918KywCbf3gcug6aXxxBNDYi3z8Y9LMqj8OG/Ae2UVkH+1009BDMdTt
         V9ijibB4C7LW2Mqjz25qWGYrK1trMsiL8p0u5LONbwtlTYEpujkvhbLBxkmeZoLTTmHI
         MN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773468; x=1747378268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypnr2THvthLLCavYo7AZWLvgkehzz9yqDu3s2kWxJOs=;
        b=ad28CQ8ysvJLivrEMfyCGgbiFATXMI6Sx586Dt2igyfYP5YEoaUFqA8NjoB1SZigxL
         Q/ODGUdk6o0BQyxsL1JZGW7BMQMHP+wnJcdP/+lBHLbjNlHszKCvKrvec72dZKgRF7Rc
         TOqswDgQFpZm4hXdg3zZn1KdNEsHhId1FzZ6Xj9KnvamHZYojVM2lnuoAvFmLZRPzp8z
         RjOOo9rRHKaZ6BnbiISyRrxV8UiVTJqqzvMcxfo8nnHwecydhTE5WzOOaq8065x2nsEJ
         snSnDwAYuMka/1ni3dhR6j9vgNok57+lpGBn/Lvhvr856ksN/lH7YaXIu5oWq8rYK6gJ
         bZnw==
X-Forwarded-Encrypted: i=1; AJvYcCUVWfh8ZgOvnSbdgEINZpxcDbvIJyaLtG01HChs+SfSfY0Eb2miec/IVPp5d/e/I8C2iSr9amAG91jmCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDvEAieFlon0WxqvQe7J+RvoegiMKz8dBVSasPA/81xqbk2ftK
	Y/2VlQAuIVLsCVVFckokISTafKTze7paxxarCUHJY0wMX6Xcav4Frv/3r23jTA==
X-Gm-Gg: ASbGnct+uN4hXKRXkQFhI1TyA3xwartj1dMnFaOStOUwCiOUoVr3mJ6NnSRAJWDPVaB
	hKnelLcoQl7ZLihl8DpYKx+VJrAFyrrMXgaybIDznFfOwCWzYlzQiaRUljzJlrBDqCUtM8jOHQG
	R5cxOxqqP3Q79YkpSmnRMfrbiQgP1YzktNkWKqHg0UjRUrNlwKvg/+I7rfZreiLgyCiBCzXN+gj
	0tfT9YieZON8vPHORlq9sd3reh6tOfKFhQ9IJMhuRPquIO2ENPTGsAhNJbahrplY1BruMRpIka6
	eOLGEkE5ibGMXQH8GWjys3xXJTEf3BGCEpKrcFbhATxfb5tp6p18kl5NnKAULo27FUzJgKjV0Cf
	R9s0hmRn6n9bLE3WWJhvOtBg=
X-Google-Smtp-Source: AGHT+IEBZ+xyU+mtZq/TJ5fu+6WMLt3/ZEPH5kI6vP9q6SNWA2Tnohwr4qj0xsEIdaPCJ/e8n6vxRA==
X-Received: by 2002:a05:6000:178e:b0:391:4889:5045 with SMTP id ffacd0b85a97d-3a1f649be24mr1423812f8f.36.1746773468403;
        Thu, 08 May 2025 23:51:08 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5e1sm2214791f8f.89.2025.05.08.23.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:51:07 -0700 (PDT)
Date: Fri, 9 May 2025 12:21:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ethan Zhao <etzhao1900@gmail.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
Message-ID: <34nnkgbfkccvxiksjb5qaojppcvnkq4l7rchllsppy7cl4fics@4mwtb3rhko5n>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
 <ec5bd8d1-c865-40ac-b03d-9e07875d931c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec5bd8d1-c865-40ac-b03d-9e07875d931c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_235110_183318_F01C1E99 
X-CRM114-Status: GOOD (  12.93  )
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

T24gRnJpLCBNYXkgMDksIDIwMjUgYXQgMDI6MTE6MDBQTSArMDgwMCwgRXRoYW4gWmhhbyB3cm90
ZToKPiAKPiAKPiBPbiA1LzgvMjAyNSAzOjEwIFBNLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3Jv
dGU6Cj4gPiBBIFBDSSBkZXZpY2UgaXMganVzdCBhbm90aGVyIHBlcmlwaGVyYWwgaW4gYSBzeXN0
ZW0uIFNvIGZhaWx1cmUgdG8KPiA+IHJlY292ZXIgaXQsIG11c3Qgbm90IHJlc3VsdCBpbiBhIGtl
cm5lbCBwYW5pYy4gU28gcmVtb3ZlIHRoZSBUT0RPIHdoaWNoCj4gPiBpcyBxdWl0ZSBtaXNsZWFk
aW5nLgo+ID4gCj4gQ291bGQgeW91IGV4cGxhaW4gd2hhdCB0aGUgcmVzdWx0IHdvdWxkIGJlIGlm
IEEgUENJIGRldmljZSBmYWlsZWQgdG8KPiByZWNvdmVyeSBmcm9tIEZBVEFML05PTl9GQVRBTCBh
ZXIgZXJyb3Igb3IgRFBDIGV2ZW50ID8gd2hhdCBlbHNlCj4gYmV0dGVyIGNob2ljZSB3ZSBoYXZl
IGFzIG5leHQgc3RlcCA/IG9yIGp1c3Qgc2F5aW5nICJmYWlsZWQiIHRoZW4KPiBnbyBhaGVhZCA/
Cj4gCgpJZiB0aGUgcmVjb3ZlcnkgaXMgbm90IHBvc3NpYmxlICh3aXRoIGRldmljZSxidXMsaG9z
dCByZXNldCksIHRoZW4gdGhlcmUgaXMKbm90aGluZyBjb3VsZCBiZSBkb25lLgoKLSBNYW5pCgot
LSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
