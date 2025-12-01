Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6986D116F1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 13:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t22VFIYOH0WU+gNr9r7c9g43la2nWn1+ve4iVx2Yo/Y=; b=gr6R5J9d/rZiQE
	8nXICAlCwlWgSY1q5x5X9RILA+TosCM95Z1iB1XMCSRGTP4zLudNPkPqjQTwDd6jNbqjr2+58IYOX
	Av6etAXrTeNjnJdEniiPuSWgLWQi5hBp3FrU4vxIcpLOC/kTPn29tmySbqI0c79QlEDwXeGJZDuB4
	y/6/7HF9QAo00i8wgrCqihkTd7lN7SNYry+G3a8GgAkgEzgQjOr0i05PO/uC+d0Z4Hdz7A0gZRwDw
	ONo0MkRyCURNFojn6B3KzEKAkjFGJCWj6dCxajCJPfRwdySxqgTT9ELQPnkbD/pRdvHr9itnyzskR
	tIqfaWd77VE19n7wi3HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ417-00000003zB0-0dOI;
	Mon, 01 Dec 2025 13:32:37 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3eY-00000003hes-2orP;
	Mon, 01 Dec 2025 13:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=zg2mBZ9w8LQ344DKjJnn30Gx+/5hAbRUGgtojX6y6sg=;
	b=LmEAuJIAIde6QXYHQ81OHgJz/63qNbztwo7RKc9HSU2kL+6HQUmsIwmwTzY61b
	24JKl6HgbWpx+FHYgqa1uOXnjRjezS2c/iu7CqODxB3RUNKIQPe7mFVaHkM4W2OW
	RCQMMEfJL2NStEMEqXO59/rG6HG9VW+iDV9WWWRP4ck+A=
Received: from emily-VMware-Virtual-Platform.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBHrZAvky1pnbQPDw--.3674S2;
	Mon, 01 Dec 2025 21:08:01 +0800 (CST)
From: huyuye <huyuye812@163.com>
To: sunilvl@ventanamicro.com
Cc: ajones@ventanamicro.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atishp@rivosinc.com,
	bhelgaas@google.com,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	dfustini@tenstorrent.com,
	haibo1.xu@intel.com,
	lenb@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	rafael@kernel.org,
	robert.moore@intel.com,
	samuel.holland@sifive.com,
	tglx@linutronix.de,
	will@kernel.org,
	dai.hualiang@zte.com.cn,
	deng.weixian@zte.com.cn,
	guo.chang2@zte.com.cn,
	liu.qingtao2@zte.com.cn,
	wu.jiabao@zte.com.cn,
	lin.yongchun@zte.com.cn,
	hu.yuye@zte.com.cn,
	zhang.longxiang@zte.com.cn,
	huyuye <huyuye812@163.com>
Subject: Re:[PATCH v7 08/17] ACPI: pci_link: Clear the dependencies after probe
Date: Mon,  1 Dec 2025 21:07:55 +0800
Message-ID: <20251201130757.7032-1-huyuye812@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-9-sunilvl@ventanamicro.com>
References: <20240729142241.733357-9-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wBHrZAvky1pnbQPDw--.3674S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyUZF13Kw4xAry7Cw48WFg_yoWxZFbEgr
	n5AFyDZw4ftw17Gry3WF97JFW3K3y29r9xGa4xXrZ7Gw4fAa1DCan7Cr12vr15GF4xGr4a
	kr15uw47GwsI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjVOptUUUUU==
X-Originating-IP: [111.30.199.151]
X-CM-SenderInfo: 5kx135bhyrjqqrwthudrp/xtbBzwgXCGktkDVHogAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_050919_101735_F1E04901 
X-CRM114-Status: UNSURE (   5.77  )
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

SGksIHN1bmlsdmwKCkJhc2VkIG9uIHRoZSBhYm92ZSBwYXRjaCwgSSB1bmRlcnN0YW5kIHRoYXQg
eW91IHByZXZpb3VzbHkgcmVzb2x2ZWQgZGVwZW5kZW5jaWVzIGJldHdlZW4gTGluayBkZXZpY2Vz
IGFuZCBQQ0kgSG9zdCBCcmlkZ2VzIGJ5IGNhbGxpbmcgYWNwaV9kZXZfY2xlYXJfZGVwZW5kZW5j
aWVzKGRldmljZSkuIEkgd291bGQgbGlrZSB0byBhc2s6IG9uIFJJU0PigJFWIHBsYXRmb3Jtcywg
aWYgd2UgbmVlZCB0byBtYW5hZ2UgZGVwZW5kZW5jaWVzIGJldHdlZW4gbXVsdGlwbGUgUENJIEhv
c3QgQnJpZGdlcywgY291bGQgdGhpcyBiZSBhZGRyZXNzZWQgYnkgYWRkaW5nIGEgY2FsbCB0byBh
Y3BpX2Rldl9jbGVhcl9kZXBlbmRlbmNpZXMoZGV2aWNlKSBhdCB0aGUgZW5kIG9mIHRoZSBhY3Bp
X3BjaV9yb290X2FkZCBlbnVtZXJhdGlvbiBmdW5jdGlvbj8KCkluaXRpYWxpemF0aW9uIG9yZGVy
IGRlcGVuZGVuY2llcyBjYW4gYmUgZGVmaW5lZCB2aWEgdGhlIEFDUEkgX0RFUCBtZXRob2QgaW4g
dGhlIERTRFQuIEZvciBleGFtcGxlLCBpZiBob3N0IGJyaWRnZSBCIGRlcGVuZHMgb24gaG9zdCBi
cmlkZ2UgQSwgYnJpZGdlIEIgc2hvdWxkIG5vdCBiZSBlbnVtZXJhdGVkIHVudGlsIGJyaWRnZSBB
IGlzIGZ1bGx5IGluaXRpYWxpemVkLgoKQmVzdCByZWdhcmRzLApZdXllCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
