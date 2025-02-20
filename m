Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857F2C021B1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 16:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sWBeMBtL/nh1szkvVtR34Cn9XwVLJNXWzCIsNXNpU2A=; b=rdhYcgNOLGGBW6
	OQ5oYhYhhCjlbXyxCM/8dtMgdKtOJlKXFRUX00hQ8fBmdFMuuPiyF7uuYEtUrkm7E41yWdeCfTAmu
	L8nvrBxrJLJLVnjG8xH4z7KV31VOgh8eukzg4R06v7zGpDAG1gSDsHhXbc/rFEKzTE8UyxDYBBv3z
	+p19PXLcv+JYoLXbXG30KAEaEx7kqux+sYwwNMOzbfbmoSKQsvBq8fmeDwCRu89rZQ9NbUy6LqZxl
	PTW3jZ+Lp4ZxBARU3qZOJiWp1wRghFMuR34vcNRwlUi+XC4ncH9ut6DdFQ76Vby+s8FSJEFBhpvhv
	EKXSz2VnvSLje6oxMvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl922-00000001kCj-35Tc;
	Thu, 20 Feb 2025 16:04:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8yh-00000001jCZ-4A4O
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 16:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B106F6153F;
	Thu, 20 Feb 2025 16:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E431C4CED1;
	Thu, 20 Feb 2025 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740067243;
	bh=9L4HEH//kcH7ypLCadQEdfvBlWvdbCpj7JQG7mIJkuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i7VuRydACqsGAt79jQbZLbzefJUUsO52VYd/EUKCf1jz4/bRVeiwMEDFNTEO0ZyUz
	 e4xwI6AaldSYBguc5k7ClGijTcgIIQlUjeCz3a3HiYMGXUAscj78eaZhLuT4FcT1/z
	 zc7UWAFTZb9e80meNgP0iHwMztOkernuHnPyFbc4Z/Q5W3rViVaRdxZj6AucgmSZQ0
	 wCylTcmdJD6BVhFl/RwhvBfg50N093qyFT9Ydir/yBdH2t2l8v0iDVJvRWPDW7U+0/
	 TR/32AHUgfXcPYkfhd415AVDdYET+cwBxdubyaNJXRbDOxwtP8UAjYpyCREFtKYfHp
	 S3RdwL+IZZOsw==
Date: Thu, 20 Feb 2025 16:00:35 +0000
From: Lee Jones <lee@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
	arnd@arndb.de, bhelgaas@google.com, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com, krzk+dt@kernel.org,
	lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, pbrobinson@gmail.com,
	robh@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com,
	helgaas@kernel.org, Chen Wang <unicornxw@gmail.com>
Subject: Re: (subset) [PATCH v3 3/5] dt-bindings: mfd: syscon: Add sg2042
 pcie ctrl compatible
Message-ID: <20250220160035.GB824852@google.com>
References: <cover.1736923025.git.unicorn_wang@outlook.com>
 <a9b213536c5bbc20de649afae69d2898a75924e4.1736923025.git.unicorn_wang@outlook.com>
 <173928439078.2206727.3592689089610946034.b4-ty@kernel.org>
 <BM1PR01MB2433B351262A2963B192F0A8FEFC2@BM1PR01MB2433.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BM1PR01MB2433B351262A2963B192F0A8FEFC2@BM1PR01MB2433.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_080044_082291_5FA01233 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCAxMiBGZWIgMjAyNSwgQ2hlbiBXYW5nIHdyb3RlOgoKPiBIZWxsbywgTGVlCj4gCj4g
SSB3b3VsZCByZXF1ZXN0IHRoYXQgdGhpcyBwYXRjaCBub3QgYmUgbWVyZ2VkIHlldCwgYmVjYXVz
ZSBpdCBpcyByZWxhdGVkIHRvCj4gUENJZSBjaGFuZ2VzLCBhbmQgdGhlIFBDSWUgY2hhbmdlcyAo
YmluZGluZ3MgYW5kIGR0cykgaGF2ZSBub3QgYmVlbgo+IGNvbmZpcm1lZCB5ZXQuCj4gCj4gQWx0
aG91Z2ggdGhpcyBwYXRjaCBpcyBzbWFsbCBhbmQgd2lsbCBub3QgYWZmZWN0IG90aGVyIGJ1aWxk
cywgaXQgaXMgYmVzdCB0bwo+IHN1Ym1pdCBpdCB0b2dldGhlciB3aXRoIHRoZSBQQ0llIHBhdGNo
IGFmdGVyIGl0IGlzIGNvbmZpcm1lZC4KPiAKPiBTb3JyeSBmb3IgdGhlIHRyb3VibGUuCgpVbmFw
cGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
