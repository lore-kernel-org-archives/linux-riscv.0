Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71F6C982E1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 08:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2res6iRiWjgvQjL7X58QtFXdLGkdR8fBLVd15BHj3cc=; b=gT7tnJuSES1f/2
	8laVtyM2YLMISWraPqNZlJhCdxd/UAzlLkMxJQmxer1PTR+zdNxaRWuOhjHVwENGSlNHjWzYWckMg
	1nsl12Mcjx+P5Gx69Crh8FWeFcY39E9GXjDXHwDCArmWM5BQY3sRqh80JimHwd7Z1SXJEWfKR6q8g
	pom6ZvolDYx0oTDCTAlQSl83Y6BLQu4apeXojOoG1JpxblAr85aNzkdNQHXBvDLiTFenMAQlFMFCq
	swiI8lfr9uFpLRQ1PwNgeVev8AsFToQ3woVxV5arUJECs4FlLhnuepFFmknUBYH99H9Xwd8tcvhvo
	3Mbv/fMlC0HrKiPpd8Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Z0H-00000001IGV-1SGH;
	Mon, 21 Sep 2026 08:03:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Z0F-00000001IGI-48TW;
	Mon, 21 Sep 2026 08:03:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A25A43F48;
	Mon, 21 Sep 2026 08:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828281F000FF;
	Mon, 21 Sep 2026 08:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789977835;
	bh=KsQ90edjAsrAFhgm0/rE7PgtI+eNbFXo/5sMFQhaex8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iyvcyeVtgEssGNPqi5AqV9YcLohVP5PW4hfA+04vJnkWBxNwXDtjUJuJzu8N5gZtG
	 onJzbXPynz2tvKP4yxiUjnAax/oTMIIEYHAYckQc94cCQ/Pj91ZbDnQR86AmYKBwcy
	 m7jrqwIbDIo6FuCVYmsgJJPpPSiTibcDPAy/Io7lL3PovVQ832ShqgYRG5/4UNc1lK
	 NWXYRHjSsQZLnZoQBeI7+LncGpxLQx7P4RaOZORt68k6IDd9QSlIgP99CL97QF1+jr
	 Z2Pbl7GS4U5NdJ9ux9VO8pz0kpGxcA7tPE25y+v0o8Aso4rXjMDGW7FO1dCozHbNya
	 uhMthxWfECFzQ==
Date: Mon, 21 Sep 2026 10:03:46 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Encrow Thorne <encrow.thorne@linux.spacemit.com>
Cc: Bruno Banelli <bbanelli@gmail.com>, linux-pci@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>, 
	Yixun Lan <dlan@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Wilczynski <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>, Javier Martinez Canillas <javierm@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [BUG] PCI: spacemit-k1: port C probe hard-hangs a CPU with one
 endpoint on Milk-V Jupiter
Message-ID: <xuafb5qshj6rowe3v6sxyfvtemy4wg2ttqs7lcwu3txu2mpyzm@fr72njh6zgvi>
References: <20260825052249.66921-1-bbanelli@gmail.com>
 <DLKRGJBNFVQO.15WZ2SXQLOY0T@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DLKRGJBNFVQO.15WZ2SXQLOY0T@linux.spacemit.com>
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

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgMDE6NTU6NDJQTSArMDgwMCwgRW5jcm93IFRob3JuZSB3
cm90ZToKClsuLi5dCgo+IEhpIEJydW5vLAo+IAo+IFRoZSBpc3N1ZSB3YXMgY2F1c2VkIGJ5IGEg
bWlzc2luZyBoYXJkd2FyZSBjb25maWd1cmF0aW9uIGluIHRoZSBLMSBQQ0llCj4gaW5pdGlhbGl6
YXRpb24uCj4gCj4gVGhlIFBNVSBQQ0lFX0NPTlRST0xfTE9HSUMgcmVnaXN0ZXIgY29udGFpbnMg
YW4gSUdOT1JFX1BFUlNUTiBiaXQgKEJJVCgyKSkuCj4gVGhlIGhhcmR3YXJlIG1hbnVhbCBkZXNj
cmliZXMgaXQgYXMgZm9sbG93czoKPiAKPiDigJxXaGVuIHNldCB0byAxLCB0aGUgUENJZSBjb250
cm9sbGVyIGFuZCBQSFkgaWdub3JlIHRoZSBQRVJTVE4gc2lnbmFsIGZyb20KPiB0aGUgbGluayBw
YXJ0bmVyIGluIGJvdGggUkMgYW5kIEVQIG1vZGVzLuKAnQo+IAo+IFRoaXMgYml0IHdhcyBub3Qg
Y29uZmlndXJlZCBkdXJpbmcgUkMgaW5pdGlhbGl6YXRpb24uIEFzIGEgcmVzdWx0LCB0aGUKPiBj
b250cm9sbGVyIGFuZCBQSFkgY291bGQgc3RpbGwgYmUgYWZmZWN0ZWQgYnkgdGhlIFBFUlNUTiBp
bnB1dCBkdXJpbmcgdGhlCj4gZWFybHkgREJJIGFjY2Vzc2VzLiBXaXRoIHRoZSBJbnRlbCBJMjI1
LVYgaW5zdGFsbGVkLCB0aGUgZmlyc3QgREJJIGFjY2Vzcwo+IGNvdWxkIHJlbWFpbiBwZW5kaW5n
IGFuZCBoYW5nIHRoZSBDUFUuCj4gCgpXaGF0IGRvZXMgdGhpcyAnUEVSU1ROJyBiaXQgY29udHJv
bHM/IFBFUlNUIyBvciBzb21ldGhpbmcgZWxzZT8gUEVSU1QjIGlzCmNvbnRyb2xsZWQgb25seSBi
eSB0aGUgUm9vdCBDb21wbGV4IGJ0dy4gQWxzbywgd2h5IGRvZXMgdGhpcyBtaXNzaW5nIHJlZ2lz
dGVyCmNvbmZpZ3VyYXRpb24gb25seSBhZmZlY3RpbmcgSW50ZWwgSTIyNS1WIGVuZHBvaW50IGFu
ZCBub3Qgb3RoZXJzPwoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCu
muCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
