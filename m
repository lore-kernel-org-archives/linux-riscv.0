Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA686CD5BD2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 03:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76fxOa3Hx1zuJWiREHs9KAKAHhT/AGiErN9qsIWWOX8=; b=Eej+TkxyIT+2Ys
	NkkEcjQrWMNK8wWYxsPm3za99SmBklbssBdG7kFRHGWl2cqqWORYzsv6uLeKzsPCktZCJ3JJ/va1S
	Swyct2Hn2iIUwKOg7J1a3K0FY1LjvDf6owgjUy6Kv34RpQEpyq5bqrGkI/qZEyp5NjHP0dRpHEQQ7
	H/uE4jlRbGsi9PlbXaKf1o0pTKAvGdtv2iwcwv3osx5R29JEddhhlYHWhCGNl55ynTUKVGrs61etl
	gRbBJZk4lQhpKXfz48Plx/0D2HWzfdUBiIeYuwa1jy0vt7zdkC4Pj91PNw87FxW+Tsgo3B9pl0tre
	qr4dbor5++JuuD7vBmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4xu-00000003EXx-0k0W;
	Wed, 27 May 2026 03:29:54 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4xr-00000003EVt-1LJK
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 03:29:52 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-841513664bbso3083502b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 20:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852591; x=1780457391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=njw45fy92ZiCRoVDIOGyWIE8L7TZlg4oajZAiHz59EY3D8No8sf6wOrW+F1EAsQt9y
         jKyvszQCDK7uqs/0MkMXdZCaEyQ95upL16WJfqPV/HCodFXK8rzMAdKcqz4fAPZA5tNI
         IkNKPOIhqMOBNTO4OaprYhxpVVbEWiHtRjgDz4R/J3ihyJcccskGOtt3GP4p2YdaCmYM
         KI5u3CyTzEztUFbh0pFgTonINAnsXuFXtVIzXDejEhf0i8Yw6vzP3AkywDaYE167OoDg
         4H8oNqij5p98iLHY0IhxtJblkwFOGpsh/DLG0GxtWjzev3NUfY6Dj4w2831BeQt5BFH3
         uYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852591; x=1780457391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=qm1vU8XqOfBGe016cpUzqNcr4OMeL8/SNgEh6PoyWuoLrdbRGIADFBnqHXHCK12vjn
         rf7DHHF5dPvpq1ba5a00CdqEA4J3TtrpTXy3xR0f0WGkzDP0UJ2lmbKJAbyjuZHlkerL
         8A4GoeTjFOVOUBqzTn5c0CAEg+yxacFyj8fsEPBkxFS4wKN3YN+ipMgxLhiPiHOpvLq7
         nC7WZ7k6st4kvykxN7yb6r33lI5TNYRrymQSoNZmJiR0+LDAGbUQ/Dg654tTH37as4/L
         ii3KWTypQEZgQLWFsPD7Zh14mDk31fqJ7n47O2Ppcr3swmjrBt613Qjiq5rrCKNDhi64
         lcKA==
X-Forwarded-Encrypted: i=1; AFNElJ9qJ72GaKcJhVTqrx4FgZGmvyO5yjvnuA32MMk9lcHFtPk8YC3WJchkh9Z6ofsMtj2ZJdzzFKXBxJZlOg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1bf8KZw1jJAu7negMVEYOlfLKw0CDG783ue5LAMvwdOGekaLj
	A3IFPk94XAT+SmR4T6nra1h4+M+zF37wKpZtB976z13N1Vl0vFTpIBum
X-Gm-Gg: Acq92OHKxs6TGiMuqZBnUbejKdkMp2wUf5cDANKxcKYlG49RQBfia/IwtyYrmE1j2E5
	GhgWFOoX/j2G0dJ3Y7btxEh+02GW27s9PC5fmz9/liNpCJ13Syf7qrcaT4Stb38LbSHl2vVvJJf
	KHE2iGwB/SXBt1FQRMpW9SAWBCeBv99Qdnitlx6BOBnUe5yDZVGjIx5IcLgTpLCW6nmltu6MV/H
	dopOEsu2/VKJ95/yOlf8jQLoSS3a1b4VsrZPh2NuSL7nZEeirfxW8cgaDRHNph+2iMBRxHSJzTG
	iPb8G020Qhtpbz77CNs0Tw91upETA7wAWJxalkSFe7bXNlydtHwbtHvFhtpNK5qL2l07ckwL5VJ
	G8NAPNRGpmc8UahbBEvwUH/Epg0Vsc791zzqVEN/rW1ptx/lzT1Zn18j0U+DzI2xDCBnRlTTTIN
	S/XPnWsnAdsSw0KjWYdLRlV8ViZZl5p1Gz6tsD
X-Received: by 2002:a05:6a00:b483:b0:82f:6de5:90e1 with SMTP id d2e1a72fcca58-841611e8e64mr16309875b3a.24.1779852590643;
        Tue, 26 May 2026 20:29:50 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:50 -0700 (PDT)
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
Subject: [PATCH v3 02/11] kexec/crash: provide crash_exclude_mem_range() stub when CONFIG_CRASH_DUMP=n
Date: Wed, 27 May 2026 11:29:08 +0800
Message-ID: <20260527032917.3385849-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_202951_365179_77219110 
X-CRM114-Status: UNSURE (   8.85  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for an upcoming change that excludes non-dumpable reserved
regions from the kdump vmcore and will call crash_exclude_mem_range()
from generic, non-arch code.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 include/linux/crash_core.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index c1dee3f971a9..0033d4777648 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -87,6 +87,12 @@ static inline int kexec_should_crash(struct task_struct *p) { return 0; }
 static inline int kexec_crash_loaded(void) { return 0; }
 static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
 static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
+static inline int crash_exclude_mem_range(struct crash_mem *mem,
+					  unsigned long long mstart,
+					  unsigned long long mend)
+{
+	return 0;
+}
 #endif /* CONFIG_CRASH_DUMP*/
 
 #ifdef CONFIG_CRASH_DM_CRYPT
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
