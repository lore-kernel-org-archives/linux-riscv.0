Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CF6CE8E6D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LDjfdSYIQ8/gNRyZIEsxIV2D5Fxj0IkDzZ1STa7wZ8=; b=lVcjOPMlPBmOBL
	yPSR8MKM8qs8zj1pPzaV9liPYJDNOnnD2XQoyegxwtC9S0AZ0fkd8BWjaQK7tm30qCtYynAUlNXuh
	/xFTDu+BEo+6lO1IiFcxw19mOOOPzJtdstcAuIVdQn8skcaLHv0ggEsUo2BeTxOxc7uI7LXApCB9E
	m/McpjNjr+IGHtgy3OmkdgkxsLqjbaaj3vGw//83QewRqxR5ktdFUyiy7iO6wXF0UKRQJm1dcNe+r
	C8lyEZhsrY6dk6sVl+LavKT7XYSY/c3HxUGjGo+3vLaw1eQ5+jJAaq1pO9uiJz0j/EchI/SGVO/if
	is8xhr5xXPaESYp2wJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x7l-00000000MxR-271M;
	Thu, 24 Oct 2024 12:39:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3x37-00000000M1a-2omB
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 12:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A44B5C5F0E;
	Thu, 24 Oct 2024 12:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A1AC4CEE8;
	Thu, 24 Oct 2024 12:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729773284;
	bh=ptol331dzJMPhFm6aP6N4KOrUBpmiXlYM+nw8AjqcLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d5jjhn74Pf0GY9BVrZdiAYRJo9/cLV8M09yXG0ZpNcUdHsJmpA+1YDL469lWm3NDy
	 /JhTza2W9T1+wR+bl/U9uQby7399mQq4kSjBVCDCnPfvtU5OafXj3pXJNZ44RhZebM
	 YCCU9LRCPO+qPPMMR3Vkx4QcJHoOdwgP/6v6GnQ39yXI2RYpbYr7f0SqCF+yWUYfTA
	 jeW9kk+T/49Sr2jbJyBSsILXpBqb13XZk9zxbGfFTgipdPUNEIC+Sw3SO55Zwhh1fJ
	 qGRFHT0QjPudq1IlURf+BJ+NEORpKgfaMj9OHmjZVFsyxicb7wkJCRSsM09atqbtLO
	 9JmgsGGelioNA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/5] dt-bindings: riscv: d requires f
Date: Thu, 24 Oct 2024 13:34:31 +0100
Message-ID: <20241024-petted-oasis-426993b07f75@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024-fanning-enrage-bcc39f8ed47d@spud>
References: <20241024-fanning-enrage-bcc39f8ed47d@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=OXDrUW3asuNmjBXo7oSLxm76Z3KlXKOnfCj4qooySls=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOlSdteubDlzaP9d1Ym6e+88iv5n+7hYuUKr//B+jy/1F xpelUef7ihlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBElrIxMmyYVxJZeyFk08JD EZ2ity3PBE84dXH75Zl/8mRmHLd/+/UFI8Pxvo0O8ZFWn1q6tfaVutvNk4jXO8sxv3jR04sx/xm EtPgB
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_053445_986360_2553BC85 
X-CRM114-Status: UNSURE (   7.11  )
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
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKaW5kZXggMmNm
MjAyNmNmZjU3NC4uYzY5N2JlNjRkM2JmYyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCkBAIC01NzEsNiArNTcx
LDEyIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBodHRwczovL3d3dy5hbmRlc3RlY2guY29t
L3dwLWNvbnRlbnQvdXBsb2Fkcy9BWDQ1TVAtMUMtUmV2Li01LjAuMC1EYXRhc2hlZXQucGRmCiAK
ICAgICBhbGxPZjoKKyAgICAgIC0gaWY6CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAg
ICBjb25zdDogZAorICAgICAgICB0aGVuOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAg
ICAgY29uc3Q6IGYKICAgICAgICMgWmNiIGRlcGVuZHMgb24gWmNhCiAgICAgICAtIGlmOgogICAg
ICAgICAgIGNvbnRhaW5zOgotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
