Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9684FCD8C85
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMu6BTpJfE9Gi8oBmQKEePh1CWZypSxSnvMAA56Blrg=; b=n+Yb6LFUY8Rmp7
	vQkyk7atnQ52II8gNm9BQVbvXVpO9IBNeex8S+aHskQoNWortdu0EF+BdMkEoudoIZTBLeLs9yn+7
	HRDoFaggOV+KHtfRYnIFSd3OX68zCvZJ9Ryu7X8ZGDyHBX/JG5rFUVI0hPWuU8DQUHkCGFI6+xNV/
	5NAJVABmPoTox1ZyUIeyx5Pap0GAnpfCKgQ84QNXZ/SN2JHkDQoij1rv41Dc3es8p0RfCLOEOKzgR
	YKt3LVsiamsTYdz487etl9RHzrUFrA8/nxqeKW26kbS8c1YsENS3dtC2ejfdveoZbWiEm25QZmt/2
	OFGPp0nnTDSFjP8FX9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpkV-00000004qAV-16YI;
	Tue, 09 Jun 2026 06:15:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpkT-00000004q9d-20FP;
	Tue, 09 Jun 2026 06:15:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9E3B43892;
	Tue,  9 Jun 2026 06:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6038B1F00893;
	Tue,  9 Jun 2026 06:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780985740;
	bh=7zbhbgbor1E1JAoHOKXANvflw7c5UsmJuOJ1lQkpXPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L4jOmEGMLdZbnUFC91Xcv90XokSk4w+AGxkV6H8bmHE4evsewi07htRX2eJZgwXM/
	 aGC1buDENkv8iOVsrg/REQRMHn1/elvJuUYp+yLamckNGNo6UBOsBuAP+m0kZliTZp
	 B1bvXI33G7e54G3jA89KZTR3sgUkC2fnk29FIbpH5HsQddeE1wVPLdAjZFujnew6cr
	 JscsRfG4+lZQ0t9rCzSZXM63QWHupcbc/k8p4Elc0jgbqw08TXLhsOsjNp1gsQtXmn
	 4FFtM23t72nByckqY8ucUnFBtckMF8tt3VCcgqWif8gjJdXapIr0WVZtXSRLAlSCDS
	 loS6WtMFeNCag==
Date: Mon, 8 Jun 2026 23:15:39 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 02/12] clk: thead: th1520-ap: add support for MISC subsys
 clocks
Message-ID: <aievi0s-3SO8hV6a@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
 <aier9XppLeCkJydw@thelio>
 <93b867c1b7f5526cc25cb04f838432cd752f5981.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <93b867c1b7f5526cc25cb04f838432cd752f5981.camel@icenowy.me>
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

T24gVHVlLCBKdW4gMDksIDIwMjYgYXQgMDI6MDE6NDNQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNi0wNi0wOOS4gOeahCAyMzowMCAtMDcwMO+8jERyZXcgRnVzdGluaeWG
memBk++8mgo+ID4gT24gVGh1LCBNYXkgMDcsIDIwMjYgYXQgMDQ6MTc6MDBQTSArMDgwMCwgSWNl
bm93eSBaaGVuZyB3cm90ZToKPiA+ID4gVGhlIFRIMTUyMCBTb0MgY29udGFpbnMgYSBNSVNDX1NV
QlNZUyBjbG9jayBjb250cm9sbGVyLCB3aGljaAo+ID4gPiBhbGxvd3MKPiA+ID4gY29udHJvbGxp
bmcgb2YgVVNCIHJlbGF0ZWQgY2xvY2tzIGFuZCBNTUMvU0QgY29udHJvbGxlciBBSEIgYnVzCj4g
PiA+IGNsb2Nrcy4KPiA+ID4gCj4gPiA+IEFkZCBzdXBwb3J0IGZvciB0aGlzIGNsb2NrIGNvbnRy
b2xsZXIsIGluIG9yZGVyIHRvIGVuYWJsZSBVU0IKPiA+ID4gc3VwcG9ydC4KPiA+ID4gCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNuPgo+
ID4gPiAtLS0KPiA+ID4gwqBkcml2ZXJzL2Nsay90aGVhZC9jbGstdGgxNTIwLWFwLmMgfCA2NAo+
ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+IMKgMSBmaWxlIGNoYW5n
ZWQsIDY0IGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay90aGVhZC9jbGstdGgxNTIwLWFwLmMKPiA+ID4gYi9kcml2ZXJzL2Nsay90aGVhZC9jbGstdGgx
NTIwLWFwLmMKPiA+ID4gaW5kZXggM2E2ODQ3ZjFjOTUwZi4uMjRmNzg1ZjBiMzI5YSAxMDA2NDQK
PiA+ID4gLS0tIGEvZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5jCj4gPiA+ICsrKyBi
L2RyaXZlcnMvY2xrL3RoZWFkL2Nsay10aDE1MjAtYXAuYwo+ID4gWy4uLl0KPiA+ID4gQEAgLTE2
MDksNiArMTY2MywxMiBAQCBzdGF0aWMgaW50IHRoMTUyMF9jbGtfcHJvYmUoc3RydWN0Cj4gPiA+
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ID4gwqAJCQlyZXR1cm4gcmV0Owo+ID4gPiDCoAl9
Cj4gPiA+IMKgCj4gPiA+ICsJaWYgKHBsYXRfZGF0YSA9PSAmdGgxNTIwX2FwX3BsYXRkYXRhKSB7
Cj4gPiA+ICsJCXJldCA9IGRldm1fY2xrX2h3X3JlZ2lzdGVyKGRldiwKPiA+ID4gJnVzYl9zdXNw
ZW5kX2Rpdl9jbGsuaHcpOwo+ID4gPiArCQlpZiAocmV0KQo+ID4gPiArCQkJcmV0dXJuIHJldDsK
PiA+ID4gKwl9Cj4gPiAKPiA+IFNob3VsZCB1c2Jfc3VzcGVuZF9kaXZfY2xrLmh3IGluc3RlYWQg
YmUgcmVnaXN0ZXJlZCB1bmRlcgo+ID4gJ2lmIChwbGF0X2RhdGEgPT0gJnRoMTUyMF9hcF9wbGF0
ZGF0YSknPwo+IAo+IERvIHlvdSBtZWFuIG1pc2NfcGxhdGRhdGE/Cj4gCj4gWWVzLCB0aGlzIGlz
IGFuIGNvcHktbi1wYXN0ZSBlcnJvciB0aGF0IGRlc2VydmVzIGEgZml4LgoKSGFoLCB5ZXMsIEkg
YWxzbyBoYWQgYSB0eXBvIDopCgpUaGFua3MsCkRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
