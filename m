Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DACC021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 18:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=00oNgn848JkwNhWdUA5+p+nxKI42OZlowvhBHnZhico=; b=3b/KzyApR6KdnQ
	8A3FJY0ctS176Hv0RYPeGTV9Xqn8H1pB5c0liDFNskv6GcDswH8BEqp8IAoCqctCsnH0U6Kr1rYHT
	SGvC9PgkJbUkow59bZaXQxcz9o1rFz0T3ZCqMT60th8yXtYPC5kecO2LknNnZFbCVz3tATXF+8ePZ
	VdaT+Qqn+u0QdJlPErS5+gEYInmbkm6z7dYOZXiKBh9009UV+dbAJ0sahS6q/kLDU6yWKkD9cFNB5
	/ft3xM192TEurX5Fz7El1p+8JEW1o/KkT/zLFE2PUJUXE8kSoX5K6bTvytSUmWm0IGogZ33lP7+Ie
	cOpY7o0oefMJliEvENRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoii-0000000EKa9-2mqd;
	Wed, 19 Feb 2025 18:22:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoig-0000000EKYD-02lU
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 18:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF5105C5B9E;
	Wed, 19 Feb 2025 18:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABDEC4CEE6;
	Wed, 19 Feb 2025 18:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739989368;
	bh=faBN0IDEHn011JJ6CBEbtJMdZifBloW9Uki3sRQ2NFc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BiDzNvJjL91V2HDPnBs7dKbPdXvA8S0BQ46CpANs2Oc4NEmRROuvTqAUbOosqJSmc
	 ucLGRNjf0LoUsW3EC8/78mNlImUUpGRGLbWj2eh3/xr9xXd6spSqlKKc959yRA2dtM
	 Q88ubglPWVKNTDsxFF0RquzIThh9F/6CQNgOSGwhlFWFOXRy7DnnihJbh5Ml0M/9sP
	 +ObCE42MLKwCylSWckR1ATbINC39tseHs7lMFpnI4v3MTHolIXj4LWJmHHe0fBztN3
	 c5BktpBJXnFlVwHUf1TOg36nIxXT0UBE9++JKOwMWfKsJMSk7wHZ5rdsitf+ER/LYb
	 jj9gcm86rmXjA==
Date: Wed, 19 Feb 2025 12:22:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, kw@linux.com,
	u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
	bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
	inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
	lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, pbrobinson@gmail.com,
	robh@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
