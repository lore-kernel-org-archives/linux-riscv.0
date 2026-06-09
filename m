Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF56CD8CAE
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Doqqu4bsH9OYOhzMNnPAA0D8BGvuaqckmEsNFWUj3T0=; b=AM7akvcKecPmah
	ff8aYfXFm8g3QvsCLos5HxTpyxwv78jolXzu8K4NHkYFwQTGKy1CJc1cBcCBheAcLnxVRAMKDb9NM
	3vveV2SeEhcXck0x+hd+v3uBduAdXATEvfvf1skFBm6jbJAiRJtFoidpGf3m43CRgruTqjMes7jod
	o64cmUkfVcIyntm2sPKrKgRwNYgW7g8umifQgJcXQw8O3agHcmrJ9a9y9xucxXetMrbQO445cUCTb
	0B72kK+jtVLSA3ELY8vAS+JPZhlrnBO16BrTR8Y6JlNmDrio6lMWZlAn9Djs4jL6h8WWAdhuyK7zb
	KeyG+Eqf7OrfuXs4yNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpjV-00000004q2s-1xZW;
	Tue, 09 Jun 2026 06:14:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpjU-00000004q2d-3NHr;
	Tue, 09 Jun 2026 06:14:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AC710601FD;
	Tue,  9 Jun 2026 06:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A4B1F00893;
	Tue,  9 Jun 2026 06:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780985679;
	bh=BKUNXUXBCi8bnRLind/MhqgA2mObgw9K4PguVb33Mmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qsoqzpe3Yk+cO7Df3L6n87Tsa501qYTF85v7NibFO81JuTOpF/9VVBbBEIshF4FQ9
	 S4vwi0nKt8ogH1X7kI9H/Rhq0EPB0EyOHw7tuQMNzktwHuIw2luQ6BTn6TUeZEL8eO
	 vgPLAZ57mxcWnQwBpAs9iv1dJlTICNf3kSyXtvU4HwZAw5zTh5cDPKWuJzj1ceArPY
	 GytvvBxI3gQv0131i4COZdD/7gqNeu65JbcPR/SEIUgTqKHbu6lCio7XaAdZY/cpLy
	 fb3+MruIQUjkr7CMm46WJZk/89hvk6Hek0AFRF+SF55Lhg92P9ljW2FZjDq+YdrhlY
	 Es0iOU1l36zAg==
Date: Mon, 8 Jun 2026 23:14:37 -0700
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
Subject: Re: [PATCH 00/12] Add TH1520 USB support
Message-ID: <aievTZ5hqHGL-pTh@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <aieT4WmWK9416M9E@thelio>
 <a8dc863b1692b4d327b4b9700dd56a4754120561.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8dc863b1692b4d327b4b9700dd56a4754120561.camel@icenowy.me>
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

