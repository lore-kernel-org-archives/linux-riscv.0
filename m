Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C682C6FA8E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 14:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMZuSDueS6vXWUu7rkxLl7c48J4dr6MpJy1vtFPDx+I=; b=mq901dmMcrCUSX
	bHS/BrzjArMBGGR6+C5xHDu2VTjvil3nXTC0m8A0ApEgpZLYmnonRG7UtPSxLlcEdGaJgc/VvpD1L
	ZYNA8/yODXZAcG3gOz4T2XxG6rdGazA+uQycouc5w4jb17vgGBJQzNo05sQ1/tvvnhkaWx938pTY1
	3uLv3SVODG/L41YvoySXbIm4HsntTva/tAPqCsVSQREYH6kVFg1pu9Tj74iiGfDRS3xl7IznmxTXG
	GRL0y1DGZAWBrgILJYFX5uOUC6oEX0vNSzmuphqlePD32UY//UOYWf4eIqLLShhocqrN8zzg1ofqV
	nWNSFKnRi1Cdm+dg6EeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeHN-004UsP-7i; Tue, 20 Sep 2022 14:31:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeHJ-004Uog-4z
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 14:31:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id c11so4550546wrp.11
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 07:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date;
        bh=frNCxAvs+AbkA0m7D6qJT0R/ozqkAo8hQHaaJj7U6MY=;
        b=SXOmnl1wyui1wsrZtd0PR56LQk5SMIhanpOx9ddLXz4JBTLk8hV5SMlyUu0E2ydb+H
         yX+Hwyqli2O1x1cgXIJ3UpvQAy1yU634l6Ufz1gfa1Phq0p9wCR6aMMk3m6AXwg95vCs
         DfqhTX1c6ZBxRdodHCJFu3FwAr+CWURL4iseMXiwiq+x4sSxY8Wo5LtDhy9z+q+HNCqR
         9Yvoy0jzL4MuVd4V2OyvzQmmJuTxRzXCmtvAKZUakZehNkpRuLMAUnYDinPcTNOgp1lW
         3DkSbXiIpy/sffAXFpk4ayfcGrV3oC1XNk/EY9p9e24GU707zTCGl94goD16APtSvHc8
         AfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=frNCxAvs+AbkA0m7D6qJT0R/ozqkAo8hQHaaJj7U6MY=;
        b=KqnALfZElNO4V1gxK4SfZItJAoYfDtVdNBsEQ6cXQYWEpIVui3KTIf5/piIezAVv8x
         66ZcuCGvh2m8EOJRQOchXSxRXk+RhDp5MP48nZ9mWE3WStmXkfQIXkw2pQMpjbxwbMfV
         DCJhTB564MAdLqiiwQUzoRhWSeLVDcj8k8kk9ji0p28ipQBKuZ1llILB37+tOuNemKKz
         zecQXO8XzBzW6QS5y4uClqS/RC4Cl1DLUwiiYWmEb3MJQHmiVHy7uOzkeVFJNrLxjWNT
         RpkMCnUwRF4yJo8LsPdL7N3j7fcH7p1sJXGL3VHCdq9aIK97T7awmmUfu8nTif2r+xhW
         IUTQ==
X-Gm-Message-State: ACrzQf3RK7LamrKLCvk1lg9kro2XJvj+8ONenBfwgAhtHD7+I/R6/so+
	OVzBx4e3byz6W2QCiRReqVeUhtw8/oVgP2pH4XE=
X-Google-Smtp-Source: AMsMyM7GssrfgCN0Z0KWhXm2s7sIoDO4CKIoCanWrJOpO9bFus8VgBteFGnMlSKTWgUE5/gBPmuFBg==
X-Received: by 2002:a05:6000:1883:b0:228:5fa8:202e with SMTP id a3-20020a056000188300b002285fa8202emr14701114wri.519.1663684270760;
        Tue, 20 Sep 2022 07:31:10 -0700 (PDT)
Received: from localhost (p57a238e9.dip0.t-ipconnect.de. [87.162.56.233])
        by smtp.gmail.com with ESMTPSA id v17-20020adff691000000b0022b1d74dc56sm122821wrp.79.2022.09.20.07.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 07:31:09 -0700 (PDT)
Subject: [PATCH 2/3] Documentation: RISC-V: Allow patches for non-standard behavior
Date: Tue, 20 Sep 2022 07:01:39 -0700
Message-Id: <20220920140138.27210-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920140138.27210-1-palmer@rivosinc.com>
References: <20220920140138.27210-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_073113_296011_8B649820 
X-CRM114-Status: GOOD (  17.55  )
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

The patch acceptance policy forbids accepting support for non-standard
behavior.  This policy was written in order to both steer implementors
towards the standards and to avoid

So let's just start taking code for vendor-defined extensions.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
This was discussed at Plumbers, but as with any policy change it's
important to make sure everyone has time to chime in.  I intend on
letting this sit on the lists for a bit to make sure everyone has a
chance to comment, but in practice we're already regularly violating
these policies so I'm going to just keep going with the status-quo in
the meantime.

I'm also still not quite sure how to write down the hardware
requirement: the intent is to make this more or less in line with other
kernel policies, with the added wrinkle that RISC-V is a bit more
distributed than other systems and thus has more core functionality that
is vendor-defined.  Hence the need to allow some code to go in earlier
than a requirement for publicly-available hardware would allow.
---
 Documentation/riscv/patch-acceptance.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index 5da6f9b273d6..8087718556da 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -30,6 +30,10 @@ to go through any review or ratification process by the RISC-V
 Foundation.  To avoid the maintenance complexity and potential
 performance impact of adding kernel code for implementor-specific
 RISC-V extensions, we'll only accept patches for extensions that
-have been officially frozen or ratified by the RISC-V Foundation.
-(Implementors, may, of course, maintain their own Linux kernel trees
-containing code for any custom extensions that they wish.)
+have been officially frozen or ratified by the RISC-V Foundation, or
+for extensions that have been implemented in hardware that is either
+widely available or for which a timeline for availability has been
+made public.  Hardware that does not meet its published timelines may
+have support removed.  (Implementors, may, of course, maintain their
+own Linux kernel trees containing code for any custom extensions that
+they wish.)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
