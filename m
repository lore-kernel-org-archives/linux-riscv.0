Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CACC5AD49
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 16:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yB6x/kC3/JtUnmGauFxYUNHjJ+WaJ4KfjG0tSHZXfrI=; b=Ui1qsQ0SdCzYfm
	HVCPTyPquGdogLejObIdDPW87jKehOEeZt0nw5V42Lsb23HtTKdUwdAbOlKRfCSCl8QjdyswcuPt5
	CPzQYHbA73TYT3c8gSuVxXhUDhbfJisXrMdtgbbj7928VBxeHi+H6Nb3bdUacocH09qALujlToeka
	WI/QZrrLJWblhQJV3VfpF3hv3VDQelLEPFdTy6DDt+RkWnEhUQciSaZeHVhuy1ezar4ZIgESw1wY7
	fQFQNVdE/UmT2077ougKoLZkZhhkR3V2sM/15BjgQsezqoBhhwvpJupF2dtIeMMVfQD8nivKYT2Q4
	VN4lAvfhKBv5JN4ckAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2Vm-000000019ua-2NlG;
	Fri, 30 May 2025 16:23:14 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2Ic-000000017GA-3ZXE
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 16:09:40 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-234fcadde3eso27100695ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 May 2025 09:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748621378; x=1749226178; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxxufLK3KekEdbbP35QTahMDHa855MkqcMEQ8g1zMTk=;
        b=AoAgJ262hFG5aijsaRfq5QziMrRf/C9NUgbzEuOqb5Hqwxh0Ku97As6np3yIek+ZDU
         93XccZnnB2dIFBfapkH4i5fB1roLjleP9+fedHOiRvD+6f1Yq3Ze2DPyur7fiX/50kkD
         KTQF44jm4eNLzhO7xPC6vwJa7BSnh6auzJ797w10xAntRhXTiazoicLn6dpXjBIuls7h
         yC1A4mL5V9wkajzLIFgSP3+aF/ZLp7XovkdjrM/Kwmf/j6av6asZRqxgYb4OnFCuSs75
         qlZu6+TikFoLah8ERsxVe6zOu2Yx39C1/v3VJFvTatmYBhyeTeMzZCKsBsZHNKF8bcqR
         tp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621378; x=1749226178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxxufLK3KekEdbbP35QTahMDHa855MkqcMEQ8g1zMTk=;
        b=koPLrLek54l02/RYAGCWHrG4chdY2z1Sn9aovl66/Vj7UPg9z2WdgUv+5OkSZHf0E0
         uaEJT18hxFPKmVOnoAzQdzXuDOI0cl+VqWirxs+wVpAxI+j/Z2pblkZq8SPGGM9mCBMX
         xtv1FUUqlyIgNqHZ2MqWyNlCJAuMMpHLRjE00i72qcWQ+iYDSVzCcQPTJt/g2Fstcy1w
         S6qmMZAPYHOUTh2B3BkedRWJWsXF85LfSlWR5wOZCJmwlXpar/JBpHExWbRsdo47MovA
         AoNs9mZ3rrVypqH5ohyDMnZZJ2sfVff1J8MzMM35ZZejsGjdAwr1paAZuoz4/r7r9zwG
         303g==
X-Forwarded-Encrypted: i=1; AJvYcCUBB/cX2imuXZ/avKHFX4/7N9I1kjMVNTVVDON1zDiOc6/LhFXoar5pqu46EHLa8hIJgcv93K2bq0UldA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFP3t9Js7F523vov3TIyab4+Df4/daGGe+zDlzMQhNqLspu2uc
	RT9e45nULyQWoD2QVAZjKONPAjIdGDaPOgKt+68UrpxaeYf8zKENZ7STayOMdL/fGg==
X-Gm-Gg: ASbGnctmSTEcW4Ju1hIWJ37CPwPcOjwSArbQKbBMlRN/TNaOzUenj3S+aLYoa/mNs3w
	8ubxeipgle1JY4dwDx1xt4y6QHnJyeHlMNJ4qki8RENpGhHsXOJYlvA8ugxaILklBm1uv9IgaSq
	+OAhQtwBQ1k4fhVmp85W3UbobGvcWkLuKusNf2NaesM4VEiWS5fpcWBFrlWb7DRzHDr+qHx5VsW
	dL939r6xNjbLA83q/35pApQKO9HoB1qlINfTL0E+ucAxLNDNXOGwFGJiAA/ox9llCP5fzF19jOI
	dFH8KwYj4P+oxUQcgXP6IB5QukCirFJpiJeeIYHytnnde7oFXbnSrlZCkdSHIA==
X-Google-Smtp-Source: AGHT+IEaQI64EZVaM9JygVJu/CqqQgOOBJm+b8JHY4a69IBYYuuTYL7zefQI+S32XWNK9lzdgNMIBQ==
X-Received: by 2002:a17:903:291:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-23529a28ab7mr65505535ad.37.1748621377852;
        Fri, 30 May 2025 09:09:37 -0700 (PDT)
