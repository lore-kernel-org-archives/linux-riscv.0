Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE52C47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdgChqmYUa31BDA//vz4UcdxDriygVyR8lBlsVsB27k=; b=mtmgCFDHZ95oCL
	f24SSY3u+97H1Uhjvnkkxa9FEPsMVPHkUU3x0Ga2d8a10UAJ5tnLBJ4xPxMrRAvT57LSab976Vzzz
	FvaWBHjp/IsdgoU6KHMQ3eeaQDodp3Dt/azSwb1JlzwrY4DSG8hGJtWwuhrL8q+pUHun8Xa2X0lAA
	qLg/3hdYkaig96IeqoITDYh17wv0W5j4r1QKsw6sXm1AeUBeiWISEWb66Mt+J3lKcjHauQvnomSgj
	zhxsl+jWZTHpKlx+7eJYfdjsiOE7B1ieDVX+R+XLc8vJiaH0trL1ZmmiBbVIPNXwW3p78PQY3F00U
	DEHSFJt++sFUuXGGl9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVD0x-00000004N8A-0gzf;
	Wed, 31 Jan 2024 16:00:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVD0u-00000004N6E-3i7N
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 16:00:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40e8d3b29f2so57917535e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 08:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706716835; x=1707321635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+Qkjn6hBpgJiZ+fG8bZMEzxCOTIiddvh/UVG/MhUw0=;
        b=wwwUiz3eF2YzWDLYMvdHWO1n+GMr/HcWAPrJ/VHmxAJTb5R4fGai88IdnUmbfHGpq5
         fiJAI2OOAG0oWhm3gJk1JlpQPl3Ds4sevAdBnHgDMM/oIcUH3JfaQ9q3njZjX9bRG078
         fwf0230M/RF5jyHc6N1rdEVh1dgeoYOAfCoSRdQNlJPU7ADsFQA2aTKbPjtWXuGHLLmQ
         l2HdqseBcyLpqybb3gNdmd8ivpLnO/7U54uRAEJbWuwuerxB96r9KDmJAx+SvnBPrGnj
         I8dPZIvIbBnN70GAnaaY6Ai/cnBCGBnZFnaYuk/LJ2/vWLf1pVZUP8N6bOLOjUNuuEm2
         AF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706716835; x=1707321635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+Qkjn6hBpgJiZ+fG8bZMEzxCOTIiddvh/UVG/MhUw0=;
        b=bTqJVjno7a0k3WlfBXZk9y1g3Qi3x/XluBv+VaO8xloW8n438H+SuOtGdu0SBt75Ei
         LSBLVbSKdbpANRxrPXYvW+dWyQZEJ8oG1hcE9Dp6q05YQSFSfhv6wrT63PTy81qyv7Fs
         UXk5H0C9anBu+44gswlmMN7RnZeM+KjeXHa685h+MOAtXxeZm8RDu/8oCW2o911mYERi
         4iYz5ujmreTgmQeR5XxUT5LTUPC4L9NsuFxp/21oK/VRN2EuOOIdgCncFOmevrliwu5G
         4bC0eOUpf4+CvLErKFytDssNDzhyn9Ok0QEQfKgHFi3dA2Y9PzTAyHAfaFfioyKpJpg1
         p6Jg==
X-Gm-Message-State: AOJu0Ywd3L3gji6W4TW6B6E7glht/AVXf9t/l6TajdW+qtIh42BC8zJf
	yu9lCyetagTuwcGsBoSehBE76RBhFAatC4Bb19dXHjqioQpe7C4hUu8TMTUV6s8=
X-Google-Smtp-Source: AGHT+IFOSxR0VWlTtt7aglVFKjETqM8YWHF0sImDLgGpk3Msu3yazxT2zwUbsrkmDtaiclYuoSVVQQ==
X-Received: by 2002:a5d:5917:0:b0:33b:d2b:58f3 with SMTP id v23-20020a5d5917000000b0033b0d2b58f3mr558876wrd.19.1706716834000;
        Wed, 31 Jan 2024 08:00:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUn1b13ZNRzCy283eTAlYXQTLMwRwVlajpW6U17NkyZK4wk2yBhhQ7T7nAGYIIbO3fJ1ARDkhMYCymd0vjQMM0mrJ0m/2m5lqBZyglATKjW6Zzxk/B6IJxznkuZmxZ1TJ3cH/Jp7BwBza6guGnEdasuQE0GewfiE3ubxHmLjvIs78DGDJSzfU/27VEF5pveogS4Vow/bhAbdFMdW/IYDGaAnF3nYumVGAKKCQ9nOgSKC2eBOC9xOLx9JnZoKZ9Ho2yCI5z7MSseFIDdPa/XkBHE54iCbRdQndKCDPy8bxiyotgwxiZcx3+SuuiPofERe0MckS2S/6E/kyrL0HaRaM6pU0woqZankCuKbNH8VnYSPLkzkZXNl1AoJEPO2fnXvrc8+TnmO3oeiqwbluhwV/1QlsQj8h5rpppgqTJEQ3xcqtL5sWlt6z665n7oC4bUikHUEWzai7vZXm1fcPUkYFOER3XwNdulkf/usUZHT/OjBrDM0lxJa6CFYX9RdHrjmrlArydX8NPIXD5OMrv4c+E2pFpdAAT5fFO4s3946JLh8K6iNGoyV/fVL/yo3WohQ0Ry8fKH1EPmF4vZRA5gJKtC5ux/QZPWhUJlSKGm0HRLl5zV1RXt+xleNrI19UU+2m9Tgg+hmovoV0hevg==
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v8-20020a5d59c8000000b0033af2a91b47sm7494000wry.70.2024.01.31.08.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 08:00:33 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RFC/RFT v2 1/4] riscv: Add ISA extension parsing for Svvptc
Date: Wed, 31 Jan 2024 16:59:26 +0100
Message-Id: <20240131155929.169961-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131155929.169961-1-alexghiti@rivosinc.com>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_080036_933960_98489D6D 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

Add support to parse the Svvptc string in the riscv,isa string.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5340f818746b..2e15192135fb 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -80,6 +80,7 @@
 #define RISCV_ISA_EXT_ZFA		71
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
+#define RISCV_ISA_EXT_SVVPTC		74
 
 #define RISCV_ISA_EXT_MAX		128
 #define RISCV_ISA_EXT_INVALID		U32_MAX
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..4a8f14bfa0f2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -307,6 +307,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
