Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04F6C624C6
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 13:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxf+glhaZ9RX7j1yQjv4RIhqNl8xs4BtpeN0hN7R+QM=; b=xvmJ2YWkYI+bSo
	uvU0gzEsN8gBZZA0ZJLL+8S0EBJFwEUiuiQCl+Y646kexM7dxeCwnYStU25PFRgUJTPpXLkjFBOde
	veExUx5+4p53Hfral0Zb86frrhYGtmHS+pTjuTkkt8QYymUHY3Jp1m/peaFf19ukjupunf6vauU+K
	QN8w0vDfXk0mFTvQHv+PwbCrxD3UhaN/sMD3JOktS8+EC06DvVi5snb4N6zSfCEH5Ab0aDKkOhi2y
	dUza45ZVSQ67UPENCbsXUnHj8OYJSvccGGk1ZqX8RnIPikL88rEckbNaClLBTUeEhZS/1DLN56efg
	JPeJLV+6K+TfdbyarPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12AL-00000009QwG-2cXB;
	Mon, 31 Aug 2026 13:35:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12AK-00000009QvY-1S2n
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 13:35:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2EF360215;
	Mon, 31 Aug 2026 13:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B561F00A3F;
	Mon, 31 Aug 2026 13:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788183311;
	bh=7je4D7HCOA1A9JwOZ5zn8NV8msvnyViusw2JmHoGICg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ToeQ/sqkcMNUYEMXcqtf1ZSf3nqwry+4ru7zkUUvdcUhIGTSAK1nnotbFZw6Z3tlw
	 S7vqxICM1ccSaM5ZGXe/2ugM34zYjnm6gYLu26oYg66Lnw55KwS1LIQtUF8y5yjkBm
	 df9atEEFYBO0ixuBM5irNPFHQcbxz+/vQRe1pwKQyeyOZ+HH7L24kI+HNpG8IS8JIW
	 TPbq769B4dN7eS9AdIlbcDNWJGOqBFqLxXw6DlDuIUEOHb1Vm69k4wNZll+jUoVL0L
	 1fmxoAiAXpbX+MC0EG5VJ7waR4C3M5M+IWcscuxQky3lwBS3a+zqzOS7lb65PC3P8y
	 INYURhSx0b5Tg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-6.12] riscv: panic if IRQ handler stacks cannot be allocated
Date: Mon, 31 Aug 2026 09:21:41 -0400
Message-ID: <20260831133314.4125787-73-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831133314.4125787-1-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.48
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

