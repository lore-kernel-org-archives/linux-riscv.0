Return-Path: <SRS0=UXoG=OJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70C4C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Sep 2021 19:21:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 985B761004
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Sep 2021 19:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 985B761004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LanN1WTFF1bCCvsNbZB5xn8b4VxS6ubpl1LPX+pCOxI=; b=v7qfJIJOTfKFXo
	FbMXMXlm0iemTnUDTSmh7dhRpETjahvtyzwFPnVs+7D3c51cxBzIC9Fu3VV5kIDqwcB4FQA087MWZ
	uMzdTfpiZnO1fNVVZvBV8W87svLp8gPkG08ZYKOxhbh/h1O5wKeAd+WLtN+2P2qaSC7HAxja54sgz
	FN3H+2YEc5zbJqwaI2/hsrXUP6y4wdY6R02RGkmOjpsgy7N4nFubtI8toJ2ibtmoXel/SJAErCmyC
	+ImppDPAfzEJLQJkWuCoY8eQehGBozGn1jTELzc7x1fHTS6osh88KRoKVdJzL0D1x70+Ihar1sY/5
	py2+L6O4ZYgbwARgdc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mS2Ng-0005v6-Q7; Sun, 19 Sep 2021 19:21:40 +0000
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mS2Nd-0005u9-Ss
 for linux-riscv@lists.infradead.org; Sun, 19 Sep 2021 19:21:39 +0000
Received: by mail-ed1-f47.google.com with SMTP id v24so52077403eda.3
 for <linux-riscv@lists.infradead.org>; Sun, 19 Sep 2021 12:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YPQno8A85O4WeBnY/bkDmDISB83i8fh43dkMBVfbagg=;
 b=Vx+HTWP1OjaRVe+DBltbzLfojFOOdBHRnYpsevbxYI8izekYZHc1UOKg0txXFf14At
 8sSQs3Du2kCspVm8SCqlcij3GlTxHsbtdzk+tKwTbPgoxW9HzVz5KEVAxgWr32G0JoS0
 zLrjDrJJJkopSoZFMvL/bWULUNqBJRWAymAFSKagcrcMKoOeoZ1FScAjJwSmXHEbpeSE
 LRjdQIc/JGjyX4jqJRAyL9ny9gob+a5ushK3BnYIp8G3rhdZxmSwVgPgI29F04Skvvag
 vhut1k8WY/ugmrjufNLKBzCQ4Z+IJ3pNiq8AzvoLoHZe1DvyB8i1XJHe576FEgO7BQQH
 Wspw==
X-Gm-Message-State: AOAM530xweANeguwxiT7gZ7eGL3KVsD8eMTgQsecSchtUzFb66I+3dWT
 sz+9JKZPEoEuNrrFoXb00IBvLt0mXrPBmQ==
X-Google-Smtp-Source: ABdhPJw6bKrJh6VBPCsEdw0Z3ZJq549XyeLF8IcT+WCASbLSolRQjT+vBCfpq9w+BytaqdW8R4vjng==
X-Received: by 2002:a17:906:6dd4:: with SMTP id
 j20mr24232036ejt.316.1632079295730; 
 Sun, 19 Sep 2021 12:21:35 -0700 (PDT)
Received: from turbo.teknoraver.net (net-2-34-36-22.cust.vodafonedsl.it.
 [2.34.36.22])
 by smtp.gmail.com with ESMTPSA id 10sm5208525eju.12.2021.09.19.12.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 12:21:35 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Subject: [PATCH v4 0/3] riscv: optimized mem* functions
Date: Sun, 19 Sep 2021 21:21:01 +0200
Message-Id: <20210919192104.98592-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_122137_980722_BD647F49 
X-CRM114-Status: GOOD (  12.09  )
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

A further improvement could be to use multiple read and writes as the
assembly version was trying to do.

Tested on a BeagleV Starlight with a SiFive U74 core, where the
improvement is noticeable.

v3 -> v4:
- incorporate changes from proposed generic version:
  https://lore.kernel.org/lkml/20210617152754.17960-1-mcroce@linux.microsoft.com/

v2 -> v3:
- alias mem* to __mem* and not viceversa
- use __alias instead of a tail call

v1 -> v2:
- reduce the threshold from 64 to 16 bytes
- fix KASAN build
- optimize memset

Matteo Croce (3):
  riscv: optimized memcpy
  riscv: optimized memmove
  riscv: optimized memset

 arch/riscv/include/asm/string.h |  18 ++--
 arch/riscv/kernel/Makefile      |   1 -
 arch/riscv/kernel/riscv_ksyms.c |  17 ----
 arch/riscv/lib/Makefile         |   4 +-
 arch/riscv/lib/memcpy.S         | 108 ----------------------
 arch/riscv/lib/memmove.S        |  64 -------------
 arch/riscv/lib/memset.S         | 113 -----------------------
 arch/riscv/lib/string.c         | 154 ++++++++++++++++++++++++++++++++
 8 files changed, 164 insertions(+), 315 deletions(-)
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
