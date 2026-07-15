Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F89C4450C
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 00:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGn5YKd11wU/o4rRzZBzjhbIS4GaufPfzYKbWcTP3uQ=; b=sKmRRNIc9+XBrG
	nAMk9hVPmPqzQ8IhIRTUZLx6BhEXLNHNWI1eNrMqAqOWsOGIp5fDEwsRN9ScsUcpzImIVNrF+4dId
	qSTWUA55iynrfQCyGtnZYr/CumjALGxE4OaVj93qv9kO88oWWRR5S9DzOGYkM9z2N40VGcCRXYq0J
	+7FaBcscQpUi9oCu81fcg4cEKl8BEGKpjv1mE0Ig5C4uYvTMpMBKtkqUZJL3EICfP3MPMRdEBQXg2
	0yLg8sJD4QIe87OuWGpbvGhCu8Cy9flr4kZBEwW4q8Lc3i77A6xDA0OnJSzMx4GWOl1J77oUDJk+z
	fKOwWzlx5ESQ5GeYoZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnPi-0000000DUg4-2YLy;
	Wed, 15 Jul 2026 00:23:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjnPg-0000000DUea-29ci
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 00:23:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E9CB601E0;
	Wed, 15 Jul 2026 00:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAA31F00ADB;
	Wed, 15 Jul 2026 00:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784075027;
	bh=SoMF0NvEK/nHml8RMjqK0ASTpVqLJvBd+3O6LznwQbI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gCOL7mrL68De7cYo/mD3keRoocGjXVRKH7wXtFoA+4tYxIb9PtZS9Q9iaD+ICj9zW
	 jhyrqClIsS9xJc7g+RChW5tPByARc14UGrgv5GiX9HQiiG6Ka/XOC7OQ3GpClq1L8i
	 bw7ibUrZkWVruJdB9KuMxuntDqGZ7UxMEFCKzle+dBtjlwWdEhH0FwwwA0F79RxZwy
	 o4jAQLrY0QizXZO7a0oUiQBbCRbZ2vVqm6E63+J2F836hxm3tcSn7ixO9AKb8T64NA
	 YhrghpeKQ2H2HPpVrXWg7WX1wsvi7L/uGM9DRTUMqkPgUow/2uc0O7MNdWnLobp5Ob
	 BgPg3g8bL6y1w==
From: Drew Fustini <fustini@kernel.org>
Date: Tue, 14 Jul 2026 17:23:24 -0700
Subject: [PATCH v5 2/8] riscv: Detect the Ssqosid extension
MIME-Version: 1.0
Message-Id: <20260714-dfustini-atl-sc-cbqri-dt-v5-2-b0ae7e9c932e@kernel.org>
References: <20260714-dfustini-atl-sc-cbqri-dt-v5-0-b0ae7e9c932e@kernel.org>
In-Reply-To: <20260714-dfustini-atl-sc-cbqri-dt-v5-0-b0ae7e9c932e@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
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
 yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637; i=fustini@kernel.org;
 h=from:subject:message-id; bh=58g1568NRL7/SI4d2HoFSQSOKccqgmn0k03hr3pJQEU=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWSFXRb4f2vjnFVuDKv1OS7OUdUy7VH9+v7vgruWDBOvM
 104NOV2ckcpC4MYF4OsmCLLpg95F5Z4hX5dMP/FNpg5rEwgQxi4OAVgIivvMjKcPrMqVm/r1MK2
 N0tvdM+eOfPKK2G+u2mz9Bfy/F2g7bXzNiPDhlNRCjdX5S6Pnvd5rkjd46UpUVtnn4g+faPi2xX
 R4x1HmQA=
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
