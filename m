Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D001C001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 11:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=86YZKOY8OU013z/FLh9TvsRWME/xMRh7pdqK3Ll/I20=; b=GMQgVgrb69g6ts
	NvFOEu3MMJTxhaSzLuTBfj8KbddZya9wySuVxENrmZNJAw7zLQ3mZAmkab1B3WLQWzVCPbpY4c95s
	Ar0tA6Cf1KdHzraRyOdpiKdH+5uwXhJp4HBY8P+2zjuOBd4qCl6eBDS00jniJ/OsltVG+oTCpIKdI
	UkMLgRYhsZ5FJIe2wGeUx2wNcF7KfMjvM8PwYTwuEXQ87Ps/6c5gbIEnV2DIoV+XB8kXVqm1VpFsw
	0sD/DGNWzVd8kGXzZ9Fle8/pbvG3cbJ2HzGvh6T04xu0ogpCh0S3pipSGeRcUQEF0+7FgKJR3kZvB
	FJX41/6lw/gpNuJ/1aFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0rC-00FjnT-1T;
	Wed, 05 Jul 2023 11:39:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0r9-00Fjm6-0p
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 11:39:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F303A614FD;
	Wed,  5 Jul 2023 11:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9CAC433C8;
	Wed,  5 Jul 2023 11:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688557173;
	bh=ZbcL7/Ws+420j+1VsDqK0BIHNk64SeGaagfrpJQvNdU=;
	h=From:To:Cc:Subject:Date:From;
	b=Mmty4s3lrufZwNUJbmiCj64hkHAdaNMtj0NrKL1xoLIeHV/15A0PRwZ5cpSk8y3Z0
	 DeQv/e6LxOjNjfnGKpXI/au6LQHfFGqF4L44oXy3W0OkKpzvlJ6jFa7LSMpm+7LcsP
	 /6DOgupRUUJXsl3R4AuugfH+Mz1J+zdndck/Q6UGo/Nxn8/M1IiBRQBtkmTeNPAmU/
	 1Sm6UbRVvPU1yEvbv7ez9eiiPmjY1XMg9CtIA7ONv22VXO4O8HThPKzKCDlnWA1l+2
	 9Dh0bwIaHEG0r/3BWpDbObUv7Zxsop3rbGRukHQRokz8Q3dcuhYDVlI/rnOOKQrsIE
	 qg6SHth7qP4YA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Andrii Nakryiko <andrii@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next 0/2] BPF kselftest cross-build/RISC-V fixes
Date: Wed,  5 Jul 2023 13:39:24 +0200
Message-Id: <20230705113926.751791-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_043935_359736_E17017C5 
X-CRM114-Status: UNSURE (   9.97  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhpcyBzZXJpZXMgaGFz
IHR3byBtaW5vciBmaXhlcywgZm91bmQgd2hlbiBjcm9zcy1jb21waWxpbmcgZm9yIHRoZQpSSVND
LVYgYXJjaGl0ZWN0dXJlLgoKU29tZSBSSVNDLVYgc3lzdGVtcyBkbyBub3QgZGVmaW5lIEhBVkVf
RUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MsCndoaWNoIG1hZGUgc29tZSBvZiB0ZXN0cyBiYWls
IG91dC4gRml4IHRoZSBmYWlsaW5nIHRlc3RzIGJ5IGFkZGluZwpGX05FRURTX0VGRklDSUVOVF9V
TkFMSUdORURfQUNDRVNTLgoKLi4uYW5kIHNvbWUgUklTQy1WIHN5c3RlbXMgKmRvKiBkZWZpbmUK
SEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUy4gSW4gdGhpcyBjYXNlIHRoZSBhdXRvY29u
Zi5oIHdhcyBub3QKY29ycmVjdGx5IHBpY2tlZCB1cCBieSB0aGUgYnVpbGQgc3lzdGVtLgoKCkNo
ZWVycywKQmrDtnJuCgpCasO2cm4gVMO2cGVsICgyKToKICBzZWxmdGVzdHMvYnBmOiBBZGQgRl9O
RUVEU19FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUyB0byBzb21lIHRlc3RzCiAgc2VsZnRlc3Rz
L2JwZjogSG9ub3IgJChPKSB3aGVuIGZpZ3VyaW5nIG91dCBwYXRocwoKIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2JwZi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgNCArKysrCiB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdmVyaWZpZXIvYXRvbWljX2NtcHhjaGcuYyB8IDEgKwogdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3ZlcmlmaWVyL2N0eF9za2IuYyAgICAgICAgfCAyICsr
CiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdmVyaWZpZXIvam1wMzIuYyAgICAgICAgICB8
IDggKysrKysrKysKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi92ZXJpZmllci9tYXBfa3B0
ci5jICAgICAgIHwgMiArKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3ZlcmlmaWVyL3By
ZWNpc2UuYyAgICAgICAgfCAyICstCiA2IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCgpiYXNlLWNvbW1pdDogYTk0MDk4ZDQ5MGUxN2Q2NTI3NzBmMjMwOWZj
YjliNDZiYzRjZjg2NAotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
