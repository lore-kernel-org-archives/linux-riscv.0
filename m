Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98918C28B2F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hMBkylFGIS2V7Dr0feSw/JKJZ6Ba8+pLNA2w+zHcIM=; b=I9Se05AAIMbA5t
	jg6hdN7TGQIVjJR8KWWRYRN/3UDl6WeEjLh1jnsywh+oIm70atIsQ3emhXPQNfWP/TA8Bo58s42yc
	AE9LSKeN0kjTmH2JJn1S25n1DpytKAzSk2sxq+3aZBeztvdVoxgWpKIzwYcFx/XWyaGihZXmZVzXT
	+1o4BUCY+dSAa9DzKX/W/QPFSgNPWQsluRRcmC9GNIIoN0hgWLX8WSZon1wGsmYfUMNUUuSfbefid
	j5qVGLY/6wBXDFyXS+7q+kq4VgnT5wCD9FkoBG7hiS2V/Qx2W3CjlqY4NWrHXcsYJC1GU+56HoKu+
	VzzyMAGDgQiiG7Ar6SIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMKX-00000008bBY-0F54;
	Wed, 12 Mar 2025 13:41:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLt3-00000008X4f-3Q3K
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 13:12:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8380D5C5AE0;
	Wed, 12 Mar 2025 13:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8A3C4CEE3;
	Wed, 12 Mar 2025 13:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741785161;
	bh=HIf+aPICbUrXbjs2m8V10w71t0JwLVu4gn/Zh9Vui6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f/7U7xrO8SKIhGKp0vrJKwgKaMM3jhDpRWOoJb1UhpNTgsMm0yB0GXpvskk6IyaOZ
	 UFeBgwll87+nxaeu0tuVnGgdujgT/eMsEX4BBOlAAl1/uWRTCQiBMxa7+jC2tLmscs
	 muqY5FWrg5z6JUVmdS1FdgODyPaKISB0hIAYlKoqvUNdwPUU3PWm9t2qtOYah8YCXM
	 vBb0DEB60YbY5B8htZ123AarHOyEr1EaedPrLu3NzJm+q/FXtiNT99mOHJhKzihidD
	 thQM/KuY4Xv3G+n8DPlPJy3NMSz2wK1qa6qgC/lzpeapnuaZFxYfsUxv31velrDxWM
	 yx9pEyJ8MNe3g==
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
Subject: [PATCH v4 3/6] RISC-V: add f & d extension validation checks
Date: Wed, 12 Mar 2025 13:11:46 +0000
Message-ID: <20250312-reptile-platinum-62ee0f444a32@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250312-abide-pancreas-3576b8c44d2c@spud>
References: <20250312-abide-pancreas-3576b8c44d2c@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4ovnGd2xVakirrIacf77VjQZZtTzzTmY7fwuG+fgLn8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkXO4T1d0x6HKlXwPm9tnz55sVHd1vWVrFVXY16r2m1N jxjU/D0jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEyk9TQjw+baa+aeUyYq7pix Kf7J9t9Ts2cU5n78dlzzWZbx19h3O9YxMjwwEGKflxHXdFFlxaEpYuf/a7W8daj7VCwb8LLPRya 3jxkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_061241_941994_115917CF 
X-CRM114-Status: GOOD (  12.83  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClVzaW5nIENs
ZW1lbnQncyBuZXcgdmFsaWRhdGlvbiBjYWxsYmFja3MsIHN1cHBvcnQgY2hlY2tpbmcgdGhhdApk
ZXBlbmRlbmNpZXMgaGF2ZSBiZWVuIHNhdGlzZmllZCBmb3IgdGhlIGZsb2F0aW5nIHBvaW50IGV4
dGVuc2lvbnMuCgpUaGUgY2hlY2sgZm9yICJkIiBtaWdodCBiZSBzbGlnaHRseSBjb25mdXNpbmds
eSBzaG9ydGVyIHRoYW4gdGhhdCBvZiAiZiIsCmRlc3BpdGUgImQiIGRlcGVuZGluZyBvbiAiZiIu
IFRoaXMgaXMgYmVjYXVzZSB0aGUgcmVxdWlyZW1lbnQgdGhhdCBhCmhhcnQgc3VwcG9ydGluZyBk
b3VibGUgcHJlY2lzaW9uIG11c3QgYWxzbyBzdXBwb3J0IHNpbmdsZSBwcmVjaXNpb24sCnNob3Vs
ZCBiZSB2YWxpZGF0ZWQgYnkgZHQtYmluZGluZ3MgZXRjLCBub3QgdGhlIGtlcm5lbCBidXQgbGFj
ayBvZgpzdXBwb3J0IGZvciBzaW5nbGUgcHJlY2lzaW9uIG9ubHkgaXMgYSBsaW1pdGF0aW9uIG9m
IHRoZSBrZXJuZWwuCgpTaW5jZSB2ZWN0b3Igd2lsbCBub3cgYmUgZGlzYWJsZWQgcHJvYWN0aXZl
bHksIHRoZXJlJ3Mgbm8gbmVlZCB0byBjbGVhcgp0aGUgYml0IGluIGVsZl9od2NhcCBpbiByaXNj
dl9maWxsX2h3Y2FwKCkgYW55IGxvbmdlci4KClRlc3RlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxj
bGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBt
aWNyb2NoaXAuY29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDMxICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCA0ZmE5NTFl
OWYxY2YuLjIxZDNjZjM2MWUwYSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMTA5LDYgKzEw
OSwzMyBAQCBzdGF0aWMgaW50IHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUoY29uc3Qgc3RydWN0
IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBy
aXNjdl9leHRfZl92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRh
LAorCQkJCWNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCit7CisJaWYgKCFJU19FTkFC
TEVEKENPTkZJR19GUFUpKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCS8qCisJICogRHVlIHRvIGV4
dGVuc2lvbiBvcmRlcmluZywgZCBpcyBjaGVja2VkIGJlZm9yZSBmLCBzbyBubyBkZWZlcnJhbAor
CSAqIGlzIHJlcXVpcmVkLgorCSAqLworCWlmICghX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWls
YWJsZShpc2FfYml0bWFwLCBSSVNDVl9JU0FfRVhUX2QpKSB7CisJCXByX3dhcm5fb25jZSgiVGhp
cyBrZXJuZWwgZG9lcyBub3Qgc3VwcG9ydCBzeXN0ZW1zIHdpdGggRiBidXQgbm90IERcbiIpOwor
CQlyZXR1cm4gLUVJTlZBTDsKKwl9CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGludCByaXNj
dl9leHRfZF92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRhLAor
CQkJCWNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCit7CisJaWYgKCFJU19FTkFCTEVE
KENPTkZJR19GUFUpKQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXJldHVybiAwOworfQorCiBzdGF0
aWMgaW50IHJpc2N2X2V4dF92ZWN0b3JfeF92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNh
X2V4dF9kYXRhICpkYXRhLAogCQkJCSAgICAgICBjb25zdCB1bnNpZ25lZCBsb25nICppc2FfYml0
bWFwKQogewpAQCAtMzcxLDggKzM5OCw4IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2Rh
dGEgcmlzY3ZfaXNhX2V4dFtdID0gewogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKGksIFJJU0NWX0lT
QV9FWFRfaSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEobSwgUklTQ1ZfSVNBX0VYVF9tKSwKIAlf
X1JJU0NWX0lTQV9FWFRfREFUQShhLCBSSVNDVl9JU0FfRVhUX2EpLAotCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBKGYsIFJJU0NWX0lTQV9FWFRfZiksCi0JX19SSVNDVl9JU0FfRVhUX0RBVEEoZCwgUklT
Q1ZfSVNBX0VYVF9kKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQV9WQUxJREFURShmLCBSSVNDVl9J
U0FfRVhUX2YsIHJpc2N2X2V4dF9mX3ZhbGlkYXRlKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQV9W
QUxJREFURShkLCBSSVNDVl9JU0FfRVhUX2QsIHJpc2N2X2V4dF9kX3ZhbGlkYXRlKSwKIAlfX1JJ
U0NWX0lTQV9FWFRfREFUQShxLCBSSVNDVl9JU0FfRVhUX3EpLAogCV9fUklTQ1ZfSVNBX0VYVF9T
VVBFUlNFVChjLCBSSVNDVl9JU0FfRVhUX2MsIHJpc2N2X2NfZXh0cyksCiAJX19SSVNDVl9JU0Ff
RVhUX1NVUEVSU0VUX1ZBTElEQVRFKHYsIFJJU0NWX0lTQV9FWFRfdiwgcmlzY3Zfdl9leHRzLCBy
aXNjdl9leHRfdmVjdG9yX2Zsb2F0X3ZhbGlkYXRlKSwKLS0gCjIuNDUuMgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
