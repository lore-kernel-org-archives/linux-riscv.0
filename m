Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE560C3ABBF
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 00:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jum0w2e9vhNu8HxUGdVDOvgWzFrLoI5OpsMDz1o21gs=; b=2tLnYQZQbGPdBr
	mZ9TeQyhc9TMxCAwWicY4lercV4WY6HRx9iLhVyLRUwgp4f94g8q0k0MRmtIEO6j1d2CLi0atRLor
	+HmmPtECDfv93D574p/QDvf3LSIcTf1YWy+fdqEI+2SvFyHYNM9Am8KdmTgvjiG3rWRM9MFtM0Uig
	SzxJqIdqkhG1WRLuZNf71KtMNtZbY0cadWL+0Ro0zM3HZgsSWbUivNktwPHmdBoJdMml4+9w5TuLL
	JkKZNdLDgSCIeMvbEHVXNv0IYVEJST86SA+P89edDuksDZkQ0hUUzdLJKxqSldmz5PYWttkr5ypyO
	746i9T/mNOl4luskY3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC6Ha-00000009Jd5-21NC;
	Tue, 06 May 2025 00:35:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4R2-00000008oH4-2GhU
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 22:37:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B230629C1;
	Mon,  5 May 2025 22:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79121C4CEEE;
	Mon,  5 May 2025 22:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484635;
	bh=5Ul5afnxT4Ev7pMFKXsZJc0l/RU9J+GqH7JwLx6dk74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cr9GYe95CP+0S3Ta9h53Cn5iaHntdk8HiFLNq1Cll3NeQZa673EeDL30yOqHJNY6u
	 qIm5Pl270pMfsY1lTN05cdn/nWI6jX4uBNYAuToNbt7WRgkjC7AzgSgnuvUUtB6LcF
	 zMDci0vIVQNPLOXHy71omQj4Yh5nBlpAeZ+ydOVheUhDZjCoBUGkKPn9iq6qLMafOe
	 Fu7+MfIfkorbbKFiDXK0i/sjZLQPlnlaUvSDMHAYuecrOPjJ0CjRHSSP1VsEQG2w3M
	 p9s67Ip5TS0xnCmq487Ufs8Uv6Df+0yDYoxO4F3tJosKLfFpyPD/ceMlb95ojLBwPr
	 Z6Ji5C887f74w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 575/642] irqchip/riscv-aplic: Add support for hart indexes
Date: Mon,  5 May 2025 18:13:11 -0400
Message-Id: <20250505221419.2672473-575-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

