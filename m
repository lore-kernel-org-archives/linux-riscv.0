Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303C2CAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=juIe4m0twm/jn7QdjufFjVTjgupKPZ4u+pccXg1p8A4=; b=cHpYKbfcpZb16o
	X3bMQ1WZO9Rt2+sdENZHtx+G4Yist9m4Y9DbEVgSOqjCVKK4EJZVP5GtK5x10NbGO2bMcwkqspA7I
	1m0DwUUq6UEDF07LrNdARZmolYtz+bFiqO54tzVZIMQ8aONiJ9+mqy8MdsufBA3pU5JETWmoTm9J4
	8vkfEGuHiIaNhj/wDwhimq00qXjWS4ju813vju5VFUYPB5HtN/0dbPziBB2ymeYmnqdsluiNlOEV4
	AVCXrwErL1d0PNXTzwWAJiY6ojnIg7Df8MxDzEc8QMVFaC9fnK7XeUIz5rHfaIQK0M1JOCJCCWUB2
	6vdgNR3zyw9cA2wwFe6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVq8-000000027tv-3nVS;
	Fri, 19 Sep 2025 07:47:32 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVq6-000000027tH-1QtG
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:47:31 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id 94CB8A67BC; Fri, 19 Sep 2025 09:46:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1758268048; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=NW3nTtvE3smhxEEKe1WQsBPHCFb+QWpDSp94XLstXSEUQ+2NeQYgVbHEFDRo4HqqM
	 A0CXqvIuFvNX1yVcyLvnUauJSBJWSReWC8ksik0rs4MEjJPy2DaVu7/utAGzyHTwJm
	 yKiu1gJwxCjnN4x50Lm5OonkMVTqR287wcGW7VAkOB4kRA2p/k4y/10jT+FX44vnSW
	 pfvpUFOH9emTZSuy18el63KVN/U2l9uc8K8BG9GLxPenjMdgEjCF1rGyBtR1c7J2i5
	 Igce59vFqJtxDYoE0fruvHN4qdjwQYgS0vX6wSjETTmZLcnAN8iciqlvPiYPk+06OZ
	 TPRLyro7rPcVQ==
Received: by mail.vexro.pl for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 07:46:07 GMT
Message-ID: <20250919084500-0.1.nj.41m2h.0.0gjq476lko@vexro.pl>
Date: Fri, 19 Sep 2025 07:46:07 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_004730_520339_D673DF91 
X-CRM114-Status: UNSURE (   0.65  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkFkYW0gRHJ6
ZXdpZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
