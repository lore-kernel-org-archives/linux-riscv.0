Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ED8C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 02:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0XGtmMlB2iAhKryFGG2KXpWfCpk9vti24gRWwuyN28=; b=0pqtk3+RjmgMBg
	cl9NEIjV7lV55TnvvwfeZFKa7VdOhs+o+Y30e+aQhS5CcpU3uVPYJ4Sm8V7RODyxmioossF9wTqqr
	o6pPQwPSW3S2DbTpwEa+Qd5CGr7peI0t33bE/Ki+mqMGOj6LtQHVxsMMIL7uP0gIkFyM5wMI48ANb
	Fupl5jGIuBwg/BYDINJViV/IGBVdYokM9DtTSdIS8vz0lr0zCJVNyI+zkjg0JJvVgsradfunX1O/X
	JPsCto0vc12oFWPbu/FBHbLwRP6rd3/uBaKedk04Cs2uJxMpFPFr3EtT9F3ysj93ypNn56BA0sofS
	KIFDEydgNPUFlMi/ilEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jsS-008Ktp-5a; Wed, 07 Dec 2022 02:09:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jsN-008KjD-FV
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 02:09:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id x66so16272748pfx.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Dec 2022 18:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ns0eTQouAgH+km5muBjoCUd0YRAGLEA3FGQp8yziwmI=;
        b=f+Awq5bvZpVPJ3+6O8M4NAoZsCA7BFZEsIguPqVOq64GfEFhgSu/7DNqaGd+XN4+Om
         cBN/qKg6d/20zkB58n1Z9LXorXC1Y1Jdc07wVt5UvJK6truqY76U3yIQo6mUs5quzmTu
         c8iqARQqK1GHKxD/ejelnnJn4deDwSTlRwlZYIYsbnI3TeJELNY7f+uCjfuTe1nRVqTD
         1Q9IwuhK4FAslVBsQsrVE8yBONovQjXnNPFlLt4CP1ZSddZKYKCe5MOMRUdjV8urvh+Q
         JYTN9mTFG3IP8GES7jvrE/dCfzuV6x4eSLoTkvb0AIRBod8yZnTCg+WBFqb7GKt4d7Bl
         Noww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ns0eTQouAgH+km5muBjoCUd0YRAGLEA3FGQp8yziwmI=;
        b=Hao9Ezp7LMKKdy7FmY4kRC604DvFM+lUcTHQUHwFB6NirZiF68DUWGx1DUZSib5Kh2
         9F3OZ3Y8EKHIMWdB03kpEwxMTWg0risIlyi75xxoia5gD35q9U3LrpWi+6/Zlu1AOq2w
         QySWucMVVTpMLjf+afTJGfH8LZoXX9TzM5Q8I9RV7m8Gh9Fm5dmcGSn+C+YzLor4E8os
         OuySX8uaoypQHNwfwxm6kEz7IIhwWK6xZEc6NMVxzp/JnY1+dN665arWGnWf5ndzWgAi
         a+MKrxBgpxFl1qbio54Wy4Fk5XaEPGIUA6XY7WON0h/UOx6oSXbm0Mj0KCs1xfhqGZqE
         eYYA==
X-Gm-Message-State: ANoB5pml9o0kheiIBYu5XhYF/i9jQBRKBgdki798Mq41aBAf5fpFdJq/
	Wbki2tWdLEkQfg2AfXwTYXQv8g==
X-Google-Smtp-Source: AA0mqf6667QC8YONzlNMlg+FuzFNoED+a0mt7o+fUYPzh2YH89X49CpEsgDKOixlBCPqWgTY5b1grQ==
X-Received: by 2002:a05:6a02:187:b0:46b:26a6:51bc with SMTP id bj7-20020a056a02018700b0046b26a651bcmr80309735pgb.204.1670378973379;
        Tue, 06 Dec 2022 18:09:33 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id z18-20020a170903019200b00188fadb71ecsm13348973plg.16.2022.12.06.18.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 18:09:33 -0800 (PST)
Subject: [PATCH v3 1/4] Documentation: RISC-V: Fix a typo in patch-acceptance
Date: Tue,  6 Dec 2022 18:08:12 -0800
Message-Id: <20221207020815.16214-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207020815.16214-1-palmer@rivosinc.com>
References: <20221207020815.16214-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Anup Patel <anup@brainfault.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_180935_586782_E75D1B9E 
X-CRM114-Status: GOOD (  11.93  )
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

I just stumbled on this when modifying the docs.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/patch-acceptance.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index dfe0ac5624fb..5da6f9b273d6 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -29,7 +29,7 @@ their own custom extensions.  These custom extensions aren't required
 to go through any review or ratification process by the RISC-V
 Foundation.  To avoid the maintenance complexity and potential
 performance impact of adding kernel code for implementor-specific
-RISC-V extensions, we'll only to accept patches for extensions that
+RISC-V extensions, we'll only accept patches for extensions that
 have been officially frozen or ratified by the RISC-V Foundation.
 (Implementors, may, of course, maintain their own Linux kernel trees
 containing code for any custom extensions that they wish.)
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
