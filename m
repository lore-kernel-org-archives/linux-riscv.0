Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C300BEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 11:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSboP5ph/sHR2dbDzF81pDfQ73f0l9IbmsRSrFlBMXY=; b=UuvMFqDAL3tIOC
	sO0C3+NOy835RzssXyrpUnRJtmIqPTLCasZa+0m+mvb5+UYRObJQdM19JujHOy05A8XGNlB8eJ9V/
	u08Ostl8em4Y7m7ks/fFN0f2BVgAk/twEyRNz9JHPgVrITEadkqyyhQQneYytnByJTu11IBsx9/Fc
	MyATCAgo4AMeAaz5/t3IM0aGtC5YiH9p4YrV0zHP9lFCbVQnNCkMTY//F9RIIuldopZctrru07TIa
	MnKd5rAtQ1JmXc9o6ngMqeEb14VP/Vj/78H3Mgzw8fOghbiiphizQFB2A7Xo3AT8xQxDwnKPdYD1x
	2stEh+yBett/BYspQc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSFb-00B39w-2b;
	Thu, 20 Jul 2023 11:55:19 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMSFZ-00B38P-0c
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 11:55:18 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-345e55a62d8so3579285ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 04:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689854116; x=1690458916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2nsfpAZOzKSfsD7kBlpnXhljpFm6V4jZ1IFt269Dzc=;
        b=kLVhvzoRiwP4KdAf8uilvLNrZhhEeWA+9WEjhqTvEMRibj4INzYHEavZysqKaNPicF
         SRMFcUJoBwewq2wnONrv2bD8dtVPw6mv3yqCGuTdxszlxFa1cAmYoK4kHsUnWBotR6f/
         tXXdXgyVHtZl9unXI+dXIvRftUHiw81I/9Cfisf8/8uHLlvuQ5hXUJP5DtQpoh1S0MPD
         02rC1yelAvNVT7tlf5NxxrEd8iHkgnomBB+3Z7geb+7UIXUoLT8NtWmfmIislmBhn3DF
         goXM0jaLYk+7GfEvTrX/dP1Nwh2HHdmXPFFstDbRsmtiLwgCALkcA86hj2J0dDZsf48v
         Onow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689854116; x=1690458916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2nsfpAZOzKSfsD7kBlpnXhljpFm6V4jZ1IFt269Dzc=;
        b=Bnr1v4PTFSLW66A/cYsXa1DlPExaXdwBWD5RBTHH7GWYp0v4HDqaRe8dZ6+Hnj7MoH
         kpfCX5+0t5btNFSP/h6A7XnCBfDiHKymLfmz3PvJOzWTOtS9eG4/1kvVGpKVYhpds/fh
         K8AG0YedOg65iXch9nGsIDtstb+PpFl8Ze8B9e+WMq27z9LTjdGQ5X+V7jyYzmKxHrJ+
         2sAW17g3eIrwc86keORh8Fg7nwuIhonqcqRiw7kMPXG53GuqVftPw57m+AfRDRHlBAf7
         4577x/ZYILMUVdKv8DtCFsjvUn7nH+IlQB3tdCPSH2VS/juy0mVW9Rk/jVDkEPBBRjJ4
         yaHw==
X-Gm-Message-State: ABy/qLYNHUrJKDNQTTXrVRIh9OoTbqCH5gvgVbJATNgvm/sfcT/f6G4a
	KpdGKBQvy6gY5h0LyzjTMGutmNnLYlOAm5AsCCLM4A==
X-Google-Smtp-Source: APBJJlGuhvDEwX4zHCaoLq/vlPx/v2JTXQRrMKCcSuSSpMPMike0ZYN5c7gHKmoZ7va9hMESrNSbxdOsjufjpaBkyv4=
X-Received: by 2002:a92:d3c6:0:b0:348:90eb:883b with SMTP id
 c6-20020a92d3c6000000b0034890eb883bmr1604226ilh.13.1689854115872; Thu, 20 Jul
 2023 04:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
 <20230719113542.2293295-3-apatel@ventanamicro.com> <20230719223758.GA892809-robh@kernel.org>
