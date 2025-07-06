Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C49C83F05
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jul 2025 17:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WzxAOZ3gQ+cy1FWTM5Y5Bi+1eij4+mCQ+Fh17C+wzdE=; b=uX9oSlCQ7ObwxA
	0DdxhEDpgHVrPu78ko7I8RYT8fr7GzE6GsXIK8zfp2wVw78C53BW9Axg1K1QYbXDZeBKC6EvHzM8z
	90OkNv6+cvQkBpkXMd9+f/i3KpzMaa6PJCwXKsGms5k/vjRVxPNUVRP9aWSxtmNHcIXSElKp7XKWD
	Zb/KyCck7d84RZkaDhdOSpfdG+NthEHjzTUk9MiBm+8MvSdlzyyzfQC7sP5LPkKFNa/a0wfVW3AA/
	h05Yd4ESfVRpBFMEY6ocwXfurCTDv+LaigCt3XjRgxymftPdwybcPYsgf9SJ5ho8LtdSlvVZ35MbI
	I1T7YP1cUN47KNYkBLiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYSjW-00000000XfU-2cY4;
	Sun, 06 Jul 2025 17:00:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYSjT-00000000Xf7-3gQ0
	for linux-riscv@lists.infradead.org;
	Sun, 06 Jul 2025 17:00:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so2148019f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 06 Jul 2025 10:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751821250; x=1752426050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqPmHRXTvUmmlCHl2ubMMo6baAfA2qIsMqJbDb231OA=;
        b=gxRCNso0yNZZPzslbqak7VlTF3BHqwhYvKYpS3JFU0SmNGXsZwE6+lmUlUDaCziO/D
         HqhVRJkraD4VQcljlSld+p+AvdxTvgAeg1j7F4Tp2FeltVCXK5+rESRJKMSUYcUFW63Q
         HuSbw617jmyLpO7mRsPIFKXPhYadFiqbhDsWa1ytiFQwb7B22EnXX7Y4cgyT4DtgjVTB
         XwbkCZ9yyNcUyUxNMZ6g0KHa1tvOXiUapD8GI0x8wVDvd6JoaSkztuVRWdd6fqGbkjOW
         E6lOfVv6JaEFjuUO62KJVSy8+a7bqu6irk+i47JHBXCXp2BX4BptcFKjykvlEx1P5tHb
         xRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751821250; x=1752426050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqPmHRXTvUmmlCHl2ubMMo6baAfA2qIsMqJbDb231OA=;
        b=HHTHlW/opnr5k04mhnGoGQahlEd5K+TqsbbzEQC7Y2dTpBw6mEwN7zvt1CKwhMD/nS
         B9n3H8sky9PBxhcnu6aoZNB/v3Nh/RTKv0OA9rwL9m6T+mZZg9LM8eA1i3ykjUhhSGIU
         OOdTCgpr/CIQBg95k16V8EVcLVkFWvM7ot3/QVcryw494io0cYBdWWK6l/QmtM7Z1Jmw
         CtgI6XfNz1szFtZzGeq0iMRHKL6Vw2n+XD9RR/se3SD7BVHSxO3SrzM6IQQjUWD6nvje
         2T6pQ7igAPRZ0dtn4k43p6I6vbmnZrewXzS99phRia5GFhnjertQrY40hsHbnAcLIWiB
         uCaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQtrrdXGh7LQuolkRtRjgrOHQmd+N4xwWeB5ZB8azJUFbbjCkC8TkEDJaQpRQ6zbdKml1EbqofMUd7xA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAofIAKyu1Pra0ZzB77dpcu3bcRN1woARCEhwj3tX5p51QIg83
	ipsJqRq4C3kcvgAdgstKnIcm4TkC4MVrsVjOuqid67EADjrydlfWlLsB
X-Gm-Gg: ASbGncvVMtjWmJ3j5MTayw0kas0a5dRRf4BlkPUpzc6UXmnwKlu0hdTASIcXInBrbEX
	fVtImhdYugp8WxkHptL/Vv2CQk1m7h/wY2fH/LPmn6jae/Azu9TH1RAFfrRJUV3T0jd40D5Q2Xl
	1dHIwf8nUNLHLtvrAW3VRSmvb2L7V5RomW5h1mjuyt63nVnlC/MxrtuvpeI/GM7q2SXKOmRKjx6
	JweQhJFW7tXOOSGvU/oy1po0MS2fsbRXjMZtY6bSWmcLZdX+4aHqT/vcE8TOeI9Eh2yUe57rzEx
	hmdizZQylxVgoWgt785DcupfsO88TQjqkRp2QAsoJ8pyHnTb7MFEoTOfPmmQsCrdlaXJmzxn5MZ
	5
X-Google-Smtp-Source: AGHT+IFYnNXzW8pZtpPwme80Li3YAU/twWpziA5QZ1BVLVPRP1HBYFVFDGHr7cRBiYWFM1wUal6TnA==
X-Received: by 2002:a05:6000:2502:b0:3a4:f744:e00e with SMTP id ffacd0b85a97d-3b4964f4e0dmr6671679f8f.4.1751821249997;
        Sun, 06 Jul 2025 10:00:49 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225a720sm7958695f8f.77.2025.07.06.10.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 10:00:49 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: ardb@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	jonathan@marek.ca,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	viro@zeniv.linux.org.uk,
	gourry@gourry.net,
	ilias.apalodimas@linaro.org,
	lukas@wunner.de,
	gargaditya08@live.com,
	kees@kernel.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH v3 1/2] efi/libstub: Print error message if efi_allocate_bootparams() fails
Date: Sun,  6 Jul 2025 16:58:28 +0000
Message-ID: <20250706165850.1090-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_100051_923622_22DC62A8 
X-CRM114-Status: GOOD (  10.34  )
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
general error message in fail label to get printed.

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
