Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265EDC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 16:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVJ1xAxHnDfUe34FCGz+XL16O2JxgvkiN+DKSjobrF0=; b=fBKNo+CM1k2MTD
	jLnZAAJuWdoV+5SAZBBKgfbkbc+UtMGRtte7lHu6qqhS9z6iRLBAwdbhzxK8geAV+MyUtuxZUbHVc
	uO7XiP6sOk6eze7iIq3lhLxj8zPQPvYB0TFnEEB0TcD7RCQJvUOfoKiUKgKvkwdm3NQ4DancFkHMI
	fWWyH5r7WO90Ngo2OM1jI3fyuDiIoohbsCesoW5gi6WHwwrt1oB/rRUWKfSbFhbVXiF8QQBEseF79
	aL2lXnB+6kGmw3rayfmKZOiuUFWjKisHnMdDHAFDjqB4q61tOy9jZYFvMCFwiZwz2SdiwdICrDFz8
	7XhUTlhBK7LcurNDDYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDol2-000pcV-0W;
	Thu, 14 Dec 2023 16:40:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDokz-000pc0-2n;
	Thu, 14 Dec 2023 16:40:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C741C15;
	Thu, 14 Dec 2023 08:41:01 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 866973F5A1;
	Thu, 14 Dec 2023 08:40:13 -0800 (PST)
Date: Thu, 14 Dec 2023 16:40:10 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li
 <tiny.windzz@gmail.com>, Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/5] cpufreq: sun50i: Add D1 support
Message-ID: <20231214164010.0be50a89@donnerap.manchester.arm.com>
In-Reply-To: <8351928.NyiUUSuA9g@archlinux>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
	<20231214103342.30775-3-fusibrandon13@gmail.com>
	<8351928.NyiUUSuA9g@archlinux>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_084017_952801_DD0A56DE 
X-CRM114-Status: GOOD (  17.09  )
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

T24gVGh1LCAxNCBEZWMgMjAyMyAxNzoyOTozMCArMDEwMApKZXJuZWogxaBrcmFiZWMgPGplcm5l
ai5za3JhYmVjQGdtYWlsLmNvbT4gd3JvdGU6CgpIaSwKCj4gT24gVGh1cnNkYXksIERlY2VtYmVy
IDE0LCAyMDIzIDExOjMzOjM5IEFNIENFVCBCcmFuZG9uIENoZW8gRnVzaSB3cm90ZToKPiA+IEFk
ZCBzdXBwb3J0IGZvciBEMSBiYXNlZCBkZXZpY2VzIHRvIHRoZSBBbGx3aW5uZXIgSDYgY3B1ZnJl
cQo+ID4gZHJpdmVyCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEJyYW5kb24gQ2hlbyBGdXNpIDxm
dXNpYnJhbmRvbjEzQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvY3B1ZnJlcS9zdW41
MGktY3B1ZnJlcS1udm1lbS5jIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NwdWZyZXEvc3VuNTBpLWNwdWZyZXEt
bnZtZW0uYyBiL2RyaXZlcnMvY3B1ZnJlcS9zdW41MGktY3B1ZnJlcS1udm1lbS5jCj4gPiBpbmRl
eCAzMmE5Yzg4ZjguLmNjZjgzNzgwZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvY3B1ZnJlcS9z
dW41MGktY3B1ZnJlcS1udm1lbS5jCj4gPiArKysgYi9kcml2ZXJzL2NwdWZyZXEvc3VuNTBpLWNw
dWZyZXEtbnZtZW0uYwo+ID4gQEAgLTE2MCw2ICsxNjAsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBzdW41MGlfY3B1ZnJlcV9kcml2ZXIgPSB7Cj4gPiAgCj4gPiAgc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3VuNTBpX2NwdWZyZXFfbWF0Y2hfbGlzdFtdID0gewo+
ID4gIAl7IC5jb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW41MGktaDYiIH0sCj4gPiArCXsgLmNv
bXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjIwaS1kMSIgfSwgIAo+IAo+IFRoaXMgaXMgbm90IG5l
ZWRlZCwgYXMgdGhlcmUgaXMgbm8gZnVuY3Rpb25hbGl0eSBjaGFuZ2UuCgpUaGF0IHdhcyBteSBm
aXJzdCByZWZsZXgsIHRvbywgYnV0IHRoaXMgaXMgdGhlICpib2FyZCogKGZhbGxiYWNrKQpjb21w
YXRpYmxlLCBsaXN0ZWQgaW4gdGhlIHJvb3Qgbm9kZSwgc28geW91IGhhdmUgdG8gbGlzdCBpdCBo
ZXJlIGZvciBlYWNoClNvQywgdG9nZXRoZXIgd2l0aCB0aGUgcmVzcGVjdGl2ZSBibG9ja2xpc3Qg
aW4gdGhlIG5leHQgcGF0Y2guCldlIGFyZSBkb2luZyB0aGUgc2FtZSBmb3IgdGhlIEg2MTYsIGFu
ZCBhY3R1YWxseSBhbHNvIG5lZWQgdGhhdCBmb3IgdGhlCkg2MTguIFdlaXJkLCBJIGtub3csIGJ1
dCBsYXN0IHRpbWUgSSBjaGVjayBub3QgZWFzeSB0byBmaXguCgpDaGVlcnMsCkFuZHJlCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
