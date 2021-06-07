Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4E9C47082
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 06:19:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F546023E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 06:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52F546023E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3b8RKPbThw7C5AIKCiuA81WiuSe1qHOG+m9Lb87+cA=; b=3yeB08preKGKI/
	8UKamG7fOQ16zxzR8EETM1lUF06g8EE1OLP+2yBpdAzoVCkbb50gvApc7MZccDfC04JQE4bCf05/q
	FZrqDs3mqu03VOBMvYyi+mwyiR+PHuvmsijwDUMAKyIQnBdp2slECzXUX1LfrSzbhkpmPlD8LHeRB
	m8uL+tg3CTrDy8sC95WCn1Xn6PMnGKGJP5mEMJrKpev+8vHStck4cjSBQd2UW8te7z3GutAiaEPYn
	LQCCpoKL92GqNvSVbfPI8ygFtMy10nf39kMPtrAve9Q093iYfWFke9ZTZ1udxrPDDR0b2S6s2YzqH
	40ydIbqeqIXKkF/qNE/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq8be-001fm5-Th; Mon, 07 Jun 2021 06:19:26 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq8bc-001flE-2N
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 06:19:25 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id BD91467373; Mon,  7 Jun 2021 08:19:18 +0200 (CEST)
Date: Mon, 7 Jun 2021 08:19:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 drew@beagleboard.org, liush@allwinnertech.com, lazyparser@gmail.com,
 wefu@redhat.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>,
 Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC PATCH v2 06/11] riscv: pgtable: Add DMA_COHERENT with
 custom PTE attributes
Message-ID: <20210607061918.GA24060@lst.de>
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-10-git-send-email-guoren@kernel.org>
 <610849b6f66e8d5a9653c9f62f46c48d@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <610849b6f66e8d5a9653c9f62f46c48d@mailhost.ics.forth.gr>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_231924_280670_A29FBEFE 
X-CRM114-Status: GOOD (  12.00  )
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

T24gU3VuLCBKdW4gMDYsIDIwMjEgYXQgMDg6MjI6MTRQTSArMDMwMCwgTmljayBLb3NzaWZpZGlz
IHdyb3RlOgo+IFRoaXMgcGF0Y2ggdmlvbGF0ZXMgdGhlIFByaXZpbGVnZSBTcGVjIHNlY3Rpb24g
NC40LjEgdGhhdCBjbGVhcmx5IHN0YXRlczoKPgo+ICJCaXRzNjPigJM1NCBhcmUgcmVzZXJ2ZWQg
Zm9yIGZ1dHVyZSBzdGFuZGFyZCB1c2UgYW5kIG11c3QgYmUgemVyb2VkIGJ5IAo+IHNvZnR3YXJl
IGZvciBmb3J3YXJkIGNvbXBhdGliaWxpdHkiCj4KPiBTdGFuZGFyZCB1c2UgbWVhbnMgdGhhdCB2
YWxpZCB2YWx1ZXMgY2FuIG9ubHkgYmUgZGVmaW5lZCBieSB0aGUgUHJpdi4gU3BlYywgCj4gbm90
IGJ5IHRoZSB2ZW5kb3IgKG90aGVyd2lzZSB0aGV5J2QgYmUgbWFya2VkIGFzICJjdXN0b20gdXNl
IiBvciAicGxhdGZvcm0gCj4gdXNlIiksIGFuZCBzaW5jZSB0aGV5ICJtdXN0IiBiZSB6ZXJvZWQg
Ynkgc29mdHdhcmUgd2UgJ2xsIGJlIHZpb2xhdGluZyB0aGUgCj4gUHJpdmlsZWdlIFNwZWMgaWYg
d2UgZG8gb3RoZXJ3aXNlLgoKWWVzLCB0aGF0IGlzIHdoeSBJIHRoaW5rIGl0IGlzIGEgbm8tZ28u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
