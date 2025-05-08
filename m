Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E854C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 07:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0nzYo3puJ001SyKGLkO2tMDtF/d5Lg9S0+nHX0kbM8=; b=nskM0wQ9cPVgME
	7oAR8EtTAlItD7oBGPnBuAeCTk7ZOEINrP9CCkyKmOVBCdOoN+0PdsgNa8tkgsbeXZb+xdJfdpzVt
	9xg0M762u7z5iPbLy2W/2IrtLSybnJjXIF0ADFUwsvLVsV8en+aZAPa12Rpp4VHksgCbGLg7gHT2y
	0YYSaq8d1K+nWjA+yaszMbIB2IgCQmG1ybTg5CpkqCQgXDPKlnix1o0ZEUhkoX+xV8D/OAS9vBSVo
	wM995lDR5E8xixK5F/o5nXSX8KawtLoKffmZu/5Wwh201wpz2RB5lnEmpz7YfvYm+BfnMY7NxX6PG
	JmawAfKwieRqWaZIso9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvFE-0000000HWuH-1BoR;
	Thu, 08 May 2025 07:00:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvD4-0000000HWgo-30Wm
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 06:58:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso3596955e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 May 2025 23:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746687500; x=1747292300; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvmyVbIxiRkvAgoPeHcaveModR89raMJR6gODE+1nDM=;
        b=EEInu4yJEfgIUG6nCKlHkogMfkgofPeRYIJuZ/Gz6LBdNm3dUfbGK+P/t72qrwf6qY
         XzgbX3Cai7hx2RNjgEBmX5BATQ+/KGSfE/W6zsokxVXF5JGyWZA41PHHwkvJfJQJC9BT
         khL7QifZugkOVJll99727qYRqCIkNCxBEMc7s9nVXAkqM2qLOdtneeKwpv9TrIyDl1a0
         3sT13gzprLdKrPAr0w1wljDcK3W8bw7H1DTUDCRqwwVZ7OE8eNGOmCE7Vnt/x815o3LY
         5Ytac+by/Y2espgBcFDd1IA1q1VglaD/SR7rpzNRjuZCO6N5i1sGpMGaezUavai2iTo0
         1KVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746687500; x=1747292300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RvmyVbIxiRkvAgoPeHcaveModR89raMJR6gODE+1nDM=;
        b=et/vNIUP0xPIqBU2+qEIOInAMWJ6agf6OP+1TOYNcimz7+d3UhxNzTvMW/8FMNXktv
         9SIqO1rsEJskK4KCzntoTSXjN/n2lMaH1mqE4gm1CyMMUyRb4ew4oTxPZZUEgTayuZlM
         th8Izub2CYcwyEHCP7PdrNa0wKi8637WvAiUyXtCymD0qcCw3noDD3SbQy9FTVqTXjvS
         WNmyyNrAL78iOzxuhf1uZj5IwwPgHi/SFZP0T9WpQmBIHryYmatmeTRJI5TS6PsdSaX8
         hFa72YzWj340jnE4mKHO5Y35l+aAzULIVgPmMWFqKNDfj0zOxXK3xyx1GvWKJ5CjF949
         lHdA==
X-Forwarded-Encrypted: i=1; AJvYcCWy10q/BWDgN042bFKv8YtM27Cf2XJYD7IV/IyYKxHsSCUgwzL6sRPckmUYxLFbDSfZ0lNIz6pWBR/b0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCUFxO799qTWMAjGfD/9As41SmCM+X4MPOZ4WrLwZ/ZKM3KPdH
	w4CU833+xMJ/4LNzn5QbhAESwMl0ScxPUHk6qJsxXbeTs2qNfCo9QJYuyxLMlg==
X-Gm-Gg: ASbGncs20SQ6wZQ9sq0b7nUowQ2XhwFox2psHO3yXKBrQ6fg4XKgxQYly/zVrTN8omG
	kh6B7tFQSTFzZbZUgm+jReg7jC2cF3g/+4tILdG/5nUm48lwRoh8tFsimKSDoj580OO/KPssvDN
	r/pFetlU4/iocIRCyU9OIpThO/oV90hdFSRa+CQp/BTGoWTgv850WcJvmcUldy+RpO3AgSQMEw9
	EldGZUfyTi8pgscSz0Hb23yHaZ+TCabts6J+lcB6KFNT6gFo+lSxODDRFUcY2TcqK0CQvIbOs68
	giKGmHjm+kMiJSwVm4rFMT02rWzH5VE5yzgfcKBPlt+7rOAGpPv2tMtrDVYp90MutfrK32GTRbN
	7WDpD/gjuH+MCIDMgsHjw4+w=
