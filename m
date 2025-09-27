Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE52CCAC5BB
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Sep 2025 01:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUArMo36kvuuLgwbBvPXntFJ5W/93zpOZhJsm8mvjMc=; b=0S5PFIymCSHSpg
	9YxFjQHGWyWEkkfvHNx5kvoLtCLsTrygDKDVQjuFp/95DDYkKfkk/HoGFsq5qBpL5ZoU1/eBHTCXh
	TlZhrLsfhHsBvncGhfy8wGIONRo40qZoSlxbQxE1HzZQf4PsP+u7MH4zpheu63lhlw6U1+fZvQHwn
	uNQ8XtxcPJJOQTAm5B1QtmKg51QmuNNJ6uKCUUP8s+DZFD/svVEfE223hyomJpidCDWR2EXuqgRGB
	rJwGTLx7sjo3T95hjByjAMPwnyLEI9hifCt5vB+oMXw+/VNmwJJTS6Q708IsJJ9Cw4t8gDVPd126Q
	O+5TTtNJ3D2h0oTV30Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Jfx-000000060r5-3SwM;
	Sat, 27 Sep 2025 01:24:37 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Jfv-000000060qG-3lx5
	for linux-riscv@lists.infradead.org;
	Sat, 27 Sep 2025 01:24:36 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AC438340D3C;
	Sat, 27 Sep 2025 01:24:34 +0000 (UTC)
Date: Sat, 27 Sep 2025 09:24:29 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <20250927012429-GYA1330052@gentoo.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250926111055-GYB1324993@gentoo.org>
 <E4EE696368DDDB1E+aNaRl8upyNeld9zX@troy-wujie14pro-arch>
 <aNajJ0RZ4Ku0eDXr@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aNajJ0RZ4Ku0eDXr@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_182435_958763_3AEB2098 
X-CRM114-Status: UNSURE (   7.72  )
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

SGkgVHJveSwKCk9uIDE2OjI4IEZyaSAyNiBTZXAgICAgICwgV29sZnJhbSBTYW5nIHdyb3RlOgo+
IAo+ID4gU2luY2UgcGF0Y2hlcyAx4oCTNSBoYXZlIGFscmVhZHkgYmVlbiBtZXJnZWQsCj4gPiBz
aG91bGQgSSBrZWVwIHRoZSBjdXJyZW50IHZlcnNpb24gbnVtYmVyIGFuZCBqdXN0IHNlbmQgdGhp
cyBzaW5nbGUgcGF0Y2ggPwo+IAo+IFllcywgcGxlYXNlLgo+IApJIGFncmVlLCBwbGVhc2UgZG8g
aW5jcmVhc2UgdGhlIHBhdGNoIHZlcnNpb24sIGhhdmUgYSBmb3JtYWwgY292ZXIgbGV0dGVyLApk
b2N1bWVudCB0aGUgY2hhbmdlcywgYW5kIGFkZCBvbGQgcGF0Y2ggVVJMIGxpbmsuLgoKLS0gCllp
eHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
