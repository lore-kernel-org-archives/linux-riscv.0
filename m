Return-Path: <SRS0=j3hv=GH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87014C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 20:10:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22A7C21BE5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jan 2021 20:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22A7C21BE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/VDh6aHG7wJTIJY/gz+rWH2vrmoFYbgCU7z84V3peE4=; b=oUbdazE5O2Fr3kgmgLbynfihP
	NMhEQGIDzwNwO0Jtf+K07CjV43/73ypiunGLfyqZEJQEoqT23ocUyVkFN7gIDQUfy4LXkrJQWmMNA
	Mbg6tvW0gO0OsxBVvGVjYMG8C28Lp2pC8EX1svPCwZDaOSXoQ82EKG+ykdMVQm7PM3ikodG2qLhVF
	mru/BsgBR6Gt3c2Oiokjh6aLi6do/3EJtrxIJqsjTqiYnoTE9c+LeNKqdPF45w4pNuZnnNoHDb32v
	UhmA/LxgN2mJ8jo3nyg8r+Ve9ZiTB2zrH+DNTTkZ0vQMacYOK2qWDfT6um9svvlheUZKVdk3ypbVp
	ibrNFi85Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwWBT-0000jz-15; Mon, 04 Jan 2021 20:10:31 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwWBQ-0000jN-Ql
 for linux-riscv@lists.infradead.org; Mon, 04 Jan 2021 20:10:29 +0000
X-Originating-IP: 90.112.190.212
Received: from debian.home (lfbn-gre-1-231-212.w90-112.abo.wanadoo.fr
 [90.112.190.212]) (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 756C5E0008;
 Mon,  4 Jan 2021 20:10:25 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@lst.de>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 11/12] riscv: Explicit comment about user virtual address
 space size
Date: Mon,  4 Jan 2021 14:58:39 -0500
Message-Id: <20210104195840.1593-12-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210104195840.1593-1-alex@ghiti.fr>
References: <20210104195840.1593-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_151029_015081_037BFC17 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RGVmaW5lIHByZWNpc2VseSB0aGUgc2l6ZSBvZiB0aGUgdXNlciBhY2Nlc3NpYmxlIHZpcnR1YWwg
c3BhY2Ugc2l6ZQpmb3Igc3YzMi8zOS80OCBtbXUgdHlwZXMgYW5kIGV4cGxhaW4gd2h5IHRoZSB3
aG9sZSB2aXJ0dWFsIGFkZHJlc3MKc3BhY2UgaXMgc3BsaXQgaW50byAyIGVxdWFsIGNodW5rcyBi
ZXR3ZWVuIGtlcm5lbCBhbmQgdXNlciBzcGFjZS4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBH
aGl0aSA8YWxleEBnaGl0aS5mcj4KUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+ClJldmlld2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29n
bGUuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMTEgKysrKysr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaAppbmRleCA5NTcyMTAxNjA0OWQuLjM2MDg1OGNkYmZkZCAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTQ2NSw4ICs0NjUsMTUgQEAgc3RhdGljIGlu
bGluZSBpbnQgcHRlcF9jbGVhcl9mbHVzaF95b3VuZyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSwKICNlbmRpZgogCiAvKgotICogVGFzayBzaXplIGlzIDB4NDAwMDAwMDAwMCBmb3IgUlY2NCBv
ciAweDlmYzAwMDAwIGZvciBSVjMyLgotICogTm90ZSB0aGF0IFBHRElSX1NJWkUgbXVzdCBldmVu
bHkgZGl2aWRlIFRBU0tfU0laRS4KKyAqIFRhc2sgc2l6ZSBpczoKKyAqIC0gICAgIDB4OWZjMDAw
MDAgKH4yLjVHQikgZm9yIFJWMzIuCisgKiAtICAgMHg0MDAwMDAwMDAwICggMjU2R0IpIGZvciBS
VjY0IHVzaW5nIFNWMzkgbW11CisgKiAtIDB4ODAwMDAwMDAwMDAwICggMTI4VEIpIGZvciBSVjY0
IHVzaW5nIFNWNDggbW11CisgKgorICogTm90ZSB0aGF0IFBHRElSX1NJWkUgbXVzdCBldmVubHkg
ZGl2aWRlIFRBU0tfU0laRSBzaW5jZSAiUklTQy1WCisgKiBJbnN0cnVjdGlvbiBTZXQgTWFudWFs
IFZvbHVtZSBJSTogUHJpdmlsZWdlZCBBcmNoaXRlY3R1cmUiIHN0YXRlcyB0aGF0CisgKiAibG9h
ZCBhbmQgc3RvcmUgZWZmZWN0aXZlIGFkZHJlc3Nlcywgd2hpY2ggYXJlIDY0Yml0cywgbXVzdCBo
YXZlIGJpdHMKKyAqIDYz4oCTNDggYWxsIGVxdWFsIHRvIGJpdCA0Nywgb3IgZWxzZSBhIHBhZ2Ut
ZmF1bHQgZXhjZXB0aW9uIHdpbGwgb2NjdXIuIgogICovCiAjaWZkZWYgQ09ORklHXzY0QklUCiAj
ZGVmaW5lIFRBU0tfU0laRQkoUEdESVJfU0laRSAqIFBUUlNfUEVSX1BHRCAvIDIpCi0tIAoyLjIw
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
