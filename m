Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5B6C28B2F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D1K2c2nlyaj0k304VPMFuEIkBxA8UapkH1Lscldd5Sc=; b=mnbOS7mvrxe7s4
	aCp6KP9VKJFnVITDwOlC8ohvuFjrbv6SmR26TRnnQDEj0+h+NcOgeoZMuau30FF6r8TyFWjhBqbBP
	WNJ23i7mKuuxp0T4jSQCmEQ6cydPmFw8PciKfyfNl9tFtnzHytd0CKaECAkNQwUaGxBS6ru6G6A6L
	B5dLgAbByQp0a4Di24M0nZlK/M82g87BZ379G7Lps+MgIvnobdITPui/xMA+/AVmQVVJiGY6JFwnO
	7Er2Bg58Dpm4qu+5VpdeBt33PFPT8D8yAtIj8IfDV+zHlgWHXrVX/M/PQCTnyZon8R+PzjzXfE5oy
	nALfJjrwK/9vGcas9h9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMKV-00000008bAe-13C9;
	Wed, 12 Mar 2025 13:41:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLsv-00000008X20-3wDD
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 13:12:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4049CA40AF9;
	Wed, 12 Mar 2025 13:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DC2C4CEE3;
	Wed, 12 Mar 2025 13:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741785152;
	bh=Nb2EwrGaRlhLj2cZ1F+XA6Qs+Czq/zIJZZeXSvObuTE=;
	h=From:To:Cc:Subject:Date:From;
	b=Wn7H+CKup/hxhFVUW8COsYMrIGFjrC5FGpDmyoRDZpoMK27/PtgGWIYsYsf4gBdbb
	 H124ET3VmW2meXGlgvtdyiSjejGD23jmdGTOueWHwbFX13y9pkalTKjZRX8yoh6hUw
	 FsV6dlYMoR2v2xjSok3U21FGK387nbA9yLkr0yzqr04ns++R39fubbWItiPdtXYS9W
	 xOZU2lQj+gO806dVOV54yYZfru96MrkKQsnO/FjxSCT5teVumv6XB76deSzhmxELaA
	 FJ/vD4SkDJHSQACp9YhyiL2xiVnRCGZmPTkt3Tc1bnq8/FA0eOlcTanFeWn7RLWoZn
	 pn/Bf4uET5mYQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] Add some validation for vector, vector crypto and fp stuff