In-Reply-To: <20230719223758.GA892809-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 20 Jul 2023 17:25:03 +0530
Message-ID: <CAK9=C2Ui3H8jOXZbSd_CCmtxVLWR=-JrTDK8kDbrLhJ4uUi+9g@mail.gmail.com>
Subject: Re: [PATCH v6 02/14] of: property: Add fw_devlink support for msi-parent
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_045517_243307_2FD6CA93 
X-CRM114-Status: GOOD (  22.50  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgNDowOOKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMTksIDIwMjMgYXQgMDU6MDU6MzBQTSArMDUz
MCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFRoaXMgYWxsb3dzIGZ3X2RldmxpbmsgdG8gY3JlYXRl
IGRldmljZSBsaW5rcyBiZXR3ZWVuIGNvbnN1bWVycyBvZgo+ID4gYSBNU0kgYW5kIHRoZSBzdXBw
bGllciBvZiB0aGUgTVNJLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRl
bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9vZi9wcm9wZXJ0eS5jIHwg
MzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MzIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL29mL3Byb3BlcnR5
LmMgYi9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPiA+IGluZGV4IGRkYzc1Y2Q1MDgyNS4uZTQwOTZi
NzlhODcyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jCj4gPiArKysgYi9k
cml2ZXJzL29mL3Byb3BlcnR5LmMKPiA+IEBAIC0xMzI1LDYgKzEzMjUsMzcgQEAgc3RhdGljIHN0
cnVjdCBkZXZpY2Vfbm9kZSAqcGFyc2VfaW50ZXJydXB0cyhzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
LAo+ID4gICAgICAgcmV0dXJuIG9mX2lycV9wYXJzZV9vbmUobnAsIGluZGV4LCAmc3VwX2FyZ3Mp
ID8gTlVMTCA6IHN1cF9hcmdzLm5wOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqcGFyc2VfbXNpX3BhcmVudChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcHJvcF9u
YW1lLCBpbnQgaW5kZXgpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IG9mX3BoYW5kbGVfYXJncyBz
dXBfYXJnczsKPiA+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbXNpX25wOwo+ID4gKwo+ID4g
KyAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19PRl9JUlEpKQo+ID4gKyAgICAgICAgICAgICBy
ZXR1cm4gTlVMTDsKPgo+IFdoeSBkbyB3ZSBuZWVkIHRoaXM/IFNwYXJjIGlzIG5vdCBnb2luZyB0
byBoYXZlIE1TSSBwcm9wZXJ0aWVzIHRvIGJlZ2luCj4gd2l0aC4gSSBndWVzcyBpdCBzYXZlcyBh
IGxpdHRsZSBiaXQgb2YgY29kZS4gVGhvdWdoIFNwYXJjIGRvZXNuJ3QgbmVlZAo+IGFueSBvZiB0
aGlzIGZpbGUuIE9yIG1heWJlIHRoZXJlJ3MgYSBiZXR0ZXIga2NvbmZpZyBzeW1ib2wgdG8gdXNl
IGhlcmUKPiBpZiBNU0lzIGFyZSBub3Qgc3VwcG9ydGVkPwoKSSBjYW4ndCB0aGluayBvZiBhIGJl
dHRlciBrY29uZmlnIHN5bWJvbCBvdmVyIGhlcmUgYnV0IHNpbmNlIFNwYXJjIGRvZXMKbm90IGhh
dmUgTVNJIHByb3BlcnRpZXMsIEkgdGhpbmsgZm9sbG93aW5nIGlzIGJldHRlcjoKCmlmIChJU19F
TkFCTEVEKENPTkZJR19TUEFSQykpCiAgICByZXR1cm4gTlVMTDsKCkFueSBvdGhlciBzdWdnZXN0
aW9ucyA/CgpSZWdhcmRzLApBbnVwCgo+Cj4gPiArCj4gPiArICAgICBpZiAoc3RyY21wKHByb3Bf
bmFtZSwgIm1zaS1wYXJlbnQiKSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiAr
Cj4gPiArICAgICBtc2lfbnAgPSBvZl9wYXJzZV9waGFuZGxlKG5wLCBwcm9wX25hbWUsIDApOwo+
ID4gKyAgICAgaWYgKG1zaV9ucCkgewo+ID4gKyAgICAgICAgICAgICBpZiAoIW9mX3Byb3BlcnR5
X3JlYWRfYm9vbChtc2lfbnAsICIjbXNpLWNlbGxzIikpIHsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBpZiAoaW5kZXgpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mX25v
ZGVfcHV0KG1zaV9ucCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
TlVMTDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIG1zaV9ucDsKPiA+ICsgICAgICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICBv
Zl9ub2RlX3B1dChtc2lfbnApOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgaWYgKG9mX3Bh
cnNlX3BoYW5kbGVfd2l0aF9hcmdzKG5wLCBwcm9wX25hbWUsICIjbXNpLWNlbGxzIiwgaW5kZXgs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnN1cF9hcmdzKSkKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiArCj4gPiArICAgICByZXR1cm4gc3VwX2Fy
Z3MubnA7Cj4gPiArfQo+ID4gKwo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VwcGxpZXJfYmlu
ZGluZ3Mgb2Zfc3VwcGxpZXJfYmluZGluZ3NbXSA9IHsKPiA+ICAgICAgIHsgLnBhcnNlX3Byb3Ag
PSBwYXJzZV9jbG9ja3MsIH0sCj4gPiAgICAgICB7IC5wYXJzZV9wcm9wID0gcGFyc2VfaW50ZXJj
b25uZWN0cywgfSwKPiA+IEBAIC0xMzU5LDYgKzEzOTAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHN1cHBsaWVyX2JpbmRpbmdzIG9mX3N1cHBsaWVyX2JpbmRpbmdzW10gPSB7Cj4gPiAgICAgICB7
IC5wYXJzZV9wcm9wID0gcGFyc2VfcmVndWxhdG9ycywgfSwKPiA+ICAgICAgIHsgLnBhcnNlX3By
b3AgPSBwYXJzZV9ncGlvLCB9LAo+ID4gICAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX2dwaW9z
LCB9LAo+ID4gKyAgICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX21zaV9wYXJlbnQsIH0sCj4gPiAg
ICAgICB7fQo+ID4gIH07Cj4gPgo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
