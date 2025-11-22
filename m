Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DA5CFC52A
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Nov 2025 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Xcq25zTWq+KABjupE06fFH1bCUc5vehEtMjjn1ysTp8=; b=ii0
	X6UvjwA7UKWlq/g5bGum6xTeqWTEU4HQvAIQoqeupcbZiUF/yQmkfBdJnR+T2i07SAT9IM9e0C35V
	ks24i+kPo1fsxU/5EYObazwq6Ofd70XxJzo40WMACCnJ0dENtQgTcNUyXKLSEC9oHJUtFI4dMzy0a
	72FUhmBuvpfL1xcA+i7bXN0GBI/gszhderc+L0wK+1SUHeKuetslVlefiRYucCDLq9Hnkhj1z1Rhe
	m/iGYj6HvnfBrODOz0RY2EZ7Kr4iJSt9Hkwvok75QPYI239Q1lY4KbvvOfsHCom1nItaEGyMQNOcG
	MCDXPmVVWrDK9QcotTPp+fgymkgBbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMmaT-00000009XwO-1yjH;
	Sat, 22 Nov 2025 12:19:33 +0000
Received: from exactco.de ([176.9.10.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMmaR-00000009Xvq-1Kpl
	for linux-riscv@lists.infradead.org;
	Sat, 22 Nov 2025 12:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=g2QzPOiMHKyEMeM+Ind39UB+URl5PXtA5R6Z7/DlsQk=; b=M
	u1SkRzYx2xVTPWFxtqCO4sCtc9WyqsKdgCUDlJjHaoUyd2TrL0BmKGDMDtV/Sc7/63nEqgKNFqiGE
	L2cF2VXcBu/hjhx5b070wkzw7nYze17qxujmLekEPzJ7rZAn0O+SdJBct++KnzLuvoEvMdtu90wbA
	2ScKYfmfocxYWPknqPY9T11Yi7m1YUUPfx2wn3dYT33j3P0gPpZAL0FiRt/FyOByiyga3SCehr2cC
	0AuEE7XYrT/lDpjrW9ktxyIb0D9GZpNVwFOmtYo+ry1LtSLPFIRWbeUP2k2s43yb/9MI+wNyxlqSm
	sXkzCqv94FibtAa4Q83WspX8Ts2drTHpA==;
Date: Sat, 22 Nov 2025 13:19:40 +0100 (CET)
Message-Id: <20251122.131940.192031134976081316.rene@exactco.de>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>, Samuel Holland
 <samuel.holland@sifive.com>
Subject: [PATCH] riscv: dts: sifive: unmatched: Add PWM controlled fans
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_041931_671712_4C90E269 
X-CRM114-Status: UNSURE (   5.55  )
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

VGhpcyBhZGRzIHRoZSB0d28gUFdNLWNvbnRyb2xsZWQgZmFucyBvZiB0aGUgSGlGaXZlIFVubWF0
Y2hlZCBib2FyZCB0bwp0aGUgZGV2aWNlIHRyZWUuCgpTaWduZWQtb2ZmLWJ5OiBSZW7DqSBSZWJl
IDxyZW5lQGV4YWN0Y28uZGU+Ci0tLQpUZXN0ZWQgb24gU2lGaXZlIEhpRml2ZSBVbm1hdGNoZWQg
QTAwIHJ1bm5pbmcgVDIvTGludXguCi0tLQogYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlm
aXZlLXVubWF0Y2hlZC1hMDAuZHRzIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9o
aWZpdmUtdW5tYXRjaGVkLWEwMC5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZp
dmUtdW5tYXRjaGVkLWEwMC5kdHMKaW5kZXggMDNjZTJjZWU0ZTk3Li44NTBmYTFkMjViZTcgMTAw
NjQ0Ci0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAw
LmR0cworKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5tYXRjaGVkLWEw
MC5kdHMKQEAgLTQ3LDYgKzQ3LDE2IEBAIGdwaW8tcG93ZXJvZmYgewogCQlncGlvcyA9IDwmZ3Bp
byAyIEdQSU9fQUNUSVZFX0xPVz47CiAJfTsKIAorCWZhbjEgeworCQljb21wYXRpYmxlID0gInB3
bS1mYW4iOworCQlwd21zID0gPCZwd20xIDIgNzgxMjUwMCAwPjsKKwl9OworCisJZmFuMiB7CisJ
CWNvbXBhdGlibGUgPSAicHdtLWZhbiI7CisJCXB3bXMgPSA8JnB3bTEgMyA3ODEyNTAwIDA+Owor
CX07CisKIAlsZWQtY29udHJvbGxlci0xIHsKIAkJY29tcGF0aWJsZSA9ICJwd20tbGVkcyI7CiAK
LS0gCjIuNDYuMAoKCi0tIApSZW7DqSBSZWJlLCBFeGFjdENPREUgR21iSCwgQmVybGluLCBHZXJt
YW55Cmh0dHBzOi8vZXhhY3Rjby5kZSDigKIgaHR0cHM6Ly90MmxpbnV4LmNvbSDigKIgaHR0cHM6
Ly9wYXRyZW9uLmNvbS9yZW5lcmViZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
