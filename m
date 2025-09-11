Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FB6CAC583
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 06:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MprakUsLI1MCjkzI8nJ207Vtl5zSbu+vxPsT4Uy/GII=; b=3Q2J/miwb//Vz6
	v2mliPDG0kljfg/iWUzAR+cpvqSkiAb/UrCvoEfNXdDxe55Fztmd4gJoZeSULPMeICWWluF5gqfJV
	ckGY1ju4L6cWdPtIHzX32qca+srYlmkujAtKp4R1PtbyHSMvqbR8/EexXwKgHKFQ35dGJTbRKX+eW
	mciXR1nyoBanvYVSArLOI/CDvdJnKZfiW1H8KEzLJBQOvSFPe8gKYHf1mDwXZsdijC5hF3zT5BKnC
	wXUzLL2lxX+l3yAsNwkS7FQ8jZMRPEA5woihngUs7h3qz1QFfm8mWEBHjXRZDy7QPjka5gMPqSTnV
	t40lW0bWkBv00hudwbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwabW-00000001BK1-1yD3;
	Thu, 11 Sep 2025 06:16:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwabV-00000001BJe-3fQu
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 06:16:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9541601B5;
	Thu, 11 Sep 2025 06:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDA0C4CEF9;
	Thu, 11 Sep 2025 06:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757571380;
	bh=bQfgfWONvdz/3iYAkuBR5e3H14h6gOvtW3RNK3GueZw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dp9pIKGDDaayfu9vUTe6fUhaqaxz/OKt0qMUDdvy1zxBI4SyxZ6YZ4zKZCcjF2JY6
	 C+IhcQFdur8x7r4FwOr0g+hmHsd/cRzepd1o7sVOTMqSk/fp/AOuPcvj4kFsXjgqSG
	 7V8UVYRYFq73c22jvOtL1+n0wxxSnajBZ1pi/mPPyBNc/K7rRH0PQ1hZdwBlEtSRjH
	 dZZhfKbSfWV16kyxnAYbpM9kj1CdC0IpyGCEA9IRJu6aZCmqIwmwHZRZKc1zEFaeji
	 P6kUsCe+jWGl0ZsIXd4VLZ1qXVHj5Bs+6+y8zyge98TvPw4DmiUzsoT8jfPAsQL6IZ
	 dKgghe2j7s9kg==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 10 Sep 2025 23:15:29 -0700
Subject: [PATCH 1/2] RISC-V: Detect the Ssqosid extension
MIME-Version: 1.0
Message-Id: <20250910-ssqosid-v6-17-rc5-v1-1-72cb8f144615@kernel.org>
References: <20250910-ssqosid-v6-17-rc5-v1-0-72cb8f144615@kernel.org>
In-Reply-To: <20250910-ssqosid-v6-17-rc5-v1-0-72cb8f144615@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>
Cc: =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 James Morse <james.morse@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, guo.wenjia23@zte.com.cn, 
 liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <fustini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=fustini@kernel.org;
 h=from:subject:message-id; bh=bQfgfWONvdz/3iYAkuBR5e3H14h6gOvtW3RNK3GueZw=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMWQcyjSOX/H7dFblKT/nC29r983LWpv3smDT4jcBl2N9b
 2aIu+uv7ihlYRDjYJAVU2TZ9CHvwhKv0K8L5r/YBjOHlQlkCAMXpwBM5O9Nhv8R0rtv8hw1SjO7
 ySE2+R93eCrXc39TjaoHT2svSRxS2v+M4b8737yps16XHbmh5u93/3OnbGXViohrKb+41OQ8o18
 s/McJAA==
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
c2Ugb24gdjYuMTctcmM1XQpTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2Vy
bmVsLm9yZz4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAxICsKIGFyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXggYWZmZDYzZTExYjBhMzQ0YzMzYTcz
NjQ3MzUxYWMwMmE5NGU0Mjk4MS4uYjQyMzlmNGYwOTJkMDM2ZWUzZDAzNzE3N2I5OTBlMzE3ZDM0
YTc3ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtMTA2LDYgKzEwNiw3IEBACiAjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWkFBTU8JCTk3CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFMUlNDCQk5
OAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJQ0JPUAkJOTkKKyNkZWZpbmUgUklTQ1ZfSVNBX0VY
VF9TU1FPU0lECQkxMDAKIAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRwkxMjcK
IApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4IDc0M2Q1MzQxNTU3MmUwNzFmYjIyODUxMTYxYmQw
NzllZjMxNThiN2MuLmUyMDI1NjRmNmY3YjU1MGYzYjQ0YTA4MjZiNWE2N2Q1YzRlYmVlOTYgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTUzMyw2ICs1MzMsNyBAQCBjb25zdCBzdHJ1Y3Qgcmlz
Y3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFU
QShzc2FpYSwgUklTQ1ZfSVNBX0VYVF9TU0FJQSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Nj
b2ZwbWYsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpLAogCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNF
VChzc25wbSwgUklTQ1ZfSVNBX0VYVF9TU05QTSwgcmlzY3ZfeGxpbnV4ZW52Y2ZnX2V4dHMpLAor
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzcW9zaWQsIFJJU0NWX0lTQV9FWFRfU1NRT1NJRCksCiAJ
X19SSVNDVl9JU0FfRVhUX0RBVEEoc3N0YywgUklTQ1ZfSVNBX0VYVF9TU1RDKSwKIAlfX1JJU0NW
X0lTQV9FWFRfREFUQShzdmFkZSwgUklTQ1ZfSVNBX0VYVF9TVkFERSksCiAJX19SSVNDVl9JU0Ff
RVhUX0RBVEFfVkFMSURBVEUoc3ZhZHUsIFJJU0NWX0lTQV9FWFRfU1ZBRFUsIHJpc2N2X2V4dF9z
dmFkdV92YWxpZGF0ZSksCgotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
