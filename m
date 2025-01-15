Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD55C02185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 11:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1w/NuckK+Ga2kL7jHyO3YS7SxFB/21+vKjb5J8qerqc=; b=gJipb/ONjk0TD7
	TVSu3bN5vvNS1GlZuRQv/Ia5Iob6xe5GM2y6zLX1FJWGbgAKwAGTojPU8DSsUmyYE3tSBr4VKMadg
	89dEt2xZxZHi9FNzDDwkEfaoG8jni60P2AUcuEXf2/VO5TzKtBvjvtDOBCXNS7ML6Vfon4+HbswwT
	943qgR92Vhj9YNB/fp+Z7XA0lE0oW18fHuhmyq2TJCco28L+N6gVihnlw01VI4h1s4p5jTFw3GWvU
	gCNPVBvrL9NF9/+yowuQ62wGqzOmYBqxy5EwSARwW4inbkI+aj1LcuVssCui6qQ0i55tOjhXmGQya
	dkm4xJJTDwExDHVU6VXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Pp-0000000Be3N-1npa;
	Wed, 15 Jan 2025 11:18:29 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Lp-0000000BdDm-0iZm
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 11:14:22 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 92B7F200FE6;
	Wed, 15 Jan 2025 06:14:20 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 15 Jan 2025 06:14:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	coelacanthus.name; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1736939660; x=1736946860; bh=cefyME3vts
	v5sxq1SOu8UxjoNujymAivw3tNwb5ahHc=; b=oRHyd1GLCtmaP88DZ05pDtICaK
	OXw8OwHKrV8RGJieDIm5D9l6iNnei/l4hT99f4K8RrtFscZE6ICqqnnLU+ZfQ3MU
	uruFIOmMbeQN0voNVhU+se82GeGFwSzrV8lY+yHw/KdaQCTIrl9uTyqP1r+OwLPu
	xXcpeWGpLHTZ23FFOUKh/Xy0aAj18F793ZXbThyN0dxM2NOZloQ7P4gxeMXMgCbn
	siNJlN3Aq0SbrlqJJNZgsa1Qq0E1u/VG0+pnUT2MRdYtHE8rlvxwbewJXdbA1B4R
	+Tbpbj79cJg8NRFyqaTWdirdQqnDQHlYVHkepAorS9CVeJvPngCgxZSljYLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736939660; x=
	1736946860; bh=cefyME3vtsv5sxq1SOu8UxjoNujymAivw3tNwb5ahHc=; b=i
	LhZEEsE7v4/MIZ3/8d3eXsH7iCiNgXMU3vV3irR8cGwgPliFyOSWdZKRyITcV5ZX
	eX8lLYDKBG2uB5SqnUsCdlNrRGrYoWCnFZqy8PJeQ8d3ECqs1sxktl9oSgbF3/N2
	kDWKqpFRkzqWl945myxuK6xbmVhNYChPxQpmOo8PCU/VPrGE24ruw0hsPNd6xVkB
	pTwhSFPAQte67aj4lyF9Fp5RW67iYRNYXMNnXUxnjbC/5boKWoEnA2omvs3D9uf1
	Jtc5zrNPWAXSiF/YgiAFRPiwkKZ7b4wzCRQWozO+WOxFv4RTgogUj2aMS7n9+jUp
	0UtHD1+TMLJgS4kJXiOfg==
X-ME-Sender: <xms:jJiHZxbSsfCqUf95of7OC24-2p5L0EV-ClWLC7Kao6vBJdRDwbhVwA>
    <xme:jJiHZ4ZTtEZbCXlN4AmuobdEZ7oGc8IM4VRx1R4UUvoOzFShm0MrOBOAz2LZ3ZVav
    gmvVWwNIx_ZGkvYA3U>
