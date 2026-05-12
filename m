Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A5CCD484A
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnXQ97JLSqznBllrdTn99UgGF+XYJbZ7laDyp8VVjCU=; b=e/Bk7BJRekwyr7
	KP2wQKU4GjLGtt04SRF0OteRqOtBW5HlmpkCrJp7xclGmCRTy9qpu9kRi6Yq+3QAuELRIS/BV3DoY
	hoEeWd1+GUhpNNrQLqN5bPhGZARd2xXStSz3h3V5X4//A+hTm61KAanOgSu48ENt+tu6iJH0Wutm8
	8sDKwtIT+nL8q+24kwi/xo7iHoSyHEmz10EDfx5koejRohMYM2AJPcNSNJfKB+8AzPJ8Y0j77wOHB
	NIYaApoK+7S1LZfnBKFL+UdqxHcJt04INI+20NZuyk7gCmtmTwl/1nsH9dB4xGv0wspUfBgww4G5y
	Aay17ZXfxB0NpC0+oZOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQpC-0000000DmG5-0sO6;
	Mon, 11 May 2026 13:37:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQpA-0000000DmEL-1oZL
	for linux-riscv@bombadil.infradead.org;
	Mon, 11 May 2026 13:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rF0QJW1ZAjssXoiundVFLweMgiG/T0aai6kUTr9Xtgg=; b=AY3QIrbR5kIA7fZSaJHKLGuU4E
	n7SsoLYNVWll9eVTGwWCSNVyZSrsY+Fz67PGG6Rlm7PD0FBygwUrvg5n+VPsdevZHV/gVbJCL1JJQ
	P6lWDiizEux+bRtBYn5wJR9s7Rwj0G84Y9CtuzuhDeC8Q0XxrnUDwXSqvcH5ve/sqURpAqQY2+Ojl
	hWylQQuDJABny2y4cK537YtRtvmwDo3VdS5JVBQxV1jLzN68tL7v2YTKjv5p5XIYYHEvZ75+rI3eo
	VuzPvGdkpZFru3mMrWw/T/PJ9Idw1kW4NggTan2l7pcbiA51iJvMkk0KKNaGhKlSAsl6cOJOqw73/
	VT+upw2w==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQp6-0000000BorG-30yh
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 13:37:30 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so1774118a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 06:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506647; x=1779111447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rF0QJW1ZAjssXoiundVFLweMgiG/T0aai6kUTr9Xtgg=;
        b=YyJor2wQQ7XUmkoceoMGpJWvk6TbQBffM1055UNaARtxSoKXtpz2Tho30xDdKmByvy
         2H5D6F+oI2KDsoEw5VCynb+eD43Zsa2//Yw1L2N1e6UBi3k52nq0nOdTBZyQy4PC1sHy
         ZMfqWVZvcm+hS26qyMqU+hOMzqlXQOtpSQ8ScO4NOeAwlQBOTCpyfQN+KVDaxh1j+8r1
         FnC8MjydSznxKS0vLp0guFcQoEuL8SAjQHfey1O8NNiHO+VIEDKp/QtYs3GWyr7466lI
         ut/ddXYwvFJk0nhHyMj4ZLLxAf7Wh6LmQ6YIKXikKX70BKe/gpFmLX0Y42P04l6AwXNS
         /udA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506647; x=1779111447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rF0QJW1ZAjssXoiundVFLweMgiG/T0aai6kUTr9Xtgg=;
        b=P0Fu7YJP/sf8tfXL5ReJqaE6lgfpQxXJXMVXIo+/RvMAVMJGQljj1ZZzcpI7BDjcYI
         5LBBtVhb6fDz/eo7EAukFX2qglpDMsCNDGhvujGbUE1YdZyYZ0AYOH348SFGPTEGUTVm
         YjO0WcPJcXKFsbb0oGvZTl5pXVxY/VL5xQB5xVs2zRvAOkBYeiYihNknHxA6NHRiJsNL
         Oal8c5/AOoTMmoeabLYdwgm8b0A68oLOsD9/mADo5wxJfH4gxuSwaHZTqTwi+735nTE/
         nfdKvwjRAtPKra3Y0rLbc+wZBw9pO0ulwA32271CxwUmtJ9wvqN/s7dc4B6T9s64aeLi
         3Usw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ap5GZSyYJ5HLCL1rhueaJFouYdhKNQA2BW5xUBKT+WktK6NpMG3jtGmUZCUuBYZ4T26X6Ou8R9zNPIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGFTqleULLmlYkXgYLNNLLe3BNKzgzUVplCJo362tXb/on2EmD
	jTZXoFfX8C3cGFDfVWcEz7weHwHC3ksoNpUIgeQllrLhMu6gkTFNrhVafqL467WWU+o=
