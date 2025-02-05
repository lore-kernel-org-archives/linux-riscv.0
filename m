Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6ACC0219A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 17:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9lwgo9u67ke7tg3d11YigLL4cjUQCk+GY6eaPg48Cb8=; b=kEtufeAPGdlp/r
	LnYAk9MjSLjzrOlhzH98QjV4cXYwtjle+bOAqdD1nCSVjQyWvrUzXVc1RhvTlFx837OMnvd+19nsq
	wUwaCyDhN6qgPxwHvQuEoAuyxuABKBYlYcvT9zNtdkts8bNkLIUses5u2XFiQa45sPVTFIfTdmRWH
	IrCMEbqm+Wg1gImdcclvDr+ha6QxCEB5N8L/Bj4MQlsz/zluJOI492mvPk+YDGMHSXLNuoBZsYr1l
	iv6H2HNb1Q/1N5tRopvA/BTqEW7GHsqRrU24B7ELWmjTPIsKAAdnl5kkgqTfVNObayOrByc/jUvQx
	fqDeCVVpmsyMoXlZcjtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjF2-000000046IT-1MdE;
	Wed, 05 Feb 2025 17:31:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhx0-00000003uh2-2beA
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=izkUSEUnASCDPXTObuZJHY4iD7AkUQUytT8jiX4TwhE=; b=cOSunrDziol0LFw6MfT/QL8x+r
	VeksnaXR7BSiUzHWAHAEVz2prW9oQ0tTTnuYgrAtYnJb4PIpxPsBAId6j74P74bBhW7RbH4Gwp81Q
	7hvb9ckvM4I/xKHym9UuGpdGmvZoWSfpKXkW9eukTMGkhz2fjsNoljoTYhgvzfxKU5PcsWAVmcFpJ
	/pYDnNZbLdfxFSrpWFaWY6X3vL5FtygG3ppgfNEcLE3z5FHbXVILkaAZ8gSNvrx/1Wkfkp73k27lX
	pfMk+QnXRxbbKERfDQGIMiJD7dAaHpks6lQaHN878atHmnfBCNum4/7lkJHmcQdf5W9lmCxwh4zm+
	ySxoqudw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhwx-0000000GgpG-1icI
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:08:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05D205C6816;
	Wed,  5 Feb 2025 16:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC32C4CEE2;
	Wed,  5 Feb 2025 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771705;
	bh=PBTPbAPIWX+QDh4lvcUtj+0ELhjT53JUuY94iLECXmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M4En6XTU4gYjM6SblHahsMQFrwquDVrtXhwSOiRd/NNQJVnCAyqvdQY6YapDezFDZ
	 T3rE4qAj6EGNKFBj3I2zifN/45tOUFBp56uQIbe82nWrgE4tgU3A4DwtCisT+kxlMY
	 pVZPkCXzxQOItYf3yEP8Re1gX2bVT82KFcmVfVXuvixXrrz8DYlOvBCfJUatVSMXqp
	 DgKYq51kwuTxFQQMDkwflKOGPqRe1yWuXO9AnLqI+ZU9nwCujIcGFKdvbcFGYT3xep
	 O9zedOVYgFiKqzAiU0UuXRm1TO1WAf3AsZL4smgrgJMddTR0AXD1lI4P49CY4EoyXe
	 8qPf2mzfIPTEg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/6] dt-bindings: riscv: d requires f
Date: Wed,  5 Feb 2025 16:05:10 +0000
Message-ID: <20250205-flatly-clover-ae7016cb6e04@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205-cobbler-unpadded-5580c1f5d946@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=dYPhJy02rU+uIlGkMnAKd9ueA9RZPFw8XUqVyW1zPdM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmLe2wyn2Zpc1yYeiZ41d8nEiVLN8wVerFq7twTB6+5B x7SDShv6ShlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEJp5l+F8j+dNOqWN3k5H2 ND/tQzuX3e94eW31mWv7wwXd6natl3diZHhYuGNy080ni/PWMn1Ysopp5RNZ6wV+tQ1n7x4ON+W +e4UHAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_160827_716774_1A448B40 
X-CRM114-Status: UNSURE (   6.99  )
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

RnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClBlciB0aGUg
c3BlY2lmaWNhdGlvbnMsIHRoZSBkIGV4dGVuc2lvbiBmb3IgZG91YmxlLXByZWNpc2lvbiBmbG9h
dGluZwpwb2ludCBvcGVyYXRpb25zIGRlcGVuZHMgb24gdGhlIGYgZXh0ZW5zaW9uIGZvciBzaW5n
bGUtcHJlY2lzaW9uIGZsb2F0aW5nCnBvaW50LiBBZGQgdGhhdCByZXF1aXJlbWVudCB0byB0aGUg
YmluZGluZ3MuIFRoaXMgZGlmZmVycyBmcm9tIHRoZQpMaW51eCBpbXBsZW1lbnRhdGlvbiwgd2hl
cmUgc2luZ2xlLXByZWNpb3VzIG9ubHkgaXMgbm90IHN1cHBvcnRlZC4KClJldmlld2VkLWJ5OiBD
bMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CkFja2VkLWJ5OiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Ci0tLQogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDYgKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKaW5kZXggYTYz
Yjk5NGUwNzYzLi5lYmIyNTIyNzVkZGQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbApAQCAtNjM5LDYgKzYzOSwx
MiBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAgaHR0cHM6Ly9naXRodWIuY29tL1QtaGVhZC1T
ZW1pL3RoZWFkLWV4dGVuc2lvbi1zcGVjL2Jsb2IvOTUzNThjYjJjY2E5NDg5MzYxYzYxZDMzNWUw
M2QzMTM0YjE0MTMzZi94dGhlYWR2ZWN0b3IuYWRvYy4KIAogICAgIGFsbE9mOgorICAgICAgLSBp
ZjoKKyAgICAgICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiBkCisgICAgICAgIHRo
ZW46CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogZgogICAgICAgIyBa
Y2IgZGVwZW5kcyBvbiBaY2EKICAgICAgIC0gaWY6CiAgICAgICAgICAgY29udGFpbnM6Ci0tIAoy
LjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
