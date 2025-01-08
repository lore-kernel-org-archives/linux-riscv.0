Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30CEE77188
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KnzP80hT3sjJP8K0/NnSpak3NNr20HKBKHKGQY8LHK0=; b=ox1OrZptWyGxwb
	smivDjwLQWfdeREy6/C+ydMKolSB5l2AwiG4AG3y4cZsx6pbb7HFCql1bWmSbiqgWOwtk4mWOhwOA
	x9cGjnQZVnEKnnHd8UO2SdmV4tw1lk2W7A+KEvJkt6etSCDu9N/8WjnRxYEJC+y9Shud4W05urruy
	ohFtTNf4VGJww3UV+y+z7hKTX1A0UxXjdJvyDE+PvoBfEq/gz8jPiSxvBGZOfoEqvMg9ra559uZ5a
	G3THAk/xrm1rQaYNIOiyUrWiF8UeiH3imfw9vRkKpDsyTSqn7FM6LE5KtjVMyqrCkQ68JMKxkm9fq
	+i2gemUhAJYuHEcOxEbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS2o-00000007gTx-1M3P;
	Wed, 08 Jan 2025 09:08:06 +0000
Received: from mail.ventrixio.pl ([5.249.154.219])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS28-00000007gE4-3Ouy
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 09:07:27 +0000
Received: by mail.ventrixio.pl (Postfix, from userid 1002)
	id 30BA78411F; Wed,  8 Jan 2025 10:07:18 +0100 (CET)
Received: by mail.ventrixio.pl for <linux-riscv@lists.infradead.org>; Wed,  8 Jan 2025 09:06:13 GMT
Message-ID: <20250108084500-0.1.50.642o.0.1d3vowysd3@DevelopSphere.pl>
Date: Wed,  8 Jan 2025 09:06:13 GMT
From: "Grzegorz Talecki" <grzegorz.talecki@ventrixio.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.DevelopSphere.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_010724_997120_75249B19 
X-CRM114-Status: UNSURE (   0.64  )
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

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClog
cG93YcW8YW5pZW0KR3J6ZWdvcnogVGFsZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
