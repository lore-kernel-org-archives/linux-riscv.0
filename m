Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A87BE7B601
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 12:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M28btBtbD0nUj86cGtFXzHJve8Er369I5AxPIMwA/34=; b=zGP9fStJ7hayUQ
	dmdoz7rWBR3ljqYZq8W+FhFbQ9xAwp8oXCgD7LIoYuTLLX0vpSFTfM+m7yL4C5FE0YAwJiB1CFZmw
	/XzvMksSsZ1MRWPUknxz8d2zXGgAXfySvhB1mi7Jk6JJ/la4tCobD9efSLY3Lb18KofeA5N1eSqlb
	dW/SGttuihtpw5SYYiLQqafW/V+vrm1bhKijij/FTkeFTfA0XgRD0mC1D0S/UqT2b60ZhF6ckw/L9
	3kP41G61DViluVNJ4lB/vKIQ2sPlbbzmjqIXOF+4wG72Ualqsdp5DSepfk2cI15e7v7H4gp0AwqN5
	wlh0e6HuVrsE2Kb+twmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0ya-0000CZ-0y;
	Wed, 04 Oct 2023 12:27:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0yW-000082-2d
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 12:27:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6C155B81E08;
	Wed,  4 Oct 2023 12:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B52C433CB;
	Wed,  4 Oct 2023 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696422454;
	bh=wY6Lz/zx7I9HiBpRiawuNkcCXD5tjJfz6F8komvznPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JXrJm4DS5M4NI/TAZPxlBg/4QQ0mBVNPLkmxB0BQ+hyoYvazGaRUKOD7m7X9a7Jsv
	 9BQSthEQTVVz3PvMnA853dexF644DxsIXZd7XMY0YUqA1h6IW1y8arPOx6lBVwS3NY
	 tzRySzd1Ui1cu7I/GOXbI9Z0Y3orcUbZRhpb1WCz40Mz0Rw0FFuhs04+N2qo8lr6pX
	 FvVqjZjX1j9HBv6WKAzAchdr1V/PrsjijZk4T+8ZmndGXybhpnaq+piKKLj+Wo7MGq
	 kc24UfdHzDd8tkC5q7PZ7SQZRleU1B42NmDDujJtqhl/bQzMIwGKl4oFIQzSHi10vS
	 8op2PCRoSiVBQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next 3/3] selftests/bpf: Add uprobe_multi to gen_tar target
Date: Wed,  4 Oct 2023 14:27:21 +0200
Message-Id: <20231004122721.54525-4-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004122721.54525-1-bjorn@kernel.org>
References: <20231004122721.54525-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_052737_009989_D8EAC8AC 
X-CRM114-Status: UNSURE (   9.83  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIHVwcm9iZV9tdWx0
aSBwcm9ncmFtIHdhcyBub3QgcGlja2VkIHVwIGZvciB0aGUgZ2VuX3RhciB0YXJnZXQuIEZpeApi
eSBhZGRpbmcgaXQgdG8gVEVTVF9HRU5fRklMRVMuCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBm
L01ha2VmaWxlIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxl
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCmluZGV4IDA5OGUzMmM2ODRk
NS4uMDdhYzczY2MzMzlkIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYv
TWFrZWZpbGUKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCkBAIC0x
MDQsNyArMTA0LDcgQEAgVEVTVF9HRU5fUFJPR1NfRVhURU5ERUQgPSB0ZXN0X3NvY2tfYWRkciB0
ZXN0X3NrYl9jZ3JvdXBfaWRfdXNlciBcCiAJeHNreGNlaXZlciB4ZHBfcmVkaXJlY3RfbXVsdGkg
eGRwX3N5bnByb3h5IHZlcmlzdGF0IHhkcF9od19tZXRhZGF0YSBcCiAJeGRwX2ZlYXR1cmVzCiAK
LVRFU1RfR0VOX0ZJTEVTICs9IGxpYnVyYW5kb21fcmVhZC5zbyB1cmFuZG9tX3JlYWQgc2lnbi1m
aWxlCitURVNUX0dFTl9GSUxFUyArPSBsaWJ1cmFuZG9tX3JlYWQuc28gdXJhbmRvbV9yZWFkIHNp
Z24tZmlsZSB1cHJvYmVfbXVsdGkKIAogIyBFbWl0IHN1Y2NpbmN0IGluZm9ybWF0aW9uIG1lc3Nh
Z2UgZGVzY3JpYmluZyBjdXJyZW50IGJ1aWxkaW5nIHN0ZXAKICMgJDEgLSBnZW5lcmljIHN0ZXAg
bmFtZSAoZS5nLiwgQ0MsIExJTkssIGV0Yyk7Ci0tIAoyLjM5LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
