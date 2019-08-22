Return-Path: <SRS0=8Mks=WS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03ACC3A59D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 08:11:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7641620870
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 08:11:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OVx8F1oG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7641620870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LjKMqqb/fhf9m5cWVrVhs4WJauKBZjQqMoVVFSlh/s=; b=OVx8F1oGkqDFE8
	eqQrKpLQ2+xyAoKDrSM3NzmHvJy+C00zrIbIFIFcruVMPaxgjkOTz3VBEE3+ET7YCilgOwRH8fzNC
	a1NHfWX1Y77V3roLmsBaEX0j7ywAZZv+ODTZ5K5wycqelpTwruKQ+htiQghD5CmmKhc0s5JAgxXrc
	s1IgRyLjComCWuubU3zZpFnY38dc5kBVjjqxorUk6eLU2KALQ9mPDM6Ks3fXQv+TlCUiZ8CkjLf9B
	5m0lYYYBelxw9C6Yb30dCOVGzdXRrX1WO+ZhBXDIj0soPPi+RI3Y39IUuWCj33Lyyk9Kq42t1H113
	/TY/filrkfl+fIBM2dog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0iCM-0005C8-8G; Thu, 22 Aug 2019 08:11:58 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0iCK-0005Bo-BN
 for linux-riscv@lists.infradead.org; Thu, 22 Aug 2019 08:11:57 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 999B968C4E; Thu, 22 Aug 2019 10:11:53 +0200 (CEST)
Date: Thu, 22 Aug 2019 10:11:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v4 3/3] RISC-V: Issue a tlb page flush if possible
Message-ID: <20190822081153.GC17573@lst.de>
References: <20190822075151.24838-1-atish.patra@wdc.com>
 <20190822075151.24838-4-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822075151.24838-4-atish.patra@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_011156_538152_ECF0055E 
X-CRM114-Status: UNSURE (   6.44  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Anup Patel <Anup.Patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMTI6NTE6NTFBTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3Jv
dGU6Cj4gSWYgdGxiZmx1c2ggcmVxdWVzdCBpcyBmb3IgcGFnZSBvbmx5LCB0aGVyZSBpcyBubyBu
ZWVkIHRvIGRvIGEKPiBjb21wbGV0ZSBsb2NhbCB0bGIgc2hvb3Rkb3duLgo+IAo+IEp1c3QgZG8g
YSBsb2NhbCB0bGIgZmx1c2ggZm9yIHRoZSBnaXZlbiBhZGRyZXNzLgoKTG9va3MgZ29vZCwgYWx0
aG91Z2ggSSBzdXNwZWN0IGluIG1hbnkgY2FzZXMgZXZlbiBkb2luZyBtdWx0aXBsZQpzaW5nbGUt
cGFnZSBzZmVuY2Uudm1hIGNhbGxzIG1pZ2h0IGJlIGNoZWFwZXIgdGhhbiB0aGUgZ2xvYmFsIG9u
ZS4KCkJ1dCBJIHRoaW5rIHRoYXQgaXMgd29ydGggYSDRlWVwYXJhdGUgZGlzY3Vzc2lvbiwgcHJl
ZmVyYWJseSB3aXRoIGFjdHVhbApudW1iZXJzLgoKUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxs
d2lnIDxoY2hAbHN0LmRlPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
