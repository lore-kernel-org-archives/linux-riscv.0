Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685B7CCF9FE
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 07:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3xAOve+9CEmJPSxNkkruYYIKOGAm1l91cJMSOPBtnQg=; b=kW+q7yZ9Dkghdx
	pGMUf/HiiDJ2kO0fWe19XmlmI8jcIw4qTSLJ4/Fu615wkjPWYcrLjToSzU6QYgdxKiUi/6ZWqsu4r
	7E+MtFbUP27YjasmNzIhRgw+16O+pB1KSQ0U03z4/VvH+UQ3tg9n/g5yZ9x/JanajhD+ZNkb34Von
	r6Ti+HG0/l3Sy9BMMe7IQb/ppK0z/uHmkEqKogrPA2WQjeuktp6wWLVJ+RqLUkocZ0dd1RmvPwdWv
	sS6zDpRsy4Xwm05uN3IsWhl1D8sOoErf6X3AeS8RqwSBppt23xhtVktv65bfcZFaWH+KyFY15T6GL
	Lc3uOxQI//WAovAydNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFofC-00000009KeF-1BGx;
	Mon, 03 Nov 2025 07:07:38 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFof8-00000009KXX-3eeO
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 07:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762153590;
	bh=twT6UKR7uxSLBMBv7PcVYWWyZztV/iDvMv6ENH9b6WA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=d3LsbCOR76oDxMaFWjYox4PGdOc/XpVKtHm0y/bIUif435dA0ASEwTBZVR8ndedbc
	 hojETTZbvbEMTHhdJn6ANbmhFkAwYLQRaHt5+g7kOZhVkk9q7quPQm9ECADO/266El
	 c9gA6/w+8eycNLm8LIAAEItJx0Y3cXdINR3e08wQ=
X-QQ-mid: zesmtpgz3t1762153588t9f1f8e62
X-QQ-Originating-IP: R3B6rAZlOdUvAMM4kUW1Wx0B4GixrEUlUvZkXan5Hdo=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Nov 2025 15:06:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16909040105550240895
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 03 Nov 2025 15:06:24 +0800
Subject: [PATCH] i2c: spacemit: fix detect issue
MIME-Version: 1.0
Message-Id: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAG9UCGkC/x2MWwqAIBAAryL73YKPQukq0UfZVkthoRVBdPekz
 4GZeSBRZEpQiwciXZx4CxlUIcDPXZgIecgMWupKKWlw5BsXhQMd5A8cO17PSCh7I5321lhXQm7
 3SFn8v037vh+V0IcRZwAAAA==
