Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8577EC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axHlVHy1hC7rR7HDTsIHJq91yxvT90cqE+FmFEE3JFA=; b=v0ynRi69B6azqF
	k1/jj4jBdmgwXVCGZoWd353/MKiL/8wWy5EOrh9Yf+o9ziRDhWkeCL3IGBNvbT1JMyOt19ecvONH4
	Dz2AjUR2IYMzuUmSo0coG/RE5dnEKmEyyx9RsM699UNNvTCNb3hSNGTr8P0Nja4CFMYu5Hg5qGCtY
	uKkVqcknJtmXlpkbsWhLzF7SR8YuBz01X2P4ur3V+HG89HnK/zzOwr4EwGMZOzTeD7mrxz7vz7Abm
	XH4V5ZHnWUQgvYfTBFtZff6Tuz/3yj3TpvyNQ+cJUiv1oLB/WdWuVn4rcRrXP4Q6gyjTdZOhwYnxo
	2PqPE7zk2m82iuWcbWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2UQM-0000000CUGH-1Oly;
	Thu, 02 May 2024 11:16:26 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2UQH-0000000CUEH-3E1K
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 11:16:24 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6A512424AF
	for <linux-riscv@lists.infradead.org>; Thu,  2 May 2024 11:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714648579;
	bh=alIA34WXYkmJHYDf9JzzyaPI80jtTP1Uaq24imH+xTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=EbkryWGjBufFljA3LowZmN/p8YvK6PAMA9ekXXYKFp/CkTBx+n+RgyUunpNmVNqTh
	 NcK7soAD5vI4aYuStm+A96wCIzl6DJueFD8/uJebyKpGjtOyI5TAc8vRceTyiftwTG
	 C4CUSP9TcqBrM3uMzdzBrMU6Z0PG+uEjCaCmb3Vb9X2jl1ulzDEutqkJ3TWlyyO4sl
	 xCOLlpr17rWhn3IpfUdRLtbctYWhWdaqtPKlvIrOffqU9791XpG19Xolh5r12pv/Zi
	 7Xc6yGKPMIvmqb9BbuFa2Sb+QJ1ncYixy2Wz5Q3e17NYVJoqq/J1XSKO2opHm0cs6g
	 8cpQVIHWH0jgA==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a558739aaf4so467132066b.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 04:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714648579; x=1715253379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alIA34WXYkmJHYDf9JzzyaPI80jtTP1Uaq24imH+xTg=;
        b=dxhaMnndDI6wyIoWCAeHZP7AaNkaDuH92rcqSrfWSybhORMX+EmBalSCYatuFBS4R+
         p8m/1m0c20PK/IUh9lUvsXfOGX9WQ6mZ6rPFOk3/iEM+YBEwiwgbjz3kOzkFYoHNtqOM
         9tV42cQrmD1Zp60Em1pJvDHw4SNzUkBWy5L+ONZ2gIu1vCDtD1u2MvfVeI0vv5YMnau3
         W1Ike8/99Nl9u86Z5G1CL3JTF1WkjAmtAQLbrXWyn3qMjlWpD0dc0jyy0l4Rdgjws4bN
         /0ENb3gOlUQklZw5bK7f1NshtEei6awUu0b4G3ZC9j2SyW0s1tw8fBrTVMHCtgXnQcD5
         sfug==
X-Gm-Message-State: AOJu0YxKMtEtvwSuvI2LOqmtLXAVcPJEJ6UBu39YIe96ADRH+hbGcREJ
	TW/FKO6JDz0IRUFRF2Ojt92/KdcaVvbYNxieBrXE41Yfp9Lw711ixLFFJ2anXBIswRprJCY8PNx
	moWuuzb53lblD+rzyokPQZh9kXxTI4tMb4+JJf9tBsd+EQhDEyYPr+ebWwDiNdU/9IhFYknQjSq
	ZL0V4MT6RoBSPTSw==
X-Received: by 2002:a17:906:11db:b0:a52:351f:5694 with SMTP id o27-20020a17090611db00b00a52351f5694mr1517613eja.14.1714648578847;
        Thu, 02 May 2024 04:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG86D9hK+ydkPVXUK/QjxllUq0XEakTYgairpW0wG9EVGdit8WtuOux1Y7bI6aIK7GFaVI/kg==
X-Received: by 2002:a17:906:11db:b0:a52:351f:5694 with SMTP id o27-20020a17090611db00b00a52351f5694mr1517596eja.14.1714648578551;
        Thu, 02 May 2024 04:16:18 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id gs23-20020a170906f19700b00a4739efd7cesm437278ejb.60.2024.05.02.04.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:16:18 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Terrell <terrelln@fb.com>
Subject: [PATCH v1 3/3] kbuild: buildtar: install riscv compressed images as vmlinuz
Date: Thu,  2 May 2024 13:16:08 +0200
Message-ID: <20240502111613.1380453-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_041622_055247_BEB8BE7D 
X-CRM114-Status: GOOD (  14.31  )
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

Use the KBUILD_IMAGE variable to determine the right kernel image to
install and install compressed images to /boot/vmlinuz-$version like the
'make install' target already does.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
This patch depends on Masahiro's patch at
https://lore.kernel.org/r/20240414174139.3001175-1-masahiroy@kernel.org
---
 scripts/package/buildtar | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index ed8d9b496305..fa9bd0795d22 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -54,9 +54,8 @@ cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 # Install arch-specific kernel image(s)
 #
 # Note:
-#   mips, arm64, and riscv copy the first image found. This may not produce
-#   the desired outcome because it may pick up a stale file remaining in the
-#   build tree.
+#   mips and arm64 copy the first image found. This may not produce the desired
+#   outcome because it may pick up a stale file remaining in the build tree.
 #
 case "${ARCH}" in
 	x86|i386|x86_64)
@@ -101,13 +100,12 @@ case "${ARCH}" in
 		done
 		;;
 	riscv)
-		# Please note the following code may copy a stale file.
-		for i in Image.bz2 Image.gz Image; do
-			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
-				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
-				break
-			fi
-		done
+		case "${KBUILD_IMAGE##*/}" in
+			Image.*|vmlinuz.efi)
+				cp -v -- "$KBUILD_IMAGE" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}";;
+			*)
+				cp -v -- "$KBUILD_IMAGE" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}";;
+		esac
 		;;
 	*)
 		cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
