Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBA6C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 11:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1C2ag+UVkiRCJfSPH+LAnENaxVVFhaiKG8iEf52vcqc=; b=JtW3t2ZkYGPRuW
	c8tomTIwcqH62wtMau9JPYwo6wQQSycZo6IyYtLlswQtf6NKMTt+Nc13F9UOLxD/nQvlw1bpL63V3
	XMvRSehRt79fVOKMYQZOf/QkJqoGteVm+px/GTUdIX/U1H5rNsLl586LMCBZ9tkJqf6jMlK3Pz9vy
	ycX2Lchg2cb89+Jz6tm0Pb2in2gjOUqumYKodEeMiobD6kRP8x98Xpp2rvSKCcTP1B1CldvUtb1MT
	EWGAGXSo2hSzvLj6vCFMwW7p+doViWWmL5oP+wOaCsUN8JbbcoPSOvJBPy1JMByZsMwVWSrSAkLxs
	A2UR3Cq/SHPioDl7XzAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Nzb-0000000HKoG-0GWC;
	Tue, 21 May 2024 11:49:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NzX-0000000HKkc-47z8
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 11:49:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9F1EACE0FAA;
	Tue, 21 May 2024 11:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C0EC4AF09;
	Tue, 21 May 2024 11:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716292151;
	bh=zdSV3EpJ/CKXjaWQ8/cD0+JOT+VH5rhvpIEde4YPaWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QP7xHTIroKWAL1koAwZ6jjCgJLvRHG023RGth9xuUk2aAr6xVwWVLbscARU+Pv1ub
	 rE7DpLmED0b0CVDykMK6Zx+Q7jnCMVy2PLYf754MVZMJIdV0GVpwGIlm3I3gUCQ0Q6
	 2H95BXA0It8CFEHUA2Cu/eAEMYUpIeaDtiemAskbUWoLdUlQdP1W1YSYtVV7ha1mAp
	 T00CEcLQ7pEpSb3jAdqZceJbTnCXDIJ0KCDyF2nAHBRoyXITau6AkUfMqaNoMFbKQN
	 QACCVo7OV9T3gy3HBJuXXKgSubA2i3XC1J2EvODkvPbaXRZ/G6/pdAH3MvgRE1voV6
	 WqhaCAyjmm6LQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v3 6/9] riscv: mm: Take memory hotplug read-lock during kernel page table dump
Date: Tue, 21 May 2024 13:48:27 +0200
Message-Id: <20240521114830.841660-7-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240521114830.841660-1-bjorn@kernel.org>
References: <20240521114830.841660-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_044916_485704_E59D8643 
X-CRM114-Status: UNSURE (   9.24  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKRHVyaW5nIG1lbW9yeSBo
b3QgcmVtb3ZlLCB0aGUgcHRkdW1wIGZ1bmN0aW9uYWxpdHkgY2FuIGVuZCB1cCB0b3VjaGluZwpz
dGFsZSBkYXRhLiBBdm9pZCBhbnkgcG90ZW50aWFsIGNyYXNoZXMgKG9yIHdvcnNlKSwgYnkgaG9s
ZGluZyB0aGUKbWVtb3J5IGhvdHBsdWcgcmVhZC1sb2NrIHdoaWxlIHRyYXZlcnNpbmcgdGhlIHBh
Z2UgdGFibGUuCgpUaGlzIGNoYW5nZSBpcyBhbmFsb2dvdXMgdG8gYXJtNjQncyBjb21taXQgYmYy
YjU5ZjYwZWUxICgiYXJtNjQvbW06CkhvbGQgbWVtb3J5IGhvdHBsdWcgbG9jayB3aGlsZSB3YWxr
aW5nIGZvciBrZXJuZWwgcGFnZSB0YWJsZSBkdW1wIikuCgpSZXZpZXdlZC1ieTogRGF2aWQgSGls
ZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBPc2NhciBTYWx2YWRvciA8
b3NhbHZhZG9yQHN1c2UuZGU+ClNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJp
dm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L21tL3B0ZHVtcC5jIHwgMyArKysKIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3B0ZHVt
cC5jIGIvYXJjaC9yaXNjdi9tbS9wdGR1bXAuYwppbmRleCAxMjg5Y2M2ZDM3MDAuLjlkNWY2NTdh
MjUxYiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9tbS9wdGR1bXAuYworKysgYi9hcmNoL3Jpc2N2
L21tL3B0ZHVtcC5jCkBAIC02LDYgKzYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2VmaS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L2luaXQuaD4KICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+CisjaW5jbHVk
ZSA8bGludXgvbWVtb3J5X2hvdHBsdWcuaD4KICNpbmNsdWRlIDxsaW51eC9zZXFfZmlsZS5oPgog
I2luY2x1ZGUgPGxpbnV4L3B0ZHVtcC5oPgogCkBAIC0zNzAsNyArMzcxLDkgQEAgYm9vbCBwdGR1
bXBfY2hlY2tfd3godm9pZCkKIAogc3RhdGljIGludCBwdGR1bXBfc2hvdyhzdHJ1Y3Qgc2VxX2Zp
bGUgKm0sIHZvaWQgKnYpCiB7CisJZ2V0X29ubGluZV9tZW1zKCk7CiAJcHRkdW1wX3dhbGsobSwg
bS0+cHJpdmF0ZSk7CisJcHV0X29ubGluZV9tZW1zKCk7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIu
NDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
