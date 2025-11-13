Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F99CCD4F2F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/L8y6LV1rjNu4W0XhSSmQf6NhTHNcc7w6TUD/cEW0jo=; b=eKB7k3LpYxuDqU
	gXA5j4ejx4swWQBvHqNkzmAj3hWTgxKAeIXUfnJ3SteilOrCKQjmLQ8AaQF1ox7h61UsO4GhRILkt
	MvxKhiL79aSKypygOAV4Ih8IHUneQHcZKuE78fllfI07n9/pyi2E33fHFGZrRHVV6nDmj/+raxN0q
	RG2wlYH8sZKLNEWYMXpHGNmfAw2rq1Z4UvZ2bK8nB3zzMhX3ynBDXz0TUu4yIoZFmcbWT12xo0bnU
	zMQJZhVqhcYSXs6JrdTfqxCH9ioer961YSxO6Mkzknqr+iPIP6d3g3oijuLjpYFwO8NCnwRoemQZU
	ezsHUbGy9yrcKrdfmP7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXIc-0000000AXCK-1wyV;
	Thu, 13 Nov 2025 13:23:42 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJXIY-0000000AXBI-02iU
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 13:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763040129;
	bh=iiQHeHD/K/spNsUBdxVuSJcnkwG9NvxKtgVBuXpJ5UA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=VSLxr6KFFOhXnCD61Lo1g/KdAmhdIrkadD3MiXist87pOW2cvdUhqM4T97vvLYuz+
	 bYtwPQOtHCFPQVE3mI+G3wfPTqEHHh8TN2s8u/6slkes/0nYUi5TdySO+IKXHKXXmk
	 AgzEdzrVy0EZt6heri3VMFPd8IxDMRX5U60JxaW8=
X-QQ-mid: zesmtpip3t1763040119tba5b044c
X-QQ-Originating-IP: WSzQyCAMDRB+Hc9NMdMMaxfI+JAuDSF0OGMd4+PLci0=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 13 Nov 2025 21:21:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8025135946155333244
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 13 Nov 2025 21:21:50 +0800
Subject: [PATCH v2] i2c: spacemit: fix detect issue
MIME-Version: 1.0
Message-Id: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAG3bFWkC/3XMywqDMBCF4VeRWXfE8U5XvkfpIiZjHapGkiiC+
 O4NXXXT5Q/nfCd4dsIe7skJjnfxYpcY+S0BParlxSgmNuRZXhFRgYMc+CY0HFgHHJRMm2Osi7I
 tuKyobnuI39VxHH7dxzP24OyMYXSsfrTsn7YTEvZ91qjWNIYb3U2ybEfqV6V5lpBqO8N1fQCli
 VWMvQAAAA==