X-ME-Received: <xmr:jJiHZz9Mukh33k_c2Q71QSIuDY1M8gzwbwXSbu-8udA2p6PH8oeoyi6-YRCszQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehlecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffrtefo
    kffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsuc
    dlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfh
    rhhomhepvegvlhgvshhtvgcunfhiuhcuoehufihusegtohgvlhgrtggrnhhthhhushdrnh
    grmhgvqeenucggtffrrghtthgvrhhnpeeiteejtdevjeffgfehkeegfeelkeekvdehtdeg
    leevhfetheejheejiedtjeegteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehufihusegtohgvlhgrtggrnhhthhhushdrnhgrmhgvpdhnsggp
    rhgtphhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugi
    dqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhguvhes
    shhtrhgrtggvrdhiohdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtg
    homhdprhgtphhtthhopegsjhhorhhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehs
    hhhurghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrvgesfieirhiirdhnvghtpd
    hrtghpthhtohepvggsihgvuggvrhhmseigmhhishhsihhonhdrtghomhdprhgtphhtthho
    peiihhhouhhquhgrnhesihhstggrshdrrggtrdgtnhdprhgtphhtthhopehlihhnuhigqd
    hkshgvlhhfthgvshhtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jJiHZ_p8yoirq0EcEJs4pNcyVzPCl4xVNrX4_Vfl4fA0ZG98DDi19Q>
    <xmx:jJiHZ8qWO2loNniIisqDVl5Myx_rl0CJd3oE1wr5WxeJn_ludRUVzw>
    <xmx:jJiHZ1RM9wZuzMp0Nj7ScjQ4FHmZqnwh1YK86CaFj8FwyYibBJpAqw>
    <xmx:jJiHZ0qJ7M1fr_2DIpRtKB46S2Tc7XBHo_PKdIWfltATRea6NKy88g>
    <xmx:jJiHZ1avV5TKlpawZcjICMQ0SOcK1zY9bgQtc5lUOQxr0W_XHUeq-yM2>
Feedback-ID: i95c648bc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jan 2025 06:14:19 -0500 (EST)
From: Celeste Liu <uwu@coelacanthus.name>
Date: Wed, 15 Jan 2025 19:13:28 +0800
Subject: [PATCH v6 2/3] tools: copy include/linux/stddef.h to tools/include
MIME-Version: 1.0
Message-Id: <20250115-riscv-new-regset-v6-2-59bfddd33525@coelacanthus.name>
References: <20250115-riscv-new-regset-v6-0-59bfddd33525@coelacanthus.name>
In-Reply-To: <20250115-riscv-new-regset-v6-0-59bfddd33525@coelacanthus.name>
To: Oleg Nesterov <oleg@redhat.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>, 
 Andrea Bolognani <abologna@redhat.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ron Economos <re@w6rz.net>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, 
 Guo Ren <guoren@kernel.org>, Yao Zi <ziyao@disroot.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 Celeste Liu <uwu@coelacanthus.name>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4577; i=uwu@coelacanthus.name;
 h=from:subject:message-id; bh=WV0NqvqtTK1mWkN78Oo6GA0cv0m8xWUUF/b/ZrqzqEo=;
 b=owJ4nJvAy8zAJeafov85RWVtBeNptSSG9PYZFdHJnxQvWgTnrrt4QWqTwV/zbd1fOHm+8piqL
 H7LlzfPIKCjlIVBjItBVkyRJa+E5SfnpbPdezu2d8HMYWUCGcLAxSkAE6ncz8iw/93V6o+mZ8wn
 SyYeMDt4u+nxizae6PPGbtsbv/s84zRlZPif1tGg3LzHjPPH7vwT/EXzzTbECkmeEP4343DKkhA
 j9i9cANkLSSY=
X-Developer-Key: i=uwu@coelacanthus.name; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_031421_287417_44C9436A 
X-CRM114-Status: GOOD (  16.98  )
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

Some macro defined in stddef.h are useful and have been used in many
code in selftests. Copy them to tools/include so developers needn't
create their copy in every files.

Remove some definitions like NULL and true/false to be suitable to
non-kernel environment.

Signed-off-by: Celeste Liu <uwu@coelacanthus.name>
---
 tools/include/linux/stddef.h      | 85 +++++++++++++++++++++++++++++++++++++++
 tools/include/uapi/linux/stddef.h |  6 +--
 2 files changed, 87 insertions(+), 4 deletions(-)