Received: from thinkpad ([120.60.139.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd9478sm30412095ad.77.2025.05.30.09.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:09:37 -0700 (PDT)
Date: Fri, 30 May 2025 21:39:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
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
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
References: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
 <20250530113404.GA138859@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250530113404.GA138859@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_090938_891309_3F94EBC4 
X-CRM114-Status: GOOD (  30.70  )
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

T24gRnJpLCBNYXkgMzAsIDIwMjUgYXQgMDY6MzQ6MDRBTSAtMDUwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBPbiBGcmksIE1heSAzMCwgMjAyNSBhdCAwOToxNjo1OUFNICswNTMwLCBNYW5pdmFu
bmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4gPiBPbiBXZWQsIE1heSAyOCwgMjAyNSBhdCAwNTozNTow
MFBNIC0wNTAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+ID4gPiBPbiBUaHUsIE1heSAwOCwgMjAy
NSBhdCAxMjo0MDozM1BNICswNTMwLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4gPiA+
ID4gVGhlIFBDSSBsaW5rLCB3aGVuIGRvd24sIG5lZWRzIHRvIGJlIHJlY292ZXJlZCB0byBicmlu
ZyBpdCBiYWNrLiBCdXQgdGhhdAo+ID4gPiA+IGNhbm5vdCBiZSBkb25lIGluIGEgZ2VuZXJpYyB3
YXkgYXMgbGluayByZWNvdmVyeSBwcm9jZWR1cmUgaXMgc3BlY2lmaWMgdG8KPiA+ID4gPiBob3N0
IGJyaWRnZXMuIFNvIGFkZCBhIG5ldyBBUEkgcGNpX2hvc3RfaGFuZGxlX2xpbmtfZG93bigpIHRo
YXQgY291bGQgYmUKPiA+ID4gPiBjYWxsZWQgYnkgdGhlIGhvc3QgYnJpZGdlIGRyaXZlcnMgd2hl
biB0aGUgbGluayBnb2VzIGRvd24uCj4gPiA+ID4gCj4gPiA+ID4gVGhlIEFQSSB3aWxsIGl0ZXJh
dGUgdGhyb3VnaCBhbGwgdGhlIHNsb3RzIGFuZCBjYWxscyB0aGUgcGNpZV9kb19yZWNvdmVyeSgp
Cj4gPiA+ID4gZnVuY3Rpb24gd2l0aCAncGNpX2NoYW5uZWxfaW9fZnJvemVuJyBhcyB0aGUgc3Rh
dGUuIFRoaXMgd2lsbCByZXN1bHQgaW4gdGhlCj4gPiA+ID4gZXhlY3V0aW9uIG9mIHRoZSBBRVIg
RmF0YWwgZXJyb3IgaGFuZGxpbmcgY29kZS4gU2luY2UgdGhlIGxpbmsgZG93bgo+ID4gPiA+IHJl
Y292ZXJ5IGlzIHByZXR0eSBtdWNoIHRoZSBzYW1lIGFzIEFFUiBGYXRhbCBlcnJvciBoYW5kbGlu
ZywKPiA+ID4gPiBwY2llX2RvX3JlY292ZXJ5KCkgaGVscGVyIGlzIHJldXNlZCBoZXJlLiBGaXJz
dCB0aGUgQUVSIGVycm9yX2RldGVjdGVkCj4gPiA+ID4gY2FsbGJhY2sgd2lsbCBiZSB0cmlnZ2Vy
ZWQgZm9yIHRoZSBicmlkZ2UgYW5kIHRoZSBkb3duc3RyZWFtIGRldmljZXMuIFRoZW4sCj4gPiA+
ID4gcGNpX2hvc3RfcmVzZXRfc2xvdCgpIHdpbGwgYmUgY2FsbGVkIGZvciB0aGUgc2xvdCwgd2hp
Y2ggd2lsbCByZXNldCB0aGUKPiA+ID4gPiBzbG90IHVzaW5nICdyZXNldF9zbG90JyBjYWxsYmFj
ayB0byByZWNvdmVyIHRoZSBsaW5rLiBPbmNlIHRoYXQncyBkb25lLAo+ID4gPiA+IHJlc3VtZSBt
ZXNzYWdlIHdpbGwgYmUgYnJvYWRjYXN0ZWQgdG8gdGhlIGJyaWRnZSBhbmQgdGhlIGRvd25zdHJl
YW0gZGV2aWNlcwo+ID4gPiA+IGluZGljYXRpbmcgc3VjY2Vzc2Z1bCBsaW5rIHJlY292ZXJ5Lgo+
ID4gPiAKPiA+ID4gTGluayBkb3duIGlzIGFuIGV2ZW50IGZvciBhIHNpbmdsZSBSb290IFBvcnQu
ICBXaHkgd291bGQgd2UgaXRlcmF0ZQo+ID4gPiB0aHJvdWdoIGFsbCB0aGUgUm9vdCBQb3J0cyBp
ZiB0aGUgbGluayB3ZW50IGRvd24gZm9yIG9uZSBvZiB0aGVtPwo+ID4gCj4gPiBCZWNhdXNlIG9u
IHRoZSByZWZlcmVuY2UgcGxhdGZvcm0gKFFjb20pLCBsaW5rIGRvd24gbm90aWZpY2F0aW9uIGlz
Cj4gPiBub3QgcGVyLXBvcnQsIGJ1dCBwZXIgY29udHJvbGxlci4gU28gdGhhdCdzIHdoeSB3ZSBh
cmUgaXRlcmF0aW5nCj4gPiB0aHJvdWdoIGFsbCBwb3J0cy4gIFRoZSBjYWxsYmFjayBpcyBzdXBw
b3NlZCB0byBpZGVudGlmeSB0aGUgcG9ydHMKPiA+IHRoYXQgdHJpZ2dlcmVkIHRoZSBsaW5rIGRv
d24gZXZlbnQgYW5kIHJlY292ZXIgdGhlbS4KPiAKPiBNYXliZSBJJ20gbWlzc2luZyBzb21ldGhp
bmcuICBXaGljaCBjYWxsYmFjayBpZGVudGlmaWVzIHRoZSBwb3J0KHMpCj4gdGhhdCB0cmlnZ2Vy
ZWQgdGhlIGxpbmsgZG93biBldmVudD8KCkkgd2FzIHJlZmVycmluZyB0byB0aGUgaG9zdF9icmlk
Z2U6OnJlc2V0X3Jvb3RfcG9ydCgpIGNhbGxiYWNrIHRoYXQgcmVzZXRzIHRoZQpyb290IHBvcnRz
LgoKPiAgSSBzZWUgdGhhdAo+IHBjaV9ob3N0X2hhbmRsZV9saW5rX2Rvd24oKSBpcyBjYWxsZWQg
YnkKPiByb2NrY2hpcF9wY2llX3JjX3N5c19pcnFfdGhyZWFkKCkgYW5kIHFjb21fcGNpZV9nbG9i
YWxfaXJxX3RocmVhZCgpLAo+IGJ1dCBJIGRvbid0IHNlZSB0aGUgbG9naWMgdGhhdCBpZGVudGlm
aWVzIGEgcGFydGljdWxhciBSb290IFBvcnQuCj4gCj4gUGVyLWNvbnRyb2xsZXIgbm90aWZpY2F0
aW9uIG9mIHBlci1wb3J0IGV2ZW50cyBpcyBhIGNvbnRyb2xsZXIKPiBkZWZpY2llbmN5LCBub3Qg
c29tZXRoaW5nIGluaGVyZW50IHRvIFBDSWUuICBJIGRvbid0IHRoaW5rIHdlIHNob3VsZAo+IGJ1
aWxkIGNvbW1vbiBpbmZyYXN0cnVjdHVyZSB0aGF0IHJlc2V0cyBhbGwgdGhlIFJvb3QgUG9ydHMg
anVzdAo+IGJlY2F1c2Ugb25lIG9mIHRoZW0gaGFkIGFuIGlzc3VlLgo+IAoKSG1tLCBmYWlyIGVu
b3VnaC4KCj4gSSB0aGluayBwY2lfaG9zdF9oYW5kbGVfbGlua19kb3duKCkgc2hvdWxkIHRha2Ug
YSBSb290IFBvcnQsIG5vdCBhCj4gaG9zdCBicmlkZ2UsIGFuZCB0aGUgY29udHJvbGxlciBkcml2
ZXIgc2hvdWxkIGZpZ3VyZSBvdXQgd2hpY2ggcG9ydAo+IG5lZWRzIHRvIGJlIHJlY292ZXJlZCwg
b3IgdGhlIGNvbnRyb2xsZXIgZHJpdmVyIGNhbiBoYXZlIGl0cyBvd24gbG9vcAo+IHRvIHJlY292
ZXIgYWxsIG9mIHRoZW0gaWYgaXQgY2FuJ3QgZmlndXJlIG91dCB3aGljaCBvbmUgbmVlZHMgaXQu
Cj4gCgpUaGlzIHNob3VsZCBhbHNvIHdvcmsuIEZlZWwgZnJlZSB0byBkcm9wIHRoZSByZWxldmFu
dCBjb21taXRzIGZvciB2Ni4xNiwgSSBjYW4KcmVzdWJtaXQgdGhlbSAoaW5jbHVkaW5nIGR3LXJv
Y2tjaGlwIGFmdGVyIC1yYzEpLgoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p
4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
