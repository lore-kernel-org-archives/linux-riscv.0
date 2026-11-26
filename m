Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C8E606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 03:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NVY5kIve;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZjEe+gS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YL2i9iQtDJ0XqmYDhEYpofqG68Z/KnIpJr1mAjUrh94=; b=NVY5kIvei2Gp6wzsoCYIsD5Cp3
	3U9ZhP4+rwO5B5Zj7ac4aQ4dGxYYwpD2qDsodvGVKDAmw1XOPZ8t/msF5EC2l1A0jP/c/kH5EAqXI
	EvQ292Hu4/8kuh+GnJATdNXdY3LKvBnzTSW7mloIporiPq38WQLidwpX/hJgp8xojVyDTqbZmss5h
	6nWfk38Rrgnosz1IK5ZNtpd/579aYw9K8CBhEkOXpxLkhqXPqjsgA2qyR8XgXCfxwA5qBBwjbhfGx
	0ePok7sjFNyDMZRkdFAUsGgiCn9KjWtFOZYWQBEFfsT1FbPOTghsBUl+IWHfI6AGJIi1YystG9cTw
	nZ5ifegw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPlK-0000000Bx9A-1HXR;
	Thu, 26 Nov 2026 03:03:06 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPlH-0000000Bx6u-2pNj
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 03:03:04 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so3008503b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 19:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662183; x=1796266983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gg7ZA0AgmY4MI2TnL0if+FhDda8V2LVarU+EtpFSpPQ=;
        b=aZjEe+gSM28016aLYflAlQRCTuIOHjJfnRDhSTqqjKIjfmZxv4ytnsuS4o2vmFS8OL
         fMdh2u1Srp2nOHJhFo+eIsFMAx2dbsw5734K81183MR3Uciy67Xh5LGTfdAn6xgBQAbg
         xInuGp3aB9cxlQy4lVohlrIcK4T/WhvyoNUi4P5XlH0i9vNVOLXnGoDu3MgyATgU04fD
         yaYFIg6qa0D2vNBU7sO5U9Wlc9k/HbZ8t1OC241jH3tjwaDtVC+v3bPENHz8QrJAByVa
         HEcuF6ow+7ra1GeNbPsV8VDIgrkudnBcXNMWJ9Xm+/jIycG8KBdFRi7jpfUJAIQIo4Rw
         lCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662183; x=1796266983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gg7ZA0AgmY4MI2TnL0if+FhDda8V2LVarU+EtpFSpPQ=;
        b=zS6I5JdFze8tdAUsaRWfPIhQo3FMXpGihekjziEVY9+pERkwruA1POC6BMlbSmqSt4
         ZQsN7qCwKW8iniT8kMry2UxiWOuI61X1BsBkLndvkvr9IvZ/E0/izm77KZtiwFBO9cGf
         soH9mUjGbZrnWI74SpSXXdz7LdMOzgu451mFMOBEBKsWjr7aB8jsEfdQz9RfQwGQVN6L
         sZveVpwjCEJ1IgdvQkEcuz/iXzPH6r9acViTy04tffULH4oIMUTdUKJXtlRLOzPVC8mF
         q+U/PJw1akLPmfFMxr/WzI0d+IV8ctyH3jOorwJlPmTm3987YZEdSM5PtU7wp+ksjH6j
         FsRg==
X-Forwarded-Encrypted: i=1; AL+hErFi8dwKuoFty8OpxMeF0Cy8Hv840luDWvvtMrhozU45HQl6hzWJskooeNwtgblDwWqra9l28wCps/qOBg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/nJVQhqy65ybNLaHLkc1IllvWHBb+Zb8zAQC+mS98lXuW1idAO
	F9ZbH1VetAr/L1oe98e4Wi/vJs3mYr+YEbIuko6lrOZnbNoJRhf4G3PR
