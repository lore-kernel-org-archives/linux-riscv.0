Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006AC606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 02:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wgzi6Tt9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2yDGYlh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TBLLT4BFkfDFQcvO2pPsSD8lT8s/Kj3DeoMIHzZD3oc=; b=Wgzi6Tt9L+zGCNFK6BUQngRdNT
	UzsovULzcJJBxoYtAhwpaqwk6F+FjB+pejxC5Vm7Lv4kUivz2GtYuulnzflkkBvkb/pZwvO+7wr76
	c5AU1z5fqgFNwxIjvTMfYG/8DYvpm92Q+OWsG6VU1FX1YY2gFHUlUFhbBc5EHQHxdW3wyI8ULLUkD
	k78CEXccvD6B1PsRyTVHuHDck/O3jkar5joWNx0Tx0q/9pxH6ecRCtF++puTP02SkcX+rv+xi7Jp2
	g6mZRQl3peE0ZuyG5NNYlQWDGmN2yucvnAiFcGA9v2svlFqDuvrwCa9RBPeHhv6HhzhrLhYZKsoSG
	mgOnjqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTs7k-0000000Ahlz-3jVW;
	Thu, 19 Nov 2026 02:43:44 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTs7j-0000000Ahl7-0KQ3
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 02:43:44 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4a32576da88so925197f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 18:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795056220; x=1795661020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d66UMPv6yC/s2AzK4CfOK+WTQNXn/BlfhFXZPeLZHuw=;
        b=m2yDGYlhG65CE6Ck73uTk6Q4KLfxMxMjKAAASXVeQ+BotlhPlkZry1Q1GLoFEYfECn
         AcenvhLAEP3mE38E3qlMVsPAoCOiSzB60uhWDF7/U5CrMzKM1N9dGOC0EDr/tKvNxVhW
         O1lRWXpH01CDJHSxe7QXWkuNLL3uc7tvUlQxrrWAiTOysoh9TAUabrJKLjH7FMnhG/do
         tKFgAcELnGvUG4vP4Jw1rVZmpviJsKBvUf5wc4/41FBJbyAO2ZlPAK0rKzXiyXs6058C
         dNX2K9VsJ9tX70w53n5v9I5alBFtBg67HPqlfH4MhERNkPt2kDC8lUvL6me46knjYQ0T
         q8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795056220; x=1795661020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d66UMPv6yC/s2AzK4CfOK+WTQNXn/BlfhFXZPeLZHuw=;
        b=YhPQmU+WZ2ooEXOSroFHRyzMbF7IAGyBkFcxSF4esBalQy1Cji+vyAa/whbnBS6Cf3
         IAoUVHO66PPFb3PSAT3sumkHYosdkI96J965zADusjuPFdnho0+6ddxFsGe6+hHS17fm
         rqM+mlu0JTEeUd/+pkdJbo0bRaXaaKJ2ot9vpRM22cCQCerAKqwnw+6anh8ZYFghTrkA
         sbvXK6QSm3KK4Fb1w+srP4cIGQGGmEnUcrfOZ/6cV2HekCaBmxFxJe9pyHi4BEepeSEq
         rmoyJqu5unOq18ukwWsuyfhNtB+c1+eHYKo8pEDGnXfcmU/Oz5ydFW6xXQ3v+LqLexjY
         445A==
X-Forwarded-Encrypted: i=1; AL+hErEyN246kANkCPl5Ph4jzeGURqpQqMtalq2IwyWtK3mJxisekIfVeUj6B3QdXdcQ4CgACcxNuRW50vkQ8w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/JXCDKoW3Stc+9tdy6bNtsqbtld00QlV52mNwsaBRTJPMf9sca
	AiW1zhhzMdiO7Yk0y9VbCDsuNu4cz3PcwZR4Nz8Rjmzznidzxs0ZWOml
