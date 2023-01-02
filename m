Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA9EC3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 16:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eSxC0aQvwSL1BhDnDD/lTzSzFrNVy9k1ca5tiTGzh2U=; b=GF48kS7iG3sv2Y
	8+dTYc+olmyWNyOgdT96ZEixZci7GrLGGm+EVCqgVey0c1TtRQAj9orlnjD3JvCcCNPMQr+I4nVPy
	ax55pZ81x49bhwSqBfWWe0iC3tlN8ljMYBZlbF2W+6C397HKaEJt+I38luB+loWiExhPN0P8H2PKf
	03YnnKZmKwlQLRdoPu96vlXQHt5/JZHVY0E57aAEfHwGpDZsm79FsKKr0uZyiDuE3GoGedlPWg39+
	MCxuSoADy7aVtXtriQMLuxqYHfvQDoXfPU2JHzgeRg5XokNhyhnH2lrIDNex5PP26Hf2nx3MW2f/t
	nZlIUL+EDPj2TwDAdkAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNRQ-00CeBA-GZ; Mon, 02 Jan 2023 16:13:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCNM1-00Cbeb-0Y
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 16:08:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A8B2FB80D84;
	Mon,  2 Jan 2023 16:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB6CC433EF;
	Mon,  2 Jan 2023 16:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672675677;
	bh=AO3Ixc0TR11NeS3MBCzLhmAhDwnDKeJ/27og6j1PuYM=;
	h=From:To:Cc:Subject:Date:From;
	b=gDRaFyOHdrdRw8JvQAgaQ3UkwUJGEFtMQyT3fDX9inWxwCXnFxV4Oj35qM87PjeP7
	 4IiGHpaOVpM9BRytyMeQeCmn8ybG3xGtVKC2lVBvNiOWqL8Hk3Z/Q8+ESQFcSUO0UG
	 dig9tg9miI8hw6mNtsgTDqJMvAA2i2EL+2eZa5UosoQ1wrSKeoMj0NSXFEUFlGSfL4
	 MS+Cm3dUcgcOg3FrRf4j4LdNbczf9fHEhxKZ9taF9e0yeVw/D0GtkwNnI+F9KM9Xnt
	 Md4VrHmsWfgc4yVmWOVfoKqTwV5bBXp16YEyc1yZL3Ry7uMtLi8Xtx9LIBw/4WrzyC
	 QMZYEJmpyH3Hg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH] riscv, kprobes: Stricter c.jr/c.jalr decoding
Date: Mon,  2 Jan 2023 17:07:48 +0100
Message-Id: <20230102160748.1307289-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_080801_391105_A4BE8A29 
X-CRM114-Status: GOOD (  12.33  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKSW4gdGhlIGNvbXByZXNz
ZWQgaW5zdHJ1Y3Rpb24gZXh0ZW5zaW9uLCBjLmpyLCBjLmphbHIsIGMubXYsIGFuZCBjLmFkZApp
cyBlbmNvZGVkIHRoZSBmb2xsb3dpbmcgd2F5IChlYWNoIGluc3RydWN0aW9uIGlzIDE2Yik6Cgot
LS0rLSstLS0tLS0tLS0tLSstLS0tLS0tLS0tLSstLQoxMDAgMCByczFbNDowXSE9MCAgICAgICAw
MDAwMCAxMCA6IGMuanIKMTAwIDEgcnMxWzQ6MF0hPTAgICAgICAgMDAwMDAgMTAgOiBjLmphbHIK
MTAwIDAgIHJkWzQ6MF0hPTAgcnMyWzQ6MF0hPTAgMTAgOiBjLm12CjEwMCAxICByZFs0OjBdIT0w
IHJzMls0OjBdIT0wIDEwIDogYy5hZGQKClRoZSBmb2xsb3dpbmcgbG9naWMgaXMgdXNlZCB0byBk
ZWNvZGUgYy5qciBhbmQgYy5qYWxyOgoKICBpbnNuICYgMHhmMDA3ID09IDB4ODAwMiA9PiBpbnN0
cnVjdGlvbiBpcyBhbiBjLmpyCiAgaW5zbiAmIDB4ZjAwNyA9PSAweDkwMDIgPT4gaW5zdHJ1Y3Rp
b24gaXMgYW4gYy5qYWxyCgpXaGVuIDB4ZjAwNyBpcyB1c2VkIHRvIG1hc2sgdGhlIGluc3RydWN0
aW9uLCBjLm12IGNhbiBiZSBpbmNvcnJlY3RseQpkZWNvZGVkIGFzIGMuanIsIGFuZCBjLmFkZCBh
cyBjLmphbHIuCgpDb3JyZWN0IHRoZSBkZWNvZGluZyBieSBjaGFuZ2luZyB0aGUgbWFzayBmcm9t
IDB4ZjAwNyB0byAweGYwN2YuCgpGaXhlczogYzIyYjBiY2IxZGQwICgicmlzY3Y6IEFkZCBrcHJv
YmVzIHN1cHBvcnRlZCIpClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9z
aW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvc2ltdWxhdGUtaW5zbi5oIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9zaW11bGF0ZS1pbnNuLmggYi9h
cmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvc2ltdWxhdGUtaW5zbi5oCmluZGV4IGNiNmZmN2RjY2I5
Mi4uZGU4NDc0MTQ2YTliIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvc2lt
dWxhdGUtaW5zbi5oCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9zaW11bGF0ZS1pbnNu
LmgKQEAgLTMxLDkgKzMxLDkgQEAgX19SSVNDVl9JTlNOX0ZVTkNTKGZlbmNlLAkweDdmLCAweDBm
KTsKIAl9IHdoaWxlICgwKQogCiBfX1JJU0NWX0lOU05fRlVOQ1MoY19qLAkJMHhlMDAzLCAweGEw
MDEpOwotX19SSVNDVl9JTlNOX0ZVTkNTKGNfanIsCTB4ZjAwNywgMHg4MDAyKTsKK19fUklTQ1Zf
SU5TTl9GVU5DUyhjX2pyLAkweGYwN2YsIDB4ODAwMik7CiBfX1JJU0NWX0lOU05fRlVOQ1MoY19q
YWwsCTB4ZTAwMywgMHgyMDAxKTsKLV9fUklTQ1ZfSU5TTl9GVU5DUyhjX2phbHIsCTB4ZjAwNywg
MHg5MDAyKTsKK19fUklTQ1ZfSU5TTl9GVU5DUyhjX2phbHIsCTB4ZjA3ZiwgMHg5MDAyKTsKIF9f
UklTQ1ZfSU5TTl9GVU5DUyhjX2JlcXosCTB4ZTAwMywgMHhjMDAxKTsKIF9fUklTQ1ZfSU5TTl9G
VU5DUyhjX2JuZXosCTB4ZTAwMywgMHhlMDAxKTsKIF9fUklTQ1ZfSU5TTl9GVU5DUyhjX2VicmVh
aywJMHhmZmZmLCAweDkwMDIpOwoKYmFzZS1jb21taXQ6IDFiOTI5YzAyYWZkMzc4NzFkNWFmYjlk
NDk4NDI2ZjgzNDMyZTcxYzIKLS0gCjIuMzcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
