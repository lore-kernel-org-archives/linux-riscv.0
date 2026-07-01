Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDD6C44500
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 08:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hMrxVeenm9TacfyE5zqoD+j9+06hzICaLNP7Pk3eNE=; b=tbIWz1jzFjx4QK
	y3/pWtp5r43oaqOfoxOGKKoDuJgybIUyv6aXXsUaOVy8FiB7oaHqlhh71YeViX7YB5BtrjHNBkYjC
	YEKZ71vnxzIWnQj4FJO/pOC480+surBhYmuYOA9pSaPqbuw0V7I5hH7kpdLht2E7ZLvCkkuYEqzHO
	sdU3nmBLC7QrGBxOgGfPLEWYIYL+dh1SF/NoqhUjiKyx5BvvsThkaDAKDptI9njlFllWCWz1N1ilQ
	GCzEjYDfYlydnKmIwGNKcjx3LrVqAQ5/QTrkfwlRdR1JqlxVNDGF4uquseSbMeoUqUGLVInVYeUYU
	2smwfaeO0EsJ2BcXau+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqbc-0000000148f-2wYu;
	Wed, 01 Jul 2026 08:47:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weqba-0000000145s-36FN
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 08:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=q3CU0znujUTwcxjeKNolaCbQsHD6AswnEQkiO1fL85Y=; b=kipOBfe/DrFf1EFKnjjCn9leG7
	lq21iWkM5YlfeQz6u7qO31p5MVVlbyJg7bJOG3lYlctjgfWGboWH4HyyRSAM1GPStk1SG0/Q/oW5q
	1K4iO/bSHKUPwj8Z+Rqs92LzklhU1MNztAWBumSGvLwIOw3h3O4H8pvItxsIgqzR990ByKWWw6bWQ
	NwM+D4b2d/3+/KtXgA58Ku1TsHZZGBj/lGmMgC1hKVtgzOLgD5HjIhtPRWgQb8xmppzVvr+XGHO/o
	Ba3YTpzTki12Lj5y0MRDx+gEYH/USLPDrWW4Y6HXUgeDoEzppB4pkvLLRHLVFvWYUfaJ+ZF0d4O5l
	uY7PIPUg==;
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weqbX-00000002WZo-3ao5
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 08:47:37 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782895652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q3CU0znujUTwcxjeKNolaCbQsHD6AswnEQkiO1fL85Y=;
	b=h4ZVPuN74ylcIjDvtDiE9C6IU/R16DyA59zWn/3nQKQidAqMCx8sdQv7Amia68ooxMEwQz
	mlyA7yuRlFOjNn5Zblo29Zy1Fc2IxS+BQoaCEuJfeUsM4EwVv7ttTMZfZxwESQmUuCmocr
	/6IkNJqlll6D/svFSUmOWZU2DxUo1po=
From: Atish Patra <atish.patra@linux.dev>
Date: Wed, 01 Jul 2026 01:46:52 -0700
Subject: [PATCH v8 04/22] dt-bindings: riscv: add Sxcsrind ISA extension
 description
MIME-Version: 1.0
Message-Id: <20260701-counter_delegation-v8-4-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
In-Reply-To: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
To: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Atish Patra <atish.patra@linux.dev>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_094736_041149_70A54B9E 
X-CRM114-Status: UNSURE (   8.13  )
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

From: Atish Patra <atishp@rivosinc.com>

Add the S[m|s]csrind ISA extension description.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb21..15cf0e2ee3ed 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -181,6 +181,14 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcsrind
+          description: |
+            The standard Smcsrind machine-level extension extends the
+            indirect CSR access mechanism defined by the Smaia extension. This
+            extension allows other ISA extensions to use indirect CSR access
+            mechanism in M-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -226,6 +234,14 @@ properties:
             Profiles Version 1.0, with commit b1d806605f87 ("Updated to
             ratified state.")
 
+        - const: sscsrind
+          description: |
+            The standard Sscsrind supervisor-level extension extends the
+            indirect CSR access mechanism defined by the Ssaia extension. This
+            extension allows other ISA extensions to use indirect CSR access
+            mechanism in S-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: ssnpm
           description: |
             The standard Ssnpm extension for next-mode pointer masking as

-- 
2.53.0-Meta


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
