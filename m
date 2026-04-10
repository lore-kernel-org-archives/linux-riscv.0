Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD263F45A0F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 23:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8BOWR1OfFFI7Sl1lyJrNNU6agcDnlj0shN8rxbRaDw=; b=vnw/Uos8Bi5hc8
	mdwDX9okGDhIyBgUwStd+dlw+3Ljs0n3H7c/AynlQ1ifOWWn8jBXg739QpbH0a5lHKcCZHJ1Brs4X
	znUjQlHAaiEQcCTeiEAP4IdqykNhnZlXHvU6F3oHneZ0WExkZDCfkAWqkwV5305ErIXC64iIWdegD
	kM3x5moAcYrHDRqeq2QYAZaCdBksk9y8KXaIG4up71GHWAvgkls5EB4/9a03vkKx5vWtf1aRCTDSN
	0c3qek36jVqs47eeQjSEl/q5DXWDaO5Dnk5nuvGteSsJugERXCVXm2Yd2HvMDM0J/Dy5j07/tn7Mi
	g6nDJpQAfHxG4IhgsERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBLQ6-0000000CvvB-0xtB;
	Fri, 10 Apr 2026 23:37:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBLQ5-0000000Cvue-3CJu
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 23:37:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD85360141;
	Fri, 10 Apr 2026 23:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4360EC19421;
	Fri, 10 Apr 2026 23:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775864268;
	bh=9nyWpvl587TXnw2WHO5q+qP+iVSustuNqLD/U3XMv24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iNTF2OFVv6rlhpMPVLGC+iL5F/WSz2Ou9zFlHB24lyGAb8rY2iRQ01M9hYtEXtKbg
	 9lzVb4h1hhLNMNbaeq8zIFpV8w+34Je76IAJbFh+U2DBC6HuGiDzwU5yVm1zabkvVw
	 ZIIC7RQqZul1N8xHXtf1+VwqxZD9FGCtcKmEGTbmHqnr9VWm7wJC0oMsboonlD1U2q
	 eA8yiYXsE/4fqTO+0H0UsOLxbm46bfgyqVWLEGuiOn5HgDapTGZjzY9AN3CcAZijjY
	 QCIAgPpBv7QFFIDxu0ibTSk20g2kr2aXQ3YrO5FxdA9heCdDTuo8xQqALxJlLIj5VW
	 6GmJvWyuUcOkQ==
Date: Sat, 11 Apr 2026 07:37:46 +0800
From: Yixun Lan <dlan@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org, Yixun Lan <dlan@gentoo.org>,
	Arnd Bergmann <arnd@arndb.de>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.1
Message-ID: <20260410233746-GKA1167630@kernel.org>
References: <20260403123040-KYC0145825@kernel.org>
 <CAD++jLkQfUwhvDOCkhK2NtRyXrb6y9rwpDckR6h0G3+dzYwW3A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD++jLkQfUwhvDOCkhK2NtRyXrb6y9rwpDckR6h0G3+dzYwW3A@mail.gmail.com>
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

