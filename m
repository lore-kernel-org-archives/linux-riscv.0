Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1076F10BA435
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 08:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vq5pnI2WFxHpJBtBOHaNCRVF87bna0gJoiBojgYEyx4=; b=bqc4cY89UZ4LmH
	/QO9C85kejJBFbbqW8E4MtNFaU667uHDKsFyCBwGW7wx2j+cw6YyQBaOQ5zFAq5V+z+yhFOwDwlxT
	vDsd/h3O2v7TVWIwfFS9PU7IzQBn6870MDmQly5SCw6lICvmOp6eVehnkKq38Zp7JHv62zdMucYER
	GKtH5RdcUxqGwfXF1yGzjaGtFPVf9q0ZGCBtI7t6Qk6Y9ZDsIw3rEXozRqRxkBxOC0bQ15Rkd8d9K
	6g5u1D6ivXzk4gnCPExX+v1Sy/5pPoNHwn1q1kul68uMQ408/u6eSoj7Vq+6ccW1JTdYnDQTN+xqP
	xByv79DVoas8kEkQpBSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6281-00000006vBp-38AU;
	Fri, 27 Mar 2026 08:01:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627q-00000006v6Z-3mly
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/maIRRXWsco2YLlNLQIg+54XR4CJ2LAx0k8sLQQpIyQ=; b=MnJcC7Kadwv2FpmlZypP1I43Mv
	auQ4g+MskYmwWxdJGCU2FMSGSbm3n4M4n+37QZCRYVgNmMLkKwwbI3jHq+bgzy8LVCwFvRKviU4jY
	WcT8UWtMEE6iQcAWEZbFUIcAD12/kegN5gWZokw0NN8PoEzSi7Co9YNymAAlRm0W7fFE1KNtdmdva
	SxkSpVuzqVc5zdi710e3Hx6yfBye5Qg0gDOu3q0JdcW9msFi7G50Cab2PeWENlzZPq9jv3Fs3hORp
	JClnbK589ryfjP0CYBgy0oSOdeNCXRU7uuaqv/m2xSIMxdDbKh2GlWiBXq0bg7WfCqySru+9VCMQy
	W5sW9KXA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627m-00000009vJX-45BH
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 08:01:01 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-439c56e822eso1914117f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598457; x=1775203257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/maIRRXWsco2YLlNLQIg+54XR4CJ2LAx0k8sLQQpIyQ=;
        b=R8vpvREXpOegdvPk0p3ntkRkpjAiEtowxWe1Oa0FZv8EIvhUBrrBPb+9T1P3RTBvIn
         sqp9PC6mp62zJrhA73ycM6iLmIJci0AFCzDTQA0JXrCMu5MFQA88Jb0irhBVS1YnW9Nf
         lNq2437FNG6OpY5SebRrT/6GSbhqpZXJLQ4yW6k777hdoGChyy2jdpu8IAkEMsGUsYIG
         NWGnt/yFNHh+5ZaQuSJ+L++y76Fi3ud4CR5pUsttd/9qfD5/2m2+x5ZKxpWUO21jWSOD
         Eu51iwVKLR2FsDPdZsPQBwUq3/jQBwsLfPvefETk1NUh0piwJLpgqanidG40vO4qt9zF
         L49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598457; x=1775203257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/maIRRXWsco2YLlNLQIg+54XR4CJ2LAx0k8sLQQpIyQ=;
        b=Dib3am65J7NXXNaFIHuRnTJtXA6RQ3VN+tEJvqD6/UQiyRRvt1W4gzZD2Xei7PfRKQ
         1wdd1QOqNLj+LzajzGok33ub0/9oNQXDPk3aYxAegO4OQXM4lPnW4YLsK2tmgeAINMDO
         b+tV8kYHdvH2nLkt7tCkTiuvU6x/su9q3+1AWSWx54tuCVw9jaez405kDEwTxVntMrS7
         VObXC4bxNwh3x13/8O8HjZVBZPfx+3me3f/3pDd9BSIdx8cqubOb3Axvq8G3K0FCFFbe
         nw4FdiDc3kyZwZSMrxHdU+okJDBrE8f/UXckHczA5j/3KEZaVxQphvS1EBxz2V27aN7g
         Brbw==
