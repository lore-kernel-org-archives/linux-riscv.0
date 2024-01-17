Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4208CC47DA2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 19:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AwZLZT+1z+OKqWubpEyvKKAbpm+03ZKtYkKZQk73Ijc=; b=ZZf2WYiUEViVFr
	rc8u/0F4s4eIZukwzbCjyAs6JB+rYP1bVFokyKpP/NjLC4wBXSRpxH7bF1V/jmAhEHZXPfzeqrq5X
	Tef2MuKBaEEVar1s93U1SyGhPa9Meok7KFxCvzglbDnwhAQxvcv13P4XvWTUQNfsenXVrfmTWKIH4
	tgnFh0IuxpqX0xyZCYKR2B1dd5Q6X6FhhgKAnPMRehlmYVlPGbF6qLwBnsgrFvbTvt730P28HqR5p
	+lvGkaxbOxR6ZDVYvmjxI41wxPQSWJcyfOPTXUIwgQWpmxl0lj41AwC0QtzY8I3DEIfO5sXzwyEPM
	gsmIZNHAEoOOcTrwLTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQC2v-000YZQ-0n;
	Wed, 17 Jan 2024 19:57:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQC2s-000YYp-0I
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 19:57:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40e8cf57d63so7335025e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 11:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705521471; x=1706126271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4waHk4rPmL0zhRklQDdQP442m/73aDCDPB9DqO34yq0=;
        b=cnWapsA0+3u9LMO+Jm7BLyH568Tl0tic6iZbeDE4xwQ5m8bbZtypqVw7KedKo9bKUN
         XULMO5CtH2rbFLJB+gnWxF/QRirhzbg0Vji/mxrSVdvIeCjLJN4+nXm3+KdX0sxNiFfx
         yW+w7ClLABzNgKttBOcza+yOiWJSOnh7tKctWUCa3CZtLHsn99kniSg1ELtQlxXOVEDQ
         2xX9u9HXYlPMitdufpVBeYsXCRgrsqtPvRcwPdd3PwPeZfbGJbkoyuEjfPhVNdKMMkBs
         lZHmvzDOrWP6BSniM6/kbtRCZWqdentQbQR1K7gZwOrQBUxTTq2kzTiENqpj1Oqdb7yw
         Pp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705521471; x=1706126271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4waHk4rPmL0zhRklQDdQP442m/73aDCDPB9DqO34yq0=;
        b=K5QBfY11xQxP2XgE64sbj1WpPdflxfM7yYWu6YFe+K9PfFy82f+24cQp223fpbiR4H
         hG2dciRnWtTsp7Qi5ZKT6G2CMabluf83iL3BRWms6FnQRk5muXTuahrul3Z3GFL+Vnl+
         pFSC2+89GXKDeHjJr/xMqtZYFAYE3htGQ6q7jNnPQN88csEs6+6feTgOi45En0GIxZcd
         PpCJnbKZSqwJT3Vhm9zYCAcnNc5BJjpMboGF84aqbEYedN1DpwKav5V9wt3K3g7FBpVt
         P55FR9M2po/4gl+Rf8rU7dupCekmoHxLw1vKLjOLcT1BpLWaB+4rQKwR0JjDyN57KaDe
         XzKw==
X-Gm-Message-State: AOJu0YxJSa/ZaPIH8yMBWOydCRwOvfPODQeArblB8PLhPe86yyyqNxuv
	0Lm657a3RtcVW28I73tifCO9WomIMHPGsg==
X-Google-Smtp-Source: AGHT+IGewKH6iXQvqW/gNXe71KbxVjxmyFIysE2mQ5oQ2US6/f8tzsBa65eObcHKVN6wt2V1gcOMGg==
X-Received: by 2002:a7b:ce16:0:b0:40e:4618:d9d0 with SMTP id m22-20020a7bce16000000b0040e4618d9d0mr5236201wmc.77.1705521470046;
        Wed, 17 Jan 2024 11:57:50 -0800 (PST)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b0040e52cac976sm27064749wmq.29.2024.01.17.11.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 11:57:49 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 0/2] svnapot fixes
Date: Wed, 17 Jan 2024 20:57:39 +0100
Message-Id: <20240117195741.1926459-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_115754_134014_E585AA44 
X-CRM114-Status: UNSURE (   6.69  )
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

While merging riscv napot and arm64 contpte support, I noticed we did
not abide by the specification which states that we should clear a
napot mapping before setting a new one, called "break before make" in
arm64 (patch 1). And also that we did not add the new hugetlb page size
added by napot in hugetlb_mask_last_page() (patch 2).

Alexandre Ghiti (2):
  riscv: Fix set_huge_pte_at() for NAPOT mapping
  riscv: Fix hugetlb_mask_last_page() when NAPOT is enabled

 arch/riscv/mm/hugetlbpage.c | 62 +++++++++++++++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 2 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
