Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D3AC5B56A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 08:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rF5KxKaxRPbxQUrkMfuI7Ji9Ih9sH843HfTdhfMftqc=; b=kgKXEjiOeUgs3t
	230ArmSjV7Ehff0JAl5hwd+gVc8AyoVUMDEBZvbLpu5y/Ozff8cMIAtkowgb03Pr3KQPUiFq6nrMq
	UtS6Q6ijWhkkmUTPceitkmirw1GdK/1wRpZlJ1GsaLQ8YSa45Tx8chmrzlJBkRYxsNyPfApsde46L
	tNJ528FMWqVJG6kVi7VNNdl/Kw/W4Ou4zK8iK5G6iF2/ocJ5z0QnPF5OIbsk9/PTir3l76KNor1uw
	xhEVPZbgQE+DVAzjdvBnplUXirTC3w1KPcADEwABmmzlS1rgtBpWipAqXzx5JVED6AQ3iOLYcOaW2
	scuBUWwAv1ePg5VjotzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu46N-0000000Fd5g-0Ne9;
	Wed, 12 Aug 2026 08:14:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu46K-0000000Fd53-32YX
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 08:14:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9686761878;
	Wed, 12 Aug 2026 08:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFCF1F000E9;
	Wed, 12 Aug 2026 08:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786522455;
	bh=CfRowpTKWivqNOVD0wmF3ZNKzhjEZpNIgeQTNYVCSLs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n4H4xvsbIqPb+e35D6mMMVzNZkzuE1LgSmtDq+xcLOgbUu6Mp2iZkRx0jRcQckcqu
	 pEk79ElOzV0MnLBbgqG76IIAIB2ulx3RRqc2zAvIxWuNuxpRH+g5xHyN+jYrCHKJIU
	 qE66rv2o+kcLqcT8UIAD6Mmsjun2+twXamDLlOPwtzcPnNAcQtk9ULMo2Feb2RiJi5
	 G4cisuXsT1VfXBjj29VBD2vGPQuMV+nsZPsxtdjmp0KHAq57iiGiPQP/NRvQBu0CZT
	 Axjl0XLxTC+M0FTTT33SHJMwzSHy3pIdPVD9/vuWRPIlb4/wO0e2vt24q4UBoS99GI
	 okI5fRp2ToOYw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Min Lin <linmin@eswincomputing.com>, 
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Darshan Prajapati <darshan.prajapati@einfochips.com>, 
 Pritesh Patel <pritesh.patel@einfochips.com>
In-Reply-To: <20260804104431.1391839-5-pinkesh.vaghela@einfochips.com>
References: <20260804104431.1391839-5-pinkesh.vaghela@einfochips.com>
Subject: Re: (subset) [PATCH v3 4/8] dt-bindings: mfd: syscon: add ESWIN
 EIC7700 compatible
Message-Id: <178652245137.1296549.3383858473929288179.b4-ty@b4>
Date: Wed, 12 Aug 2026 09:14:11 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev-ad80c
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

T24gVHVlLCAwNCBBdWcgMjAyNiAxNjoxNDoyNyArMDUzMCwgUGlua2VzaCBWYWdoZWxhIHdyb3Rl
Ogo+IERvY3VtZW50IEVTV0lOIEVJQzc3MDAgU29DIGNvbXBhdGlibGUgZm9yIHN5c2NvbiByZWdp
c3RlcnMuCgpBcHBsaWVkLCB0aGFua3MhCgpbNC84XSBkdC1iaW5kaW5nczogbWZkOiBzeXNjb246
IGFkZCBFU1dJTiBFSUM3NzAwIGNvbXBhdGlibGUKICAgICAgY29tbWl0OiBkODZkYWRjNmZlZWFh
ODZiNmEyOWRiNTUwOWJmZThjNjViNjZjN2IyCgotLQpMZWUgSm9uZXMgW+adjueQvOaWr10KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