X-Forwarded-Encrypted: i=1; AJvYcCWykJLo6a32/Zt8Q+GuaVD2cioOahzA9a+lLcHtoRVPMSXM0bJWLLNkU5HvNazAPzEccHV/x30eKqWo6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9yS9qDzTETkOGi9XNWzsyVVC+AMU7PTG5/X+iNdK+yWVo4Pwa
	xe3vtFKCZHEJ0OwSEML6Ei6T5Hnm551j8M3LZOhVvPalKf23urk0N8s3+HlybP2jAQQ=
X-Gm-Gg: ATEYQzwew8NiezN3chxuoAecnC1daOB+mdJko/T2n+Og6fn6W0p92LMuFdcMhkmdwpj
	jPcfxuufieJnMY6dYnlFQaRUfOnIxn/S6sPS4CeycXyUTRPhx75ruA+uMxuNGONPG8vQ7t35BKH
	dB+kqMwEftDKeHRKzb24vukRokzivV2FR7BWr8N1gfRjxLB+jzqyecMmL76sxnW0lvXGS6BuhLA
	ZAkMuWOmoI/KOSkA9wZytxcohE6+ku6H9R2HKWYM7SylN7toSdKeNI133j7rUvDST15xFw9H+qL
	Yb3secxC0KxVnrE+dktWvHQ4V5xH5mKOnbZtE/8i0hKPaIFkxTZfemuz0LTEZgxEECno7qOITIW
	g6X1CMczOykSt+OexZaLZvMYoIi75J86Didf+xpQpIfhbkjuEHVrhM3ztGq9U67ZaLmc6jLnvPq
	9XHzAeloJQXVebj55eTm3XpSLF8ZzHNt9q8R0dmTmI
X-Received: by 2002:a05:600c:828a:b0:487:338:b4df with SMTP id 5b1f17b1804b1-48727d8818cmr22261095e9.15.1774598457203;
        Fri, 27 Mar 2026 01:00:57 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:56 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-riscv@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] module, arm64: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:59:01 +0100
Message-ID: <20260327080023.861105-3-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327080023.861105-1-petr.pavlu@suse.com>
References: <20260327080023.861105-1-petr.pavlu@suse.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_080059_316112_4BCDD277 
X-CRM114-Status: GOOD (  13.21  )
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

When linking modules with 'ld.bfd -r', sections defined without an address
inherit the location counter, resulting in non-zero sh_addr values in the
resulting .ko files. Relocatable objects are expected to have sh_addr=0 for
all sections. Non-zero addresses are confusing in this context, typically
worse compressible, and may cause tools to misbehave [1].

Force sh_addr=0 for all arm64-specific module sections.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958 [1]
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
Note that the definition of .text.hot hasn't matched any input sections
since commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and
related macros"), and even before that with CONFIG_LTO_CLANG=y.

The preceding comment also explains that the directive is necessary to
merge section groups. However, this approach seems suboptimal. A better
method would be to link modules using --force-group-allocation to retain
only one copy of each group.

I plan to look at this separately.
---
 arch/arm64/include/asm/module.lds.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index fb944b46846d..0b3aacd22c59 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -14,7 +14,7 @@ SECTIONS {
 	 * directive to force them into a single section and silence the
 	 * warning.
 	 */
-	.text.hot : { *(.text.hot) }
+	.text.hot 0 : { *(.text.hot) }
 #endif
 
 #ifdef CONFIG_UNWIND_TABLES
@@ -22,6 +22,6 @@ SECTIONS {
 	 * Currently, we only use unwind info at module load time, so we can
 	 * put it into the .init allocation.
 	 */
-	.init.eh_frame : { *(.eh_frame) }
+	.init.eh_frame 0 : { *(.eh_frame) }
 #endif
 }
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