RnJvbTogT3NhbWEgQWJkZWxrYWRlciA8b3NhbWEuYWJkZWxrYWRlckBnbWFpbC5jb20+CgpbIFVw
c3RyZWFtIGNvbW1pdCAyYWJkMGRiYTU2MjU1MWQ1YzI3Zjk3Y2U1NjA2ODRmNTM0YzBjZjNhIF0K
CmluaXRfaXJxX3N0YWNrcygpIGFuZCBpbml0X2lycV9zY3MoKSBtYXkgZmFpbCB3aGVuIGFyY2hf
YWxsb2Nfdm1hcF9zdGFjawpvciBzY3NfYWxsb2MgcmV0dXJuIE5VTEwsIGNhbGwgcGFuaWMoKSBp
biB0aGlzIGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiBPc2FtYSBBYmRlbGthZGVyIDxvc2FtYS5hYmRl
bGthZGVyQGdtYWlsLmNvbT4KTGluazogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNDA0
MTg1NTIyLjIxNzY3LTEtb3NhbWEuYWJkZWxrYWRlckBnbWFpbC5jb20KU2lnbmVkLW9mZi1ieTog
UGF1bCBXYWxtc2xleSA8cGp3QGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmlu
IDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCgpMTE0gR2VuZXJhdGVkIGV4cGxhbmF0aW9ucywgbWF5
IGJlIGNvbXBsZXRlbHkgYm9ndXM6CgpUaGUgYnJhbmNoIGNoZWNrIGZpbmlzaGVkOiBgMmFiZDBk
YmE1NjI1NWAgKCJyaXNjdjogcGFuaWMgaWYgSVJRIGhhbmRsZXIKc3RhY2tzIGNhbm5vdCBiZSBh
bGxvY2F0ZWQiKSBpcyBvbiBgbWFzdGVyYCBhbmQgdGhlIGAtbmV4dGAgaW50ZWdyYXRpb24KYnJh
bmNoZXMsIGJ1dCBub3Qgb24gdGhlIGN1cnJlbnQgYHY2LjE4LjQ0YCBzdGFibGUgdHJlZS4gVGhh
dCBtYXRjaGVzCnRoZSBlYXJsaWVyICoqWUVTKiogYmFja3BvcnQgcmVjb21tZW5kYXRpb24g4oCU
IHRoZSBmaXggaXMgbWFpbmxpbmUtb25seQphbmQgc3RpbGwgbmVlZHMgdG8gYmUgY2hlcnJ5LXBp
Y2tlZCBpbnRvIDYuMTgueS4KCiBhcmNoL3Jpc2N2L2tlcm5lbC9pcnEuYyB8IDIyICsrKysrKysr
KysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2lycS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvaXJxLmMKaW5kZXggYjZhZjIwYmMzMDBmNS4uMDE3ZDQyZTc3OGJlNiAxMDA2NDQK
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaXJxLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvaXJx
LmMKQEAgLTc1LDI4ICs3NSwzNCBAQCBERUNMQVJFX1BFUl9DUFUodWxvbmcgKiwgaXJxX3NoYWRv
d19jYWxsX3N0YWNrX3B0cik7CiBERUZJTkVfUEVSX0NQVSh1bG9uZyAqLCBpcnFfc2hhZG93X2Nh
bGxfc3RhY2tfcHRyKTsKICNlbmRpZgogCi1zdGF0aWMgdm9pZCBpbml0X2lycV9zY3Modm9pZCkK
K3N0YXRpYyB2b2lkIF9faW5pdCBpbml0X2lycV9zY3Modm9pZCkKIHsKIAlpbnQgY3B1OworCXZv
aWQgKnM7CiAKIAlpZiAoIXNjc19pc19lbmFibGVkKCkpCiAJCXJldHVybjsKIAotCWZvcl9lYWNo
X3Bvc3NpYmxlX2NwdShjcHUpCi0JCXBlcl9jcHUoaXJxX3NoYWRvd19jYWxsX3N0YWNrX3B0ciwg
Y3B1KSA9Ci0JCQlzY3NfYWxsb2MoY3B1X3RvX25vZGUoY3B1KSk7CisJZm9yX2VhY2hfcG9zc2li
bGVfY3B1KGNwdSkgeworCQlzID0gc2NzX2FsbG9jKGNwdV90b19ub2RlKGNwdSkpOworCQlpZiAo
IXMpCisJCQlwYW5pYygiRmFpbGVkIHRvIGFsbG9jYXRlIElSUSBzaGFkb3cgY2FsbCBzdGFjayBy
ZXNvdXJjZXNcbiIpOworCQlwZXJfY3B1KGlycV9zaGFkb3dfY2FsbF9zdGFja19wdHIsIGNwdSkg
PSBzOworCX0KIH0KIAogREVGSU5FX1BFUl9DUFUodWxvbmcgKiwgaXJxX3N0YWNrX3B0cik7CiAK
ICNpZmRlZiBDT05GSUdfVk1BUF9TVEFDSwotc3RhdGljIHZvaWQgaW5pdF9pcnFfc3RhY2tzKHZv
aWQpCitzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9pcnFfc3RhY2tzKHZvaWQpCiB7CiAJaW50IGNw
dTsKIAl1bG9uZyAqcDsKIAogCWZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpIHsKIAkJcCA9IGFy
Y2hfYWxsb2Nfdm1hcF9zdGFjayhJUlFfU1RBQ0tfU0laRSwgY3B1X3RvX25vZGUoY3B1KSk7CisJ
CWlmICghcCkKKwkJCXBhbmljKCJGYWlsZWQgdG8gYWxsb2NhdGUgSVJRIHN0YWNrIHJlc291cmNl
c1xuIik7CiAJCXBlcl9jcHUoaXJxX3N0YWNrX3B0ciwgY3B1KSA9IHA7CiAJfQogfQpAQCAtMTA0
LDcgKzExMCw3IEBAIHN0YXRpYyB2b2lkIGluaXRfaXJxX3N0YWNrcyh2b2lkKQogLyogaXJxIHN0
YWNrIG9ubHkgbmVlZHMgdG8gYmUgMTYgYnl0ZSBhbGlnbmVkIC0gbm90IElSUV9TVEFDS19TSVpF
IGFsaWduZWQuICovCiBERUZJTkVfUEVSX0NQVV9BTElHTkVEKHVsb25nIFtJUlFfU1RBQ0tfU0la
RS9zaXplb2YodWxvbmcpXSwgaXJxX3N0YWNrKTsKIAotc3RhdGljIHZvaWQgaW5pdF9pcnFfc3Rh
Y2tzKHZvaWQpCitzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9pcnFfc3RhY2tzKHZvaWQpCiB7CiAJ
aW50IGNwdTsKIApAQCAtMTI5LDggKzEzNSw4IEBAIHZvaWQgZG9fc29mdGlycV9vd25fc3RhY2so
dm9pZCkKICNlbmRpZiAvKiBDT05GSUdfU09GVElSUV9PTl9PV05fU1RBQ0sgKi8KIAogI2Vsc2UK
LXN0YXRpYyB2b2lkIGluaXRfaXJxX3Njcyh2b2lkKSB7fQotc3RhdGljIHZvaWQgaW5pdF9pcnFf
c3RhY2tzKHZvaWQpIHt9CitzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9pcnFfc2NzKHZvaWQpIHt9
CitzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9pcnFfc3RhY2tzKHZvaWQpIHt9CiAjZW5kaWYgLyog
Q09ORklHX0lSUV9TVEFDS1MgKi8KIAogaW50IGFyY2hfc2hvd19pbnRlcnJ1cHRzKHN0cnVjdCBz
ZXFfZmlsZSAqcCwgaW50IHByZWMpCi0tIAoyLjUzLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
