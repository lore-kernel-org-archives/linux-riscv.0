Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC6BC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 05:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXI7eMLCsx8uD+xdn9ZuE5/lDQ/jDQ9iAY4TodfRg64=; b=trpL/mHWpQEFMV
	pv2THO9BL5JXxEBpsPdXhjlr9zB3pj4GEtHnYavG5gCAyC1Ttv6HuulXoYZR/KwVChz9SvpyRekzV
	x5Et4oeImH6qDyBE3KqITjRB27PYhHhaB0t56LxJpbVDssnvsOtt65OWdTZuASVUjL+iypwvC7Ynu
	EQxT6kNqs04NPIHLdw2tOuSzvjmU3yE60HPfOREkj6Ktd6RmO2u0WdTSPGp0Nwfd+Q4FjCbaNkMtx
	Y1zQeEiiKfm2Zp4xOmV6f10N6TEnh2WMmzJWFGG4p78I6Wo5kojK4ISP7iPdO6yGdIuC11CUdy+fC
	TwAXpLMkbTJ2qWw/WytA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ojr-0000000CqOQ-0Pbr;
	Thu, 24 Apr 2025 05:03:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ohp-0000000CqGD-1vqH
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 05:01:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-227c7e57da2so4713905ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 22:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745470860; x=1746075660; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lD1oHubtX+raNDBxUNTE7q0BGFRTdQ9bfRYHbVN0kDI=;
        b=o8X1M8Plgenx7XkxQd8f8Vu0/FNy3sbuVg62y1dWBKrqfziZR4hefQKaMU4KMT8USG
         gVHFjxqBP0YOvZReVW4QkSu7MQmnJJQ62SdJU6MHCy5mc4sRBs4fpbUrYBmfT6Sj2miP
         +ECQIX0oYMX5Fsb1KgyfckSkJA1Y/NxubuCrt46EAjd5Av/r9+9YnVOLa2RQcme1fGus
         V87Jh/NBhHqUOLeeaSeg5qBF21jDzQd6aDpsptPT9S1r9DSd0/JWRw7EqJzVcWF1/kzN
         g/1VjPyfmBOSA6iycOE2YT34lZzUkUes/b3bQ5QZY+jRvHMWKY16Ka1uRjecBdzXvc5L
         s8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745470860; x=1746075660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lD1oHubtX+raNDBxUNTE7q0BGFRTdQ9bfRYHbVN0kDI=;
        b=Z/Ec44I24/YQW7XDKytVXp3oiTUDZZpRmvUzD1EtQMCWuOFvenu5AuaY7gLB4+kWFs
         zr8+gRHoqE9BNW0oeQwV6n6uFFA4zfh/7cKiaQmlbAwHc6/v4wvxjBUoLuTc/kXu33m1
         Y5HBp0GYQZ7QnGMJqqMvtuYuGhAQR11x5egjKverFCVkKBCP2y/ljMPOpmbI1g7C9bgV
         IGHFQoyqStKQs3mD/2Z5FLlFk8jcbh5kayQ52OFG/lwpaipGSayeb3kEyJIjGJXTn0/6
         04f6G5W7hg5GC7g2vOEElO5RYm+cr67GO4xX9Onfgrs+VDMVUDQH6QrGeSvHxVPybMAw
         k5FA==
X-Forwarded-Encrypted: i=1; AJvYcCUEpSXqCb5QurS8as0fTNIEDfKsKHW/N6OZzn8gh70ZkH3UsSTAEun3lv75iqpwUB2VlrUFIuKbgOU5xA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1ZfOkrNMMju0Gl30tJbdA7py99exA/o13LE2CT4bK02GbizhD
	bWT46p2SwMsjEaaxpQLTRR8hmslwHRDHCcaPeBBmtdeMtwKzxThN/FX8MStGxQ==
