Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2EAD46BFC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQiVQdP09+WCG5hblKY1S4Npnav1aWwx/3s0u+nDTww=; b=PIXq+kpsMfTbHj
	R62+5vlyj2hswCWDjDw4Nv7l1gXZoTSsIRQYDSwC5d2MFDvtMatCsNgxknPOUHBMB5rUDv1JAXyaQ
	dpGvpsKpKbvMdHZwlDiLiz9stCTF6ANffy3UQdUHm6nTVy26AkqwJIBk45iD/ERFTjyVn06mwTjM6
	aAhQkTWfQM6bsGJX4GoBkF7RP7vHdURRRIaQof/U3StfyUGj6cZ6xSz5xawA17/f9rdfvVfAouelQ
	2YgvyM6UI7VdgWERkz9D3Ou8b+f2AXSZVywMvQL3bXNHL4N1yCtB6p1Ychvgl6BhJ5allFd1927sK
	lGIxSXBvqEivf3Ju8umA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC9N-0000000GkJP-3XLX;
	Wed, 28 Jan 2026 20:28:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC95-0000000Gk0f-44Zq
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D335E44529;
	Wed, 28 Jan 2026 20:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4242EC19421;
	Wed, 28 Jan 2026 20:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632091;
	bh=4o0KFAigHCtXfQSjAvAOAbc0aP+19v9iIO4nX66XDCM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vJq1dOMePTouoidO/P2tv+4dKpxFdEC2aSVyZi0wNFbc6ZsUxexPgDwcQi96Ht9E3
	 pxTjJFsUzUNZiAbloJoMLqK2b6OyYUFBESwWfzSZUdhu9rQa2ZS+hoKUY6Kmvtwkwm
	 wBVOuHKRAGZZthnQHbjcESTZIazXMrj7KBvoFCxBYAyn05MPA4pUnGno7CFafh3H/S
	 Y/EMMUO3C+beVB6aNfLRIo7XkNbmIZqgvmkyOl7IyU7uQP/I1c/32WrRl/aOyS3CK0
	 YN2gEB5ZkokGY20mtw0zFTfD7i91rj6M+Nq0muzJA6k/z4bsNtJMUIqXsWFflTX7tY
	 Rsmrpn5quQUdg==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:36 -0800
Subject: [PATCH RFC v2 15/17] RISC-V: QoS: add Cache ID and Prox Dom to
 CBQRI controllers
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-15-dca586b091b9@kernel.org>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, Rob Herring <robh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=fustini@kernel.org;
 h=from:subject:message-id; bh=4o0KFAigHCtXfQSjAvAOAbc0aP+19v9iIO4nX66XDCM=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFQYKivn8UZhwb8bOXbu6v8tnpR05HvQsufNYFt+j1
 afM6u6od5SyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAmsqae4X94zqLaLyYnUleZ
 KwvYv8uQ8nPp4djz44G1stUU3YVf4m8w/C/18GCrmGqa9rfnLzOP2282w/m9/VW2p9ee41n83XB
 /Py8A
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_122812_095556_69F8375D 
X-CRM114-Status: UNSURE (   8.63  )
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

Expand cbqri_controller_info to contain:

 - Cache ID from the PPTT table's Cache Type Structure
 - Proximity Domain from SRAT table Memory Affifinty Controller

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 include/linux/riscv_qos.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/riscv_qos.h b/include/linux/riscv_qos.h
index 0c551ed85fe1..4812b6811327 100644
--- a/include/linux/riscv_qos.h
+++ b/include/linux/riscv_qos.h
@@ -27,7 +27,14 @@ struct cbqri_controller_info {
 		u32 cache_level;
 		u32 cache_size; /* in bytes */
 		struct cpumask cpu_mask;
+		// Unique Cache ID from the PPTT table's Cache Type Structure
+		u32 cache_id;
 	} cache;
+
+	struct mem_controller {
+		// Proximity Domain from SRAT table Memory Affifinty Controller
+		u32 prox_dom;
+	} mem;
 };
 
 extern struct list_head cbqri_controllers;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
