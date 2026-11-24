Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669F9606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 06:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kjZi+Mnk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5h+CbQY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1m5Z+I+HQeDei72QF1A5rFAiLyYNAMJM6KAUvSJJUmo=; b=kjZi+Mnkrb7pUfh0kg7lRm1o7A
	tNcmOozIKyw0ISyQ6kgAjpIMRkvzi+I78vqc+53Amm/cRNBPaKDJThuU99R4ZhpRYcuon2iOAdhV9
	nI6I2E7vTcWcTaQzNIxvmDrUxmVFtrdoFwFRAL4s6NPK7BYkOfXGpxRAw4BoTjFIU47yoFZgBC5J8
	93CZ7BEZ9QrqvzE2Aw1W5pPcC40gTxQ7yI4GS/EZr0ki2HCDzhul1W6LaaRFfohT2Ziw+h0uvbv4X
	EVIjlvKBKh33wiuKjUMIwVOUPoOyTQ9Dj9JifzGpujmY5/OTk+Z6ZO5bcK+VjHLSh3L7t29XhLrL7
	l7Y+UsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkSl-00000005gYo-1XXR;
	Tue, 24 Nov 2026 06:57:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkSc-00000005gUP-1CGG
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 06:57:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2f04fab527eso30584205ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 22:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503422; x=1796108222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUgckmCiFEyGBP0TcCUPMUukDceeXTTvOHMOsE4uhQ4=;
        b=r5h+CbQY/Dhgh62FoNXzJSgIgHnXA6yEf9J6rybJgHP5tHtXAppbXmrdDNh6bcgD5d
         8gmL3hBHsWv+KISn+BMdMFMCHFxARCVUo1d93OTYfbTplLxIa1czCrQfyRHLfPZ7h4w8
         1Tel60cr2AHK/d/qtCjs5hC7ACSsrTxS57zoPpaD7ChlHVv1UwW43+MmYdoLmLcJhaX0
         icXPMCc2bImqbsVH4A/1D2MgTR2C4eeFJTXxeZ2SUfIrRgUWxBS0jvB2fsy9KSs4hb7y
         8fsGRiv5a0/HECt6K1jpxol1U8AJLRpODMTpB5wyeetjbTum5TvCCj5vBhIkeFveEdZZ
         Ybcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503422; x=1796108222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUgckmCiFEyGBP0TcCUPMUukDceeXTTvOHMOsE4uhQ4=;
        b=oni5aRWQzYxKLIbAVHhU+67LEp2jbvbaGVTwS170gt7SHVmKWPt/jcMwSTrpxApvlk
         0bbcBuMKgU/sTH0/jyq4l0/+C3prYEd/938HROUtJstuw9mQsi3EJ6GrW8mO0ZF6mjuv
         fXAEasaUjgHMvRHuiC1M2S/kYgK8u711NBNQiKYswXJILkG8pE2Kp0uNyKlglX2UagkI
         1mKVrKlq3kpnFHnIi4p9zA7qhQNJwG/UtybhvYTE95DP3sd901fv+5Mklou05jGSpzO+
         LENx+uagp6kH6NHf0rdEddJHustZ8deQibIN+23ckjUUTfyUuUN0zrDhZP3LBpdT4grj
         eDcg==
X-Forwarded-Encrypted: i=1; AL+hErFWnryoMXiDViyzwsiRcx9lSkpinTtGcbcfIwrNFu3HseTQ4+LZg3kc/Dp1fclPaez3OOMqsSQMxpEGnw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Xee9upToVC8n8O9SCp0WZq33h2wjEsQ/cYPgJ5/PBkh1nuwpU
	lCtxlkV3dEnML9vkQv75c7VopUm8bcFkf6asOPozBSvc4qBJNwQVVR46
X-Gm-Gg: AZFdTZfR3/xeOIqRGAOdfApLIxJY6SoDRO4tvxlKiIhTxUAnQoxG8H3zhqUJWoUij9t
	z/6wN8iCM6WMfwf+oNLJA/O6IMCnxbxeJmPoOqgBBrVmMfH+7PwxhvKuXzuogfXgwX3d3U826dH
	DENxVQ9qf+ve29mOe+ygq8IRdd+3al+S/47qHq86kXNYDIkwTf/B4cTMMyZ9JWwaXSiwPffxfOe
	A+LTsDOgFwuLFx+e79U701DJS7+6rU+DZe86mKYj4BzPXarxN2HTXCHGmT4lrxr1XLRoY/eTQqU
	BRPjFC8X6e5JmMqnxO+cUC18SRm2NNT9gRvgspupgupW12eHt7Bi3xmO5SgGQeQ6mwOUIEONswo
	RdpfIx8hkmE6tkwrOhmhg8zhQA/dbUXZ06dbXIfdWTwgLXjaC+FbpqIgFjYLI8wY+VQAF6be7rM
	sMtBKzNi8rHzHp5D67lUyxXEiTEJu+sHuhJc78ggTI+qN8lM6TuznN0axg1JsybqApEIroScBLd
	NVsqfU32r/g17Uv1cuUDbFJqDKns4wRLKIiRtk9uHcEQTHkpbMKSbzatlvCPOfedpj7jGaDG5j7
	ST2hvpGKvZw4JbhErx/eTmdSRQMS+HpaW3QSjUIXYR6RBVrtzZosmPw=
X-Received: by 2002:a17:903:41cd:b0:2ef:efae:e8e7 with SMTP id d9443c01a7336-2f03eded341mr142785705ad.0.1795503421589;
        Mon, 23 Nov 2026 22:57:01 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm64966685ad.51.2026.11.23.22.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:57:01 -0800 (PST)
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
Subject: [PATCH 1/2] arm64: boot: emit standard LZ4 frame for Image.lz4
Date: Tue, 24 Nov 2026 14:56:49 +0800
Message-Id: <20261124065650.1968930-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_225704_042507_E93769E9 
X-CRM114-Status: UNSURE (   9.52  )
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

The shared cmd_lz4 rule passes -l to the lz4 tool, producing the
legacy LZ4 format (magic 0x184C2102).  That is the format understood
by the kernel's own decompressor, lib/decompress_unlz4, whose users
are the self-extracting images of other architectures (all of which
compress their payloads with the *_with_size variants) and the
lz4-compressed initramfs.  An arm64 boot image is not consumed by the
kernel itself though: it is decompressed by the bootloader.

U-Boot, which supports booting compressed arm64 kernels with 'booti'
(boot/image.c image_decomp -> lib/lz4_wrapper.c ulz4fn), only accepts
the standard LZ4 frame (magic 0x184D2204) and returns
-EPROTONOSUPPORT for anything else.  Its host tooling (binman)
likewise emits standard frames.  As a result, an arm64 Image.lz4
built today cannot be decompressed by U-Boot at all.

Emit the standard LZ4 frame through a local rule, leaving the shared
cmd_lz4 untouched for the in-kernel users.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 arch/arm64/boot/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index d42d07667822..19b26aa83203 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -28,8 +28,15 @@ $(obj)/Image.bz2: $(obj)/Image FORCE
 $(obj)/Image.gz: $(obj)/Image FORCE
 	+$(call if_changed,gzip)
 
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
