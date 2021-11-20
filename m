Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E86AC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 14:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oJ7cz75wQ19OPdEm8yTMaPVUN1+HR/c8xi1+lgeazow=; b=Ho/pYUdiXaxHvU
	OZqaHrFrSEccTaLGqRViucUpTMGlM/jGH+pcxxvz3jN8tSxRfxPIND2NshrVECs9g9XAs7zOPMvjn
	qadiZMXCejVBkhJ5qqP4OOmwDH387r8u2/5c1C2HXyJvR2RTLztCb9aJ92qP/tHUcr5l2RhoguyK3
	6xTNNKj/L9ZAu4i2hyeAu2j+SS1jMq+yrPajOyQ8a2vxFILLe05LrzoaQvYTDRdju6JxmgOg5Oe9/
	unBooFaZJBz8h1EHPq3dbK2ksst05qVymBPNdIJ8Xdy/6eOiRb4E9jfeePmOhWQnFQn2u7R1lJYvr
	+VfAkw/8zaqloDdzE70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moRKL-00CcXC-Vh; Sat, 20 Nov 2021 14:26:49 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moRKJ-00CcWs-5G
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 14:26:48 +0000
Received: by mail-qt1-x82d.google.com with SMTP id 8so12259427qtx.5
 for <linux-riscv@lists.infradead.org>; Sat, 20 Nov 2021 06:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lbPAF5PhHu+WLoLmFEqFobNIzyMMm9A+35j86/BOV54=;
 b=qaGdxAUuWb5wqManVkizNRuXbpsKvEafzYwBa81kC39VUeUZrp0vuoUgC3XQCHrPi9
 8NDHSH31mgCmE8kIA4crTpVqyVY6yWq5vkJLNGphJB/w+c3W6gDF7ZCZYoMYq4U6oMq1
 Rn+ao9gez5ixfTObpJxFLpNMH/q6t+wHk4D6PwW82AoZrfBg0GWxgqyJaIQuIfUlHykp
 SZNzPbSSGsnbm1fsE11enwUwL/cNdpDtD/1XU5DGCYHG4aWqM5Qn7DXgJ76PeT9yiR3H
 6a/ZnF0czFisr/eHBx5aKvxLQ1kAXVKKskasD0UUnPR5zlTjaoXIlbUAi4/K7R3OG9IY
 o2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lbPAF5PhHu+WLoLmFEqFobNIzyMMm9A+35j86/BOV54=;
 b=RbXBQ6Y5d1xFUPDG6Y4YYypSlp73n2X57Muw91MrfqpZefayzppN3UXm8Lg2IZPyej
 U4i/WYd5i3vX6mRCeAeU0aojl3b2zQdFgBOB1Tkkr/zhkYWfh2f1ia3/3b0aBANIj95p
 1W4iCpkJ09QzzqV55Jcx0MhP32CC84DLtF3SImiqoExImh7rOuPm6QBR8PJUkQFfvbRW
 gp0SeQQiixk73gx/MNJFm9YfkqGVvbXLTgosxIfz/fSvuzlK62VaPfumyyD10wBqpSTP
 VxMwmV4Fy/5IH7oQia61oA2YDVmJnrE0XCtSS81hWVYe3rhB07pzgZqp17G1ktS6VIbl
 ULjQ==
X-Gm-Message-State: AOAM533doPqT38VEnqdH9R9N1sIoJqjfDiTc5Jrn/djgQKmrOW6fMTpt
 k0CwDQESxANtOghd/www9+Y=
X-Google-Smtp-Source: ABdhPJzrrklHGSaVceaznpMqJR8e7IXo9TD4JQzoMcjj0DKZZtkDQFNo/1M/5HdVSeZkRs8spNAsUw==
X-Received: by 2002:a05:622a:7:: with SMTP id x7mr15210805qtw.68.1637418405151; 
 Sat, 20 Nov 2021 06:26:45 -0800 (PST)
Received: from dan-XPS-15-9570.lan
 (2603-6080-6a07-6dd1-7d72-c7d3-28b5-a45c.res6.spectrum.com.
 [2603:6080:6a07:6dd1:7d72:c7d3:28b5:a45c])
 by smtp.gmail.com with ESMTPSA id bp38sm1582545qkb.66.2021.11.20.06.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 06:26:44 -0800 (PST)
From: hasheddan <georgedanielmangum@gmail.com>
To: 
Cc: georgedanielmangum@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Vitaly Wool <vitaly.wool@konsulko.com>,
 Anup Patel <anup.patel@wdc.com>, Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Chen Lu <181250012@smail.nju.edu.cn>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv/head: fix misspelling of guaranteed
Date: Sat, 20 Nov 2021 09:26:05 -0500
Message-Id: <20211120142608.2068809-1-georgedanielmangum@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_062647_261764_EB74B47B 
X-CRM114-Status: GOOD (  10.83  )
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

Fixes misspelling of guaranteed in comment describing why fetching fence
is guaranteed to work when switching to kernel page tables.

Signed-off-by: hasheddan <georgedanielmangum@gmail.com>
---
 arch/riscv/kernel/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index f52f01ecbeea..469eccd3780f 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -135,7 +135,7 @@ relocate:
 	/*
 	 * Switch to kernel page tables.  A full fence is necessary in order to
 	 * avoid using the trampoline translations, which are only correct for
-	 * the first superpage.  Fetching the fence is guarnteed to work
+	 * the first superpage.  Fetching the fence is guaranteed to work
 	 * because that first superpage is translated the same way.
 	 */
 	csrw CSR_SATP, a2
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
