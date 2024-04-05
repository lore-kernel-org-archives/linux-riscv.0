Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB79EC67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xPoDvpK3JM/8S/esegXj5m12OmYvYtAiPtoxgp7p0zM=; b=FJEY7zG30REG7p
	YwN7a8wA7I3u+J+AL6Pg7w0kiVAv2HJU49ATeGqkhyfMYT1xmKUMhbymhIJ/qoci07Jz8lghNrclP
	8pSq/NgBQuSJJMDg/JTyrfZ8W8fOa8SUoivsFpzhKawGv/v5B23jvUwaV8pGAWfjxBt2He82dkNrN
	fS5r7JxniAzhnZBkZ7NQPZxhmB1nky79GEH+ciHALOzM8QHMGdunGxma+HWY5xalanm5B3yu0Q2nr
	uGTjHVUayoE2I4FkOhoGovyEXmWQc4FDDyMgfAqvJZlDynDkat0FBFGK4CK71juEDz4lgd508TjyO
	9iYyU25+Mo+taciNQ3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjic-00000007Fco-25TC;
	Fri, 05 Apr 2024 13:34:58 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsilj-00000006xyc-3Hre
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 12:34:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A3D2FCE3718;
	Fri,  5 Apr 2024 12:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF20DC433C7;
	Fri,  5 Apr 2024 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712320444;
	bh=PECncfpIj9KF2NL1qIow7qaBE8q+dGkyd5JVLY75BOg=;
	h=From:To:Cc:Subject:Date:From;
	b=f7OO++ldDAG5EvmYC/zNV61hMnNPLbuFpCPIFVPgvRCZ3MYgmFm8WHRO+XWL4WQ67
	 ePFkz+UQVYDfnUjZY8s6OsNrJOH63T2asc5L7yRbMSdNL53LOd3GWDcWDD5vyIz4pT
	 qHh+ZgTY43kwgrSlbxKaD4VCb4YJ1mUMQQlK57VJ7VLWLebLRjR6ecq28RvkVvglLH
	 GiC4bQx2PPqnuKVgr8BAH729yQS56FpSXMdB0S65D0Timy7W3InfO6SRenpmaHxcbu
	 0m2q2rs+x4g4XgRUC/xIq+SfeFpMsPjjZFqSKdtB1K+4ZvzAUHrMLpG8O0h2RseZEm
	 RBeYAPQuBl0TQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Pu Lehui <pulehui@huawei.com>,
	Puranjay Mohan <puranjay@kernel.org>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Subject: [PATCH bpf] MAINTAINERS: bpf: Add Lehui and Puranjay as riscv64 reviewers
Date: Fri,  5 Apr 2024 14:33:51 +0200
Message-Id: <20240405123352.2852393-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_053408_026386_644E34C2 
X-CRM114-Status: UNSURE (   7.35  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKTGVodWkgYW5kIFB1cmFu
amF5IGhhdmUgYmVlbiBhY3RpdmUgUklTQy1WIDY0LWJpdCBCUEYgSklUCmNvbnRyaWJ1dG9ycy9y
ZXZpZXdlcnMgZm9yIGEgbG9uZyB0aW1lIQoKTGV0J3MgbWFrZSBpdCBtb3JlIG9mZmljaWFsIGJ5
IGFkZGluZyB0aGVtIGFzIHJldmlld2VycyBpbgpNQUlOVEFJTkVSUy4KClRoYW5rIHlvdSBmb3Ig
eW91ciBoYXJkIHdvcmshCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPgotLS0KIE1BSU5UQUlORVJTIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggNzUz
ODEzODZmZTRjLi41OGFiMDMyYWQzM2QgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01B
SU5UQUlORVJTCkBAIC0zNzY0LDYgKzM3NjQsOCBAQCBYOglhcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvbXA2NC5jCiAKIEJQRiBKSVQgZm9yIFJJU0MtViAoNjQtYml0KQogTToJQmrDtnJuIFTDtnBl
bCA8Ympvcm5Aa2VybmVsLm9yZz4KK1I6CVB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+CitS
OglQdXJhbmpheSBNb2hhbiA8cHVyYW5qYXlAa2VybmVsLm9yZz4KIEw6CWJwZkB2Z2VyLmtlcm5l
bC5vcmcKIFM6CU1haW50YWluZWQKIEY6CWFyY2gvcmlzY3YvbmV0LwoKYmFzZS1jb21taXQ6IGM4
OGI5YjRjZGUxN2FlYzM0ZmI5YmZhZjY5ZjlmNzJhMWM0NGY1MTEKLS0gCjIuNDAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
