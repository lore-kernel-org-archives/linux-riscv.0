Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7D6C6FA8B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 19:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eT5T+rZzstu6pSLSAkAjlvMjUHfYa63WecSJ2VCLwWA=; b=19ezKwIzzSRNQ0
	LdVHc2Z66s+27rVKG0IXmV3EUSLyX9ciRKnTtffh/eOzAIcGShj3+nqIeAd7ZB0mA6N0I3r3LuZa1
	GNtQAG/MvMuGFy/h/YT7Bt2oPuk97QRlKzBY7sKDflJtZcEs3OGyBqd4k6J98q9s+pV1fwNWQI1NZ
	z4i5aNYZmyWwBSmkZO6nuHrzwkkiWIPQips+U6yM7j9JlF4Fiq8yuCilYaLFkcf9ZvTiAr+FR7CMb
	MY7z/tT90sRZEf0/37ck/JLZV/XJzA2N+ffdoDGUfAu/YASjqGdwOjI98FBfQ5+++dYlxw9JMv6Yj
	/r0Fbp1NQc5iTI3BEZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gN-00CUZK-M0; Wed, 21 Sep 2022 19:46:55 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gG-00CUT3-OA
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:46:50 +0000
Received: by mail-pf1-x42a.google.com with SMTP id u132so7012861pfc.6
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Mj3l9TL6WKmPWu+0iN9vSXqZMe6kPxftZnXjHP2P8BU=;
        b=fUyUXZPhPVV5nlIomv/Byqi5QyP+GdNWVHkTFZfcejM7r0Mgek4bsL4yojjIj7fwV9
         bltO6MekRZawR6vlB61iwCXkSSTFrGYdVci1EucsjATBA6/TQcz3tyTjnGmPu2mmSFIC
         F6KdR7x9Eda4i+pL1IkLkZDf4EFclFYufV/6Om9FmuF7gHl8IUky7D7kHArGdC6CW9Nu
         YrO7jOgWZyobLJ1O3hrui7Rk7CQ0DOYpJBa1cWae5gFwBQpjPC2+0a/WeCloqj5XuTdJ
         cerGuMtyPcH2M+0B5/jXxqW40/a4lJJr41W2fZ2Wo0E42UElwPnPfHRlNQvuHn9//uUS
         pP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Mj3l9TL6WKmPWu+0iN9vSXqZMe6kPxftZnXjHP2P8BU=;
        b=8CacHNxfncH8obYR2rpckc29zjpDVfSmVGIaRhDPVIUgkWzM0Q1FGv6p7ltH1jEsiN
         s6nNK7dfIhP3KUzIr2kaFYJkWa6n2KMqvm4mu5NJ6iG+Jo7K/k1Oyu7+ppw25XCdhidK
         vZMTnbFtA4iYi+4uzVxcg3+nqdiSqxI35i0OADoMJuZIqJ/F1XDKfxDxHgmkQtKLvukZ
         MbcMcyRjFuz+IiuSR0f1obNg0Dh1ImjIZoyhXLTIM8UBHp0dOo5ea4OF/HaVACzCUpOY
         qdNI6/EluVEIlpulMS9HswHPbY2l4G3kaTVwNKDy0hCnEMYa2/Fue6xTA8mbzo+FPsWk
         Qo5w==
X-Gm-Message-State: ACrzQf1kyfa4CtxHqItH9NeHJuZqIV88fqyiNx6R02Rv6fWA1EwcaS5r
	cSfUnthWTSSYxV7edCmJ6aEMY5PGCxoRlA==
X-Google-Smtp-Source: AMsMyM4Vcfp0bhTN6IL0oIrvymkoJXzjKGOrfzNHFUR5WCjKDlXgf+IuVUeYhUcX7jDLfchyttbLpg==
X-Received: by 2002:a65:5504:0:b0:42a:352d:c79c with SMTP id f4-20020a655504000000b0042a352dc79cmr27272011pgr.58.1663789604666;
        Wed, 21 Sep 2022 12:46:44 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:46:44 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Guo Ren <ren_guo@c-sky.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Anup Patel <anup@brainfault.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 02/17] riscv: Extending cpufeature.c to detect V-extension
Date: Wed, 21 Sep 2022 12:46:14 -0700
Message-Id: <20220921194629.1480202-3-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_124649_062794_A2585CA7 
X-CRM114-Status: GOOD (  10.15  )
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

From: Guo Ren <ren_guo@c-sky.com>

Current cpufeature.c doesn't support detecting V-extension, because
"rv64" also contain a 'v' letter and we need to skip it.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index 46dc3f5ee99f..c52bb7bbbabe 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,5 +21,6 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 553d755483ed..8d4448c2d4f4 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -83,6 +83,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v'] = isa2hwcap['V'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
