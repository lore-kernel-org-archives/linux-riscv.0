Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E33CC4453E
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 05:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxN9z1xNoH71sPcYIcpGQXdEdP/PhH5Y0MP5MBxMsQI=; b=LDcPuacLw8C6+z
	UnIASaKdONL8M/WwDAxALhPE/I9rEIFnKRKe1NAheDRET0EdwZhDtab6qv/OSk8IbNJio+yCB/eAL
	Iu4LCD3IK48xXhOOOpQAMKrnZz3kE2vWR19NvZY+GeTs8Ii9dNDHFOYHFUbZbhIsYh/mriIicxhYi
	/1xv+A4eIbQ/V1ocj2kdlIVJLeeUxcXNWHuS73BNn9O0F6GnbSBiPeIT7Z+ZMXZa+5kSdJlY0mgU4
	U8gteOOkgp/r1qLEPSw0ZEvLMOCwGyxMA5q0CaK5F7J6JDNlhnNhjjTWg5s1El9dfYR03ZKssLCpG
	X1kTWGXGn6A1y4ZdNDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmC4-0000000DUXI-2os9;
	Thu, 23 Jul 2026 05:42:04 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmBx-0000000DUTf-38mI
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 05:41:59 +0000
X-UUID: 2e9d4558865911f1aa26b74ffac11d73-20260723
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d549539a-596e-4b32-8d4f-e5554912d50c,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:28fd9810108bc453a4ed04c95b0e54a7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2e9d4558865911f1aa26b74ffac11d73-20260723
X-User: jiangfeng@kylinos.cn
Received: from [127.0.0.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 653154881; Thu, 23 Jul 2026 13:41:41 +0800
From: Feng Jiang <jiangfeng@kylinos.cn>
Date: Thu, 23 Jul 2026 05:41:33 +0000
Subject: [PATCH bpf-next v5 2/3] selftests/bpf: test timed may_goto
 preserves R0-R5
MIME-Version: 1.0
Message-Id: <20260723-riscv-bpf-timed-may-goto-v5-2-86acb54e5642@kylinos.cn>
References: <20260723-riscv-bpf-timed-may-goto-v5-0-86acb54e5642@kylinos.cn>
In-Reply-To: <20260723-riscv-bpf-timed-may-goto-v5-0-86acb54e5642@kylinos.cn>
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
X-CRM114-CacheID: sfid-20260722_224158_155372_9C0CC402 
X-CRM114-Status: UNSURE (   6.18  )
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
cy92ZXJpZmllcl9tYXlfZ290b18xLmMgICAgICB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX21heV9nb3RvXzEuYyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2JwZi9wcm9ncy92ZXJpZmllcl9tYXlfZ290b18xLmMKaW5kZXggNGJk
ZjQyNTZhNDFlLi5jYjFjZTRkMTNjZmMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2JwZi9wcm9ncy92ZXJpZmllcl9tYXlfZ290b18xLmMKKysrIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYnBmL3Byb2dzL3ZlcmlmaWVyX21heV9nb3RvXzEuYwpAQCAtMTA2LDQgKzEwNiw2
MiBAQCBfX25ha2VkIHZvaWQgbWF5X2dvdG9fYmF0Y2hfMih2b2lkKQogCTogX19jbG9iYmVyX2Fs
bCk7CiB9CiAKKy8qCisgKiBVc2UgYnBmX2dldF9wcmFuZG9tX3UzMigpIHRvIHByZXZlbnQgRENF
IGZyb20gcmVtb3ZpbmcgdGhlIGNoZWNrcy4KKyAqIHJldHZhbDogMD1hbGwgb2ssIDEtNj1SMC1S
NSBjbG9iYmVyZWQuCisgKi8KK1NFQygic3lzY2FsbCIpCitfX2Rlc2NyaXB0aW9uKCJ0aW1lZCBt
YXlfZ290byBwcmVzZXJ2ZXMgUjAtUjUiKQorX19hcmNoX3g4Nl82NAorX19hcmNoX3MzOTB4Citf
X2FyY2hfYXJtNjQKK19fYXJjaF9yaXNjdjY0CitfX3N1Y2Nlc3MKK19fcmV0dmFsKDApCitfX25h
a2VkIHZvaWQgdGltZWRfbWF5X2dvdG9fcHJlc2VydmVzX3JlZ3Modm9pZCkKK3sKKwlhc20gdm9s
YXRpbGUgKAorCSJjYWxsICVbYnBmX2dldF9wcmFuZG9tX3UzMl07IgorCSJyNiA9IHIwOyIKKwki
cjAgPSAweDExMTE7IgorCSJyMCArPSByNjsiCisJInIxID0gMHgyMjIyOyIKKwkicjEgKz0gcjY7
IgorCSJyMiA9IDB4MzMzMzsiCisJInIyICs9IHI2OyIKKwkicjMgPSAweDQ0NDQ7IgorCSJyMyAr
PSByNjsiCisJInI0ID0gMHg1NTU1OyIKKwkicjQgKz0gcjY7IgorCSJyNSA9IDB4NjY2NjsiCisJ
InI1ICs9IHI2OyIKKwkiLjhieXRlICVbbWF5X2dvdG9dOyIKKwkiLjhieXRlICVbbG9vcF07Igor
CSJyMCAtPSByNjsiCisJInIxIC09IHI2OyIKKwkicjIgLT0gcjY7IgorCSJyMyAtPSByNjsiCisJ
InI0IC09IHI2OyIKKwkicjUgLT0gcjY7IgorCSJpZiByMCAhPSAweDExMTEgZ290byAxZjsiCisJ
ImlmIHIxICE9IDB4MjIyMiBnb3RvIDJmOyIKKwkiaWYgcjIgIT0gMHgzMzMzIGdvdG8gM2Y7Igor
CSJpZiByMyAhPSAweDQ0NDQgZ290byA0ZjsiCisJImlmIHI0ICE9IDB4NTU1NSBnb3RvIDVmOyIK
KwkiaWYgcjUgIT0gMHg2NjY2IGdvdG8gNmY7IgorCSJyMCA9IDA7IgorCSJleGl0OyIKKwkiMTog
cjAgPSAxOyBleGl0OyIKKwkiMjogcjAgPSAyOyBleGl0OyIKKwkiMzogcjAgPSAzOyBleGl0OyIK
KwkiNDogcjAgPSA0OyBleGl0OyIKKwkiNTogcjAgPSA1OyBleGl0OyIKKwkiNjogcjAgPSA2OyBl
eGl0OyIKKwk6CisJOiBfX2ltbShicGZfZ2V0X3ByYW5kb21fdTMyKSwKKwkgIF9faW1tX2luc24o
bWF5X2dvdG8sIEJQRl9SQVdfSU5TTihCUEZfSk1QIHwgQlBGX0pDT05ELCAwLCAwLCAxLCAwKSks
CisJICBfX2ltbV9pbnNuKGxvb3AsIEJQRl9SQVdfSU5TTihCUEZfSk1QIHwgQlBGX0pBLCAwLCAw
LCAtMiwgMCkpCisJOiBfX2Nsb2JiZXJfYWxsKTsKK30KKwogY2hhciBfbGljZW5zZVtdIFNFQygi
bGljZW5zZSIpID0gIkdQTCI7CgotLSAKMi41My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
