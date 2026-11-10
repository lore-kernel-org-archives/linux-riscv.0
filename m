Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D80C6071E70
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OXbSQfG/;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=Bl4wf529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n5xuGytYmVZvbxYma8PBoHfl8zhSpYZQu/Nve/lDLgc=; b=OXbSQfG/U3jxUx25EaFR62Xu0p
	rLpVy8hdPBwPyFiEtncECke3K7aR103Ew010BXZDRUHWUzSoNgO2KPlwBDUUqWrBBbpg0uWC3bV1X
	dsfiEid//Kcdoleta1pgTVMGNZt8xfTWGC0OxHXx+fDXS87VlUGtNVx7p+Jzvu8WfQRB+y0hXWMyT
	HLwnPUFeKQdmM25DYN2ED9NhtNCspfR3Hqh5bneZj+tkvPxuHqNjHsc/uJnQ7u7F25ZG1W/zS8xK5
	4yh42ElicDbxNwMFGUobiXMkQRKLJheXjhBTCswQrtbFsjt8sZHRT9bfxf2Ezw0+A/QWqTcos/GF5
	5IC9JSvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQloX-000000042aJ-0wJR;
	Tue, 10 Nov 2026 13:23:05 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQloS-000000042Xw-2sSC
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 13:23:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794316980; x=1825852980;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Y2NXF97jr/EMfkddUR0y1/iyEyI2iou2lHNRhWG3x9A=;
  b=Bl4wf5292kXAJKryqLJjNmVkh9yWkcesmHoL7tlj4LmRbcSc5doQWqaN
   IqoVFdKHX0uLlQ5LPPVXBxxqupzlobtrGY09HuASa91p+GDM3qXkTUTVw
   VmDsxCTcVRsj3rZehicxyqGFR10ls8wS5UbMKk9601yU2M16AV5BOUwTp
   WC7EZOi8V5kpo+N0RAUOhSVb2HtqMDwoKnNQYqBH0JgQuPDpz0CLS9M3W
   Twq5+k1NTXy1u2exNaSoV0O/6pC6H+8R5juQYA/fD8KDzO5KbTI8zEx6d
   pZpoJ1KeROEpOkGXJ8cb8t/jQvKyJT3fX2IcTVv3h3GgirqcjUXKZVPId
   g==;
X-CSE-ConnectionGUID: kpghMXt5Q1K4ASQz74xeeQ==
X-CSE-MsgGUID: mIEujuZtSZ+NqHYev21KzA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces04_data.me-crop.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 15:22:57 +0200
X-CSE-ConnectionGUID: 5lgapuKbStevd/1P3rB5Nw==
X-CSE-MsgGUID: bPrAPu2RSmS2u6zv5LYdbw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces04_data.me-crop.lan with SMTP; 10 Nov 2026 15:30:59 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Nov 2026 15:22:55 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Tue, 10 Nov 2026 15:21:01 +0200
Subject: [PATCH v6 4/6] riscv: report the A extension when Zaamo and Zalrsc
 are both present
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-lrsc-only-v6-4-bafc3cc0fcae@mobileye.com>
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
X-CRM114-CacheID: sfid-20261110_052301_013835_3020EF33 
X-CRM114-Status: GOOD (  17.18  )
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

A hart may describe its atomics as "a", or as "zaamo" and "zalrsc".
The two are the same thing: the A extension is defined as Zaamo plus
Zalrsc. The kernel already expands "a" into both sub-extensions, but
not the other way round, so a hart that lists the sub-extensions ends
up without RISCV_ISA_EXT_A. /proc/cpuinfo then shows rv64imfdc... and
the A bit is missing from ELF hwcap, although the hardware is the
same as one that lists "a".

Set A in the source ISA bitmap when both Zaamo and Zalrsc are there,
before the bitmap is resolved, so that hwcap and cpuinfo do not depend
on how the firmware spelled it. This covers the "riscv,isa" string and
ACPI as well as "riscv,isa-extensions".

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/kernel/cpufeature.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7329792978cc..45684e129be1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -682,6 +682,15 @@ static void __init riscv_resolve_isa(unsigned long *source_isa,
 	int max_loop_count = riscv_isa_ext_count, ret;
 	unsigned int bit;
 
+	/*
+	 * "a" is exactly Zaamo plus Zalrsc. A hart that lists both has A,
+	 * however the firmware spelled it, so report it the same way in
+	 * ELF hwcap and /proc/cpuinfo.
+	 */
+	if (test_bit(RISCV_ISA_EXT_ZAAMO, source_isa) &&
+	    test_bit(RISCV_ISA_EXT_ZALRSC, source_isa))
+		set_bit(RISCV_ISA_EXT_A, source_isa);
+
 	do {
 		loop = false;
 		if (max_loop_count-- < 0) {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
