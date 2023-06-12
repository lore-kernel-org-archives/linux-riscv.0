Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73139C7EE2F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 14:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ht2LeXm2rWTnYrwNdQj81nvgDUaKZ/ZQ7G8vHapkya4=; b=p4/GqVSCFjA69Y
	L1nLcCvDEsLzChwaEXwa/36kLSoptO+gX6fOpz0fWZj6mQtSWRXUhIOCSWYWSwP1aks4kVX2q0QZm
	SEKe2YQEMSD5xVDMTuP0xUrV8M8HyyI7r9wstV9XV9dqrrOIDHl2Eub8vYcoCWNXKy6d6FEKAT5JN
	x2mY08skZujDKe2PiKaHwRGOpMFfv9aQyDs1/TT1k1CD9WKd6T6HyklMwJBin7qBeQX6LDJD9lWJd
	GzoCj60CdEz5M5PaEPLdXai8URiAbjH33eBw4UQJlOYa/0MT4LojWOVD9fSbBATUm0wcQc4srXlqO
	z5GL6+g3mKdbaQRGPm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ii2-004KjF-1o;
	Mon, 12 Jun 2023 14:39:54 +0000
Received: from tulikuusama2.dnainternet.net ([83.102.40.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ihz-004Kgh-1u
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 14:39:53 +0000
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id A94C3292A1
	for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 17:39:48 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from tulikuusama2.dnainternet.net ([83.102.40.151])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id B5soQ3h4XZYJ for <linux-riscv@lists.infradead.org>;
	Mon, 12 Jun 2023 17:39:48 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 1874229A11
	for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 17:36:49 +0300 (EEST)
Received: from basile.localnet (87-92-194-88.rev.dnainternet.fi [87.92.194.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTPS id 027943FE4
	for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 17:36:42 +0300 (EEST)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next v21 20/27] riscv: hwcap: change ELF_HWCAP to a function
Date: Mon, 12 Jun 2023 17:36:32 +0300
Message-ID: <2311672.PxeS7tEIvr@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20230605-embattled-navigator-408a7b60b2ab@spud>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-21-andy.chiu@sifive.com>
 <20230605-embattled-navigator-408a7b60b2ab@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_073951_790753_9D979A13 
X-CRM114-Status: GOOD (  14.55  )
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

TGUgbWFhbmFudGFpbmEgNS4ga2Vzw6RrdXV0YSAyMDIzLCAxOS4yNC41MyBFRVNUIENvbm9yIERv
b2xleSBhIMOpY3JpdCA6Cj4gT24gTW9uLCBKdW4gMDUsIDIwMjMgYXQgMTE6MDc6MTdBTSArMDAw
MCwgQW5keSBDaGl1IHdyb3RlOgo+ID4gVXNpbmcgYSBmdW5jdGlvbiBpcyBmbGV4aWJsZSB0byBy
ZXByZXNlbnQgRUxGX0hXQ0FQLiBTbyB0aGUga2VybmVsIG1heQo+ID4gZW5jb2RlIGh3Y2FwIHJl
ZmxlY3Rpbmcgc3VwcG9ydGVkIGhhcmR3YXJlIGZlYXR1cmVzIGp1c3QgYXQgdGhlIG1vbWVudCBv
Zgo+ID4gdGhlIHN0YXJ0IG9mIGVhY2ggcHJvZ3JhbS4KPiA+IAo+ID4gVGhpcyB3aWxsIGJlIGhl
bHBmdWwgd2hlbiB3ZSBpbnRyb2R1Y2UgcHJjdGwvc3lzY3RsIGludGVyZmFjZSB0byBjb250cm9s
Cj4gPiBwZXItcHJvY2VzcyBhdmFpbGFiaWxpdHkgb2YgVmVjdG9yIGV4dGVuc2lvbiBpbiBmb2xs
b3dpbmcgcGF0Y2hlcy4KPiA+IFByb2dyYW1zIHN0YXJ0ZWQgd2l0aCBWIGRpc2FibGVkIHNob3Vs
ZCBzZWUgViBtYXNrZWQgb2ZmIGluIHRoZWlycwo+ID4gRUxGX0hXQ0FQLgo+IAo+IEZvciB0aGUg
dW5pbmZvcm1lZCwgbGlrZSBteXNlbGYsIHRoaXMgbmVlZHMgdG8gYmUgYSBmdW5jdGlvbiwgcmF0
aGVyCj4gdGhhbiBvcGVuIGNvZGluZyB0aGUgbWFza2luZyBvZiB0aGUgViBiaXQgYXQgdGhlIG9u
ZSB1c2VyIG9mIEVMRl9IV0NBUAo+IHRoaXMgc2VyaWVzIGFkZHMsIGJlY2F1c2UgdGhlIGJpbmZt
dCBzdHVmZiBuZWVkcyB0byBnZXQgdGhlIHZhbHVlIGluCj4gY3JlYXRlX2VsZl9mZHBpY190YWJs
ZXMoKSAmIGNvPwoKTm8sIHRoaXMgaXMgdG8gZGVhbCB3aXRoIGV4aXN0aW5nIHVzZXJzcGFjZSB0
aGF0IGV4cGVjdHMgdmVjdG9ycyB0byAianVzdCAKd29yayIgd2hlbiB0aGUgViBiaXQgaXMgc2V0
IChlLmcuIEZGbXBlZyA2LjApLgoKLS0gCuODrOODn+ODu+ODh+ODiy3jgq/jg7zjg6vjg6Ljg7MK
aHR0cDovL3d3dy5yZW1sYWIubmV0LwoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
