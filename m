Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230BCD2D0E7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 12:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FbE+9yH28j5pdX2+EaoQJKCKkup/H4Ggw9N0RP1AJDM=; b=GudjrNdkTZ+WOF
	hq7Qw87wawk9XJUIwitpGXbIgs0+GupfepNVFo+5kBYt8T/mhJk6L//O+NSnkuLj+wn/ftyVbV4xE
	6JJtiaHa4GEHQOM2UmjfA3R5KsR2eJuL3YvIIQ/0Z/KrA64ksdeHFKEhNHkzty4XwUbQYB2jvkxt9
	J1NmsJWnwS9GnYmByD3AkdagvffwFJrgH+M3Y7POTEFgf5jXnOzxMf2bvcOqo9RwErlxT9pPk/wGd
	J83iO4Rukq6OUfmbTD5G3UdJLWR4UbTQ2MdpDEF6/A6KkHFwSr2MWKAjQVoL6XUNPubuFRbjARHOg
	MCyJRfvvNPLVqjC4oZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdjU-000000076Tv-3aSz;
	Tue, 13 Jan 2026 12:42:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdjU-000000076Th-0EnV
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 12:42:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B20A60051;
	Tue, 13 Jan 2026 12:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460D0C116C6;
	Tue, 13 Jan 2026 12:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768308166;
	bh=P2uVOyvO0aRD4x+AWbtaIRkMuZiJS26sqB6OLBNwyiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnIVFfJwKm6rxZumFVPVq1zTue8z1VtgFnbUgg2XbDd49RMaa2Z6KjHDZi8nXSp4g
	 kfVmKo4xo9sbtlHDtg7L6RRdDJHVfrOEUTNwuV8iEZz5mYpuv/WidxtUCWt/P4bbmx
	 ZHxAJiyx9ShQJ3Ujs4OWCMXyGaZQqNV5ecyVAODAanZUDLr2ByhsrPsNYBUmPqauld
	 vFsWskQcaWrWPfippVT8t4mSDcwMPaLue3lrLcWXs7mZkDaPp5RF5MBRy69FbXVZl/
	 Qh0q6Gfz8XYf5Am1ah08RfRepEx0wnfkIysMMXovx2N6qZ93wpHpxSWLVDYVmkqxyr
	 Fxz7wAlc5s6jA==
Date: Tue, 13 Jan 2026 12:42:41 +0000
From: Lee Jones <lee@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] mfd: simple-mfd-i2c: add default value
Message-ID: <20260113124241.GB2842980@google.com>
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-2-6fe19f460269@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-p1-kconfig-fix-v5-2-6fe19f460269@linux.spacemit.com>
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

T24gVGh1LCAwOCBKYW4gMjAyNiwgVHJveSBNaXRjaGVsbCB3cm90ZToKCj4gVGhlIGRlZmF1bHQg
dmFsdWUgb2YgdGhlIFAxIHN1Yi1kZXZpY2UgZGVwZW5kcyBvbiB0aGUgdmFsdWUKPiBvZiBQMSwg
c28gUDEgc2hvdWxkIGhhdmUgYSBkZWZhdWx0IHZhbHVlIGhlcmUuCj4gCj4gQWNrZWQtYnk6IEFs
ZXggRWxkZXIgPGVsZGVyQHJpc2NzdGFyLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNo
ZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KPiAtLS0KPiBDaGFuZ2UgbG9n
IGluIHY1Ogo+IC0gbm90aGluZwo+IC0gTGluayB0byB2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjUxMjI1LXAxLWtjb25maWctZml4LXY0LTItNDRiNjcyODExN2MxQGxpbnV4LnNw
YWNlbWl0LmNvbS8KPiAKPiBDaGFuZ2UgbG9nIGluIHY0Ogo+IC0gZGVmYXVsdCBtIGlmIEFSQ0hf
U1BBQ0VNSVQgaW5zdGVhZCBvZiBkZWZhdWx0IEFSQ0hfU1BBQ0VNSVQKPiAtIExpbmsgdG8gdjM6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MTExOC1wMS1rY29uZmlnLWZpeC12My00
LTg4MzljNWFjNWRiM0BsaW51eC5zcGFjZW1pdC5jb20vCj4gLS0tCj4gIGRyaXZlcnMvbWZkL0tj
b25maWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWZkL0tjb25maWcgYi9kcml2ZXJzL21mZC9LY29uZmlnCj4gaW5kZXgg
YWFjZTU3NjZiMzhhYTVlNDZlMzJhOGE3YjQyZWVhMjM4MTU5ZmJjZi4uYzc1N2JjMzY1MDI5ZGM3
OTRjNjU4ZmM1YjEwMDg0YTBmMjlhYzliNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21mZC9LY29u
ZmlnCj4gKysrIGIvZHJpdmVycy9tZmQvS2NvbmZpZwo+IEBAIC0xMjc2LDYgKzEyNzYsNyBAQCBj
b25maWcgTUZEX1NQQUNFTUlUX1AxCj4gIAlkZXBlbmRzIG9uIEFSQ0hfU1BBQ0VNSVQgfHwgQ09N
UElMRV9URVNUCj4gIAlkZXBlbmRzIG9uIEkyQwo+ICAJc2VsZWN0IE1GRF9TSU1QTEVfTUZEX0ky
Qwo+ICsJZGVmYXVsdCBtIGlmIEFSQ0hfU1BBQ0VNSVQKPiAgCWhlbHAKPiAgCSAgVGhpcyBvcHRp
b24gc3VwcG9ydHMgdGhlIEkyQy1iYXNlZCBTcGFjZW1pVCBQMSBQTUlDLCB3aGljaAo+ICAJICBj
b250YWlucyByZWd1bGF0b3JzLCBhIHBvd2VyIHN3aXRjaCwgR1BJT3MsIGFuIFJUQywgYW5kIG1v
cmUuCgpJIGFscmVhZHkgYXBwbGllZCB2NC4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
