Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F18ED46BF8
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkuAg5q2TXgBbu04iI5zkF27guyHbUepHZK5AL9865o=; b=vOvLoArad/ZZAy
	pJVlVy/srYKojpqtZwbG5v8bMxBFWjKXSTqah8GuxH9W5g2JKgpEfM1lmzVwTKpV3c3OrOcuN8u+a
	u7MHQVGHuwWtKH9Fn1mrBVn3yR/Ztmrl9ilu4h0MBDjIykEweltW/37BA0KXJC2tz6jm+3YrSeiho
	bfWuVGeR25w8R7E97ftWRA3G0kDOGlIMBox1e0gkOsnztXHhzRuDmpGB1CdNoFfCVC7eYLRnjxNGs
	58hgQqGbF9psLtFfo2qg6Zet2rOQGngWns9CSz8MBgblbO/hpVGjwbjiuOTnWSXu6lXvTyNPl4NR4
	BRe3BvdyueonZp7lgW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC91-0000000Gk1g-201l;
	Wed, 28 Jan 2026 20:28:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC8z-0000000Gk0A-1lUv
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FEA86000A;
	Wed, 28 Jan 2026 20:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE4BC4CEF7;
	Wed, 28 Jan 2026 20:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632084;
	bh=fj8k7O5ZHAbvxYPSXABfgdwCx96nHjY6bA9gTqNje0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lnEr3FIfCsXlF/AQZanvEtVWCn/JltE3MGIvF9w4D4ayIgdylOAJhvTtuvl1r1IOB
	 CdyhNLl88Girdfnj8BXm+NdMj0JPjYlXE6ocKtxhT0Hx+L7zfz0zRGyWi80zX6gbz4
	 OgmsOZIyMFTBYWi8TBTV18am6n2i77N7/fvZnMmoPzhIf7Z6o8hR2wvYORIFj6je/I
	 myCicl/CY+6IKLZOWpOQ2HlBJ9WJQS8l1NRyVqqcsEQpi6qCXQx4+5ogUY8gGbrzsb
	 L0Rozibjfll3jBe4vQq+vImqDRbzfkYQOQHe6+sAc6wcTdyyO7fuW+TnwSOTm2Ixub
	 hSEzvjmQ9jBTA==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:23 -0800
Subject: [PATCH RFC v2 02/17] RISC-V: Detect the Ssqosid extension
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-2-dca586b091b9@kernel.org>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
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
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, Rob Herring <robh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618; i=fustini@kernel.org;
 h=from:subject:message-id; bh=fj8k7O5ZHAbvxYPSXABfgdwCx96nHjY6bA9gTqNje0o=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFfobF4qs9Wp5vWb6ury3XytXTFYXU1Wo2C3hnDqzY
 am63YaVHaUsDGJcDLJiiiybPuRdWOIV+nXB/BfbYOawMoEMYeDiFICJxK9g+B/N/WVx2Je9++5/
 WsS0Vmez1XzV4xMTbjRtSGSqkmVr2/uZkeFxsmrwLb+j0f+PTpqiwF/yd31fX6vOQYXj3Hrv2zM
 FlzEAAA==
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
aXRodWIuY29tL3Jpc2N2L3Jpc2N2LXNzcW9zaWQvcmVsZWFzZXMvdGFnL3YxLjAKU2lnbmVkLW9m
Zi1ieTogS29ybmVsIER1bMSZYmEgPG1pbmRhbEBzZW1paGFsZi5jb20+CltmdXN0aW5pOiByZWJh
c2Ugb24gY3VycmVudCB1cHN0cmVhbV0KU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxmdXN0
aW5pQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgMSAr
CiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4IDQzNjlhMjMzODU0MS4u
MjhkZmY4MjMzYjM0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC0xMTAsNiArMTEwLDcgQEAK
ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQUxBU1IJCTEwMQogI2RlZmluZSBSSVNDVl9JU0FfRVhU
X1pJTFNECQkxMDIKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0xTRAkJMTAzCisjZGVmaW5lIFJJ
U0NWX0lTQV9FWFRfU1NRT1NJRAkJMTA0CiAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhF
TlZDRkcJMTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCBjMDViMTE1OTZjMTkuLmJmNzA0
YjQ4Njc5YyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtNTU4LDYgKzU1OCw3IEBAIGNvbnN0
IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewogCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHNzYWlhLCBSSVNDVl9JU0FfRVhUX1NTQUlBKSwKIAlfX1JJU0NWX0lTQV9F
WFRfREFUQShzc2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiksCiAJX19SSVNDVl9JU0Ff
RVhUX1NVUEVSU0VUKHNzbnBtLCBSSVNDVl9JU0FfRVhUX1NTTlBNLCByaXNjdl94bGludXhlbnZj
ZmdfZXh0cyksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Nxb3NpZCwgUklTQ1ZfSVNBX0VYVF9T
U1FPU0lEKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc3RjLCBSSVNDVl9JU0FfRVhUX1NTVEMp
LAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2YWRlLCBSSVNDVl9JU0FfRVhUX1NWQURFKSwKIAlf
X1JJU0NWX0lTQV9FWFRfREFUQV9WQUxJREFURShzdmFkdSwgUklTQ1ZfSVNBX0VYVF9TVkFEVSwg
cmlzY3ZfZXh0X3N2YWR1X3ZhbGlkYXRlKSwKCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