X-Change-ID: 20251103-fix-k1-detect-failure-0b3082c73784
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762153586; l=2372;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=2vc8dJMZd6FC7filclH3xokq3Yh9OgHdz+OEBsr598U=;
 b=Hyn5Qog/ra3RKl96Owc8FFHtdNGYfk5j6NbnLXSzUgwqi6vdLL4hfMVZmP220fc8KIno7v+BK
 paqheZ1hV68DflWL+R6bhBmNQDzJZ+X/9Tzwg+ShRAuBnNRTNa5ibQK
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OW4JKxETGMY2QhaCakBTCB2YbsF7K2RIQJT/9qSLLx2hbcFan49fneMI
	1/bIsB+wtDzQz71c086X6JKQiUNHIyvP7mxVs8D7hpCFS2KEuA5vEPWF9xqmILxOGVDIWse
	j+cQ7jYD5Qz/t6pAuyTxxPzeGOgnI4iYn0bRrlVlsrk46WrVThMtHoDaJuDU1RV45nd68ZD
	HBhpPJ/q7WJtGnbWf21x6XXtujDMJNnulHly8EMe8m63Ff9RbGr2Inve/gQVDxkGqgO+/W/
	0o+4zwodSpLHyDCpx44b3fXLYt3CzzP6Ni61a7iigs5BUmVjtIrkZMke2TwTIxNkYV698Cb
	KZCtrCd271Edb60GERNc6IOXPS9gcJDqje4LLGFpFWnPSbDdZDyU0X2CQjG7710gpNe/Tlj
	BeQnLjxLGm7RqNNNtdvedt9gwnHg4ivP95GuETGx2qUerwFt5KQIO7ivVAvDyFPI9vKBNQg
	UokJR7sx8dhtvidabrJDE+ML3XfGvr3eRQfW4KrSQO9+otJlmLVZ4osHUvEGsdbET1/2Vyo
	K4j8M5z5n6sVMjbH/dBPneEnNGwB7XnNBJm6U7hh0gr4HrqWe1R1UNxFkt4O+2q1eSImeFV
	abINM7BU6wuqEJVbB0OLaFt9hzq+VlZRbehwaUsv2Tdr4zPbdiZGywtnfyHPa28bGJRMoGD
	fGJPiXkd7lER/VFowALipfvTvR6SauJXpCOevAY/OKIQ4BBNgaBoqMnS6yhmptYHyCpx0cs
	gizfrhLSTw5m6oFtjt+2PE0AgbdNun6mXuyYdoQ9Ey4s6IIfaYjeJTOnhe3WMJNgskg1D+q
	8fmbjaTzql06PdiViRkATVS09JaKiKZl4BdVhBl2D8B2w5hrtF1pB+pOgPE39yOwblAPTG8
	ihiJKmeyzmzwMUO16ftngwoZ0pfLvHOgH3g7TfTybnei3t/NIE1m4Kh7aLPsbYznG6ztmZs
	U7nxT+QpxdVV1SworCtJNUoSAsFDwgxAzy6SJz9QQLHgXz0vPuAAfIwvnW+Zq5zezs8Hptj
	JL7YyaQ0JgPH8Laqb5KG/7vnC/vWsezrXBB0lkC+qVuRvkKwg1RwzE/BFPQDGU4IGKCFGU6
	Km6kw4WUaM6XPSXAa898b4=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_230736_058285_865FE557 
X-CRM114-Status: GOOD (  12.61  )
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

