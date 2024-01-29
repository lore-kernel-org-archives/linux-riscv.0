Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEEFC47DB3
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 18:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9SORy/TFsBG1H2HRk9Qu9TT0g4pgj+XtXL6gAk9G2dQ=; b=peuayuerYy8PaC
	p8OUi4RLwuteGOD/whrjHOB/IfW+t9e8+CrJJLlntcAD+KaoX60A4367/N5MUNkoHFKB3Oo035n+T
	Q68fXFnSC2UVzYZhxbQICFMoq3IMGlZhxRM+qTcOmzUFpXhbx/BQ83YuS7zzuheTtZj8XQ73Tm5Vo
	sj7W0Dir+nNUng+A5i4HqBJxJGkNvwsAkSGNT3UwhcT4Htv2xoZISxRNkXku+uyRDBw5XH2h9UIQv
	0MeSim6Y6L+DN6hUm/43OJyLvxebn8GPsa3VqMDo8WpIhB5xZ0q0b1aCCp1yipghMkT8GakSCopKq
	OD5JZxUrhp5eamjymiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWTF-0000000Dx6K-0hsU;
	Mon, 29 Jan 2024 18:35:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWTC-0000000Dx4d-38Kk
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 18:35:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0897962378;
	Mon, 29 Jan 2024 18:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390AFC43394;
	Mon, 29 Jan 2024 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706553297;
	bh=PlVbhVGQ8tUCk8layvfua62R163O3sO8M81xazBObPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KKeisS19a0LzsAh5+60QIkdDSvtzZ+1IFJHRx+y+u2zttj1SrrwkXcFIucVvCV3v7
	 B8uwqHj/BHHnyvBPkWxr9tLMc8JHKdini5MquW/zmjucciJqrTlZflSqr22Y/vF9/g
	 zyfe/VavSLHWmxOnoXycWeDlcP4UrhupqTHh7NSy332eV8gJk64H1DscwkKD2zdP57
	 zND5QFa0c85uH4NkNP99G4veJf7R58UkGrQKY78tm5pq5L0Mh5OvVjY2Q1qXrJkrw2
	 QxSP97EJX6j0A3/1jUUGHMrr3KTE/BFxwPzcY4h+VsJZmLyZVxigPlAsYw/rI1Y2NA
	 mNewIgcOdoDEw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	shuah@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	xiao.w.wang@intel.com,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.7 05/12] tools: selftests: riscv: Fix compile warnings in cbo
Date: Mon, 29 Jan 2024 13:34:14 -0500
Message-ID: <20240129183440.463998-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240129183440.463998-1-sashal@kernel.org>
References: <20240129183440.463998-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_103458_918843_B925FBEE 
X-CRM114-Status: GOOD (  10.50  )
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

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Cgpb
IFVwc3RyZWFtIGNvbW1pdCBhYzdiMmEwMmQ2MmZhZmY4YzZkNDViYWNiNWNiOWVhNTY1YjQ3Nzc2
IF0KCkdDQyBwcmludHMgYSBjb3VwbGUgb2YgZm9ybWF0IHN0cmluZyB3YXJuaW5ncyB3aGVuIGNv
bXBpbGluZwp0aGUgY2JvIHRlc3QuIExldCdzIGZvbGxvdyB0aGUgcmVjb21tZW5kYXRpb24gaW4K
RG9jdW1lbnRhdGlvbi9wcmludGstZm9ybWF0cy50eHQgdG8gZml4IHRoZXNlIHdhcm5pbmdzLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1
bGwuZXU+ClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5j
b20+ClJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgpM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMxMTIzMTg1ODIxLjIyNzI1MDQtMy1j
aHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXUKU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQg
PHBhbG1lckByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxA
a2VybmVsLm9yZz4KLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2Ni
by5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9i
ZS9jYm8uYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMKaW5k
ZXggNTBhMmNjOGFlZjM4Li5jNmE4M2FiMTFlMjIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvcmlzY3YvaHdwcm9iZS9jYm8uYwpAQCAtOTcsNyArOTcsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0
X3ppY2Jveih2b2lkICphcmcpCiAJYmxvY2tfc2l6ZSA9IHBhaXIudmFsdWU7CiAJa3NmdF90ZXN0
X3Jlc3VsdChyYyA9PSAwICYmIHBhaXIua2V5ID09IFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JPWl9C
TE9DS19TSVpFICYmCiAJCQkgaXNfcG93ZXJfb2ZfMihibG9ja19zaXplKSwgIlppY2JveiBibG9j
ayBzaXplXG4iKTsKLQlrc2Z0X3ByaW50X21zZygiWmljYm96IGJsb2NrIHNpemU6ICVsZFxuIiwg
YmxvY2tfc2l6ZSk7CisJa3NmdF9wcmludF9tc2coIlppY2JveiBibG9jayBzaXplOiAlbGx1XG4i
LCBibG9ja19zaXplKTsKIAogCWlsbGVnYWxfaW5zbiA9IGZhbHNlOwogCWNib196ZXJvKCZtZW1b
YmxvY2tfc2l6ZV0pOwpAQCAtMTIxLDcgKzEyMSw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfemljYm96
KHZvaWQgKmFyZykKIAkJZm9yIChqID0gMDsgaiA8IGJsb2NrX3NpemU7ICsraikgewogCQkJaWYg
KG1lbVtpICogYmxvY2tfc2l6ZSArIGpdICE9IGV4cGVjdGVkKSB7CiAJCQkJa3NmdF90ZXN0X3Jl
c3VsdF9mYWlsKCJjYm8uemVybyBjaGVja1xuIik7Ci0JCQkJa3NmdF9wcmludF9tc2coImNiby56
ZXJvIGNoZWNrOiBtZW1bJWRdICE9IDB4JXhcbiIsCisJCQkJa3NmdF9wcmludF9tc2coImNiby56
ZXJvIGNoZWNrOiBtZW1bJWxsdV0gIT0gMHgleFxuIiwKIAkJCQkJICAgICAgIGkgKiBibG9ja19z
aXplICsgaiwgZXhwZWN0ZWQpOwogCQkJCXJldHVybjsKIAkJCX0KQEAgLTIwMSw3ICsyMDEsNyBA
QCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJcGFpci5rZXkgPSBSSVNDVl9IV1BS
T0JFX0tFWV9JTUFfRVhUXzA7CiAJcmMgPSByaXNjdl9od3Byb2JlKCZwYWlyLCAxLCBzaXplb2Yo
Y3B1X3NldF90KSwgKHVuc2lnbmVkIGxvbmcgKikmY3B1cywgMCk7CiAJaWYgKHJjIDwgMCkKLQkJ
a3NmdF9leGl0X2ZhaWxfbXNnKCJod3Byb2JlKCkgZmFpbGVkIHdpdGggJWRcbiIsIHJjKTsKKwkJ
a3NmdF9leGl0X2ZhaWxfbXNnKCJod3Byb2JlKCkgZmFpbGVkIHdpdGggJWxkXG4iLCByYyk7CiAJ
YXNzZXJ0KHJjID09IDAgJiYgcGFpci5rZXkgPT0gUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8w
KTsKIAogCWlmIChwYWlyLnZhbHVlICYgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9aKSB7Ci0tIAoy
LjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
