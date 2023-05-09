Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A973C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 03:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ELa7LdvbexjmHhtEZe17JANJFYkJTCiNM2Wif2SJGA=; b=06T7HPOO02SWFq
	si41ORQ/k9snG54w99L0tovcBoWp/XbqA9LBEiEsy/QiS+6E0P+/WkWfAnX2VYtU5bkayY/ENaq3C
	mqWqg46m2VuxJxXH06f3ueVf/LBR1udaJVQNEdUP5/7f35Gx+L0eWsACVR+s//SPwyJQSnad9XH+B
	ydUdAz51rGXxmrb6merkCIUa/iAAtmVGvoJ3wseWmVrrq0D20gkeH1lu+FQGQaSWyEV2wawgsDg85
	8ny79IbOhWm9ijnwMmoDBeYbq7HcXVx+lO0YuIQ7Yg9R1IM+W/vgFEOvdJ/K+QpNpkmYzG3NcJzA2
	pUoArB9RGIYaFpJ5GDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwES9-002DEJ-39;
	Tue, 09 May 2023 03:55:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwES6-002DD4-2x
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 03:55:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7470662401;
	Tue,  9 May 2023 03:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5490C433D2;
	Tue,  9 May 2023 03:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683604549;
	bh=/NTClOL1JcMblfk2EK9fn5y5SROM/eJwelrKFPljaXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XMSvuEg+zthy1ObzjDbBh2pm6+/040wHNglk41wGrgARqo5OBgtB5KphI5U+9JlWT
	 S/3Xmgz0YYfEBiMsEOC6eJ2LLDbSbfnV/pYtX9m81I3nxnwe48eRY/pVb6FOt01Tip
	 RHfq7YsTGS8Y2eqba5JRIEfTErb1pSy6/TDX0JJn3expvoeu/XOpYOaggE2XWs8oQI
	 /y1HMPo16s71BPk2FadeLw/36q1loCcK4KcKQfLxurJSMrXDZX/Ujtl7UIAPTU+LYs
	 AGilPCLLDkMDdQ8YOdmlBhRSdNg6KZSlg+34X3pW7Puo7XMXMv8krOvRzE6e2ncq/L
	 jCvwidoL7QnoA==
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
Subject: [PATCH AUTOSEL 5.15 2/4] riscv: Unconditionnally select KASAN_VMALLOC if KASAN
Date: Mon,  8 May 2023 23:55:41 -0400
Message-Id: <20230509035548.60458-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509035548.60458-1-sashal@kernel.org>
References: <20230509035548.60458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_205550_994495_D8A3C007 
X-CRM114-Status: UNSURE (   9.15  )
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
YXJjaC9yaXNjdi9LY29uZmlnCmluZGV4IGJmNjAyZTM4OTYyZmEuLmJhNjJhMzg0NmUzNjkgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAg
LTEwMiw2ICsxMDIsNyBAQCBjb25maWcgUklTQ1YKIAlzZWxlY3QgSEFWRV9TWVNDQUxMX1RSQUNF
UE9JTlRTCiAJc2VsZWN0IElSUV9ET01BSU4KIAlzZWxlY3QgSVJRX0ZPUkNFRF9USFJFQURJTkcK
KwlzZWxlY3QgS0FTQU5fVk1BTExPQyBpZiBLQVNBTgogCXNlbGVjdCBNT0RVTEVTX1VTRV9FTEZf
UkVMQSBpZiBNT0RVTEVTCiAJc2VsZWN0IE1PRFVMRV9TRUNUSU9OUyBpZiBNT0RVTEVTCiAJc2Vs
ZWN0IE9GCi0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
