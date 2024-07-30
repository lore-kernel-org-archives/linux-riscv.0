Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ECDC3DA70
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=apvzjf1rQLLOP8Mf0ydYj69ecwXmsOG0e1F3ZSiJCBk=; b=31vXWob8ON/QDM
	YpK22GI6x9cUG07mkwINk0ud1ES+TeSAYAQpWoS7t8vGaT9rbySJpapB2S2X0sI8J9Ljf+WlW4vnj
	ChphIudr6npAgnZLT1gRgSkuFEHQdQFWK2c3PqrKyv+QIUOnm6ppWtRh3SFzIhNgXduDEeJV3xp+K
	m7yagA6CIGwszm3pwwE2MP4Iu2wA9jQt05J113pUNZO9zgRrNtrKSSD5y+ySdOgcw7fybH9WFHGlL
	4T86F3UnrR+njOJ/TenDV5409g8HVS3q4T1vey/D0qij0C0cb46xR6uXhYLQUQEQ+8Y8gJF6g+GMU
	SJHx9gQDCoc57xfcBcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYnO7-0000000FMwE-36mn;
	Tue, 30 Jul 2024 13:59:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYnNt-0000000FMqy-32R4
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 13:59:38 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3685b9c8998so1934191f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722347964; x=1722952764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d4SiGwxv+GpYFMy8yihMexUGzaqbAnscr5FG6o9leBM=;
        b=U3kE9iCOdfnwYYm+WEKGqci6CiZVron+GY2EYJl1e5Ag/8rnQC2+cyyGms+A+UZTyE
         EDvYQpkIcAAUMc5trCqXLtJDb7Gv5fG4ZuaGVAJXSEZLHyaitWKcjxCbDFyxPpwPGXVg
         y1EdPQa+haa45Js8SX/jf0b/Y2LwUtz/tqhpqGZnzMDVdrQXHb4/nEQP0QmTt+rcU1OB
         tI1X0dy5TEaa/Dx1gnusZkwtyXTmhownL9+NqglNu2VLg8l24JqGHHpKO4zvNcnjVV/V
         0b7bLueyx+UwfV3uORE7zLnt00TiNZgR7EmeVWPthnp/2j+6I++mrRL5mQOxpfUMLml9
         kljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722347964; x=1722952764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4SiGwxv+GpYFMy8yihMexUGzaqbAnscr5FG6o9leBM=;
        b=Sn+9emgbskr8ZHhXiFOOnAyyYGFMXNCEYZOjgFE5tk/Krkf18oswVSn88T8u0Lute5
         lbqGOcjuY0qaW96zaNF+1SuVgTHh7LBjq7LEZgjqB8rO6vnDIuZyzBYN+lChUC9+R15X
         eMClpASuuzDsShumVRdKMdXWs4RxqsMDgznnSSXuX3CZCFBpvksLWZA092NSO98x10mS
         j9y794AarVh2WxzWdNzomJ8YBXtKrpnrZfLlHKFxKETRJwqJ61Q51QOLmBlxsxzUVlh5
         3+gGwkw+aXQOEpaELasA2KUwAKLi2QzD+DPltSWnncbCpXgmJBoj0TP0N672SNldefGU
         Ob1A==
X-Forwarded-Encrypted: i=1; AJvYcCVG7v6n1+QqmieBh40ug84zsBIuJCxyg92ZlX1tOL/ciQzR0+TVA4ZXJZLi75VxrrJIsy4J/T7FeIqJyCpgWoxSFD1fZqhRcoA/hF9QxAM3
X-Gm-Message-State: AOJu0Yx+L2N07dbhCrLqzvSWeANfxqo217JrhbCycKRl7K0bgCJ+5A36
	gvDWftm6e8Bvt+OPpcTWFZkVyK/8QuHmUG1BQV7qbaXLVqitfsYQBdvBdmy01Kc=
X-Google-Smtp-Source: AGHT+IH2BtPulAguT1+cAEJxnp1N6qxal/SAgpXL+hqSe7M0GC7DNoKGOzPVXDlTkJfX0++s9uKgvg==
X-Received: by 2002:a5d:408a:0:b0:367:f13b:ae8c with SMTP id ffacd0b85a97d-36b5d08b2admr5567861f8f.47.1722347963623;
        Tue, 30 Jul 2024 06:59:23 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857c78sm14685815f8f.87.2024.07.30.06.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 06:59:23 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH -fixes] riscv: Re-introduce global icache flush in patch_text_XXX()
Date: Tue, 30 Jul 2024 15:59:21 +0200
Message-Id: <20240730135921.156508-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_065925_782725_46A69A11 
X-CRM114-Status: UNSURE (   7.13  )
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

commit edf2d546bfd6 ("riscv: patch: Flush the icache right after
patching to avoid illegal insns") mistakenly removed the global icache
flush in patch_text_nosync() and patch_text_set_nosync() functions, so
reintroduce them.

Fixes: edf2d546bfd6 ("riscv: patch: Flush the icache right after patching to avoid illegal insns")
Reported-by: Samuel Holland <samuel.holland@sifive.com>
Closes: https://lore.kernel.org/linux-riscv/CAHVXubh8Adb4=-vN4cSh0FrZ16TeOKJbLj4AF09QC241bRk1Jg@mail.gmail.com/T/#m800757c26f72a1d45c240cb815650430166c82ea
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/patch.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index ab03732d06c4..91edfd764ed9 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -205,6 +205,9 @@ int patch_text_set_nosync(void *addr, u8 c, size_t len)
 
 	ret = patch_insn_set(tp, c, len);
 
+	if (!ret)
+		flush_icache_range((uintptr_t)tp, (uintptr_t)tp + len);
+
 	return ret;
 }
 NOKPROBE_SYMBOL(patch_text_set_nosync);
@@ -237,6 +240,9 @@ int patch_text_nosync(void *addr, const void *insns, size_t len)
 
 	ret = patch_insn_write(tp, insns, len);
 
+	if (!ret)
+		flush_icache_range((uintptr_t) tp, (uintptr_t) tp + len);
+
 	return ret;
 }
 NOKPROBE_SYMBOL(patch_text_nosync);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
