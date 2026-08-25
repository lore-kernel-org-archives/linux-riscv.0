Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD0AC61DB9
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 19:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OchxPXah8TwwDk4Cv6CkBqvmxTXR+WFnilW/xKLnQUY=; b=kuslkc7XeyoG+G
	CIOZZ0SmIvf0qEhpzO/hNx6Wj6sgy++BqcqijLCWoGaHQjicYjE3wVKWy7woqUGpxUyxSjRr+jA+9
	2BPBUFDpP1FIiwQ/30meLhDj7vFcv21aQg2oQu9dAtsrk+o55t0C2RbXppKJ8E416ZRZrGREXU84O
	rR+23Ph0OVrZ+ICF7FX/9DhIo8vt8QSyBeBdtWtYGTSVpXxLBB9MNeADpgseDQcMHuImM+MdJN/9B
	SU0LmTzmuizLDuJqR+KDZJ9YovnTGD3O6S5N721RO6MXZ0WeesTa1dTciyOWStxiiij85kUXEAiTJ
	Y/Z/eheL5jvqc0668g0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywgm-00000001NSa-1tK8;
	Tue, 25 Aug 2026 19:20:04 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywgk-00000001NRp-2SUz
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 19:20:03 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso338269a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 12:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787685602; x=1788290402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9yn1AZpSNU3LN3f5fzRLjyvga7IU+AXqKHS+6/yZ0w=;
        b=Jy4PKIR5m1KB2T2wuk/Pr5PeQZZKKqP0ByEwUF+WLzY8oGE2C1/6qtkxZyDI6cUXuA
         R+a8BbTnxXLDgaM7m9QMVqpd95oW1mt3/L5zu3FzfcS6j6yHwFs2eOzhbopb7nVVcyDk
         tr11snu6LJcCqJycpku9dnvcZOf+VZf7l6d3/496HS0pr0ms2g4UyA8Z5IMQDAFo4KVr
         k9bUT75F8BLXynXvlesjbOOCDAQfYH8SzZ6SAK6dJTADBD893E5im+sd4GallInXwvKl
         rshp0hk9ADidOkSHpzPHsB2CqH9cy13TyWO3nFMTXbu1hYTjoc9N0GNpk5e0uOvi2Zmr
         6Zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685602; x=1788290402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9yn1AZpSNU3LN3f5fzRLjyvga7IU+AXqKHS+6/yZ0w=;
        b=I1SbYaWIFoh0mEx0k4OCEx+NOVzskO02b4htUC+zLwbLIoUxfcu5z8UoT00BQNMHz+
         Uax0D0Rtx9yyymoKWhFyX3909Hrqc0TXJbEi4qwBGDUydLy2jpsuM7R5PmcMPZybIcnb
         1J+A/x9pEr5lo8F8C6Ovsls1h2iLGiz/jDj+ygXCylvdmxdbAdvVylWEE5W0GpWQcyyj
         G+8i88DjHbaYKezussibGaVTCe2VshIQ0Fz8kvgDJQIwTJj+YMP8Vyx9f5Kid+mECll/
         U3/qI1sG63JofjpYdI6x6n34Px+2gl3Uu/Dh3MvRZC7cqONNErxW1/06sg6qg9G7TfP6
         DjzQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCzAfPcg146FKhsvwlPAtTKhyUzQt88v2Y38+RSLMe5WHGPmMcx7e7uFzBYwWqrKbq+769X+rCxdJWDg==@lists.infradead.org
X-Gm-Message-State: AFuF++knFWPOJiyA92M1jpAnNJP/oXuN6am0jeM9BGzqe0lOK//ILxyk
	ElCYOq43OpM4NHGABV+0V6eP9BqrbxQeY2CCBiQKef3TlKC7Ac5pMpXW
X-Gm-Gg: AR+sD13bu5XZiqUMLSGng1y7j9zaqrw+b+whr3qQPpdtEDHCR0iaGrNIbignZSUlFlR
	dqffDwgLibNifhd+RLtlKxqkhPhSnoKrGJOVd6tWhXVHiLqG8jOftN3fwmWKwTRpiNjyiQSuNAJ
	CIszFfe89IfwEGP7XurbNcj6r8jKOxto+kDsqMv86w35PEy0VJRsGIR8b+l2H6tF8bSdDhQ0MAQ
	MBZi2x/jMxHTGV733xOXv6mGcI/vGVWgd4uyEUP2jRIu6ZD4W7caz238gN8459loMHlIUNinOBO
	yjVXUQAFq4gcroX2Wc1UNiBb00b8h2SMF0WQoTTNGKA5Nbkdk0RvuhNn8ejckVsy8Q7sUrshHLb
	oIYMuHaRqPDnfcNN2M2JMxvhUf/y9BRT5TLsyrWzgcNMUzlZttkroLu10qcVjiv/xHs3Oak49/S
	IpQJ55HoHlQ0ps+NnfSoZaSYsDJemtcRz/5t3Pmbkj0XlXlXvqniUKXsI=
X-Received: by 2002:a17:90a:e70f:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-3966d43471cmr2894089a91.8.1787685601723;
        Tue, 25 Aug 2026 12:20:01 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d31f44sm4765782a91.10.2026.08.25.12.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:20:01 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	conor.dooley@microchip.com,
	schwab@suse.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH v3] riscv: hwprobe: fix has_fpu() to require D extension only
Date: Tue, 25 Aug 2026 13:19:50 -0600
Message-ID: <20260825191950.42614-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_122002_627961_B38639BE 
X-CRM114-Status: GOOD (  11.44  )
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

The kernel never supports F without D, since D depends on F. As such,
has_fpu() checking either extension with '||' is incorrect: it
reports FPU support when only F is present, which is not sufficient
for D-dependent state save/restore, and weakens
RISCV_HWPROBE_IMA_FD semantics to "F or D" instead of "F and D".

Fix has_fpu() to check D only, which is equivalent to requiring both
extensions given the dependency. sys_hwprobe.c already calls
has_fpu() and needs no changes.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221874
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Suggested-by: Andreas Schwab <schwab@suse.de>
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
Changes in v3:
- Drop the sys_hwprobe.c hunk entirely: it already calls has_fpu(),
  no change needed there since v1 was never merged.
- This is a new thread per maintainer request, not a reply to v1/v2.

 arch/riscv/include/asm/switch_to.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0e71eb82f920..8186cda88e17 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -60,8 +60,8 @@ static inline void __switch_to_fpu(struct task_struct *prev,
 
 static __always_inline bool has_fpu(void)
 {
-	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
-		riscv_has_extension_likely(RISCV_ISA_EXT_d);
+	/* D extension depends on F, so checking D alone is sufficient. */
+	return riscv_has_extension_likely(RISCV_ISA_EXT_d);
 }
 #else
 static __always_inline bool has_fpu(void) { return false; }
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