X-Google-Smtp-Source: AGHT+IE6fY7G6i3QYGrY3X5Ul1LizOf1wK5bHxiH9swb38pg5rW4p838LgWBRNHE0H7wg8cPl2p63A==
X-Received: by 2002:a05:6000:1449:b0:3a0:bc28:e0e8 with SMTP id ffacd0b85a97d-3a0bc28e221mr781184f8f.23.1746687500552;
        Wed, 07 May 2025 23:58:20 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b300873dsm6123920f8f.78.2025.05.07.23.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:58:20 -0700 (PDT)
Date: Thu, 8 May 2025 12:28:19 +0530
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
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <fxgmyq7rqgxw2omtkfj4zvzqgbfjhafin3dt2yevs4siwol62w@5cz6pfxixd2h>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
 <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_235822_760923_D247374F 
X-CRM114-Status: GOOD (  41.91  )
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMTA6MzE6MDBBTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIEZyaSwgQXByIDE4LCAyMDI1IGF0IDA4OjExOjQ3QU0gKzA1MzAs
IEtyaXNobmEgQ2hhaXRhbnlhIENodW5kcnUgd3JvdGU6Cj4gPiAKPiA+IAo+ID4gT24gNC8xNy8y
MDI1IDEwOjQ2IFBNLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gdmlhIEI0IFJlbGF5IHdyb3RlOgo+
ID4gPiBGcm9tOiBNYW5pdmFubmFuIFNhZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBs
aW5hcm8ub3JnPgo+ID4gPiAKPiA+ID4gVGhlIFBDSWUgbGluayBjYW4gZ28gZG93biB1bmRlciBj
aXJjdW1zdGFuY2VzIHN1Y2ggYXMgdGhlIGRldmljZSBmaXJtd2FyZQo+ID4gPiBjcmFzaCwgbGlu
ayBpbnN0YWJpbGl0eSwgZXRjLi4uIFdoZW4gdGhhdCBoYXBwZW5zLCB0aGUgUENJZSBzbG90IG5l
ZWRzIHRvCj4gPiA+IGJlIHJlc2V0IHRvIG1ha2UgaXQgb3BlcmF0aW9uYWwgYWdhaW4uIEN1cnJl
bnRseSwgdGhlIGRyaXZlciBpcyBub3QKPiA+ID4gaGFuZGxpbmcgdGhlIGxpbmsgZG93biBldmVu
dCwgZHVlIHRvIHdoaWNoIHRoZSB1c2VycyBoYXZlIHRvIHJlc3RhcnQgdGhlCj4gPiA+IG1hY2hp
bmUgdG8gbWFrZSBQQ0llIGxpbmsgb3BlcmF0aW9uYWwgYWdhaW4uIFNvIGZpeCBpdCBieSBkZXRl
Y3RpbmcgdGhlCj4gPiA+IGxpbmsgZG93biBldmVudCBhbmQgcmVzZXR0aW5nIHRoZSBzbG90Lgo+
ID4gPiAKPiA+ID4gU2luY2UgdGhlIFFjb20gUENJZSBjb250cm9sbGVycyByZXBvcnQgdGhlIGxp
bmsgZG93biBldmVudCB0aHJvdWdoIHRoZQo+ID4gPiAnZ2xvYmFsJyBJUlEsIGVuYWJsZSB0aGUg
bGluayBkb3duIGV2ZW50IGJ5IHNldHRpbmcgUEFSRl9JTlRfQUxMX0xJTktfRE9XTgo+ID4gPiBi
aXQgaW4gUEFSRl9JTlRfQUxMX01BU0sgcmVnaXN0ZXIuCj4gPiA+IAo+ID4gPiBUaGVuIGluIHRo
ZSBjYXNlIG9mIHRoZSBldmVudCwgY2FsbCBwY2lfaG9zdF9oYW5kbGVfbGlua19kb3duKCkgQVBJ
Cj4gPiA+IGluIHRoZSBoYW5kbGVyIHRvIGxldCB0aGUgUENJIGNvcmUgaGFuZGxlIHRoZSBsaW5r
IGRvd24gY29uZGl0aW9uLgo+ID4gPiAKPiA+ID4gVGhlIEFQSSB3aWxsIGludGVybmFsbHkgY2Fs
bCwgJ3BjaV9ob3N0X2JyaWRnZTo6cmVzZXRfc2xvdCgpJyBjYWxsYmFjayB0bwo+ID4gPiByZXNl
dCB0aGUgc2xvdCBpbiBhIHBsYXRmb3JtIHNwZWNpZmljIHdheS4gU28gaW1wbGVtZW50IHRoZSBj
YWxsYmFjayB0bwo+ID4gPiByZXNldCB0aGUgc2xvdCBieSBmaXJzdCByZXNldHRpbmcgdGhlIFBD
SWUgY29yZSwgZm9sbG93ZWQgYnkgcmVpbml0aWFsaXppbmcKPiA+ID4gdGhlIHJlc291cmNlcyBh
bmQgdGhlbiBmaW5hbGx5IHN0YXJ0aW5nIHRoZSBsaW5rIGFnYWluLgo+ID4gPiAKPiA+ID4gU2ln
bmVkLW9mZi1ieTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1A
bGluYXJvLm9yZz4KPiA+ID4gLS0tCj4gPiA+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
S2NvbmZpZyAgICAgfCAgMSArCj4gPiA+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1xY29tLmMgfCA5MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiA+ICAg
MiBmaWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiAK
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcgYi9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnCj4gPiA+IGluZGV4IGQ5ZjAzODYzOTZl
ZGY2NmFkMGU1MTRhMGY1NDVlZDI0ZDg5ZmNiNmMuLmNlMDRlZTZmYmQ5OWNiY2NlNWQyZjNhNzVl
YmQ3MmExNzA3MGI3YjcgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL0tjb25maWcKPiA+ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZp
Zwo+ID4gPiBAQCAtMjk2LDYgKzI5Niw3IEBAIGNvbmZpZyBQQ0lFX1FDT00KPiA+ID4gICAJc2Vs
ZWN0IFBDSUVfRFdfSE9TVAo+ID4gPiAgIAlzZWxlY3QgQ1JDOAo+ID4gPiAgIAlzZWxlY3QgUENJ
RV9RQ09NX0NPTU1PTgo+ID4gPiArCXNlbGVjdCBQQ0lfSE9TVF9DT01NT04KPiA+ID4gICAJaGVs
cAo+ID4gPiAgIAkgIFNheSBZIGhlcmUgdG8gZW5hYmxlIFBDSWUgY29udHJvbGxlciBzdXBwb3J0
IG9uIFF1YWxjb21tIFNvQ3MuIFRoZQo+ID4gPiAgIAkgIFBDSWUgY29udHJvbGxlciB1c2VzIHRo
ZSBEZXNpZ25XYXJlIGNvcmUgcGx1cyBRdWFsY29tbS1zcGVjaWZpYwo+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLmMgYi9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2llLXFjb20uYwo+ID4gPiBpbmRleCBkYzk4YWU2MzM2MmRiMDQyMjM4
NGIxODc5YTJiOWE3ZGM1NjRkMDkxLi42YjE4YTI3NzVlN2ZjZGUxZDYzNGIzZjU4MzI3ZWNjN2Qw
MjhlNGVjIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LXFjb20uYwo+ID4gPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXFjb20u
Ywo+ID4gPiBAQCAtMzQsNiArMzQsNyBAQAo+ID4gPiAgICNpbmNsdWRlIDxsaW51eC91bml0cy5o
Pgo+ID4gPiAgICNpbmNsdWRlICIuLi8uLi9wY2kuaCIKPiA+ID4gKyNpbmNsdWRlICIuLi9wY2kt
aG9zdC1jb21tb24uaCIKPiA+ID4gICAjaW5jbHVkZSAicGNpZS1kZXNpZ253YXJlLmgiCj4gPiA+
ICAgI2luY2x1ZGUgInBjaWUtcWNvbS1jb21tb24uaCIKPiA+ID4gQEAgLTU1LDYgKzU2LDcgQEAK
PiA+ID4gICAjZGVmaW5lIFBBUkZfSU5UX0FMTF9TVEFUVVMJCQkweDIyNAo+ID4gPiAgICNkZWZp
bmUgUEFSRl9JTlRfQUxMX0NMRUFSCQkJMHgyMjgKPiA+ID4gICAjZGVmaW5lIFBBUkZfSU5UX0FM
TF9NQVNLCQkJMHgyMmMKPiA+ID4gKyNkZWZpbmUgUEFSRl9TVEFUVVMJCQkJMHgyMzAKPiA+ID4g
ICAjZGVmaW5lIFBBUkZfU0lEX09GRlNFVAkJCQkweDIzNAo+ID4gPiAgICNkZWZpbmUgUEFSRl9C
REZfVFJBTlNMQVRFX0NGRwkJCTB4MjRjCj4gPiA+ICAgI2RlZmluZSBQQVJGX0RCSV9CQVNFX0FE
RFJfVjIJCQkweDM1MAo+ID4gPiBAQCAtMTMwLDggKzEzMiwxMSBAQAo+ID4gPiAgIC8qIFBBUkZf
TFRTU00gcmVnaXN0ZXIgZmllbGRzICovCj4gPiA+ICAgI2RlZmluZSBMVFNTTV9FTgkJCQlCSVQo
OCkKPiA+ID4gKyNkZWZpbmUgU1dfQ0xFQVJfRkxVU0hfTU9ERQkJCUJJVCgxMCkKPiA+ID4gKyNk
ZWZpbmUgRkxVU0hfTU9ERQkJCQlCSVQoMTEpCj4gPiA+ICAgLyogUEFSRl9JTlRfQUxMX3tTVEFU
VVMvQ0xFQVIvTUFTS30gcmVnaXN0ZXIgZmllbGRzICovCj4gPiA+ICsjZGVmaW5lIFBBUkZfSU5U
X0FMTF9MSU5LX0RPV04JCQlCSVQoMSkKPiA+ID4gICAjZGVmaW5lIFBBUkZfSU5UX0FMTF9MSU5L
X1VQCQkJQklUKDEzKQo+ID4gPiAgICNkZWZpbmUgUEFSRl9JTlRfTVNJX0RFVl8wXzcJCQlHRU5N
QVNLKDMwLCAyMykKPiA+ID4gQEAgLTE0NSw2ICsxNTAsOSBAQAo+ID4gPiAgIC8qIFBBUkZfQkRG
X1RPX1NJRF9DRkcgZmllbGRzICovCj4gPiA+ICAgI2RlZmluZSBCREZfVE9fU0lEX0JZUEFTUwkJ
CUJJVCgwKQo+ID4gPiArLyogUEFSRl9TVEFUVVMgZmllbGRzICovCj4gPiA+ICsjZGVmaW5lIEZM
VVNIX0NPTVBMRVRFRAkJCQlCSVQoOCkKPiA+ID4gKwo+ID4gPiAgIC8qIEVMQklfU1lTX0NUUkwg
cmVnaXN0ZXIgZmllbGRzICovCj4gPiA+ICAgI2RlZmluZSBFTEJJX1NZU19DVFJMX0xUX0VOQUJM
RQkJCUJJVCgwKQo+ID4gPiBAQCAtMTY5LDYgKzE3Nyw3IEBACj4gPiA+ICAgCQkJCQkJUENJRV9D
QVBfU0xPVF9QT1dFUl9MSU1JVF9TQ0FMRSkKPiA+ID4gICAjZGVmaW5lIFBFUlNUX0RFTEFZX1VT
CQkJCTEwMDAKPiA+ID4gKyNkZWZpbmUgRkxVU0hfVElNRU9VVF9VUwkJCTEwMAo+ID4gPiAgICNk
ZWZpbmUgUUNPTV9QQ0lFX0NSQzhfUE9MWU5PTUlBTAkJKEJJVCgyKSB8IEJJVCgxKSB8IEJJVCgw
KSkKPiA+ID4gQEAgLTI3NCwxMSArMjgzLDE0IEBAIHN0cnVjdCBxY29tX3BjaWUgewo+ID4gPiAg
IAlzdHJ1Y3QgaWNjX3BhdGggKmljY19jcHU7Cj4gPiA+ICAgCWNvbnN0IHN0cnVjdCBxY29tX3Bj
aWVfY2ZnICpjZmc7Cj4gPiA+ICAgCXN0cnVjdCBkZW50cnkgKmRlYnVnZnM7Cj4gPiA+ICsJaW50
IGdsb2JhbF9pcnE7Cj4gPiA+ICAgCWJvb2wgc3VzcGVuZGVkOwo+ID4gPiAgIAlib29sIHVzZV9w
bV9vcHA7Cj4gPiA+ICAgfTsKPiA+ID4gICAjZGVmaW5lIHRvX3Fjb21fcGNpZSh4KQkJZGV2X2dl
dF9kcnZkYXRhKCh4KS0+ZGV2KQo+ID4gPiArc3RhdGljIGludCBxY29tX3BjaWVfcmVzZXRfc2xv
dChzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2UsCj4gPiA+ICsJCQkJICBzdHJ1Y3QgcGNp
X2RldiAqcGRldik7Cj4gPiA+ICAgc3RhdGljIHZvaWQgcWNvbV9lcF9yZXNldF9hc3NlcnQoc3Ry
dWN0IHFjb21fcGNpZSAqcGNpZSkKPiA+ID4gICB7Cj4gPiA+IEBAIC0xMjYzLDYgKzEyNzUsOCBA
QCBzdGF0aWMgaW50IHFjb21fcGNpZV9ob3N0X2luaXQoc3RydWN0IGR3X3BjaWVfcnAgKnBwKQo+
ID4gPiAgIAkJCWdvdG8gZXJyX2Fzc2VydF9yZXNldDsKPiA+ID4gICAJfQo+ID4gPiArCXBwLT5i
cmlkZ2UtPnJlc2V0X3Nsb3QgPSBxY29tX3BjaWVfcmVzZXRfc2xvdDsKPiA+ID4gKwo+ID4gPiAg
IAlyZXR1cm4gMDsKPiA+ID4gICBlcnJfYXNzZXJ0X3Jlc2V0Ogo+ID4gPiBAQCAtMTMwMCw2ICsx
MzE0LDczIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdfcGNpZV9ob3N0X29wcyBxY29tX3BjaWVf
ZHdfb3BzID0gewo+ID4gPiAgIAkucG9zdF9pbml0CT0gcWNvbV9wY2llX2hvc3RfcG9zdF9pbml0
LAo+ID4gPiAgIH07Cj4gPiA+ICtzdGF0aWMgaW50IHFjb21fcGNpZV9yZXNldF9zbG90KHN0cnVj
dCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSwKPiA+ID4gKwkJCQkgIHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCBwY2lfYnVzICpidXMgPSBicmlkZ2UtPmJ1czsK
PiA+ID4gKwlzdHJ1Y3QgZHdfcGNpZV9ycCAqcHAgPSBidXMtPnN5c2RhdGE7Cj4gPiA+ICsJc3Ry
dWN0IGR3X3BjaWUgKnBjaSA9IHRvX2R3X3BjaWVfZnJvbV9wcChwcCk7Cj4gPiA+ICsJc3RydWN0
IHFjb21fcGNpZSAqcGNpZSA9IHRvX3Fjb21fcGNpZShwY2kpOwo+ID4gPiArCXN0cnVjdCBkZXZp
Y2UgKmRldiA9IHBjaWUtPnBjaS0+ZGV2Owo+ID4gPiArCXUzMiB2YWw7Cj4gPiA+ICsJaW50IHJl
dDsKPiA+ID4gKwo+ID4gPiArCS8qIFdhaXQgZm9yIHRoZSBwZW5kaW5nIHRyYW5zYWN0aW9ucyB0
byBiZSBjb21wbGV0ZWQgKi8KPiA+ID4gKwlyZXQgPSByZWFkbF9yZWxheGVkX3BvbGxfdGltZW91
dChwY2llLT5wYXJmICsgUEFSRl9TVEFUVVMsIHZhbCwKPiA+ID4gKwkJCQkJIHZhbCAmIEZMVVNI
X0NPTVBMRVRFRCwgMTAsCj4gPiA+ICsJCQkJCSBGTFVTSF9USU1FT1VUX1VTKTsKPiA+ID4gKwlp
ZiAocmV0KSB7Cj4gPiA+ICsJCWRldl9lcnIoZGV2LCAiRmx1c2ggY29tcGxldGlvbiBmYWlsZWQ6
ICVkXG4iLCByZXQpOwo+ID4gPiArCQlnb3RvIGVycl9ob3N0X2RlaW5pdDsKPiA+ID4gKwl9Cj4g
PiA+ICsKPiA+ID4gKwkvKiBDbGVhciB0aGUgRkxVU0hfTU9ERSB0byBhbGxvdyB0aGUgY29yZSB0
byBiZSByZXNldCAqLwo+ID4gPiArCXZhbCA9IHJlYWRsKHBjaWUtPnBhcmYgKyBQQVJGX0xUU1NN
KTsKPiA+ID4gKwl2YWwgfD0gU1dfQ0xFQVJfRkxVU0hfTU9ERTsKPiA+ID4gKwl3cml0ZWwodmFs
LCBwY2llLT5wYXJmICsgUEFSRl9MVFNTTSk7Cj4gPiA+ICsKPiA+ID4gKwkvKiBXYWl0IGZvciB0
aGUgRkxVU0hfTU9ERSB0byBjbGVhciAqLwo+ID4gPiArCXJldCA9IHJlYWRsX3JlbGF4ZWRfcG9s
bF90aW1lb3V0KHBjaWUtPnBhcmYgKyBQQVJGX0xUU1NNLCB2YWwsCj4gPiA+ICsJCQkJCSAhKHZh
bCAmIEZMVVNIX01PREUpLCAxMCwKPiA+ID4gKwkJCQkJIEZMVVNIX1RJTUVPVVRfVVMpOwo+ID4g
PiArCWlmIChyZXQpIHsKPiA+ID4gKwkJZGV2X2VycihkZXYsICJGbHVzaCBtb2RlIGNsZWFyIGZh
aWxlZDogJWRcbiIsIHJldCk7Cj4gPiA+ICsJCWdvdG8gZXJyX2hvc3RfZGVpbml0Owo+ID4gPiAr
CX0KPiA+ID4gKwo+ID4gPiArCXFjb21fcGNpZV9ob3N0X2RlaW5pdChwcCk7Cj4gPiA+ICsKPiA+
ID4gKwlyZXQgPSBxY29tX3BjaWVfaG9zdF9pbml0KHBwKTsKPiA+ID4gKwlpZiAocmV0KSB7Cj4g
PiA+ICsJCWRldl9lcnIoZGV2LCAiSG9zdCBpbml0IGZhaWxlZFxuIik7Cj4gPiA+ICsJCXJldHVy
biByZXQ7Cj4gPiA+ICsJfQo+ID4gPiArCj4gPiA+ICsJcmV0ID0gZHdfcGNpZV9zZXR1cF9yYyhw
cCk7Cj4gPiA+ICsJaWYgKHJldCkKPiA+ID4gKwkJZ290byBlcnJfaG9zdF9kZWluaXQ7Cj4gPiA+
ICsKPiA+ID4gKwkvKgo+ID4gPiArCSAqIFJlLWVuYWJsZSBnbG9iYWwgSVJRIGV2ZW50cyBhcyB0
aGUgUEFSRl9JTlRfQUxMX01BU0sgcmVnaXN0ZXIgaXMKPiA+ID4gKwkgKiBub24tc3RpY2t5Lgo+
ID4gPiArCSAqLwo+ID4gPiArCWlmIChwY2llLT5nbG9iYWxfaXJxKQo+ID4gPiArCQl3cml0ZWxf
cmVsYXhlZChQQVJGX0lOVF9BTExfTElOS19VUCB8IFBBUkZfSU5UX0FMTF9MSU5LX0RPV04gfAo+
ID4gPiArCQkJICAgICAgIFBBUkZfSU5UX01TSV9ERVZfMF83LCBwY2llLT5wYXJmICsgUEFSRl9J
TlRfQUxMX01BU0spOwo+ID4gZG8gd2UgbmVlZCB0byBlbmFibGUgbGlua3VwIGFnYWluIGhlcmUs
IHNpbmNlIGFsbCB0aGUgZGV2aWNlcyBhcmUKPiA+IGVudW1lcmF0ZWQgcHJldmlvdXNseSwgdGhl
IGxpbmt1cCBpcnEgd2lsbCBkbyBhIHJlc2NhbiBhZ2FpbiB3aGljaCBpcwo+ID4gbm90IG5lZWRl
ZC4KPiAKPiBSaWdodC4gSSB3YXMgdHJ5aW5nIHRvIGtlZXAgdGhlIGlycSBlbmFibGVtZW50IG9u
IHBhciB3aXRoIHByb2JlKCksIGJ1dCBMSU5LX1VQCj4gaXMgc3RyaWN0bHkgbm90IG5lZWRlZC4g
SSB3aWxsIGRyb3AgaXQuCj4gCgpIbW0sIEkganVzdCByZWFsaXplZCB0aGF0IGlmIHRoZSBkZXZp
Y2UgZ2V0cyByZW1vdmVkIGFuZCBsaW5rIGRvd24gaGFwcGVucywgd2UKd291bGQgc3RpbGwgbmVl
ZCB0byBoYXZlIGxpbmsgdXAgdG8gZW51bWVyYXRlIGl0IG9uY2UgYXR0YWNoZWQuCgotIE1hbmkK
Ci0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+N
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
