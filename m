Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C06C77B7A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jun 2023 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZCPMpCoJFanVIaae84866yIedT8eOq2X5lEzyL2xVCA=; b=P1LlXVu6rea4sM
	oK45fOAlX2nbJ9Uakv7UqL1lq6nESawu1o08O9AXxZ52nGCa+oq7+qxrq7C7cfnGJywm+6eqPVpft
	uSq5ck7DGbUb9xKl/rzQuZnbYf/bj7Nsz6ugwBucdrNw4lQcaZPqjPGD65kE3AQTcdvkUsshnAs0e
	IcryWzA8/fZiU5SPfU6XbeBrBe77en5/b6JeshaQ0HCHpEXX5C3+9gu13asLJMgxMcsxEWFbtWAqO
	qihZYm7FozSsRsWO6DVtsgWj/LGTUo94yrRDh5wCxOe3Zho8ELXJ7KAHeRazUYxO5nRGFBoXtN7Tn
	ZxN6U6g7W7P0Gbd2UPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MGy-0093QJ-2f;
	Sat, 03 Jun 2023 08:06:04 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5MGv-0093Ot-2c
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jun 2023 08:06:03 +0000
X-QQ-mid: bizesmtp73t1685779549t2ig12j6
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 03 Jun 2023 16:05:48 +0800 (CST)
X-QQ-SSF: 00200000000000D0V000000A0000000
X-QQ-FEAT: 5CNn+SP0K2tsOionl/0qwFkto2mrob0OpN+vWURE2tYM65THhHtj71FAAGwF9
	OHfpVFQZWFWNg003NYWU3Fed3VjmEgjfH0VEiKfzoCC9x1lPpUpqjuPCBEQ9cwGb+kNx2uz
	8ODZZl0Vg7kpMG+4idFATFRnoD6xllszwiioL1IQZq3pJIjiEteOcwnQLkmLihMC8Ytr2ZQ
	Lzn60B7Gv+NrtWbnPlaedDpvBa9WjGx9avOWjpeM4bMz/256y4uPHB5E9Tjok94D2WBYBTC
	m4Be7XkPDi4Pup0R0s5A8AHaU8EkG6y+r9ZCTgb1kOD8bMbb0O+VVSUGpm7Dd+oVBHZP4VM
	1TIfWKoEdDYVJ4W7R2/hnRWOyFGos/MH4eqN9UbQfL2A6wCucm5MFDIzLdPDYAvtQq94QKf
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14226334804372199419
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v3 04/12] selftests/nolibc: fix up compile warning with glibc on x86_64
Date: Sat,  3 Jun 2023 16:05:30 +0800
Message-Id: <0626464891e7fc938e6f7a55f1f475f31fbc6f37.1685777982.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685777982.git.falcon@tinylab.org>
References: <cover.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_010602_144267_D33963B4 
X-CRM114-Status: GOOD (  11.50  )
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

Q29tcGlsaW5nIG5vbGliYy10ZXN0LmMgd2l0aCBnY2Mgb24geDg2XzY0IGdvdCBzdWNoIHdhcm5p
bmc6Cgp0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYzogSW4gZnVu
Y3Rpb24g4oCYZXhwZWN0X2Vx4oCZOgp0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9s
aWJjLXRlc3QuYzoxNzc6MjQ6IHdhcm5pbmc6IGZvcm1hdCDigJglbGxk4oCZIGV4cGVjdHMgYXJn
dW1lbnQgb2YgdHlwZSDigJhsb25nIGxvbmcgaW504oCZLCBidXQgYXJndW1lbnQgMiBoYXMgdHlw
ZSDigJh1aW50NjRfdOKAmSB7YWthIOKAmGxvbmcgdW5zaWduZWQgaW504oCZfSBbLVdmb3JtYXQ9
XQogIDE3NyB8ICBsbGVuICs9IHByaW50ZigiID0gJWxsZCAiLCBleHByKTsKICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgIH5+fl4gICAgfn5+fgogICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgICB8CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIHVpbnQ2NF90IHth
a2EgbG9uZyB1bnNpZ25lZCBpbnR9CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICBsb25n
IGxvbmcgaW50CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAlbGQKCkl0IGJlY2F1c2UgdGhh
dCBnbGliYyBkZWZpbmVzIHVpbnQ2NF90IGFzICJ1bnNpZ25lZCBsb25nIGludCIgd2hlbiB3b3Jk
CnNpemUgKG1lYW5zIHNpemVvZihsb25nKSkgaXMgNjRiaXQgKHNlZSBpbmNsdWRlL2JpdHMvdHlw
ZXMuaCksIGJ1dApub2xpYmMgZGlyZWN0bHkgdXNlIHRoZSA2NGJpdCAidW5zaWduZWQgbG9uZyBs
b25nIiAoc2VlCnRvb2xzL2luY2x1ZGUvbm9saWJjL3N0ZGludC5oKSwgd2hpY2ggaXMgc2ltcGxl
ciwgc2VlbXMga2VybmVsIHVzZXMgaXQKdG9vIChpbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvaW50
LWxsNjQuaCkuCgp1c2UgYSBzaW1wbGUgY29udmVyc2lvbiB0byBzb2x2ZSBpdC4KClN1Z2dlc3Rl
ZC1ieTogV2lsbHkgVGFycmVhdSA8d0Axd3QuZXU+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjMwNTI5MTMwNDQ5LkdBMjgxM0Axd3QuZXUvClNpZ25lZC1vZmYt
Ynk6IFpoYW5namluIFd1IDxmYWxjb25AdGlueWxhYi5vcmc+Ci0tLQogdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25v
bGliYy9ub2xpYmMtdGVzdC5jCmluZGV4IGQ0MTdjYTVkOTc2Zi4uNDAzZjYyNTVjMTc3IDEwMDY0
NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYworKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYwpAQCAtMTc0LDcg
KzE3NCw3IEBAIHN0YXRpYyBpbnQgZXhwZWN0X2VxKHVpbnQ2NF90IGV4cHIsIGludCBsbGVuLCB1
aW50NjRfdCB2YWwpCiB7CiAJaW50IHJldCA9ICEoZXhwciA9PSB2YWwpOwogCi0JbGxlbiArPSBw
cmludGYoIiA9ICVsbGQgIiwgZXhwcik7CisJbGxlbiArPSBwcmludGYoIiA9ICVsbGQgIiwgKGxv
bmcgbG9uZylleHByKTsKIAlwYWRfc3BjKGxsZW4sIDY0LCByZXQgPyAiW0ZBSUxdXG4iIDogIiBb
T0tdXG4iKTsKIAlyZXR1cm4gcmV0OwogfQotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
