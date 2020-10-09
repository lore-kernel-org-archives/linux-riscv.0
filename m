Return-Path: <SRS0=bFkC=DQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF7AC433DF
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 17:52:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B30206B2
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 17:52:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gVU6MSYp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="XhIyavq8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9B30206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a3EPjevRKSzj30biW356W6jk1Ia5osbUgC1hsVYBDKs=; b=gVU6MSYpafZiP+h255NvUkRkYh
	00lkBNOUBuL2x+0TlE2opjSS/iQpdQ9K9JFBTyAPU1kcr/E3QEKPPIAR9gcKT/pjGNJVBaVqYyn45
	cSMLDAVOehcVDOWzdAPku1omQWb01CnfT7vx0ZRXSq5eire9wnNzNaO1LIg10aHZxBH2iheYkbGQr
	Ph7/4MFQs63ESaSSPTL8UtxmdZ2cOVWjOsXtEFnL6hdIX/9iQRlP2G0PLJkkw1BVsWNtyhWUW2qvX
	nHXpwJlfD9t3yo1k5FW3HdZeC5YZY8s5gGjq9s2iXtt5sAQkTm81VXdgVM20WIdmk8FdGptTz/USA
	BoYlF18w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQwYz-0000NG-Nh; Fri, 09 Oct 2020 17:52:17 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQwYw-0000MS-NP
 for linux-riscv@lists.infradead.org; Fri, 09 Oct 2020 17:52:15 +0000
Received: by mail-pf1-x441.google.com with SMTP id a200so7475328pfa.10
 for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2020 10:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=wVsQ9q5Q7s1s2K/FqK048q1RDnfVI41to7Mmyngot/U=;
 b=XhIyavq8e/26hIs74uPffC+5QFXoQULQ7hdbrnAqZ1ilmOUyi3gcaCVmzNwEpzLX2b
 rKdCg9+tqIsMw+K2pOKGx5xvlHB2OOdPs4Eq8q/gRJDTXXXLZsJgigJWuDrj6IYY0BuW
 yI0C4N3AZQ/ZaL8lBoPMR1tgZYBBGCnfbxbk7bNlQ+n6Nw5y4n8E1eqDyJLfr+rbiU5W
 aclex6pKaax2Gwve3s3NMXqQq/s9i90/CTaeN3JCP1UmZ5ARmEidDYEWviaUgkRHwMBH
 okzei8cKuXRjIZCncGfKjXJ99nvn/ejIv89XDGvHLgz06IYJ3SviWV6CPka/g+gTNI95
 fuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=wVsQ9q5Q7s1s2K/FqK048q1RDnfVI41to7Mmyngot/U=;
 b=arsDu3hncyERgRIM59pnPhd6ZToMRObuo/0mjrpJcyqVLmy4QouwFeOgdHbYSdfis+
 W77g7orR8+nuc6ZYSSMGcNWoNaLKa3o3zSH7eGaPjx6Llo82JVtM2U+mLsE4bJvDgS8V
 sf9uUmyhlXlld15HDoEe8t+oh/yHflzAf+Rv0uj2owEvZCVbQ1kQ+4h0XBAVJ0KdaGR/
 ECX/EMhZ7nO3PsVrr9bJ0HlgzjmNjfxBgINgO62XGBQy3k82o74/6HDhkn8l0nPGLKgK
 +hMOgCq8kK16HYmHdiswAeD7goc+Ejtlcaz9soPVe0LdvlTgX8Dz14GWX5/0FEbn83GM
 hs9Q==
X-Gm-Message-State: AOAM530+T16Rw0+mszrmYeXhQf1tiKwrzbZo0UiZ4OWshz5lFGFH+j55
 WiHKswfak8wlm1aWS5eDA0tYjNBsznXwBKCv
X-Google-Smtp-Source: ABdhPJw1UfBrhjq/v8VFLEsMgIVl2JkDSyZFhDM9kj9WzdsuIxN1Qahc4T3xKTzOzmdFNEtgVaGoeg==
X-Received: by 2002:a63:4f5e:: with SMTP id p30mr4176607pgl.6.1602265930214;
 Fri, 09 Oct 2020 10:52:10 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k25sm1207735pfi.42.2020.10.09.10.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 10:52:09 -0700 (PDT)
Date: Fri, 09 Oct 2020 10:52:09 -0700 (PDT)
X-Google-Original-Date: Fri, 09 Oct 2020 10:52:06 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.9
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-9c92c420-8192-474d-906c-3f43e1f4d7e0@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_135214_766756_53A03ADF 
X-CRM114-Status: GOOD (  11.97  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 549738f15da0e5a00275977623be199fbbf7df50:

  Linux 5.9-rc8 (2020-10-04 16:04:34 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.9

for you to fetch changes up to 84814460eef9af0fb56a4698341c9cb7996a6312:

  riscv: Fixup bootup failure with HARDENED_USERCOPY (2020-10-06 18:34:00 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.9

I have two fixes this week:

* A fix to actually reserve the device tree's memory.  Without this the device
  tree can be overwritten on systems that don't otherwise reserve it.  This
  issue should only manifest on !MMU systems.
* A workaround for a BUG() that triggers when the memory that originally
  contained initdata is freed and later repurposed.  This triggers a BUG() on
  builds that with HARDENED_USERCOPY enabled.

----------------------------------------------------------------
Atish Patra (1):
      RISC-V: Make sure memblock reserves the memory containing DT

Guo Ren (1):
      riscv: Fixup bootup failure with HARDENED_USERCOPY

 arch/riscv/kernel/vmlinux.lds.S | 5 +++--
 arch/riscv/mm/init.c            | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
