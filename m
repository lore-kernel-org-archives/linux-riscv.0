Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C33D3B7F6
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q7m/iMXIDD6o/1cDsrt+Y2gCBnSL4so5ZfOsE0J2Yl4=; b=L4EfkTSTPgawlH
	flrJX3tBLW0wnnoYfq3cSP3rIbLAPOZbTtNEJjBdipl3KKSCDNdP906j6wLc6FFBQWAaXyv3WDhuI
	uap+f1D/IJw++GBvN69ulwi5J6QjbFetAExN7qBgUpIx+tqxR5YYepKIAWtWiYqmYuSD+qgt7LKNA
	buWDzGQAsR4rc6BaIky0JRsesrp276VIFuQvEL1mOgZ4zztQd2VhU3HmTxPL7IeHV88Z1RQXnp5w/
	vZAeVvcskuMzgqLWpZBTiLZeAIcUOR3wtQOZmqHubwrAUFHk/fVq7RR/p4k8hU2j6v1cw5ajz3TrV
	Ba7gee1LTdBS2ogkBm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVA0-00000007VyU-0cFV;
	Mon, 25 Nov 2024 09:13:36 +0000
Received: from mail.sharpwise.pl ([5.249.155.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV95-00000007Vrk-02s2
	for linux-riscv@lists.infradead.org;
	Mon, 25 Nov 2024 09:12:40 +0000
Received: by mail.sharpwise.pl (Postfix, from userid 1002)
	id E5A5484245; Mon, 25 Nov 2024 10:11:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sharpwise.pl; s=mail;
	t=1732525930; bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=;
	h=Date:From:To:Subject:From;
	b=qdNCu2tlp85btDDXAn30e3VgLzqmGZxNaVqGCb5nQDWA4Vrt1+Wm8niu6SMHexb43
	 eLVtxFQyA1m0W4J82sO1zHyA3V9AuCDY3aMTnZzcPKlGj1CiRjPJ/2OuWHFAMRs6pt
	 jO8KQi0w1YQ2L4RmNbz+4//T3qnG3RgAHjAv4ER6JDCuj3CYcefV+BccLB9/UWLwuP
	 NEsVqoU1FqXPoG9oc5us4rEIVvhtrdHcn/WHBJjCebszbtLybau1TJfds85/z6sT0R
	 uDRlEQkHMp9QEzHHabIUvREC+4EfcOSQ+NCv824w2rnK+8G9j6JcT+N0ucEWrSQk7s
	 PeaNzxTFXYHdQ==
Received: by mail.sharpwise.pl for <linux-riscv@lists.infradead.org>; Mon, 25 Nov 2024 09:10:51 GMT
Message-ID: <20241125084501-0.1.82.1akrp.0.m7pyflcjaj@sharpwise.pl>
Date: Mon, 25 Nov 2024 09:10:51 GMT
From: "Patryk Wysocki" <patryk.wysocki@sharpwise.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.sharpwise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_011239_192295_F943597F 
X-CRM114-Status: UNSURE (   1.70  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8KCgpQb3pkcmF3aWFtClBhdHJ5
ayBXeXNvY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
