Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9115FCA0EE3
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 07:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=juIe4m0twm/jn7QdjufFjVTjgupKPZ4u+pccXg1p8A4=; b=ShHFsNsC5MR/Q6
	dYq2l6+Pav2jf6DEsMWTQPeo8iXxiNTx3+HWrwS313E/z3T2oIGjy7CBw0Fg+ld01MAACFtVXyHch
	S2WCGm6SWfqUHvqWhg6xHF29BxwxoA0WyUBqXi0ydgyS2NzACOYOl8PWgJn+3KvXW6SWziTGIHdL8
	5APeh1kfi6OseJyy7vEbcBBNCstHBE8hta+6A/M5IaaX+yYXHCYaiUl36ETlPxl6p5ZrPzU6lISMS
	qBY4mqtT2jl3dA/Ci+JRE6sZwEJuFVEFMnFP42cy+iStqXKkd8t1t+AvUaDSlJYklpFhWlojftdHG
	Y3FbgpKt6egy4UbK3PKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSlL-0000000G9dT-0oWc;
	Thu, 14 Aug 2025 07:52:39 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umScg-0000000G81B-18eY
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 07:43:43 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id 6C4B2A3A09; Thu, 14 Aug 2025 09:36:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1755156988; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=i+p0AuBX/yfIWZ6NQuV4iKH+GOmjHK36orUAvmzC9+8dYrK7lc4Wj1aXjMcr8DWmR
	 CQ1bwI3PFmHgoH1SIJoqXbnFHUgzrYKIuGmeQI2K2S+C1Qs2Q8BJ7/DpFVxfwAJcjd
	 VpyKVnnlvk23ge+NiHFvlptVtREw6w1A4VyOAUc5DZQx/94rHEzNTBDhZc+EkwUOkX
	 UL7XyrouC//TyBNDWqbHoD6egU/SETHavsc/Jn8qxV1r/wL3nUSrXIthtgd9yFn+Ip
	 usEArYMjsb69n+UAF5tW2BevxXHL6uhb6CWvzWOYy1jYezCrrGOMMahKO7TlMg5rH8
	 pgsuZnXB/QKZA==
Received: by mail.vexro.pl for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 07:36:01 GMT
Message-ID: <20250814084500-0.1.mt.3l0jp.0.rkn0re97i8@vexro.pl>
Date: Thu, 14 Aug 2025 07:36:01 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_004342_442562_6829CB90 
X-CRM114-Status: UNSURE (   0.23  )
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