X-Change-ID: 20251113-fix-k1-detect-failure-63483e45168b
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763040115; l=3381;
 i=troy.mitchell@linux.spacemit.com; s=20250712; h=from:subject:message-id;
 bh=/a60LCG9PrF70ChplJbx/syVHIICzDVRIa3uNVVUQus=;
 b=DM8fHhZFeWQXvqw7nbmlAsyJlUSjCgsIBu/safkH52iUImXXhZH5f3ebQmsasy+Mthz7ir5FA
 tbmrLiWBoRhDZuGZCUJSXXktiIPpOq6lUSbKg5fd75d2sYjDV33dgft
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=zhRP1xE0bftrurqSWI+SzcSdJGIZ0BTTY9Id0ESzqlI=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NCMb4wasipbGbqoHIyEbzxZ4qZVClhsnRcSodWTTvyZc7Dj3SX8Mx9gL
	Xj1tMAuJZtpwAFUJccUmc8TL8DstggYJn6TVgP5UWHHVQJNPDuMiYt5VCzzmdyky8CeHRXM
	hcugu67WB8Ey5AAh2gwXStczaVh2C4QEclDpZZO0PufCpvxrJVY5DjPE//DJFAidjF5g0rG
	8L/UGIaDJClytMoyfmq2whIHbfbugYOP/bfkaZrj3ktSHeHQ6Mj2W2NSt3Ub/xT1ksoNeqG
	PX+5szexPebvyBnP5IOJLDFBoOg2TzCHPndCKqI6hETYb87laynjSt2dPIIYy762ilumhZr
	YfVuuxfd5oE+upn4hBSaJXr4qd6wkuQJYAQxrKSZwI+4wot9ficKUotlZmvX6DFSkKYMHYq
	C+b25c0RkW6ZDFh4et6sitgoMlQ3jPTfZeoKNbtEireoj9HhmZ8AXqC/zeJ0Hf6mnI9JE7V
	7mHzZ95QHjbCIjjlK0k80EiuMEjT0QqKolFzLYgHoeAo9Sig/xER9OTz8hj3UnkLMdwUB+9
	rE5Rbezb6HD7GqfXPTSY8pbNCTJU5dwAOZKF1aOjXQFwerBRqY6zjR+cu4zI53MCYV5rsa7
	aH5dgQZFLq+OMXG+qKVXAdQrS5muB7eiPTJX6g8Efo2eigXXONi3NkbaOR6SQHxQ0apInzy
	mhd3RD7OxYnGVqrT/HpnC2sdiXuSAnfyF4MC0mMUTVmvym0oai8Ky2xsxacigO9avD7qQZf
	Fz8tUEc4PAL1HsQ92uqWFDKyUDlpTaGwFhxPN+QbbuWWIiEAF0EiHLPprgwhAobL2ZKMqZa
	N2Mjw0fXWl9r1vSn0qE/KKJaAP3DCM7e55TRQLntsbOApBEk3Rtxr3SLR4etEH1nA/iOsvO
	CQkpeE1p0jaOMZg77i9gft0jK0ZmwzHR9+d2CKrXUpJhRBJMGYGUdKum3CpEBqcJD0qBfX+
	yUWkQfiiqkI14IXA7URh90YStSqWC9E4FIBaQ9pH3gVdlwA61Vb5ITcV9WFxOfvki/z5lnS
	BlnMDORJWKCKL+iW+iuXeCIoU3GoiBk7XOchsEs7HvHaLL+Xvmp7Us0sjJ0QXE7DSwdIiif
	LTfA6IzXiE0xulVo2LmSabasKKsBp2gaTShFVMRfqQIHcxV/3qBbvwbAaQy3naT2B60qZma
	pjVPHyEMFvlgXDWXK+4YbnMWbBHs9bjCjuoJ
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_052339_102407_8A1D6DF6 
X-CRM114-Status: GOOD (  12.54  )
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
b0MiKQpUZXN0ZWQtYnk6IEF1cmVsaWVuIEphcm5vIDxhdXJlbGllbkBhdXJlbDMyLm5ldD4KU2ln
bmVkLW9mZi1ieTogVHJveSBNaXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5j
b20+Ci0tLQpDaGFuZ2Vsb2cgaW4gdjI6Ci0gaGFuZGxlIEFMRCBhbmQgQkVEIGVycm9ycyBzZXBh
cmF0ZWx5IGluIHNwYWNlbWl0X2kyY19oYW5kbGVfZXJyKCkKLSBtb3ZlIGNsZWFyX2ludF9zdGF0
dXMoKSBhYm92ZSBzcGFjZW1pdF9pMmNfaW5pdCgpCi0gbW92ZSBjbGVhcl9pbnRfc3RhdHVzKCkg
ZnJvbSB4ZmVyKCkgaW50byBzcGFjZW1pdF9pMmNfaW5pdCgpCi0gTGluayB0byB2MTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUxMTAzLWZpeC1rMS1kZXRlY3QtZmFpbHVyZS12MS0x
LWJiMDdhOGQ3ZGU3Y0BsaW51eC5zcGFjZW1pdC5jb20vCi0tLQogZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1rMS5jIHwgMTkgKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVz
c2VzL2kyYy1rMS5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1rMS5jCmluZGV4IDZiOTE4Nzcw
ZTYxMmUwOThiOGFkMTc0MThmNDIwZDg3Yzk0ZGYxNjYuLmQ0MmMwM2VmNWRiNTk4NGVhOGUwNmIz
ZDdlYjQ4NWI0Zjg5OWU2MTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtazEu
YworKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWsxLmMKQEAgLTE1OCwxMSArMTU4LDE2IEBA
IHN0YXRpYyBpbnQgc3BhY2VtaXRfaTJjX2hhbmRsZV9lcnIoc3RydWN0IHNwYWNlbWl0X2kyY19k
ZXYgKmkyYykKIHsKIAlkZXZfZGJnKGkyYy0+ZGV2LCAiaTJjIGVycm9yIHN0YXR1czogMHglMDh4
XG4iLCBpMmMtPnN0YXR1cyk7CiAKLQlpZiAoaTJjLT5zdGF0dXMgJiAoU1BBQ0VNSVRfU1JfQkVE
IHwgU1BBQ0VNSVRfU1JfQUxEKSkgeworCS8qIEFyYml0cmF0aW9uIExvc3MgRGV0ZWN0ZWQgKi8K
KwlpZiAoaTJjLT5zdGF0dXMgJiBTUEFDRU1JVF9TUl9BTEQpIHsKIAkJc3BhY2VtaXRfaTJjX3Jl
c2V0KGkyYyk7CiAJCXJldHVybiAtRUFHQUlOOwogCX0KIAorCS8qIEJ1cyBFcnJvciBObyBBQ0sv
TkFLICovCisJaWYgKGkyYy0+c3RhdHVzICYgU1BBQ0VNSVRfU1JfQkVEKQorCQlzcGFjZW1pdF9p
MmNfcmVzZXQoaTJjKTsKKwogCXJldHVybiBpMmMtPnN0YXR1cyAmIFNQQUNFTUlUX1NSX0FDS05B
SyA/IC1FTlhJTyA6IC1FSU87CiB9CiAKQEAgLTIyNCw2ICsyMjksMTIgQEAgc3RhdGljIHZvaWQg
c3BhY2VtaXRfaTJjX2NoZWNrX2J1c19yZWxlYXNlKHN0cnVjdCBzcGFjZW1pdF9pMmNfZGV2ICpp
MmMpCiAJfQogfQogCitzdGF0aWMgaW5saW5lIHZvaWQKK3NwYWNlbWl0X2kyY19jbGVhcl9pbnRf
c3RhdHVzKHN0cnVjdCBzcGFjZW1pdF9pMmNfZGV2ICppMmMsIHUzMiBtYXNrKQoreworCXdyaXRl
bChtYXNrICYgU1BBQ0VNSVRfSTJDX0lOVF9TVEFUVVNfTUFTSywgaTJjLT5iYXNlICsgU1BBQ0VN
SVRfSVNSKTsKK30KKwogc3RhdGljIHZvaWQgc3BhY2VtaXRfaTJjX2luaXQoc3RydWN0IHNwYWNl
bWl0X2kyY19kZXYgKmkyYykKIHsKIAl1MzIgdmFsOwpAQCAtMjY3LDEyICsyNzgsOCBAQCBzdGF0
aWMgdm9pZCBzcGFjZW1pdF9pMmNfaW5pdChzdHJ1Y3Qgc3BhY2VtaXRfaTJjX2RldiAqaTJjKQog
CXZhbCA9IHJlYWRsKGkyYy0+YmFzZSArIFNQQUNFTUlUX0lSQ1IpOwogCXZhbCB8PSBTUEFDRU1J
VF9SQ1JfU0RBX0dMSVRDSF9OT0ZJWDsKIAl3cml0ZWwodmFsLCBpMmMtPmJhc2UgKyBTUEFDRU1J
VF9JUkNSKTsKLX0KIAotc3RhdGljIGlubGluZSB2b2lkCi1zcGFjZW1pdF9pMmNfY2xlYXJfaW50
X3N0YXR1cyhzdHJ1Y3Qgc3BhY2VtaXRfaTJjX2RldiAqaTJjLCB1MzIgbWFzaykKLXsKLQl3cml0
ZWwobWFzayAmIFNQQUNFTUlUX0kyQ19JTlRfU1RBVFVTX01BU0ssIGkyYy0+YmFzZSArIFNQQUNF
TUlUX0lTUik7CisJc3BhY2VtaXRfaTJjX2NsZWFyX2ludF9zdGF0dXMoaTJjLCBTUEFDRU1JVF9J
MkNfSU5UX1NUQVRVU19NQVNLKTsKIH0KIAogc3RhdGljIHZvaWQgc3BhY2VtaXRfaTJjX3N0YXJ0
KHN0cnVjdCBzcGFjZW1pdF9pMmNfZGV2ICppMmMpCgotLS0KYmFzZS1jb21taXQ6IDZmYTkwNDFi
NzE3N2Y2NzcxODE3Yjk1ZTgzZjZkZjE3YjE0N2M4YzYKY2hhbmdlLWlkOiAyMDI1MTExMy1maXgt
azEtZGV0ZWN0LWZhaWx1cmUtNjM0ODNlNDUxNjhiCgpCZXN0IHJlZ2FyZHMsCi0tIApUcm95IE1p
dGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
