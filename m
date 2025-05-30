Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CB8C54F30
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 03:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f97eh5/rB6tJu1A3unkO7Oql1+STzjcuCGs+ONMMgHM=; b=0THOaHRSwJMlcA
	8t3SgZFXcpcE82DuNlT67d+Yvrs5lH/NyWDuruBtiMDnRmTbQhAGO73o20ewiNJHE6H0VWMtqljPg
	tBpGZ0b+Oc5uXeRbutH5p/QgJX8UaAJLC7OBRLLEDea2dYw5hrXbw4bnRqpsIcCfi594b7DQghvJq
	DwKiyRfvim/NRO1nDkS/cOKLNB3grS4aApMFvISX/YGySdZ3c2WLoiRm8c4VBJSx3o+45lc9Ary3a
	fywLv/aZz8Zlv1JDQb9aFyfjELRHPXi/6yXvV5GYyok4C1DmgdiDjHU7MmrLMKWfXWt+trZ/qS3IB
	2yIXGhNIchHsgmN76IeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqkE-0000000H6o9-1KXV;
	Fri, 30 May 2025 03:49:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKqi5-0000000H6Yh-1qzK
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 03:47:11 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-234c5b57557so15925885ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 20:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748576828; x=1749181628; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zYT+yS9DtEtNjftxWM62aj+gh1F4QDHmOM8kYqFz3TY=;
        b=dSGc9ZEI/pNrYuXGQ1+RwGeU5MeCj1eyx+IScgszhigmwUrz7D6Bn529VMP6xoXhwu
         JMLuGxjiD7PNEb7BSaVHnyQqACx6BZof6TQ5Xlnwavz3UI2BwqK/0XWoWxUnGoCcIF0I
         vynx6e39nRYm1HErKihdCu8OuI+XfcvXYtgtdyHLVzUwwZsMR7GUknR6E7v/u3u21xfc
         coNbYOvuap8LV/VrmQqPXLz5BQKrNJDz7E31H53acfT8czU2AVSIzfSnkSmkTVtALWWy
         c3Y7HnlQbzNIzCn1s7z7WyKQLiIDAGAeycLJaTWSbfZawWFIvseZBkfT5exkBrX8U4bw
         d3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748576828; x=1749181628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYT+yS9DtEtNjftxWM62aj+gh1F4QDHmOM8kYqFz3TY=;
        b=t5x7Y4KvxKua7e0TK5iZcGG6gQzdZSBso3X9i9BmgT6k7HT3bP5aqhNS4kX8umalRt
         AiGHMK8YnagOCB8FzhtDWu8lB/Y8rZiG7Box7s56xWI7p0HjqZaYfOWI/nk1WxwsSXYi
         QXuDzUWYGjHfFzquR/Rq1rI0PeGSadQtg6VLLz5XJs8oQfrVc7ERWJPy+SPP/CQ2ekef
         CKoRxRVyHa1WOAVDCKGP7/vPYEVktThpGmU/uvw7O6kPVhGo0f9cQucXOyUv+t+ScnRd
         UPD1eAuRfOJUshxwluKmCrxvPd+OhQ8ZZ/ZtbwHVrTHT6hmTmVGCK+QbwUYw2/xMCDn0
         NEYA==
X-Forwarded-Encrypted: i=1; AJvYcCXIUqznmQ36ZIQMB2Nmvq5uVAwMf9pEmEPO2vYEVb+7OQ8xslubmgKKXBiZt7p/Yt5ny67sQ7/m3rh81w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJt7jkEbbkfmJeOPnq604R+kZ3Z1O2R0Gwfg8WTOvJWTxeaBXV
	zaGd7+dqZ28HTstQzN74HIXC28YV6inpUs2vCarRCN7n/kDTPrbtrFLB0Z9kqIzpBmMDCePjpnh
	pXt8=
X-Gm-Gg: ASbGnctNUDSZCxYChl32/GkurbIrI/tEQsBAvju2E5Hn9DtBB190+v2xQ6GSbFXY9OW
	iDq3Lk1rncTsCKuPIZq0WFjDo+Z4YistVAKs7h81xK4kPoOALQq42kfC1AXPjJpYb9K7jU6Jqau
	F6Ro4p1hbVUXcpa/amnqqjFjtLloGCik9VcZM4beE/rsUejO4q0RmP+Ia1yQI/JvSo1XSjpvbuJ
	gfvbiKUdp9fHV5OAEeDK601lD5WeNSTuYUADXCcvPXiLpwjrdNtnva+hMGSAXlkHkoiq8EOP6dH
	V29SNtmTju/6vjzj/L3YKac9LH1w85JBjgW8S7rfHGPQp/47/Q6HqELgAEtbGA==
X-Google-Smtp-Source: AGHT+IHUystiPvDn8wtXmAxatZwAwM/wyWA7RAF5uIDmvCTdpWPCHf/AgW9Un8RMnzAXGJkMNGGi/A==
X-Received: by 2002:a17:902:f711:b0:235:1962:1c13 with SMTP id d9443c01a7336-23539563146mr10695205ad.14.1748576828510;
        Thu, 29 May 2025 20:47:08 -0700 (PDT)