Subject: Re: [PATCH v3 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Message-ID: <20250219182247.GA225989@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BMXPR01MB24403F8CD6BF5D4D2DDC57A4FEFC2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_102250_156876_DE744074 
X-CRM114-Status: GOOD (  12.92  )
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

T24gV2VkLCBGZWIgMTIsIDIwMjUgYXQgMDE6NTQ6MTFQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3Rl
Ogo+IE9uIDIwMjUvMi8xMiAxMjoyNSwgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPiBbLi4uLi4uXQo+
ID4gPiBwY2llX3JjMSBhbmQgcGNpZV9yYzIgc2hhcmUgcmVnaXN0ZXJzIGluIGNkbnNfcGNpZTFf
Y3RybC4gQnkgdXNpbmcKPiA+ID4gZGlmZmVyZW50ICJzb3BoZ28sY29yZS1pZCIgdmFsdWVzLCB0
aGV5IGNhbiBkaXN0aW5ndWlzaCBhbmQgYWNjZXNzCj4gPiA+IHRoZSByZWdpc3RlcnMgdGhleSBu
ZWVkIGluIGNkbnNfcGNpZTFfY3RybC4KPiA+IFdoZXJlIGRvZXMgY2Ruc19wY2llMV9jdHJsIGZp
dCBpbiB0aGlzIGV4YW1wbGU/ICBEb2VzIHRoYXQgZW5jbG9zZQo+ID4gYm90aCBwY2llX3JjMSBh
bmQgcGNpZV9yYzI/Cj4gCj4gY2Ruc19wY2llMV9jdHJsIGlzIGRlZmluZWQgYXMgYSBzeXNjb24g
bm9kZSzCoCB3aGljaCBjb250YWlucyByZWdpc3RlcnMKPiBzaGFyZWQgYnkgcGNpZV9yYzEgYW5k
IHBjaWVfcmMyLiBJbiB0aGUgYmluZGluZyB5YW1sIGZpbGUsIEkgZHJldyBhIGRpYWdyYW0KPiB0
byBkZXNjcmliZSB0aGUgcmVsYXRpb25zaGlwIGJldHdlZW4gdGhlbSwgY29weSBoZXJlIGZvciB5
b3VyIHF1aWNrCj4gcmVmZXJlbmNlOgo+IAo+ICsgICAgICAgICAgICAgICAgICAgICArLS0gQ29y
ZSAoTGluazApIDwtLS0+IHBjaWVfcmMxICArLS0tLS0tLS0tLS0tLS0tLS0rCj4gKyAgICAgICAg
ICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAg
ICAgICAgIHwKPiArICAgICAgQ2FkZW5jZSBJUCAyIC0tKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCBjZG5zX3BjaWUxX2N0cmwgfAo+ICsgICAgICAgICAgICAgICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICB8Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICstLSBDb3JlIChMaW5rMSkgPC0tLT4gcGNpZV9yYzIgICstLS0tLS0t
LS0tLS0tLS0tLSsKPiAKPiBUaGUgZm9sbG93aW5nIGlzIGFuIGV4YW1wbGUgd2l0aCBjZG5zX3Bj
aWUxX2N0cmwgYWRkZWQuIEZvciBzaW1wbGljaXR5LCBJCj4gZGVsZXRlZCBwY2llX3JjMC4KCkxv
b2tzIGdvb2QuICBJdCB3b3VsZCBiZSBuaWNlIGlmIHRoZXJlIHdlcmUgc29tZSBuYW1pbmcgc2lt
aWxhcml0eSBvcgpjb21tZW50IG9yIG90aGVyIGhpbnQgdG8gY29ubmVjdCBzb3BoZ28sY29yZS1p
ZCB3aXRoIHRoZSBzeXNjb24gbm9kZS4KCj4gcGNpZV9yYzE6IHBjaWVANzA2MjAwMDAwMCB7Cj4g
wqDCoMKgIGNvbXBhdGlibGUgPSAic29waGdvLHNnMjA0Mi1wY2llLWhvc3QiOwo+IMKgwqDCoCAu
Li4uLi4gLy8gaG9zdCBicmlkZSBsZXZlbCBwcm9wZXJ0aWVzCj4gwqDCoMKgIGxpbnV4LHBjaS1k
b21haW4gPSA8MT47Cj4gwqDCoMKgIHNvcGhnbyxjb3JlLWlkID0gPDA+Owo+IMKgwqDCoCBzb3Bo
Z28sc3lzY29uLXBjaWUtY3RybCA9IDwmY2Ruc19wY2llMV9jdHJsPjsKPiDCoMKgwqAgcG9ydCB7
Cj4gwqDCoMKgwqDCoMKgwqAgLy8gcG9ydCBsZXZlbCBwcm9wZXJ0aWVzCj4gwqDCoMKgwqDCoMKg
wqAgdmVuZG9yLWlkID0gPDB4MWYxYz47Cj4gwqDCoMKgwqDCoMKgwqAgZGV2aWNlLWlkID0gPDB4
MjA0Mj47Cj4gwqDCoMKgwqDCoMKgwqAgbnVtLWxhbmVzID0gPDI+Owo+IMKgwqDCoCB9Owo+IH07
Cj4gCj4gcGNpZV9yYzI6IHBjaWVANzA2MjgwMDAwMCB7Cj4gwqDCoMKgIGNvbXBhdGlibGUgPSAi
c29waGdvLHNnMjA0Mi1wY2llLWhvc3QiOwo+IMKgwqDCoCAuLi4uLi4gLy8gaG9zdCBicmlkZSBs
ZXZlbCBwcm9wZXJ0aWVzCj4gwqDCoMKgIGxpbnV4LHBjaS1kb21haW4gPSA8Mj47Cj4gwqDCoMKg
IHNvcGhnbyxjb3JlLWlkID0gPDE+Owo+IMKgwqDCoCBzb3BoZ28sc3lzY29uLXBjaWUtY3RybCA9
IDwmY2Ruc19wY2llMV9jdHJsPjsKPiDCoMKgwqAgcG9ydCB7Cj4gwqDCoMKgwqDCoMKgwqAgLy8g
cG9ydCBsZXZlbCBwcm9wZXJ0aWVzCj4gwqDCoMKgwqDCoMKgwqAgdmVuZG9yLWlkID0gPDB4MWYx
Yz47Cj4gwqDCoMKgwqDCoMKgwqAgZGV2aWNlLWlkID0gPDB4MjA0Mj47Cj4gwqDCoMKgwqDCoMKg
wqAgbnVtLWxhbmVzID0gPDI+Owo+IMKgwqDCoCB9Cj4gCj4gfTsKPiAKPiBjZG5zX3BjaWUxX2N0
cmw6IHN5c2NvbkA3MDYzODAwMDAwIHsKPiDCoMKgwqAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cy
MDQyLXBjaWUtY3RybCIsICJzeXNjb24iOwo+IMKgwqDCoCByZWcgPSA8MHg3MCAweDYzODAwMDAw
IDB4MCAweDgwMDAwMD47Cj4gfTsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