X-Gm-Gg: AZFdTZf86O2ftclCuPt3HUordQmqtfiQj8/Z3qCQaeXLjDWYLCkGrXkcuZ5apjIL9zs
	6YqaxO2F6ljw4NmfWX3Y+XRYdDFKttIxLdXjkhNnp/0DNP1aAkpbezYAbvT84eN6zphEghSiJE5
	KuHlehS/Q5C/ZMFsj+oiS/EYM+48CTYHtZQzwrJT+xOm6Jf86c+VMUIgrZrDlXsrl+hFx+iS3/3
	tMABFw+WRJjt29K1tDdWev2eqMLBuH3GOUdxwPfp7pF0R67hol1eAlCFDgEYA19Oovb2fGQC2XJ
	qxB0JBkl9C29GP3+dD1HL/gYE+XtlvMJ/ycGWS01Vx/9WNS6xURe8Ex/nfZtQkwGD3olTO+54CT
	oUByZBg6tbHrl//tXSyNJC8zfS7QDez1Rzx5l5bqkpjSuF4j/M1oBw1INAh2yambm0GhvBhtOBZ
	/jXw94BlT9VnPYl3UR2n/I4rJDX/wQjHIpWVMjXbuDNAzfm5Exx0MDy7RROedNyYn1dJkMVx0UE
	fr9l1oMC3jJyVxQEaJJrypDx9sVI4/+DM2pxxTNjMUUPJfV5bGp/4LiQ4JonnxRBlnZtl9VOYvx
	onfU5oKm2S78h+V977KLeCbbkp06LVxSYq4Xm4DNTUqHAc8B+5p1u/gNrgjP9lGRYDZUqq2/G32
	p3DTTMV0zDhb9yb2AP0xvuTH7Qmg5v3gkCbNCAMO9VKQR8KsGBFQndPp3UZoSURFXRLZiw6rxB5
	k0yfO/QyvY91K7vBm6QR/s5YMY9DAYAZOj
X-Received: by 2002:a5d:5848:0:b0:4a7:b365:19df with SMTP id ffacd0b85a97d-4a7b3651b17mr6493139f8f.35.1795056220087;
        Wed, 18 Nov 2026 18:43:40 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aee2-3801-51ff-dc56-c5ae-f027.310.pool.telefonica.de. [2a02:3100:aee2:3801:51ff:dc56:c5ae:f027])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a885b81daesm2965497f8f.20.2026.11.18.18.43.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 18:43:38 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Michael Neuling <mikey@neuling.org>,
	Raj Vishwanathan4 <rvishwanathan@mips.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: errata: mips: Skip vendor extension lookup during early alternatives
Date: Thu, 19 Nov 2026 03:43:10 +0100
Message-Id: <20261119024310.37980-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_184343_133514_F468375A 
X-CRM114-Status: GOOD (  11.08  )
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When an enabled erratum selects RISCV_ALTERNATIVE_EARLY,
apply_early_boot_alternatives() calls the MIPS errata callback from
setup_vm() with the MMU disabled. Each enabled P8700 probe calls
riscv_isa_vendor_extension_available() before rejecting
RISCV_ALTERNATIVES_EARLY_BOOT, although neither workaround is applied in
that stage.

KASAN instrumentation in __riscv_isa_vendor_extension_available() reads
shadow memory with satp=0. On QEMU's mips-p8700 model and on a Boston
board with a MIPS P8700 CPU under KASAN_INLINE, this faults during early
boot before console output starts.

Move the existing early-stage rejection before the extension lookup in both
probes. All later stages retain their existing lookup and patch selection.

Fixes: 0b0ca959d206 ("riscv: errata: Fix the PAUSE Opcode for MIPS P8700")
Fixes: 2cf0b2992203 ("riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with mips.pause")
Tested-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Reposting without RFT after Aleksa Paunovic reproduced the bug and
verified the fix on a Boston board with a single-core MIPS P8700 CPU
under KASAN_INLINE.

Changes since the RFT [1]:
- Dropped the RFT tag and added Aleksa Paunovic's Tested-by.
- Rebased onto riscv/fixes (5c52d52b1b8a); no code changes.
- Dropped the removed Assisted-by trailer.

[1] https://lore.kernel.org/r/20261016203052.2026-1-kmehltretter@gmail.com

 arch/riscv/errata/mips/errata.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/errata/mips/errata.c b/arch/riscv/errata/mips/errata.c
index 6e71555274..9bb1c3de95 100644
--- a/arch/riscv/errata/mips/errata.c
+++ b/arch/riscv/errata/mips/errata.c
@@ -18,10 +18,10 @@ static inline bool errata_probe_pause(unsigned int stage)
 	if (!IS_ENABLED(CONFIG_ERRATA_MIPS_P8700_PAUSE_OPCODE))
 		return false;
 
-	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
-	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
 		return false;
 
 	return true;
@@ -32,10 +32,10 @@ static inline bool errata_probe_wfi(unsigned int stage)
 	if (!IS_ENABLED(CONFIG_ERRATA_MIPS_P8700_WFI))
 		return false;
 
-	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
-	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
 		return false;
 
 	return true;

base-commit: 5c52d52b1b8a2f884b8fdfe3c74741ad5b48f2ce
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
