Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4AAC83F03
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 09:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N+3g8qGThEf2Lx9nWny44A6EGJowPIgDF+HSHVTkoCc=; b=k6o9UlIQ8X+WDk
	IxNVS9ijxcsDKOqEZJJAAr7nDjkWE6qJjl8txjOrfDjvhNKA1KYJ2WF7689NkrFtgKyVNVy4f85/g
	VQw/wT/OAzEHt+rWl0pyuTcjw05sgGhBC8mrZ6gttVzCOxMGja/2hBdpVA8HiGrIqBBy+/EzYjwlC
	vUy8lywSvALUW4Q8MpUxwVw2NdZ1Vrf86NkZq6/wIH/WwSyTLAUUM7dB0n2aks9gJH9/HoUIagmSK
	lp2LlyLMJ5o6zPW2QAD4Al+Y0Tey/VC7hq47BKdY4O0R/mSYWw832BCdCBPGKE11cZw0gjacGRCB1
	rNyBv81/Lanimrq4OXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYM2w-0000000051U-3edN;
	Sun, 06 Jul 2025 09:52:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYLxj-000000004dh-3ecM
	for linux-riscv@bombadil.infradead.org;
	Sun, 06 Jul 2025 09:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=i6xlWZG3q339ZhjZezaZxN0+SbBnE2IfVSlIzuvRhdw=; b=lxWWqLWk6mQLvxBh1twmClHAOt
	4skacI0qz5rwShenHkFJRgNzZE4xWi48w1fHKr7S8IGGlw1yW6RK3MQhXwXlnK5yevtDs9DvtTW4g
	cmVUuQLTdKEh8ena2Lesk93kUA9lLw5f62BOJXlaiN9rE4q9Iyqas1WhYiPA2+6krtgslkwHwwZ1u
	slrjdh+8A1o6zY6P2VlDMHUEemWyli4/8zAnxkkXvbCJTBkLlzBTgNDQvnw05vx1kBWDtD8ap0fOC
	C04F3HwBEL3XqcEBnDO4UuWIdUFcr8WS6MKYfwTA4ltKHeEU5ikE0jmoTiUQS+0hG/Qb+PFQAYAa0
	pzABNZLw==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYLxg-00000008ISR-13r2
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 09:47:06 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ae0ccfd5ca5so334867166b.3
        for <linux-riscv@lists.infradead.org>; Sun, 06 Jul 2025 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751795222; x=1752400022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i6xlWZG3q339ZhjZezaZxN0+SbBnE2IfVSlIzuvRhdw=;
        b=dnwynK+XkyDWZyegzGrX7Keu9PQ0bEediwUSlUNL/vFTI7QqZeOC6+7sfj6MILiEJ2
         GBCFSTd7k4VCJjNv3EOBT0zz7iYqOUge1XXUkdqmxeYjbFfJO2J6SN1r+CD0aYu/ZUO5
         oTqeOYpbr8CMFi8s0zH/uHGAErXPk2PYFvBCCPluC9qJJXFSdF4CiYrbIjY5VbQT3oo5
         XKP91YhVWMnnGoGfathapFtn/7FXkGaETA3RuLgxkmiDIVl3Z4kfJZjc0eJOdZlrLFxP
         QXlM4OnFK5bT5BYI6hV6MgZDHqKpwF9dk+N2NJpz9d55Or70zP++I5O1u6F7W4C8kdwS
         i8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751795222; x=1752400022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6xlWZG3q339ZhjZezaZxN0+SbBnE2IfVSlIzuvRhdw=;
        b=L59UmP0qsi9SuOdJFr0VEoS6wrOjf8RWWBgGzc9+fpzGVKUtPyRrzCa5DtuvDh7/SQ
         yxtZvDiJe7hMCx0/lfQijO2cpNbiA+sZCK5nLgftYZOltpnYXOO/jD3DZKqs8fwiwmxD
         mefB794KrdVbKdcZWuhjwTybYpIlUjn46CELSHPnn1yB2sc3Rboav+U8JULQljNO4Mym
         JUg0oS7JSzZ1ayI3ItmkUU54QfGTGMLPDoX+T2w/ivglAZYfNtDjN5vT3cHf1dkNIKKJ
         x/O4MVrz+qZ+EoE42NKchurEQmOP++lDEpMDheloAlVaMxEW4TaVmZOuodP1prKUyMrI
         i8Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWCMeEyUkfyCmLNyv6b6ZpVxwAa90p4timx1Q63Uq1AB/7AHJojQtZ5ff88hz7LV0prE7nPWS7Mpprkxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVCLjthE21TCqdaU8euDaJa6Ls7ZW1y/quPy8+Vci5gPDnHfJf
	48jsp0AqqVLDTgzM0cGsnXuN0RGYosfPfvxWKx6+6zeGIjxdfUcgvTN0
X-Gm-Gg: ASbGnctVFwjQaD715XL9N5KHGWnIezY8FqE2RKccjofN0L/JApu2bqJT1yOmLjCmAPe
	qsKmSfbHxQCN5KLOy4EjI6X8GFTQfAp74lxgLuP/CgA/mv84tC49jLPUG+cD67vj/TclUbFNtq/
	8ZEdjcgOLKOVdxoQYA71mK1NC7bG4FNd9vCwcQyArpg/TEf0kQt6QwwnJB1mAhswC35dKDsZciU
	rJrMAZ4biGoKBfDpSOu/U48lIEU4nyk5KgNqSi9thL0GC5qMGCWMVfG3PSVqaHJ0xsh5rvGYxBu
	SW39ykLgkydAS4nivdaBg66EOt1nWiP4Qry68PQydQWwPmZ8zkVRtmSvc51mjM5YkJbRpXZPGYF
	zFjZM19EKVnBx
X-Google-Smtp-Source: AGHT+IEvE1J9cQQ+cEbLxXizIVcQ6mFRHumnPBTHnVWDedGZts/dbXT5y6E9R2SxjHwF6zkaCj97mg==
X-Received: by 2002:a17:907:7248:b0:ad8:a935:b8e8 with SMTP id a640c23a62f3a-ae3fe64e643mr760258866b.5.1751795221340;
        Sun, 06 Jul 2025 02:47:01 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e6f51sm482893266b.8.2025.07.06.02.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 02:47:01 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: ardb@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: gargaditya08@live.com,
	jonathan@marek.ca,
	kees@kernel.org,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lukas@wunner.de,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH 1/2] efi/libstub: Print error message if efi_allocate_bootparams() fails
Date: Sun,  6 Jul 2025 09:43:51 +0000
Message-ID: <20250706094354.1282-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_104704_566037_D5F91113 
X-CRM114-Status: GOOD (  10.17  )
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

From: Khalid Ali <khaliidcaliy@gmail.com>

Print error message in case efi_allocate_bootparams() fails before exit.

Change the direct call of efi_exit() to "goto fail". This allows the
general error message in "fail" label to get printed.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 drivers/firmware/efi/libstub/x86-stub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
index cafc90d4caaf..13d8eba06e4b 100644
--- a/drivers/firmware/efi/libstub/x86-stub.c
+++ b/drivers/firmware/efi/libstub/x86-stub.c
@@ -824,7 +824,7 @@ void __noreturn efi_stub_entry(efi_handle_t handle,
 	if (!IS_ENABLED(CONFIG_EFI_HANDOVER_PROTOCOL) || !boot_params) {
 		status = efi_allocate_bootparams(handle, &boot_params);
 		if (status != EFI_SUCCESS)
-			efi_exit(handle, status);
+			goto fail;
 	}
 
 	hdr = &boot_params->hdr;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