diff --git a/tools/include/linux/stddef.h b/tools/include/linux/stddef.h
new file mode 100644
index 0000000000000000000000000000000000000000..55f3964d9a3d9f9f9345a75248eec027c56faef9
--- /dev/null
+++ b/tools/include/linux/stddef.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_STDDEF_H
+#define _LINUX_STDDEF_H
+
+#include <uapi/linux/stddef.h>
+
+/**
+ * sizeof_field() - Report the size of a struct field in bytes
+ *
+ * @TYPE: The structure containing the field of interest
+ * @MEMBER: The field to return the size of
+ */
+#define sizeof_field(TYPE, MEMBER) sizeof((((TYPE *)0)->MEMBER))
+
+/**
+ * offsetofend() - Report the offset of a struct field within the struct
+ *
+ * @TYPE: The type of the structure
+ * @MEMBER: The member within the structure to get the end offset of
+ */
+#define offsetofend(TYPE, MEMBER) \
+	(offsetof(TYPE, MEMBER)	+ sizeof_field(TYPE, MEMBER))
+
+/**
+ * struct_group() - Wrap a set of declarations in a mirrored struct
+ *
+ * @NAME: The identifier name of the mirrored sub-struct
+ * @MEMBERS: The member declarations for the mirrored structs
+ *
+ * Used to create an anonymous union of two structs with identical
+ * layout and size: one anonymous and one named. The former can be
+ * used normally without sub-struct naming, and the latter can be
+ * used to reason about the start, end, and size of the group of
+ * struct members.
+ */
+#define struct_group(NAME, MEMBERS...)	\
+	__struct_group(/* no tag */, NAME, /* no attrs */, MEMBERS)
+
+/**
+ * struct_group_attr() - Create a struct_group() with trailing attributes
+ *
+ * @NAME: The identifier name of the mirrored sub-struct
+ * @ATTRS: Any struct attributes to apply
+ * @MEMBERS: The member declarations for the mirrored structs
+ *
+ * Used to create an anonymous union of two structs with identical
+ * layout and size: one anonymous and one named. The former can be
+ * used normally without sub-struct naming, and the latter can be
+ * used to reason about the start, end, and size of the group of
+ * struct members. Includes structure attributes argument.
+ */
+#define struct_group_attr(NAME, ATTRS, MEMBERS...) \
+	__struct_group(/* no tag */, NAME, ATTRS, MEMBERS)
+
+/**
+ * struct_group_tagged() - Create a struct_group with a reusable tag
+ *
+ * @TAG: The tag name for the named sub-struct
+ * @NAME: The identifier name of the mirrored sub-struct
+ * @MEMBERS: The member declarations for the mirrored structs
+ *
+ * Used to create an anonymous union of two structs with identical
+ * layout and size: one anonymous and one named. The former can be
+ * used normally without sub-struct naming, and the latter can be
+ * used to reason about the start, end, and size of the group of
+ * struct members. Includes struct tag argument for the named copy,
+ * so the specified layout can be reused later.
+ */
+#define struct_group_tagged(TAG, NAME, MEMBERS...) \
+	__struct_group(TAG, NAME, /* no attrs */, MEMBERS)
+
+/**
+ * DECLARE_FLEX_ARRAY() - Declare a flexible array usable in a union
+ *
+ * @TYPE: The type of each flexible array element
+ * @NAME: The name of the flexible array member
+ *
+ * In order to have a flexible array member in a union or alone in a
+ * struct, it needs to be wrapped in an anonymous struct with at least 1
+ * named member, but that member can be empty.
+ */
+#define DECLARE_FLEX_ARRAY(TYPE, NAME) \
+	__DECLARE_FLEX_ARRAY(TYPE, NAME)
+
+#endif
diff --git a/tools/include/uapi/linux/stddef.h b/tools/include/uapi/linux/stddef.h
index bb6ea517efb51177a7983fadad9b590b12b786e5..f2548fd95f6e1d8cb218d52918bb81a3317d10b1 100644
--- a/tools/include/uapi/linux/stddef.h
+++ b/tools/include/uapi/linux/stddef.h
@@ -1,8 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _LINUX_STDDEF_H
-#define _LINUX_STDDEF_H
-
-
+#ifndef _UAPI_LINUX_STDDEF_H
+#define _UAPI_LINUX_STDDEF_H
 
 #ifndef __always_inline
 #define __always_inline __inline__

-- 
2.48.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
