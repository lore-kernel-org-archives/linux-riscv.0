Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7011061B28
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 01:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gqQvd572yydtHlw5u62igwzLUVffKIQUT1oWi9EJXS0=; b=KNG8Mxy4dmT9Zh
	/x6dzYA7/GXXwpcfqiAf/IBgXUK2HELGj3hYec4Wg/0HNj5seZa4VvMQXAytfDMk0MIJCg7lX/Lb3
	JLliJdTBRdN5Gy1bPjX3WnkHegrGctC9A1+ti02cwkghQ5mfOOQdAO/K3CHMZPiFwadRw/0qOV6Nl
	nyRMRLiyJo/4kO48ZjvUOIfLrUDzlAPoMiCk70HidXov7wUZfJ7hYWrXS06HQC/9afMOTp0kLm+iL
	M4y7gWRb6wmlFKJmcXxrqnbQmiWX5agY/iG9OyySf6tFI5S3YzAGPqGOaB7WdIu1OPkcPtorGKfGP
	lXbKHu9R1wXkBuhEzqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7NwQ-0000000C8P4-3puj;
	Tue, 31 Mar 2026 01:30:50 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7NwO-0000000C8Nr-12L3
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 01:30:49 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4fl9Y82hzwz4xNv3;
	Tue, 31 Mar 2026 09:30:36 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 62V1US0g037222;
	Tue, 31 Mar 2026 09:30:28 +0800 (+08)
	(envelope-from liu.xuemei1@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 31 Mar 2026 09:30:29 +0800 (CST)
X-Zmail-TransId: 2afb69cb23b5c32-faa93
X-Mailer: Zmail v1.0
Message-ID: <20260331093029749vRpdH-0qoEqjS0Wnn9M4x@zte.com.cn>
Date: Tue, 31 Mar 2026 09:30:29 +0800 (CST)
Mime-Version: 1.0
From: <liu.xuemei1@zte.com.cn>
To: <anup@brainfault.org>, <tglx@kernel.org>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <nick.hu@sifive.com>, <liujingqi@lanxincomputing.com>,
        <yongxuan.wang@sifive.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBpcnFjaGlwL3Jpc2N2LWFwbGljOiBSZXN0cmljdCBnZW5wZCBub3RpZmllciB0byBkZXZpY2UgdHJlZSBvbmx5?=
X-MAIL: mse-fl1.zte.com.cn 62V1US0g037222
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: liu.xuemei1@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Tue, 31 Mar 2026 09:30:36 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69CB23BC.000/4fl9Y82hzwz4xNv3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_183048_445101_F326906D 
X-CRM114-Status: GOOD (  11.40  )
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

RnJvbTogSmVzc2ljYSBMaXUgPGxpdS54dWVtZWkxQHp0ZS5jb20uY24+CgpPbiBBQ1BJIHN5c3Rl
bXMsIHRoZSBhcGxpYydzIHBtX2RvbWFpbiBpcyBzZXQgdG8KYWNwaV9nZW5lcmFsX3BtX2RvbWFp
biwgd2hpY2ggcHJvdmlkZXMgaXRzIG93biBwb3dlciBtYW5hZ2VtZW50CmNhbGxiYWNrcyAoZS5n
LiwgcnVudGltZV9zdXNwZW5kIHZpYSBhY3BpX3N1YnN5c19ydW50aW1lX3N1c3BlbmQpLgpUaGUg
YXBsaWNfcG1fYWRkKCkgdW5jb25kaXRpb25hbGx5IGNhbGxzIGRldl9wbV9nZW5wZF9hZGRfbm90
aWZpZXIoKQp3aGVuIGRldi0+cG1fZG9tYWluIGlzIG5vbuKAkU5VTEwsIGxlYWRpbmcgdG8gYSBj
b21wYXJpc29uIGJldHdlZW4KcnVudGltZV9zdXNwZW5kIGFuZCBnZW5wZF9ydW50aW1lX3N1c3Bl
bmQuIFRoaXMgcmVzdWx0cyBpbiB0aGUKZm9sbG93aW5nIGVycm9ycyB3aGVuIEFDUEkgaXMgZW5h
YmxlZDoKClsxLjIyMTQxNl0gcmlzY3YtYXBsaWMgUlNDVjAwMDI6MDA6IGZhaWxlZCB0byBjcmVh
dGUgQVBMSUMgY29udGV4dApbMS4yMjE5NzNdIHJpc2N2LWFwbGljIFJTQ1YwMDAyOjAwOiBlcnJv
ciAtRU5PREVWOiBmYWlsZWQgdG8gc2V0dXAgQVBMSUMgaW4gTVNJIG1vZGUKCkZpeCB0aGlzIGJ5
IGFkZGluZyBhIGNoZWNrIGZvciBkZXYtPm9mX25vZGUgYmVmb3JlIGFkZGluZyBvciByZW1vdmlu
Zwp0aGUgZ2VucGQgbm90aWZpZXIsIGVuc3VyaW5nIGl0IGlzIG9ubHkgdXNlZCBmb3IgZGV2aWNl
IHRyZWUgYmFzZWQKc3lzdGVtcy4KCkZpeGVzOiA5NWE4ZGRkZTM2NjAgKCJpcnFjaGlwL3Jpc2N2
LWFwbGljOiBQcmVzZXJ2ZSBBUExJQyBzdGF0ZXMgYWNyb3NzIHN1c3BlbmQvcmVzdW1lIikKU2ln
bmVkLW9mZi1ieTogSmVzc2ljYSBMaXUgPGxpdS54dWVtZWkxQHp0ZS5jb20uY24+Ci0tLQogZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJp
c2N2LWFwbGljLW1haW4uYyI6CmluZGV4IDlmNTM5NzliNjk2Mi4uZDlhZmI2YWU5OGNmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYworKysgYi9kcml2
ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYwpAQCAtMTUwLDcgKzE1MCw3IEBAIHN0
YXRpYyB2b2lkIGFwbGljX3BtX3JlbW92ZSh2b2lkICpkYXRhKQogCXN0cnVjdCBkZXZpY2UgKmRl
diA9IHByaXYtPmRldjsKCiAJbGlzdF9kZWwoJnByaXYtPmhlYWQpOwotCWlmIChkZXYtPnBtX2Rv
bWFpbikKKwlpZiAoZGV2LT5wbV9kb21haW4gJiYgZGV2LT5vZl9ub2RlKQogCQlkZXZfcG1fZ2Vu
cGRfcmVtb3ZlX25vdGlmaWVyKGRldik7CiB9CgpAQCAtMTY1LDcgKzE2NSw3IEBAIHN0YXRpYyBp
bnQgYXBsaWNfcG1fYWRkKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGFwbGljX3ByaXYgKnBy
aXYpCgogCXByaXYtPnNhdmVkX2h3X3JlZ3Muc3JjcyA9IHNyY3M7CiAJbGlzdF9hZGQoJnByaXYt
PmhlYWQsICZhcGxpY3MpOwotCWlmIChkZXYtPnBtX2RvbWFpbikgeworCWlmIChkZXYtPnBtX2Rv
bWFpbiAmJiBkZXYtPm9mX25vZGUpIHsKIAkJcHJpdi0+Z2VucGRfbmIubm90aWZpZXJfY2FsbCA9
IGFwbGljX3BtX25vdGlmaWVyOwogCQlyZXQgPSBkZXZfcG1fZ2VucGRfYWRkX25vdGlmaWVyKGRl
diwgJnByaXYtPmdlbnBkX25iKTsKIAkJaWYgKHJldCkKLS0gCjIuMjcuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
