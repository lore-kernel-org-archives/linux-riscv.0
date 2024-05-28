Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BF6C41513
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8KvWhueFt9rgVwM8OnkfcWFiibu73+w//+AXlDlDezg=; b=wKyRFKbzDyEZF9
	SwkNDp0lh6AbjAU3kVY/UDPrfaK1QhLpgs6QJXFbTL6aptDjG7Uul85mPCvsDW9YpLsZ1UeKYVm9O
	cUb3NLAhVOYQkXKL6Bx4sdw0KZcW5p2hPLO4wazyhOQ6XcSOK5zYpyF5YuajhGNq/Sn7dWbNFeKSN
	jV2yQwMnrLk/ITIvWXkcJ6MtTQbIfGsaKWqffOZoo+IsZVZZMWQc6m1Pu+iedKvBhNrAsqa5aNDp4
	dnzUmK5yzfJvZ4B8Q6VD1rXrRM6wzLaV19J5DqAExOQshRBPpKauVYbYiYswnl2bukvd4noa2d914
	9kq6kHcuHnwC708hdg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBujk-00000000Jjp-1a3d;
	Tue, 28 May 2024 11:11:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBujh-00000000JjN-1e7T
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 11:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D866E61DA6;
	Tue, 28 May 2024 11:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A539C3277B;
	Tue, 28 May 2024 11:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716894680;
	bh=cKGaioffc0Q77ot1toCJrXdGDgZ9fVMzBNzKB36rtK4=;
	h=From:To:Cc:Subject:Date:From;
	b=SOiFBoIgSeVBUoAwAmQjlszsZycBgxh+XfHcXW1x2KnRZrsLpV/TGYJLzk9nS3JML
	 jUrg2oGmln3rXw9060MyTP8vBMtC2LKbh2A81ssqdBnU84aL4Hxx3r7HZtfITDH4VB
	 PLRwitCesYWHTaR5Wh3MCs11J7dB2au+nqCe6npmnGqAWjX9+CucMXklyQK/BvFMnD
	 s5tBGPa9p45ncJBB3ozsYvH6FpwRne3qWJKaK5KG9CM4ALQP3Qwdh5fSwNb+5+ABZn
	 DFYIvBlVnDJxhStA0KrlfvrxPLtaOKowBmwQm/S5azcASUWgLIQzlKfvCYJ0IeR5qJ
	 dbg+S8941O5cQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	xiao.w.wang@intel.com,
	Andrew Jones <ajones@ventanamicro.com>,
	pulehui@huawei.com,
	Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Pu Lehui <pulehui@huaweicloud.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Subject: [PATCH v3 0/2] RISC-V: clarify what some RISCV_ISA* config options do & redo Zbb toolchain dependency
