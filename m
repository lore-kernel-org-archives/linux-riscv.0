Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2426C624CE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 01:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t6UIV5MInye83MD1uVMyAA+ygnMWLyEWkFad1MTTSVo=; b=pS+6Sha9FGcaRN
	+Y4GS2ZJMmAz0hUhy0Q+YiJRfZ5/yirXTX/auv4637sT5GxApMjkR+bOx6/ZOsTIiQH7GXj4Qmp80
	VKdJfvkI6LxGmypyhUQCOFxl/PXm4FNIGr9V0FIpuaCvO5UjBVQi1DgtqaHxb0ODBqINcOmDj8ZWq
	9Lw0TOscwUNVFQ/3HVfZYdfQkjpWYW/PKdXHL8g8kAut46LADFmHGqL/xlUqqWp071X9i2CS6xY9P
	b6huxODbEci4L4Bq5lq33QXozjSZQySK2cJ6vyIj5Ee7YVKppXC+r8qAPx/6+aORXRadke1z9IWzH
	8jMakCsmfH1+PeGcYJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DRu-0000000AoQZ-0qb5;
	Tue, 01 Sep 2026 01:38:06 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1DRs-0000000AoQ9-0CKT
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 01:38:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d91ff7d9acso15064615ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 18:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788226683; x=1788831483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MwrPzZ3UqC1qw7RtMh2uyX7vL1CZ1f9d+u4eMBeXRcg=;
        b=pLHl1sguMzUailZyObMrMLgNcIPg+8kdJQbxLgnHCLj2iRt7yF6+eR2Owt1EKTYJDi
         1p1y0dCQRfgg8ch7omeGow0SfvNpPOktwtFiLu0oC4ZXxwxXeWXpWkoVyw3wzw2HO0UR
         FDiR+/oP7ZZHxRjPId48RrrNjIxOjgxPUk9Flb1V96YdnkXe9nMfqjS3H2olW0/Y67ph
         LwzqCaOR/yzqBJZerm0hIgbTcWEec0NxDvJWCrC/DVZxMIST1MS6U8oC/bPf44M/CR+z
         qGy7APDG2fUVdYtWJH7aqS0k3YoKE44vn7ALMQU1DMoawxIZdVy/TQdPWvquNl+21DLz
         HlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226683; x=1788831483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MwrPzZ3UqC1qw7RtMh2uyX7vL1CZ1f9d+u4eMBeXRcg=;
        b=CadGCqnMljYYq1xdRKkvRdqR2vN5a67NSyTzwMJirvOA28EICylqbljeVZefL1p19U
         4cVkvNQ4UIy/0xmqOO2br0RvJfUY6wJ5BrJcpjo1gEuu6+aybQ5BNMMVZvX7SMPLZiKW
         pgnlzs9jhTMNhWbx5ydfRKNFAdSj7sXoYZoJZpcWmI/VPvC54nx2P8CnHVRqXv6jLJ6W
         DDge1yoaCVB3vXFicgfnHbC5IZwJFJf8XOCsscT95D51YuCUm7gBkHk4r/c015th5hUU
         RVhSrOWtMN8fSqoZykjHkhCjf6obLPZFyIDiwKnP2TfAwwAkwMX2ulEC8E5thHnX68UW
         JrmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEGOyWd+Q5aryF54BXCa4xVELcGN7VwZ6ylmTjkZ7q4eBD9BQhF+TTYma0ist43UCX7gpOiLXe2UmeOA==@lists.infradead.org
X-Gm-Message-State: AFuF++lPNUXK/JrN8vlwxFVhq/O3Lgr0PL6VZ4GkIEGjQ0Cf/OXppVlv
	1wk77DyikGdm5gSxBI1AetPDtODqbvTA5JWULdCyjYc/s5FlaGPa30fhGEPreR56gB4=
X-Gm-Gg: AYBFou0aKaFe8rTp5cS115NDm1VHdiFK/x1XzVZYK+ReToFEdi1C6BAY756/cP2cZtz
	8e2uA0DR424HNFhMNf62Wh7ujAjHzesTrWhkuuY28gKphWMU4PuZOafz+BYMPUse6hIYPBw5+Ax
	ASCV7y69zoHoyIu8jfSovJV4cC0ehFJVRquG5i644fS2ZcfK24rHr/Cb6XSUTzmgySJMnPd4X3H
	Fzl0I/UTJsN/i5j7VFghbOV6/MUQILvT/Ar0gtxOt3kRF7sPRDZq16wCfu2JoQvIlYgjhYKFBgH
	Ywp2avmX2/VSuTgIHpZk5Fs1OPC9F2ltikSdxwnNgNNqZDOJFnPmf5tTgj/+UOK5KKGS8YE0pax
	jsnl64PZ8fEoUIwiMvTLaFvrLPk5p8XHBy7O5PWq0ItqWN/HW4uOdq1qrBDR+e0QdfKWtB2LAbw
	dElT2FdeyhilpPABeO4hkD98+1ZH1YzqrHxVPsy6b8YsOGlMHLqR5V0qo=
X-Received: by 2002:a17:902:ce86:b0:2d7:2edd:d140 with SMTP id d9443c01a7336-2d74dbfd59amr423838315ad.3.1788226682603;
        Mon, 31 Aug 2026 18:38:02 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::3820])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fc3f0sm43974415ad.3.2026.08.31.18.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:38:02 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	conor.dooley@microchip.com,
	schwab@suse.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] riscv: hwprobe: simplify has_fpu() to check D extension only
Date: Mon, 31 Aug 2026 19:37:46 -0600
Message-ID: <20260901013746.19386-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_183804_091117_D2A0EC73 
X-CRM114-Status: GOOD (  12.83  )
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

The kernel never supports D without F, since D depends on F. The
D-extension flag is cleared during devicetree/ACPI parsing whenever
F is not present, so has_fpu() checking either extension with '||'
never actually produces a different result than checking D alone -
F without D cannot occur in practice, and there is no observable
impact on RISCV_HWPROBE_IMA_FD or userspace.

Simplify has_fpu() to check D only, matching the expectations set
elsewhere in the kernel for this dependency, rather than relying on
a redundant OR condition.

sys_hwprobe.c already calls has_fpu() and needs no changes.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221874
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Suggested-by: Andreas Schwab <schwab@suse.de>
Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
Changes in v4:
- Rewrite commit message: drop the "weakens semantics"/incorrect-report
  framing (Conor pointed out F-without-D cannot occur since the D flag
  is cleared during devicetree/ACPI parsing - confirmed in
  riscv_ext_f_validate(), arch/riscv/kernel/cpufeature.c - so there's
  no actual behavioral impact). Reframe as a simplification matching
  existing kernel conventions, not a correctness fix.
- Fix "F without D" -> "D without F" (Andreas).

Changes in v3:
- Drop the sys_hwprobe.c hunk entirely: it already calls has_fpu(),
  no change needed there since v1 was never merged.
- New thread per maintainer request, not a reply to v1/v2.
---
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
