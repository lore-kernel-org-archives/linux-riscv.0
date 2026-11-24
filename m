Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5AA606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 06:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=05AXwYJj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTXc4afv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MfLI+TJY5OWNHQWy328L3jA+ogdjTumOjmCK3Kb5ykw=; b=05AXwYJjKZl/AJMO4a54BiSNdM
	CnJ7zg1xuciF7EF147SAEOIYIz+S2ayp4FcDhYfVI/145Na6IhTBaApuh768UpMKMxC1p/eiyNDC+
	kYXf6uvOTjxGpWTu76bbE49wfyIHXrl98ART09kM1NixA1YJWrRSGTPScTq1uJdNLUhxA1M1sIGM/
	HOm+K766OBs7WWPDjIYD/ARFcDTpM4cpqQftt/9VtXNhTySzjjhvkjXVI1Tr7+eIXJljq8AMVx/eY
	Gyss1kZlIYcY1StXA60aVHJs3q4Wih/yY/jZFSSqIQV1NMxz0B54NdsT/izmNjfeTaV0+x8Pp1BWz
	3gAHZ/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkSx-00000005geV-0fHJ;
	Tue, 24 Nov 2026 06:57:23 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkSg-00000005gWQ-2x3W
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 06:57:09 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2f07a960666so22117965ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 22:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503426; x=1796108226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDuEMxYgYBVobl/Z5dl6njT/IiUQ6/EkCRGt1PlxcR8=;
        b=JTXc4afvsYhxgIa6DWAT2MoNutUAPdIPsENij/RN/a/GA69FYGNixBMi6hR/Geopjc
         RWW3LVE9EacIRAmYMHLFyuKlGKTSKBDKkG3dlvIb2WLcbVB5jXZBpARVDnYTcDO5iHI5
         53KXs7Mp3zX+lqCRjRHxLhx7X8m7ls5Js6ZpJZ2FUq0xDy/Y74sxWVScNq1Vc/2WduSB
         TQ0gtNe/1O9uF5Wj12S6Rc1QaYQb8mjLmXx+xi9IxNKb7vzrPN+AJLUxizFuFsVfgRQb
         Aq1TJBbsY23PTO0fXuYRiZADn8xjlfaP35M61WYWWlAW5teVuyXfg+K1o2SqHMseCBhy
         mGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503426; x=1796108226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FDuEMxYgYBVobl/Z5dl6njT/IiUQ6/EkCRGt1PlxcR8=;
        b=1FQsaBGhAs03mQhITyA0ccHZQIXeHevNxcCDQ5CNw3Al+Sk1O+/qA4gauw8V7xOw+l
         T4XWsoEBikzYORplaxGA6kLyt4M1LecJx4DiDTLPdDpHS4qAJJmp0DWN6rJ9AFDcL0Qr
         djtoVTYo7cv2UbsiG/qsFFLGl78UWxbRKe9tSCS/lFruxHltHoWTaPJL0r2MnVHKYX5L
         qJhJ7XfHAbFdhpkseoli57GcCYRTRSolcvPHPIClC1OIu0NySgDASn5UOyCDAbmDnEux
         Fc2PgxpKuZhDnMEQhCZD+nSvqRXSw/2IEJlDSuEv/0ImMJaKEH9Qx8pChgJ1Y088PHWT
         KdcQ==
X-Forwarded-Encrypted: i=1; AL+hErFI67ROo8zG42KoDf4gEe2uSRINLQbqB1xrDwuMkaq2F8OxhTXmOJD8UYIeo3Pwn3gI5f/pxXVqVDsuVw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/oBxYWybkIIC4ripg5GTu65i9Fm5dTBzv/CrUUpaUTiM6Uij7c
	t6gLKVGmOWUxGa0eKQ7UJdZeqxPr9yWQj0Fah4iVyJoeeFZcj4o4oQbc