Date: Tue, 28 May 2024 12:11:10 +0100
Message-ID: <20240528-applaud-violin-facef8d9d846@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=1kEWWyZ2wsVqGe6WsVsrxjZSumjIl+7jmavXm2F+fzk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmhuy+I3IpxFD2g9DyeecmdO8uPVJ7ad3qm9ybpq8V7z 37NN7aJ7ShlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEel8xMvR+dJa/pXxWOeLh I3uzTOtX6h4n7iqvdakLzZYsnnR6Xw0jww3d9ENuz2Tn1SaWNYkt1ClwqAz32tB1ilVEXbrjXzo 7GwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_041121_554107_875B3B5A 
X-CRM114-Status: GOOD (  10.73  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClNpbmNlIG9u
ZSBkZXBlbmRzIG9uIHRoZSBvdGhlciwgYWxiZWl0IHRyaXZpYWxseSwgaGVyZSdzIGEgdjIgb2Yg
dGhlIFpiYgp0b29sY2hhaW4gZGVwIHJlbW92YWwgYWxvbmdzaWRlIHRoZSByZXdvcmRpbmcgb2Yg
S2NvbmZpZyBvcHRpb25zIEknZApzZW50IG91dCBiZWZvcmUgdGhlIG1lcmdlIHdpbmRvdy4gSSB0
aGluayBJIGxpa2UgdGhpcyBpbXBsZW1lbnRhdGlvbgpiZXR0ZXIgdGhhbiB2MSwgYnV0IEkgY291
bGRuJ3QgdGhpbmsgb2YgYSBnb29kIG5hbWUgZm9yIGEgInB1YmxpYyIKdmVyc2lvbiBvZiBfX0FM
VEVSTkFUSVZFKCksIHNvIEkgdXNlZCBpdCBoZXJlIGRpcmVjdGx5LgpVbmZvcnR1bmF0ZWx5ICJB
TFRFUk5BVElWRV8yX0NGRyIgYWxyZWFkeSBleGlzdHMgYW5kIEkgY291bGRuJ3QgdGhpbmsgb2YK
YSBnb29kIHdheSB0byBuYW1lIGFuIGFsdGVybmF0aXZlIG1hY3JvIHRoYXQgYWxsb3dzIGZvciBz
ZXZlcmFsIGNvbmZpZwpvcHRpb25zIHRoYXQgZGlkbid0IG1ha2UgdGhlIGRpc3RpbmN0aW9uIHN1
ZmZpY2llbnRseSBjbGVhci4uIFllbGwKaWYgeW91IGhhdmUgYmV0dGVyIHN1Z2dlc3Rpb25zIHRo
YW4gSSBkaWQuCgpJIGFtIGEgd2VlIGJpdCAid29ycmllZCIgdGhhdCB0aGlzIG1ha2VzIHRoZSBL
Y29uZmlnIG9wdGlvbiBjb25mdXNpbmcgYXMKaXQgaXNuJ3QgaW1tZWRpYXRlbHkgb2J2aW91cyBp
ZiBzb21lb25lIGlzIG9yIGlzIG5vdCBnb2luZyB0byBnZXQgdGhlCnRvb2xjaGFpbiBiYXNlZCBv
cHRpbWlzYXRpb25zLgoKQ2hlZXJzLApDb25vci4KCkNDOiB4aWFvLncud2FuZ0BpbnRlbC5jb20K
Q0M6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+CkNDOiBwdWxlaHVpQGh1
YXdlaS5jb20KQ0M6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+CkNDOiBQ
YXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkNDOiBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQGRhYmJlbHQuY29tPgpDQzogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KQ0M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKQ0M6IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKQ0M6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFu
ZEBzaWZpdmUuY29tPgpDQzogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPgpDQzog
QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KQ0M6IEFuZHJldyBKb25lcyA8YWpvbmVz
QHZlbnRhbmFtaWNyby5jb20+CkNDOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2
ZS5jb20+CkNDOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgpDQzogbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwoKQ29ub3IgRG9vbGV5ICgyKToKICBSSVNDLVY6IGNs
YXJpZnkgd2hhdCBzb21lIFJJU0NWX0lTQSogY29uZmlnIG9wdGlvbnMgZG8KICBSSVNDLVY6IHNl
cGFyYXRlIFpiYiBvcHRpbWlzYXRpb25zIHJlcXVpcmluZyBhbmQgbm90IHJlcXVpcmluZwogICAg
dG9vbGNoYWluIHN1cHBvcnQKCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAg
IHwgMzggKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2FyY2hfaHdlaWdodC5oIHwgIDYgKystLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYml0b3Bz
LmggICAgICAgfCAgNCArLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2hlY2tzdW0uaCAgICAg
fCAgMyArLS0KIGFyY2gvcmlzY3YvbGliL2NzdW0uYyAgICAgICAgICAgICAgICAgfCAyMSArKyst
LS0tLS0tLS0tLS0KIGFyY2gvcmlzY3YvbGliL3N0cmNtcC5TICAgICAgICAgICAgICAgfCAgNSAr
Ky0tCiBhcmNoL3Jpc2N2L2xpYi9zdHJsZW4uUyAgICAgICAgICAgICAgIHwgIDUgKystLQogYXJj
aC9yaXNjdi9saWIvc3RybmNtcC5TICAgICAgICAgICAgICB8ICA1ICsrLS0KIDggZmlsZXMgY2hh
bmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgNDkgZGVsZXRpb25zKC0pCgotLSAKMi40My4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
