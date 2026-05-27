Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C650CD5BD1
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 03:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PiFwdfHHyyZT2YBnZa+bg05G5wNLZyU+v61v1N/wi4=; b=I0oxKIYM+0HGt9
	1ze1rSCMCQvZKcC4HJ8Em89cFrYCQAZRJVQpl0kcs9NJDIE377NDlMd441GeDjN5W8gPWU+MPkGoJ
	xz0P8HNDoFpeiyJ50p5kObpILzrCZzN+5sD0HyaAEJ8yGzkzGJ4YpBdu9Xy5Gtp8xMai6l4yqaywQ
	dAIu3MSKfmj9bh66rHyTZjmQE3ngJVitrZi7qo1aNzIRZgZCS12X32KNVW7DZUz8MHCap3TDjws7X
	Ux4xuMdN4xW/mM/n6V/c09JiWXYn49wRzOkUzgZ089C3ir0skgGem+vxdKof8g7EyNbmrE4U4tKPS
	XvKqCyg16LzC54dm5AEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4zN-00000003FvL-0rr0;
	Wed, 27 May 2026 03:31:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4zH-00000003FrW-1nev
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 May 2026 03:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=e5OPTsG2OKxcjvVozOjImSDH+Fj8Htwruv9sukUXajw=; b=e0spCvquzZQPXqph2kY82TnRre
	mkao4/FTzxcor+ARZZSrd+DZv7qsy5xKWSb0et3giGDQrDByrRSYxSk2xTrjfc3UOUZGHhxPpgs61
	2T4bXG2pTNqP7xlLPhARnUChh36vb5QL1+koUpUx+dsynziMWNUNOcf+PuCh8LHY98xwwYqnG3EVS
	ilCcISdVlG35vwSy8Fabox2IPrjQiJUi+B/PJYvGIMFU1PWmF6zWaq9eyOkLpLykNYSREit2Lu0iS
	dX3AWD8U0c5x2/FQ/dAySyJGV8O6fNHS74RYkuoisCXlM1SYILGraD+yWNop6kDTu8Xxxe3ZogQB4
	5fnGgwqA==;
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4zD-0000000CqrW-0Udu
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 03:31:17 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-835b78c3797so4915482b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 20:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852673; x=1780457473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5OPTsG2OKxcjvVozOjImSDH+Fj8Htwruv9sukUXajw=;
        b=Km46P8GY9MhY4ifTCAW3pWic16G3/1Xs6IY6YdKHrpL43Eunt8YXpaMnfIqy+Bu37V
         vJiSY6P1+8coC5lq14eob7aRSRQwOYJxo/Mu9CtGex+/aMJNxTjQ8Ogenos3WhchF17F
         tQmzlppudEXS2E0k9P5Zz4Qc6zfa34iephhc0i6zn3AdyZT6awnkcYpw0wSvHYu+M9YO
         o7H5PcxofFyHkdCLguaXroB+3aPFwPTgOQ2c6j6PBQvc8ZkO3zz7pUuR+wAh1+bmRk1i
         Ww49JlYoerODD6jiX6SmrF4m4oR/O12v8odazw2DAKDPCDMLiLtbaDsmW/H2vIg/lOpH
         fySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852673; x=1780457473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5OPTsG2OKxcjvVozOjImSDH+Fj8Htwruv9sukUXajw=;
        b=JWgF6owfSykonmp+5EbHlLtBzWPzTbxxQMvgKcSCE/4x+aYZwaWe3UXoJP4elGrZBa
         UOhXcdBOzEbinVmVb1EEb1Kw3w6lXvIGRKSBdVRvAd3/qPxxTim4foONx/krddBvK5+r
         KcpN24RdVVZGc9KlU7VBQp4TwO5wS7kgoSvR0+Q3TNPxiumTk7UO+BVja6BZnGl6343p
         Va/3VIRX2pN2aadregLfGYWtqdB6FYZw1MBc+eo6j/n4AmAjgzLzA8xd0RPoFo9KuNmA
         0vOlGENKt07I1Mzoay8/JFguHF0zE8PQGDGojJkKoUnl7EaWqmFPHiFECL+tbe5ZIW4x
         hmbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xlDe8W0sqFdllcZatx7jtW931NEtS6iBK2DIrSs5TP+oVoqkhZM+dECYEKSctQ8JzZEe9KWUu18TsIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1zRnU82b6lQNLBv96wXU+AiuoXL8GOBalqzp+a7z5vjo5/UA2
	r8SKfMQ+SJ6zPPBO148r++2brUa3h+e/LpPh6QTqxfwUa7rAjc2+x7Do
X-Gm-Gg: Acq92OG4QPYoXyO1kt6md2C0+Eascu/ULiBZPfag2tKuy2FKzvHhcIibyXUj5b2DUYG
	Rgj8Zg3MkjTW+jz6vysHjtiaseJ1AuyoxXxD7NlILzgouG9mttc1+xlydqg1vVhKJ9fblGCd+F9
	kl1xvXC0igD0edOPUOud6KWgPRhGHpWXkj8PcwZfU9zSi/WaR1d2321VHWlmjwJWFezLqDZOPVk
	E89d7wtKSYpJK20y2NjA+w8v4KsoELJtWwCnGeX4IH+BHfhIgCky3tpuj2qGde+5uOiN5dMWwec
	3yB6RiQzT3ZL3k9YCqc6zpvYEWh/BXuCy+d8XFymeOL5eTULZf0AvgiEvil+k1s9twGYZmBn1GW
	zATNIZtQHYEOlux99MYxjjlW1DDzVYeNsWFfXZyQo8fbIKXamNT/gIL72kodNHSSVqF6ClhlP8J
	7+hTUcmnTpKFvA2f2dbj69fpktxWJRyO/j7kgyFW6iGucq6WY=
X-Received: by 2002:a05:6a00:2ea7:b0:835:4291:6975 with SMTP id d2e1a72fcca58-8415f363b30mr20565995b3a.39.1779852673468;
        Tue, 26 May 2026 20:31:13 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:31:13 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 09/11] arm64: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 27 May 2026 11:29:15 +0800
Message-ID: <20260527032917.3385849-10-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_043116_108827_A66A0834 
X-CRM114-Status: GOOD (  10.59  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Reserved memory regions are excluded from vmcore by default unless
marked dumpable. Honor the dumpable flag to filter out device firmware
regions (e.g., GPU, DSP, modem) reserved via device tree, since they
typically contain data not useful for kernel crash analysis and can
significantly increase vmcore size.

Use of_reserved_mem_kdump_exclude() to perform the exclusion, and
pre-size the crash_mem array via of_reserved_mem_kdump_nr_ranges().

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
 arch/arm64/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index e31fabed378a..1d65320c6ba4 100644
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
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -75,6 +77,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_kdump_exclude(cmem);
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