Received: from thinkpad ([120.60.139.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3c236asm327042a91.42.2025.05.29.20.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:47:08 -0700 (PDT)
Date: Fri, 30 May 2025 09:16:59 +0530
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
Message-ID: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
References: <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
 <20250528223500.GA58129@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250528223500.GA58129@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_204709_505261_CC6443B4 
X-CRM114-Status: GOOD (  18.06  )
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMDU6MzU6MDBQTSAtMDUwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBPbiBUaHUsIE1heSAwOCwgMjAyNSBhdCAxMjo0MDozM1BNICswNTMwLCBNYW5pdmFu
bmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4gPiBUaGUgUENJIGxpbmssIHdoZW4gZG93biwgbmVlZHMg
dG8gYmUgcmVjb3ZlcmVkIHRvIGJyaW5nIGl0IGJhY2suIEJ1dCB0aGF0Cj4gPiBjYW5ub3QgYmUg
ZG9uZSBpbiBhIGdlbmVyaWMgd2F5IGFzIGxpbmsgcmVjb3ZlcnkgcHJvY2VkdXJlIGlzIHNwZWNp
ZmljIHRvCj4gPiBob3N0IGJyaWRnZXMuIFNvIGFkZCBhIG5ldyBBUEkgcGNpX2hvc3RfaGFuZGxl
X2xpbmtfZG93bigpIHRoYXQgY291bGQgYmUKPiA+IGNhbGxlZCBieSB0aGUgaG9zdCBicmlkZ2Ug
ZHJpdmVycyB3aGVuIHRoZSBsaW5rIGdvZXMgZG93bi4KPiA+IAo+ID4gVGhlIEFQSSB3aWxsIGl0
ZXJhdGUgdGhyb3VnaCBhbGwgdGhlIHNsb3RzIGFuZCBjYWxscyB0aGUgcGNpZV9kb19yZWNvdmVy
eSgpCj4gPiBmdW5jdGlvbiB3aXRoICdwY2lfY2hhbm5lbF9pb19mcm96ZW4nIGFzIHRoZSBzdGF0
ZS4gVGhpcyB3aWxsIHJlc3VsdCBpbiB0aGUKPiA+IGV4ZWN1dGlvbiBvZiB0aGUgQUVSIEZhdGFs
IGVycm9yIGhhbmRsaW5nIGNvZGUuIFNpbmNlIHRoZSBsaW5rIGRvd24KPiA+IHJlY292ZXJ5IGlz
IHByZXR0eSBtdWNoIHRoZSBzYW1lIGFzIEFFUiBGYXRhbCBlcnJvciBoYW5kbGluZywKPiA+IHBj
aWVfZG9fcmVjb3ZlcnkoKSBoZWxwZXIgaXMgcmV1c2VkIGhlcmUuIEZpcnN0IHRoZSBBRVIgZXJy
b3JfZGV0ZWN0ZWQKPiA+IGNhbGxiYWNrIHdpbGwgYmUgdHJpZ2dlcmVkIGZvciB0aGUgYnJpZGdl
IGFuZCB0aGUgZG93bnN0cmVhbSBkZXZpY2VzLiBUaGVuLAo+ID4gcGNpX2hvc3RfcmVzZXRfc2xv
dCgpIHdpbGwgYmUgY2FsbGVkIGZvciB0aGUgc2xvdCwgd2hpY2ggd2lsbCByZXNldCB0aGUKPiA+
IHNsb3QgdXNpbmcgJ3Jlc2V0X3Nsb3QnIGNhbGxiYWNrIHRvIHJlY292ZXIgdGhlIGxpbmsuIE9u
Y2UgdGhhdCdzIGRvbmUsCj4gPiByZXN1bWUgbWVzc2FnZSB3aWxsIGJlIGJyb2FkY2FzdGVkIHRv
IHRoZSBicmlkZ2UgYW5kIHRoZSBkb3duc3RyZWFtIGRldmljZXMKPiA+IGluZGljYXRpbmcgc3Vj
Y2Vzc2Z1bCBsaW5rIHJlY292ZXJ5Lgo+IAo+IExpbmsgZG93biBpcyBhbiBldmVudCBmb3IgYSBz
aW5nbGUgUm9vdCBQb3J0LiAgV2h5IHdvdWxkIHdlIGl0ZXJhdGUKPiB0aHJvdWdoIGFsbCB0aGUg
Um9vdCBQb3J0cyBpZiB0aGUgbGluayB3ZW50IGRvd24gZm9yIG9uZSBvZiB0aGVtPwoKQmVjYXVz
ZSBvbiB0aGUgcmVmZXJlbmNlIHBsYXRmb3JtIChRY29tKSwgbGluayBkb3duIG5vdGlmaWNhdGlv
biBpcyBub3QKcGVyLXBvcnQsIGJ1dCBwZXIgY29udHJvbGxlci4gU28gdGhhdCdzIHdoeSB3ZSBh
cmUgaXRlcmF0aW5nIHRocm91Z2ggYWxsIHBvcnRzLgpUaGUgY2FsbGJhY2sgaXMgc3VwcG9zZWQg
dG8gaWRlbnRpZnkgdGhlIHBvcnRzIHRoYXQgdHJpZ2dlcmVkIHRoZSBsaW5rIGRvd24KZXZlbnQg
YW5kIHJlY292ZXIgdGhlbS4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCv
jSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
