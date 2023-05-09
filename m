Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A23CC7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 03:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1l8PLdbgVt1jUF6W/M8UjIj4bIcdztVIqS12M8im4k=; b=YWTS7iVribkldw
	62yUxzAXXImRkWTFDWvQUbSKm2T9I04I0AXj+4HMiLstPeevyqDed3mQg6f5tO0z9sS8E+CfAuNv6
	32EVx3bn+Z0ZgCDBDgzVIc5hTKtn1jPpBvOER187TebYgpazbRdUoqbc3wDAydR9Dk4TLkzqFXT7W
	024WFnsquWIiYpi6LgrJSxAesvduR4oDzELHK+YlKTr/wLarQ0Ymlgzoy/y+DMS5N5UMUajgeQCWv
	a9kWamruTjb3g2JYcjC01qS01YVs/l6BwWyN2w66a3ilOrtdde2TRdXxfa9d2uTBguKXdA8Wt7qZb
	5GV8jFf30ghUoDh5PHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwERw-002D9N-0A;
	Tue, 09 May 2023 03:55:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwERt-002D7h-11
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 03:55:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DED4C6313D;
	Tue,  9 May 2023 03:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2905AC4339E;
	Tue,  9 May 2023 03:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683604536;
	bh=U2HZCyc523SVLQz5mynVDfDuaBCmxXOmqikUU7ycYeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rqhrIwtXHNltQyMjAOYauPzfTavSEStYFKPrRJLDwBl9dkHXQF+Kif9Pe8QTbmSgG
	 2JZDgCYJ4mbD97q2pGnDCHSJw/SKvxbqEnBFKUgH7MoRcLOQHVkiARIZyhrB+sSbvT
	 9e4/W6O3z+RPbKzyCoH9KT65rlanQ2Btrw338/Korf140t18NVMFqQHn4q4mG3/bVK
	 UQi28JCFKDAvWx362RmphtezMcYMsfVPXbpjHwex0S2Lc7siTDa3n1iEEs9iJf5l4N
	 ttaAuCy9MlGu55SvqPdacca2b/YSRPEZ5WhDQpIApLk6TxIeZ8PWzoGsP8XBfjB2Vt
	 fGrglHBTpvHIA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 3/5] riscv: Unconditionnally select KASAN_VMALLOC if KASAN
Date: Mon,  8 May 2023 23:55:27 -0400
Message-Id: <20230509035533.60269-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509035533.60269-1-sashal@kernel.org>
References: <20230509035533.60269-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_205537_413358_EE5102C5 
X-CRM114-Status: UNSURE (   9.25  )
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

RnJvbTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgODY0MDQ2YzUxMmMyY2Q4NDE4ZGM5MjhiOTE5ODFmYjEyYTgwMzk2YyBdCgpJZiBL
QVNBTiBpcyBlbmFibGVkLCBWTUFQX1NUQUNLIGRlcGVuZHMgb24gS0FTQU5fVk1BTExPQyBzbyBl
bmFibGUKS0FTQU5fVk1BTExPQyB3aXRoIEtBU0FOIHNvIHRoYXQgd2UgY2FuIGVuYWJsZSBWTUFQ
X1NUQUNLIGJ5IGRlZmF1bHQuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZv
c2luYy5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzAyMDMwNzUyMzIu
Mjc0MjgyLTctYWxleGdoaXRpQHJpdm9zaW5jLmNvbQpTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFi
YmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNh
c2hhbEBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIv
YXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IDA2YjliMmY2MGI5ZmIuLjRlNGQwNzcyMjcwMjAgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAg
LTExMyw2ICsxMTMsNyBAQCBjb25maWcgUklTQ1YKIAlzZWxlY3QgSEFWRV9SU0VRCiAJc2VsZWN0
IElSUV9ET01BSU4KIAlzZWxlY3QgSVJRX0ZPUkNFRF9USFJFQURJTkcKKwlzZWxlY3QgS0FTQU5f
Vk1BTExPQyBpZiBLQVNBTgogCXNlbGVjdCBNT0RVTEVTX1VTRV9FTEZfUkVMQSBpZiBNT0RVTEVT
CiAJc2VsZWN0IE1PRFVMRV9TRUNUSU9OUyBpZiBNT0RVTEVTCiAJc2VsZWN0IE9GCi0tIAoyLjM5
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