Date: Wed, 12 Mar 2025 13:11:43 +0000
Message-ID: <20250312-abide-pancreas-3576b8c44d2c@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2355; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=8zYh8ffrjif+99QfRpKCRW9tNgdzrhSzvyJS1+s7Es8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkXO4R8W8+/35Gj1p/BVV2o+yBzXYHg5KucBUFrIi9/+ yJTXnK4o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPx2cbw31NHfMFEganTes+7 7tpSlFoasTTJJo89UbDz6imuXWxBNxgZ3p95/3b7St4tU1vKWUVb9DJOz/W7afB+U847/TNRTsx beQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_061234_109365_28F7ECA9 
X-CRM114-Status: GOOD (  11.25  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KCllvLAoKVGhp
cyBzZXJpZXMgaXMgcGFydGx5IGxldmVyYWdpbmcgQ2xlbWVudCdzIHdvcmsgYWRkaW5nIGEgdmFs
aWRhdGUKY2FsbGJhY2sgaW4gdGhlIGV4dGVuc2lvbiBkZXRlY3Rpb24gY29kZSBzbyB0aGF0IHRo
aW5ncyBsaWtlIGNoZWNraW5nCmZvciB3aGV0aGVyIGEgdmVjdG9yIGNyeXB0byBleHRlbnNpb24g
aXMgdXNhYmxlIGNhbiBiZSBkb25lIGxpa2U6CgloYXNfZXh0ZW5zaW9uKDx2ZWN0b3IgY3J5cHRv
PikKcmF0aGVyIHRoYW4KCWhhc192ZWN0b3IoKSAmJiBoYXNfZXh0ZW5zaW9uKDx2ZWN0b3IgY3J5
cHRvPikKd2hpY2ggRXJpYyBwb2ludGVkIG91dCB3YXMgYSBwb29yIGRlc2lnbiBzb21lIG1vbnRo
cyBhZ28uCgpUaGUgcmVzdCBvZiB0aGlzIGlzIGFkZGluZyBzb21lIHJlcXVpcmVtZW50cyB0byB0
aGUgYmluZGluZ3MgdGhhdApwcmV2ZW50IGNvbWJpbmF0aW9ucyBvZiBleHRlbnNpb25zIGRpc2Fs
bG93ZWQgYnkgdGhlIElTQS4KClRoZXJlJ3MgYSBidW5jaCBvZiBvdmVyLWxvbmcgbGluZXMgaW4g
aGVyZSwgYnV0IEkgdGhvdWdodCB0aGF0IHRoZQpvdmVyLWxvbmcgbGluZXMgd2VyZSBjbGVhcmVy
IHRoYW4gYnJlYWtpbmcgdGhlbSB1cC4KCkNoZWVycywKQ29ub3IuCgooSSd2ZSBiZWVuIHVuaW50
ZW50aW9uYWxseSBzaXR0aW5nIG9uIHRoaXMgZm9yIGEgbW9udGgsIGhvcGUgSQpoYXZlbid0IG9t
aXR0ZWQgYW55dGhpbmcgYXMgYSByZXN1bHQpCgp2NDoKLSBadmJiIC0+IHZlY3Rvcl9jcnlwdG9f
dmFsaWRhdGUoKQotIHJlbW92ZSBjb3B5LXBhc3RhIHNlY3Rpb24gb2YgY29tbWl0IG1lc3NhZ2Vz
Ci0gQWRkIGNvbW1lbnRhcnkganVzdGlmeWluZyAhRVBST0JFX0RFRkVSIGNhc2VzCi0gRVBST0JF
X0RFRkVSIHdoZXJlIHBvc3NpYmxlIChvbmUgaW5zdGFuY2UsIHp2ZTMyeCBjaGVjaykKCnYzOgot
IHJlYmFzZSBvbiB2Ni4xNC1yYzEKLSBzcGxpdCB2ZWN0b3IgY3J5cHRvIHZhbGlkYXRpb24gcGF0
Y2ggaW50byB2ZWN0b3IgdmFsaWRhdGlvbiBhbmQgdmVjdG9yCiAgY3J5cHRvIHZhbGlkYXRpb24K
LSBmaXggenZlNjR4IHJlcXVpcmluZyBleHRlbnNpb24gbGlzdCB0byBtYXRjaCBFcmljJ3MgUFIK
CnYyOgotIEZpeCBhbiBpbnZlcnRlZCBjbGF1c2UgQ2zDqW1lbnQgcG9pbnRlZCBvdXQKLSBBZGQg
WnZiYiB2YWxpZGF0aW9uLCB0aGF0IEkgaGFkIG1pc3NlZCBhY2NpZGVudGFsbHkKLSBEcm9wIHRo
ZSB0b2RvIGFib3V0IGNoZWNraW5nIHRoZSBudW1iZXIgb2YgdmFsaWRhdGlvbiByb3VuZHMsCiAg
SSB0cmllZCBpbiB3LyBxZW11J3MgbWF4IGNwdSBhbmQgdGhpbmdzIGxvb2tlZCByaWdodAoKQ0M6
IEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz4KQ0M6IENvbm9yIERvb2xleSA8Y29u
b3JAa2VybmVsLm9yZz4KQ0M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNDOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+CkNDOiBQYXVsIFdhbG1zbGV5IDxw
YXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkNDOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJl
bHQuY29tPgpDQzogIkNsw6ltZW50IEzDqWdlciIgPGNsZWdlckByaXZvc2luYy5jb20+CkNDOiBB
bmR5IENoaXUgPGFuZHlibmFjQGdtYWlsLmNvbT4KQ0M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKQ0M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnCkNDOiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnCgpDb25vciBEb29sZXkgKDYpOgogIFJJU0MtVjogYWRkIHZlY3RvciBl
eHRlbnNpb24gdmFsaWRhdGlvbiBjaGVja3MKICBSSVNDLVY6IGFkZCB2ZWN0b3IgY3J5cHRvIGV4
dGVuc2lvbiB2YWxpZGF0aW9uIGNoZWNrcwogIFJJU0MtVjogYWRkIGYgJiBkIGV4dGVuc2lvbiB2
YWxpZGF0aW9uIGNoZWNrcwogIGR0LWJpbmRpbmdzOiByaXNjdjogZCByZXF1aXJlcyBmCiAgZHQt
YmluZGluZ3M6IHJpc2N2OiBhZGQgdmVjdG9yIHN1Yi1leHRlbnNpb24gZGVwZW5kZW5jaWVzCiAg
ZHQtYmluZGluZ3M6IHJpc2N2OiBkb2N1bWVudCB2ZWN0b3IgY3J5cHRvIHJlcXVpcmVtZW50cwoK
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8ICA4NSArKysr
KysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggICAgICAgICAgIHwg
ICAzICsKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAgICB8IDE0
MCArKysrKysrKysrKysrLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMTkwIGluc2VydGlvbnMoKyks
IDM4IGRlbGV0aW9ucygtKQoKLS0gCjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
