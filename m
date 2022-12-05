Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB2EC47088
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 14:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aj2MPdcRRy2F0GY5LCXc4DBuhQRKp5qXWxUSSSO17H0=; b=vkm9QnbnGruis4
	SspVKuKWoq5UQOJg4DZZ2Juut7oi/VMjfpiRrsnOfweRPhnFG/KbaVNBiRE5DfqjUm4fZD2gi1GPd
	hHUTQnQSVkIcwx5SP+pHdvl7IAeykdt/JvxYrJwtL1t9cyLu8QRdEoh2y1EUAh0oEqqp758xtVouo
	TntfxqPoAqtzPa091AEXchzJxfCbXsbFe4TRtGYnnXkJ5rGid5QcXf3oehOpOSbE/wirFneqBGUFQ
	QNkTEUff2foEivBs92OyISAMUkjcPniufbW84zlSfgXzLjkLF7F4mMi6jiMUmwtCj8/qBO3PRCe0g
	UxTZx9hqURRZeJkqKYjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Cjn-004CBK-OB; Mon, 05 Dec 2022 14:46:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Cjg-004C1k-8Q
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 14:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1670251584; x=1701787584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xa3lQ5br274pHlzqKFXObTMHjy86GvzTLCwrJSJFAKA=;
  b=mshFdZZvsdpyH+TXzhniEQuHZl2sUUW1EBmLfZxio/WcDoVpwNqAUGpl
   Pl+KNrO+7DWQ2m98pEbs+V4H+NJCaXLbOFQWqfbbHUH5c1qh5BmdduxAs
   F/Z8BSpanbtH/w/rU1qAzjVrOXJ4ssvT2Hf0UwfVYS9e6Mhl87gX3gQ8s
   Zx7t8xLQrtH+PcIeclo+6yzQPi/CCPTnU1ED0n5lRBsDa4MVU1Sd18IDW
   9GK3n+scoFQh3Ohv1GR8YggehZx+5COOxf1jrUnjt+WI0S8FZDrNVykev
   PiqiCXL14IGa95xQdYtgXyrCYLpLOb4IEaAYPl3065nac/CC7/9PgtsuQ
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="202640941"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Dec 2022 07:46:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Dec 2022 07:46:19 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Dec 2022 07:46:17 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>, <ajones@ventanamicro.com>,
	<aou@eecs.berkeley.edu>, <conor@kernel.org>, <corbet@lwn.net>,
	<guoren@kernel.org>, <heiko@sntech.de>, <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v2 3/3] Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo
Date: Mon, 5 Dec 2022 14:45:26 +0000
Message-ID: <20221205144525.2148448-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205144525.2148448-1-conor.dooley@microchip.com>
References: <20221205144525.2148448-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_064624_325899_A1F12783 
X-CRM114-Status: UNSURE (   7.46  )
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

The RISC-V specs are permissive in what they allow as the ISA string,
but how we output this to userspace in /proc/cpuinfo is quasi uABI.

Formalise this as part of the uABI, by documenting the list of rules
we use at this point in time.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/riscv/uabi.rst | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
index 21a82cfb6c4d..2ebec4c52230 100644
--- a/Documentation/riscv/uabi.rst
+++ b/Documentation/riscv/uabi.rst
@@ -3,4 +3,46 @@
 RISC-V Linux User ABI
 =====================
 
+ISA string ordering in /proc/cpuinfo
+------------------------------------
+
+The canonical order of ISA extension names in the ISA string is defined in
+chapter 27 of the unprivileged specification.
+The specification uses vague wording, such as should, when it comes to ordering,
+so for our purposes the following rules apply:
+
+#. Single-letter extensions come first, in canonical order.
+   The canonical order is "IMAFDQLCBKJTPVH".
+
+#. All multi-letter extensions will be separated from other extensions by an
+   underscore.
+
+#. Additional standard extensions (starting with 'Z') will be sorted after
+   single-letter extensions and before any higher-privileged extensions.
+
+#. For additional standard extensions, the first letter following the 'Z'
+  conventionally indicates the most closely related alphabetical
+  extension category. If multiple 'Z' extensions are named, they will be ordered
+  first by category, in canonical order, as listed above, then alphabetically
+  within a category.
+
+#. Standard supervisor-level extensions (starting with 'S') will be listed
+   after standard unprivileged extensions.  If multiple supervisor-level
+   extensions are listed, they will be ordered alphabetically.
+
+#. Standard machine-level extensions (starting with 'Zxm') will be listed
+   after any lower-privileged, standard extensions. If multiple machine-level
+   extensions are listed, they will be ordered alphabetically.
+
+#. Non-standard extensions (starting with 'X') will be listed after all standard
+   extensions. If multiple non-standard extensions are listed, they will be
+   ordered alphabetically.
+
+An example string following the order is::
+
+   rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
+
+Misaligned accesses
+-------------------
+
 Misaligned accesses are supported in userspace, but they may perform poorly.
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
