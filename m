Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C348EC77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 03:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3rHwNJnADdJPwjIIxXv/opLO8cm8T1tWdtgE3dTjp8=; b=e7iExoXa5ljLXY
	wh5goh/oTbWdTz59VkJ1VEMrSGnChQKSvoa5ZFQn0FK8taBltoorQgzm55vq7Qgp20vYVHJerrhya
	KFDUePN4IVDDivFgIVpXuTFIDZsXNWa2WkaeuvFYmbkprT88RmhmYxdxpEOwWog1g6JmEytrJ92EB
	XBbwwqawV+vF3AEDTSBYMZBm5fxlop/i8aiST2oQqdyWooj1uydCH0B7tQNIALv5dm86kEKeP2sFE
	ukOgR+yoNjl7J9B1mv5UnOZSDUEz3UT5joEGCjCBmpP9jD9NgcJQftIkzrjfjJSFjgrJrerS26RRv
	08atq7UvH1Nfr3XvmSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwERT-002Czv-0o;
	Tue, 09 May 2023 03:55:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwERQ-002CyH-0D
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 03:55:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4BEAE63133;
	Tue,  9 May 2023 03:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6461DC433EF;
	Tue,  9 May 2023 03:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683604505;
	bh=LwM8Wr44XK/BE4z7RcP3iHRyVzpPnh7ZfjNuk7u1V8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E5aG664fpzlweIZaYk7VXTybaH/4S76LmN5WssFNAt7rNwyCE4R77vBOg86/1wVik
	 jMmnk9F0BNycdwSBqdKHdZBnokQ5PTieRHJ7GgEZHM1pySo+juhXfDWLpFkcg7R0z2
	 r+I6m6Mo+xlmOy7EDBFW9XZYibLobTCxNNFioEuFRI0eWQq/gcer+RWML+9WFllPGo
	 NrxkPF9/M3hjpCtgkUXYAOXQIbBc1ehkVKZ7G8bHoZ4WY63AHQuG2YhgMoSkiSuoeV
	 32Lar06GaDgX8N0U4gKrHEvge+FfDysfVhxEoSD4YfmWQOmNV9teiIb1MagZXPtJRR
	 JA0yCQhFviJXg==
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
Subject: [PATCH AUTOSEL 6.3 5/7] riscv: Unconditionnally select KASAN_VMALLOC if KASAN
Date: Mon,  8 May 2023 23:54:28 -0400
Message-Id: <20230509035455.59524-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509035455.59524-1-sashal@kernel.org>
References: <20230509035455.59524-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_205508_169979_12F225EE 
X-CRM114-Status: UNSURE (   9.05  )
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
YXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IGViN2YyOWE0MTJmODcuLmQ2YWFkODRlZmI5NWUgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAg
LTExOCw2ICsxMTgsNyBAQCBjb25maWcgUklTQ1YKIAlzZWxlY3QgSEFWRV9TWVNDQUxMX1RSQUNF
UE9JTlRTCiAJc2VsZWN0IElSUV9ET01BSU4KIAlzZWxlY3QgSVJRX0ZPUkNFRF9USFJFQURJTkcK
KwlzZWxlY3QgS0FTQU5fVk1BTExPQyBpZiBLQVNBTgogCXNlbGVjdCBNT0RVTEVTX1VTRV9FTEZf
UkVMQSBpZiBNT0RVTEVTCiAJc2VsZWN0IE1PRFVMRV9TRUNUSU9OUyBpZiBNT0RVTEVTCiAJc2Vs
ZWN0IE9GCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