X-Gm-Gg: ASbGnctjWRqycBqzP1PzFkauv0BYqRILPCGbnOcgzDypwgzxiRe3Q3GeX+cqlxt5j1s
	MBiHT7XA7hxUlCGVnSsU1g93d8SXJTFJCI6nqol/hFHIFItSIMjsnVQ6wpHaurXavWZEi8zaImz
	bYmQr25wST8RHBmZLGDnqoKLabzb3Cvw5K20i2KyguVqT337OUzZnj2l20F6WjgQE3R83Z84pE9
	dENXoqv9Oa51D5a+qlq32XsJLexxMKNhvDNF269f2IT4mk57qH4nQ89LMf/dI1+k5Yv0r8/nm7D
	aOr3iFLCzlRDvN6eskG89ZiCQzkKEysCdqb4dst8DK7luo9VtJk=
X-Google-Smtp-Source: AGHT+IFlCw2SuU4enXP7a4EpyWA+qrfkXjx8G9cFKLJd9YEAI7BU71q90hR3Gq88nNLPSs+CuzFQxg==
X-Received: by 2002:a17:903:94c:b0:220:fe51:1aab with SMTP id d9443c01a7336-22db3d71bbemr19486175ad.38.1745470860040;
        Wed, 23 Apr 2025 22:01:00 -0700 (PDT)
