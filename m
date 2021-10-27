Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D952C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 15:49:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08BE3610A0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 15:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08BE3610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=angband.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8Du37o+aZoLN4QQhxAsD3/Wx9DC1w/6UIfjVA1IUcM=; b=Ot8IgfWmfVAdRW
	msGEZZwDenYoD8KP9ril/0Js84ntKSj/ALp4b/wQF5+V5CXT/1AdkovBt+8pEM/4UAM/K7vjk9PVv
	7S9n3j7LfRyTkquuLWRb+klKDM/AnV6UUm8EAGyMrEikp9XyYTkEzI+gQL0vlD69iH9FTl1jCv3lG
	EzGB+CFUqMqDfpu4v38kr+Dm/1acprYtlf+s8uxXzHabffE8YKJW9F1SO3jAy9v6xyJKTJD4SiHIF
	cRrSlixJ4poR+OoLpnJ+RzvjoFzobtxDMa8PV28w8AxNIQuElntnmYvTexaoQgKU9iAmHVIbk7QRD
	Egj2TK1Fa9lzYHvS61LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mflB6-005MzZ-Gq; Wed, 27 Oct 2021 15:49:24 +0000
Received: from tartarus.angband.pl ([51.83.246.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mflB3-005Mxr-UK
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 15:49:23 +0000
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.94.2)
 (envelope-from <kilobyte@angband.pl>)
 id 1mfl6c-0073uO-76; Wed, 27 Oct 2021 17:44:46 +0200
Date: Wed, 27 Oct 2021 17:44:46 +0200
From: Adam Borowski <kilobyte@angband.pl>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: heinrich.schuchardt@canonical.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Anup Patel <Anup.Patel@wdc.com>, axboe@kernel.dk,
 sagar.kadam@sifive.com, Atish Patra <Atish.Patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: defconfig: enable DRM_NOUVEAU
Message-ID: <YXlz7oa9gQFGW0AQ@angband.pl>
References: <20211012164658.81894-1-heinrich.schuchardt@canonical.com>
 <mhng-5dc2aa26-9f1c-4764-9877-6d99569210b4@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-5dc2aa26-9f1c-4764-9877-6d99569210b4@palmerdabbelt-glaptop>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_084921_995626_830444D2 
X-CRM114-Status: GOOD (  15.88  )
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

T24gVHVlLCBPY3QgMjYsIDIwMjEgYXQgMDQ6NTc6MDhQTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gT24gVHVlLCAxMiBPY3QgMjAyMSAwOTo0Njo1OCBQRFQgKC0wNzAwKSwgaGVpbnJp
Y2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tIHdyb3RlOgo+ID4gQm90aCBSQURFT04gYW5kIE5P
VVZFQVUgZ3JhcGhpY3MgY2FyZHMgYXJlIHN1cHBvcnRlZCBvbiBSSVNDLVYuIEVuYWJsaW5nCj4g
PiB0aGUgb25lIGFuZCBub3QgdGhlIG90aGVyIGRvZXMgbm90IG1ha2Ugc2Vuc2UuCj4gPiAKPiA+
IEFzIHR5cGljYWxseSBhdCBtb3N0IG9uZSBvZiBSQURFT04sIE5PVVZFQVUsIG9yIFZJUlRJTyBH
UFUgc3VwcG9ydCB3aWxsIGJlCj4gPiBuZWVkZWQgRFJNIGRyaXZlcnMgc2hvdWxkIGJlIGNvbXBp
bGVkIGFzIG1vZHVsZXMuCj4gCj4gRG8geW91IGhhdmUgYW4gblZpZGlhIGNhcmQgdGhhdCB3b3Jr
cyBvbiByZWFsIGhhcmR3YXJlPyAgTGFzdCBJIGNoZWNrZWQgd2FzCj4gYSB3aGlsZSBhZ28sIGJ1
dCB0aGV5IHdlcmVuJ3Qgd29ya2luZyBhdCB0aGUgdGltZSAoSUlSQyBpdCB3YXMgc29tZXRoaW5n
IHRvCj4gZG8gd2l0aCBQQ0llIGFkZHJlc3NpbmcsIGJ1dCBpdCB3YXMgYSBoYXJkd2FyZSBsaW1p
dGF0aW9uIHNvIEkgZG9uJ3QKPiByZW1lbWJlciBleGFjdGx5IGhvdyBpdCBhbGwgZml0cyB0b2dl
dGhlcikuCgpOb3QgaGF2aW5nIHJlYWQgdGhlIGRvY3MgKG5vIG9uZSBkb2VzISA6cCksIEkgdG9v
ayBhIHJhbmRvbSBvbGQgY2FyZCBmcm9tCnRoZSBzaGVsZiwgcHV0IGl0IGluLCBhbmQgaXQganVz
dCB3b3JrZWQ6CgowNzowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IE5WSURJQSBDb3Jw
b3JhdGlvbiBHOTggW0dlRm9yY2UgODQwMCBHUyBSZXYuIDJdIChyZXYgYTEpCgoKTWVvdyEKLS0g
CuKigOKjtOKgvuKgu+KituKjpuKggArio77ioIHioqDioJLioIDio7/ioYEgUG9sZXhpdCBpcyBi
cmV3aW5nPyAgTGV0J3Mgc2tpcCB0aGF0IHNtZWxseSBQb2xzaGEgYW5kIHJlYWN0aXZhdGUK4qK/
4qGE4qCY4qC34qCa4qCL4qCAIHRoZSBGcmVlIENpdHkgb2YgRGFuemlnIGFuZC9vciByZWFwcGx5
IHRvIHRoZSBIYW5zYS4K4qCI4qCz4qOE4qCA4qCA4qCA4qCACgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
