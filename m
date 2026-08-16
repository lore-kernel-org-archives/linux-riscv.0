Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1750C5CFC1
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 00:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OUVcOwM82/IAF39xyYRJYeLPBQaYbwrIXq8kGxvgJPA=; b=gZap0e6AFLaMtV
	5A7rp1+pWm9jBKdVisfMYCNJJQVeyldAz0k0iHVUhTG9j1KBkm/QfVSZWVDnqHwkru2JIoohFzO0r
	L0S+9iiJiLjOEqQonlC1TQuW296Ph0pjFzpanVM7yXBz+jrOnDPi9LO9peZJwIGW3WSRn0LtsCXvI
	saaj5Loo+ogqvSjPxWst96zJS1A9gLafupGYWgA8Blrz/SqorpEMd5Lm6X5I88YKfQaEmeNY+6/rU
	+2vyvLlqFgxdhUYU6edUZfpGKpRVG0CrVYRHW1fFhzEsyJEd0FGlskIb1PECc9nc/iR5m9ogXSI49
	38m7lZdpA8XJT+bDrbkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvOnf-00000004LWF-1c9Z;
	Sun, 16 Aug 2026 00:32:31 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvOnc-00000004LVp-0idc
	for linux-riscv@lists.infradead.org;
	Sun, 16 Aug 2026 00:32:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ceab75934dso27441625ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 15 Aug 2026 17:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786840346; x=1787445146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4aTo747A3vPvNvBBIWrbnSMChhvNabo3pgn5MllQM0w=;
        b=HqRvZnViybqRg9WkdzBSaOKYPD8uQsKJwfPOEkrxvHft6cPiL3ViUCdfeR/KFS2ilS
         vftaT80sDHwFRvLYk/6/tpC4EqQ2creO2+uMGmIPol13r2b2Og+mFtfx5TDjF8VDkExa
         z2xryW2YdAZylrZ8iKro5WrN+EMiAJjsW2YuAnavBH5WzyEISsIoVU6dEp0q7ly9ZgKd
         3esfMfxKzbq5Fh5pp1XZ9R0UZHKUCCnT52eiu3umyXfhSD9q0czbstJqFhH6TG2zQrSs
         8L2ogkRoNvydC2nYWrdPOiG/m97rBU+rkawkNhOa0nZexttrY3zj+1fUwSu9MJTHjEbl
         6ltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786840346; x=1787445146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aTo747A3vPvNvBBIWrbnSMChhvNabo3pgn5MllQM0w=;
        b=r7u3eRz8mMJowfwGKAREV1H9IC++/qFyR1rVHiqQcEJbgq8Ni93t1k0NRNkzcFqses
         joLvuotvFM0EaQy2R7CNDCcgB8la658V5Qt+UPcpogwl2VgE3rFKL4fwHbireiq9+kl+
         ysz72OKpH+wWwaGQMX8TpTChKnoWG8TJ62nSUC02wg2Xce1jfYW0UTAR/lbaK7mvjiyQ
         N67h6u5Tv0rc3juRi61cJIMmcvnr3zaMWyxEmpoiwPK3my1usEu7VpRaMk3S1u8xXYuN
         7iwslDyga4TDnce3F4DFWht/4mp2vXq0txUb66JTsYomICTPIJyM6uAZ0xcWAXzZMd9w
         BP8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqoR48Spb+FVQ4XvUaztUekFID7/iD8vhUSUd+1WygKoA01V7CZrKj9XhtgtPDZ7Wvgr3AAnI09J/1+QQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRzZ/hfuM9JPdQhBubu+rmYyMX6zYP8A3RG26HNINkGsj/N7Mr
	ijXXkccPu6rgfINMuHlFE4H9leY/02U7+nzFeNdhkdwECOYdZVvJ74h8
X-Gm-Gg: AR+sD13V06vq/PVzQ/sP/uU56NsswpHrE1z/OWJjkFvsGPc/L41yLoruaxn836QJeQE
	dbHtXUJWy/JnXqEwR3p3mrqnXEmJiIuoJo6heYNim7pvjk3hyoQTnOlVWhptDQJxZk8JEva7zFh
	HWkS+ugHIWY3sKPeVYLn0SleQ3OliS0ty0wOV95KulEP0yqnMjNEGel4kbX1UbJxxS7sRiG+5FY
	ogjhYjIk7E0RmQBCVq/7R1UM873AY94wjxQMaxNgFNV7vnUFLLSRL1UmQFuMcuy+8EkGN8AkX9A
	Bz5M2PkDE0X7EL54CG5ohJwlKMSTERFZJryjWJJD8jWx5KwaJBXsjSBXSS6t4K87XMLekaLcNt0
	F0L5tx1K+wA7ZGc/5K0nrvo4Zt4OfNGdKPpo4Gchdzjr97aYaFSy+iutD9/Yu+kL/Kp2EF4oKQs
	Vfde6lp+xFV3ogQB0WLAFG7fIjyNnX30ZBKhpVYJcEbvgO9on+xJ2gRWwVsTrkLoL5
X-Received: by 2002:a17:90b:524b:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-3933cb3f7d3mr17652017a91.8.1786840346163;
        Sat, 15 Aug 2026 17:32:26 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb78d512sm7545429a91.16.2026.08.15.17.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 17:32:25 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] riscv: hwprobe: require both F and D extensions for RISCV_HWPROBE_IMA_FD
Date: Sat, 15 Aug 2026 18:32:16 -0600
Message-ID: <20260816003216.22534-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_173228_246157_B310D1CA 
X-CRM114-Status: GOOD (  11.22  )
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

Documentation/arch/riscv/hwprobe.rst states that RISCV_HWPROBE_IMA_FD
means both the F and D extensions are supported. However, the
implementation uses has_fpu(), which returns true if either extension
is present, since that's sufficient to determine whether FPU state
needs to be saved/restored. Reusing it here silently weakens the
hwprobe semantics from "F and D" to "F or D", giving userspace no way
to know which extension is actually present when only one is.

Check both extensions explicitly with riscv_isa_extension_available(),
matching the pattern already used for the neighboring C and V checks.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221874
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 arch/riscv/kernel/sys_hwprobe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 1659d31fd288..7f91beb82a1c 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -85,7 +85,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	u64 missing = 0;
 
 	pair->value = 0;
-	if (has_fpu())
+	if (riscv_isa_extension_available(NULL, f) && riscv_isa_extension_available(NULL, d))
 		pair->value |= RISCV_HWPROBE_IMA_FD;
 
 	if (riscv_isa_extension_available(NULL, c))
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
