Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923FAC48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 18:51:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50917611EE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 18:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50917611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3tgk1F7WwFFzpBZjM9Jfwhp3OZD/y8vuXfDeUJ5xMVE=; b=qzgIfBQ1Q1sz+h
	ohhZmnpr2CAMUymdYxiDUPJaMawuf/A8106vggkE86KScMe36rLni8AWWRw5v+0fEA3GGKxyL6rx4
	S3gQqYAiFt31083QC9+QrTe972o+zMgXTUldKybM0zOoka2LyXujJtVyt9H1UeOW7P/ejJZUKRlfh
	I9YzWF+lQe5bC5DV+IO99XgcTtgHN1/ENUjNlK5I6PEYklKvOYODwnPgZ8WI2cOHMmYkC7pA4p2Ky
	tVRnz3EiruHW5Fo3u0YuKKMcZXek9GC7lNPNF3cEulwS2TtDklfWJG0E0K2b70/1wjsNuQieWo+v1
	4AhCkA1Bl9v3l1Tc3wng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltE9W-002FFQ-3a; Tue, 15 Jun 2021 18:51:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Pn-000DwX-67
 for linux-riscv@bombadil.infradead.org; Tue, 15 Jun 2021 13:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=sQa/CyUV3AEwC/LA7ChZSvZVCCa5fmmDbkR0hhf+KY0=; b=b9jOFjq+UaiZnowvXy1RJOXMon
 +rZGZod2npQAq6Mz5CizWHATRdoC6MrhXjhxjm4egNi0kPCeGHVuYSYQNNG65hM30e6nUQBMZ/prY
 lheSyKPYrOZm29hXBORfLqYKlLEeKEJKw6aBhJ+exqm1VkEo2dPgFPPbgsDJraPEvIffEJ/0xZz9b
 H5/QuqZrZghF+N/t3wcnBuLEC213t5X5KP+pz7uIGFg8sKFzc+omIYNTBz2lGd5Cvrg9h8Oqp/Bna
 qzpAWqlYWwhQbslDRMVaM/kB9sbsISYrr0yYV+5gdu0meYZEl4uci3FMTfB5YoWI4FHaDucHK/4kF
 65y+wxXQ==;
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsyzD-007GvM-0Q
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 02:39:39 +0000
Received: by mail-ej1-f53.google.com with SMTP id h24so19865586ejy.2
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 19:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sQa/CyUV3AEwC/LA7ChZSvZVCCa5fmmDbkR0hhf+KY0=;
 b=NJY27g/P6ZzZARED9Fw5yBYIFhlSu2hwbuHoYgNr/r4j9fCVpTj2eUOwKL9MOIKnPB
 6ISekBQrV1IDvCyzUtFVlbe8elMYeTWT8Zqvflf2irKDd+/BfR6QbfrPvv3wgmg5UBoZ
 LJkpddcUW65jLvQMbIZo1X8cNQ8lQzPqU40324KYZpFH5NEexRlBt+ASBTf3FKCk51QZ
 xHIkHzqJpuVhkwehQbolP8lgecbIK4G+052Iw8EHMC4oNnE1TujQdkHe+8Z9XRAlxLip
 TiMSujkSafvuB+C0sMMVht9QUguEBrIX7sw/cg+9B+cauIQ1/Aj8/7XOhyzs7/BkepTH
 k/3A==
X-Gm-Message-State: AOAM530cJ8LiXkzvIdJvrgVwbNNoWd4MarDFIU2TP1Uqh/grzETBQS4H
 yyV4ponQKLsobCAtlOfEbBx8gij65Q7swA==
X-Google-Smtp-Source: ABdhPJyIWHb5QFeN5xkFSB8wE3IB4UlFXlAqqFnvUJIA5oeI15EtAWJUgoa8IlEkAJToCofdLzwVJw==
X-Received: by 2002:a17:906:264c:: with SMTP id
 i12mr18194532ejc.101.1623724776230; 
 Mon, 14 Jun 2021 19:39:36 -0700 (PDT)
Received: from msft-t490s.teknoraver.net
 (net-37-119-128-179.cust.vodafonedsl.it. [37.119.128.179])
 by smtp.gmail.com with ESMTPSA id cn25sm834966edb.69.2021.06.14.19.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 19:39:35 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH 0/3] riscv: optimized mem* functions
Date: Tue, 15 Jun 2021 04:38:09 +0200
Message-Id: <20210615023812.50885-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_033937_969156_D86169F1 
X-CRM114-Status: UNSURE (   8.82  )
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

From: Matteo Croce <mcroce@microsoft.com>

Replace the assembly mem{cpy,move,set} with C equivalent.

Try to access RAM with the largest bit width possible, but without
doing unaligned accesses.

Tested on a BeagleV Starlight with a SiFive U74 core, where the
improvement is noticeable.

Matteo Croce (3):
  riscv: optimized memcpy
  riscv: optimized memmove
  riscv: optimized memset

 arch/riscv/include/asm/string.h |  18 ++--
 arch/riscv/kernel/Makefile      |   1 -
 arch/riscv/kernel/riscv_ksyms.c |  17 ----
 arch/riscv/lib/Makefile         |   4 +-
 arch/riscv/lib/memcpy.S         | 108 ---------------------
 arch/riscv/lib/memmove.S        |  64 -------------
 arch/riscv/lib/memset.S         | 113 ----------------------
 arch/riscv/lib/string.c         | 162 ++++++++++++++++++++++++++++++++
 8 files changed, 172 insertions(+), 315 deletions(-)
 delete mode 100644 arch/riscv/kernel/riscv_ksyms.c
 delete mode 100644 arch/riscv/lib/memcpy.S
 delete mode 100644 arch/riscv/lib/memmove.S
 delete mode 100644 arch/riscv/lib/memset.S
 create mode 100644 arch/riscv/lib/string.c

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
