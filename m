Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C06C43602
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnzZg4bVAqfztPEMwJ7IuGjPJnGEpeKrZxWe6vm5K1o=; b=eAmVyrYVFRD8kP
	E4Enikr8Ib2t9CBkFggSeGM+pb83iBOmtVPLEwCYuGAG4B9tQxIzQWqD2LitGN7QzWIQxBUzUflnj
	/9brFVEL04nfifKWRmNA6n74ToY0RXF04VS5NNHC+VjT5axrzvDeVuiPvN5mWKKRLeXHN7bwPUcKO
	CqtGH4njuyo0X9kqZ22a1y6a/JSJKefZpWEte+18rSUvvzYInbfHTeXGAqHz5fW1dfRmbtsarc7+N
	HOEtAJkowZenPLPeVDaRTbtVtYFa14da8D43h5cSZzW46Z+zexMJoRQhIPuT5RQD1oHFIScvigrsJ
	BWKd8IWCqSEy9AxqiPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3h-0000000GVR3-2dT5;
	Tue, 30 Jun 2026 09:47:13 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3a-0000000GVLS-2pVR
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:47:08 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2c9e8a1d256so20352395ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812826; x=1783417626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1mhPayeB7vwAFK9b1yiuy8iVzM6luMZwkJqwu4SqsU=;
        b=PCNv0+rK4ZCnbZesz4b0bVkk71vZ1LoihIItQaqM83lQKVvuU7DQZ04c5AOrzk0Xzs
         uW6vgzc+6vDZCn5sx069GcwnHyCwwo9LzfuqIAvJMhD0s7m0ZdWCuqr9o09Oe4kSArzr
         VhgMNxD8NVxsslnWbcSKoz70QVQXgX23CnQRi4BLsmrlAnqX2PbS1qTTFOIVzsFEyMGH
         Iv3h7W3tpmvGlJPxHLrBbC/53j4rouDWC6DAPEHHwb1lTW9LCauVPILRYFHqLuSME9at
         kAveBIAe41ZHz8AbMPdPeO2vP0bMup6gsFAWj8ZCyLiZqYhQN+pwsHnzqEsHA8v8JRxe
         J+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812826; x=1783417626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q1mhPayeB7vwAFK9b1yiuy8iVzM6luMZwkJqwu4SqsU=;
        b=KX8E2hfqsHTyASch5wp2cgxxQxbxTL036iYdIila2RVY0C1e2AW3JmD99iz+XXj1q5
         CU4xQcUdifFFKTn5WWWnEeN6TVGNhJaDvQKn0W2wyRStp6XpCzN9K01u5z/FxG8ml94p
         DFCQLnetCZwK/xQUNvr41xwhzl1ub8ebEwwRQ6FSlTZV6UYv970Ku4NuXIhfZFAqFUwA
         vWXCsdMkNpwmFcF3UVTkR9mweOktVm/pIiiRKtOTxGfPD2JPHqfmCVqZA2q33U9QZMl2
         XqXdOMs9u2l3H2831WdsfBGx7Amn0rlQuhwZ9XA5HlcDRv5FBV2BHQFmwZiYlVK6Dits
         4I/w==
X-Gm-Message-State: AOJu0YxLc2kwNTAOw6YOGqqQsT2dJgpG19KNyx+56NtRjCOT+ZjxXrPm
	vqVC/vObfjw2rF5z5ezwpY1n1tmaHzH78bxMasaE4f6m5uucTgjcTmy9+u2p6Dc/86Y=
X-Gm-Gg: AfdE7cmbA7JrXpXX2AJ2L7WqXDD80bgOH9TiN9WnAyWr1GeIXtsVirWHAnrSq1GhF2/
	jDDN7rEYhf+VG4GwAqnbhttaCxd/UrGAy6sVp5vC+coJ0mkG/zZftrqRCfbVeFDnqSOWQ6d8TOM
	JyW+XbRXGW8M9aOdCMvRvnoieTruoa/rT7DkR/i0XeIuhg0T0+HQxW/XlS3uHNQj/w9MV/+oO8c
	SRdiKvKWjRowIa+P0nBe/p37bSV9PmRo44lwcMfpQVRBeUntQQJxzalExygPFe2zDrjyFbPwY0E
	upkCsWHg8ipJ8D0gA1mrUTJ3TpYJwujyc6D80V5/wUJqskm8Y3bc8KaSSunBR+CYPzN3Xzgti3C
	pEMZ75p2LD12dzbjOXUNwG29wdRsWOEFzQ63aV4GHSOfhMQ32aR8RFkZJQ8t8ZHCRzX8Wu/m7f0
	X1mELUKNAxPzRLvWhPUtKV5DW9b9hgR4k=
X-Received: by 2002:a17:902:d2ca:b0:2c7:1200:bd7e with SMTP id d9443c01a7336-2ca2d56543dmr23326695ad.18.1782812825774;
        Tue, 30 Jun 2026 02:47:05 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:05 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:27 +0800
Subject: [PATCH RFC 04/12] rvtrace: Pass struct rvtrace_path_node to start
 callback
