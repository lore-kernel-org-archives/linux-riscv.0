Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37814C47089
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPlJmaS2QG2scUoJEu3IbT2iN+t6kuvwIgIFcPIXD8E=; b=wjwvJy/CvlGC9A
	GfKBECAQNdY3vJxMPOn7WG283RvBbK0nFqoV1mcwwiaN/eL5qmmjVUYLuHIgP6m6+fMgAso2AjDGF
	up1WfRkRDFUJ5Oq5xuodT26j6uX8aHxRKt/8cL3LH0flhJHntw9Tyw2P26MIHysqZw8bDv0e/RYAE
	cA+DxGmLwsfl7Y3WlbC/j4C8BEeEM5jPQ9OeuxEpt0Tkl01HV4n3KaizsQ1az5hdzd3ia+V7l3OvF
	ojsaQTEy3ote/nrgHaX+NUqOCc84SVZbZkhRAvn7mbzZbbCHUmz0QLivXwVst3XaC7HrAAazxE8l0
	LA4P3drfnrROIbWakjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0XBM-003X5v-6d; Thu, 01 Dec 2022 00:12:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WiN-003Jpr-OL
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:42:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 63BABB81D76;
	Wed, 30 Nov 2022 23:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89BFC4347C;
	Wed, 30 Nov 2022 23:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669851725;
	bh=Z7aEnVV+jWqoN52K1e+YmgnpAmHL+qz1PmK3NhAzRxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EnIw4/IrxANCSz/9VMiRA2KIF6h3JhMAHa/K90/tVJu+PWuZwyGcVwk6Y/zm+B+jL
	 SlBUCNPTLbcVhrHzZob+j5KwC/UXl07hBKXLBafS0wmQjHhK9Fw9J/vp4+JR7Y94uS
	 TBP2keeu8Tg48fv4xCCzWzvNHS7gGuGlALoUG+FhDzeU/snOwUnk+ZLnOvmNTK/YGA
	 lnuxunckxgcjRYxr0IB9pBW+hzIHmoPtb27IEAy2PWT44dlttLMlsVwte40Y/vhbPA
	 sVQJHXRlDzCKMWkh3ALONUhRQT9ISq2l2EOKGhVynuXRuW2SWJGFVPd6riRsdahpDe
	 SiRZLV22KB8Hw==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	corbet@lwn.net,
	guoren@kernel.org,
	heiko@sntech.de,
	paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 3/3] Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo
Date: Wed, 30 Nov 2022 23:41:26 +0000
Message-Id: <20221130234125.2722364-4-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130234125.2722364-1-conor@kernel.org>
References: <20221130234125.2722364-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_154208_137999_4F32A1E0 
X-CRM114-Status: GOOD (  12.75  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The RISC-V specs are permissive in what they allow as the ISA string,
but how we output this to userspace in /proc/cpuinfo is quasi uAPI.

Formalise this as part of the uAPI, by documenting the list of rules
we use at this point in time.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I've not "tested" these docs. The NIPA-esque pwbot should go and
test it AFAICT. If it doesn't, I'll go add that.
---
 Documentation/riscv/uabi.rst | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
index 21a82cfb6c4d..bc3c8ced644b 100644
--- a/Documentation/riscv/uabi.rst
+++ b/Documentation/riscv/uabi.rst
@@ -3,4 +3,46 @@
 RISC-V Linux User ABI
 =====================
 
+Misaligned accesses
+-------------------
+
 Misaligned accesses are supported in userspace, but they may perform poorly.
+
+ISA string ordering in /proc/cpuinfo
+------------------------------------
+
+The canonical order of ISA extension names in the ISA string is defined in
+chapter 27 of the unprivileged specification.
+The specification uses vague wording, such as should, when it comes to
+ordering, so for our purposes the following rules apply:
+
+#. Single-letter extensions come first, in "canonical order", so
+   "IMAFDQLCBKJTPVH".
+
+#. All multi-letter extensions will be separated from other multi-letter
+   extensions by an underscore.
+
+#. Additional standard extensions (starting with 'Z') will be sorted after
+   single-letter extensions and before any higher-privileged extensions.
+
+#. The first letter following the 'Z' conventionally indicates the most
+   closely related alphabetical extension category, IMAFDQLCBKJTPVH.
+   If multiple 'Z' extensions are named, they should be ordered first by
+   category, then alphabetically within a category.
+
+#. Standard supervisor-level extensions (starting with 'S') will be listed
+   after standard unprivileged extensions.  If multiple
+   supervisor-level extensions are listed, they will be ordered
+   alphabetically.
+
+#. Standard machine-level extensions (starting with 'Zxm') will be listed
+   after any lower-privileged, standard extensions.  If multiple
+   machine-level extensions are listed, they will be ordered
+   alphabetically.
+
+#. Non-standard extensions (starts with 'X') will be listed after all
+   standard extensions.
+
+An example string following the order is:
+   rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
+
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
