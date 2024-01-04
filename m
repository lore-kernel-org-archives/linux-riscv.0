Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41522C47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 19:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CqNFuL/sekq3Gotzbvbpl1IFZqsQ4+fws1h5WOd6xNE=; b=2ThHWvWpcY0gaS
	TMQzsLmxUsy2jriLbdfCdHlIfb1MHnkiiJAANSxsRMT/meyvc8pe/MV08tNE5HspZ/d2KHKVQ52bg
	oRGg5pf2+0nukFQsCEAVq8KEThlpBlSc2UZ7opaVxcXaMMJrgUq/KRejql7dyo1GriKh0MEeKeJJ4
	ZG8PWD5//QSf3CIrtCKWpSlWHJz0VM6L/6dJkSRpQ9jnncaiv8e5dWajqvgyDzw5r3sEw2++ijCc+
	m5ZN3NFeWh6gRV22/m4KhfuefkoLmuvdIucpDXcsd1CPFAxalriArv0WmndNFEyMgfih09b500P3o
	f4wb/AYRlgmF8B2tDl8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTcN-00F72u-2p;
	Thu, 04 Jan 2024 19:43:03 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTcK-00F71P-2G
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 19:43:02 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-36066190a99so3253975ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 11:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704397375; x=1705002175; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZ4NebEk/v8RtkZO7csT64Y6aHb7A5Z83OOo99KtSl4=;
        b=m6kRztunt0ED8DOdBWm+UwHM2LbnmO1USFYIA85SQgxkOWlVbXjtVgVIpqMmH+RLKU
         hdabr0X4gYhbNzp6RTAs0rljgqMHORlu3cOUXid3xsuOHw2HhW3/82rSWHdmE6TGxJFR
         VzG/peLgidjcFBUnt1GNzmJv4n5YPHZ9+eCrnVJf74Ct7cVHcFz37lXvDLNOYqUKBA6h
         LrI8rrj3dx9MdTp0ofyTa3EcM62WHsVhRJov0QofOojjDILLNQiIsc71j9+cUnH9F3lh
         Y3RAxjRr91OCtdG35808JU3rBYvL//mEkIX05NRg+utI/eqfVaoEAkBkWZfc/nqggdTL
         nLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704397375; x=1705002175;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZ4NebEk/v8RtkZO7csT64Y6aHb7A5Z83OOo99KtSl4=;
        b=Iop3PTwIVeYT8je1yqLhmNOlhzwea26TdEmrQkFrmJMFvTA+xVvz8Cm/uJKLgCQpnt
         HAQVzM6QKcFr9C3nKr3CwRi1lzOImhc60BGVvQdV1RuMPhOQRjs0o3oeTFP/Np93coxR
         0iv037BDMpui+DGMU0p+6Str9gHIl+X/MS9/Wz0Iez8LOyHP827b4vPtRE16BVftTyYb
         YbfHbNJB2PmxMWE+McElkQwHpU/Oj5rNqYEitH7tCt1TgCKbM1YR7KK/a433MpKiCliE
         X+M1VUGh0s+2jJysrEqH5PAqZ2F2vzxDVyoVI3m/DnIe1W+5YZ+h2a2HaA164b+Qa0jf
         8SNg==
X-Gm-Message-State: AOJu0YyWrzjlKiG1OpvGWPkVDyQ+HygPVPx750fuyxUiA7SZEG5Yh5l4
	1t3TuFPVc30NY5b7xn7R2GRw2ah77WhATA==
X-Google-Smtp-Source: AGHT+IHsElya+8s71eEn1wxhXEYSAasDbnd+VBq9vmycNipi4gm/93N0ihC5hlaYRI+LIQoFk7OxiQ==
X-Received: by 2002:a05:6e02:19c9:b0:35f:e71f:4c60 with SMTP id r9-20020a056e0219c900b0035fe71f4c60mr1114054ill.13.1704397375175;
        Thu, 04 Jan 2024 11:42:55 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o10-20020a92daca000000b0035d0da89a0asm19606ilq.6.2024.01.04.11.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 11:42:54 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 0/3] riscv: modules: Fix module loading error handling
Date: Thu, 04 Jan 2024 11:42:46 -0800
Message-Id: <20240104-module_loading_fix-v3-0-a71f8de6ce0f@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADcKl2UC/33NTQrCMBCG4atI1kaS6Y/GlfcQKWkytgNtIokGp
 fTupgU3Ii7fD+aZiUUMhJEdNxMLmCiSdzmK7YaZXrsOOdncDAQUEmTBR28fAzaD15Zc11zpyQt
 taluiPkhQLB/eAuZ5Rc+X3D3Fuw+v9UeSy/qXS5JLbrVq90aBtlidAiUfyZmd8SNbxAQfpRRS/
 FaACw4KWlmLqgKjvpR5nt9RWVTg/QAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>, 
 Julia Lawall <julia.lawall@inria.fr>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704397374; l=1029;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=6NGr/DoKC3/yzJo7z44jpZYiAVYTGaXxLfBI12gIXoY=;
 b=4RPWQTDdkNAFI4p28vauTpKQftHTQB59nLae7uu4QHL1PR/S3LNN1lSC8AXI9pvl+rvxuasHi
 M9GLKbADcLKCXc1VW8mARqzk+s+jdiIP5Fk0HhmFkG5mpku3yh9YCqw
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_114300_769669_452E3814 
X-CRM114-Status: UNSURE (   6.26  )
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

When modules are loaded while there is not ample allocatable memory,
there was previously not proper error handling. This series fixes a
use-after-free error and a different issue that caused a non graceful
exit after memory was not properly allocated.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v3:
- Drop patch using do-while
- Link to v2: https://lore.kernel.org/r/20240103-module_loading_fix-v2-0-292b160552c9@rivosinc.com

Changes in v2:
- Split changes across multiple patches
- Link to v1: https://lore.kernel.org/r/20231213-module_loading_fix-v1-1-da9b7c92ade5@rivosinc.com

---
Charlie Jenkins (3):
      riscv: Fix module loading free order
      riscv: Correctly free relocation hashtable on error
      riscv: Fix relocation_hashtable size

 arch/riscv/kernel/module.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
---
base-commit: a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
change-id: 20231213-module_loading_fix-3ac6d4ea8129
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