X-Gm-Gg: AZFdTZcRM3B1RUCAs0whw1FQbqNmo+AsPljdC/eGawGa04H4ulCdNeG4An8LXi+YrzE
	cZyyV8k+PUE2Xwq/7/FsEKkHzTMri2T3h3ctwUBn0Jyz3PG4LEWIqHuTcLIbWcCN3oMAoLmVxnw
	mkZsoixgkr+F5IpTpkVxANqLPVaG5ADakQTiaxcC0Y1xendD70A1JB8y9VkEjQKsZ+bSStU85q7
	5o9+7IypVm4aUywusfw0M9V39BKUUE5ih4IMLw+k2vnuvmq4SpQFDLig/UNBP5hx0jYugNa1I4a
	2JETPIA6AjBJYXK48ExdsTBbssUptf3aBiOY9cgN2mBSzoQ9EP/HiUR2+4yR4/5HQq/geCM/No2
	8vlN5BSuFEkdLgjy4Cn4vL04U3HVL2NPj8GizBe1Ue6e+uio8z5cTx4ozrIikMnqEQT2OBUb4FK
	3d/Y1XYOdB2jCuuruXQ5PwLtVvv9PJrCqzSCo9ietrfwy/0Um2RHcw23kuYrS+FLquExUZHwDlR
	GHZgiWDbERiRL1ySwVCEGlPNhrMxP6UcQhpKFXfjl8u88+i7JyEZn/ufP+PD/au4TQG9R+LDk61
	XCDbi9AfA/I6IrkZEb01A8tBfkiq07zAxaGqekOW8wTbcowv+U+FT2k=
X-Received: by 2002:a05:6a00:348f:b0:88d:3f61:20e9 with SMTP id d2e1a72fcca58-8c87d124ee2mr14999598b3a.48.1795662183040;
        Wed, 25 Nov 2026 19:03:03 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c908a56acfsm9231474b3a.23.2026.11.25.19.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:03:02 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Cc: cyan@meta.com,
	mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2 1/2] arm64: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 11:02:32 +0800
Message-Id: <20261126030233.2546274-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126030233.2546274-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
 <20261126030233.2546274-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_190303_847423_3DFEB149 
X-CRM114-Status: GOOD (  10.79  )
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
lz4-compressed initramfs.  An arm64 boot image is not consumed by
the kernel itself though: it is decompressed by the bootloader.

U-Boot, which supports booting compressed arm64 kernels with 'booti'
(boot/image.c image_decomp -> lib/lz4_wrapper.c ulz4fn), only accepts
the standard LZ4 frame (magic 0x184D2204) and returns
-EPROTONOSUPPORT for anything else.  Its host tooling (binman)
likewise emits standard frames.  As a result, an arm64 Image.lz4
built today cannot be decompressed by U-Boot at all.

Emit the standard frame through a local rule, leaving the shared
cmd_lz4 untouched for the in-kernel users.

Also pass -BI so the blocks stay independent regardless of what the
lz4 CLI defaults to in the future; deployed U-Boot decoders reject
linked blocks, and lz4 is considering linked blocks as a future
CLI default.  -BI was introduced in lz4 v1.9.0 - older lz4 versions
reject the flag but already default to independent blocks, so the
rule probes for -BI support first.  With current lz4 versions the
output is unchanged.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 arch/arm64/boot/Makefile | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index d42d07667822..eb28967469b4 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -28,8 +28,20 @@ $(obj)/Image.bz2: $(obj)/Image FORCE
 $(obj)/Image.gz: $(obj)/Image FORCE
 	+$(call if_changed,gzip)
 
+# U-Boot only accepts standard LZ4 frames with independent blocks;
+# probe -BI first because lz4 < 1.9.0 rejects the flag but already
+# defaults to independent blocks.
+ifeq ($(shell $(LZ4) -BI -V >/dev/null 2>&1 && echo y),y)
+  lz4-bi-flag := -BI
+else
+  lz4-bi-flag :=
+endif
+
+quiet_cmd_lz4_std = LZ4     $@
+      cmd_lz4_std = cat $(real-prereqs) | $(LZ4) $(lz4-bi-flag) -9 - - > $@
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
