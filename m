Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB7EC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 10:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:References:In-Reply-To:Date:
	Subject:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prPoZ7sAgKoVKP2h4i16mzkaBm36J9FN20AaIzpb83U=; b=WaN2UUDr7xkURs
	fSTAhulDlguAvACwhjX8EbroeGFsf/FLmaG196wfZr2czjgShvqr30MLcUaHosyvGJQO50L/WBzC2
	4LrRol10/r9R/WTw3PUESWyb6CEO30LT4AqAndaEnxAgoOLMzkIGCakzdyw4OflQzRggUFd/wpqqM
	Ou8kfRO5RCJw8qLFZ+L7dpLD7hF5BisrNPjHWvn1F1sOCI980Hq50QPTCORuiNNw61IA11D4rPyTr
	niTsQYpe73+zxRifmZUPhD6dfn2t4tHEaYIM1wDkCXnpcor95tTwi7krlidw/Igz+9rcYO/DRyBuI
	oN8p3LDGyTtbUPClZzEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesSx-00000001Lbu-37WQ;
	Wed, 01 Jul 2026 10:46:51 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesSu-00000001LaD-31qQ
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 10:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:Date:
	Message-Id; bh=dpKSes/MK+OIbLuGPX1GTJdUuqtbyV+HdTKxxn1yTzs=; b=N
	sAJFw0bEuM2L2LPfPfT7O+cxjv87SphQblwTu8zhJWTePIhL/526KhXxZaJr3UUa
	Hid8VZQHH8QEETm/hycx1RSX0EvhA5lregVPFSjpJ9qN6PjfjhszZw3ipPYfz+yH
	fp8UX09ZKpxPdYx4pTB5tR+Fo6/ErWn+1qIRyWekpg=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wCnCsMH8ERqjJ1uGA--.129S2;
	Wed, 01 Jul 2026 18:46:33 +0800 (CST)
MIME-Version: 1.0
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Xiaofeng Yuan <xiaofengmian@163.com>
Subject: Re: [PATCH] riscv: kprobes: Add test case for c.jal instruction
 simulation
Date: Wed, 01 Jul 2026 10:46:31 +0000
In-Reply-To: <20260627115051.3235783-1-namcao@linutronix.de>
References: <20260627115051.3235783-1-namcao@linutronix.de>
X-CM-TRANSID: _____wCnCsMH8ERqjJ1uGA--.129S2
Message-Id: <6A44F009.1BDCEE.00001@m16.mail.163.com>
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUUR6wUUUUU
X-Originating-IP: [39.144.122.37]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDAQnp7GpE8AlRaQAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_034649_219477_E1C173F7 
X-CRM114-Status: UNSURE (   5.86  )
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

SGkgTmFtLAoKVGhhbmtzIGFnYWluIGZvciB0aGUgdGVzdCBjYXNlIOKAlCBpdCBoYXMgYmVlbiBp
bmNsdWRlZCBpbiB0aGUgdjYgYy5qYWwKc2VyaWVzLCBjcmVkaXRlZCB0byB5b3UuCgpSZWdhcmRp
bmcgdGhlIFFFTVUgaGFuZyBJIGFza2VkIHlvdSBhYm91dCBlYXJsaWVyOiBJIGZvdW5kIHRoZSBy
b290CmNhdXNlLiAgVGhlIGhhbmcgd2FzIG5vdCBhIFFFTVUgaXNzdWUg4oCUIGl0IHdhcyBjYXVz
ZWQgYnkKRVhFQ01FTV9LUFJPQkVTIGFsbG9jYXRpbmcgcmVhZC1vbmx5IHBhZ2VzIHdpdGhvdXQg
d3JpdGFibGUKcGVybWlzc2lvbnMgd2hlbiBDT05GSUdfU1RSSUNUX01PRFVMRV9SV1ggaXMgbm90
IGVuYWJsZWQgKGFzIGhhcHBlbnMKd2l0aCBhbiBhbGxub2NvbmZpZy1kZXJpdmVkIGNvbmZpZyku
ICBUaGlzIGFmZmVjdHMgYm90aCBSVjMyIGFuZCBSVjY0LgoKSSBoYXZlIHN1Ym1pdHRlZCBhIHNl
cGFyYXRlIGZpeCBzZXJpZXMgdGl0bGVkICJyaXNjdjogZml4IGtwcm9iZXMgb24KbWluaW1hbCBr
ZXJuZWwgY29uZmlncyIgdG8gYWRkcmVzcyB0aGlzLgoKQmVzdCByZWdhcmRzLApYaWFvZmVuZwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
