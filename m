Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3FEC83F11
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 14:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8wSKUadVKdB9IoYQplhWv7sjfhVwVraZ1g+bjtYZqw=; b=lwyaAswalQARr+
	mk7VhBFMx1/8nll7ZS4CHlTQwbfLOnAJXuVjw1CzjTe2PXX6un3MNDtJdqdE6oVtUVhr2gVxlOGNK
	laqpZ5T5LJG5SXBmjm/kMwucGuUn81ab7DXca//uG9gFmfPvGSOIBcYRBCLr1reJqm6P2CVhI7vyc
	06nKDpi0Rsssl9E7ehyfPy2lyNwTp0zAHkP+g0ukd/NQti2OXXvGf6vn3TMedLJFINCI3f1dwOtN7
	1ESsBz82IoS5/8AIkZmyh1nPm+Fa3U+gQxANALklGluLY4QV0BBVfSCxL1lkI0jvWLZHu5sN6qCMQ
	jNImKBihdSlwmWRnDS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZtvV-006yCG-0L;
	Sat, 26 Aug 2023 14:06:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZtvR-006yBx-29
	for linux-riscv@lists.infradead.org;
	Sat, 26 Aug 2023 14:06:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21E6360C48;
	Sat, 26 Aug 2023 14:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17630C433C7;
	Sat, 26 Aug 2023 14:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693058764;
	bh=ukZ6g9EgWPFpAkFvHGXVcuI1MM3Y+aVwL2MADMeVBTU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hEhdoseJzsPGizH7PA9sWAhJB8NV7oOIzb56+6bL7zKKO0dzFZQtjYW53M9Rdtrm1
	 PDll6zD9T3tkm1zl9r1jdEooRVqDYJEYqiBPe8i5umSYGTn8SSoExX7ih97FPcgUaX
	 xJUQsdOmuSD77v+2LbiRvJ8yv8ycUPjuEfgX5IZsC7xVUL5KQFE9UGSNONHVcUIjBK
	 KpDDt8BG7KLshSVKBFcqpDFH72eAt6ZlwcT4g7NHwF86Z+N4JnmPbCzpGW8F+tYP16
	 DtWyoGHvduD4mTpnEebDQkX8/Y/h/DN6ObHHNQFnzIUnqoJBDcEW/Lvc7aTk75p6HO
	 8o29gxRGxD3sw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, pulehui@huawei.com,
 conor.dooley@microchip.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
 kpsingh@kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: Re: [PATCH bpf-next v2 3/3] bpf, riscv: use prog pack allocator in
 the BPF JIT
In-Reply-To: <20230824133135.1176709-4-puranjay12@gmail.com>
References: <20230824133135.1176709-1-puranjay12@gmail.com>
 <20230824133135.1176709-4-puranjay12@gmail.com>
Date: Sat, 26 Aug 2023 16:06:00 +0200
Message-ID: <87v8d1q4on.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_070606_155185_0DAB9F58 
X-CRM114-Status: UNSURE (   7.40  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFVzZSBicGZf
aml0X2JpbmFyeV9wYWNrX2FsbG9jKCkgZm9yIG1lbW9yeSBtYW5hZ2VtZW50IG9mIEpJVCBiaW5h
cmllcyBpbgo+IFJJU0NWIEJQRiBKSVQuIFRoZSBicGZfaml0X2JpbmFyeV9wYWNrX2FsbG9jIGNy
ZWF0ZXMgYSBwYWlyIG9mIFJXIGFuZCBSWAo+IGJ1ZmZlcnMuIFRoZSBKSVQgd3JpdGVzIHRoZSBw
cm9ncmFtIGludG8gdGhlIFJXIGJ1ZmZlci4gV2hlbiB0aGUgSklUIGlzCj4gZG9uZSwgdGhlIHBy
b2dyYW0gaXMgY29waWVkIHRvIHRoZSBmaW5hbCBSWCBidWZmZXIgd2l0aAo+IGJwZl9qaXRfYmlu
YXJ5X3BhY2tfZmluYWxpemUuCj4KPiBJbXBsZW1lbnQgYnBmX2FyY2hfdGV4dF9jb3B5KCkgYW5k
IGJwZl9hcmNoX3RleHRfaW52YWxpZGF0ZSgpIGZvciBSSVNDVgo+IEpJVCBhcyB0aGVzZSBmdW5j
dGlvbnMgYXJlIHJlcXVpcmVkIGJ5IGJwZl9qaXRfYmluYXJ5X3BhY2sgYWxsb2NhdG9yLgoKR2Vu
ZXJhbCBzdHlsZSBjb21tZW50OyBQbGVhc2UgdHJ5IHRvIHVzZSB0aGUgZnVsbCAxMDAgY2hhcmFj
dGVycyB3aWR0aApmb3IgdGhlIHBhdGNoZXMuIFlvdSdyZSBoYXZpbmcgYSBsb3Qgb2YgbGluZWJy
ZWFrcywgd2hpY2ggSU1PIG1ha2VzIHRoZQpwYXRjaCBoYXJkZXIgdG8gcmVhZC4KCgpCasO2cm4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
