Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFFFC35FF2
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9lwgo9u67ke7tg3d11YigLL4cjUQCk+GY6eaPg48Cb8=; b=2iK/N1ygejZXK3
	lkhOUMOL6flGdjcCu/hPOdbaojTASQUIMdePRikf68dL7wlUfnb+ZtmKdp++Mat1pUKksjRGpeB8C
	1f+GLEqHpAJDL1ToF2vFCGuseUgS3Yhjq/E/uQWwQxW02WYtScmXDXURMWTiUyM4dZpgp3P++HMjB
	KwteheHZaQgptLelY72FPjz4vDugrUUszGxKVfyOiO9rmENmFSlrBxYnJ5fweav8D3YRQ2Qb6cJFc
	WyzrOq06MkGiUIf7MnLHzGkYvFQRaF+KG2Pf0Uotzqp7WEGfT72zDylhOr+9oko9YtfQxEt5ROnOX
	A0dmUAbUv/LLDU+3S8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMKX-00000008bC1-2vgr;
	Wed, 12 Mar 2025 13:41:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLt6-00000008X5m-2bd0
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 13:12:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41DEE5C57A3;
	Wed, 12 Mar 2025 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669B9C4CEEC;
	Wed, 12 Mar 2025 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741785163;
	bh=PBTPbAPIWX+QDh4lvcUtj+0ELhjT53JUuY94iLECXmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VGGLrm1LVtWgYEaqxx8UX70HWr0vuPCF7MOVePKeIrgdk5IOqR3avCLoLIfMpFEZ1
	 mHRYnD9ndmPIZJ/8M1PLWvIje7qWHNtidpZG8eZR6+nitH2yLISB/cOONLHcQI8Tde
	 I04Z4Xq0zVeiAkcf0gxnDGQaXFqewWP+Qiq3Zwdq/aAPwSziuU7xsdVLXY3cKdqjiv
	 zYZ3c0lUbyZsj5xyY1WJbbqfyMhH481m8N75lRybM0n98MVnCa0IuieWZGwBYImT8J
	 LQzLcJJrlYqsrvPmxxJ4sf58H5W9NicDIf1S/oBCh2vu+TUkRjIxJkK8R4EUv2D808
	 eCtiLy81ArzXQ==
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
Subject: [PATCH v4 4/6] dt-bindings: riscv: d requires f
Date: Wed, 12 Mar 2025 13:11:47 +0000
Message-ID: <20250312-perpetual-daunting-ad489c9a857a@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250312-abide-pancreas-3576b8c44d2c@spud>
References: <20250312-abide-pancreas-3576b8c44d2c@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=dYPhJy02rU+uIlGkMnAKd9ueA9RZPFw8XUqVyW1zPdM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkXO0TM12deOyg7PdYkLU7H03S15o6+6mTHW33qAZ4Ce wrKug53lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCIpIQz/jBVzlkVc+nJ5fuh8 i6bDx3cyv/84621o5K5vbAZHF35NmMTIsCKoyyPV96HUJFHfFQoXmo5drP5gfGjJjsWan9y6XUP 5OAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_061244_715229_6D3D7527 
X-CRM114-Status: UNSURE (   6.73  )
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
