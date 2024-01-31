Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C11C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8/yVD6KfyqoNQVc5003yjYMPJl0UyDN3N3xN7X/Ri4=; b=RkuuYxSiyJYmjU
	H6Dh5KAKGEOzkvi0eSib/aR1fOEFy/edL/R95wrUYcXscm78m1JsKunwBCnyOr1aQZ+dmuPWFvUCn
	jblCUXNHnh/RyWASyWQ8HMJr19KORcjd9PIEaZMHomRZ4IZ5jSYAJJ4bpTjYKPVUVTcjAANGltTb+
	0Y0BF1rXAU5kLYRYzwDsPXIIQyi52Yw+XdZwzUHaHTNs2hS11et/4rcmPBE1Vxg5OmG4oUMkYyznS
	yoQwuqh0dDJbAe4Dvr0huwaXpRkdiN2nwtFfY8R/QdgNnEQkdlpa9GoBCbaQ5WXwYROo2xImoB/Xe
	7VxvGX061SzkOkS22OYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9LH-00000003GWv-34Gl;
	Wed, 31 Jan 2024 12:05:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9LA-00000003GRV-3esR
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 12:05:18 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a358ec50b7cso153858566b.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 04:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706702715; x=1707307515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYWwoGW5tnFj1vY5dj8PEXtyvWyXgtkfLVtW7dbTGJ0=;
        b=niRsRlnLHZTFxrZ/VNrzJb8ReeOaXWPu94iuMEPjGA/Wty6jLbfFZk5RAoZz3oGILG
         id9g3SxIaUxxovPR0sEg+8TtzbHTZ+rsNF3JuxkAAfXAj6zFspd4l4A27IZ3uKnFwQfs
         U0TylCM7/3let/0vxFYDSaZune2q3lA+1R+5MIOXtE6XvZz42VfYxe70ZWGFl6r/N3ml
         MZlWgiONl2581EUFAe5Yg/aGhMdZJz9xyUYUu7Wt+H5V7QfhfkZOGDhbrUDyX8kghkmi
         Xx09ol7nuWKb86+i6eNhYZdH9/hWtQe3GaN9HQbV3pzWcLK0oJBHbBGYk1IJLLRW0q5O
         ZuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706702715; x=1707307515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYWwoGW5tnFj1vY5dj8PEXtyvWyXgtkfLVtW7dbTGJ0=;
        b=H78z6y8uLr3jdFpFqJqaxhFP5TXyEQpRjLivxgDI95MwlREvjDHaRYUTddN3WLsmYd
         QVQQFOhwJGqvbvaNG+/jrUjn48PkWO56onnNujNhNwJ3D/QHNzCPOLH/kF48CGm+j1m/
         Q/Iovrsw64L2SAGrupenazp1XlCYlSCNupwUfX7KHm6Mlef1WY/P/qIxhhkE+W2yQSTY
         ARA6Sx/J3ZGMMFLR5+ynNXP7xyprrIXtAdT54tGEGREg1NjyVtDE9WYHDOlOqXTAcx7m
         +lbmCl2tCAa9rj4eRYFIl9JoKy0bYQu4m2J8BsTVmYUisg3HjhEpJmyA3Wqx6vKrY2MD
         7izg==
X-Gm-Message-State: AOJu0YwTrc8pLCtExVyvlZlp/IFoeXU5q4fkO9kNK8h0f10ehb+VDCme
	xBeQuiboP0uwxGsQzc9tpq3APgEEL4Os5H5iAiM/VHlq+fC/zIMfxLS+ClEN5u0=
X-Google-Smtp-Source: AGHT+IG3qsVaJ7eMMfqslnQzBz0EU6jsRzTYo1vpVN8ZA8BUHXm2UYkzNSECaYwSySyKb9q29S2vig==
X-Received: by 2002:a17:906:289b:b0:a35:a7ba:c647 with SMTP id o27-20020a170906289b00b00a35a7bac647mr1173472ejd.3.1706702715161;
        Wed, 31 Jan 2024 04:05:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVCfavWEXZaXtbMyQG34FsXmuzymq5zKrumrzpsCQiALJMXvkof9CSXI1jtPbHQVWhJlDVhTw9ag6wIj//v8y/MWbh0pevPQjGjqLyHcbmMEWBCrukkwrXP9iexh5aNuaOg7P2/iSPeZhpG0esTuW5L+ZKNblpw+O1MzBR9O85hSwg8mAbxHssBeiDWLPwVRq9jHtsqYeVa9fNbMxEwjbcN+jGnj2Oht1HlWid6qf/ttH+tvXl4zaRY3LATDUbUmDJLc36HX/NBy3BUN+W0tAwBNgzg
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id vv4-20020a170907a68400b00a3633ae53dcsm1467683ejc.52.2024.01.31.04.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:05:14 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 2/3] RISC-V: paravirt: Use correct restricted types
Date: Wed, 31 Jan 2024 13:05:14 +0100
Message-ID: <20240131120511.200338-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131120511.200338-5-ajones@ventanamicro.com>
References: <20240131120511.200338-5-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_040516_956050_AA96E1F0 
X-CRM114-Status: GOOD (  10.55  )
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

__le32 and __le64 types should be used with le32_to_cpu() and
le64_to_cpu(), as sparse helpfully points out.

Fixes: fdf68acccfc6 ("RISC-V: paravirt: Implement steal-time support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401011933.hL9zqmKo-lkp@intel.com/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/paravirt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 15c5d4048db5..0d6225fd3194 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -91,8 +91,8 @@ static int pv_time_cpu_down_prepare(unsigned int cpu)
 static u64 pv_time_steal_clock(int cpu)
 {
 	struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
-	u32 sequence;
-	u64 steal;
+	__le32 sequence;
+	__le64 steal;
 
 	/*
 	 * Check the sequence field before and after reading the steal
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
