Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198AECD98F2
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGn5YKd11wU/o4rRzZBzjhbIS4GaufPfzYKbWcTP3uQ=; b=afUYXbf9frKATs
	ZyJfcLLImfsAcYCbNa+OqL5Ghq5PEL2U1CyZpq/lwXlMbHAeHSAtGXf+j6SVJNheF10b8Iv4PheqJ
	1d8yQb6WBYQfPaiLLFlrEOZI0Ue02iVgbzlpvTwG31YZtYGzrMW8RGHLDUM0Tn/KBpBtKT/CJ2jdw
	nS4CImyuBWRPNc/wlhT17hYvk9b11MR4W1vGsk9d9Ro2oWp2b/RWs521hIhLF8L2LPly3kjuAcjRj
	zL83GsnVT/E+l8uswVyI9xymoaxST4ofP38pxcSRq03v416GaY/NAbczyr34XDPdlCV0ct73+eb34
	YO/Z5cSAR/pA2TAKL2iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wadyR-00000002rw9-1rp2;
	Fri, 19 Jun 2026 18:29:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wadyP-00000002rve-3zbp
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 18:29:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D8AAC40A2B;
	Fri, 19 Jun 2026 18:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1471F00ADB;
	Fri, 19 Jun 2026 18:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781893788;
	bh=SoMF0NvEK/nHml8RMjqK0ASTpVqLJvBd+3O6LznwQbI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=as0UcEKL9AETztzpuRo62Bcy+ulQ8ioG2g5mSCBX2Y6WnqJ/NRy0Bm1jShvh6LOos
	 MpIGUUtOQxYNY2W/bxbtHxZ5ew6DpxJnPlnfx1wX8r29oISFvTjHKLHHSFgYFTnM+R
	 rrwVIsXaLjd2aRMMwQRjWVzL+C2H8CovvhlnRNbErgB7W0sH1A8IRNrtX8oXoySmqm
	 o/8z/3Mz6FixtEQCFQKCCFFtZgvE77HWRaB2ObFQqvm+loA2PYkK6U8UC2TFiK3PSU
	 6JMJBEc2iNlaMj0NZkZPftDtTAEP+MgbMkjuqzozmxumO7/oLa/EJrS474HEiYFw0Z
	 6Xlq9CFGgdM9Q==
From: Drew Fustini <fustini@kernel.org>
Date: Fri, 19 Jun 2026 11:29:37 -0700
Subject: [PATCH 2/8] riscv: Detect the Ssqosid extension
MIME-Version: 1.0
Message-Id: <20260619-dfustini-atl-sc-cbqri-dt-v1-2-e79a7723fab0@kernel.org>
References: <20260619-dfustini-atl-sc-cbqri-dt-v1-0-e79a7723fab0@kernel.org>
In-Reply-To: <20260619-dfustini-atl-sc-cbqri-dt-v1-0-e79a7723fab0@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637; i=fustini@kernel.org;
 h=from:subject:message-id; bh=58g1568NRL7/SI4d2HoFSQSOKccqgmn0k03hr3pJQEU=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWSZds2Uvz1x5Y/FFoGsjL3vPksvY/vm4yf6fbb0bfss9
 RUHrHae7ChlYRDjYpAVU2TZ9CHvwhKv0K8L5r/YBjOHlQlkCAMXpwBM5Ks/I8Nxhq3f9gpGmqT3
 HknrO6T07v6lH3Hc58/oX7NwbJ7/nXshw//E1mOrTPgfTkmqci9UOvPcPejd/+8zc05Pf5/x6fR
 Ps3OsAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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

U3Nxb3NpZCBpcyB0aGUgUklTQy1WIFF1YWxpdHktb2YtU2VydmljZSAoUW9TKSBJZGVudGlmaWVy
cyBzcGVjaWZpY2F0aW9uCndoaWNoIGRlZmluZXMgdGhlIFN1cGVydmlzb3IgUmVzb3VyY2UgTWFu
YWdlbWVudCBDb25maWd1cmF0aW9uIChzcm1jZmcpCnJlZ2lzdGVyLgoKTGluazogaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2L3Jpc2N2LXNzcW9zaWQvcmVsZWFzZXMvdGFnL3YxLjAKQ28tZGV2ZWxv
cGVkLWJ5OiBLb3JuZWwgRHVsxJliYSA8bWluZGFsQHNlbWloYWxmLmNvbT4KU2lnbmVkLW9mZi1i
eTogS29ybmVsIER1bMSZYmEgPG1pbmRhbEBzZW1paGFsZi5jb20+ClNpZ25lZC1vZmYtYnk6IERy
ZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaHdjYXAuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRl
eCA3ZWY4ZTVmNTVjOGQuLmI4M2RhZTVjZWJiOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAt
MTEyLDYgKzExMiw3IEBACiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNMU0QJCTEwMwogI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX1pJQ0ZJTFAJCTEwNAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJQ0ZJ
U1MJCTEwNQorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NTUU9TSUQJCTEwNgogCiAjZGVmaW5lIFJJ
U0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHCTEyNwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXgg
ZjQ2YWE1NjAyZDc0Li42NjhhN2U3MWZmMWMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTU4
Miw2ICs1ODIsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9l
eHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2FpYSwgUklTQ1ZfSVNBX0VYVF9TU0FJ
QSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njb2ZwbWYsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQ
TUYpLAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChzc25wbSwgUklTQ1ZfSVNBX0VYVF9TU05Q
TSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzcW9z
aWQsIFJJU0NWX0lTQV9FWFRfU1NRT1NJRCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3N0Yywg
UklTQ1ZfSVNBX0VYVF9TU1RDKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzdmFkZSwgUklTQ1Zf
SVNBX0VYVF9TVkFERSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoc3ZhZHUsIFJJ
U0NWX0lTQV9FWFRfU1ZBRFUsIHJpc2N2X2V4dF9zdmFkdV92YWxpZGF0ZSksCgotLSAKMi40My4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
