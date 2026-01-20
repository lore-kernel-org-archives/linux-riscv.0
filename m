Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DD5D2ED11
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/4m12vY66mlzlqsinNBlFRfB1275xd5mc+SQ/U2qE4=; b=M0SAJAbxi5/CA/
	+qlqpDRB+CdPYWgGSwzQVs5kdAUgkZ1OLAMx4KRZyvcP6juo23XlLZMRUo9rHh6hmRnLUrnskV+Vy
	F74Q78fpU38ftvdH2EHE4I/M0D9uqMr13Le9SYf45oG0sMaZmc1Ob+xlIbaJESRFFdOYG1qr7AC40
	2xUB19k4x94RuNqEk9VzmZc/UT4+cjoS6dcxzwBGuysMe5Tgyt0tA4D2h89l1KWyRZcNLZ4aM8/7i
	O1xngOQReJ5f90GpVr5j/M08gW5FzyPUzvAMkbpImeOGT5J3lNi+CuY8Tg4FE6NfFNp5G4q70iSt4
	iudgjtXDYz6HoZtnRfFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39J-000000039Mp-3odb;
	Tue, 20 Jan 2026 04:15:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39D-000000039Kw-2WGm
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 779E660158;
	Tue, 20 Jan 2026 04:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39C6C2BCB1;
	Tue, 20 Jan 2026 04:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882518;
	bh=/bDxWcPBw7DqP8cMaBdDBq6xIoctZXAai1IBsm35Yn8=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=bDM3mPlopQCjNR/5OkhnqbDNy0mwIxVLOtVwPt9ZZx5D5Q0FZUc+6BWgmg3VfnWWS
	 Zb0OL+UJkjW7nPdztp5vTl4eRqhgm11FeuwOZN6p3577GlNVEDdZgEOgsDJ/6OUJJg
	 3FgtEalpwkoip9rRqZDsBhEbAN5OiuSkmvhhLzCJo7RbminDTApqvC417B8v5IqoLi
	 nm1o3HvUM5KK8AKNZAigLmEaYmtyABPqqcgtZ7VsH7O9T7qO9Mvqc1tN+Rk2lFl3q4
	 bnQTbGOQbQhfPC3O93SEfPL3h3arHyRr9jHehextMspa+b2qdQpwkC1iSV20hRhGOK
	 D0Vbd6YGihZRw==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:39 -0800
Subject: [PATCH RFC 02/19] RISC-V: Detect the Ssqosid extension
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-2-aa2a75153832@kernel.org>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
In-Reply-To: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
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
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=fustini@kernel.org;
 h=from:subject:message-id; bh=/bDxWcPBw7DqP8cMaBdDBq6xIoctZXAai1IBsm35Yn8=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwYd63/sYelVnyTbru5XsFpk6pZXaw5kP2Bttitf/
 OzCidJ3HaUsDGJcDLJiiiybPuRdWOIV+nXB/BfbYOawMoEMYeDiFICJ8Jxi+MNh7ek95cANA71l
 NoynT361jD3iMs3USktfNfvW3EWPo78z/FO5cLCG+Zh+3n/FP4vql317FycVra55s1s+S+xdHHd
 0GQsA
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
c2Ugb24gcmlzY3YvZm9yLW5leHRdClNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGlu
aUBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwog
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCA0MzY5YTIzMzg1NDEuLjI4
ZGZmODIzM2IzNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtMTEwLDYgKzExMCw3IEBACiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFMQVNSCQkxMDEKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9a
SUxTRAkJMTAyCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNMU0QJCTEwMworI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1NTUU9TSUQJCTEwNAogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5W
Q0ZHCTEyNwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggYzA1YjExNTk2YzE5Li5iZjcwNGI0
ODY3OWMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTU1OCw2ICs1NTgsNyBAQCBjb25zdCBz
dHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lT
QV9FWFRfREFUQShzc2FpYSwgUklTQ1ZfSVNBX0VYVF9TU0FJQSksCiAJX19SSVNDVl9JU0FfRVhU
X0RBVEEoc3Njb2ZwbWYsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpLAogCV9fUklTQ1ZfSVNBX0VY
VF9TVVBFUlNFVChzc25wbSwgUklTQ1ZfSVNBX0VYVF9TU05QTSwgcmlzY3ZfeGxpbnV4ZW52Y2Zn
X2V4dHMpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzcW9zaWQsIFJJU0NWX0lTQV9FWFRfU1NR
T1NJRCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3N0YywgUklTQ1ZfSVNBX0VYVF9TU1RDKSwK
IAlfX1JJU0NWX0lTQV9FWFRfREFUQShzdmFkZSwgUklTQ1ZfSVNBX0VYVF9TVkFERSksCiAJX19S
SVNDVl9JU0FfRVhUX0RBVEFfVkFMSURBVEUoc3ZhZHUsIFJJU0NWX0lTQV9FWFRfU1ZBRFUsIHJp
c2N2X2V4dF9zdmFkdV92YWxpZGF0ZSksCgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
