Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0A7CD4842
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 05:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wscW1g8L8vdigp7XJ6w1uUJzUFPO2w3gC6xPFVpTzhQ=; b=Bc9jz2a+9GV+mi
	ISqzT3mSqeT5OgJRm5k05cypaEHsQH9nj9m583dTJJR0WH2h5U5JrBeXWUhtTNBlYXocG5EcX1xpM
	XK1LEZVWpfLHqVdis1rcHIdmis9nIcyZi1U39BkUJ5S6ooLtAu7uJ180ceELfASAAnb6B4No5DbPw
	SiL86OKZj25GmAhAn2yq9E805RI/qwpvYkjOIpSU/bAgfSLpusWAKMhjD7B1LBLCWJm1n+TIjwVic
	kvGBILA9300XjqegeGBfIHX6j5QcQBhfFNhSLZC3e8wAQ59u4+WHWHC5m/7aNo4PxabeKPc/QW2V5
	MKwu/SXb5IKiKgo2zEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvc-0000000CLTH-0gRd;
	Mon, 11 May 2026 05:11:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIva-0000000CLOh-0TWl
	for linux-riscv@bombadil.infradead.org;
	Mon, 11 May 2026 05:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0AI0PLK9wDSO/YWb46AAlRBqtwaswnEt34yrzugD/Xw=; b=YB/7NszRSNLDd7ZFx+PmxvgMeC
	GONwslpIy+2VAO8zBEu8rUXjxiXveCbE5hNjRxt9zjPdmCh+PJkJgED4cFxxE3yc4Qnu1/dM+3TJA
	IR8bz1YXLMJjgskSQRYCjBm0T3VDsAXEpnkwz7uTgMXQHbbfKWN92n0qaJoZ941t3d5ZQxJOBJo7L
	z+k8C7cxDiICDfj8s7GZuaZiqonnwup7O1//O5kSVRl4bJ/mN7e6zmZ9Yfr+i+Wnk/oiZRTmtEHQI
	ASOhAJB2+dlu3ikPL+SogvbZ1sOtpqOrt6tr//tJ0nZpRF49WiDKNZAIf6hUmOdyPD6z6ZNAGhTaw
	GxCm3QrA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIvC-0000000Ae1H-2DvZ
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 05:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 84B5E4458D;
	Mon, 11 May 2026 05:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A10C4AF13;
	Mon, 11 May 2026 05:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778476270;
	bh=cTl90YsYPY3g7JWymDyW8dKdkNX8yYPp7OJ7YZSz0gc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oYOUbswbON1iHBafiXJ41SBSDZx11VFC7txXIKQes04sVGj9mtSSWnV5JoInHGpNJ
	 D/LUM7RxyyWqd7T0qePqQ8ZdV9sPrJh/psXC4c7KCYug8Wu0Ce0ln4KjKzdrMrthG+
	 9FMGWMUKvHVZT5Ez9mU5KU3VQEkDeqC/gjH+G0Mncu0P5MF+Tb+vngJRobP8tYal7g
	 kg5HKGxnPUoMpd/T8MWWVojaSxLvxJ5AkZ/zkUIg3umSbV9AHx0xdN0+Smx4jANgFV
	 vriFyrfwx5mwIF22EQaaygi52x21g6fIQbg2k4Nn+lGu9ZVxpQfF6K97UW1smVP+8X
	 BwiO9F+lwRLzg==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 10 May 2026 22:10:58 -0700
Subject: [PATCH RFC v4 02/18] riscv: detect the Ssqosid extension
MIME-Version: 1.0
Message-Id: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-2-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org>
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org>
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
 Drew Fustini <fustini@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637; i=fustini@kernel.org;
 h=from:subject:message-id; bh=cTl90YsYPY3g7JWymDyW8dKdkNX8yYPp7OJ7YZSz0gc=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWQxprwyn3mvjz8zNzSswD6qXdnGqnXivMn+N3uzzZiz5
 wr///Gpo5SFQYyLQVZMkWXTh7wLS7xCvy6Y/2IbzBxWJpAhDFycAjCRdn9GhpsLU2J/C/2/IT3X
 /8Xnb9sX/nYSOfL7WsLNB7ddfy3S5T/PyPDjCUtKza1Tu22c+R1/8nlwtzoul0hVFe+K1dZ9PjN
 lKTcA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_061130_355552_63BCE079 
X-CRM114-Status: UNSURE (   8.30  )
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
