Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 474DDC02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NrC5cmgdjoPEQKWZ7HNNTswVgsNBLevnb2h8DIpQWEs=; b=IOhVL7evQr9vJ0
	HMyuuFWiseu7bjyVBwPpMDR56PMjpBJ+8P4P2o9ZVJbK9fMH5w+xjndzW20VVdQnmkoI2BX9KsO7N
	v+uCuMHLsSUCMfFcVMMsMYIvLA3X66SXmiAob7L4D3WlmnuLOJ7xtjCOu1aeWFw3B/3PrTExC06ZT
	Od+P91vx2jB69I1RwltlrUSuFxwxGGeLk3vifs3TospYKEtAYo4HAWQMommBobRziiAUm6XtgVV0N
	97Aa8zdLuCx2mlKjRXm1lPk3934ZuS/jwC6/AUUegfj09mR3yaKTnAXP2FlHsrp1XMhrIh5RFa0Vz
	htUjlVLbhVm3a+IdZBZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR58-0000000AFDZ-0KO3;
	Fri, 07 Feb 2025 16:19:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR55-0000000AFBi-1WYb
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:19:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43621d27adeso15717945e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945190; x=1739549990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voJ+wA65lTYRPtl00Mu/vMvJWZVBpxfrm7iohsFL00w=;
        b=UXyFe020E6Lvnrvvn+JU2DNJSSA5m9b8VpdfAcbC8p0PFaXmGfzuVhXmCuZUjDJmnE
         0LJDePnH4PuZNmPxdWll7823O/0bSCw2R40wPQp1M4AYO7fpTI0euvc/KZ39K6kiydvq
         S4NCDTYmdC1hbXEgPk1X9igwz7eykk2XBHaJArSk3nc7G/3Ulrr1Qvd/JwvcD6wkuI81
         wrbdInczTQ5I3t2CnqFk0GbJNRmefOHdu/yOGmghh0/Cu+IRTLlqfVA59YehBOqT5VFr
         tIbKfdTPQ0kpA/i2r2wtX3PAfMPJIW47+kep0Bwj/FSSExICjkr7vTzRSvPJxiV3yPBi
         3r9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945190; x=1739549990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voJ+wA65lTYRPtl00Mu/vMvJWZVBpxfrm7iohsFL00w=;
        b=Tg5SBrnfdkuc9BNpex5Jpwuq8iDWBgqB8t4ED0fFYLz48e96TX8/wvUOYsAQl4aC4n
         weq0GuM8g806UoNijhntgaLdqoYaiGedMhZx2NPMzhmx+6th3eOdK8CeWM88HDNR7JAF
         DzxNNUL7MyCGAIccv0fh4RDOAMsGNu3ImuLhswoBhu/hzjEJjesgwv83rJgldPjt4PAV
         TIBnzrqI87ddaWlcgYnVbzehaaDPfsoGneVkKa7YHUa1LeDs31ePHu4N+PdBiXuqEz8t
         uSBMkSseKavrihcptZQ5z1NjhP/ifhaOrlgnMtyirB4xCLPXE87NtHS37tgrhUeThlYL
         RQSQ==
X-Gm-Message-State: AOJu0YyhrZLT7O4kENxt99D89SseuHQD5KQvk1AhgmDMbEpEqjSbxtLl
	lJQqIdAA/4KUVczHwnZRgtoyjkvxJcBryxtUlYNeKTplrAH6XBAqPC3TnIJzQGF2e+YuehyFIfA
	QTO4=
X-Gm-Gg: ASbGncvT+tsjpDer6UnR3mVCY4KYZJqgriJbEcOKPrt0OucO6kul24MaoCT7DOekEFw
	/XKJqGJnUSvlvOSzj3h8h0ODUHXt4POo4efcn0HCWX9SAS2ak98YoxTu+BHsQu6EA9PlGEm+j1W
	TXtOYEp3a61Menok3roMw4KRL/goM7hT2Tr8nNRXgvtsrvMjVXxZfDcQmF94E7LmLBwsntz9DFh
	Gkocvf+C6eHfZipIoquZS+U3xMvyT2gREDRunroJSgYCzGk7o7YrG0FqhZIjaUxvnaeLCbngCR1
	DtOUnC+SwXyRfZZT8zaFZ6+AoRJOGITSXhpzOx2O/HJo1NVkStHfEIJ3rQ==
X-Google-Smtp-Source: AGHT+IGx7QtVfT1JWtMIVcFCuUhUKogTMnYDmeTHogDn6k+cWvy1lOJNfmJ1oXM4MfFvDJRwJ1K8fg==
X-Received: by 2002:a05:600c:4687:b0:430:563a:b20a with SMTP id 5b1f17b1804b1-4392498b3b5mr43554075e9.11.1738945189904;
        Fri, 07 Feb 2025 08:19:49 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94db77sm94595135e9.15.2025.02.07.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:19:49 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/9] riscv: Fix riscv_online_cpu_vec
Date: Fri,  7 Feb 2025 17:19:42 +0100
Message-ID: <20250207161939.46139-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_081951_396727_1E378886 
X-CRM114-Status: GOOD (  11.47  )
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

We shouldn't probe when we already know vector is unsupported and
we should probe when we see we don't yet know whether it's supported.
Furthermore, we should ensure we've set the access type to
unsupported when we don't have vector at all.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index b7a8ff7ba6df..161964cf2abc 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -367,10 +367,12 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
-	if (!has_vector())
+	if (!has_vector()) {
+		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
 		return 0;
+	}
 
-	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED)
+	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
 		return 0;
 
 	check_vector_unaligned_access_emulated(NULL);
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
