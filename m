Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3076AECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 19:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IaBTYg6K1SAt8pPDYDlJk0lGwVFbPeckoMTBkgwAOxw=; b=bDaDxAlAst9HlX
	xg+jHj2/I2OsNkOFjI5Bfqit6kbr5BIPNdNO3+ZtV4PIz1N0KDaCWelcYbOkX+eNSsdpGR/cXy7go
	Sju0kixq+o4Y7aXmMuWAhiQqD7M9zJUSBX4ic3nVbtHKwsxeJRpJKM5DXx1L4USBto+NC3bWZ9yk8
	AErk4bm6FRxaJJJL5Z5kL6M3+5sMN8MKPaiW2zDzABduINS7oAf/i16x0MM1+3ligI8MLl3prpgIH
	hAE6t65Iye7lOehQp619JJqQqxWxtu+0boKdjmYnaF/nWIIm5jBqSx+0tVtwmFOfpAGGuzUwBN93W
	m5cq7J2fEqaQtot68kNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYufn-00Fyt4-To; Thu, 15 Sep 2022 19:37:19 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYufk-00FyqR-ON
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 19:37:18 +0000
Received: by mail-qk1-x735.google.com with SMTP id c19so12235910qkm.7
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 12:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=IFHyF3bgLmRCz7L1OXA+Yzmng1wr1QB+FbuCdYFy/tI=;
        b=P7wrNtaVdIOrlW37f0LPcfnU8hmMUK2jaYeanePYkOaTMdlGNSguzpBt73lkoKp0Sb
         i7B7+qgdb1F6INrk3zgGj7KX82s4XVBJ4OnjZgn4smtDkK9krE1kaK/rtNzNpYUDOiwV
         ZlBtHLtF7ylHYIQ6CqRPnp/Ip0/nITf4wEWkJab/i3LeBNse9CbM/UBN2ERF2vwlOb8t
         f9Y6w1fxmvmcKYNc9AFLG2pZDF75Ih+DQC39s2hCVzzc4ARglhDXZax0+qjBT6zrbj3U
         NNXkkCiEnAN+mEky/USAsQdyn8r0WkICeuLhvccfnawu91AnN+S1C/0Npo4JD8luo2iu
         1Hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=IFHyF3bgLmRCz7L1OXA+Yzmng1wr1QB+FbuCdYFy/tI=;
        b=FhpCv9D3jxDYLH3Q8hAuvL1mxHsa271rMgvZzubKg8NJ1Q5Fek1iKFPw0itRGgIbqp
         hfsUMIkdPfY+rOPicdes39uuAWc8n3F36u0vpw8wO2Jvn4lZjoZotuu4YbEOgjycBrD8
         xrLwOGhb+YunMZAgMXPsTWBj0DvEDs+jiwXt+Ka+ZfEe+6rrNYTOxzyy/X+R+1Tyi0lo
         VE9JRULU5yR3I02eJXg78DdZw3q4fpGF32/e8Sm+PJfpgxuK0czNS1FgQPO4uQSZ0fF1
         36LtqX/tSkDuilqz3SbxdXNszP8CktNO3UAAb10QYTLmCBR987+a5eHs6h7SEdxbEJTh
         LNdA==
X-Gm-Message-State: ACrzQf2zFz0YR6BRVSGzzUue5RY4XTzFI6O/6SQMyqio2xUiSzL+fShy
	jBj+a0srKED/6srp+sF/fMstaA==
X-Google-Smtp-Source: AMsMyM4CHd0lOE8Rm/3v4PwlgRx/bBQe+7EooBJvnnY6/buIywrcVpw3hNDVZiC0kDU37vTvXNd06Q==
X-Received: by 2002:a05:620a:4483:b0:6ce:8e57:254b with SMTP id x3-20020a05620a448300b006ce8e57254bmr1395661qkp.540.1663270633518;
        Thu, 15 Sep 2022 12:37:13 -0700 (PDT)
Received: from abrestic-xps.ba.rivosinc.com (pool-71-105-112-35.nycmny.fios.verizon.net. [71.105.112.35])
        by smtp.gmail.com with ESMTPSA id r1-20020ae9d601000000b006b872b606b1sm4596459qkk.128.2022.09.15.12.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 12:37:13 -0700 (PDT)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	dram <dramforever@live.com>,
	Ruizhe Pan <c141028@gmail.com>,
	Conor.Dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH v4 0/2] Make mmap() with PROT_WRITE imply PROT_READ
Date: Thu, 15 Sep 2022 15:37:00 -0400
Message-Id: <20220915193702.2201018-1-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_123717_031893_D8D42DDE 
X-CRM114-Status: UNSURE (   9.30  )
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

Commit 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is
invalid") made mmap() reject mappings with only PROT_WRITE set in an
attempt to fix an observed inconsistency in behavior when attempting
to read from a PROT_WRITE-only mapping. The root cause of this behavior
was actually that while RISC-V's protection_map maps VM_WRITE to
readable PTE permissions (since write-only PTEs are considered reserved
by the privileged spec), the page fault handler considered loads from
VM_WRITE-only VMAs illegal accesses. Fix the underlying cause by
handling faults in VM_WRITE-only VMAs (patch 1) and then re-enable
use of mmap(PROT_WRITE) (patch 2), making RISC-V's behavior consistent
with all other architectures that don't support write-only PTEs.

Both patches are tagged as fixes for the aforementioned commit since that
commit made a userspace visible change that will break any software relying
on mmap(PROT_WRITE). (Also cc: stable since the offending commit was
itself backported to stable).

v1 -> v2: Allow handling of load faults in VM_WRITE VMAs
v2 -> v3: Split into two pathces
v3 -> v4: Fixes tags (+ this cover letter)

Andrew Bresticker (2):
  riscv: Make VM_WRITE imply VM_READ
  riscv: Allow PROT_WRITE-only mmap()

 arch/riscv/kernel/sys_riscv.c | 3 ---
 arch/riscv/mm/fault.c         | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
