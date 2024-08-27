Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE39C5320E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 06:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a7pHEudSsYOb/tgQNC5s6qDdlqDJOC0AUrPeYUla5KQ=; b=BTSVOwcbzZWMvy
	JwHe8g3SjyGAkFfJDaVpVc/JVdiSxLMgCMyEXFf1ZvHklovo9yMMZnqM0WMlx/iLSvrxg5F1A3wzT
	MCB/qIACvrGXK5H70bj+xPgqI3R38P2QwMIiILey40KmfbB0ot5e8HOz7HYnsqyvYOfMT65EwB9pQ
	hRCxavY+ATeGSWMHKLoP+S5wTpYKqO51lCWUD6DYJXp2nYV2x8q+Eb2hjCWMHu6pMFRaJhH5V9Uu8
	YQm/UsFB2+qaFPXyWS1qwDPm3b3cvrfgTnQflRKq/ra5D1O0tai0AdeSNOGsRoTUW4sZLA6HnhRgL
	/O6vrxMA98PvPDJzy14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siq4o-0000000A71a-0xn1;
	Tue, 27 Aug 2024 06:53:14 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siq4C-0000000A6k8-0bm6
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 06:52:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3719f0758c6so2974360f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Aug 2024 23:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724741554; x=1725346354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuw2oLlN9u82x2mFgTSDv2ugVj/bF45+93q+DnAX7Jo=;
        b=Y3XxGITlNVX6yeHYPh8x9S2AaDZm6EKYDStGaan23URd/QqapDqw+BivYI34EaRZ6p
         5Nh2m1T2z3lmY9ZwAP5XlTG1Ps3mB2KJCkXfrtRpaSsyTrkaXL2RfJbkyjxnwZYBzavV
         +Ge72lQdPO+z4cxV090hZO5RNn7HNbDGCpOJ9lAcx2PXuADOcVhuk+HV+3wXW58j0V9o
         Zamu3HSpc2aZanA9zhM6EwXAI7N+Mvxv71JsC5C6qV5tU4V8CN7v59XpHO92liiYhd1R
         zCmo76wqRGQzPQ/l4u4f/QwakTYIGIfexIPY6AWxB35WZXV16hlY9Ok/TiQZ8zOMS1nL
         eP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724741554; x=1725346354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuw2oLlN9u82x2mFgTSDv2ugVj/bF45+93q+DnAX7Jo=;
        b=wxXi3kRdhIUP3sGxf+9nHl1nM1Ye3RbCn3SfC33M2iqxBpxE1EE0x/Pgykz0qkg2sI
         TvUAB+/U3k5fJeUP40SnP0POVTPYF76q//oNQxOepDJu3vsPFikskmRHl9Nl3TQOfTtR
         acScFEZlXnLO54jIVW1Cjq0u/upJi3FmB+/shZx6gAtNKGy9hET5U2Ff3mXxO7Rt0nX0
         4dzrXBpMGrB2XOYO4QH9SRQKPBgIIt3oiWCchld6fsPp4zNk20KynfQV+Fcon+9gjWKN
         ieHSB9yztCCT9p2Sm4cKeV0R6yHFgTMzAYXdxCpDSyuzG+octd0dtUq4wGhRdSk+4/z6
         YWSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkO8ucoqKrqPwU6RrlkHwXWfL630jUCi00F4hsTtCXC/xTOGDk3Ri5GUpOlHZR8ys4T8MW7u6BTu8AIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxT8HkH9mjzKFZwjef+ta3o6io+2jj9ymD4Y1IRXjUKb69AuKdg
	QeHDTIon+gVgyuaQcn6SFMtKvzrLPk3jeXlk4wa2KVjehd6syYBpptCBD3+3mX8=
X-Google-Smtp-Source: AGHT+IHiegBfHEhtotIT7zxmJuyDa/Og31R4YqQ6HjoIOWt9SPxnrdpek3pUJcpo9wW6hsYtmnZX2A==
X-Received: by 2002:adf:ebca:0:b0:371:8319:4dcc with SMTP id ffacd0b85a97d-37311840562mr7699202f8f.2.1724741554108;
        Mon, 26 Aug 2024 23:52:34 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5162609sm173951365e9.27.2024.08.26.23.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 23:52:33 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	David McKay <david.mckay@codasip.com>,
	Stuart Menefy <stuart.menefy@codasip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -fixes] riscv: Do not restrict memory size because of linear mapping on nommu
Date: Tue, 27 Aug 2024 08:52:30 +0200
Message-Id: <20240827065230.145021-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_235236_202792_F9F2C5F7 
X-CRM114-Status: GOOD (  12.72  )
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

It makes no sense to restrict physical memory size because of linear
mapping size constraints when there is no linear mapping, so only do
that when mmu is enabled.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/linux-riscv/CAMuHMdW0bnJt5GMRtOZGkTiM7GK4UaLJCDMF_Ouq++fnDKi3_A@mail.gmail.com/
Fixes: 3b6564427aea ("riscv: Fix linear mapping checks for non-contiguous memory regions")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index eb0649a61b4c..1785782c2e55 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -252,7 +252,7 @@ static void __init setup_bootmem(void)
 	 * The size of the linear page mapping may restrict the amount of
 	 * usable RAM.
 	 */
-	if (IS_ENABLED(CONFIG_64BIT)) {
+	if (IS_ENABLED(CONFIG_64BIT) && IS_ENABLED(CONFIG_MMU)) {
 		max_mapped_addr = __pa(PAGE_OFFSET) + KERN_VIRT_SIZE;
 		memblock_cap_memory_range(phys_ram_base,
 					  max_mapped_addr - phys_ram_base);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