X-Gm-Gg: Acq92OGmonxzO10IXa0G90M7yWRZo5bTfoPLQifiKnk4DIGzfMRCyxRNNqe2qXf+bu0
	NtoA8u8O/XJWT2wuH1q9T7PToF4xA5owJSepLlBZKngvX1iyimWQFpRTwWppJgEYmTiCpm8G4In
	cGXjAqFv+MI2i9/u2CPMAFaxCkfrceM2tE22NrwYkoWX1WXkAqQmjYFoAoql+wf4bhpTSS8c/jU
	Yv2LPIn3LIOARbgMC6vQ+u4HEQG+q1Yq1qkVMBCKYYkz2v+K70jkrBAaN4GVIA190RCvcdOv67E
	/EzhM8+pahEioNX+Ck2NOJVEQ7bVe+l5vKaz+R56OIkAZpm/rk9+0OFE2IaMBZ6A55cm2nY29as
	uePGmle4tEyPAMRzUb5+kL82O32F5bKuA3v1MTN01oMfYIkbLRktjANHRpSmJDT3UEP/OvlJvC6
	3rhzhO93luriC7WookAKCrsIrl7iaFNnXzDlvUYjlhb/4=
X-Received: by 2002:a17:90b:2e0f:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-3689da3c65dmr934112a91.24.1778506646935;
        Mon, 11 May 2026 06:37:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:37:26 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:54 -0400
Subject: [PATCH v2 09/10] riscv: cpu: Output isa bases lines in cpuinfo
MIME-Version: 1.0
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-9-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_143729_319174_EE8ACD8A 
X-CRM114-Status: GOOD (  12.70  )
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

Output two new lines per processor in /proc/cpuinfo:

  isa bases       : <bases that all harts conform to>
  hart isa bases  : <bases that this specific hart conforms to>

These read directly from the cached riscv_isa_bases and
hart_isa[cpu].isa_bases bitmaps populated at boot by
riscv_init_isa_bases().

Example output on qemu booted with -cpu rva23s64,sv39=on,pmp=on
(showing only the new lines plus their neighbors for context):

  processor       : 0
  hart            : 4
  isa bases       : rv64ima rva23u64
  isa             : rv64imafdcbvh_zicbom_zicbop_...
  mmu             : sv39
  ...
  mimpid          : 0x0
  hart isa bases  : rv64ima rva23u64
  hart isa        : rv64imafdcbvh_zicbom_zicbop_...

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2:
- Read from the cached riscv_isa_bases and hart_isa[cpu_id].isa_bases
  bitmaps populated by riscv_init_isa_bases() at init time.
---
 arch/riscv/kernel/cpu.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3dbc8cc557dd1..31e2857dcdcf1 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -305,6 +305,26 @@ static void print_mmu(struct seq_file *f)
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
+static const char * const riscv_isa_base_names[] = {
+#ifdef CONFIG_32BIT
+	[RISCV_ISA_BASE_IMA] = "rv32ima",
+#else
+	[RISCV_ISA_BASE_IMA] = "rv64ima",
+#endif
+	[RISCV_ISA_BASE_RVA23U64] = "rva23u64",
+};
+
+static void print_isa_bases(struct seq_file *m, const unsigned long *isa_bases)
+{
+	unsigned int i;
+
+	for (i = 0; i < RISCV_NR_ISA_BASES; i++) {
+		if (test_bit(i, isa_bases))
+			seq_printf(m, " %s", riscv_isa_base_names[i]);
+	}
+	seq_puts(m, "\n");
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	if (*pos == nr_cpu_ids)
@@ -336,6 +356,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 
+	seq_puts(m, "isa bases\t:");
+	print_isa_bases(m, riscv_isa_bases);
+
 	/*
 	 * For historical raisins, the isa: line is limited to the lowest common
 	 * denominator of extensions supported across all harts. A true list of
@@ -360,6 +383,9 @@ static int c_show(struct seq_file *m, void *v)
 	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
 	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
 
+	seq_puts(m, "hart isa bases\t:");
+	print_isa_bases(m, hart_isa[cpu_id].isa_bases);
+
 	/*
 	 * Print the ISA extensions specific to this hart, which may show
 	 * additional extensions not present across all harts.

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
