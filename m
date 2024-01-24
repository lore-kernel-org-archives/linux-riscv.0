Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5369C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 12:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wlO+tUuJq8UkI+pMTvXjD7yNCbFWugDNTlpdqhavMBA=; b=XjGyjlcdNA2dY1
	kzOQfxOILPrzejKrf9Vp0PiO/btiZydTA2BrrFHmgpWv15KUXQB9MC8zGJ5Urh6M5WA1+Xw0pjg/h
	D3DoxI9tQOKMTh8G8SSiUnQiVLrpGeOJooE+37LRD2P7yqIFmUDMgSWgGpOeB57MdjHNvPf1ZCSWv
	3ljb0cg4ZqBz3+JnCN3+LWwO8Gznxk9SiigC/BfgAoPIK8ZqQNc+jbFInxKW7DnqMBWe5dc6xUEDt
	bN8nPwaXSQz+izdVTtjWyT+4u1kaWZEv2+QCrErSZrSnv/NtKHRRqKQUK2RStK779sIzIStOvCZzP
	I2ovi9ntZjdLOXGDmxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSche-003LPc-31;
	Wed, 24 Jan 2024 12:50:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSchb-003LOb-32
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 12:50:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 623D6CE2D9D;
	Wed, 24 Jan 2024 12:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4086CC43399;
	Wed, 24 Jan 2024 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706100594;
	bh=CaC190ioRAJx6UTsAkbO9nsrMbRdFg40jhaO3cN77kM=;
	h=From:To:Cc:Subject:Date:From;
	b=ibWsyqB+erU4RSF24jjw1C6qoMueVhtfU2aXfmsMl2sPhT5TXjRYS49aui/QeAodC
	 AGyUWXWV7bJvS8NET1YMENjcNHdK389PzYErByoMnAVhE2+Qi5U2sTaaAWhEJf6yxw
	 YTxydscV12T4X5A8BNCAj6y4/BF8VLXEf03foJEKSMxII3KcAEOi++Fx1EK2TMdcAR
	 QejhPuNTsWTfPNUbBgwcO8DMSxRbCzel7pM/mQg+OYQevsG4ng/epmnIRBjN+ooEvp
	 OgyhwFV/GLvs6sQFk9mQVl4hZz4cBGlkJF4NiadedDBGio+vf6T1yg2fUSFqQpEsxs
	 lCOeiKkDbEoFQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: qemu-devel@nongnu.org, "Daniel Henrique Barboza"
 <dbarboza@ventanamicro.com>, =?utf-8?Q?Christoph_M=C3=BCllner?=
 <christoph.muellner@vrull.eu>
Cc: linux-riscv@lists.infradead.org, "LIU Zhiwei"
 <zhiwei_liu@linux.alibaba.com>, "Andrew Jones" <ajones@ventanamicro.com>,
 "Alistair Francis" <alistair.francis@wdc.com>
Subject: qemu riscv, thead c906, Linux boot regression
Date: Wed, 24 Jan 2024 13:49:51 +0100
Message-ID: <874jf2rj4g.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_045000_173086_C8C8AF4A 
X-CRM114-Status: UNSURE (   5.70  )
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

SGkhCgpJIGJ1bXBlZCB0aGUgUklTQy1WIExpbnV4IGtlcm5lbCBDSSB0byB1c2UgcWVtdSA4LjIu
MCwgYW5kIHJlYWxpemVkIHRoYXQKdGhlYWQgYzkwNiBkaWRuJ3QgYm9vdCBhbnltb3JlLiBCaXNl
Y3Rpb24gcG9pbnRzIHRvIGNvbW1pdCBkNmE0MjdlMmMwYjIKKCJ0YXJnZXQvcmlzY3YvY3B1LmM6
IHJlc3RyaWN0ICdtYXJjaGlkJyB2YWx1ZSIpCgpSZXZlcnRpbmcgdGhhdCBjb21taXQsIG9yIHRo
ZSBoYWNrIGJlbG93IHNvbHZlcyB0aGUgYm9vdCBpc3N1ZToKCi0tODwtLQpkaWZmIC0tZ2l0IGEv
dGFyZ2V0L3Jpc2N2L2NwdS5jIGIvdGFyZ2V0L3Jpc2N2L2NwdS5jCmluZGV4IDhjYmZjN2U3ODFh
ZC4uZTE4NTk2YzhhNTVhIDEwMDY0NAotLS0gYS90YXJnZXQvcmlzY3YvY3B1LmMKKysrIGIvdGFy
Z2V0L3Jpc2N2L2NwdS5jCkBAIC01MDUsNiArNTA1LDkgQEAgc3RhdGljIHZvaWQgcnY2NF90aGVh
ZF9jOTA2X2NwdV9pbml0KE9iamVjdCAqb2JqKQogICAgIGNwdS0+Y2ZnLmV4dF94dGhlYWRzeW5j
ID0gdHJ1ZTsKIAogICAgIGNwdS0+Y2ZnLm12ZW5kb3JpZCA9IFRIRUFEX1ZFTkRPUl9JRDsKKyAg
ICBjcHUtPmNmZy5tYXJjaGlkID0gKChRRU1VX1ZFUlNJT05fTUFKT1IgPDwgMTYpIHwKKyAgICAg
ICAgICAgICAgICAgICAgICAgIChRRU1VX1ZFUlNJT05fTUlOT1IgPDwgOCkgIHwKKyAgICAgICAg
ICAgICAgICAgICAgICAgIChRRU1VX1ZFUlNJT05fTUlDUk8pKTsKICNpZm5kZWYgQ09ORklHX1VT
RVJfT05MWQogICAgIHNldF9zYXRwX21vZGVfbWF4X3N1cHBvcnRlZChjcHUsIFZNXzFfMTBfU1Yz
OSk7CiAjZW5kaWYKLS04PC0tCgpJJ20gdW5zdXJlIHdoYXQgdGhlIGNvcnJlY3QgcWVtdSB3YXkg
b2YgYWRkaW5nIGEgZGVmYXVsdCB2YWx1ZSBpcywKb3IgaWYgYzkwNiBzaG91bGQgaGF2ZSBhIHBy
b3BlciBtYXJjaGlkLgoKTWF5YmUgQ2hyaXN0b3BoIG9yIFpoaXdlaSBjYW4gYW5zd2VyPwoKcWVt
dSBjb21tYW5kLWxpbmU6CnFlbXUtc3lzdGVtLXJpc2N2NjQgLW5vZGVmYXVsdHMgLW5vZ3JhcGhp
YyAtbWFjaGluZSB2aXJ0LGFjcGk9b2ZmIFwKICAgLWNwdSB0aGVhZC1jOTA2IC4uLgoKClRoYW5r
cywKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
