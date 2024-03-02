Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FB3C54E4A
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 01:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcIF0AlHwD2s4bGoiCEWfcdgsR48MzHeRZ9/LDsYRIk=; b=li3hiATgAniBT5
	2iGmL8DRfsn1wogCWiK78bon27fRq3lic7963+t4Darfa05BrC7fwjV2buVyPj0InMApnyWbQfhuv
	0Aj1Y7r6wxtCZPyccVJcW6+g0JkdIs15vSb9vaZZCpssoD3wdG3fpDS2zeqURqL344FWerIb8GyOP
	snLQrA29MCc4N2aBi9ue1t1svZJaoAKyH2rhEgCrtt/IXxy0kHQpnCRza5O2gIjxxmxoZxZLQi2Fn
	YLNS7tUyqptzw5H16OpMyo+on71hlQNzUrqirrrCz0tbsa+dfOLHKOMY3caTdaJNE+PRpT3I3kS31
	c148NJfvSCZiYQwpPc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgERe-00000002VvG-32ZH;
	Sat, 02 Mar 2024 01:45:46 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgERb-00000002Vu6-32aj
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 01:45:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1dc49afb495so26920595ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 17:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709343942; x=1709948742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtnskPkRhYiZU7za9ryep8TQ6a4uPdl3XXtWJSoiADM=;
        b=klrQcuefN+mUd6Xkg7ApPHqMiE32odBQsUvuId3akOsvR9dZeuIm5VooJTQvlEWN+o
         8vHtk6fNv6CJ08TwbRqHp/s+bFJLjp/k3z1lAofBUajMb4rcn0dXAW35aoYAquVtbiKU
         jyTrIUHYFmtmyo7DN2Y/ESJmClhha3I1MD1sMZGrp60zoTspYHJs84bfDzixY0+ygFjg
         7S6GkNGFeoHO999FfFel/YpHfnRMOcKZOLhr8tVbq9GlxGdQkWzhyUg1sAb3/ym+u/tq
         7OsK82xzT/NHvNpmzukJ5kFpsgiM0903Gyh6LMpLOly7wOt5Pv9la0Ad04LwD9uTatgu
         S5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709343942; x=1709948742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtnskPkRhYiZU7za9ryep8TQ6a4uPdl3XXtWJSoiADM=;
        b=fQtgbi7B8KYlG5dfDwTtc7wLB2P2r1KJvlCY3kz/x+uE8ojT+G08bWQ0xhsW3Fp221
         AMUA4Jn4+EDg8lGrOLWLZHoHt5mixAsfQAy5U1ONs2k+1aTWHJ6Nhyjz23+oCVNqX2L5
         0tXth9qfOeKiZ199lrdmgIku7v5RAkifO6EpPpJzrzHUNeTxzDHB5LZXYxibSbpwKy12
         12oTKm2rOR/9BWAU69UlwiDaspn5v8S/8Tb8zn8zDuk+rlhE1gqQC/3SRxZdiGR5Le8D
         CdgZ33hZrNnytPstDUF3PjnH5s5HVgsIC+NJi7o1SHWQV5G3C2znSbl+fThsL9l4tB7X
         N6zA==
X-Gm-Message-State: AOJu0YxuZqWb6Wbc0oJqq9S9o2T0D/YTZxHDlctsGXfE8qFEL7sAis8Y
	z1m0wgBFVi/1pFELIHxu51IurHdiTRt/l5PynnvmUtarzzOmHVNVB9gvJ9y3q0Q=
X-Google-Smtp-Source: AGHT+IHSxlLixNtRgaHq6kfFYEYyEaOBDGvFg0CiI9J7Q5qF+AdJT4es86pFimCOz/DXUH+g9K8JWg==
X-Received: by 2002:a17:903:2408:b0:1dc:66ac:c34b with SMTP id e8-20020a170903240800b001dc66acc34bmr3661423plo.68.1709343942685;
        Fri, 01 Mar 2024 17:45:42 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902c3c500b001d71729ec9csm4129039plj.188.2024.03.01.17.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 17:45:42 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 01 Mar 2024 17:45:33 -0800
Subject: [PATCH v6 2/4] riscv: Only check online cpus for emulated accesses
MIME-Version: 1.0
Message-Id: <20240301-disable_misaligned_probe_config-v6-2-612ebd69f430@rivosinc.com>
References: <20240301-disable_misaligned_probe_config-v6-0-612ebd69f430@rivosinc.com>
In-Reply-To: <20240301-disable_misaligned_probe_config-v6-0-612ebd69f430@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Eric Biggers <ebiggers@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, Charles Lohr <lohr85@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709343937; l=929;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=UUdT4DeT5/dOQZ05jhj8UeaRSkQffyRcQJbuhlDryrg=;
 b=8PmXJ6dPykReAEr2oVdcdTdjbyNW1n+hkJwqkARm+ne05UxS/l+kJ7+aXvipYzLBMxOTOE/j/
 2410PfeOQLFDLfFBbI/C09RxasD89zBRF5GyE4tEEIgI5PD+ang1sQa
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_174543_821093_48F8F8C5 
X-CRM114-Status: UNSURE (   9.71  )
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

The unaligned access checker only sets valid values for online cpus.
Check for these values on online cpus rather than on present cpus.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwprobe")
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 8ded225e8c5b..c2ed4e689bf9 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -632,7 +632,7 @@ void unaligned_emulation_finish(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
-	for_each_present_cpu(cpu) {
+	for_each_online_cpu(cpu) {
 		if (per_cpu(misaligned_access_speed, cpu) !=
 					RISCV_HWPROBE_MISALIGNED_EMULATED) {
 			return;

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
