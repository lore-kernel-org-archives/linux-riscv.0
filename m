Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878CECAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 06:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JID4tu6mqno1pw2zIO3NPjRbcrDOA20Cnuy3nyGfSHI=; b=Q6K0OZB9K/QGQ2
	IOftu8k19HOa3fId2CybDxBxJMh4kfsGvrDFO7+4roJgBPjcfJKpKEJPVampuycRQqCArXEEj0/Ed
	QA8EI7q9mdFVwvsUbB/e0MSjFH3X/WHprvlcS7Kkh8LAg7T0naDE+Q9PWAquf8yDm5buRUYuL8V8H
	c6lCugy0CMxSDwXdBsbvxFE+PP7J4WTZrVWmYKzJQYgBM8Bh3/mzUrlclJ6uJpjEShf1NjwTAtN56
	YtD8nxQlFTPHEpLHSgrhUUY5BMMr7LJx5PWC5FSBeEg/7oJXWGIqMPl+gWeXdJ8Jh6BhpQXyVqiiL
	f/OM7orFq2mfqMJ6a1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NYI-00000003HQ9-3Os8;
	Wed, 08 Oct 2025 06:21:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6NYF-00000003HOt-2EAh
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 06:21:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD7D261EF8;
	Wed,  8 Oct 2025 06:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711EAC116B1;
	Wed,  8 Oct 2025 06:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759904484;
	bh=/LslsVm2PU2aso1D4HT5XrqG3MUk4kBy4l6EV30WaHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uCwA/is7U6Ln3CKvgxGsdGc7Ki1TLD8FP3eRUjPIzdtgpruN3lbIIMGW5tA74p05+
	 9hvmjzUqS3EdvLMgkXuBDTEIWa0JnCLBe4dJlWP192dCzT1cmDd9/OjMEjvUnDL+J0
	 aCRfJjvuSLqaq9eQQf5A1onE2jT3IenmnPmpS9C1krocKR5V0A+NY/Va4ey9uRv/pk
	 uxK1EpLF9upDm42OZ6qpfddHhnOhNeTU4GLRuWYUl2gZKu1e0SEGu8U7CnLN7MWZ+0
	 FepNfZzMaW7WMTZ7uk9uTRFjLj/uCraHyYpnIAhZHdBztVQy2/vx8QvQnFJZoJ4nIA
	 0GsqxxzH4NJ9A==
From: Drew Fustini <fustini@kernel.org>
Date: Tue, 07 Oct 2025 23:21:11 -0700
Subject: [PATCH v4 2/3] RISC-V: Detect the Ssqosid extension
MIME-Version: 1.0
Message-Id: <20251007-ssqosid-v4-2-e8b57e59d812@kernel.org>
References: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
In-Reply-To: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 James Morse <james.morse@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, guo.wenjia23@zte.com.cn, 
 liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Drew Fustini <fustini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726; i=fustini@kernel.org;
 h=from:subject:message-id; bh=/LslsVm2PU2aso1D4HT5XrqG3MUk4kBy4l6EV30WaHM=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMWQ8Y3ocsJCJLSDnY324xA8zs1uPp3O49O8VPD0x0G/BL
 5MW1xbJjlIWBjEOBlkxRZZNH/IuLPEK/bpg/ottMHNYmUCGMHBxCsBEbj9j+Cstk3LFPvYl7/mO
 Jyc2hd3bekxN49eT06lsh2Nvdnh2793L8D9Gc3qf6C3BJGM5Zuvio5/sxeQPbC6NCrHRsZmZZWx
 byg0A
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
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCBhZmZkNjNlMTFiMGEzNDRj
MzNhNzM2NDczNTFhYzAyYTk0ZTQyOTgxLi5iNDIzOWY0ZjA5MmQwMzZlZTNkMDM3MTc3Yjk5MGUz
MTdkMzRhNzdmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC0xMDYsNiArMTA2LDcgQEAKICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQUFNTwkJOTcKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQUxS
U0MJCTk4CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklDQk9QCQk5OQorI2RlZmluZSBSSVNDVl9J
U0FfRVhUX1NTUU9TSUQJCTEwMAogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZH
CTEyNwogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggNjdiNTk2OTkzNTdkYTgwMTBkYjkxOWI0
ZWEyYzI0Y2QwZDUxMTgyYS4uYWViMTQwMjhiZDkxYWE2MmJhYjg1NGM4N2ExMWUyMGJkYjg0ODM2
NCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtNTMzLDYgKzUzMyw3IEBAIGNvbnN0IHN0cnVj
dCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewogCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBKHNzYWlhLCBSSVNDVl9JU0FfRVhUX1NTQUlBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFU
QShzc2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiksCiAJX19SSVNDVl9JU0FfRVhUX1NV
UEVSU0VUKHNzbnBtLCBSSVNDVl9JU0FfRVhUX1NTTlBNLCByaXNjdl94bGludXhlbnZjZmdfZXh0
cyksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Nxb3NpZCwgUklTQ1ZfSVNBX0VYVF9TU1FPU0lE
KSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc3RjLCBSSVNDVl9JU0FfRVhUX1NTVEMpLAogCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHN2YWRlLCBSSVNDVl9JU0FfRVhUX1NWQURFKSwKIAlfX1JJU0NW
X0lTQV9FWFRfREFUQV9WQUxJREFURShzdmFkdSwgUklTQ1ZfSVNBX0VYVF9TVkFEVSwgcmlzY3Zf
ZXh0X3N2YWR1X3ZhbGlkYXRlKSwKCi0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