SGkgTGludXMsCgpPbiAwMDoxOSBTYXQgMTEgQXByICAgICAsIExpbnVzIFdhbGxlaWogd3JvdGU6
Cj4gSGkgWWl4dW4sCj4gCj4gSSBsb29rZWQgaW50byB0aGlzIHB1bGwgcmVxdWVzdC4KPiAKPiBJ
J20gc29ycnkgaWYgSSBkbyBzdHVwaWQgbWlzdGFrZXMgaW4gaGFuZGxpbmcgaXQsIEknbSBuZXcg
dG8gbWFpbnRhaW5pbmcKPiB0aGUgU29DIHRyZWUuIEJlYXIgd2l0aCBtZS4KPiAKPiBPbiBGcmks
IEFwciAzLCAyMDI2IGF0IDI6MzLigK9QTSBZaXh1biBMYW4gPGRsYW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gCj4gPiBBdXJlbGllbiBKYXJubyAoNyk6Cj4gPiAgICAgICByaXNjdjogZHRzOiBzcGFj
ZW1pdDogZHJvcCBpbmNvcnJlY3QgcGluY3RybCBmb3IgY29tYm8gUEhZCj4gKC4uLikKPiA+IFlp
eHVuIExhbiAoOSk6Cj4gPiAgICAgICByaXNjdjogZHRzOiBzcGFjZW1pdDogcGNpZTogZml4IG1p
c3NpbmcgcG93ZXIgcmVndWxhdG9yCj4gCj4gW0ZpeGVzXQo+IGZhdGFsOiBOb3QgYSB2YWxpZCBv
YmplY3QgbmFtZSBsaW51cy9tYXN0ZXIKQ291bGQgYmUgdGhlIHByb2JsZW0gdGhhdCB5b3VyIG1h
c3RlciBicmFuY2ggaXNuJ3QgdXAtdG8tZGF0ZT8KCj4gQ29tbWl0OiBjNjgzNjBjMGQ2MzYgKCJy
aXNjdjogZHRzOiBzcGFjZW1pdDogZHJvcCBpbmNvcnJlY3QgcGluY3RybAo+IGZvciBjb21ibyBQ
SFkiKQouLgo+ICAgICBGaXhlcyB0YWc6IEZpeGVzOiAwYmUwMTZhNGI1ZDFiOSAoInJpc2N2OiBk
dHM6IHNwYWNlbWl0OiBQQ0llIGFuZAo+IFBIWS1yZWxhdGVkIHVwZGF0ZXMiKQpBYm92ZSBjb21t
aXQgd2FzIG1lcmdlZCBmb3IgdjcuMCBjeWNsZSwgd2hpbGUgdGhpcyBQUiBpcyBmb3IgdjcuMQpU
aGUgZml4IGlzbid0IHRoYXQgY3JpdGljYWwgYW5kIGRpZG4ndCBjYXVzZSBhbnkgcnVuLXRpbWUg
aXNzdWUsIHNvCkkgZG8gdGhlIGZpeCBpbiB0aGlzIHY3LjEgY3ljbGUuLgoKPiAgICAgSGFzIHRo
ZXNlIHByb2JsZW0ocyk6Cj4gICAgICAgICAtIEluc3BlY3Q6IFRhcmdldCBTSEEgaXMgbm90IGFu
Y2VzdG9yIG9mIExpbnVzJyBtYXN0ZXIgYnJhbmNoLAo+IHdoaWNoIG1lYW5zIGl0IGlzIGZpeGlu
ZyBjb21taXQgaW4geW91ciBicmFuY2gKPiBmYXRhbDogTm90IGEgdmFsaWQgb2JqZWN0IG5hbWUg
bGludXMvbWFzdGVyCj4gQ29tbWl0OiA4YTkwNzEyOTlkZWMgKCJyaXNjdjogZHRzOiBzcGFjZW1p
dDogcGNpZTogZml4IG1pc3NpbmcgcG93ZXIgcmVndWxhdG9yIikKPiAgICAgRml4ZXMgdGFnOiBG
aXhlczogMGJlMDE2YTRiNWQxICgicmlzY3Y6IGR0czogc3BhY2VtaXQ6IFBDSWUgYW5kCj4gUEhZ
LXJlbGF0ZWQgdXBkYXRlcyIpCj4gICAgIEhhcyB0aGVzZSBwcm9ibGVtKHMpOgo+ICAgICAgICAg
LSBJbnNwZWN0OiBUYXJnZXQgU0hBIGlzIG5vdCBhbmNlc3RvciBvZiBMaW51cycgbWFzdGVyIGJy
YW5jaCwKPiB3aGljaCBtZWFucyBpdCBpcyBmaXhpbmcgY29tbWl0IGluIHlvdXIgYnJhbmNoCj4g
Cj4gU28gdGhpcyBtZWFucyB5b3UgaW50cm9kdWNlZCBidWdzIGFuZCBmaXggdGhlbSBpbiB0aGUg
c2FtZSBwdWxsIHJlcXVlc3Q/Cj4gCj4gV2h5Pwo+IAo+IFRoZSBwcmFjdGljZSBpcyB0byBzcXVh
c2ggc3VjaCBmaXhlcyBpbnRvIHRoZSBvZmZlbmRpbmcgcGF0Y2hlcyB3aGVuCj4gcHJlc2VudGlu
ZyBwdWxsIHJlcXVlc3RzLiBCdXQgSSB3ZW50IGFoZWFkIGFueXdheSwgdHJ5aW5nIHRvIG5vdCBi
ZSBzbwo+IHBpY2t5LiAoVGhlIGNvbW1pdHMgYXJlIHRoZXJlLCBpbiB5b3VyIGJyYW5jaCBpbmRl
ZWQuKQo+IApHbGFkIHRvIGxlYXJuIHRoaXMsIEkgd2lsbCBrZWVwIGl0IGluIG1pbmQuLgoKPiAt
IENoZWNrZWQgdGhhdCBpdCB3YXMgaW4gbGludXgtbmV4dCBPSwpSaWdodCwgSSB0aGluayB0aGUg
Y29tbWl0IGlzIGFjdHVhbGx5IGluIHY3LjAtcmMxCgo+IC0gYnVpbHQgRFRCUyBPSwo+IAo+IFB1
bGxlZCBpbiwgdGhhbmtzLgpUaGFuayB5b3UKCj4gCj4gWW91cnMsCj4gTGludXMgV2FsbGVpagoK
LS0gCllpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
