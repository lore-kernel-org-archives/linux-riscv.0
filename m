Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91227CAC5A7
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 23:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhNiIehNM7PmQKptGz06rTO/kldYrBZUIV6fkeum8d4=; b=ikrdAfRTcS2iiD
	ZMcMq7Do3J6GNKBbBGwvsRFX9MdBUPaI6E69J8KVCnCgtjdXPk/y2RfRbMdJ3BwqLErnkUZLRbrZC
	+jTRkBG2KL0MhQshNJ5HEFlHtk4MYpqi5ELV/f7oBBO0Sgolw3Hsap3WMq/9UfCMcSGFdtQNT38V5
	PZIQcGuMUyW6lM7+OQK6YsWW/zbLYLMEAh4KvffGKgVcUt7JlnEJvq0t89oDDPS3oimoDDs+yyy8X
	UBzfqcfhzMZZmS+GAUodSX7+/pzCFiWr8uMzy+raxoCTL57Ek/UMnQ+luHHFYh6EeqKUlXLK14JtU
	DBX0B4kSgWQh4CjXjdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v07ND-000000065um-2Lbc;
	Sat, 20 Sep 2025 23:52:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v07NC-000000065uP-0dDV
	for linux-riscv@bombadil.infradead.org;
	Sat, 20 Sep 2025 23:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OQHyI3oZ2gPGecka5CDlOMBxzDlmdM9hFPqCYvU7Qi4=; b=qsobdESnnaeOBmNwLrx8uY7/mR
	U4ssJZCnG9afnb/8dZS0cWvcyKCGq2FjQOJGEi+KZFb3zO0b0tmI6SWVmeRVqRDyPV5WSd4UWbx8M
	S4PQOwCzZBDuS1rrzc9cbAzzhO1EUaVaVEL6KRDD+VzCONiyBRmS8skauoAjjegL6TrNEsNzBpfM2
	fGPWPx4t0Qf8EIzIJICybt70qZ+YetiIF8ch32OytkSAiX+8sUk2r8PqRdfDp/6i8i4Aek+X3oCxI
	gzqY7NY8QKcUJ0iKRo5xxR3Avn50BxDeoeXZ3zbBTK2RqH7biOjO30eM7XM5o/mqf9DCmzhahcwpn
	/svuPdkg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v07N8-000000083Vg-28bD
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 23:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AE1044B2D;
	Sat, 20 Sep 2025 23:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EFCC4CEF9;
	Sat, 20 Sep 2025 23:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758412322;
	bh=uXeBhkQI8P5Fv4fD7In2Mcgow0lPIEHbQ1emGeRuBwg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DIUVkayVUa4krjWwr2K/M6Dc0TSNaINEWKotMxb+GWdRDmHmCcSEBhVkUldzeFCwX
	 O1opGNEQgjyyuitXJnUKnLrmgSyw2D/YYbshSt4MNxrkVNWcDFVJcbiTSAE+pBcXVp
	 IdFo5+kXOvADlhsPSzbUaS8CsT2wqg15QRDfbH/aSit7CUOuUk11FTkyafdLYPxHjc
	 0XwOVjfzJKR7YP7HVgTcuw7nbgiDReeKanDz9l9nnIUoQBIbQukRas86u4o6vqqAmA
	 7Sr9k247ULsfd1kdyz58kERi80R/oyar74WKrWu/XcEppp5GjN6T1xsCj1MDMjN+k3
	 UZ9Ctk4hRr3Yw==
From: Drew Fustini <fustini@kernel.org>
Date: Sat, 20 Sep 2025 16:51:42 -0700
Subject: [PATCH v3 1/3] dt-bindings: riscv: Add Ssqosid extension
 description
MIME-Version: 1.0
Message-Id: <20250920-ssqosid-v6-17-rc5-v3-1-5093162922d8@kernel.org>
References: <20250920-ssqosid-v6-17-rc5-v3-0-5093162922d8@kernel.org>
In-Reply-To: <20250920-ssqosid-v6-17-rc5-v3-0-5093162922d8@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 James Morse <james.morse@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, guo.wenjia23@zte.com.cn, 
 liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Drew Fustini <fustini@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_005207_047483_5F8E2096 
X-CRM114-Status: UNSURE (   7.31  )
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

Document the ratified Supervisor-mode Quality of Service ID (Ssqosid)
extension v1.0.

Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ede6a58ccf5347d92785dc085a011052c1aade14..94c5786507f09be632e2748eea93b998ee8710a5 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -165,6 +165,12 @@ properties:
             ratified at commit d70011dde6c2 ("Update to ratified state")
             of riscv-j-extension.
 
+        - const: ssqosid
+          description: |
+            The Ssqosid extension for Quality of Service ID is ratified
+            as v1.0 in commit 5059e0ca641c  ("Merge pull request #7 from
+            ved-rivos/Ratified") of riscv-ssqosid.
+
         - const: sstc
           description: |
             The standard Sstc supervisor-level extension for time compare as

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
