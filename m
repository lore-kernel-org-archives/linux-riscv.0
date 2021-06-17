Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA33C2B9F4
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 15:28:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B8836120A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 15:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B8836120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LBy+o0QfLIJ9Rc7c9wQFNJq/yc6ZRC4LfjXuUDgAZo8=; b=clxrIHUYDriBf4
	IvzuSchMogMGKemaGV5eh179B32SFny6HYWX0jXJTLI/EuFRtsayaWO4EfGC2+bu7XAOwazopLVJe
	aFDlbStcNpQeEgJjV2QsDnjUwfaQQKZPKxyrz9X8hdE7LXkOhXngOt7u8zEpvkWh+dn6ImlCQ692t
	G8iOSO2l83zo8GbETVJtjTccyr5dnOUOSqWUP848lzgMAWUZ1zds0r8Dd1NCLGxgC3tBEESVMx+th
	gmMJ4XPUwNTKE9tuO0eNyJdt5eMuVAxBL2GyBJppkoyNRBMPkqqbvc6ZYaDkgcI6MqKBXa/3dvHbE
	VprN9/LmUAMnN4c6RyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lttwF-00AvJV-H4; Thu, 17 Jun 2021 15:28:15 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lttw3-00AvG9-Bb
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 15:28:04 +0000
Received: by mail-ed1-f46.google.com with SMTP id s15so4545835edt.13
 for <linux-riscv@lists.infradead.org>; Thu, 17 Jun 2021 08:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/itsTxOH83bOMIRckT66tyt/S9hpeX8jx9OaBl4TWV0=;
 b=HZQA/wQAli+SWLJKFU/tB93ShG3y12i0bq2GmbUr+yXOnTsBbAWRaNb824WwFYs8dR
 qOJ96CCZHhQzuBnR4H0FTfz6ZbJzon7WUT3nJ1WAqUybv6ZePYf6fEyIh5QF2lMGkAD5
 XYESfV5+idJxjYpoL/9UlNJBIHAEbiSV6m85n/CxFAvdKRe3rB7Q7TeLmasdRVIxhE4g
 nkYoEwlAmyKn3cffnqIpJNjaR+bt65c64mckRZNOaev8bwavjSxhmkQgklhoJ4BL9n6e
 rdmaumLkr5PheMhGSTXtu2s9Yl+tVxH5+4RdL7drLOX+m2jJlbngSic4Gbpb0QyYHfMx
 nGFQ==
X-Gm-Message-State: AOAM5318L4WIdqzaxpgEDmL2s2yRT7nMHG0euX0sWnJI4TXd2aRh+b2S
 mDAYoBzZ8ZYFGZg8qF9xRkzJJST0yCDGag==
X-Google-Smtp-Source: ABdhPJxyh7aN+l7/mCAyGUcuIcJt4RJVaR6/rIZKwCDs8R4EFI26qFf9plfyF1MS+s2K9o3DmCDvAw==
X-Received: by 2002:a05:6402:1216:: with SMTP id
 c22mr7314917edw.36.1623943677554; 
 Thu, 17 Jun 2021 08:27:57 -0700 (PDT)
Received: from msft-t490s.teknoraver.net
 (net-37-119-128-179.cust.vodafonedsl.it. [37.119.128.179])
 by smtp.gmail.com with ESMTPSA id g11sm4497850edz.12.2021.06.17.08.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:27:56 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 0/3] riscv: optimized mem* functions
Date: Thu, 17 Jun 2021 17:27:51 +0200
Message-Id: <20210617152754.17960-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_082803_440440_282A9D3E 
X-CRM114-Status: UNSURE (   9.88  )
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
 arch/riscv/lib/string.c         | 153 ++++++++++++++++++++++++++++++++
 8 files changed, 163 insertions(+), 315 deletions(-)
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