Received: from thinkpad ([120.60.139.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76f7fsm3794705ad.33.2025.04.23.22.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 22:00:59 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:30:51 +0530
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
Message-ID: <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_220101_518854_BF70EAB4 
X-CRM114-Status: GOOD (  38.72  )
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

T24gRnJpLCBBcHIgMTgsIDIwMjUgYXQgMDg6MTE6NDdBTSArMDUzMCwgS3Jpc2huYSBDaGFpdGFu
eWEgQ2h1bmRydSB3cm90ZToKPiAKPiAKPiBPbiA0LzE3LzIwMjUgMTA6NDYgUE0sIE1hbml2YW5u
YW4gU2FkaGFzaXZhbSB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4gPiBGcm9tOiBNYW5pdmFubmFuIFNh
ZGhhc2l2YW0gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnPgo+ID4gCj4gPiBUaGUg
UENJZSBsaW5rIGNhbiBnbyBkb3duIHVuZGVyIGNpcmN1bXN0YW5jZXMgc3VjaCBhcyB0aGUgZGV2
aWNlIGZpcm13YXJlCj4gPiBjcmFzaCwgbGluayBpbnN0YWJpbGl0eSwgZXRjLi4uIFdoZW4gdGhh
dCBoYXBwZW5zLCB0aGUgUENJZSBzbG90IG5lZWRzIHRvCj4gPiBiZSByZXNldCB0byBtYWtlIGl0
IG9wZXJhdGlvbmFsIGFnYWluLiBDdXJyZW50bHksIHRoZSBkcml2ZXIgaXMgbm90Cj4gPiBoYW5k
bGluZyB0aGUgbGluayBkb3duIGV2ZW50LCBkdWUgdG8gd2hpY2ggdGhlIHVzZXJzIGhhdmUgdG8g
cmVzdGFydCB0aGUKPiA+IG1hY2hpbmUgdG8gbWFrZSBQQ0llIGxpbmsgb3BlcmF0aW9uYWwgYWdh
aW4uIFNvIGZpeCBpdCBieSBkZXRlY3RpbmcgdGhlCj4gPiBsaW5rIGRvd24gZXZlbnQgYW5kIHJl
c2V0dGluZyB0aGUgc2xvdC4KPiA+IAo+ID4gU2luY2UgdGhlIFFjb20gUENJZSBjb250cm9sbGVy
cyByZXBvcnQgdGhlIGxpbmsgZG93biBldmVudCB0aHJvdWdoIHRoZQo+ID4gJ2dsb2JhbCcgSVJR
LCBlbmFibGUgdGhlIGxpbmsgZG93biBldmVudCBieSBzZXR0aW5nIFBBUkZfSU5UX0FMTF9MSU5L
X0RPV04KPiA+IGJpdCBpbiBQQVJGX0lOVF9BTExfTUFTSyByZWdpc3Rlci4KPiA+IAo+ID4gVGhl
biBpbiB0aGUgY2FzZSBvZiB0aGUgZXZlbnQsIGNhbGwgcGNpX2hvc3RfaGFuZGxlX2xpbmtfZG93
bigpIEFQSQo+ID4gaW4gdGhlIGhhbmRsZXIgdG8gbGV0IHRoZSBQQ0kgY29yZSBoYW5kbGUgdGhl
IGxpbmsgZG93biBjb25kaXRpb24uCj4gPiAKPiA+IFRoZSBBUEkgd2lsbCBpbnRlcm5hbGx5IGNh
bGwsICdwY2lfaG9zdF9icmlkZ2U6OnJlc2V0X3Nsb3QoKScgY2FsbGJhY2sgdG8KPiA+IHJlc2V0
IHRoZSBzbG90IGluIGEgcGxhdGZvcm0gc3BlY2lmaWMgd2F5LiBTbyBpbXBsZW1lbnQgdGhlIGNh
bGxiYWNrIHRvCj4gPiByZXNldCB0aGUgc2xvdCBieSBmaXJzdCByZXNldHRpbmcgdGhlIFBDSWUg
Y29yZSwgZm9sbG93ZWQgYnkgcmVpbml0aWFsaXppbmcKPiA+IHRoZSByZXNvdXJjZXMgYW5kIHRo
ZW4gZmluYWxseSBzdGFydGluZyB0aGUgbGluayBhZ2Fpbi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9y
Zz4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnICAgICB8
ICAxICsKPiA+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLmMgfCA5MCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwg
ODkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L2R3Yy9LY29uZmlnCj4gPiBpbmRleCBkOWYwMzg2Mzk2ZWRmNjZhZDBlNTE0YTBmNTQ1ZWQyNGQ4
OWZjYjZjLi5jZTA0ZWU2ZmJkOTljYmNjZTVkMmYzYTc1ZWJkNzJhMTcwNzBiN2I3IDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZwo+ID4gKysrIGIvZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZwo+ID4gQEAgLTI5Niw2ICsyOTYsNyBAQCBj
b25maWcgUENJRV9RQ09NCj4gPiAgIAlzZWxlY3QgUENJRV9EV19IT1NUCj4gPiAgIAlzZWxlY3Qg
Q1JDOAo+ID4gICAJc2VsZWN0IFBDSUVfUUNPTV9DT01NT04KPiA+ICsJc2VsZWN0IFBDSV9IT1NU
X0NPTU1PTgo+ID4gICAJaGVscAo+ID4gICAJICBTYXkgWSBoZXJlIHRvIGVuYWJsZSBQQ0llIGNv
bnRyb2xsZXIgc3VwcG9ydCBvbiBRdWFsY29tbSBTb0NzLiBUaGUKPiA+ICAgCSAgUENJZSBjb250
cm9sbGVyIHVzZXMgdGhlIERlc2lnbldhcmUgY29yZSBwbHVzIFF1YWxjb21tLXNwZWNpZmljCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLmMgYi9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXFjb20uYwo+ID4gaW5kZXggZGM5OGFlNjMz
NjJkYjA0MjIzODRiMTg3OWEyYjlhN2RjNTY0ZDA5MS4uNmIxOGEyNzc1ZTdmY2RlMWQ2MzRiM2Y1
ODMyN2VjYzdkMDI4ZTRlYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtcWNvbS5jCj4gPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LXFjb20uYwo+ID4gQEAgLTM0LDYgKzM0LDcgQEAKPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3VuaXRz
Lmg+Cj4gPiAgICNpbmNsdWRlICIuLi8uLi9wY2kuaCIKPiA+ICsjaW5jbHVkZSAiLi4vcGNpLWhv
c3QtY29tbW9uLmgiCj4gPiAgICNpbmNsdWRlICJwY2llLWRlc2lnbndhcmUuaCIKPiA+ICAgI2lu
Y2x1ZGUgInBjaWUtcWNvbS1jb21tb24uaCIKPiA+IEBAIC01NSw2ICs1Niw3IEBACj4gPiAgICNk
ZWZpbmUgUEFSRl9JTlRfQUxMX1NUQVRVUwkJCTB4MjI0Cj4gPiAgICNkZWZpbmUgUEFSRl9JTlRf
QUxMX0NMRUFSCQkJMHgyMjgKPiA+ICAgI2RlZmluZSBQQVJGX0lOVF9BTExfTUFTSwkJCTB4MjJj
Cj4gPiArI2RlZmluZSBQQVJGX1NUQVRVUwkJCQkweDIzMAo+ID4gICAjZGVmaW5lIFBBUkZfU0lE
X09GRlNFVAkJCQkweDIzNAo+ID4gICAjZGVmaW5lIFBBUkZfQkRGX1RSQU5TTEFURV9DRkcJCQkw
eDI0Ywo+ID4gICAjZGVmaW5lIFBBUkZfREJJX0JBU0VfQUREUl9WMgkJCTB4MzUwCj4gPiBAQCAt
MTMwLDggKzEzMiwxMSBAQAo+ID4gICAvKiBQQVJGX0xUU1NNIHJlZ2lzdGVyIGZpZWxkcyAqLwo+
ID4gICAjZGVmaW5lIExUU1NNX0VOCQkJCUJJVCg4KQo+ID4gKyNkZWZpbmUgU1dfQ0xFQVJfRkxV
U0hfTU9ERQkJCUJJVCgxMCkKPiA+ICsjZGVmaW5lIEZMVVNIX01PREUJCQkJQklUKDExKQo+ID4g
ICAvKiBQQVJGX0lOVF9BTExfe1NUQVRVUy9DTEVBUi9NQVNLfSByZWdpc3RlciBmaWVsZHMgKi8K
PiA+ICsjZGVmaW5lIFBBUkZfSU5UX0FMTF9MSU5LX0RPV04JCQlCSVQoMSkKPiA+ICAgI2RlZmlu
ZSBQQVJGX0lOVF9BTExfTElOS19VUAkJCUJJVCgxMykKPiA+ICAgI2RlZmluZSBQQVJGX0lOVF9N
U0lfREVWXzBfNwkJCUdFTk1BU0soMzAsIDIzKQo+ID4gQEAgLTE0NSw2ICsxNTAsOSBAQAo+ID4g
ICAvKiBQQVJGX0JERl9UT19TSURfQ0ZHIGZpZWxkcyAqLwo+ID4gICAjZGVmaW5lIEJERl9UT19T
SURfQllQQVNTCQkJQklUKDApCj4gPiArLyogUEFSRl9TVEFUVVMgZmllbGRzICovCj4gPiArI2Rl
ZmluZSBGTFVTSF9DT01QTEVURUQJCQkJQklUKDgpCj4gPiArCj4gPiAgIC8qIEVMQklfU1lTX0NU
UkwgcmVnaXN0ZXIgZmllbGRzICovCj4gPiAgICNkZWZpbmUgRUxCSV9TWVNfQ1RSTF9MVF9FTkFC
TEUJCQlCSVQoMCkKPiA+IEBAIC0xNjksNiArMTc3LDcgQEAKPiA+ICAgCQkJCQkJUENJRV9DQVBf
U0xPVF9QT1dFUl9MSU1JVF9TQ0FMRSkKPiA+ICAgI2RlZmluZSBQRVJTVF9ERUxBWV9VUwkJCQkx
MDAwCj4gPiArI2RlZmluZSBGTFVTSF9USU1FT1VUX1VTCQkJMTAwCj4gPiAgICNkZWZpbmUgUUNP
TV9QQ0lFX0NSQzhfUE9MWU5PTUlBTAkJKEJJVCgyKSB8IEJJVCgxKSB8IEJJVCgwKSkKPiA+IEBA
IC0yNzQsMTEgKzI4MywxNCBAQCBzdHJ1Y3QgcWNvbV9wY2llIHsKPiA+ICAgCXN0cnVjdCBpY2Nf
cGF0aCAqaWNjX2NwdTsKPiA+ICAgCWNvbnN0IHN0cnVjdCBxY29tX3BjaWVfY2ZnICpjZmc7Cj4g
PiAgIAlzdHJ1Y3QgZGVudHJ5ICpkZWJ1Z2ZzOwo+ID4gKwlpbnQgZ2xvYmFsX2lycTsKPiA+ICAg
CWJvb2wgc3VzcGVuZGVkOwo+ID4gICAJYm9vbCB1c2VfcG1fb3BwOwo+ID4gICB9Owo+ID4gICAj
ZGVmaW5lIHRvX3Fjb21fcGNpZSh4KQkJZGV2X2dldF9kcnZkYXRhKCh4KS0+ZGV2KQo+ID4gK3N0
YXRpYyBpbnQgcWNvbV9wY2llX3Jlc2V0X3Nsb3Qoc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJp
ZGdlLAo+ID4gKwkJCQkgIHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsKPiA+ICAgc3RhdGljIHZvaWQg
cWNvbV9lcF9yZXNldF9hc3NlcnQoc3RydWN0IHFjb21fcGNpZSAqcGNpZSkKPiA+ICAgewo+ID4g
QEAgLTEyNjMsNiArMTI3NSw4IEBAIHN0YXRpYyBpbnQgcWNvbV9wY2llX2hvc3RfaW5pdChzdHJ1
Y3QgZHdfcGNpZV9ycCAqcHApCj4gPiAgIAkJCWdvdG8gZXJyX2Fzc2VydF9yZXNldDsKPiA+ICAg
CX0KPiA+ICsJcHAtPmJyaWRnZS0+cmVzZXRfc2xvdCA9IHFjb21fcGNpZV9yZXNldF9zbG90Owo+
ID4gKwo+ID4gICAJcmV0dXJuIDA7Cj4gPiAgIGVycl9hc3NlcnRfcmVzZXQ6Cj4gPiBAQCAtMTMw
MCw2ICsxMzE0LDczIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHdfcGNpZV9ob3N0X29wcyBxY29t
X3BjaWVfZHdfb3BzID0gewo+ID4gICAJLnBvc3RfaW5pdAk9IHFjb21fcGNpZV9ob3N0X3Bvc3Rf
aW5pdCwKPiA+ICAgfTsKPiA+ICtzdGF0aWMgaW50IHFjb21fcGNpZV9yZXNldF9zbG90KHN0cnVj
dCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSwKPiA+ICsJCQkJICBzdHJ1Y3QgcGNpX2RldiAqcGRl
dikKPiA+ICt7Cj4gPiArCXN0cnVjdCBwY2lfYnVzICpidXMgPSBicmlkZ2UtPmJ1czsKPiA+ICsJ
c3RydWN0IGR3X3BjaWVfcnAgKnBwID0gYnVzLT5zeXNkYXRhOwo+ID4gKwlzdHJ1Y3QgZHdfcGNp
ZSAqcGNpID0gdG9fZHdfcGNpZV9mcm9tX3BwKHBwKTsKPiA+ICsJc3RydWN0IHFjb21fcGNpZSAq
cGNpZSA9IHRvX3Fjb21fcGNpZShwY2kpOwo+ID4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBwY2ll
LT5wY2ktPmRldjsKPiA+ICsJdTMyIHZhbDsKPiA+ICsJaW50IHJldDsKPiA+ICsKPiA+ICsJLyog
V2FpdCBmb3IgdGhlIHBlbmRpbmcgdHJhbnNhY3Rpb25zIHRvIGJlIGNvbXBsZXRlZCAqLwo+ID4g
KwlyZXQgPSByZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dChwY2llLT5wYXJmICsgUEFSRl9TVEFU
VVMsIHZhbCwKPiA+ICsJCQkJCSB2YWwgJiBGTFVTSF9DT01QTEVURUQsIDEwLAo+ID4gKwkJCQkJ
IEZMVVNIX1RJTUVPVVRfVVMpOwo+ID4gKwlpZiAocmV0KSB7Cj4gPiArCQlkZXZfZXJyKGRldiwg
IkZsdXNoIGNvbXBsZXRpb24gZmFpbGVkOiAlZFxuIiwgcmV0KTsKPiA+ICsJCWdvdG8gZXJyX2hv
c3RfZGVpbml0Owo+ID4gKwl9Cj4gPiArCj4gPiArCS8qIENsZWFyIHRoZSBGTFVTSF9NT0RFIHRv
IGFsbG93IHRoZSBjb3JlIHRvIGJlIHJlc2V0ICovCj4gPiArCXZhbCA9IHJlYWRsKHBjaWUtPnBh
cmYgKyBQQVJGX0xUU1NNKTsKPiA+ICsJdmFsIHw9IFNXX0NMRUFSX0ZMVVNIX01PREU7Cj4gPiAr
CXdyaXRlbCh2YWwsIHBjaWUtPnBhcmYgKyBQQVJGX0xUU1NNKTsKPiA+ICsKPiA+ICsJLyogV2Fp
dCBmb3IgdGhlIEZMVVNIX01PREUgdG8gY2xlYXIgKi8KPiA+ICsJcmV0ID0gcmVhZGxfcmVsYXhl
ZF9wb2xsX3RpbWVvdXQocGNpZS0+cGFyZiArIFBBUkZfTFRTU00sIHZhbCwKPiA+ICsJCQkJCSAh
KHZhbCAmIEZMVVNIX01PREUpLCAxMCwKPiA+ICsJCQkJCSBGTFVTSF9USU1FT1VUX1VTKTsKPiA+
ICsJaWYgKHJldCkgewo+ID4gKwkJZGV2X2VycihkZXYsICJGbHVzaCBtb2RlIGNsZWFyIGZhaWxl
ZDogJWRcbiIsIHJldCk7Cj4gPiArCQlnb3RvIGVycl9ob3N0X2RlaW5pdDsKPiA+ICsJfQo+ID4g
Kwo+ID4gKwlxY29tX3BjaWVfaG9zdF9kZWluaXQocHApOwo+ID4gKwo+ID4gKwlyZXQgPSBxY29t
X3BjaWVfaG9zdF9pbml0KHBwKTsKPiA+ICsJaWYgKHJldCkgewo+ID4gKwkJZGV2X2VycihkZXYs
ICJIb3N0IGluaXQgZmFpbGVkXG4iKTsKPiA+ICsJCXJldHVybiByZXQ7Cj4gPiArCX0KPiA+ICsK
PiA+ICsJcmV0ID0gZHdfcGNpZV9zZXR1cF9yYyhwcCk7Cj4gPiArCWlmIChyZXQpCj4gPiArCQln
b3RvIGVycl9ob3N0X2RlaW5pdDsKPiA+ICsKPiA+ICsJLyoKPiA+ICsJICogUmUtZW5hYmxlIGds
b2JhbCBJUlEgZXZlbnRzIGFzIHRoZSBQQVJGX0lOVF9BTExfTUFTSyByZWdpc3RlciBpcwo+ID4g
KwkgKiBub24tc3RpY2t5Lgo+ID4gKwkgKi8KPiA+ICsJaWYgKHBjaWUtPmdsb2JhbF9pcnEpCj4g
PiArCQl3cml0ZWxfcmVsYXhlZChQQVJGX0lOVF9BTExfTElOS19VUCB8IFBBUkZfSU5UX0FMTF9M
SU5LX0RPV04gfAo+ID4gKwkJCSAgICAgICBQQVJGX0lOVF9NU0lfREVWXzBfNywgcGNpZS0+cGFy
ZiArIFBBUkZfSU5UX0FMTF9NQVNLKTsKPiBkbyB3ZSBuZWVkIHRvIGVuYWJsZSBsaW5rdXAgYWdh
aW4gaGVyZSwgc2luY2UgYWxsIHRoZSBkZXZpY2VzIGFyZQo+IGVudW1lcmF0ZWQgcHJldmlvdXNs
eSwgdGhlIGxpbmt1cCBpcnEgd2lsbCBkbyBhIHJlc2NhbiBhZ2FpbiB3aGljaCBpcwo+IG5vdCBu
ZWVkZWQuCgpSaWdodC4gSSB3YXMgdHJ5aW5nIHRvIGtlZXAgdGhlIGlycSBlbmFibGVtZW50IG9u
IHBhciB3aXRoIHByb2JlKCksIGJ1dCBMSU5LX1VQCmlzIHN0cmljdGx5IG5vdCBuZWVkZWQuIEkg
d2lsbCBkcm9wIGl0LgoKPiBJbnN0ZWFkIG9mIGxpbmt1cCB3ZSB1cGRhdGUgaWNjICYgb3BwIGJh
bmR3aWR0aHMgYWZ0ZXIKPiBkd19wY2llX3dhaXRfZm9yX2xpbmsoKSBpbiB0aGUgYmVsb3cuCj4g
CgpXaHkgZG8gd2UgbmVlZCB0byB1cGRhdGUgSUNDIGFuZCBPUFA/CgotIE1hbmkKCi0tIArgrq7g
rqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
