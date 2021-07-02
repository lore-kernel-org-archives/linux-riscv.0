Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79826C11F6A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 12:32:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3D5613F5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 12:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D3D5613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wv7k4152qxCAv/rSZgIOOehfIqUgDgDLOUQoWrz1QTA=; b=PW92+J3hXFcOzQ
	hfaWGl5q8bTwsWFoCTwFRCtXey7a98nygmwo8+nGrLm7QgcagIGlG4UiszTHMVc8iw3f1QpgUmR12
	xspqGEMjZTJ3Zz8Z1AYc5SRL7xI+Ly3pan04TUduDgjL4/vXkO+piWATZt1pV9s4Wo2j7STPaOIe7
	3nlbgW6niBxCFOPFKsQgC4ukMsuxTWiGVrw0P2lXAX+8qkvIX1FmKE/Vfr2itgP4e3aZFSUq+xGgg
	cfBQcxLvDlgYTMLMgRdUGm6LGBPXwNkitIZZTEIdx1cHwrIP+gt60O3HImXpCpIGul/HyYOBUD28c
	568h31Tr6ZG+wJ0nKnoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzIL0-002ytK-MX; Fri, 02 Jul 2021 12:32:06 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzIKx-002ysI-C8
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 12:32:05 +0000
Received: by mail-ej1-f50.google.com with SMTP id c17so15807561ejk.13
 for <linux-riscv@lists.infradead.org>; Fri, 02 Jul 2021 05:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5kxCwLjDiZox2uq7lbOwELumWKVYmpQy6VlL3NaLiI8=;
 b=lujHOQ8NNbSkzZ1bdDGlLD3V/LrLy4kWGhJ0vmfz6KZo8SIlEoXhYlkTeWDdTnKpCE
 47nVZAo+n9HbiwcXD8g3ah0BH5riNGLDDSeJCI1atJ0xi4ziN95vWulzCBUbjIE8Ix43
 Vw0IEmrlr/LonNqceKL86FevpALjz2MhVV/4MhAamKlAyuP8EcX9jbQi0xMB9V3MMAd5
 Q7tMkrXoBQpiT/P2c5vHEkMckbrmurpqQBU1dqSUIInHSllX4Vt4qbA9XuY+J0q1rtP4
 NWQoVDQ+0hJ46/NjMT13zo4NL9P7VScUzxqgFbjP7/7qM9vP+gx6DE0J0b4vSXwkL9zP
 1hMg==
X-Gm-Message-State: AOAM5337sgdQ53iO+bAIwVatpwprywPxLDxtWym0M5OQuiDygbuChong
 mFpU8EvEMCuVzyyYLYDQ27U=
X-Google-Smtp-Source: ABdhPJwp+TxUnuAhBmoh5g26KXPKy156z5RfynaIIigiBUmM5ov3S56JthwVXNRlRsSXFm3cdpoXUg==
X-Received: by 2002:a17:907:2cc7:: with SMTP id
 hg7mr4735818ejc.360.1625229120306; 
 Fri, 02 Jul 2021 05:32:00 -0700 (PDT)
Received: from msft-t490s.fritz.box
 (host-80-182-89-242.retail.telecomitalia.it. [80.182.89.242])
 by smtp.gmail.com with ESMTPSA id c3sm1290189edy.0.2021.07.02.05.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:31:59 -0700 (PDT)
From: Matteo Croce <mcroce@linux.microsoft.com>
To: linux-kernel@vger.kernel.org, Nick Kossifidis <mick@ics.forth.gr>,
 Guo Ren <guoren@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 David Laight <David.Laight@aculab.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@beagleboard.org>
Cc: linux-arch@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] lib/string: optimized mem* functions
Date: Fri,  2 Jul 2021 14:31:50 +0200
Message-Id: <20210702123153.14093-1-mcroce@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_053203_463247_C832F887 
X-CRM114-Status: UNSURE (   8.58  )
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

These are the performances of memcpy() and memset() of a RISC-V machine
on a 32 mbyte buffer:

memcpy:
original aligned:	 75 Mb/s
original unaligned:	 75 Mb/s
new aligned:		114 Mb/s
new unaligned:		107 Mb/s

memset:
original aligned:	140 Mb/s
original unaligned:	140 Mb/s
new aligned:		241 Mb/s
new unaligned:		241 Mb/s

The size increase is negligible:

$ scripts/bloat-o-meter vmlinux.orig vmlinux
add/remove: 0/0 grow/shrink: 4/1 up/down: 427/-6 (421)
Function                                     old     new   delta
memcpy                                        29     351    +322
memset                                        29     117     +88
strlcat                                       68      78     +10
strlcpy                                       50      57      +7
memmove                                       56      50      -6
Total: Before=8556964, After=8557385, chg +0.00%

These functions will be used for RISC-V initially.

[1] https://lore.kernel.org/linux-riscv/20210617152754.17960-1-mcroce@linux.microsoft.com/

Matteo Croce (3):
  lib/string: optimized memcpy
  lib/string: optimized memmove
  lib/string: optimized memset

 lib/string.c | 130 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 113 insertions(+), 17 deletions(-)

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
