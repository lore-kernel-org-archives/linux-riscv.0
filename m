Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D589DECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxZ62Qw2AR8ENPtnL2Kzp/0dPvNhL0lndsZkvgyMCFE=; b=uMrkJx7M2FhaWn
	juD0Bt80PO1beQJWOAF5ZrVqkOTxIRZtoivAP5UeHg5m1V8qkY2kT417bEzk1fzTHBVhjfQykc3n5
	B7IxYwFxx4KqeQS75AyjOeOIXFS/gmtQ/O23bTGekUTa11TqzhuNQyKttxyUScO38gUyoCcDjooFp
	f/V2g3EklQPNT2NU1F5VozDeW1rvaNxZ+bMCUKhFK2dJ1t4eiZLX41bE0HHCwCsJjmyzOi+vbtyPA
	0lBXc4uIrxm9lrw5LUBCMTNUn1/FMniJChOOnJg3vU5sST3RA7uXg5hZVBJvpmL3H5H+1cI70O4Bm
	bbCy5CRrwiRKORlBdzjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeHP-004Uta-OH; Tue, 20 Sep 2022 14:31:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaeHL-004UqC-Cq
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 14:31:16 +0000
Received: by mail-wr1-x429.google.com with SMTP id b5so4612698wrr.5
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 07:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date;
        bh=faWpDpOOacfF16swLlrumbVqmNSSXoww8DJTwPdODDA=;
        b=Mu0ng8OwsthD5wJgVrC5rMw5M0oJo1wL7h1c4pAQiYTrGJo2yT/fkSdsgbwYxWA1cb
         pKtpr/TP9Bkt2InMdwz3uxTmUpxwwikGAKBjjPkajM+MeFIPowKFaF8D7OOxnkW55Faj
         eBg3isx8os+0AvCHk6Gubvtk3W4unC1J8fbq00Sd9lmDMZOiA2Xv95676Vkd0WDgDLE7
         deKIs0RoGSnGDZ9rNlNfaeMy/p74BRdwqyj+FIoPD19H+euoy+NtNClgZrCZBR8iqke6
         l4fKdQfF+kdWNRBAtfehQjewGFNopeYSJRgM+x4dLsJFqG0ODER5MPSbL9M6AwnwQsGS
         SBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=faWpDpOOacfF16swLlrumbVqmNSSXoww8DJTwPdODDA=;
        b=qs/jMoZodaxvflyxaB0Qs1FgYD0Rh1/DxDhv9ENahxBOQYJhzi/R3NOlcqghZO6wPf
         Wdg7Ffb5EVJiFreOfE0JrrDu9hlaT0Ya7kkOoxqky0W1ZCiLFgI6NUoyxvkrqpT6Sdr8
         W/sOFGjZilK2LPKPtFvMNU8RZbNYUJhJAPCSx5AHt3opcojhR5SUVup1EjvSa4KZgStw
         0HVKv+Od8HSRbnY5XBGI7TUFXXIY2bLCcYM7+HkCMCO0Sxq0+GHhM9q9ZvuMW6UAw3aU
         W1gO9SxNKwk2pvrKQZNANaYq9mAXUD6jKihgUD3+2RGbFbuHgQnELWpaZcD1OLtQ6/D+
         i5zg==
X-Gm-Message-State: ACrzQf034XPysnfWhfsGUk2/I5/i8oRBTKwaC5fbgEO2hAGecHvZZyiQ
	QILtET8jk7Sd9s0rATRJfKy5NmEW3MJDJeG5ssU=
X-Google-Smtp-Source: AMsMyM7pq5Eklz5W1NRLqRNucjZmgo0o2EZi+79Qc+/yTelNvSWjnOLBseSP+W3C3sOJv75eO00ZTA==
X-Received: by 2002:adf:a50e:0:b0:22a:ede1:57e with SMTP id i14-20020adfa50e000000b0022aede1057emr10156972wrb.63.1663684272990;
        Tue, 20 Sep 2022 07:31:12 -0700 (PDT)
Received: from localhost (p57a238e9.dip0.t-ipconnect.de. [87.162.56.233])
        by smtp.gmail.com with ESMTPSA id f9-20020a1c6a09000000b003b3401f1e24sm177282wmc.28.2022.09.20.07.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 07:31:11 -0700 (PDT)
Subject: [PATCH 3/3] Documentation: RISC-V: Mention the UEFI Standards
Date: Tue, 20 Sep 2022 07:01:41 -0700
Message-Id: <20220920140138.27210-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920140138.27210-1-palmer@rivosinc.com>
References: <20220920140138.27210-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_073115_535867_93F85A21 
X-CRM114-Status: GOOD (  14.55  )
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

The current patch acceptance policy requires that specifications are
approved by the RISC-V foundation, but we rely on external
specifications as well.  This explicitly calls out the UEFI
specifications that we're starting to depend on.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
This also came up during the Plumbers BoF.  The other discussed options
were to wait for an ACPI/UEFI specification to be published or to just
not wait at all, but this middle ground matches how we handle the RISC-V
specifications and it seems like there was broad agreement on it.

As usual with policy stuff I'll wait a bit for others to have a chance
to chime in, but I think the wording on this one is at least easier to
reason about than some of the others.
---
 Documentation/riscv/patch-acceptance.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index 8087718556da..08cb92324eaf 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -20,9 +20,11 @@ Submit Checklist Addendum
 -------------------------
 We'll only accept patches for new modules or extensions if the
 specifications for those modules or extensions are listed as being
-"Frozen" or "Ratified" by the RISC-V Foundation.  (Developers may, of
-course, maintain their own Linux kernel trees that contain code for
-any draft extensions that they wish.)
+unlikely to make incompatible changes in the future.  For
+specifications from the RISC-V foundation this means "Frozen" or
+"Ratified", for the UEFI specifications this means a published ECR.
+(Developers may, of course, maintain their own Linux kernel trees that
+contain code for any draft extensions that they wish.)
 
 Additionally, the RISC-V specification allows implementors to create
 their own custom extensions.  These custom extensions aren't required
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
