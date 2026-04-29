Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD68FF8867
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 07:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6uwv3vvSHV51cCstoPCcdJx1w+akXafipF1r4ncT6dc=; b=usiHYwBE+X9wnQ
	0If7R012PCwGLaZ1zgKqHVMBuLgV03dJHSuFNZ1hzqdkbN4jIKEbxzdkeLm3vCLyy4FZQV494zxv1
	XEU+2axP1o7Tf0hGjKBiQHPsaVMk7eYKtgkKYfreapPLlhc0gkAMzHsQJDlgahrYRslbVDVuZ/Mzk
	E+PfWD9LJNVQ+P1pxfdcBh4BEDtFI0B7/CoIYkof4GxTOLZTsdGOGuM3tcQ311H2pA/M4aE0JZeUV
	dTux+JJZW8jtm1AH4Zzp3j5QBW6nzd+SSbF6eFDE+oOhuQD/56vWtxiMgIVSNcjUIvURs6OM40nVY
	HoLMuUHFXNg+W8xHjMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyu6-000000035yD-1caU;
	Wed, 29 Apr 2026 07:00:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyu5-000000035w7-0qTW
	for linux-riscv@bombadil.infradead.org;
	Wed, 29 Apr 2026 07:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ngtzchp/6x72pHggoOfcu8l1aVao/9O/WyChqA+UT9g=; b=pikypcm4QO0Pp/GPdfcUwTTAfx
	Cr8IK0vxDLiDr0viieOEywU8ILHxxJnpwuxEpTPS1c/XY2UGyTBqtN3KTwKDK3BiALvgdLnl9Wn00
	3Ch3A0PaU0VcyY/ZtODnKwLRjhIYDZtLP6J0scTIGsYo2vmQQYOX/6TuuvVkWVvUOzw9nerM/299c
	izvK8r5BYGLg8zWswvmapw8SQs0V0bG0Bqs+ca7mivNasRU6W3rCdWvN6qwAo4cWdF4EbRHM9l1zl
	toagP/bHCBi/Ic1J9aRdxmO3w7hesTRfWSdcSg1Fyiy7YHP0hhHtKfAL2TPhlrWNvoBsThbSiszHq
	llG0YJQg==;
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHytw-00000004iB4-27vE
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 07:00:06 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so5492284b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 00:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446003; x=1778050803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngtzchp/6x72pHggoOfcu8l1aVao/9O/WyChqA+UT9g=;
        b=ZtJDhivFb1XApFNdkR32I35l0xlYt3wwtO0ZwtRSggxJWvkLP9581Q1dllj9JMXN7T
         3/IORw4bxMqNmfNOtZjSv7Z9YYQtstZWDSgUPr27Kofa3+6p2IGwx5oYqx3WcOf9gwru
         hMYuS8OvTe6pp9y74o/gE012M0mb2ATYW71Ev/O6ZS7pG/eeM4sZQ1qKsG4/72/nK2Zv
         Qeks1N01tesuLxyIaiA2wkRv+8pS+zH2M6ZheG7fRnbmmVEthZk5eLR8a3Vm4eqeUY5W
         d1JVp+jx/0F97wjJQFPWdmAjOGoIWDwZVliqETHDMEM3tPiuxBrXv/X+01Sb1Pol1/vr
         HJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446003; x=1778050803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngtzchp/6x72pHggoOfcu8l1aVao/9O/WyChqA+UT9g=;
        b=BGu4Uy8Hv95wEY+g4UoneKiNwxOBcp5Ge7N1YZP2JbE72aVBf2DZgiBqX9k6pXRyHW
         RV0F6gQdODqSSfLvxo4WJnIZtE3pWVIUxZrYnrlup8kzo6E2j4a92wE2g09b/57Wi6jW
         J8jwuYsPiS6ZrVcA2kEefBQEuAdr25qfD4dX+xKpJNc4g599WLqemJPcPKqZAfEWZE/n
         VgnljVvuyIPWAZENmglJitBXIou4LRieNlr8uRQjGAKkX7W6pC8qL4hJdrf1lfOPFEZg
         a5KoQLBorkZ98nL3X9d2jgRrQmOZQYw0e3gGnB4eQJLiCVFTFlZsa9xIu+cQZ1n2i/IK
         0E0g==
X-Forwarded-Encrypted: i=1; AFNElJ+zft9mZatelh9hAG9DQPqBFzpOG1FP2xao/SVE9+hEWBBYIhs7Y3MH0FpbYygWOgQJZnrUDTCP3/BZ4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzT1jDID5e3ANfNfobVtVGY76rsbN4kYAidCl4o0MlYvnsfermW
	ULuQv+XtJmvbgEh5WXPm1S3dezkOMfBKNop8Atdy8ewZPAVifBMx7h01
X-Gm-Gg: AeBDievsLwEDy854WExmGs9QjpIuxkBT9lS8VEhdzzS/ZRZPkZPYyewPDaGvhM+hpkh
	LY0tfTKrWsIjKNvJO4s6WY8gH4cdmD2GeIafKy7YVVh+UmupArpkW0iGk/VkmGtC5Sm6GA9kEi/
	Tnv3gu6nQeSbvP9ye1BoFjB+n5X+nuhy2K67OvApnSuQp4Vh++N3+7okZlBA13Fy6UxJm3vvZFF
	IByVrqbRy/chHfsecKE+1P/NxNVEKoSgasWbwHsCkeP25CgCcB3ZHEJeWEcdWMIGbCb89e6VVCO
	WgdTqbck0nDG3cbyLP0jtwXFsPn54vgjcuFA6tf34k051n25IlehC+qS4PW7QDu9c7tdbtZZ43G
	y8O/dvsphp8QUugZkWSQM76GLov7yO8aLh37n0qs8I4usf0l733FfEAcb2ktV2agskMfygQisRo
	cUOF9ckeKmc4e2D3ALB7aUj9R5YuxZ61A3C6VYp+k9sHxhk2Epd/ugN1rMr4k=
X-Received: by 2002:a05:6a00:338e:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-834ea569f84mr2491372b3a.21.1777446002842;
        Wed, 29 Apr 2026 00:00:02 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:02 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 08/11] arm64: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:28 +0800
Message-ID: <20260429065831.1510858-9-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_080004_891217_DCDB4BFD 
X-CRM114-Status: GOOD (  10.57  )
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

Exclude reserved memory regions marked with the linux,no-dump property
from the elfcorehdr PT_LOAD segments when preparing kdump vmcore.

Device firmware memory regions (e.g., GPU, DSP, modem) reserved via
the device tree typically contain data that is not useful for kernel
crash analysis and can significantly increase vmcore size. By honoring
the no_dump flag in the reserved_mem array, these regions are filtered
out from the crash dump, resulting in smaller and more focused vmcore
files.

Use the common of_reserved_mem_exclude_no_dump() helper to perform the
exclusion, and pre-size the crash_mem array via
of_reserved_mem_no_dump_nr_ranges().

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 arch/arm64/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index e31fabed378a..7c9c38096c60 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -17,6 +17,7 @@
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -51,6 +52,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -75,6 +77,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_exclude_no_dump(cmem);
+	if (ret)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
