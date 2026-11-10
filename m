Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E786E60707AF
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MZb+V+Wh;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=GM18jOSA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4farjbvSUH1pKjEPXmM1k/pLwRwp37yUgwu8RZ1XivE=; b=MZb+V+Wh9O7QA6Tsy/AJZSPImd
	ANeCdwGUx03maON0Hmw+pYip3bxFgt3lXAoiwPovUKnis+j/bNA92nxWY7A8ulGNSSHeLaRH4e87B
	Gy0qbEKuOCRszX/Y2wgTJElJjWQwBFNRihkhuTdbGlFhVepm6kt2ol9CEB6pwYVXGpyGlsPcnoOpd
	ZaY/12E+J/FdXmF1rKjj07JCAMm+dxyS63pQmLH5IJCRc9UM5/LTwaprxec+VOkJbboPtxMy9weMl
	kIoOfPVCEhKvHdctDck3xbyHl/tNBw5nf6951xRAinAaShpgcgSCos6BAkbBa1WetnFkK2XfIRJmW
	9rQq+vqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQloV-000000042ZQ-0XOl;
	Tue, 10 Nov 2026 13:23:03 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQloS-000000042XI-00mq
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 13:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794316980; x=1825852980;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Iv6D6e7CRfaO746bD1hJJNYyxNaP1nv/4CHWfaTQ1+0=;
  b=GM18jOSA2Z2EB6rySZFcIsTNu2/JrvK6znQ9y11RbV7ceCPtSyrfcSCX
   fqlojrgjw5del8ybf9CV617nnbjMpHUGta+uyM9v6W8JqeAF2tzKZCAQ6
   H9ouTaye8oqrOL//5Z91xmTg8OAnm2hEkTqlUqPOLSH6lFexol+3fsfky
   riphgwEBEI3rDtkie0muxF28Z5CiGos55PAImmFYkNIYvMCQ2cRMP6hRE
   HaoBvVsQqhVEtiwVD7qkxDBNj6Pzr5JyZJZSU/+cuxhfWf334uTxtb5b6
   vsBYlGQNkDCTVVxSNMAi+BT8dNm7m25AU280vebWXRROEq4ihoRMyjwWy
   Q==;
X-CSE-ConnectionGUID: r/er093FQ5OPgiIuQPorJw==
X-CSE-MsgGUID: vovPxu1FRDSWol9RutYbyQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 15:22:55 +0200
X-CSE-ConnectionGUID: lg/nxsEvSIea7AHEBlpmmQ==
X-CSE-MsgGUID: BAkxBH2aRMW+u4xpuWpZ/g==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 10 Nov 2026 15:30:50 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Nov 2026 15:22:54 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Tue, 10 Nov 2026 15:21:00 +0200
Subject: [PATCH v6 3/6] riscv: accept the atomic extensions this kernel was
 built with
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-lrsc-only-v6-3-bafc3cc0fcae@mobileye.com>
References: <20261110-lrsc-only-v6-0-bafc3cc0fcae@mobileye.com>
In-Reply-To: <20261110-lrsc-only-v6-0-bafc3cc0fcae@mobileye.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Chao-ying Fu <chao-ying.fu@globalfoundries.com>, 
 Conor Dooley <conor.dooley@microchip.com>, torvalds@linux-foundation.org, 
 olof@lixom.net, aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
 Boqun Feng <boqun@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir.Kondratiev@mobileye.com, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Nam Cao <namcao@linutronix.de>, rust-for-linux@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_052300_327527_D414BCD4 
X-CRM114-Status: GOOD (  16.10  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

riscv_early_of_processor_hartid() rejects a hart unless its
riscv,isa-extensions property contains "a". A hart that lists "zaamo"
and "zalrsc" instead of "a" is rejected, and so is one that lists only
"zalrsc", even when the kernel was built to use only LR/SC.

Accept "a" as before. Without it, require "zalrsc", which every kernel
uses for cmpxchg, and "zaamo" when RISCV_ISA_ZAAMO is enabled. The
default build therefore needs "a", or "zaamo" together with "zalrsc";
a kernel built without Zaamo needs only "zalrsc".

The legacy "riscv,isa" fallback keeps its rv{32,64}ima check.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/kernel/cpu.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd..9ba0d49c87bc 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -82,12 +82,29 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
 		return -ENODEV;
 
 	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
-	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
-		pr_warn("CPU with hartid=%lu does not support ima", *hart);
+	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0) {
+		pr_warn("CPU with hartid=%lu does not support im", *hart);
 		return -ENODEV;
 	}
 
+	/*
+	 * Require the atomic extensions this kernel was built with. "a"
+	 * covers both; otherwise LR/SC is always needed and AMO is needed
+	 * when the kernel uses it.
+	 */
+	if (of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
+		if (of_property_match_string(node, "riscv,isa-extensions", "zalrsc") < 0) {
+			pr_warn("CPU with hartid=%lu does not support zalrsc", *hart);
+			return -ENODEV;
+		}
+
+		if (IS_ENABLED(CONFIG_RISCV_ISA_ZAAMO) &&
+		    of_property_match_string(node, "riscv,isa-extensions", "zaamo") < 0) {
+			pr_warn("CPU with hartid=%lu does not support zaamo", *hart);
+			return -ENODEV;
+		}
+	}
+
 	return 0;
 
 old_interface:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
