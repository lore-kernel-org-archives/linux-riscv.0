Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D75EE7718B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/JX1acocSApomcApLdbH7thxutwZ0QUCMxuQj2FECA=; b=CrAgMOc5oI0c25
	GR6Wz/nimVxbWF6XmDcpR7JxeKP083SFeI7o1zMlvq6lnHiTb0LkIphAmj7GksH7pfY/jnx3Cjtkl
	AavinL2sKpxmQ/ZUVrxi2zw21F0eaqwxRT1Zit4Vs1Tv4FsfdXKn0bPP/UWjP7BfU8XfktxGvNB/p
	N0C1wdOjXtKhzXZ/M69ZnfcPs9OUlf35/Q3B7Nu39YIozy3Cf7otguqV63Wytf1N2V4kp7EcfNSJl
	Ab0Tgaci6kB/tH4X3YAp/cjYW61laX055KrP55xgHPV1z2Y8kPboYvtFyf+jzsjLxxE0hobNtisjJ
	lkRGHJmpigUJY7kmkqiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHlq-0000000A52K-28u7;
	Thu, 02 Jan 2025 09:45:38 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHiE-0000000A4RQ-2c4R
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 09:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1735810914; x=1767346914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4t8VRWBETfBHW77McqW8Ea3Z0LsArFzRtuIQqVimBZk=;
  b=QefntbNFoTMIVLmwm2L3V2iB0pdRSexSmt26g5YWZ5sOhrKJr+Zl6QHD
   FTkDPK9N5LFdotcVH8LlI8/fwBT43v2rtxuuqwjuNyEpLZJvpUcoHSD66
   OoLHolGtk1LdQ76MvKH/OZMjTyiHJwZQYOklnPKAk1giw6xeqMgY/zTKr
   cBbJ0h59eTA0Rxrw+Ye2lyn3EOKltOzuqQc4Toi+cMJRHwO03ubkccpy+
   Tu3mzqooD13uiEa9ARLzXDCeo7u4QIW3CaUa250SLBx/BD3D0JqXMKr17
   m9dAz6ysm4zgZkqf9v0yH9zcj4oXoWBqAXlDWfXNL3BD+5CaU4E4OoV6j
   A==;
X-CSE-ConnectionGUID: VQBwFtBaQ0CIO766q6Nz6A==
X-CSE-MsgGUID: 9W6C6IK4SLShnJkhWAx6zQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 11:41:48 +0200
X-CSE-ConnectionGUID: S5I1yFsdS8Ca0oSz2MxrJg==
X-CSE-MsgGUID: QJ+VloP1QfSYRflZblHiRg==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.6])
  by ces02_data.me-corp.lan with SMTP; 02 Jan 2025 11:41:46 +0200
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Thu, 02 Jan 2025 11:41:47 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH 2/2] irqchip/riscv-aplic: add support for hart indexes
Date: Thu,  2 Jan 2025 11:41:16 +0200
Message-ID: <20250102094116.3847894-3-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
References: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_014155_145731_4A72D017 
X-CRM114-Status: GOOD (  20.95  )
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

