Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A78C54E5D
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JYRWCLe27HG9aNimRIlulGh19swqovIzRlEsSD8T7n4=; b=P1biBa6a6Xp9yU
	maXTO0PiMgkMgak3F96xk9IsRzy3nCL79PcgEkdKPcRQdOSmkQ5IJGO3fmF/v6CcJhBEmin1PA0iY
	H/6ns66HAgFE0Nkkrfkzo6GDXqQ4kHN9+f77ISMAfCr+cz2u08URB89Qne9xUCDLbjl4YrxHiKzZs
	XthYTCRVf/ln63D/hrJy8quv9CT+PlgrZocvdzZJTXtw9YR9ZEkQ+OKaunNgWkEGbRi44FoPyygcO
	ljMhGziJNghtTzzrRmH/bvvay8aty31htmuG825yDEGhdHkmAiGTugjzxJK2c12UW9jY5qDmzM6XW
	I3CDoIRdUKWJbrcXSjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riev5-0000000Ampo-3Rvm;
	Fri, 08 Mar 2024 18:26:11 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rieuz-0000000AmmD-0ISo
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 18:26:09 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-29baec5f751so749259a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Mar 2024 10:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709922363; x=1710527163; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8i7Hn0NjGdBjABWwTPM97LUVWqQ4V1pWIxyh4e32z8=;
        b=ehBbG51Ox0/qHIMws/5uCSH88n4NUf3a+Dg8lQ5WNEOzasDciHx3g8VBZkffDZtzM0
         BvkLbLL5S4yhSc8s2fJQtw5TgvfNcKPBUuUbEugBv9Ol0jdDG6AMKQ4nlOdGJJPO2z4D
         VJ+DF9k72ICxQflJp7VUkPCbbjVt03trIq2V2VZ87ygTjT1UDqkX7PuBubgJu/+gaqY0
         U9ZaG9cMrJInP+5onFkR06sec5kYcpm3W13IMthB+k4v5gB1Unwstnh7zbihLNv4rgEl
         zuyT8OQgTo90GfK6ZHe7VDXtThePaqAJx4UWdzV3D5PociIXTAylxb3cQPLArWbcbRbw
         ZBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709922363; x=1710527163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8i7Hn0NjGdBjABWwTPM97LUVWqQ4V1pWIxyh4e32z8=;
        b=ZjbuI3a08HYMAY2WAwr2CKb6QLoqJxlOBclaa8BQTTVO2ioqdqLISUr6prE5AHWcu5
         o2FMY+c8WaK/HO75LDyWyb0YRMonqmfsyzOXhSnHCqX5oRWVPc9lHWNR2k5VoxdAgwM2
         i8Y+Rq9Egt5HLKzTjpSCS75huxaVwVIEfSCMp1NZPKiNpEPoHoWfPYp1M3HiOG5HLymU
         B5CPOO574v/1DhR8MbFgIqHuT84CkXXBtXGI1h4VDOYlJcrF504IuAj9zVaEuxXz9zFP
         SSmtqziMCwqYQ6IbTjVH8elEDcXA51XLcN7jII5+ph12piJrehPvGQowbEnNApf9FowG
         Wa3w==
X-Gm-Message-State: AOJu0YzhxuVJDfalwBkjhnkV6hRAl43NodecZmXlZPh9E2myHoozpxLo
	wbcAhEnXIdLar2kTBdIcbC6GtsDS/ymuCdYgP3KruAADol6dtF5MhYBGVH0CL0SpU5DdM5vDVCQ
	q
X-Google-Smtp-Source: AGHT+IH8kgZbnyf3P/VRv+u1abDgA38A8Cw2bjDl1+Lq+akQmbwU/gPrg+PUnxBiEC1gfXB4O4UoAg==
X-Received: by 2002:a17:90b:198b:b0:29b:7371:c180 with SMTP id mv11-20020a17090b198b00b0029b7371c180mr1003365pjb.23.1709922362829;
        Fri, 08 Mar 2024 10:26:02 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e13-20020a17090ac20d00b0029bb1bb298dsm44821pjt.35.2024.03.08.10.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 10:26:02 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 08 Mar 2024 10:25:56 -0800
Subject: [PATCH v9 2/4] riscv: Only check online cpus for emulated accesses
MIME-Version: 1.0
Message-Id: <20240308-disable_misaligned_probe_config-v9-2-a388770ba0ce@rivosinc.com>
References: <20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com>
In-Reply-To: <20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709922358; l=985;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=VSZiKx13zcdCVDYwqIRzCcJDp79icXmI6mc1wjrw+wY=;
 b=s3J/YA19nA3aZwWo0vtRnSvwuO//sW+TUai4jGeI6zCrCeWII+2VQxVrMJtsSd3U0Nt0G4SEJ
 UXe9nzS322pDT1H/9TJxMSBSaS/f5JfhnMiNZGh3Cr0A31oF0SggGmp
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_102605_135384_11F564F4 
X-CRM114-Status: UNSURE (   9.55  )
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
