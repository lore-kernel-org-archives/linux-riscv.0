Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328B3C77B78
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgg4fmxj+YbmAWnpk/Mygf+5FVFZ/EjbRiZ3u2HNe28=; b=CGIRW7zCOOdiLe
	e45/STfrnz+OCN69SpKdEQIePxJY/ursNzeSXHyN/Ye+uSynp3K/a+ZwAPjN1Fqos6j5f3M/Sysy2
	4hmWuadrMOE2MEyVI86JQvG+h4fAuJwYqTiIswdbV73ez4pg5LCcSJ3ejobFapz86z1SPRGIo41mh
	Hq59+Fer6Ggl1ceesmBQ507+tieAyc8urdKMZGPg/v4pvLOwGQcYYAfWA5MApQfWj33/zy2mt/s3I
	OYFnk0bUIGSuZ4KTVUj6jnycU8h9pCBETaOVW03p03j2vgvWq/FZiq0OI/YtHNcFZU++RegFUWa92
	fKSnmRRCMcPbGljq/0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prftx-004AK9-3D;
	Wed, 26 Apr 2023 14:13:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prftu-004AIR-1s
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 14:13:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3f19afc4f60so31147235e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682518421; x=1685110421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKs+1+YzKKzaO+Ak2Le+2SErMtpQd5D7VYynK/VQE1E=;
        b=AJfHzqMLDvovgvispv3ljdofQNHXMVHb85c3oOYjjLUmiyMytOcA3TOiVESioqYpal
         4IOeXYZTOt28UYKfPnzfhkppD89NA/tcimqcN4g0icZDBzhtRu4PHJcwe0FrCFQuavy3
         5ryi9pC0TZaMw+Ym2Su2MZqpRStuhQAlQyI+kvaiVbVzMKnhVH6pzQm7fl3lT84q0ShP
         U7s0Ag8Jo8S91OyuKa+UM+nsgpGdKVfRyBx4bPnhFi/NAFxnBljIfffjZcklPhPEyKxY
         Zu5UzszueJf6xWa3MuDKQ2eirxBw11tBIqclARtfY4kxZBlMCJOTUiPVLGK88+Y2xcrE
         sfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682518421; x=1685110421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKs+1+YzKKzaO+Ak2Le+2SErMtpQd5D7VYynK/VQE1E=;
        b=N6Tr6KHBsfIJKOI4PFYwh0XsGZP2lEhJ95plDu3oD9GT/kaJZLXOi0sqyYzVOITX59
         nsCaxwLqNTCMYgY1R/qFIICOytUoPsNQmqxclD0fSB+Npe6ulEGShZYOTnb5KeWkg7fc
         jLp/+5IlDnOUa2IIrBTVlj5bHkhOCxOSa/6Ev6zq043t7N98wBGXhDU1fInfcMwhjSEo
         ApLhBeore1OxZbuGlSBhQMWPiYV/R9s8VH2fgSulI7mwSWhBeOCfsz72zDZOyYJQSgE6
         4X/hrfUmTCEKu96gcOrDeHn22CToDz9DjUVVLLQ0zn2wnZYKlRzsoldF/eaC7fXbATMd
         Liig==
X-Gm-Message-State: AAQBX9cpYe5puB7q0vONMXU4GGWnECaOxE6lI6UzNsMBGGo2jNHkGex3
	6aaxWDueICsSfktGYDsWShLd/b4/T9Yvhdrr768=
X-Google-Smtp-Source: AKy350YWPWPpjwpSWJdht7J7CYVx2s5G679X+i75OzFaecfK+LRfrqQy5d6H84pdNArI/M8gkFGcBA==
X-Received: by 2002:a7b:cb50:0:b0:3f0:683d:224d with SMTP id v16-20020a7bcb50000000b003f0683d224dmr12924312wmj.9.1682518420818;
        Wed, 26 Apr 2023 07:13:40 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c181000b003f046ad52efsm21498928wmp.31.2023.04.26.07.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:13:40 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Evan Green <evan@rivosinc.com>
Subject: [PATCH 1/2] RISC-V: hwprobe: There can only be one first
Date: Wed, 26 Apr 2023 16:13:32 +0200
Message-Id: <20230426141333.10063-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230426141333.10063-1-ajones@ventanamicro.com>
References: <20230426141333.10063-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_071342_617060_E0A15EBF 
X-CRM114-Status: GOOD (  11.38  )
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

Only capture the first cpu_id in order for the comparison
below to be of any use.

Fixes: ea3de9ce8aa2 ("RISC-V: Add a syscall for HW probing")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/sys_riscv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 849b4170629d..c569dac7452e 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -103,8 +103,10 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 			break;
 		}
 
-		if (first)
+		if (first) {
 			id = cpu_id;
+			first = false;
+		}
 
 		/*
 		 * If there's a mismatch for the given set, return -1 in the
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
