Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB04EB5961
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 04:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=63cNnGMBAGWC5nzL3QbwLtWys+9g96Zn+8eBBeQMuio=; b=dFN8PdJ26DfJBV
	YWCjcC3COj84VCI6faVON5NrzFeiRa/Uu2HmQjbU8bfjz/midoKhjhH3cy1wDw5N/vG3vCCIrR74L
	mF0gxYLczxQl77v0eqSnWqsVfpRwqZdAX0hsbqA7gzKfIaJ8S2/sdoEaaXjIyiHUKqR6iCazBraQ7
	0it1u/ggb2MOmT6QVLQr44Z5WaMC3wHjvPfrb8kzCp26ruoPV7+6eSDJNmkdgN/FuvnKkTRlqpl2K
	bMvnOx6Ma9Yy2ajSevalkwdN3RPuMVr8w6uF1pmzK6Y+skG71/Mxp2F4tSVP5Abl8pbqyEzvpZoxl
	ttK0ZtZm98XchN3yGfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2AK-00000000Co5-0QsO;
	Wed, 11 Feb 2026 04:49:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2AH-00000000CnZ-34Fq
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 04:49:26 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2aaf9191da3so10695585ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Feb 2026 20:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770785365; x=1771390165; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nvr2xv+8/kE2Yaa160xiVghqX5wMbpe9ZaewCjQfr5c=;
        b=O/yUVw3AXcjPXQ+oyETbzn2caUeXGS33QsDUGGWC/cBEIKJlL9es9xPUgQ+enBBipP
         Zm1gYrbicmliEQyc1JlkrM24G91AVNw5ybezk4mZyg6ar1zA5gc76wTJNtqT8bw/maXg
         9LWPx6DvRKaDKgqy9Pf3OoO5y82xyveMxX1Ic0sXhVQLHOJoGGT2AkUHit0ALiDUafs5
         YU37aOMs/PkgvtqEXBVAjFWJcgKO7mVvgBdAOZNEsVd4CjGpi0y4CUpo+5cWEH7wG613
         tbIyV9/dv4npyk3MSEATw+eSBhV+rVT0/5KrCxSdXmKesa/xe1vifAKVg8ysOL1r6uL4
         7O6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770785365; x=1771390165;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nvr2xv+8/kE2Yaa160xiVghqX5wMbpe9ZaewCjQfr5c=;
        b=cFHUdOcZDWRbQA4OTmHqMuTev1qvTphZIt47gER81gpROBaAPrSsAUfZ+b4QjHq1+r
         L/ojv4JnojwT42DIGx09pnz79M+yL5vbkQKyxR+vBXyykSa4KAaK7ptDwgYtlMEkIalL
         C98MoK8AZgdETngs8PnkG6iwBF84uVwm1qKz/AU/8BYC7Kp5UGu4HJ3KEK9oeNuuM36R
         m/0faTV8sBO7vUUGewv0DSSImYFOY4gZ7kvhfw53XOXrJwU1X/mGjRCvCDZbNNOxuQVO
         a7s9W7aRUaQNNYRRD3B8BcqJ8ZNQlW4CJ57Kgk6ydGudxu2aKIOj3kpLFx2TfTq95M9F
         kWVg==
X-Forwarded-Encrypted: i=1; AJvYcCXah67k2I2yWsLZ9Le4MUq45K3R0dQuYaA01J8hNzI4vij2u/qaarVSrIKP1Df3dg6F5LVJeXo0lGc9GA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJrQjFICSKIAHmN7YyUtFt01FmsEG6w29QBDcOyUFOq0rFS+vC
	R+ig4rdz4mkkDb0bG0kuklehCdaz/6gvgxxoQDmsUlQMPIjdaBVx2uCt
X-Gm-Gg: AZuq6aJ++Ndvb0eG9nryN0ArXaKVGBUVCeAqrdbxKpYkg4LzTVsmwvMwKuo9Qg410W3
	HbQNQJ5miMfVPVSmTEy0kWAlYOKAOuE95o9D+Fdt4L43B5l7MC9IiflmVotU3jxsxy0KpLVZ9uQ
	yT9jLEwftdUOfESEXkwlE3stZ22TiezaDWj71P71d5uF2+o1V658qOT2J1qT1AZtOv7eZR8+wKl
	3KSfoYzQVujhXOQoa0cvYFgLoeS/PFNQoPh1pZRFYmxtyvOYRiSSV1bHI9/MFfHoosZuLhf5h71
	G4KlgF24MogITNAN7QxN0YJf+7e5HtXclkS22ruEjiCn7a8JEEP6XQpxRAwY+oq5+8KxEWxAkNy
	ua57P6PyoqW3D2zIbyNjZG1CYHkLwBXsIdurR5f+bW2MkEKHus9PanQ2kCU+uFHMHIugAvnXoBV
	3jQmTMBOa2FsNv/Y01I9J5JcS7UJPaPLO+VV642QE=
X-Received: by 2002:a17:902:d4ca:b0:2aa:dee9:dcf4 with SMTP id d9443c01a7336-2aadee9df81mr107222595ad.25.1770785364726;
        Tue, 10 Feb 2026 20:49:24 -0800 (PST)
Received: from adminpc-PowerEdge-R7525 ([27.122.242.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29965093sm7599595ad.52.2026.02.10.20.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 20:49:24 -0800 (PST)
Date: Wed, 11 Feb 2026 13:49:20 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	austindh.kim@gmail.com, austin.kim@lge.com
Subject: [PATCH 2/2] riscv: export kaslr offset and satp in VMCOREINFO ELF
 notes
Message-ID: <aYwKUE3ZzN7/ZY/A@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_204925_835489_3785F1DE 
X-CRM114-Status: GOOD (  10.63  )
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

From: Austin Kim <austin.kim@lge.com>

The following options are required by the kdump crash utility for RISC-V
based vmcore file:

- kaslr: If the vmcore is generated from a KASLR-enabled Linux kernel,
         the KASLR offset is required for the crash utility to load
         the vmcore. Without the proper kaslr option, the crash utility
         fails to load the vmcore file.
- satp: The exact root page table address helps determine the correct base
        PGD address.

With this patch, RISC-V VMCOREINFO ELF notes now include both kaslr
and satp information.

Signed-off-by: Austin Kim <austin.kim@lge.com>
---
 arch/riscv/kernel/vmcore_info.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/vmcore_info.c b/arch/riscv/kernel/vmcore_info.c
index d5e448aa9..682ba423c 100644
--- a/arch/riscv/kernel/vmcore_info.c
+++ b/arch/riscv/kernel/vmcore_info.c
@@ -3,6 +3,11 @@
 #include <linux/vmcore_info.h>
 #include <linux/pagemap.h>
 
+static inline u64 get_satp_value(void)
+{
+	return csr_read(CSR_SATP);
+}
+
 void arch_crash_save_vmcoreinfo(void)
 {
 	VMCOREINFO_NUMBER(phys_ram_base);
@@ -27,5 +32,7 @@ void arch_crash_save_vmcoreinfo(void)
 #else
 	vmcoreinfo_append_str("NUMBER(va_kernel_pa_offset)=0x%lx\n",
 						kernel_map.va_kernel_pa_offset);
+	vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
+	vmcoreinfo_append_str("NUMBER(satp)=0x%llx\n", get_satp_value());
 #endif
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