MIME-Version: 1.0
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-4-c9c1ffc64e4b@sifive.com>
References: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
In-Reply-To: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
 Eric Lin <dslin1010@gmail.com>, Eric Lin <eric.lin@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=5312;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=1lAuX1dOvob5WlUR4elT7eSNAOc5CKgC3zoG2VGlYfI=;
 b=PARNFRWmdV+hB1v3H2XemPeF/EkHqwMQ8r/pB59m0oP1gyQQ3yYXpQCsIuW7KshBvhM9xGAWZ
 SlzwX8msXa1CckSJJMhBxH+q5aGwJ1GgxwvfwQaS6lNJmy07sUyzQ5W
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024706_773404_69C5883C 
X-CRM114-Status: GOOD (  16.21  )
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

Routing trace data from a source to an output component requires
configuring the connections between components. The mechanism for this
configuration varies between hardware implementations:

  - Standard (ratified) RISC-V trace configures routing at the
    receiving end. For example, a funnel uses the trFunnelDisInput
    register to control which source input is accepted.
  - Pre-ratified hardware (e.g., SiFive) configures routing at the
    sending end, selecting the output destination by setting a bitfield
    directly within the current component's control MMIO register.

To seamlessly support both ratified and pre-ratified data flows,
component drivers require full path topology information (i.e., the
component and its connections) when starting, rather than just the
component itself.

Update the rvtrace_driver->start() callback to accept a
'struct rvtrace_path_node' instead of a 'struct rvtrace_component'
so that component drivers can access the node and connection
details required to program their specific routing registers.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c    | 12 ++----------
 drivers/hwtracing/rvtrace/rvtrace-encoder.c |  3 ++-
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c |  3 ++-
 include/linux/rvtrace.h                     | 14 +++++++++++++-
 4 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 51546cbcc6ad..12ffc6917c70 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -501,12 +501,6 @@ void rvtrace_unregister_component(struct rvtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(rvtrace_unregister_component);
 
-struct rvtrace_path_node {
-	struct list_head		head;
-	struct rvtrace_component	*comp;
-	struct rvtrace_connection	*conn;
-};
-
 struct rvtrace_component *rvtrace_path_source(struct rvtrace_path *path)
 {
 	struct rvtrace_path_node *node;
@@ -625,17 +619,15 @@ static void rvtrace_release_path_nodes(struct rvtrace_path *path)
 int rvtrace_path_start(struct rvtrace_path *path)
 {
 	const struct rvtrace_driver *rtdrv;
-	struct rvtrace_component *comp;
 	struct rvtrace_path_node *node;
 	int ret;
 
 	list_for_each_entry_reverse(node, &path->comp_list, head) {
-		comp = node->comp;
-		rtdrv = to_rvtrace_driver(comp->dev.driver);
+		rtdrv = to_rvtrace_driver(node->comp->dev.driver);
 		if (!rtdrv->start)
 			continue;
 
-		ret = rtdrv->start(comp);
+		ret = rtdrv->start(node);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
index d189819aecf7..f0a4ac46b6a9 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -11,8 +11,9 @@
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
 
-static int rvtrace_encoder_start(struct rvtrace_component *comp)
+static int rvtrace_encoder_start(struct rvtrace_path_node *node)
 {
+	struct rvtrace_component *comp = node->comp;
 	int ret;
 	u32 val;
 
diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
index e4b6f0547245..7aa525ac0f75 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
@@ -43,8 +43,9 @@ struct trace_buf {
 	size_t len;
 };
 
-static int rvtrace_ramsink_start(struct rvtrace_component *comp)
+static int rvtrace_ramsink_start(struct rvtrace_path_node *node)
 {
+	struct rvtrace_component *comp = node->comp;
 	int ret;
 	u32 val;
 
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
index 9f1afcfd83e6..079fe16807d3 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -281,6 +281,18 @@ struct rvtrace_path {
 #define RVTRACE_INVALID_TRACE_ID	0
 };
 
+/**
+ * struct rvtrace_path_node - Representation of a node in the trace path
+ * @head: List head for linking nodes in the path
+ * @comp: Pointer to the trace component at this node
+ * @conn: Pointer to the connection leading to the next node (NULL for sink)
+ */
+struct rvtrace_path_node {
+	struct list_head		head;
+	struct rvtrace_component	*comp;
+	struct rvtrace_connection	*conn;
+};
+
 struct rvtrace_component *rvtrace_path_source(struct rvtrace_path *path);
 struct rvtrace_component *rvtrace_path_sink(struct rvtrace_path *path);
 struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
@@ -324,7 +336,7 @@ struct rvtrace_driver {
 	const struct rvtrace_component_id *id_table;
 	size_t			(*copyto_auxbuf)(struct rvtrace_component *comp,
 						 struct rvtrace_perf_auxbuf *buf);
-	int			(*start)(struct rvtrace_component *comp);
+	int			(*start)(struct rvtrace_path_node *node);
 	int			(*stop)(struct rvtrace_component *comp);
 	int			(*probe)(struct rvtrace_component *comp);
 	void			(*remove)(struct rvtrace_component *comp);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
