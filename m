Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F59C54E5E
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 19:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYRWCLe27HG9aNimRIlulGh19swqovIzRlEsSD8T7n4=; b=oA65Vvm0Zd1KbQ
	1m8at0g/anv2FMGe63bzO2aeFzZ8qWv/iyf3cvhpKGkR95HOFSY36Dok1xdyAigrCsgfasmPe2umQ
	oWZnut82O1em0bDpwKCf8duDj/asgkT9EKsXlp5FOMjgOZJKtO16VUrHg77PqYvAWocoHktWel5zl
	j3baAEpdzR+S1TTjIqCu+pEWVFhL+774vSOvwN3NXXDNynAhxyf9k9HW5XV5PnmCa417M1U7EN4LE
	4gtZanxL1u50stpCOwWT4ySFc9GbTSvaaYkK1nK/EVX3TcSYU+icy1p1fSAeZm9R6ten3TaEuXYh9
	XvWXUse1Ec4074UdpMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riJ4D-00000005ya2-4B4m;
	Thu, 07 Mar 2024 19:06:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riJ45-00000005yUc-3sa7
	for linux-riscv@bombadil.infradead.org;
	Thu, 07 Mar 2024 19:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=h8i7Hn0NjGdBjABWwTPM97LUVWqQ4V1pWIxyh4e32z8=; b=eBhH8eVt2QdSlCM4xTbcb7/okl
	vuVZj+RFu6peK13s0gK16SVUqbIvBKlnGPluxYKyjKhS4E2+Q56/hDLN5PrL+DdPbRx6vmQ8sKebx
	3fkYZPMaMi3gWl0e/pDT3b9i5/PFptxgppk5aBgdhFv66dB+yvKL/4D5SUR+ESmscb34SDpMR25SG
	2pmkKygrMyCgfCTvCe/slFJ03fddftix1eoRRBvfYjZO1C5IGlM1siGd1lwwj8cVmCCqHrXkoisXc
	NFiyICcLAAMmAItln/nqbB97Yp0QLlNaWMo258QTUjNLnZZ0ruan7EE4/pidzBJWDCeZw4n0BH/eP
	SconW3Wg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riJ42-00000006rT2-2sUL
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 19:06:00 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1dd6412da28so2281885ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 11:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709838356; x=1710443156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8i7Hn0NjGdBjABWwTPM97LUVWqQ4V1pWIxyh4e32z8=;
        b=CZ14umrb/744OqwmZaIGDNL7w0SkLMTpkl+H+xkGuS6xrtC2zMBEmOtqmqdhcmIrQM
         Ahd7hYgPD8eKwLCbkuePmDhZgKSP3QZMoM/fEF2inyrA4+HfJN8HIVPGWZMGhcC0nFz3
         mNwi63QGPgsOTHseUnqXQ7wZJLevWs0KqOc2GHC1ULycymh0zvI5FRI3jewwQKUJR7yl
         7dloKvmACL7Tk2EZTe3MuOS4UwtJKuGHX6hj3TP1D1XoZOK8Zg/G4XXV6/daVsiA95AV
         qbHCqk7LGfxvJHMUN4KKa3CdXPTDfxRnp16v63gFuV4NOaPhzkaY9bSVrnHyv2hOpbYz
         j3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709838356; x=1710443156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8i7Hn0NjGdBjABWwTPM97LUVWqQ4V1pWIxyh4e32z8=;
        b=VeL8SwJLBpT0EsoBNQlgPSU22/ZMKaX2SMpd9L/6NauO5NmW8E/ogxVZmsfHlLRPBm
         U4baGoffLLohhs4166Sf+1RVEbW4dZyJ7lS/EL+2vd9iU/hWQFazpsabIyL5ZTn+d3vK
         bdILXW/DXyXrLgIhlIwVGJIq/PhmwdF4MSgyqwXhmSsne2u/vC3eues07qCpeLitttEj
         hBxqh8Jo9tvpEmqyUaAC8z9PeGlP6tCsO/gOL9uQfs9eRuuFP6qUiAeUDBpuncLq2l4w
         GuUZfDVpJpwuwQzlCNpju1T5e2r0qylrmNuFullm390Z/9x60DZH17paAKrBzUDc3Tbz
         v0cg==
X-Gm-Message-State: AOJu0YyLQHFlLuPwY35RM//D5ftu7mFCQreiorOeKsQ3aLftmWh5Q3WX
	bdmRCujDpWUuplQHrAjzsBtw8cLPO+0QUPqxZveKUPEw2XysdvkJspjxE4f4URM=
X-Google-Smtp-Source: AGHT+IGWG50eIYNqJYtIEtMgtF56ZtFfU2/+liaC87qJQqHAa4lId+qqp/lStD4LT51B0M3EfKpmCg==
X-Received: by 2002:a17:902:db0a:b0:1dd:a34:7321 with SMTP id m10-20020a170902db0a00b001dd0a347321mr10498088plx.25.1709838355931;
        Thu, 07 Mar 2024 11:05:55 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902680300b001dd526af36csm1747338plk.295.2024.03.07.11.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:05:55 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 07 Mar 2024 11:05:46 -0800
Subject: [PATCH v8 2/4] riscv: Only check online cpus for emulated accesses
MIME-Version: 1.0
Message-Id: <20240307-disable_misaligned_probe_config-v8-2-55d696cb398b@rivosinc.com>
References: <20240307-disable_misaligned_probe_config-v8-0-55d696cb398b@rivosinc.com>
In-Reply-To: <20240307-disable_misaligned_probe_config-v8-0-55d696cb398b@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709838351; l=985;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VSZiKx13zcdCVDYwqIRzCcJDp79icXmI6mc1wjrw+wY=;
 b=4lDes0vZrJms/4gMpoYeVGqXErBW/PLjmFFmXEprN4sEQrjl/O2TnHAvCflhkGywOBjrDhXZx
 brGOqXY3mv4DSqV1Bxg2PRf3Aizh4mrVFcQLGzt1urygWj2UkFOGR/j
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_190558_961853_922C4490 
X-CRM114-Status: UNSURE (   9.70  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
