Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4064EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 11:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBeMmM7oDnNvOJe+8U1tdekBD/g7OBEXUiOM+wMgAIw=; b=ju4V3VO7guauHb
	cvvd5LNtkRQ3nNeFLBQZTqIC8GO6GCQHDOjpiej2BONofB4pWV8K/DK0Zg9b1PClIwxNl2yuOsw5R
	Qs0sG/wIzrIT0KPAKZfpFdyo5LW9LwTuLbRxPfxZEwIdPVysKJ5bITCBZoZfefip2NAOaBDqdqy5f
	iI1vRP9hCtmvSeAvRImeNPoYMm7kp6+n2fbNXYAvRANoOj4R4ywV1X/Rl6rSr09o1w4urKGJxJZI/
	Q1MSFa0TxPVltpJBRMUHGy7v7yev/qCA9Yze5pTNa3PkFWinViel8LwLWid7ee3XaimZJp6tMFUx+
	YghUiiNB+1JFbIdIG7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0rH-00FjqF-2J;
	Wed, 05 Jul 2023 11:39:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0rE-00FjoQ-16
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 11:39:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D261D61518;
	Wed,  5 Jul 2023 11:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C3EC43391;
	Wed,  5 Jul 2023 11:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688557179;
	bh=urR3yZnDusvfwXBBOCw/IKT8fxfFq0fp8eLiyLD/Gk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mjrzNsnkwMA7QUoyv8VZHYooJ9qpesUo3fpr7hiB/TVnxsZHH9BhWMCKLK8at5QwS
	 V9hMGMNDTEq3nNEQ6c3DCl83x7CH/qRoAk5UNVLg8DQffuNqmHl4AlteM2DLsljmQs
	 5VuXlXM9uZxiblRRVomfvkyWZuEcaquye35Zfui17JLeLC9AHJlbSvfgq+DCac65GS
	 WvKfzA2uUlTbXQQcpTnKOsXLKWF3MNPpFWtQjerp92230pbjBn3bPavNHUlXYCM8w8
	 NK92ORPQi9wQqzp90yshBg7i4NS7GpOFowqCsYqGQZxY08HdzQbNHiWnCGo50L1MAJ
	 o/vqbVggKlsVA==
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
Subject: [PATCH bpf-next 2/2] selftests/bpf: Honor $(O) when figuring out paths
Date: Wed,  5 Jul 2023 13:39:26 +0200
Message-Id: <20230705113926.751791-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230705113926.751791-1-bjorn@kernel.org>
References: <20230705113926.751791-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_043940_417545_3ABDCF64 
X-CRM114-Status: UNSURE (   8.11  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKV2hlbiBidWlsZGluZyB0
aGUga3NlbGZ0ZXN0cyBvdXQtb2YtdHJlZSwgZS5nLgogIHwgbWFrZSBBUkNIPXJpc2N2IENST1NT
X0NPTVBJTEU9cmlzY3Y2NC1saW51eC1nbnUtIFwKICB8ICAgTz0vdG1wL2tzZWxmdGVzdCBoZWFk
ZXJzCiAgfCBtYWtlIEFSQ0g9cmlzY3YgQ1JPU1NfQ09NUElMRT1yaXNjdjY0LWxpbnV4LWdudS0g
XAogIHwgIE89L3RtcC9rc2VsZnRlc3QgSE9TVENDPWdjYyBGT1JNQVQ9IFwKICB8ICBTS0lQX1RB
UkdFVFM9ImFybTY0IGlhNjQgcG93ZXJwYyBzcGFyYzY0IHg4NiBzZ3giIFwKICB8ICAtQyB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cyBnZW5fdGFyCgp0aGUga3NlbGZ0ZXN0IGJ1aWxkIHdvdWxkIG5v
dCBwaWNrIHVwIHRoZSBjb3JyZWN0IEdFTkRJUiBwYXRoLCBhbmQKdGhlcmVmb3JlIG5vdCBpbmNs
dWRpbmcgYXV0b2NvbmYuaC4KCkNvcnJlY3QgdGhhdCBieSB0YWtpbmcgJChPKSBpbnRvIGNvbnNp
ZGVyYXRpb24gd2hlbiBmaWd1cmluZyBvdXQgdGhlCkdFTkRJUiBwYXRoLgoKU2lnbmVkLW9mZi1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2JwZi9NYWtlZmlsZSB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmls
ZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQppbmRleCBhZDZiNTg1ZTBk
N2MuLmRhY2NjMWI4NTczYSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBm
L01ha2VmaWxlCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZQpAQCAt
MTIsNyArMTIsMTEgQEAgQlBGRElSIDo9ICQoTElCRElSKS9icGYKIFRPT0xTSU5DRElSIDo9ICQo
VE9PTFNESVIpL2luY2x1ZGUKIEJQRlRPT0xESVIgOj0gJChUT09MU0RJUikvYnBmL2JwZnRvb2wK
IEFQSURJUiA6PSAkKFRPT0xTSU5DRElSKS91YXBpCitpZm5lcSAoJChPKSwpCitHRU5ESVIgOj0g
JChPKS9pbmNsdWRlL2dlbmVyYXRlZAorZWxzZQogR0VORElSIDo9ICQoYWJzcGF0aCAuLi8uLi8u
Li8uLi9pbmNsdWRlL2dlbmVyYXRlZCkKK2VuZGlmCiBHRU5IRFIgOj0gJChHRU5ESVIpL2F1dG9j
b25mLmgKIEhPU1RQS0dfQ09ORklHIDo9IHBrZy1jb25maWcKIAotLSAKMi4zOS4yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