UmlzYy1WIEFQTElDIHNwZWNpZmljYXRpb24gZGVmaW5lcyAiaGFydCBpbmRleCIgaW4gWzFdOgoK
V2l0aGluIGEgZ2l2ZW4gaW50ZXJydXB0IGRvbWFpbiwgZWFjaCBvZiB0aGUgZG9tYWlu4oCZcyBo
YXJ0cyBoYXMgYQp1bmlxdWUgaW5kZXggbnVtYmVyIGluIHRoZSByYW5nZSAwIHRvIDIxNCDiiJIg
MSAoPSAxNiwzODMpLiBUaGUgaW5kZXgKbnVtYmVyIGEgZG9tYWluIGFzc29jaWF0ZXMgd2l0aCBh
IGhhcnQgbWF5IG9yIG1heSBub3QgaGF2ZSBhbnkKcmVsYXRpb25zaGlwIHRvIHRoZSB1bmlxdWUg
aGFydCBpZGVudGlmaWVyICjigJxoYXJ0IElE4oCdKSB0aGF0IHRoZQpSSVNDLVYgUHJpdmlsZWdl
ZCBBcmNoaXRlY3R1cmUgYXNzaWducyB0byB0aGUgaGFydC4gVHdvIGRpZmZlcmVudAppbnRlcnJ1
cHQgZG9tYWlucyBtYXkgZW1wbG95IGVudGlyZWx5IGRpZmZlcmVudCBpbmRleCBudW1iZXJzIGZv
cgp0aGUgc2FtZSBzZXQgb2YgaGFydHMuCgpTdXBwb3J0IGFyYml0cmFyeSBoYXJ0IGluZGV4ZXMg
c3BlY2lmaWVkIGluIG9wdGlvbmFsIEFQTElDIHByb3BlcnR5CiJyaXNjdixoYXJ0LWluZGV4IiB0
aGF0IHNob3VsZCBiZSBhcnJheSBvZiB1MzIgZWxlbWVudHMsIG9uZSBwZXIKaW50ZXJydXB0IHRh
cmdldC4gSWYgdGhpcyBwcm9wZXJ0eSBub3Qgc3BlY2lmaWVkLCBmYWxsYmFjayBpcyB0byB1c2UK
aGFydCBpZHMsIHdpdGggaGFydCBpbmRleCBmb3IgZWFjaCBBUExJQyB0byBiZSAoaGFydGlkIC0g
aGFydGlkMCkKd2hlcmUgaGFydGlkMCBpcyBoYXJ0IGlkIGZvciB0aGUgMS1zdCB0YXJnZXQuCgpb
MV06IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1haWEKClNpZ25lZC1vZmYtYnk6IFZs
YWRpbWlyIEtvbmRyYXRpZXYgPHZsYWRpbWlyLmtvbmRyYXRpZXZAbW9iaWxleWUuY29tPgotLS0K
IGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtZGlyZWN0LmMgfCAyNSArKysrKysrKysr
KysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtZGly
ZWN0LmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLWRpcmVjdC5jCmluZGV4IDdj
ZDZiNjQ2Nzc0Yi4uODBjODJlMzRlODk0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWFwbGljLWRpcmVjdC5jCisrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBs
aWMtZGlyZWN0LmMKQEAgLTIyMSwxMiArMjIxLDE1IEBAIHN0YXRpYyBpbnQgYXBsaWNfZGlyZWN0
X3BhcnNlX3BhcmVudF9od2lycShzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiBpbmRleCwKIAogaW50
IGFwbGljX2RpcmVjdF9zZXR1cChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqcmVn
cykKIHsKKwlzdGF0aWMgY29uc3QgY2hhciAqcHJvcF9oYXJ0X2luZGV4ID0gInJpc2N2LGhhcnQt
aW5kZXgiOwogCWludCBpLCBqLCByYywgY3B1LCBjdXJyZW50X2NwdSwgc2V0dXBfY291bnQgPSAw
OwogCXN0cnVjdCBhcGxpY19kaXJlY3QgKmRpcmVjdDsKIAlzdHJ1Y3QgaXJxX2RvbWFpbiAqZG9t
YWluOwogCXN0cnVjdCBhcGxpY19wcml2ICpwcml2OwogCXN0cnVjdCBhcGxpY19pZGMgKmlkYzsK
IAl1bnNpZ25lZCBsb25nIGhhcnRpZDsKKwl1bnNpZ25lZCBsb25nIGhhcnRpZDA7CisJdTMyICpo
YXJ0X2luZGV4ID0gTlVMTDsKIAl1MzIgdiwgaHdpcnE7CiAKIAlkaXJlY3QgPSBkZXZtX2t6YWxs
b2MoZGV2LCBzaXplb2YoKmRpcmVjdCksIEdGUF9LRVJORUwpOwpAQCAtMjQwLDYgKzI0MywyMiBA
QCBpbnQgYXBsaWNfZGlyZWN0X3NldHVwKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCBfX2lvbWVt
ICpyZWdzKQogCQlyZXR1cm4gcmM7CiAJfQogCisJcmMgPSBkZXZpY2VfcHJvcGVydHlfY291bnRf
dTMyKGRldiwgcHJvcF9oYXJ0X2luZGV4KTsKKwlpZiAocmMgPT0gLUVOT0RBVEEpCisJCXJjID0g
MDsKKwlpZiAocmMgPiAwICYmIHJjICE9IHByaXYtPm5yX2lkY3MpCisJCXJjID0gLUVPVkVSRkxP
VzsKKwlpZiAocmMgPiAwKSB7CisJCWhhcnRfaW5kZXggPSBkZXZtX2tjYWxsb2MoZGV2LCBwcml2
LT5ucl9pZGNzLCBzaXplb2YoKmhhcnRfaW5kZXgpLCBHRlBfS0VSTkVMKTsKKwkJaWYgKCFoYXJ0
X2luZGV4KQorCQkJcmV0dXJuIC1FTk9NRU07CisJCXJjID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRf
dTMyX2FycmF5KGRldiwgcHJvcF9oYXJ0X2luZGV4LAorCQkJCQkJICAgIGhhcnRfaW5kZXgsIHBy
aXYtPm5yX2lkY3MpOworCX0KKwlpZiAocmMgPCAwKSB7CisJCWRldl9lcnIoZGV2LCAiQVBMSUMg
cHJvcGVydHkgXCIlc1wiIGVycm9yICVwZVxuIiwgcHJvcF9oYXJ0X2luZGV4LCBFUlJfUFRSKHJj
KSk7CisJCXJldHVybiByYzsKKwl9CiAJLyogU2V0dXAgcGVyLUNQVSBJREMgYW5kIHRhcmdldCBD
UFUgbWFzayAqLwogCWN1cnJlbnRfY3B1ID0gZ2V0X2NwdSgpOwogCWZvciAoaSA9IDA7IGkgPCBw
cml2LT5ucl9pZGNzOyBpKyspIHsKQEAgLTI0OSw2ICsyNjgsOCBAQCBpbnQgYXBsaWNfZGlyZWN0
X3NldHVwKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCBfX2lvbWVtICpyZWdzKQogCQkJY29udGlu
dWU7CiAJCX0KIAorCQlpZiAoaSA9PSAwKQorCQkJaGFydGlkMCA9IGhhcnRpZDsKIAkJLyoKIAkJ
ICogU2tpcCBpbnRlcnJ1cHRzIG90aGVyIHRoYW4gZXh0ZXJuYWwgaW50ZXJydXB0cyBmb3IKIAkJ
ICogY3VycmVudCBwcml2aWxlZ2UgbGV2ZWwuCkBAIC0yNjUsOCArMjg2LDggQEAgaW50IGFwbGlj
X2RpcmVjdF9zZXR1cChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqcmVncykKIAkJ
Y3B1bWFza19zZXRfY3B1KGNwdSwgJmRpcmVjdC0+bG1hc2spOwogCiAJCWlkYyA9IHBlcl9jcHVf
cHRyKCZhcGxpY19pZGNzLCBjcHUpOwotCQlpZGMtPmhhcnRfaW5kZXggPSBpOwotCQlpZGMtPnJl
Z3MgPSBwcml2LT5yZWdzICsgQVBMSUNfSURDX0JBU0UgKyBpICogQVBMSUNfSURDX1NJWkU7CisJ
CWlkYy0+aGFydF9pbmRleCA9IGhhcnRfaW5kZXggPyBoYXJ0X2luZGV4W2ldIDogaGFydGlkIC0g
aGFydGlkMDsKKwkJaWRjLT5yZWdzID0gcHJpdi0+cmVncyArIEFQTElDX0lEQ19CQVNFICsgaWRj
LT5oYXJ0X2luZGV4ICogQVBMSUNfSURDX1NJWkU7CiAJCWlkYy0+ZGlyZWN0ID0gZGlyZWN0Owog
CiAJCWFwbGljX2lkY19zZXRfZGVsaXZlcnkoaWRjLCB0cnVlKTsKLS0gCjIuNDMuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
