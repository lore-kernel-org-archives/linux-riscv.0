Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387C1CDD1AF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Sep 2024 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XM3US4aGb4zxJwWrDSscO6Vp9WsfYozoONFekOvKAsE=; b=c6weJ8Q0NPsBtS
	AK/zzr/2LCo2iapJ5h2Vs4LrjsZpnUmB8vgRI5SOf2bj7V3vRk6j7HZbBbxYbRX7blgZxajaIzR9N
	mOWpBVfkTPb0YM59zreXo1M1rxYe5MoXcWKzS2EO47IIPOWl9W00z32RxkJnUbddznlFGziS43yWX
	u1DmfCZjaG0BRY5RwZwIW8UGsJyVaXq4E2NvnqEr0Gjapdno7Y0edgS8wQ0VL+TSB72WCI4v8Wj74
	3jshPCWUpmqFpuNkIq33HbKp8SSP0DSLYVWswHXwoS3RkoPDOgbuos10aZCB3XgVMP2H+lhdbzJxw
	TnvuL1Vkoz64kq/fCQcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suAtS-0000000BGI7-2tQA;
	Fri, 27 Sep 2024 13:20:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suAnW-0000000BF2k-468X
	for linux-riscv@lists.infradead.org;
	Fri, 27 Sep 2024 13:14:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6EBAE5C5C8E;
	Fri, 27 Sep 2024 13:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D65C4CECF;
	Fri, 27 Sep 2024 13:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727442854;
	bh=lD7X3F4aQ/DImEMn86wtBbghQxJBS+VINHajn6ohurg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HcAAV3e94G5tfukXw6esqeXcQngIwF6ANCFn55VINpxDqY+aXJe+qTQAw/QXDna4P
	 tEPEqoVP9orhnYRsUUsvO/kn/UAEnddgJIb1hXW8nNlJ7QBxbuEK1QZtmkORScMCJK
	 0X/uCPHyFVRPF0jLHfpHWSNHmJVkog+TxTb9SUW1ZosS7wSI2vL1auCike6htB/2SJ
	 UaqomXoJj1vpV6DaiazieraciOTcpAJo8AKDW0CfS5ws7ICZ1D1Cfs9yiLV5ruU+id
	 nBWtslwECXay1dByV2zMHZc85rs9kNG3qBKX7jLRXaE023R79ZSIY8kem/1fi1MTCT
	 iZA/RFziNyQWg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH bpf-next 2/2] selftests: bpf: Add missing per-arch include path
Date: Fri, 27 Sep 2024 15:13:53 +0200
Message-ID: <20240927131355.350918-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240927131355.350918-1-bjorn@kernel.org>
References: <20240927131355.350918-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_061415_087491_A4B42D87 
X-CRM114-Status: UNSURE (   7.76  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIHByb2dfdGVzdHMg
cHJvZ3JhbXMgZG8gbm90IGluY2x1ZGUgdGhlIHBlci1hcmNoIHRvb2xzIGluY2x1ZGUKcGF0aCwg
ZS5nLiB0b29scy9hcmNoL3Jpc2N2L2luY2x1ZGUuIFNvbWUgYXJjaGl0ZWN0dXJlcyBkZXBlbmQg
dGhvc2UKZmlsZXMgdG8gYnVpbGQgcHJvcGVybHkuCgpJbmNsdWRlIHRvb2xzL2FyY2gvJChTVUJB
UkNIKS9pbmNsdWRlIGluIHRoZSBzZWxmdGVzdHMgYnBmIGJ1aWxkLgoKRml4ZXM6IDZkNzRkMTc4
ZmU2ZSAoInRvb2xzOiBBZGQgcmlzY3YgYmFycmllciBpbXBsZW1lbnRhdGlvbiIpClNpZ25lZC1v
ZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2JwZi9NYWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmls
ZQppbmRleCAzNjU3NDBmMjRkMmUuLmQ2YTUzYWZhNDQ5ZiAxMDA2NDQKLS0tIGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZi9NYWtlZmlsZQpAQCAtMTAsNiArMTAsNyBAQCBUT09MU0RJUiA6PSAkKGFic3BhdGggLi4v
Li4vLi4pCiBMSUJESVIgOj0gJChUT09MU0RJUikvbGliCiBCUEZESVIgOj0gJChMSUJESVIpL2Jw
ZgogVE9PTFNJTkNESVIgOj0gJChUT09MU0RJUikvaW5jbHVkZQorVE9PTFNBUkNISU5DRElSIDo9
ICQoVE9PTFNESVIpL2FyY2gvJChTUkNBUkNIKS9pbmNsdWRlCiBCUEZUT09MRElSIDo9ICQoVE9P
TFNESVIpL2JwZi9icGZ0b29sCiBBUElESVIgOj0gJChUT09MU0lOQ0RJUikvdWFwaQogaWZuZXEg
KCQoTyksKQpAQCAtNDQsNyArNDUsNyBAQCBDRkxBR1MgKz0gLWcgJChPUFRfRkxBR1MpIC1yZHlu
YW1pYwkJCQkJXAogCSAgLVdhbGwgLVdlcnJvciAtZm5vLW9taXQtZnJhbWUtcG9pbnRlcgkJCQlc
CiAJICAkKEdFTkZMQUdTKSAkKFNBTl9DRkxBR1MpICQoTElCRUxGX0NGTEFHUykJCQlcCiAJICAt
SSQoQ1VSRElSKSAtSSQoSU5DTFVERV9ESVIpIC1JJChHRU5ESVIpIC1JJChMSUJESVIpCQlcCi0J
ICAtSSQoVE9PTFNJTkNESVIpIC1JJChBUElESVIpIC1JJChPVVRQVVQpCisJICAtSSQoVE9PTFNJ
TkNESVIpIC1JJChUT09MU0FSQ0hJTkNESVIpIC1JJChBUElESVIpIC1JJChPVVRQVVQpCiBMREZM
QUdTICs9ICQoU0FOX0xERkxBR1MpCiBMRExJQlMgKz0gJChMSUJFTEZfTElCUykgLWx6IC1scnQg
LWxwdGhyZWFkCiAKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
