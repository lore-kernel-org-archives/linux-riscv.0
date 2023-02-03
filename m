Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D536CC05027
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 15:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HKfKcGRejCoAqmMdZJH2L+a5RhPUnt50RS+mQcVfr7I=; b=kDJNQFZfMKD9cO
	P2l1jQqkS4ygs1d1g8UZEoyAAeiyQTuoEdYbpz1LIwWinbOXx9r/W9x6Y7xUn9gsBf+NfEx81lja4
	yQj1FsP7Qlsewk/MFD0PF4C1KrY7vJTVxF9PjYeoUItZsUJ9mK+NBW4aPysntYAoc1ch1CkRovGR2
	uZV5OehkgmLMYmTQ+l25YhlUd7JVvN32NJ1WvO1j/45pMPsl93J1nEYLxC4crWUzK0h6p4ghdC+jv
	vS7cPm2geMGO1FDfNgBP6kQklLISh9Fns1tyFe19O0r5/OQ8RzbQXLg4AczVPDBEB7axvO9y4+1Bc
	vvTc+l9of7RVcP/ZI8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNxyK-002jEG-3P; Fri, 03 Feb 2023 15:27:28 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNxxq-002iyf-OR
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 15:27:02 +0000
Received: by mail-ed1-x535.google.com with SMTP id z11so5533605ede.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Feb 2023 07:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5uDPgAaf4ltN96KHtMmav9HkWvirs487cQ2TnF9AIk=;
        b=nzWIF3/SiSCoHY1v6pr5O4taT20s+lp/mcMrRtFljH9KnL49+fN3owg4C3Yf0O3vjp
         fejqKHXjKio77esdW2UFOTBCpVtbcToz51dN7TT3F20gZIFTK69a8iOP/2sGBKIGz1vj
         frnwkYxjvKc1WQ1kSjsgQE9zX0TQEgj0qdbKg4YSVh7K3f02ntP/ktB0Xapc06PLhhMO
         VCjxe7wyRi9xducSpbuAkOf1+n5Xeaq7pCh/id8/keFmnuVAxuKBMTlhlqMtCB/mf2qP
         8DClM+ZkJkMw+I7BqD3FfPEiWwJsLlknMYhM0L3SULZyv3+LwVD8usJd6qqOi7VP4WPY
         IwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5uDPgAaf4ltN96KHtMmav9HkWvirs487cQ2TnF9AIk=;
        b=1kFwrnPCicFExPZ+71C0f3rnwP/b9ofbgW7S3B/fIAHvZ/w2YpD6wWtacbD70G4sTT
         4UNi0MzdLVTTkH9+UEr/W5RM+TXecG/P/OT5xDWtzs0p6S1XxDQR/lZpBFsTDFrxiWll
         ibl6qCHhb6UI/PFm5pLQcDeLEQ41BGCwNZOyASk8GBQOJU1VYhWd/xQTpa+3GzhEWQpO
         7VROQz3d8OQWY7Qk66uSsq4q/oyQTanaOMrTPw0IX8ZOenIflJgIQlKDUcQAKfbCIQ8I
         JQfpRU9saFdvVLVPCIoDXW0iqR+gHj/fSpOCGY8k5QkUwWd403x7hqZxesuTST9fZyN8
         LEcA==
X-Gm-Message-State: AO0yUKXFvUZjLOBYjo7AFLMthTBge05L42W4OCEPQq2bc+qCkYlSWEq+
	pt+bY2WeoqHqVD1tQoL5c4Ck60hWXvMMn7XHF+c=
X-Google-Smtp-Source: AK7set+Oei4hyhCjqAK610RXJB1B0hyEmArCMKw5t0HmluF/GfL3jcwtWaeRT0nJVWwUSlCr2x/XGA==
X-Received: by 2002:a05:6402:1909:b0:497:43ec:9e1d with SMTP id e9-20020a056402190900b0049743ec9e1dmr13375305edz.0.1675438014207;
        Fri, 03 Feb 2023 07:26:54 -0800 (PST)
Received: from localhost ([194.182.8.81])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709064e0200b00887a23bab85sm1487965eju.220.2023.02.03.07.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 07:26:53 -0800 (PST)
Date: Fri, 03 Feb 2023 07:26:53 -0800 (PST)
X-Google-Original-Date: Fri, 03 Feb 2023 07:26:44 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.2-rc7
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-6f088575-34c6-4eb6-a52b-5d23500cff6e@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_072659_403034_E31807CD 
X-CRM114-Status: UNSURE (   7.81  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit c1d6105869464635d8a2bcf87a43c05f4c0cfca4:

  riscv: Move call to init_cpu_topology() to later initialization stage (2023-01-25 07:20:00 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-rc7

for you to fetch changes up to 2f394c0e7d1129a35156e492bc8f445fb20f43ac:

  riscv: disable generation of unwind tables (2023-02-01 20:51:57 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.2-rc7

* A build fix to avoid static branches in cpu_relax(), which greatly
  inflates the jump tables and breaks at least
  CONFIG_CC_OPTIMIZE_FOR_SIZE=y.
* A fix for a kernel panic when probing impossible instruction
  positions.
* A fix to disable unwind tables, which are enabled by default for
  GCC-13 and result in unhandled relocations in modules.

----------------------------------------------------------------
Andreas Schwab (1):
      riscv: disable generation of unwind tables

Guo Ren (1):
      riscv: kprobe: Fixup kernel panic when probing an illegal position

Palmer Dabbelt (1):
      Merge patch "riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y"

Samuel Holland (1):
      riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y

 arch/riscv/Makefile                     |  3 +++
 arch/riscv/include/asm/hwcap.h          |  3 ---
 arch/riscv/include/asm/vdso/processor.h | 28 ++++++++++++----------------
 arch/riscv/kernel/probes/kprobes.c      | 18 ++++++++++++++++++
 4 files changed, 33 insertions(+), 19 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
