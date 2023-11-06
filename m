Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61ECC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 23:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OYMV0BImVfzttTLJmnAj7Y3ztPyJ8lPpBOOVZDrSt0U=; b=zglNkORI2MmNby
	ZQUmm/BeqOYfGmzVZ/l6Yq38KUs/TGGBk5udXulxx70Puk/4vahzim+ntTUUJlCi0nOXWPMfeh3NU
	/KAl9kpXsbPHcaD+Oahjxr8mS6TR5uNjdZiuJQ5rFxm2kc6qSETduHUc/dcriM159Cz4YkzqjEGAf
	Uc2ONL6mkmEJyTgoopijPxjEYEpmgSaH1orhsw7LHEqMOOV51wH5zJG3nt/X12sFBjY0w1tou9oTZ
	dgXvRaJ3uN/mbW2ZDEoKc+M0Np7LahuvqNecaAArSEepkpPSfiPmJX0WF1B85OhnQewkzArMT8aQ3
	Yot9Sof9+TzV+ODNkK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r08kZ-0006t4-2Z;
	Mon, 06 Nov 2023 23:11:19 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r08kW-0006sg-0z
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 23:11:18 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6ce2ee17cb5so3264332a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 15:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699312273; x=1699917073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cl1a3BIlGOodzNLugPywadXuDNbB772BtN6sPF7d3Lw=;
        b=dLs2i5oSO0OzKlL7iuVlv5VYy7qaoTzbMHhCftOx6Tkul1x17HCptN58dfgqLJYfR6
         4l5X/gsX5Nou6Zz2WpXuRfpe9XiXhnIeFLgXF3hj6PayODSJLNmjUe/Oi+vjCYQ292je
         x0VAD5NhdzLL0O50BlAWfmKtmoWork0L9DeghmEWG2YW8SKovkUcPzy5QHRfVFCWcW/4
         z0c2Zyv6ygaSGNHuhxr0rZ/lLXPaLOze4K6pU6ggSgy47URTgLkFAzzWvh87qmAlnYgA
         hZ/Ch8XzbBvsxjH+YoYA+okGn09w43TOcPh+ZQuhSOdSSlINHWbh3DJKgDF8SIw6wUZD
         I/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699312273; x=1699917073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cl1a3BIlGOodzNLugPywadXuDNbB772BtN6sPF7d3Lw=;
        b=qKZpd1vjBZttUfw0+fHEiEqxkhg2K41J0PA37b+Mo3pnjt70YGAhHyQZiva6LeOHne
         4ZRPpCkId+Qe6m/f/65ZHGscPiOlGVZ7wCCYzoTNLDFBzSeN0NIEVg1AUsIUXodRU1sU
         t3X8JDJ0nWM00ZeNMl/luJHY6Sfksc73YJQPIGOQCahm49jhTOPQw7SUSiSnBlzywodA
         xC78FIzl1mdr4aojAHRBPgde1xvFWFgGOsfZBkp3IBRyecvgtCBNcPTMByev35L2r227
         FvP+4WLOWNLBgviifEDUFrzzafuCMQXvrQ/o7agatVCLC5p93wXvzAEXbpV5pmiijMMh
         KYUA==
X-Gm-Message-State: AOJu0YyOA1atCWg3JUxwuKNJ5NN1HOb0L5faXzTxyHZEI6mCrUezcQ75
	zgb6TOKiGwMP3JIZfAsIYf8v2g==
X-Google-Smtp-Source: AGHT+IGb1DmE54qptCOR2jAgyCBNxxBT8ZRXpnCC4KrdEm4H9wksmx24bdsLdxd9hYmTf1F9bDafFA==
X-Received: by 2002:a05:6830:2b2a:b0:6d3:1f3e:4c4 with SMTP id l42-20020a0568302b2a00b006d31f3e04c4mr19885732otv.0.1699312272970;
        Mon, 06 Nov 2023 15:11:12 -0800 (PST)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w19-20020a9d77d3000000b006d309c126fbsm1418385otl.57.2023.11.06.15.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 15:11:12 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: cleger@rivosinc.com,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: Remove __init on unaligned_emulation_finish()
Date: Mon,  6 Nov 2023 15:11:05 -0800
Message-Id: <20231106231105.3141413-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_151116_351276_693A4D59 
X-CRM114-Status: UNSURE (   8.89  )
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

This function shouldn't be __init, since it's called during hotplug. The
warning says it well enough:

WARNING: modpost: vmlinux: section mismatch in reference:
check_unaligned_access_all_cpus+0x13a (section: .text) ->
unaligned_emulation_finish (section: .init.text)

Signed-off-by: Evan Green <evan@rivosinc.com>
Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwprobe")

---

 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index bba301b5194d..5eba37147caa 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -625,7 +625,7 @@ bool check_unaligned_access_emulated(int cpu)
 	return misaligned_emu_detected;
 }
 
-void __init unaligned_emulation_finish(void)
+void unaligned_emulation_finish(void)
 {
 	int cpu;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
