Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE62FC77B7F
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=th0y8+aRkWbx82IfNec1daVXiZ+6A+ZCJqIq/FRKlO4=; b=PDL9gwg8zhM3dR
	jZSge1DmHluoBDgxDIZt2eWmCPUXvvnnuWBTwN6fSev/dA2x/XuYaxbBP73qVZYqfNkBpnFxVaqJa
	SwkLO2KT1EtQEsEwSa+5yTQrkVi+e6S3NwD2EsMSzGH7Yqie5GVs2VW5M2o22qphX7s5mQXA+Y+P3
	jCQk/+jOeIpyAGc0epKCmrNrAun2GgjSXwIh50mfBmjLZ9XJAYgrAHecAbhoyXTiN89eIG24WaqA+
	HkhrbZqvtm+YuU53xyg6YzfAee76pKhbj/OHnOJ/HOLjlQ9ixqXJ12YbiyVaN4Shc+W06eq2NNT3r
	bayxCsk6AiORbzpGzOqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0LIo-001RKs-0w;
	Sat, 20 May 2023 12:03:14 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0LIk-001RJN-2I
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 12:03:12 +0000
X-QQ-mid: bizesmtp70t1684584176tjfoh9p1
Received: from linux-lab-host.localdomain ( [116.30.125.36])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 20 May 2023 20:02:55 +0800 (CST)
X-QQ-SSF: 00200000000000C0V000000A0000000
X-QQ-FEAT: +ynUkgUhZJnYh1ftKzhir2TdHIFgiWxK45RvD2Ho5QFMDZZkyhJO8CvAx2MHP
	YhLQ6ZN/Jk492lBH+9nt50cfKzTgRS9vo4o37eJwmTg97yBk96pAveZfLi1HZuFeWQh5fqZ
	pL7V++RPd3VykDkp7FEXf/AU1qigHxxY2jh7K8G7euu9cGL/h0WEZtPyW/6X9mMvXHgSKiZ
	Wk9ljR2Wpo4DU8UnqZ9r88XO/yazK+LoLhDGVEULeFEheGEMGtrjrbxLZZ5lvdRqa9/W949
	CuKa3UWi8eq0dtXcMYIgZ73t/4rPGRPZAqJY4D1ZHghi60JwK7jVSBlEZ/xABywLC8lSj8B
	h6aY3NZ2mHKaJWEaPAQeUn0OtVoGrTBVGw/MhYwngGISe4MvQ667iIh6zENDA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12071841425974536677
From: Zhangjin Wu <falcon@tinylab.org>
To: linux@weissschuh.net
Cc: aou@eecs.berkeley.edu,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	shuah@kernel.org,
	w@1wt.eu
Subject: [PATCH] selftests/nolibc: Fix up compile error for rv32
Date: Sat, 20 May 2023 20:02:53 +0800
Message-Id: <20230520120254.66315-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230520-nolibc-stackprotector-riscv-v1-1-d8912012a034@weissschuh.net>
References: <20230520-nolibc-stackprotector-riscv-v1-1-d8912012a034@weissschuh.net>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_050311_051225_0C45E9F3 
X-CRM114-Status: GOOD (  11.17  )
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

