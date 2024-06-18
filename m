Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63D1C2BA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 12:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Yp8W9K3zG14fMybvsSQHa+mL7jOcefl109k6se4P/0=; b=Dm8TU3i67OLPYg
	g683ZMgKUiQdmAHWvvmJqUNt4t29sA1ae0kUe6yj4DSH0/GPWpeXprscDL5K9af01mWaWBGqBgTM7
	iTEo6LftSQ6fmz2nf4EuyCdGpxtdwh7k4uNByiN/ymxICiQCjI6mxIaRhSLVbbX04yvnHUw9bMoGm
	IO2dXkcvD14XNzmd70rpAciU8HvbAKCODlBfyVwMyyblXlXQ/U6pu9BLt8AgTAcE+y+nAc7XvmQeF
	0sqxfFNuJSymrlk3OqOufgpG5hwjy/Cny4SyUsBkTZ4eU61NoFppvxD0x9nt2/NkrCagkBwbb8e9x
	mkZ0NOPE/4AuudCIwvGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJXe2-0000000EnUy-41yu;
	Tue, 18 Jun 2024 12:09:03 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJXdz-0000000EnSt-0ZJE
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 12:09:00 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70623ec42c2so240217b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 05:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718712536; x=1719317336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jb3JocXcPiCbvg54IdlUeWbprQs3KRQNAcfXzKSxCzo=;
        b=WuL2V4HhSrqeNlC4VnJQHhk4IbXgG6tDmgtmn8SWDtwiDkLXBxcAc8UBJsiEUTeTd7
         JsMsvt9QKG1Av/aB9bpnvRxO2IfiEo5k28VMxJR9i/V0AVcWbNKjm36tDc4qnBbBjjRA
         EmQMfi9VwoHUjC1V2f19wB79kTD6N1TsSUszA6IeGe93dFFU5ZeOu1DDsIh8KXV/u+J5
         sg9/LVPDChyaqJ+dViQuU93aIS8ug1W68xTz/mNxi0GSX5I+JgmUkY5MBVyaFVvk4Jlw
         0H4Z+Qy284k+uc/wkFc+s+r8U/jfi+H+I4FVYsTnots50lm/ZqSjcXNwK3lBrP19j8VZ
         W2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718712536; x=1719317336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jb3JocXcPiCbvg54IdlUeWbprQs3KRQNAcfXzKSxCzo=;
        b=nEplifYwx9gv1QUOIWg+NSQLQ6AgOJ8QxBCivex7dpcnzNSJsW3FH8rt2AvGHgCQ5n
         LQg4oS+DqM5FAG76nhp5TKcIF95d6M81kRzxzFz2x8Mx2l4HxPbB4amNbqebEpRJDUh2
         8Hk7m8mmZtR5o+LWxuOLa0FZBkABpLZEA3YZmne9Ve08u7qM19/6f6lY+wDFFbkYsJQy
         vxgyV8w9hp1fAnK5/fCcwqhMBIJa1Br6MQkHejI98x60k4LAcbTZhKk7KWc82KDRJyxv
         xh8BUHIiDXdJebJxd/hyNKyy6YLnvg2nTpxYOQ5yYxRvL1r+LtWGffrIqHfHRPH/eHtH
         nTtw==
X-Forwarded-Encrypted: i=1; AJvYcCWHpMyJJPTsR6Ku5G7TXfZk54ztk+G/w5kAYM7MzVlugUEP4bmcpuTyuEJvDm8G1Tye/YygEogPNWVsojchaya3pwylyHxEgL6RflP0GO3r
X-Gm-Message-State: AOJu0YwL6lPqJfg2bNh8bM2O2JYq4BHZ1YUpyDXsJIAbv8gOu4SUI4uY
	kwe+34LCxD1TBIz2GcFXb7nkgrXfR7mz4APFkU21hC8GyKIEzx2YWVhop5RJpP4=
X-Google-Smtp-Source: AGHT+IGPDDLTRJt3JTj42pXv8laxMbqSrwxMqulIK7TC6bhLPFsR8V1mfHcuYeDyepiUmjYmIbzU4A==
X-Received: by 2002:a05:6a00:8f03:b0:705:d2da:62ae with SMTP id d2e1a72fcca58-7061ac2e94amr3241529b3a.16.1718712536276;
        Tue, 18 Jun 2024 05:08:56 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb4c621sm8853029b3a.115.2024.06.18.05.08.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Jun 2024 05:08:55 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	dawei.li@shingroup.cn,
	jszhang@kernel.org,
	namcao@linutronix.de,
	chenjiahao16@huawei.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	vishal.moola@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: cmdline: Add support for 'memmap' parameter
Date: Tue, 18 Jun 2024 20:08:42 +0800
Message-Id: <20240618120842.15159-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_050859_389602_50D255C5 
X-CRM114-Status: GOOD (  12.85  )
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

Implement support for parsing 'memmap' kernel command line parameter.

This patch covers parsing of the following two formats for 'memmap'
parameter values:

- nn[KMG]@ss[KMG]
- nn[KMG]$ss[KMG]

([KMG] = K M or G (kilo, mega, giga))

These two allowed formats for parameter value are already documented
in file kernel-parameters.txt in Documentation/admin-guide folder.
Some architectures already support them, but Mips did not prior to
this patch.

Excerpt from Documentation/admin-guide/kernel-parameters.txt:

memmap=nn[KMG]@ss[KMG]
[KNL] Force usage of a specific region of memory.
Region of memory to be used is from ss to ss+nn.

memmap=nn[KMG]$ss[KMG]
Mark specific memory as reserved.
Region of memory to be reserved is from ss to ss+nn.
Example: Exclude memory from 0x18690000-0x1869ffff
memmap=64K$0x18690000
or
memmap=0x10000$0x18690000

There is no need to update this documentation file with respect to
this patch.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/mm/init.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e3405e4b99af..7be7ec3092ad 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -208,6 +208,56 @@ static int __init early_mem(char *p)
 }
 early_param("mem", early_mem);
 
+static void __init parse_memmap_one(char *p)
+{
+	char *oldp;
+	unsigned long start_at, mem_size;
+
+	if (!p)
+		return;
+
+	oldp = p;
+	mem_size = memparse(p, &p);
+	if (p == oldp)
+		return;
+
+	switch (*p) {
+	case '@':
+		start_at = memparse(p + 1, &p);
+		memblock_add(start_at, mem_size);
+		break;
+
+	case '$':
+		start_at = memparse(p + 1, &p);
+		memblock_reserve(start_at, mem_size);
+		break;
+
+	case 0:
+		memblock_reserve(mem_size, -mem_size);
+		break;
+
+	default:
+		pr_warn("Unrecognized memmap syntax: %s\n", p);
+		break;
+	}
+}
+
+static int __init parse_memmap_opt(char *str)
+{
+	while (str) {
+		char *k = strchr(str, ',');
+
+		if (k)
+			*k++ = 0;
+
+		parse_memmap_one(str);
+		str = k;
+	}
+
+	return 0;
+}
+early_param("memmap", parse_memmap_opt);
+
 static void __init setup_bootmem(void)
 {
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