VGhpcyBjb21taXQgYWRkcmVzc2VzIHR3byBpc3N1ZXMgY2F1c2luZyBpMmMgZGV0ZWN0IHRvIGZh
aWwuCgpUaGUgaWRlbnRpZmllZCBpc3N1ZXMgYXJlOgoKMS4gSW5jb3JyZWN0IGVycm9yIGhhbmRs
aW5nIGZvciBCRUQgKEJ1cyBFcnJvciBObyBBQ0svTkFLKToKICAgQmVmb3JlIHRoaXMgY29tbWl0
LCBCb3RoIEFMRCAoQXJiaXRyYXRpb24gTG9zcyBEZXRlY3RlZCkgYW5kCiAgIEJFRCByZXR1cm5l
ZCAtRUFHQUlOLgoyLiBNaXNzaW5nIGludGVycnVwdCBzdGF0dXMgY2xlYXIgYWZ0ZXIgaW5pdGlh
bGl6YXRpb24gaW4geGZlcigpOgogICBPbiB0aGUgSzEgU29DLCBzaW1wbHkgZml4aW5nIHRoZSBm
aXJzdCBpc3N1ZSBjaGFuZ2VkIHRoZSBlcnJvcgogICBmcm9tIC1FQUdBSU4gdG8gLUVUSU1FT1VU
LiBUaHJvdWdoIHRyYWNpbmcsIGl0IHdhcyBkZXRlcm1pbmVkIHRoYXQKICAgdGhpcyBpcyBsaWtl
bHkgZHVlIHRvIE1TRCAoTWFzdGVyIFN0b3AgRGV0ZWN0ZWQpIGxhdGVuY3kgaXNzdWVzLgoKICAg
VGhhdCBtZWFucyB0aGUgTVNEIGJpdCBpbiB0aGUgSVNSIG1heSBzdGlsbCBiZSBzZXQgb24gdGhl
IG5leHQgdHJhbnNmZXIuCiAgIEFzIGEgcmVzdWx0LCB0aGUgY29udHJvbGxlciB3b24ndCB3b3Jr
IOKAlCB3ZSBjYW4gc2VlIGZyb20gdGhlIHNjb3BlIHRoYXQKICAgaXQgZG9lc24ndCBpc3N1ZSBh
bnkgc2lnbmFsLgogICAoVGhpcyBvbmx5IG9jY3VycyBkdXJpbmcgcmFwaWQgY29uc2VjdXRpdmUg
STJDIHRyYW5zZmVycy4KICAgVGhhdCBleHBsYWlucyB3aHkgdGhlIGlzc3VlIG9ubHkgc2hvd3Mg
dXAgd2l0aCBpMmNkZXRlY3QuKQoKV2l0aCB0aGVzZSB0d28gZml4ZXMsIGkyYyBkZXZpY2UgZGV0
ZWN0aW9uIG5vdyBmdW5jdGlvbnMgY29ycmVjdGx5IG9uIHRoZSBLMSBTb0MuCgpGaXhlczogNWVh
NTU4NDczZmEzMSAoImkyYzogc3BhY2VtaXQ6IGFkZCBzdXBwb3J0IGZvciBTcGFjZW1pVCBLMSBT
b0MiKQpTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNw
YWNlbWl0LmNvbT4KLS0tCkkgY2hlY2tlZCB0aGUgdmVuZG9yIHZlcnNpb24gZHJpdmVyIGFuZCB0
cmllZCBjb21tZW50aW5nIG91dApzcGFjZW1pdF9pMmNfY2xlYXJfaW50X3N0YXR1cygpIHRoYXQg
cnVucyBiZWZvcmUgeGZlciBzdGFydHMuClN1cnByaXNpbmdseSwgaTJjZGV0ZWN0IHN0b3BwZWQg
d29ya2luZyBhcyB3ZWxsLgotLS0KIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtazEuYyB8IDUgKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWsxLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLWsxLmMKaW5kZXggNmI5MTg3NzBlNjEyZTA5OGI4YWQxNzQxOGY0MjBkODdjOTRkZjE2Ni4u
Mzc4MjgzMjMzMTc3NzBhZTJmMDUyMmQyMTNkY2E2NzM0MmFlMTY2ZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1rMS5jCisrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtazEu
YwpAQCAtMTYwLDcgKzE2MCw4IEBAIHN0YXRpYyBpbnQgc3BhY2VtaXRfaTJjX2hhbmRsZV9lcnIo
c3RydWN0IHNwYWNlbWl0X2kyY19kZXYgKmkyYykKIAogCWlmIChpMmMtPnN0YXR1cyAmIChTUEFD
RU1JVF9TUl9CRUQgfCBTUEFDRU1JVF9TUl9BTEQpKSB7CiAJCXNwYWNlbWl0X2kyY19yZXNldChp
MmMpOwotCQlyZXR1cm4gLUVBR0FJTjsKKwkJaWYgKGkyYy0+c3RhdHVzICYgU1BBQ0VNSVRfU1Jf
QUxEKQorCQkJcmV0dXJuIC1FQUdBSU47CiAJfQogCiAJcmV0dXJuIGkyYy0+c3RhdHVzICYgU1BB
Q0VNSVRfU1JfQUNLTkFLID8gLUVOWElPIDogLUVJTzsKQEAgLTQ5MSw2ICs0OTIsOCBAQCBzdGF0
aWMgaW50IHNwYWNlbWl0X2kyY194ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcHQsIHN0cnVj
dCBpMmNfbXNnICptc2dzLCBpbgogCiAJc3BhY2VtaXRfaTJjX2luaXQoaTJjKTsKIAorCXNwYWNl
bWl0X2kyY19jbGVhcl9pbnRfc3RhdHVzKGkyYywgU1BBQ0VNSVRfSTJDX0lOVF9TVEFUVVNfTUFT
Syk7CisKIAlzcGFjZW1pdF9pMmNfZW5hYmxlKGkyYyk7CiAKIAlyZXQgPSBzcGFjZW1pdF9pMmNf
d2FpdF9idXNfaWRsZShpMmMpOwoKLS0tCmJhc2UtY29tbWl0OiAzYTg2NjA4Nzg4MzlmYWFkYjRm
MWE2ZGQ3MmMzMTc5YzFkZjU2Nzg3CmNoYW5nZS1pZDogMjAyNTExMDMtZml4LWsxLWRldGVjdC1m
YWlsdXJlLTBiMzA4MmM3Mzc4NAoKQmVzdCByZWdhcmRzLAotLSAKVHJveSBNaXRjaGVsbCA8dHJv
eS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