V2hlbiBjb21waWxlIG5vbGliYy10ZXN0LmMgZm9yIHJ2MzIsIHdlIGdvdCBzdWNoIGVycm9yOgoK
ICAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jOjU5OTo1Nzog
ZXJyb3I6IOKAmF9fTlJfZnN0YXTigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVu
Y3Rpb24pCiAgICAgIDU5OSB8ICAgQ0FTRV9URVNUKHN5c2NhbGxfYXJncyk7ICAgICAgRVhQRUNU
X1NZU0VSKDEsIHN5c2NhbGwoX19OUl9mc3RhdCwgMCwgTlVMTCksIC0xLCBFRkFVTFQpOyBicmVh
azsKClRoZSBnZW5lcmljIGluY2x1ZGUvdWFwaS9hc20tZ2VuZXJpYy91bmlzdGQuaCB1c2VkIGJ5
IHJ2MzIgZG9lc24ndApzdXBwb3J0IF9fTlJfZnN0YXQsIHVzaW5nIHRoZSBjb21tb24gX19OUl9y
ZWFkIGZ1bmN0aW9ucyBhcyBleHBlY3RlZC4KCiAgICBSdW5uaW5nIHRlc3QgJ3N5c2NhbGwnCiAg
ICA2OSBzeXNjYWxsX25vYXJncyA9IDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFtPS10KICAgIDcwIHN5c2NhbGxfYXJncyA9IC0xIEVCQURGICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgW09LXQoKQnR3LCB0aGUgbGF0ZXN0IHJpc2N2IGxp
YmM2LWRldiBwYWNrYWdlIGlzIHJlcXVpcmVkLCBvdGhlcndpc2UsIHdlIHdvdWxkCmFsc28gZ2V0
IHN1Y2ggZXJyb3I6CgogICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC91c3IvcmlzY3Y2NC1saW51
eC1nbnUvaW5jbHVkZS9zeXMvY2RlZnMuaDo0NTIsCiAgICAgICAgICAgICAgICAgICAgIGZyb20g
L3Vzci9yaXNjdjY0LWxpbnV4LWdudS9pbmNsdWRlL2ZlYXR1cmVzLmg6NDYxLAogICAgICAgICAg
ICAgICAgICAgICBmcm9tIC91c3IvcmlzY3Y2NC1saW51eC1nbnUvaW5jbHVkZS9iaXRzL2xpYmMt
aGVhZGVyLXN0YXJ0Lmg6MzMsCiAgICAgICAgICAgICAgICAgICAgIGZyb20gL3Vzci9yaXNjdjY0
LWxpbnV4LWdudS9pbmNsdWRlL2xpbWl0cy5oOjI2LAogICAgICAgICAgICAgICAgICAgICBmcm9t
IC91c3IvbGliL2djYy1jcm9zcy9yaXNjdjY0LWxpbnV4LWdudS85L2luY2x1ZGUvbGltaXRzLmg6
MTk0LAogICAgICAgICAgICAgICAgICAgICBmcm9tIC91c3IvbGliL2djYy1jcm9zcy9yaXNjdjY0
LWxpbnV4LWdudS85L2luY2x1ZGUvc3lzbGltaXRzLmg6NywKICAgICAgICAgICAgICAgICAgICAg
ZnJvbSAvdXNyL2xpYi9nY2MtY3Jvc3MvcmlzY3Y2NC1saW51eC1nbnUvOS9pbmNsdWRlL2xpbWl0
cy5oOjM0LAogICAgICAgICAgICAgICAgICAgICBmcm9tIC9sYWJzL2xpbnV4LWxhYi9zcmMvbGlu
dXgtc3RhYmxlL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jOjY6
CiAgICAvdXNyL3Jpc2N2NjQtbGludXgtZ251L2luY2x1ZGUvYml0cy93b3Jkc2l6ZS5oOjI4OjM6
IGVycm9yOiAjZXJyb3IgInJ2MzJpLWJhc2VkIHRhcmdldHMgYXJlIG5vdCBzdXBwb3J0ZWQiCiAg
ICAgICAyOCB8ICMgZXJyb3IgInJ2MzJpLWJhc2VkIHRhcmdldHMgYXJlIG5vdCBzdXBwb3J0ZWQi
CgpUaGUgZ2xpYmMgY29tbWl0IDViNjExM2Q2MmVmYSAoIlJJU0MtVjogU3VwcG9ydCB0aGUgMzIt
Yml0IEFCSQppbXBsZW1lbnRhdGlvbiIpIGZpeGVkIHVwIGFib3ZlIGVycm9yLCBzbywgZ2xpYmMg
Pj0gMi4zMyAod2hvIGluY2x1ZGVzCnRoaXMgY29tbWl0KSBpcyByZXF1aXJlZC4KClNpZ25lZC1v
ZmYtYnk6IFpoYW5namluIFd1IDxmYWxjb25AdGlueWxhYi5vcmc+Ci0tLQogdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L25vbGliYy9ub2xpYmMtdGVzdC5jCmluZGV4IDA2M2Y5OTU5YWM0NC4uZDhiNTljOGY2YzAzIDEw
MDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYwor
KysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYwpAQCAtNTk2
LDcgKzU5Niw3IEBAIGludCBydW5fc3lzY2FsbChpbnQgbWluLCBpbnQgbWF4KQogCQlDQVNFX1RF
U1Qod3JpdGVfYmFkZik7ICAgICAgICBFWFBFQ1RfU1lTRVIoMSwgd3JpdGUoLTEsICZ0bXAsIDEp
LCAtMSwgRUJBREYpOyBicmVhazsKIAkJQ0FTRV9URVNUKHdyaXRlX3plcm8pOyAgICAgICAgRVhQ
RUNUX1NZU1pSKDEsIHdyaXRlKDEsICZ0bXAsIDApKTsgYnJlYWs7CiAJCUNBU0VfVEVTVChzeXNj
YWxsX25vYXJncyk7ICAgIEVYUEVDVF9TWVNFUSgxLCBzeXNjYWxsKF9fTlJfZ2V0cGlkKSwgZ2V0
cGlkKCkpOyBicmVhazsKLQkJQ0FTRV9URVNUKHN5c2NhbGxfYXJncyk7ICAgICAgRVhQRUNUX1NZ
U0VSKDEsIHN5c2NhbGwoX19OUl9mc3RhdCwgMCwgTlVMTCksIC0xLCBFRkFVTFQpOyBicmVhazsK
KwkJQ0FTRV9URVNUKHN5c2NhbGxfYXJncyk7ICAgICAgRVhQRUNUX1NZU0VSKDEsIHN5c2NhbGwo
X19OUl9yZWFkLCAtMSwgJnRtcCwgMSksIC0xLCBFQkFERik7IGJyZWFrOwogCQljYXNlIF9fTElO
RV9fOgogCQkJcmV0dXJuIHJldDsgLyogbXVzdCBiZSBsYXN0ICovCiAJCS8qIG5vdGU6IGRvIG5v
dCBzZXQgYW55IGRlZmF1bHRzIHNvIGFzIHRvIHBlcm1pdCBob2xlcyBhYm92ZSAqLwotLSAKMi4y
NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
