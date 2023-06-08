Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B516C7EE25
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/0Gf8EEkNrOWINdtpiyfHyBx3zi3q+ycMhlYKgEvLM=; b=eE7p79jXLZQDRy
	yK1Zw1lzpm23nAEnuWSw6DPws3slraKhn9p4uRTgFuUHw0DsNtTTBB+kJIQuNwgAXh+TxmToXKv4W
	uka2SLnAl6bnv3QyD79+Ts2S+qvyzbSYdOgCXjNMl9nwxRbHLGlzBwwyO7kjU5JTT8PNO4F3x6eXQ
	FkcnWvPdvKIwx8JczKDagLUtRsribwnSikFOfnAUuxdk47KOI8F38GkBEUr3SwAd3crd/Er2ENSd3
	H2Othy7tTSG8JLe4hAAOL79K7uScB8B7YdydTfQGHH61ZKjIHA+nbJV8PYcVwvUFKjmWElrIoZdxL
	bEMnuhcRXe8v5OEYQCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7JPg-00A2NS-2F;
	Thu, 08 Jun 2023 17:27:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7JPd-00A2MU-2l;
	Thu, 08 Jun 2023 17:27:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6D65564FDE;
	Thu,  8 Jun 2023 17:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C4CC4339C;
	Thu,  8 Jun 2023 17:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686245224;
	bh=nOqZblan5c5tTtOJCM+nEcD7kzkArHJjMVIRKk2SO90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tLrmcXZzHFoldfmbo/NvgkBX1vpwL6vrcwjMTfcwyd/e0RqBFqn48AVPRv9gAp1am
	 owwWRYtL/c5YdjLWEGRC5DnGA9xLEQk1/h4NPKMj0RNQdU4IKpVtAMbppcPU2JNbkx
	 aDGt4cAYAlaRFb0NNNmmGOTxrXYPJzD0oRxaEag+TJkSjwERtdm9VKJXp8as47G9g3
	 JUHm9urC/uLmwrO65WGgicbLPIQBxzcbzleW1+oy6B5qpqlskdKNoj5c/7ozP//4X9
	 T+Kpez3QOgiYrANvmOMs9PLZCrhNvEKNDjXx3k9FDlUA4goT3wuwQUcoXx2Paz6T5a
	 r+UG4KAfONcVA==
Date: Thu, 8 Jun 2023 18:26:58 +0100
From: Will Deacon <will@kernel.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: catalin.marinas@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, chris@zankel.net, jcmvbkbc@gmail.com,
	steven.price@arm.com, vincenzo.frascino@arm.com, pcc@google.com,
	wangxiang@cdjrlc.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, jeeheng.sia@starfivetech.com,
	leyfoon.tan@starfivetech.com, linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] arm64: hibernate: remove WARN_ON in
 save_processor_state
Message-ID: <20230608172656.GB1606@willie-the-truck>
References: <20230525025555.24104-1-songshuaishuai@tinylab.org>
 <20230525025555.24104-3-songshuaishuai@tinylab.org>
 <20230605142857.GE21212@willie-the-truck>
 <A8B3B45A0174F0B8+98d9d1e1-fe9f-9173-e5a7-b31113da861a@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A8B3B45A0174F0B8+98d9d1e1-fe9f-9173-e5a7-b31113da861a@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_102705_937590_408C4F52 
X-CRM114-Status: GOOD (  18.94  )
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

T24gV2VkLCBKdW4gMDcsIDIwMjMgYXQgMTE6MDA6MDhBTSArMDgwMCwgU29uZyBTaHVhaSB3cm90
ZToKPiAKPiAKPiDlnKggMjAyMy82LzUgMjI6MjgsIFdpbGwgRGVhY29uIOWGmemBkzoKPiA+IE9u
IFRodSwgTWF5IDI1LCAyMDIzIGF0IDEwOjU1OjUzQU0gKzA4MDAsIFNvbmcgU2h1YWkgd3JvdGU6
Cj4gPiA+IER1cmluZyBoaWJlcm5hdGlvbiBvciByZXN0b3JhdGlvbiwgZnJlZXplX3NlY29uZGFy
eV9jcHVzCj4gPiA+IGNoZWNrcyBudW1fb25saW5lX2NwdXMgdmlhIEJVR19PTiwgYW5kIHRoZSBz
dWJzZXF1ZW50Cj4gPiA+IHNhdmVfcHJvY2Vzc29yX3N0YXRlIGFsc28gZG9lcyB0aGUgY2hlY2tp
bmcgd2l0aCBXQVJOX09OLgo+ID4gPiAKPiA+ID4gU28gcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBj
aGVja2luZyBpbiBzYXZlX3Byb2Nlc3Nvcl9zdGF0ZS4KPiA+IAo+ID4gVGhpcyBpcyBhIHZlcnkg
dGVyc2Ugc3VtbWFyeSBvZiB3aHkgdGhpcyBpcyBzYWZlLgo+ID4gCj4gPiBMb29raW5nIGF0IHRo
ZSBjb2RlLCBmcmVlemVfc2Vjb25kYXJ5X2NwdXMoKSBkb2VzIGluZGVlZCBjaGVjawo+ID4gbnVt
X29ubGluZV9jcHVzKCksIG9yIGl0IHJldHVybnMgYW4gZXJyb3Igd2hpY2ggdGhlbiBjYXVzZXMg
dGhlIGhpYmVybmF0aW9uCj4gPiB0byBmYWlsLiBIb3dldmVyLCB0aGlzIGlzIGFsbCBpbiB0aGUg
Q09ORklHX1BNX1NMRUVQX1NNUD15IGNhc2UgYW5kIGl0J3MKPiA+IGZhciBsZXNzIGNsZWFyIHdo
ZXRoZXIgeW91ciBhc3NlcnRpb24gaXMgdHJ1ZSBpZiB0aGF0IG9wdGlvbiBpcyBkaXNhYmxlZC4K
PiA+IAo+ID4gUGxlYXNlIGNhbiB5b3UgZGVzY3JpYmUgeW91ciByZWFzb25pbmcgaW4gbW9yZSBk
ZXRhaWwsIGFuZCBjb3ZlciB0aGUgY2FzZQo+ID4gd2hlcmUgQ09ORklHX1BNX1NMRUVQX1NNUD1u
IGFzIHdlbGwsIHBsZWFzZT8KPiAKPiBXaXRoIEhJQkVSTkFUSU9OIGVuYWJsZWQsIHRoZSBzb2xl
IHBvc3NpYmxlIGNvbmRpdGlvbiB0byBkaXNhYmxlCj4gQ09ORklHX1BNX1NMRUVQX1NNUAo+IGlz
ICFTTVAgd2hlcmUgbnVtX29ubGluZV9jcHVzIGlzIGFsd2F5cyAxLiBXZSBhbHNvIGRvbid0IGhh
dmUgdG8gY2hlY2sgaXQgaW4KPiBzYXZlX3Byb2Nlc3Nvcl9zdGF0ZS4KClRoYW5rcy4gUGxlYXNl
IGFkZCB0aGF0IHRvIHRoZSBjb21taXQgbWVzc2FnZS4KCldpbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
