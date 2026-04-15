Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA267F9D0FE
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 01:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wscW1g8L8vdigp7XJ6w1uUJzUFPO2w3gC6xPFVpTzhQ=; b=Po9QrGkGHkTZcr
	oT/jiSO5uK4Jck/Fu1UO5ouF4o8qYTLk1HgtjImuPezlmmTdUI4mdQb65sAPW0zLj3sFlrc7+ETay
	r+KURh3R34Qr3gPDxlD9tuJheXUxPEpezbw6w5QP/UygmPlfuPJVhLmcF5XrNgf8YJpNSAcFKD9RN
	Sl0D9FnZuTZBIr58aPK94sEcyYyUZvB4yPzTFwTZa84XlDZsT3ZUZRBRMagUYx+CXY/Z4IGznurUP
	ZRDGI1KpA+dOlGytrXkjzy7Yhtje/K5ncBEPZVJ9pMEbM7qlBJMMdXZlb/FCMtDTZHA/QM0Nn3lCq
	/ijMSAJFX5tuzYEa8XRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpUv-00000000Rmg-0AH8;
	Wed, 15 Apr 2026 01:56:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpUs-00000000Rkb-1Apb
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 01:56:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 863184457E;
	Wed, 15 Apr 2026 01:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C9CC2BCC6;
	Wed, 15 Apr 2026 01:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776218213;
	bh=cTl90YsYPY3g7JWymDyW8dKdkNX8yYPp7OJ7YZSz0gc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bw5PIoILIKcZsvxtwd1dF2jS5RgdVNyj717Zc7f+lTCnyBMuAQWyVoveqs4sFwQYd
	 0go7FtEVlyCkgpk8b7nFF+RNolgwHa6b0IEN1BVAJnC046+Be+qlUACDbABoxhvuQn
	 Ov4+uj1nZT2nyWWeBcJ49QtyBI7QNYb6I4ni8tldYNrKmXgH3Yl6mMrN4I1ejKoU9Y
	 zXin1HpKe03uVSjZUpiILXqAjCw+abv9cuGMBQgjxxYM9ym1IcmPkjOdM1wtEx/34/
	 vuGO5z313l0MVM3+hYFzwOyi3S0Xue4ZCmxeQCJN3Fh3ohiRedx4EU4C+Yu3YnSVK1
	 ADJO/MZ2x33vg==
From: Drew Fustini <fustini@kernel.org>
Date: Tue, 14 Apr 2026 18:53:56 -0700
Subject: [PATCH RFC v3 02/11] RISC-V: Detect the Ssqosid extension
MIME-Version: 1.0
Message-Id: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-2-b3b2e7e9847a@kernel.org>
References: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
In-Reply-To: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, Gong Shuai <gong.shuai@sanechips.com.cn>, 
 Gong Shuai <gsh517@gmail.com>, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637; i=fustini@kernel.org;
 h=from:subject:message-id; bh=cTl90YsYPY3g7JWymDyW8dKdkNX8yYPp7OJ7YZSz0gc=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTe+5C0dzXz1hrO0xkvjsoo2uossnp7z++h/m2/V5vmX
 jVkV5AT7ChlYRDjYpAVU2TZ9CHvwhKv0K8L5r/YBjOHlQlkCAMXpwBMxGkXw2924dmCG75XCa4P
 v87Kc3/Jtq74oztKSrn4j23fuXCTQW8Uw//aY1+j7lx/4fPi9hu/YzPDNR69NNq36JPRH1uzV+3
 5ySz8AA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_185654_366121_17275B9B 
X-CRM114-Status: UNSURE (   7.66  )
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
MTczNGY5YTRjMmZkLi5jMDcxN2E4NjFhM2MgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
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
