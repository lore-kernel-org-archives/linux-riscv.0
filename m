Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E83C7EE29
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 12:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qq+dpGzsbQl+rC/4k2ZSugcrmJBlqRmySUl6X7EbZgc=; b=FGjWek0znnk1QD
	ApCx0bD5CiEtim823J5uvjWJ6oSstse7GdsDGH5B+ywAZPcH1+9OKXKX+lWgoLEliy5a6VXeIVbqX
	n51P9lyP3n2USIc7qxdhGyusLUh/adhyFAbt+eyTY3bGLyq3SbpmmRS7k70mqKJj45Or9kESD2wV4
	qGd3aIGstGT1Uq54CSHsca4fCRKlTu+n6ppGiR21tq2zgdvphR39w/Zt2ffyFI5fVFyp+WH0GgIA/
	Qy7OxKfD5O+yuSJlfpB9c6yE8d4bPfORcjXq/nXBcB8xl/whdo35w/PSgycls5RZxud+VHnKLpEmI
	Hk9pa6DFNuerhbCw2WeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cOn-00AVEm-2o;
	Mon, 29 May 2023 12:54:57 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cOl-00AVDl-0a
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 12:54:56 +0000
X-QQ-mid: bizesmtp68t1685364882tneg2x8d
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 May 2023 20:54:41 +0800 (CST)
X-QQ-SSF: 00200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3gSbqUlMdelesQfurP/ax7t3wqfS40b16enwTCNEPD74koH8ri3v
	vF1/Uz8gKhJ6aIWLWeHRJaW+NXsMZon13qE8WY3E+I9olyqaYkmE/3o+f9Qo69tCPQ3O7Km
	Gf35vAVg9cjJVDrHCf6H+AqcGzDVm6L7LVWfChGkYuLculAPsZPMArIO57GsYnjGLqa9Sd/
	CCtlm2mUDcbpjGPdMqU8kHPZ3JH+pXGX/8t9bq4Kc0mZQcjg9Pkf0nriZKmTV2M8Zouw0+f
	emeWCxZi7f6/d6vJKZOSmK6YtQqakQtMlESY48tTRDf4axguS6W+r8GKAl0bW2rejY+5Ck7
	KVPsUKt7pUAHOLUq2CAbKSK9kkHHUz8y+O4aTOT8PHK2TjG2mHsvijHKvl6Dw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11219330658314727703
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 1/7] selftests/nolibc: syscall_args: use generic __NR_statx
Date: Mon, 29 May 2023 20:54:39 +0800
Message-Id: <e291752517d42d10294d4c1975808d32420a003f.1685362482.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685362482.git.falcon@tinylab.org>
References: <cover.1685362482.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_055455_511753_7EC0A0C7 
X-CRM114-Status: GOOD (  12.13  )
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

Q29tcGlsaW5nIG5vbGliYy10ZXN0LmMgZm9yIHJ2MzIgZ290IHN1Y2ggZXJyb3I6CgogICAgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmM6NTk5OjU3OiBlcnJvcjog
4oCYX19OUl9mc3RhdOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikK
ICAgICAgNTk5IHwgICBDQVNFX1RFU1Qoc3lzY2FsbF9hcmdzKTsgICAgICBFWFBFQ1RfU1lTRVIo
MSwgc3lzY2FsbChfX05SX2ZzdGF0LCAwLCBOVUxMKSwgLTEsIEVGQVVMVCk7IGJyZWFrOwoKVGhl
IGdlbmVyaWMgaW5jbHVkZS91YXBpL2FzbS1nZW5lcmljL3VuaXN0ZC5oIHVzZWQgYnkgcnYzMiBk
b2Vzbid0CnN1cHBvcnQgX19OUl9mc3RhdCwgdXNlIHRoZSBtb3JlIGdlbmVyaWMgX19OUl9zdGF0
eCBpbnN0ZWFkOgoKICAgIFJ1bm5pbmcgdGVzdCAnc3lzY2FsbCcKICAgIDY5IHN5c2NhbGxfbm9h
cmdzID0gMSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgW09LXQog
ICAgNzAgc3lzY2FsbF9hcmdzID0gLTEgRUZBVUxUICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBbT0tdCgpfX05SX3N0YXR4IGhhcyBiZWVuIGFkZGVkIGZyb20gdjQuMTA6Cgog
ICAgYTUyOGQzNWU4YmZjICgic3RhdHg6IEFkZCBhIHN5c3RlbSBjYWxsIHRvIG1ha2UgZW5oYW5j
ZWQgZmlsZSBpbmZvIGF2YWlsYWJsZSIpCgpJdCBoYXMgYmVlbiBzdXBwb3J0ZWQgYnkgYWxsIG9m
IHRoZSBwbGF0Zm9ybXMgc2luY2UgYXQgbGVhc3QgZnJvbSB2NC4yMC4KCkZpeGVzOiA4ZTNhYjUy
OWJlZjkgKCJ0b29scy9ub2xpYmMvdW5pc3RkOiBhZGQgc3lzY2FsbCgpIikKU2lnbmVkLW9mZi1i
eTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9yZz4KLS0tCiB0b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9s
aWJjL25vbGliYy10ZXN0LmMKaW5kZXggN2RlNDYzMDVmNDE5Li5kNDE3Y2E1ZDk3NmYgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jCisrKyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jCkBAIC02MjEsNyAr
NjIxLDcgQEAgaW50IHJ1bl9zeXNjYWxsKGludCBtaW4sIGludCBtYXgpCiAJCUNBU0VfVEVTVCh3
cml0ZV9iYWRmKTsgICAgICAgIEVYUEVDVF9TWVNFUigxLCB3cml0ZSgtMSwgJnRtcCwgMSksIC0x
LCBFQkFERik7IGJyZWFrOwogCQlDQVNFX1RFU1Qod3JpdGVfemVybyk7ICAgICAgICBFWFBFQ1Rf
U1lTWlIoMSwgd3JpdGUoMSwgJnRtcCwgMCkpOyBicmVhazsKIAkJQ0FTRV9URVNUKHN5c2NhbGxf
bm9hcmdzKTsgICAgRVhQRUNUX1NZU0VRKDEsIHN5c2NhbGwoX19OUl9nZXRwaWQpLCBnZXRwaWQo
KSk7IGJyZWFrOwotCQlDQVNFX1RFU1Qoc3lzY2FsbF9hcmdzKTsgICAgICBFWFBFQ1RfU1lTRVIo
MSwgc3lzY2FsbChfX05SX2ZzdGF0LCAwLCBOVUxMKSwgLTEsIEVGQVVMVCk7IGJyZWFrOworCQlD
QVNFX1RFU1Qoc3lzY2FsbF9hcmdzKTsgICAgICBFWFBFQ1RfU1lTRVIoMSwgc3lzY2FsbChfX05S
X3N0YXR4LCAwLCBOVUxMLCAwLCAwLCBOVUxMKSwgLTEsIEVGQVVMVCk7IGJyZWFrOwogCQljYXNl
IF9fTElORV9fOgogCQkJcmV0dXJuIHJldDsgLyogbXVzdCBiZSBsYXN0ICovCiAJCS8qIG5vdGU6
IGRvIG5vdCBzZXQgYW55IGRlZmF1bHRzIHNvIGFzIHRvIHBlcm1pdCBob2xlcyBhYm92ZSAqLwot
LSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
