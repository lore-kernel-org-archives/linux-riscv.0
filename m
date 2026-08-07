Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73038C5AC9E
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 08:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wnmUGQmDW/Ng67HcQRsIbugsqhC3W9cRRK+POPZTws=; b=fAZNeJCjFc/T6B
	H4EDT/k4i6huHMEfv9k/Ln8SNSjIpGOdMPrRxCGGXbZpeElqWJ62d18RGLoMt1OK/68O18JLojn4w
	9JxgSF6afrf9KVcgp1DE/Iog1vQAP+mXVrP6YrSSrwJtM3vxE6BtQyAp4/t0p7p1Am13mr9eS3P7R
	uH+v1gcmvRD7WGq/zLsBOKrKCz8f4JhCQrNg5BXORQfoDBtmlPzSgH4ZKkDUb2kGOgtMHH6Gk8MQt
	+RBzIbi6c9scGEPiXLs6Ef71rllCscns6XHoF+Bdk/7RfscluuZw4D30jjkyxdpoZJKEMoPou2HIw
	lsx0+APtY9iwNYzr2A4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFeF-00000007LKa-3FtW;
	Fri, 07 Aug 2026 08:09:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFeD-00000007LGl-3HPy
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TSyM0jx2ZULPKz+yUIhCrtjTjYl/ed++j97PAJ68moY=; b=YqMXJOGhEnr7ozd6GOMtZolAkm
	PsCEg5tOYsX7npPm/ZLG6yZBfsoytPLgT6Lm/BqZj2XtjOObDEh4k3wpQ9CgKPsB2YlNQpveNofGh
	CuxilCapiAC8RCSY7OSB/u7gLrN442Hagnud58KgY8OnA8JHYTTOJN1iVSRzjx8zBde+sjVXYOM9P
	ue+EYuavWjD2SN6FMUFz36DQYobl2P9+5vVo+lMsfSdmC674Bqk5VPSU9PNVPvugF+KwEnTAff3xa
	9EY0AuahVG6n+3pUI3pZumONiV4d8uRbOQ3lj8xyTIWJvJOV7n+hH4HfAHK+NMFkQtaCUxeaEFROH
	7WVKe7XA==;
Received: from mta1.migadu.com ([37.59.57.117] helo=out-173.mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFeA-0000000CAd3-2zX8
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 08:09:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TSyM0jx2ZULPKz+yUIhCrtjTjYl/ed++j97PAJ68moY=;
	b=XHR0jnljj1zJs9QYeAhOAtz+STgQ3kT6acB7mg81ppPFCOQrR4IwkzKNCfzPiAl7dF8sHm
	zVH/Xr8l3FMCH9/1VRrp2WJljWRvI2ahAfGMgGtunDRyQmybwA+Xt/OnBcXU0jBCz2MKmT
	8OOTNmYoU5jlDhFjQJtQALM1cxKUmS0=
From: Atish Patra <atish.patra@linux.dev>
Date: Fri, 07 Aug 2026 01:09:02 -0700
Subject: [PATCH v9 07/20] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
MIME-Version: 1.0
Message-Id: <20260807-counter_delegation-v9-7-58658104e487@meta.com>
References: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
In-Reply-To: <20260807-counter_delegation-v9-0-58658104e487@meta.com>
To: Will Deacon <will@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Ian Rogers <irogers@google.com>, 
 Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 James Clark <james.clark@linaro.org>, Namhyung Kim <namhyung@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_090942_975539_5A413E08 
X-CRM114-Status: UNSURE (   7.86  )
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

Add the description for Smcntrpmf ISA extension

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Link: https://patch.msgid.link/20260701-counter_delegation-v8-7-7909f863a645@meta.com
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ccff2be1224d..eee65cf73d6c 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -181,6 +181,12 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcntrpmf
+          description: |
+            The standard Smcntrpmf machine-level extension for the machine mode
+            to enable privilege mode filtering for cycle and instret counters as
+            ratified in the 20240326 version of the privileged ISA specification.
+
         - const: smcsrind
           description: |
             The standard Smcsrind machine-level extension extends the

-- 
2.53.0-Meta


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
