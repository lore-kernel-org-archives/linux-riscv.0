Return-Path: <SRS0=e4j4=YK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13812FA372A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2019 16:20:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA61C21A49
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2019 16:20:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DGd/6VE6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA61C21A49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cl15YLgIBqTGmW6Wci3OmaCWibvsOO4pXN5cokoJ59c=; b=DGd/6VE6qFsgQ1
	GD77Nw0YL/xtwxgES82JrvJp6/elzRdwcY2zFO24HZrOfSSsPtZ1bB1Xdj5rrNsBaO335XZsU0FMJ
	UfobMidL0eYY/yr9/s846XFnC5t4kNPR9YVMqNdwL6XdvWxx2gOvZw1IYVDlQ+D5k33mkisem8aB3
	bmARbwqcTgLGx9QaG0MNn7pb+kqaG3uavAoDyeym6j9GS7vl0SyDsKNOmZrgFAxsDvYHcnNvCU0Qy
	Ls8mEo87UldwK0vKE6mpZRRNz14rJ9tZywWSy+BjAU79iH8ZX2HvU5T9a59MQFE268S6gGie7CNmu
	6avxDOcp/S8x0UqJmeqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL8WG-0004xa-Ka; Thu, 17 Oct 2019 16:20:56 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL8WE-0004ww-JH
 for linux-riscv@lists.infradead.org; Thu, 17 Oct 2019 16:20:55 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 34EB768BE1; Thu, 17 Oct 2019 18:20:52 +0200 (CEST)
Date: Thu, 17 Oct 2019 18:20:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 08/20] riscv: abstract out CSR names for supervisor vs
 machine mode
Message-ID: <20191017162052.GA10221@lst.de>
References: <20190903093239.21278-1-hch@lst.de>
 <20190903093239.21278-9-hch@lst.de>
 <alpine.DEB.2.21.9999.1910151902060.12675@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1910151902060.12675@viisi.sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_092054_787685_BAFE04FB 
X-CRM114-Status: UNSURE (   7.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgMDc6MDc6MTdQTSAtMDcwMCwgUGF1bCBXYWxtc2xleSB3
cm90ZToKPiA+ICB2b2lkIHN0YXJ0X3RocmVhZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWdu
ZWQgbG9uZyBwYywKPiA+ICAJdW5zaWduZWQgbG9uZyBzcCkKPiA+ICB7Cj4gPiAtCXJlZ3MtPnNz
dGF0dXMgPSBTUl9TUElFOwo+ID4gKwlyZWdzLT54c3RhdHVzID0gU1JfU1BJRTsKPiAKPiBMb29r
cyBsaWtlIHRoaXMgc2hvdWxkIGJlICJyZWdzLT54c3RhdHVzID0gU1JfUElFOyIKPiAKPiBXaWxs
IHVwZGF0ZSBpdCBoZXJlLiAgTGV0IG1lIGtub3cgaWYgeW91IGRvbid0IGFncmVlIC0KCnRoZXJl
IGlzIG5vIFNSX1BJRSwgZG8geW91IG1lYW4gU1JfWFDQhkU/ICBHb29kIGNhdGNoIGluIHRoYXQg
Y2FzZSwKYnV0IHBsZWFzZSBsZXQgbWUgcmVzZW5kIHRoZSB3aG9sZSB0aGluZy4gIEkgaGF2ZSBz
b21lIG1pbm9yIHVwZGF0ZXMsCmFuZCBJJ2QgYWxzbyBsaWtlIHRvIGRvIHRoZSByZWJhc2UgbXlz
ZWxmLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
