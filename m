Return-Path: <SRS0=TyRV=LT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEBDC49EAB
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 01:02:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CF48613C7
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 01:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CF48613C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tBiMecO/SbVwvLib54raflOCpJ88eHYmOjP/r1gOyNM=; b=EDO9ML3ErmDu/8
	vGYRFA3frmj/Tb1KgepzgREGSrw1kjfnDLtsRaC7fpXg8msVeJuJhiW8PjtMnNE8eOH/VW38Ckyyo
	hUC56aL+gNJe/kHRrGypsKyGboYpP3Ltypy3m7xy+rV+QtR2ufUZoNzn29fjuM/UTQNH2tsFhbTLh
	nRWglYXK483Zte2Ssq3mywaFxubrpWLn0ZayGFZoazL3Ho7kqQIwmOZCX1og5dc/GfqCinfBb7gfW
	baJTZufjkYzcN5Jq2h9U+PTPlOx5dJn5nF9luWhYsUxFcYlBaT9DnfBeyWcSTUFLdJvqieOcZleJs
	tO6oGMiVBQBn0QIn/wYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwaEX-00Gvnx-2s; Fri, 25 Jun 2021 01:02:13 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwaET-00GvmM-T7
 for linux-riscv@lists.infradead.org; Fri, 25 Jun 2021 01:02:11 +0000
Received: by mail-ej1-f42.google.com with SMTP id hc16so12281254ejc.12
 for <linux-riscv@lists.infradead.org>; Thu, 24 Jun 2021 18:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QdYef+EeqjZUHJEkYZovIoYwvlil/tVir3JF22p9drE=;
 b=sqS5q+l/NRqWRW3H1NkrwhOCzL9s1axYqMFAVVaHkjyFiBsWjyAu9ezaf8+4fE7L6y
 CNB9IcymlTnSjnT1fEw6ElO9B9mRi5xutmmV1H5vGaP6L9cFQgjLFmU2KHbOBpwvP2xK
 f1pcdWlYuy/tnMfXUsF+0siXFBdb75tsLGrrBDPN/l4ktAbHqsnb02ZhDacpwbjIRXyR
 jXyAk1xfCKKKt3IcCYwA0OpPU8FEvck6BI1Eago+Xzq9MSk0tMHjtdIaRzPhUkL3TmUJ
 XosMnA7VrgDMIm9NxyjUjiOeeimhIbMPSQCTPAAtChXvGDF3hM+rAvTrlf++cY9lpz+w
 /CrA==
X-Gm-Message-State: AOAM530NCf0mWV/dD7EnzdpjzxaxXaYyy+0D3v0yAnVB3LsY6ib8vqS4
 mShQxEuVOfazIVOuweZnP9M=
X-Google-Smtp-Source: ABdhPJwXo0l8Ri22N8iM69Xf6x6QIaI5Eo8yFPOt6JHftyHB+BG7uO7b06nNrMu9DnEZSSyVa0ApeA==
X-Received: by 2002:a17:906:590a:: with SMTP id
 h10mr7904079ejq.346.1624582924279; 
 Thu, 24 Jun 2021 18:02:04 -0700 (PDT)
Received: from msft-t490s.home (host-95-251-17-240.retail.telecomitalia.it.
 [95.251.17.240])
 by smtp.gmail.com with ESMTPSA id yc29sm1921909ejb.106.2021.06.24.18.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 18:02:03 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-kernel@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>,
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 David Laight <David.Laight@aculab.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>
Cc: linux-arch@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] lib/string: optimized mem* functions
Date: Fri, 25 Jun 2021 03:01:57 +0200
Message-Id: <20210625010200.362755-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_180209_966885_A19D800A 
X-CRM114-Status: UNSURE (   7.58  )
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

Rewrite the generic mem{cpy,move,set} so that memory is accessed with
the widest size possible, but without doing unaligned accesses.

This was originally posted as C string functions for RISC-V[1], but as
there was no specific RISC-V code, it was proposed for the generic
lib/string.c implementation.

Tested on RISC-V and on x86_64 by undefining __HAVE_ARCH_MEM{CPY,SET,MOVE}
and HAVE_EFFICIENT_UNALIGNED_ACCESS.

Further testing on big endian machines will be appreciated, as I don't
have such hardware at the moment.

[1] https://lore.kernel.org/linux-riscv/20210617152754.17960-1-mcroce@linux.microsoft.com/

Matteo Croce (3):
  lib/string: optimized memcpy
  lib/string: optimized memmove
  lib/string: optimized memset

 lib/string.c | 129 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 112 insertions(+), 17 deletions(-)

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
