Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD52CCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 09:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3pDlAzp+1sfVYWy8/Hw6AUCcyYIj5GO4ijnlfqHVas=; b=TKXNHy+pB5lNgj
	eE7dbWnfjJSOjFDl2DlTFaQSNZKTggFtaEGux/SG4rL4kEgbDgVEeKU9Fm98TzVXRL5wBp2zkh2xC
	upDbUx4t9cfvzPqxizMqXc37M9z2E2GT40PBYAthc7T5hqsgtW1fhqq1TMEy7gNelMSxLf5nzJkv4
	mqKGW40B62IBePhV9pQGYW4Fhq+6ZHvyJVmpZ8Ga8mMGcy1fCKqQyGyP0Z01cz2v31cVKAO+vTbnf
	Ban9YUQYD3+m9ILA3mOVA7ng8Tpqpb9PhE52p91Wl8T8swhrKHlJJHf7OMRSCfPJAPCvjXqkRihhS
	fuXwu+am0Sjtcc25nV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8vp-0000000GVRA-1ZqQ;
	Tue, 21 Oct 2025 09:45:29 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8vm-0000000GVP8-2Xu9
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 09:45:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761039917; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KXPM+rVpOPjpUeBEDfR7+xmSetNxtfUKxpvbsPNSQZlGAcdYe2z+ch5XsJQJYFmDMBQ/L+R0FG0DB8Owy4K/uxuBPZohXOLxdyTMMyvwSNC/YReM95jY8crduwDwtS0cb9ISlPb+iWqyA5VDs1e5x4OlMRwdZA4ovwEo33Z4Csk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761039917; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Tx1F4S/ptu3BmWEn2NV0nloWcaxAiOTKuzP+EBsZYF8=; 
	b=SXFLLkNWQNpRbcPbZEG3Vo+Wuw8sGXbCVQTEmGbe4aRs/xVmdwwbCdmrN/YBqLcSDPPhOFFmIbBKz70bCtVF6NaeSk1ibjNBRuGa8+CMMVCrjIv7mF/k6C2C3aL7DFhyU6ZpZkupBNs1k2YuvTAlvJeZozCYabX4U0ryUxb1e2s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761039917;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Tx1F4S/ptu3BmWEn2NV0nloWcaxAiOTKuzP+EBsZYF8=;
	b=kOfFved3byAitNZR96TYYUcJo8tzHIzRe5kz1bg7jQwTd0ZVWXAkA/3YNRTpKIrb
	z0R7Ieka7GwuhXpBjExESFL1X6YDyW0J+8Ut2M8W61vqkyoeA4s7PmATGxMxoYASbGC
	3AhPoAcUSA2XDsvzAGO3ooJVq5teoNkSCHW6nI7s=
Received: by mx.zohomail.com with SMTPS id 1761039915364293.16697789941225;
	Tue, 21 Oct 2025 02:45:15 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 21 Oct 2025 17:41:41 +0800
Subject: [PATCH v3 06/13] dt-bindings: interrupt-controller: Add Anlogic
 DR1V90 ACLINT SSWI
MIME-Version: 1.0
Message-Id: <20251021-dr1v90-basic-dt-v3-6-5478db4f664a@pigmoral.tech>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
In-Reply-To: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>, 
 sophgo@lists.linux.dev, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761039846; l=1073;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=fl5hyCXAvBdfFabZv8zxxn9xdRe/LUyyfUTfBWPaLXQ=;
 b=2S9mRH95qJPBW6vFhIShFG2busZR/MOSiAMG3107LGqQzuoGCjUX329dm+rbjQV9el6lugf9E
 QoSLY7yDt8EBla8fG3/Z/IwoKsKP0F2jhD5q4mowyYbmr4mp+hLSlJJ
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_024526_694220_A285F27B 
X-CRM114-Status: UNSURE (   8.04  )
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

Add SSWI support for Anlogic DR1V90 SoC, which uses Nuclei UX900 with a
TIMER unit compliant with the ACLINT specification.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/interrupt-controller/thead,c900-aclint-sswi.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
index c1ab865fcd64f1347e7eda7f538c7669f55ff906..d02c6886283af790d75357f77a714558f68bb7d1 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -30,6 +30,10 @@ properties:
           - const: thead,c900-aclint-sswi
       - items:
           - const: mips,p8700-aclint-sswi
+      - items:
+          - enum:
+              - anlogic,dr1v90-aclint-sswi
+          - const: nuclei,ux900-aclint-sswi
 
   reg:
     maxItems: 1

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
