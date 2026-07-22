Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9669FC4452D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 04:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jC192Q4fKcLvRJrCqJIo/xGI75nUAQ+Ihg+xS4ksVE=; b=mb8yydIa4ShLPz
	zyJ7khvBe0aq2WjKPwmeMFKKRTLmZLCJ3NjyuSL2RoyIkk7pkNGTtXUzYQG5ZEDGU2jCqBGXmvZ/6
	A0Ymr1dxZaGjt34tMBTUwvKdxldD7c3r7hesU0gv6/SGzttvRJHt1WKO3Ckso8/ThgcU/ZUxjdWvk
	jOXBJT/sFak9unAbosaG1/Cmb0VbzxNnY219idLVdxYeBSLrPWh2QnlRHON4kYtG+tePGu3pgyQR6
	MlDa9tCntN/oxQ6sajD313aQS1/QrynmrI/xFX9GhHbm6izq3KGMIFpvr3g8j9zpzIQ7nqOYJAZX2
	BUfsYr3ORgIHJ0wpxBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOTf-0000000AsV5-0BTg;
	Wed, 22 Jul 2026 04:22:39 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmOTY-0000000AsRa-244X
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 04:22:35 +0000
X-UUID: ee00001e858411f1aa26b74ffac11d73-20260722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:04bc7097-28d8-463e-bc6f-8cdbd283aaee,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:22ab38201f7b7bd866b0b3e1c80da476,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ee00001e858411f1aa26b74ffac11d73-20260722
X-User: jiangfeng@kylinos.cn
Received: from [127.0.0.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 88347879; Wed, 22 Jul 2026 12:22:20 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
Date: Wed, 22 Jul 2026 04:21:26 +0000
Subject: [PATCH bpf-next v4 2/3] selftests/bpf: test timed may_goto
 preserves R0-R5
MIME-Version: 1.0
Message-Id: <20260722-riscv-bpf-timed-may-goto-v4-2-e117e6337bc7@kylinos.cn>
References: <20260722-riscv-bpf-timed-may-goto-v4-0-e117e6337bc7@kylinos.cn>
In-Reply-To: <20260722-riscv-bpf-timed-may-goto-v4-0-e117e6337bc7@kylinos.cn>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson <luke.r.nels@gmail.com>, 
 Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Feng Jiang <jiangfeng@kylinos.cn>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_212232_850290_336B9CB3 
X-CRM114-Status: UNSURE (   6.47  )
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

QWRkIGEgdGVzdCB0aGF0IGNoZWNrcyBSMC1SNSBhcmUgcHJlc2VydmVkIGFjcm9zcwphcmNoX2Jw
Zl90aW1lZF9tYXlfZ290bygpIGNhbGxzLgoKVXNlIGJwZl9nZXRfcHJhbmRvbV91MzIoKSB0byBh
dm9pZCB0aGUgdmVyaWZpZXIgcmVtb3ZpbmcgdGhlIGNoZWNrcwp2aWEgRENFLgoKU3VnZ2VzdGVk
LWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBGZW5n
IEppYW5nIDxqaWFuZ2ZlbmdAa3lsaW5vcy5jbj4KLS0tCiAuLi4vc2VsZnRlc3RzL2JwZi9wcm9n
cy92ZXJpZmllcl9tYXlfZ290b18xLmMgICAgICB8IDU3ICsrKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX21heV9nb3RvXzEuYyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9tYXlfZ290b18xLmMKaW5kZXggNGJk
ZjQyNTZhNDFlLi45OGQ1OTEwOGQwOTcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2JwZi9wcm9ncy92ZXJpZmllcl9tYXlfZ290b18xLmMKKysrIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX21heV9nb3RvXzEuYwpAQCAtMTA2LDQgKzEwNiw2
MSBAQCBfX25ha2VkIHZvaWQgbWF5X2dvdG9fYmF0Y2hfMih2b2lkKQogCTogX19jbG9iYmVyX2Fs
bCk7CiB9CiAKKy8qCisgKiBVc2UgYnBmX2dldF9wcmFuZG9tX3UzMigpIHRvIHByZXZlbnQgRENF
IGZyb20gcmVtb3ZpbmcgdGhlIGNoZWNrcy4KKyAqIHJldHZhbDogMD1hbGwgb2ssIDEtNj1SMC1S
NSBjbG9iYmVyZWQuCisgKi8KK1NFQygicmF3X3RwIikKK19fZGVzY3JpcHRpb24oInRpbWVkIG1h
eV9nb3RvIHByZXNlcnZlcyBSMC1SNSIpCitfX2FyY2hfeDg2XzY0CitfX2FyY2hfYXJtNjQKK19f
YXJjaF9yaXNjdjY0CitfX3N1Y2Nlc3MKK19fcmV0dmFsKDApCitfX25ha2VkIHZvaWQgdGltZWRf
bWF5X2dvdG9fcHJlc2VydmVzX3JlZ3Modm9pZCkKK3sKKwlhc20gdm9sYXRpbGUgKAorCSJjYWxs
ICVbYnBmX2dldF9wcmFuZG9tX3UzMl07IgorCSJyNiA9IHIwOyIKKwkicjAgPSAweDExMTE7Igor
CSJyMCArPSByNjsiCisJInIxID0gMHgyMjIyOyIKKwkicjEgKz0gcjY7IgorCSJyMiA9IDB4MzMz
MzsiCisJInIyICs9IHI2OyIKKwkicjMgPSAweDQ0NDQ7IgorCSJyMyArPSByNjsiCisJInI0ID0g
MHg1NTU1OyIKKwkicjQgKz0gcjY7IgorCSJyNSA9IDB4NjY2NjsiCisJInI1ICs9IHI2OyIKKwki
LjhieXRlICVbbWF5X2dvdG9dOyIKKwkiLjhieXRlICVbbG9vcF07IgorCSJyMCAtPSByNjsiCisJ
InIxIC09IHI2OyIKKwkicjIgLT0gcjY7IgorCSJyMyAtPSByNjsiCisJInI0IC09IHI2OyIKKwki
cjUgLT0gcjY7IgorCSJpZiByMCAhPSAweDExMTEgZ290byAxZjsiCisJImlmIHIxICE9IDB4MjIy
MiBnb3RvIDJmOyIKKwkiaWYgcjIgIT0gMHgzMzMzIGdvdG8gM2Y7IgorCSJpZiByMyAhPSAweDQ0
NDQgZ290byA0ZjsiCisJImlmIHI0ICE9IDB4NTU1NSBnb3RvIDVmOyIKKwkiaWYgcjUgIT0gMHg2
NjY2IGdvdG8gNmY7IgorCSJyMCA9IDA7IgorCSJleGl0OyIKKwkiMTogcjAgPSAxOyBleGl0OyIK
KwkiMjogcjAgPSAyOyBleGl0OyIKKwkiMzogcjAgPSAzOyBleGl0OyIKKwkiNDogcjAgPSA0OyBl
eGl0OyIKKwkiNTogcjAgPSA1OyBleGl0OyIKKwkiNjogcjAgPSA2OyBleGl0OyIKKwk6CisJOiBf
X2ltbShicGZfZ2V0X3ByYW5kb21fdTMyKSwKKwkgIF9faW1tX2luc24obWF5X2dvdG8sIEJQRl9S
QVdfSU5TTihCUEZfSk1QIHwgQlBGX0pDT05ELCAwLCAwLCAxLCAwKSksCisJICBfX2ltbV9pbnNu
KGxvb3AsIEJQRl9SQVdfSU5TTihCUEZfSk1QIHwgQlBGX0pBLCAwLCAwLCAtMiwgMCkpCisJOiBf
X2Nsb2JiZXJfYWxsKTsKK30KKwogY2hhciBfbGljZW5zZVtdIFNFQygibGljZW5zZSIpID0gIkdQ
TCI7CgotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