RnJvbTogVmxhZGltaXIgS29uZHJhdGlldiA8dmxhZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5j
b20+CgpbIFVwc3RyZWFtIGNvbW1pdCBiOTNhZmU4YTNhYzUzYWU1MjI5NmQ2NWFjZmFhOWM1ZjU4
MmE0OGNjIF0KClJJU0MtViBBUExJQyBzcGVjaWZpY2F0aW9uIGRlZmluZXMgImhhcnQgaW5kZXgi
IGluOgoKICBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWlhCgpXaXRoaW4gYSBnaXZl
biBpbnRlcnJ1cHQgZG9tYWluLCBlYWNoIG9mIHRoZSBkb21haW7igJlzIGhhcnRzIGhhcyBhIHVu
aXF1ZQppbmRleCBudW1iZXIgaW4gdGhlIHJhbmdlIDAgdG8gMl4xNCDiiJIgMSAoPSAxNiwzODMp
LiBUaGUgaW5kZXggbnVtYmVyIGEKZG9tYWluIGFzc29jaWF0ZXMgd2l0aCBhIGhhcnQgbWF5IG9y
IG1heSBub3QgaGF2ZSBhbnkgcmVsYXRpb25zaGlwIHRvIHRoZQp1bmlxdWUgaGFydCBpZGVudGlm
aWVyICjigJxoYXJ0IElE4oCdKSB0aGF0IHRoZSBSSVNDLVYgUHJpdmlsZWdlZCBBcmNoaXRlY3R1
cmUKYXNzaWducyB0byB0aGUgaGFydC4gVHdvIGRpZmZlcmVudCBpbnRlcnJ1cHQgZG9tYWlucyBt
YXkgZW1wbG95IGVudGlyZWx5CmRpZmZlcmVudCBpbmRleCBudW1iZXJzIGZvciB0aGUgc2FtZSBz
ZXQgb2YgaGFydHMuCgpGdXJ0aGVyLCB0aGlzIGRvY3VtZW50IHNheXMgaW4gIjQuNSBNZW1vcnkt
bWFwcGVkIGNvbnRyb2wgcmVnaW9uIGZvciBhbgppbnRlcnJ1cHQgZG9tYWluIjoKClRoZSBhcnJh
eSBvZiBJREMgc3RydWN0dXJlcyBtYXkgaW5jbHVkZSBzb21lIGZvciBwb3RlbnRpYWwgaGFydCBp
bmRleApudW1iZXJzIHRoYXQgYXJlIG5vdCBhY3R1YWwgaGFydCBpbmRleCBudW1iZXJzIGluIHRo
ZSBkb21haW4uIEZvciBleGFtcGxlLAp0aGUgZmlyc3QgSURDIHN0cnVjdHVyZSBpcyBhbHdheXMg
Zm9yIGhhcnQgaW5kZXggMCwgYnV0IDAgaXMgbm90Cm5lY2Vzc2FyaWx5IGEgdmFsaWQgaW5kZXgg
bnVtYmVyIGZvciBhbnkgaGFydCBpbiB0aGUgZG9tYWluLgoKU3VwcG9ydCBhcmJpdHJhcnkgaGFy
dCBpbmRpY2VzIHNwZWNpZmllZCBpbiBhbiBvcHRpb25hbCBBUExJQyBwcm9wZXJ0eQoicmlzY3Ys
aGFydC1pbmRleGVzIiB3aGljaCBpcyBzcGVjaWZpZWQgYXMgYW4gYXJyYXkgb2YgdTMyIGVsZW1l
bnRzLCBvbmUKcGVyIGludGVycnVwdCB0YXJnZXQuIElmIHRoaXMgcHJvcGVydHkgaXMgbm90IHNw
ZWNpZmllZCwgZmFsbGJhY2sgdG8gdXNlCmxvZ2ljYWwgaGFydCBpbmRpY2VzIHdpdGhpbiB0aGUg
ZG9tYWluLgoKU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgS29uZHJhdGlldiA8dmxhZGltaXIua29u
ZHJhdGlldkBtb2JpbGV5ZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGds
eEBsaW51dHJvbml4LmRlPgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMTI5MDkxNjM3LjE2
NjcyNzktMy12bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXllLmNvbQpTaWduZWQtb2ZmLWJ5OiBT
YXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1hcGxpYy1kaXJlY3QuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1kaXJlY3QuYyBiL2RyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtYXBsaWMtZGlyZWN0LmMKaW5kZXggN2NkNmI2NDY3NzRiOS4uMjA1YWQ2MWQx
NWU0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1kaXJlY3Qu
YworKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLWRpcmVjdC5jCkBAIC0zMSw3
ICszMSw3IEBAIHN0cnVjdCBhcGxpY19kaXJlY3QgewogfTsKIAogc3RydWN0IGFwbGljX2lkYyB7
Ci0JdW5zaWduZWQgaW50CQloYXJ0X2luZGV4OworCXUzMgkJCWhhcnRfaW5kZXg7CiAJdm9pZCBf
X2lvbWVtCQkqcmVnczsKIAlzdHJ1Y3QgYXBsaWNfZGlyZWN0CSpkaXJlY3Q7CiB9OwpAQCAtMjE5
LDYgKzIxOSwyMCBAQCBzdGF0aWMgaW50IGFwbGljX2RpcmVjdF9wYXJzZV9wYXJlbnRfaHdpcnEo
c3RydWN0IGRldmljZSAqZGV2LCB1MzIgaW5kZXgsCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBp
bnQgYXBsaWNfZGlyZWN0X2dldF9oYXJ0X2luZGV4KHN0cnVjdCBkZXZpY2UgKmRldiwgdTMyIGxv
Z2ljYWxfaW5kZXgsCisJCQkJICAgICAgIHUzMiAqaGFydF9pbmRleCkKK3sKKwljb25zdCBjaGFy
ICpwcm9wX2hhcnRfaW5kZXggPSAicmlzY3YsaGFydC1pbmRleGVzIjsKKwlzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5wID0gdG9fb2Zfbm9kZShkZXYtPmZ3bm9kZSk7CisKKwlpZiAoIW5wIHx8ICFvZl9w
cm9wZXJ0eV9wcmVzZW50KG5wLCBwcm9wX2hhcnRfaW5kZXgpKSB7CisJCSpoYXJ0X2luZGV4ID0g
bG9naWNhbF9pbmRleDsKKwkJcmV0dXJuIDA7CisJfQorCisJcmV0dXJuIG9mX3Byb3BlcnR5X3Jl
YWRfdTMyX2luZGV4KG5wLCBwcm9wX2hhcnRfaW5kZXgsIGxvZ2ljYWxfaW5kZXgsIGhhcnRfaW5k
ZXgpOworfQorCiBpbnQgYXBsaWNfZGlyZWN0X3NldHVwKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9p
ZCBfX2lvbWVtICpyZWdzKQogewogCWludCBpLCBqLCByYywgY3B1LCBjdXJyZW50X2NwdSwgc2V0
dXBfY291bnQgPSAwOwpAQCAtMjY1LDggKzI3OSwxMiBAQCBpbnQgYXBsaWNfZGlyZWN0X3NldHVw
KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCBfX2lvbWVtICpyZWdzKQogCQljcHVtYXNrX3NldF9j
cHUoY3B1LCAmZGlyZWN0LT5sbWFzayk7CiAKIAkJaWRjID0gcGVyX2NwdV9wdHIoJmFwbGljX2lk
Y3MsIGNwdSk7Ci0JCWlkYy0+aGFydF9pbmRleCA9IGk7Ci0JCWlkYy0+cmVncyA9IHByaXYtPnJl
Z3MgKyBBUExJQ19JRENfQkFTRSArIGkgKiBBUExJQ19JRENfU0laRTsKKwkJcmMgPSBhcGxpY19k
aXJlY3RfZ2V0X2hhcnRfaW5kZXgoZGV2LCBpLCAmaWRjLT5oYXJ0X2luZGV4KTsKKwkJaWYgKHJj
KSB7CisJCQlkZXZfd2FybihkZXYsICJoYXJ0IGluZGV4IG5vdCBmb3VuZCBmb3IgSURDJWRcbiIs
IGkpOworCQkJY29udGludWU7CisJCX0KKwkJaWRjLT5yZWdzID0gcHJpdi0+cmVncyArIEFQTElD
X0lEQ19CQVNFICsgaWRjLT5oYXJ0X2luZGV4ICogQVBMSUNfSURDX1NJWkU7CiAJCWlkYy0+ZGly
ZWN0ID0gZGlyZWN0OwogCiAJCWFwbGljX2lkY19zZXRfZGVsaXZlcnkoaWRjLCB0cnVlKTsKLS0g
CjIuMzkuNQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
