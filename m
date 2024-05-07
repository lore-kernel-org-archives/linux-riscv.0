Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF3BC10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 23:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fSv2KqSS8NHtOtXngLzFKnlQQBsK3WIsxqlht/HeoNI=; b=EQm73pT+n7zPrH
	vmlhPXSK0g3TVbT1JWImibVnF26erdUnQPW6QYDyhScvayZIE0GeFQefdKBGq+B2lLcHg39jHYTk5
	cdiMUwdJIDcEKFxmRPXJODlN4ifoGy2yqyjnbj4ry1P+dDwQPSiLkAEiUFsmAKniEcevmArFkAhrg
	Ok2KQHlWLhVvPaCGnEYGMbYkymzTw+NpKu0MNbMLWFXESJ71banp4EQitrBDlDs/W/Ut68Fk8SCoI
	1yR9LZWEk9eQgEjh2+OgLKdR5btY9FhvvBiaIkgG9E2J+H6P70Kx2q4v3lbT2anhwiK8N85O7aQcW
	jW/MTnunDlBJCCXN4XiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ToW-0000000D7oW-2B49;
	Tue, 07 May 2024 23:01:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ToT-0000000D7ki-00kh
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 23:01:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 538B4CE1741;
	Tue,  7 May 2024 23:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEEBC2BBFC;
	Tue,  7 May 2024 23:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715122890;
	bh=+c40Uhf6KzmTtn+fKaywtRA/07JP5WBu9P0At09HAK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S5cIlWaoOyk+pWZMz21NjhhRHibSOAvRkU9dUKLaR9nFDuyU0AHluFcm49F+9Wyl9
	 LFgLUCkJZ/UryuxaVrMSVZNNkmxdPnK/QppE+2bzYNb8KbZlW5ohKwggZYwptdSKR0
	 zyOZlKfedKT/ZVvMBu6EadHNQVmXdH2b47bh+7yIIXtnknfKeGTIP3cxidAmEJojVM
	 l5Sj/5LJnTY1E2883GuapLI4r0GnCJGsMLX3EpveE8v0FWl6oK7dfmaGrhhDy3SH7W
	 URLOAX/Mundj8SqRp/qJH8GBN8xuNswAwHMtMWiWSglB0uD/Zv5/fqNh4zhCVVMeLL
	 pNrvX5nN9btvw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	shuah@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 5/5] selftests: sud_test: return correct emulated syscall value on RISC-V
Date: Tue,  7 May 2024 19:01:09 -0400
Message-ID: <20240507230115.391725-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507230115.391725-1-sashal@kernel.org>
References: <20240507230115.391725-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_160133_254180_E785E9C3 
X-CRM114-Status: GOOD (  11.85  )
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

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKWyBVcHN0cmVhbSBj
b21taXQgMTdjNjdlZDc1MmQ2YTQ1NjYwMmIzZGJiMjVjNWFlNGQzZGU1ZGVhYiBdCgpDdXJyZW50
bHksIHRoZSBzdWRfdGVzdCBleHBlY3RzIHRoZSBlbXVsYXRlZCBzeXNjYWxsIHRvIHJldHVybiB0
aGUKZW11bGF0ZWQgc3lzY2FsbCBudW1iZXIuIFRoaXMgYXNzdW1wdGlvbiBvbmx5IHdvcmtzIG9u
IGFyY2hpdGVjdHVyZXMKd2VyZSB0aGUgc3lzY2FsbCBjYWxsaW5nIGNvbnZlbnRpb24gdXNlIHRo
ZSBzYW1lIHJlZ2lzdGVyIGZvciBzeXNjYWxsCm51bWJlci9zeXNjYWxsIHJldHVybiB2YWx1ZS4g
VGhpcyBpcyBub3QgdGhlIGNhc2UgZm9yIFJJU0MtViBhbmQgdGh1cwp0aGUgcmV0dXJuIHZhbHVl
IG11c3QgYmUgYWxzbyBlbXVsYXRlZCB1c2luZyB0aGUgcHJvdmlkZWQgdWNvbnRleHQuCgpTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2Vk
LWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KQWNrZWQtYnk6IFBhbG1l
ciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgpMaW5rOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjMxMjA2MTM0NDM4LjQ3MzE2Ni0xLWNsZWdlckByaXZvc2luYy5jb20KU2lnbmVk
LW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYt
Ynk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiAuLi4vc2VsZnRlc3RzL3N5
c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRfdGVzdC5jICAgICB8IDE0ICsrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRfdGVzdC5jIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMKaW5kZXggYjVk
NTkyZDQwOTllOC4uZDk3NWE2NzY3MzI5OSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMKQEAgLTE1OCw2ICsx
NTgsMjAgQEAgc3RhdGljIHZvaWQgaGFuZGxlX3NpZ3N5cyhpbnQgc2lnLCBzaWdpbmZvX3QgKmlu
Zm8sIHZvaWQgKnVjb250ZXh0KQogCiAJLyogSW4gcHJlcGFyYXRpb24gZm9yIHNpZ3JldHVybi4g
Ki8KIAlTWVNDQUxMX0RJU1BBVENIX09GRihnbG9iX3NlbCk7CisKKwkvKgorCSAqIFRoZSB0ZXN0
cyBmb3IgYXJndW1lbnQgaGFuZGxpbmcgYXNzdW1lIHRoYXQgYHN5c2NhbGwoeCkgPT0geGAuIFRo
aXMKKwkgKiBpcyBhIE5PUCBvbiB4ODYgYmVjYXVzZSB0aGUgc3lzY2FsbCBudW1iZXIgaXMgcGFz
c2VkIGluICVyYXgsIHdoaWNoCisJICogaGFwcGVucyB0byBhbHNvIGJlIHRoZSBmdW5jdGlvbiBB
QkkgcmV0dXJuIHJlZ2lzdGVyLiAgT3RoZXIKKwkgKiBhcmNoaXRlY3R1cmVzIG1heSBuZWVkIHRv
IHN3aXp6bGUgdGhlIGFyZ3VtZW50cyBhcm91bmQuCisJICovCisjaWYgZGVmaW5lZChfX3Jpc2N2
KQorLyogUkVHX0E3IGlzIG5vdCBkZWZpbmVkIGluIGxpYmMgaGVhZGVycyAqLworIyBkZWZpbmUg
UkVHX0E3IChSRUdfQTAgKyA3KQorCisJKCh1Y29udGV4dF90ICopdWNvbnRleHQpLT51Y19tY29u
dGV4dC5fX2dyZWdzW1JFR19BMF0gPQorCQkJKCh1Y29udGV4dF90ICopdWNvbnRleHQpLT51Y19t
Y29udGV4dC5fX2dyZWdzW1JFR19BN107CisjZW5kaWYKIH0KIAogVEVTVChkaXNwYXRjaF9hbmRf
cmV0dXJuKQotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
