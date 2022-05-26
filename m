Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03C5C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 00:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=giGQ8I/yH1f5zzSivWpDSQIWgBKhi8X1KWC5MUNCTE8=; b=HBmautk5LilqLJ
	qPkkdXqEvbLzJryYSKQjlgFGAfJoQ0qp4DsLneJTgc7uTE9gZUMEwYaWZZzhBRoCtJ0U02+hr26th
	0CX/f5m/Whb8VbxwkcFNo8Yv/ujPTDC47kB9DceSqz1VowDcv6hpGHRYlnfrLwsPzvhAjVcl8IDoc
	OPqF6V9O81+SYlG6lKdEzG7np0RFFVJuDF57CFVbmeUTX4i5yVBjfSxMGciCcjrvgEC8znuBgrI9F
	QE0iWHCxomr4xgXB6ZkxGlDeLfGdaxxTqaJ6zbbKV+7wcazrEREoVeAYmVGcLPxMOgeW3D4vmQ7m0
	x2FmbZLgCT5+ZZ1R8+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1Ro-00D4AM-J4; Thu, 26 May 2022 00:33:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1Rl-00D49W-41
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 00:33:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB2D161520;
	Thu, 26 May 2022 00:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A33C385B8;
	Thu, 26 May 2022 00:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653525227;
	bh=ZWKxggY+VnUVpjU4MoysVSsuD3COCyMSaEfvLuXgVRs=;
	h=From:To:Cc:Subject:Date:From;
	b=PBq6fKCo1Bz3EIujJxTKMMGWJbuJ0AOm4fbJNtj8D7eFmMOLfK3VAk6A1OaQ06kA7
	 M2FK2VWqIbFP/w+aXhQmOrUMA9u4hBzaVVAdyZP9o2exDmH4Nibf3XvUZoN7hoy0dp
	 UIeJnJNof3D2CKGFKMtat6wU1/gHTxYJRiObxv9PG4vBEsytYeMwGTvjwuC8Q37AVO
	 6Sb4JbA3ZcaOfeURQqnr0HQ2JaBTBZIaewKvENbOxbpbKDYBXVPgaGOXz5rj4i0wDv
	 EH6DMCyHBlTpLyMCQm7MqAIrrFGoRhQr41peKlgwcAfgISDqQsBFjicLqSrLq42uzR
	 pwgWjvgD7iZNg==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	arnd@arndb.de,
	linux@roeck-us.net,
	palmer@dabbelt.com,
	heiko@sntech.de
