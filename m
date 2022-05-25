Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1825C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CbttlHJbaPMuUxEyc8ncsc4J1Y1eKVF6mSHgEdMak04=; b=uAtcVfYCfv5mnN
	E72kez3aI6JbgCyhZVsm4fMvSa6FMl/Q4YXSjPFJON9EBZNiGd8Mozgppj3zkSpNUoe3J3xgNmHs/
	swkBsBAmNrPGYQdzchR/TDxJLsLNNCIVs/zFvwyNmRxbeU5rEKqczFISs33TKA25J19Dw2IbX+fG4
	W3Sa3INTLxRjby4xyg2RQJYUCy3tXTDVNmZlYkYveawovdxUWgOhTpuFDqJixWMHNEV9FkrVYP1xs
	PKaZn7GZsOCpZhejdqTCVoeMChmDV1P3uF0v826nO1WmlmSiZ9KG+Uj64BPdXb/j5mMltn5P/en/u
	AsPbjLiBvsM5JrwUPLWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttUq-00BlC7-7Q; Wed, 25 May 2022 16:04:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttUm-00BlAy-U8
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 16:04:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A76A5CE1F7B;
	Wed, 25 May 2022 16:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2EEC385B8;
	Wed, 25 May 2022 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653494652;
	bh=9SsmUxRspR26RN2LNvw0etslFl1c4fkjQCM9Ey0idec=;
	h=From:To:Cc:Subject:Date:From;
	b=SugjF9n+aZoxi+E3o/AOBu3PmbEXcq2JYOU+7DP2xhuvWJD5WCyvChXVA/9SSctCV
	 +fwRuJ58O4VXbgZ+iX4yCVi4zm0TE7XLQVo973sWHAf6Vooj1gGl+zaQ6ymWvH291b
	 JsCcAwuS/6ofu5SHzgRXom/y1HoBsXAfQwSxhoxV2XUL4RYrKZtWwZ6ufyT86scMwn
	 hM2TojGU0hi/W8/QZKuCGqSko965sfkMaAo1enGMVkHkU2kduNtwhZWIQoPJP0VerJ
	 Iem0GPGqoBIRxkQlpVkLOntzZlZkvTeELsziD1DErGw/cU9cUQPd6hFRW1CbneX+uJ
	 wLj7qxzTCmJgg==
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
Subject: [PATCH] riscv: compat: Using seperated vdso_maps for compat_vdso_info
Date: Wed, 25 May 2022 12:04:04 -0400
Message-Id: <20220525160404.2930984-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_090425_368644_41478375 
X-CRM114-Status: GOOD (  12.28  )
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
eTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PgpTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+ClNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPgpDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4K
Q2M6IEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+Ci0tLQogYXJjaC9yaXNjdi9rZXJu
ZWwvdmRzby5jIHwgMTUgKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92
ZHNvLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKaW5kZXggNTBmZTRjODc3NjAzLi42OWIw
NWI2YzE4MWIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYworKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC92ZHNvLmMKQEAgLTIwNiwxMiArMjA2LDIzIEBAIHN0YXRpYyBzdHJ1Y3Qg
X192ZHNvX2luZm8gdmRzb19pbmZvIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIH07CiAKICNpZmRlZiBD
T05GSUdfQ09NUEFUCitzdGF0aWMgc3RydWN0IHZtX3NwZWNpYWxfbWFwcGluZyBydl9jb21wYXRf
dmRzb19tYXBzW10gX19yb19hZnRlcl9pbml0ID0geworCVtSVl9WRFNPX01BUF9WVkFSXSA9IHsK
KwkJLm5hbWUgICA9ICJbdnZhcl0iLAorCQkuZmF1bHQgPSB2dmFyX2ZhdWx0LAorCX0sCisJW1JW
X1ZEU09fTUFQX1ZEU09dID0geworCQkubmFtZSAgID0gIlt2ZHNvXSIsCisJCS5tcmVtYXAgPSB2
ZHNvX21yZW1hcCwKKwl9LAorfTsKKwogc3RhdGljIHN0cnVjdCBfX3Zkc29faW5mbyBjb21wYXRf
dmRzb19pbmZvIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkubmFtZSA9ICJjb21wYXRfdmRzbyIsCiAJ
LnZkc29fY29kZV9zdGFydCA9IGNvbXBhdF92ZHNvX3N0YXJ0LAogCS52ZHNvX2NvZGVfZW5kID0g
Y29tcGF0X3Zkc29fZW5kLAotCS5kbSA9ICZydl92ZHNvX21hcHNbUlZfVkRTT19NQVBfVlZBUl0s
Ci0JLmNtID0gJnJ2X3Zkc29fbWFwc1tSVl9WRFNPX01BUF9WRFNPXSwKKwkuZG0gPSAmcnZfY29t
cGF0X3Zkc29fbWFwc1tSVl9WRFNPX01BUF9WVkFSXSwKKwkuY20gPSAmcnZfY29tcGF0X3Zkc29f
bWFwc1tSVl9WRFNPX01BUF9WRFNPXSwKIH07CiAjZW5kaWYKIAotLSAKMi4zNi4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
