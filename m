Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15A6FF60EC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 08:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8UmjTNNil5qMNx8US8gUWaCE8wlhqbOXKT8UuwAE+Q=; b=KJWPWm8dJX6KNR
	dwaHh1jGvagBPAweiVE7LdmLDVwRl9yk1T/uVVnYy1oQgCdHbDU9aynjeWSmiiWNn1liAuifMAEld
	LjX3Z3P8fXfI11IKA75ce4iPNo4zV8XwPmQ6o0vC8Cqsi6NLQWApYs/QMKOoWjngBg7Lq8/3pF8zd
	Peb0V46kP8U9Op/nztUd3XQfcGCGr2rCuRop5tpUgZAQyG0UrQjdaRV/HHCyzlSH4DH5gV0PN970x
	BtvGWpLARzGEem+KtuO34XDi/n1uUgi4xUb2mgMAtcxZ+vk3bbvLnMcluG3L/IenYQscc5B6LTrst
	gOQsdhp6gDJvm7rqlSIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7US6-0000000Capm-3US2;
	Tue, 31 Mar 2026 08:27:58 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7US3-0000000CanB-2ucB
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 08:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774945640;
	bh=UiHAnf4OYg3/oYdCjt52uagpeeIukVRJ+frHypKWT0E=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=B4kw9YjohiJrvW/MJCkEMikWBNEsp2LLg4FSoxqC7hdpAQS3XXgqYZtdLVNGxPoC+
	 cJZzp3uuY+9lKC0gsg59wBqMxIT3iBRk2sjNWKOVIA8+AocXT/loRzuhk1a+IrsNLS
	 AO2BdZ6qnRizT71ZbjFnPtROLU5EkQpbudDDPdwU=
X-QQ-mid: zesmtpsz5t1774945639t91087181
X-QQ-Originating-IP: QpOMtURX8OiWRWpBxqHNjoi1gsXtukgueL/swAiALnY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 16:27:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9614585065529904914
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 31 Mar 2026 16:27:04 +0800
Subject: [PATCH v3 1/5] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
MIME-Version: 1.0
Message-Id: <20260331-k3-pdma-v3-1-a4e60dd8b4b3@linux.spacemit.com>
References: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
In-Reply-To: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774945629; l=1475;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=wAz+iuTkp6Y7j7BJVKR8rJfy/kUKqSuh/ixh/RA9oK0=;
 b=pA9zOgLfuTMbcQXvvqaArR1Z9RpRmlxSlti/ejKkLRYJ9G4D2+O6UihfwJv5shUxDpQFFitPf
 Ipf2nWr+vUxANqU8sDftLZ04xNmLKGodX48wXRGIEYdNSHoLLmxEDvQ
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NWEwCzsFJJ7KsgGNGHIC37RXS6hMakRO1ixiwp9Fu/tBKr7L45fBzpi9
	WV2cuDgzfe3z/CftaOPan78JlvSULU97vo9K4pZ60YXa4hMS1uS0iS0vMX6aPVHTQq6azRT
	3YDcqAqmwFcMj5KetUWfF6jroZi9MdGn5Ny76Ba0xQFTKtvJYPq4qYnugKXbtQ6rg8261LA
	qcjTLH8umMVaGUFKCQeQH7xhig8WqgREvTbkExwgx1fDPZ9E79e95suJyjIooduiXrtkjwe
	z4Tv8x52U2B1dGIKThuaLakvGi22oVzP+sSumMhHqmr/Quz/f4IwUzUzbHHMMQ6ez79CcNZ
	YZKr2WPOcuI5PqwWP+px3zo1PMFNHvHbUbd/5gCDLMrU0ecrboJ24IDp5jletEGeGxUa4gW
	58gD6+99zw5Tzvvr7FpwFKm+b/HD3fQ0+CSOY9j6ngUZ8n5DBB/iCB6s/2++UwRGg3Wvdt1
	zhQoCmSry48unx2szxKFN7LiU+KDabQPRsy4XMXI/rpUez7hP4L4F+IbSJhykeSkcgCKffk
	N6zJd4/+ul+kQiEyHkhhC+QSWpMnqBu/R9LYSBS3Jnk/NIQlOi9D6e43JIG2DGLZ0VXhgiO
	jUobcUYnOTHLuQZTdj1EMNlusjPMQWTfTZGwqQmm3YKcYIyDDJ4h2AF6WDrw7xBd1AryDxv
	Hp6wVumEnmkNLQA12gTjYVsUmO/D4Yz3V3WFYunAq69+ucyB9UUTdhc9JMGeCoGeGRjMM7i
	QIw7RAMpLKX5pc3B5Mb4tw0nK5g5JEkQrKLXSbJyrwJT1IH9Yx/Rs9HWDlPT5TK0k6ucaRr
	WNVYHsQOQSwX14uY/G8OUsn6P+Peswkyf2Zt8Cb6YSPETXe7RJ5F/UsJ4ebhwMxh/j0PYqp
	L3NLIT4PcuNwS1l80DtdUNhaJw7t36q/rf04i/bcNZ+J0eupjqMUotldan2UcGFKpWDR+2c
	BGrXHPeKk7j/hS9syHryQkWQks2qrfSSNZPvCvnmpYz5oprWVdXN3ZY3p0YKnQH7hm8K5f6
	JApi1V8TKcovbHIZavnaQgb6zA2/3mkS8CRKE1pD83XjrLZH/4qnpHEV2uN2AtwWq0gFYQd
	IOfh9dahJigDWji3B/7UfzEbCe92DxqmweNxm2oLNd8f+TCr+dikIYJanUJrLkjBRX0lIA4
	/4qJ
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_012756_555671_E2B7B3EB 
X-CRM114-Status: UNSURE (   8.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guodong Xu <guodong@riscstar.com>

Add the "spacemit,k3-pdma" compatible string for the SpacemiT K3 SoC.

While the K3 PDMA IP reuses most of the design found on the earlier K1 SoC,
a new compatible string is required due to the following hardware differences:

- Variable extended DRCMR base: The DRCMR (DMA Request/Command Register) base
  address for extended DMA request numbers (>= 64) differs from the K1
  implementation, requiring different driver ops.
- Memory addressing capabilities: Unlike the K1 SoC, which had memory addressing
  limitations (e.g., restricted to the 0-4GB space) and required a dedicated
  dma-bus with dma-ranges to restrict memory allocations, the K3 DMA masters
  possess full memory addressing capabilities.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
index ec06235baf5c..62ce6d81526b 100644
--- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-pdma
+    enum:
+      - spacemit,k1-pdma
+      - spacemit,k3-pdma
 
   reg:
     maxItems: 1

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