Cc: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V2] riscv: compat: Using seperated vdso_maps for compat_vdso_info
Date: Wed, 25 May 2022 20:33:39 -0400
Message-Id: <20220526003339.2948309-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_173349_278840_9CEFFA99 
X-CRM114-Status: GOOD (  13.00  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKVGhpcyBpcyBhIGZpeHVw
IGZvciB2ZHNvIGltcGxlbWVudGF0aW9uIHdoaWNoIGNhdXNlZCBtdXNsIHRvCmZhaWwuCgpbICAg
MTEuNjAwMDgyXSBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKWyAgIDExLjYyODU2MV0g
aW5pdFsxXTogdW5oYW5kbGVkIHNpZ25hbCAxMSBjb2RlIDB4MSBhdAoweDAwMDAwMDAwMDAwMDAw
MDAgaW4gbGliYy5zb1tmZmZmZmY4YWQzOTAwMCthNDAwMF0KWyAgIDExLjYyOTM5OF0gQ1BVOiAw
IFBJRDogMSBDb21tOiBpbml0IE5vdCB0YWludGVkCjUuMTguMC1yYzctbmV4dC0yMDIyMDUyMCAj
MQpbICAgMTEuNjI5NDYyXSBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpClsg
ICAxMS42Mjk1NDZdIGVwYyA6IDAwZmZmZmZmOGFkYTExMDAgcmEgOiAwMGZmZmZmZjhhZGExM2M4
IHNwIDoKMDBmZmZmZmZjNTgxOTlmMApbICAgMTEuNjI5NTg2XSAgZ3AgOiAwMGZmZmZmZjhhZDM5
MDAwIHRwIDogMDBmZmZmZmY4YWRlMDk5OCB0MCA6CmZmZmZmZmZmZmZmZmZmZmYKWyAgIDExLjYy
OTU5OF0gIHQxIDogMDBmZmZmZmZjNTgxOWZkMCB0MiA6IDAwMDAwMDAwMDAwMDAwMDAgczAgOgow
MGZmZmZmZjhhZGUwY2MwClsgICAxMS42Mjk2MTBdICBzMSA6IDAwZmZmZmZmOGFkZTBjYzAgYTAg
OiAwMDAwMDAwMDAwMDAwMDAwIGExIDoKMDBmZmZmZmZjNTgxOWEwMApbICAgMTEuNjI5NjIyXSAg
YTIgOiAwMDAwMDAwMDAwMDAwMDAxIGEzIDogMDAwMDAwMDAwMDAwMDAxZSBhNCA6CjAwZmZmZmZm
YzU4MTliMDAKWyAgIDExLjYyOTYzNF0gIGE1IDogMDBmZmZmZmZjNTgxOWIwMCBhNiA6IDAwMDAw
MDAwMDAwMDAwMDAgYTcgOgowMDAwMDAwMDAwMDAwMDAwClsgICAxMS42Mjk2NDVdICBzMiA6IDAw
ZmZmZmZmOGFkZTBhYzggczMgOiAwMGZmZmZmZjhhZGUwZWM4IHM0IDoKMDBmZmZmZmY4YWRlMDcy
OApbICAgMTEuNjI5NjU2XSAgczUgOiAwMGZmZmZmZjhhZGUwYTkwIHM2IDogMDAwMDAwMDAwMDAw
MDAwMCBzNyA6CjAwZmZmZmZmYzU4MTllNDAKWyAgIDExLjYyOTY2N10gIHM4IDogMDBmZmZmZmY4
YWRlMGNhMCBzOSA6IDAwZmZmZmZmOGFkZGJhNTAgczEwOgowMDAwMDAwMDAwMDAwMDAwClsgICAx
MS42Mjk2NzhdICBzMTE6IDAwMDAwMDAwMDAwMDAwMDAgdDMgOiAwMDAwMDAwMDAwMDAwMDAyIHQ0
IDoKMDAwMDAwMDAwMDAwMDAwMQpbICAgMTEuNjI5Njg4XSAgdDUgOiAwMDAwMDAwMDAwMDIwMDAw
IHQ2IDogZmZmZmZmZmZmZmZmZmZmZgpbICAgMTEuNjI5Njk5XSBzdGF0dXM6IDAwMDAwMDAwMDAw
MDQwMjAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMApjYXVzZTogMDAwMDAwMDAwMDAwMDAwZAoK
VGhlIGxhc3QgX192ZHNvX2luaXQoJmNvbXBhdF92ZHNvX2luZm8pIHJlcGxhY2VzIHRoZSBkYXRh
IGluIG5vcm1hbAp2ZHNvX2luZm8uIFRoaXMgaXMgYW4gb2J2aW91cyBidWcuCgpSZXBvcnRlZC1i
eTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PgpUZXN0ZWQtYnk6IEd1ZW50ZXIg
Um9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KVGVzdGVkLWJ5OiBIZWlrbyBTdMO8Ym5lciA8aGVp
a29Ac250ZWNoLmRlPgpTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+ClNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgpDYzogUGFs
bWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KLS0tCkNoYW5nZXMgaW4gVjI6CiAtIEFk
ZCBUZXN0ZWQtYnkKIC0gUmVuYW1lIHZ2YXIgJiB2ZHNvIGluIC9wcm9jLzxwaWQ+L21hcHMuCi0t
LQogYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jIHwgMTUgKysrKysrKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKaW5kZXgg
NTBmZTRjODc3NjAzLi45NTdmMTY0Yzk3NzggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3Zkc28uYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKQEAgLTIwNiwxMiArMjA2LDIz
IEBAIHN0YXRpYyBzdHJ1Y3QgX192ZHNvX2luZm8gdmRzb19pbmZvIF9fcm9fYWZ0ZXJfaW5pdCA9
IHsKIH07CiAKICNpZmRlZiBDT05GSUdfQ09NUEFUCitzdGF0aWMgc3RydWN0IHZtX3NwZWNpYWxf
bWFwcGluZyBydl9jb21wYXRfdmRzb19tYXBzW10gX19yb19hZnRlcl9pbml0ID0geworCVtSVl9W
RFNPX01BUF9WVkFSXSA9IHsKKwkJLm5hbWUgICA9ICJbY29tcGF0IHZ2YXJdIiwKKwkJLmZhdWx0
ID0gdnZhcl9mYXVsdCwKKwl9LAorCVtSVl9WRFNPX01BUF9WRFNPXSA9IHsKKwkJLm5hbWUgICA9
ICJbY29tcGF0IHZkc29dIiwKKwkJLm1yZW1hcCA9IHZkc29fbXJlbWFwLAorCX0sCit9OworCiBz
dGF0aWMgc3RydWN0IF9fdmRzb19pbmZvIGNvbXBhdF92ZHNvX2luZm8gX19yb19hZnRlcl9pbml0
ID0gewogCS5uYW1lID0gImNvbXBhdF92ZHNvIiwKIAkudmRzb19jb2RlX3N0YXJ0ID0gY29tcGF0
X3Zkc29fc3RhcnQsCiAJLnZkc29fY29kZV9lbmQgPSBjb21wYXRfdmRzb19lbmQsCi0JLmRtID0g
JnJ2X3Zkc29fbWFwc1tSVl9WRFNPX01BUF9WVkFSXSwKLQkuY20gPSAmcnZfdmRzb19tYXBzW1JW
X1ZEU09fTUFQX1ZEU09dLAorCS5kbSA9ICZydl9jb21wYXRfdmRzb19tYXBzW1JWX1ZEU09fTUFQ
X1ZWQVJdLAorCS5jbSA9ICZydl9jb21wYXRfdmRzb19tYXBzW1JWX1ZEU09fTUFQX1ZEU09dLAog
fTsKICNlbmRpZgogCi0tIAoyLjM2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