T24gVHVlLCBKdW4gMDksIDIwMjYgYXQgMDE6MTA6NDFQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNi0wNi0wOOS4gOeahCAyMToxNyAtMDcwMO+8jERyZXcgRnVzdGluaeWG
memBk++8mgo+ID4gT24gVGh1LCBNYXkgMDcsIDIwMjYgYXQgMDQ6MTY6NThQTSArMDgwMCwgSWNl
bm93eSBaaGVuZyB3cm90ZToKPiA+ID4gVGhpcyBwYXRjaHNldCBhZGRzIHN1cHBvcnQgZm9yIFQt
SGVhZCBUSDE1MjAncyBVU0IgZnVuY3Rpb25hbGl0eSwKPiA+ID4gYW5kCj4gPiA+IGVuYWJsZWQg
aXQgb24gdGhlIExpY2hlZSBQaSA0QSBib2FyZC4KPiA+ID4gCj4gPiA+IFRoZSBmaXJzdCAzIHBh
dGNoZXMgYWRkIHN1cHBvcnQgZm9yIHRoZSBNSVNDIHN1YnN5c3RlbSBjbG9jawo+ID4gPiBjb250
cnRvbGxlciwgd2hpY2ggY29udGFpbnMgc29tZSBVU0IgY2xvY2tzLgo+ID4gPiAKPiA+ID4gVGhl
IG5leHQgMiBwYXRjaGVzIGFkZCBzdXBwb3J0IGZvciB0aGUgVVNCIFBIWSBvZiBULUhlYWQgVEgx
NTIwLAo+ID4gPiB3aGljaAo+ID4gPiBpcyBhIHdyYXBwZWQgU3lub3BzeXMgVVNCMy4wIEZlbXRv
UEhZIHdpdGggYSBsaXR0bGUgaW50ZWdyYXRpb24KPiA+ID4gcXVpcms7Cj4gPiA+IHRoZSBjb250
cm9sbGVyIGl0c2VsZiBpcyBhIHByb3Blcmx5IGNvbmZpZ3VyZWQgRFdDMyBjb250cm9sbGVyIHdp
dGgKPiA+ID4gc2FuZQo+ID4gPiBkZWZhdWx0IHJlZ2lzdGVyIHZhbHVlcyBzZXQuCj4gPiA+IAo+
ID4gPiBUaGVuIG9uZSBwYXRjaCBhZGRzIHRoZSBVU0IgUEhZIGFuZCBjb250cm9sbGVyIG5vZGVz
IHRvIHRoZSBUSDE1MjAKPiA+ID4gRFRTSQo+ID4gPiBmaWxlLgo+ID4gPiAKPiA+ID4gVGhlIHJl
bWFpbmluZyBoYWxmIG9mIHRoaXMgcGF0Y2hzZXQgZGVkaWNhdGVzIHRvIGVuYWJsZW1lbnQgb2Yg
VVNCCj4gPiA+IG9uCj4gPiA+IFRIMTUyMCwgYmVjYXVzZSBvZiB0aGUgb25ib2FyZCBodWIgb2Yg
dGhhdCBib2FyZCAtLSBpdHMgVVNCMgo+ID4gPiBzaWduYWxzIGFyZQo+ID4gPiBiZWhpbmQgYSBz
d2l0Y2ggdGhhdCBuZWVkcyB0byBiZSB0b2dnbGVkIG9uLCBhbmQgVmJ1cyBzdXBwbGllcyBmb3IK
PiA+ID4gYm90aAo+ID4gPiB0aGUgaHViIGl0c2VsZiBhbmQgZG93bnN0cmVhbSBwb3J0cyBhcmUg
bWFuYWdlZCB2aWEgSTJDLWV4cGFuZGVkCj4gPiA+IEdQSU9zCj4gPiA+IChiZWNhdXNlIHRoZSBT
b0MgZG9lcyBub3QgaGF2ZSBlbm91Z2ggR1BJTyBwaW5zKS4KPiA+IAo+ID4gSGksIHRoYW5rcyBm
b3Igd29ya2luZyBvbiBVU0IuIEkgdHJpZWQgdG8gYXBwbHkgaXQgdG8gbmV4dC0yMDI2MDYwMQo+
ID4gYW5kCj4gPiBzZXZlcmFsIG9mIHRoZSBkdHMgcGF0Y2hlcyBubyBsb25nZXIgYXBwbHkgY2xl
YW5seS4gQ291bGQgeW91IHJlYmFzZT8KPiAKPiBJIHRoaW5rIHRoZSByZWFzb24gaXMgdGhhdCBv
bmUgb2YgdGhlIEdQSU8gZXhwYW5zaW9uIGNoaXAgaXMgYWRkZWQgdG8KPiB0aGUgRFQgZm9yIGVu
YWJsaW5nIFdpLUZpLgoKWWVhaCwgSSB0cmllZCB0byByZXNvbHZlIHRoZSBjb25mbGljdHMgYnV0
IEknbSBub3Qgc3VyZSB3aGF0IHRoZSBjb3JyZWN0CnJlc29sdXRpb24gaXMuCgphMjAyNDFjMDgz
ODUgKCJyaXNjdjogZHRzOiB0aGVhZDogRW5hYmxlIFdpRmkgb24gTGljaGVlIFBpIDRBIikgYWRk
cwonY2xvY2stZnJxdWVuY3kgPSA8NDAwMDAwPicgdG8gJmkyYzEgd2hpbGUgdGhpcyBzZXJpZXMg
aW5zdGVhZCBzZXRzCidjbG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwPicuIFRoYXQgY29tbWl0IGFs
c28gc2V0cyBpMmMxX3BpbnMKJ2JpYXMtcHVsbC11cCA9IDwyMTAwPicgd2hpbGUgdGhpcyBzZXJp
ZXMgc2V0cyBiaWFzLWRpc2FibGUuCgo+IEkgYW0gbm90IHN1cmUgd2hldGhlciB0aGUgbmV4dCBy
ZXZpc2lvbiBvZiB0aGlzIHBhdGNoc2V0IHdpbGwgY29udGFpbgo+IGFsbCB0aGluZ3MsIG1heWJl
IEkgd2lsbCBzcGxpdCBvdXQgYXQgbGVhc3QgdGhlIFVTQiBQSFkgcGFydC4KCkkgdGhpbmsgc3Bs
aXR0aW5nIG91dCB3b3VsZCB3b3JrLCB0b28uCgpUaGFua3MsCkRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
