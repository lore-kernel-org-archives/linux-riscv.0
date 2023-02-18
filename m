Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C6BC636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Feb 2023 23:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ri7MIjJ9ojIvImv6qoISQyCvziFyHhNfaD8u/EJTEk0=; b=VVki9sWFKN5D2o
	dolsQnsWmaGoU+bl2bC+uIRIn17rnLaD92BlUDsv0jEIxTyU9PQh9QUVc/Gxs7tJaN7xSMezFp6zs
	xzetN8+kqgY2uik2YE3msPn/Ia2qoWOGUCesiKWhv9diAAPjZQHRxTCAiy+vfICL1dIt2CXwhX78b
	pmppPV5uPD7q7rOCkUrXFd+fvKdQcIpeWiYpsWblAhDmblXgX6WB11I7TOuJN76XcMppumbOjjOXZ
	/EQ/j1kQsMu5RlulaEYPZXUMUaKFJQhdvPJjTSdI9fuaC4VzOLLYDuLTioqpJNYovfupnoe/ebRTy
	beA65SR1aNdOjTdFqPRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTWgn-000M6Q-G5; Sat, 18 Feb 2023 23:32:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTWgj-000M5a-E1
	for linux-riscv@lists.infradead.org; Sat, 18 Feb 2023 23:32:19 +0000
Received: from [192.168.2.109] (unknown [109.252.117.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DC4D26602097;
	Sat, 18 Feb 2023 23:32:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676763131;
	bh=yVDkAb8rgaOCrNdaY3hB3QoJUrg+SNQndQVrEq0Uk3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kCwa7btluaTiY/1x+TuHbmwWI/J65a1y2Ztuw27XhUnjfwchk6kxLYRMHJpZeSpB9
	 lxDW930sKapT9uWf3mmJJnWQ6PH7gv4UP6cKW6gOKM/dhyj30m2kshehA6CXXQQlOc
	 6bECZ0NQdvYHPsH9m5V7e8CN2e4nMWIBCb+Votb7feXDVwWzLhuDFfNOnCJkCZ/26Q
	 lFwerPXhqcTV08CmylyFe5nnp4qqHmOHoEXytIn33LP5umz6PnRO4MQZRPyAYnOZhs
	 lkbU4LsmLvYt1HGxo/m4l6tRFdozfjXhiGM0HmitZ/XBqKz7RXwDMoTmtS0TDRPp8f
	 8oYnO8wvERaVA==
Message-ID: <0a8358cd-4c2e-ed70-2cc5-1cff27b7594d@collabora.com>
Date: Sun, 19 Feb 2023 02:32:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] kernel/reboot: Use the static sys-off handler for any
 priority
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, rafael.j.wysocki@intel.com
Cc: aou@eecs.berkeley.edu, apatel@ventanamicro.com,
 Atish Patra <atishp@rivosinc.com>, geert@linux-m68k.org, heiko@sntech.de,
 kai.heng.feng@canonical.com, mcgrof@kernel.org, paulmck@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, pmladek@suse.com,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, tangmeng@uniontech.com
References: <mhng-fbf5d10c-239d-4e47-bf52-3e1255cbe5e0@palmer-ri-x1c9>
 <8bba0d3c-bf10-97df-80a5-ad98d5a417c8@sholland.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <8bba0d3c-bf10-97df-80a5-ad98d5a417c8@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_153217_704270_C768E8AD 
X-CRM114-Status: GOOD (  17.20  )
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

T24gMi8xOS8yMyAwMjoyMCwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gT24gMi8xNC8yMyAxODox
NywgUGFsbWVyIERhYmJlbHQgd3JvdGU6Ci4uLgo+PiBTb3JyeSBmb3IgYmVpbmcgc2xvdyBoZXJl
LCBJJ2QgYmVlbiBhc3N1bWluZyBzb21lb25lIHdvdWxkIEFjayB0aGlzIGJ1dAo+PiBpdCBsb29r
cyBsaWtlIG1heWJlIHRoZXJlJ3Mgbm9ib2R5IGluIHRoZSBtYWludGFpbmVycyBmaWxlIGZvcgo+
PiBrZXJuZWwvcmVib290LmM/wqAgSSdtIGZpbmUgdGFraW5nIHRoaXMgdmlhIHRoZSBSSVNDLVYg
dHJlZSBpZiB0aGF0J3MgT0sKPj4gd2l0aCBwZW9wbGUsIGJ1dCB0aGUgY292ZXIgbGV0dGVyIHN1
Z2dlc3RzIHRoZSBwYXRjaCBpcyBuZWNlc3NhcnkgZm9yCj4+IG11bHRpcGxlIHBhdGNoIHNldHMu
Cj4gCj4gU2VlIGFsc28gRG1pdHJ5J3MgcmVwbHlbMF0gdG8gdGhlIFBTQ0kgdGhyZWFkLiAoTWF5
YmUgSSBzaG91bGQgaGF2ZSBzZW50Cj4gYm90aCBjb252ZXJzaW9ucyBhcyBvbmUgc2VyaWVzPykK
PiAKPiBJIGFtIGhhcHB5IHdpdGggdGhlIHBhdGNoZXMgZ29pbmcgdGhyb3VnaCBhbnkgdHJlZS4g
VGhlIGtlcm5lbC9yZWJvb3QuYwo+IHBhdGNoIGlzIGV4YWN0bHkgdGhlIHNhbWUgYmV0d2VlbiB0
aGUgdHdvIHNlcmllcywgc28gaXQgc2hvdWxkIG5vdCBodXJ0Cj4gaWYgaXQgZ2V0cyBtZXJnZWQg
dHdpY2UuIFRob3VnaCBpZiB5b3UgdGFrZSB0aGlzIHNlcmllcyB0aHJvdWdoIHRoZQo+IFJJU0Mt
ViB0cmVlLCBtYXliZSB5b3Ugd2FudCB0byBjcmVhdGUgYSB0YWcgZm9yIGl0Pwo+IAo+IEkgYW0g
bm90IHN1cmUgZXhhY3RseSB3aGF0IG5lZWRzIHRvIGJlIGRvbmUgaGVyZTsgSSBhbSBoYXBweSB0
byBkbwo+IGFueXRoaW5nIHRoYXQgd291bGQgYXNzaXN0IGdldHRpbmcgYm90aCBzZXJpZXMgbWVy
Z2VkIGZvciB2Ni4zLCB0byBhdm9pZAo+IGEgcmVncmVzc2lvbiB3aXRoIGF4cDIweFsxXS4KPiAK
PiBSZWdhcmRzLAo+IFNhbXVlbAo+IAo+IFswXToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzBhMTgwODQ5LWJhMWItMmE4Mi1hYjA2LWVkMWI4MTU1ZDVjYUBjb2xsYWJvcmEuY29tLwo+
IFsxXToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL2UzOGQyOWY1LWNkM2MtNGEyYi1i
MzU1LTJiY2ZhZDAwYTI0YkBzaG9sbGFuZC5vcmcvCgpUaGUgcmVib290LmMgY2hhbmdlcyBzaG91
bGQgYmUgYWNrZWQvYXBwbGllZCBieSBSYWZhZWwuCkkgbm90aWNlZCB0aGF0IHlvdSBoYXZlbid0
IENDJ2QgdGhlIGxpbnV4LXBtIE1MLCBtYXliZSB0aGF0J3Mgd2h5IGl0Cmhhc24ndCBnb3QgdGhl
IGF0dGVudGlvbi4KCi0tIApCZXN0IHJlZ2FyZHMsCkRtaXRyeQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