X-Gm-Gg: AZFdTZeWxjbY558NZiJ2BHef1I2smwNC+LYs9MAaA1NnOP/ESLbkY+q2eV7Pq83Vrpo
	ePXXzsSmJhNs/APPpvOV12TQ2T90l9MfCAAw6I/nViMz07RQFPKymnobtybsFSDSEAFjb5Ql2mT
	WBACvaflxR1AbOviHQpM0LSa64g/bj+jhRUJAMrRSLqF1kgibvzYjbQAKSoTEE2jSQgsF934xvI
	PY6iWTSD0AmXeej4Iot6gMFX38e5nwMqsbbOxCeJOBX84yubIiMK7ZW7IQoneS7kdjYqfftiTMP
	G5XfRo/wCHzn5YB61Qa6TSEPsm4tk1f3rBYouW6YakAfis3ln94wTXk8Q1rp4UmFHByhdUILYIx
	vMMPpv951gKPny1coMVzhyhwOCuoctYddRRAsA2HhHO8TWgEknydUAGfAHpNDm+I9wWt75qm/0h
	JP+rKnbqGbkc0Nam6BSaDEU+Udj09O//4P8+D2ltntU8MDd8Brc5uKfctwY4IMpQvoGwXECUiea
	K/uvc9naJZ0CWagzPdAwVM2Idd35E4NGy84TZM3H7SbFeQYeuIDy9WzN3cnj49AoSqnrOv22uzT
	VNTKsXZK+3CmUyK+Iind5JRRxRWuhLO+gg==
X-Received: by 2002:a17:902:cf0d:b0:2ed:3d88:4c24 with SMTP id d9443c01a7336-2f03f11da29mr128145425ad.27.1795503425640;
        Mon, 23 Nov 2026 22:57:05 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm64966685ad.51.2026.11.23.22.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:57:05 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Cc: mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 2/2] riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Tue, 24 Nov 2026 14:56:50 +0800
Message-Id: <20261124065650.1968930-3-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_225707_090497_50C4845B 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Like arm64, a compressed riscv boot image is decompressed by the
bootloader, not by the kernel itself.  The shared cmd_lz4 rule
passes -l, producing the legacy LZ4 format (magic 0x184C2102) that
only the kernel's own decompressor understands, so U-Boot's 'booti'
compressed-kernel path (boot/image.c image_decomp ->
lib/lz4_wrapper.c ulz4fn), which only accepts the standard LZ4 frame
(magic 0x184D2204), rejects the Image.lz4 built today.

This matters in particular when CONFIG_KERNEL_LZ4 selects Image.lz4
as the default boot image via boot-image-$(CONFIG_KERNEL_LZ4) in
arch/riscv/Makefile.

Emit the standard LZ4 frame through a local rule, leaving the shared
cmd_lz4 untouched for the in-kernel users (the lz4-compressed
initramfs and the self-extracting images of other architectures).

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 arch/riscv/boot/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index b80a077a8e8f..0e7607d7e39f 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -33,8 +33,15 @@ $(obj)/loader: $(obj)/loader.o $(obj)/Image $(obj)/loader.lds FORCE
 $(obj)/Image.bz2: $(obj)/Image FORCE
 	$(call if_changed,bzip2)
 
+# The shared cmd_lz4 passes -l, producing the legacy LZ4 format that
+# matches the kernel's own decompressor.  Image.lz4 is decompressed by
+# the bootloader though, and U-Boot only supports the standard LZ4 frame
+# format, so use a local rule that omits -l.
+quiet_cmd_lz4_std = LZ4     $@
+      cmd_lz4_std = cat $(real-prereqs) | $(LZ4) -9 - - > $@
+
 $(obj)/Image.lz4: $(obj)/Image FORCE
-	$(call if_changed,lz4)
+	$(call if_changed,lz4_std)
 
 $(obj)/Image.lzma: $(obj)/Image FORCE
 	$(call if_changed,lzma)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
