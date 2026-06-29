Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5F0C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUggnr2KholXFpJ7OebiQA9L1/df4zsSumz1pestJOE=; b=QWNB+fhLyYhfOw
	FzwLps8/4umilW5PCvn5zuABjAcZISak9dn04vWJe7QUVBP7s0Ik9s0DkVIT1fPT7bv+OdGEO84mu
	N4Q/gTqfieGjs1Lkd2u/PPcSQAXy+ybcinZPTT84Em3jlRRsW3NOcOljOK8xY22VhP0bZJn1ss7vk
	jWsTlusO4JwVPGD9fmw8/QYRta1qmSImExw9k3zRrZVcOKRD5eIuCaypkQWEHQWD+AE0wIR+2sUJi
	Dy+/HAVX+5RHP2pjsf3waRioHlX7FvB4Cx72bUauLtJ5sVZ+GpmBnbjOyKVrHq3B4ZUFjNe+V+ffo
	lVOiaXW8v6D+nuGrX+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6ZP-0000000DvHd-03c6;
	Mon, 29 Jun 2026 07:38:19 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6ZM-0000000DvHF-0Tcp
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 07:38:17 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-664c6304683so982687d50.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 00:38:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782718694; cv=none;
        d=google.com; s=arc-20260327;
        b=mkmcSwthyPumLWo7PPwFSnjukFIYHivmfYunJtAx2mXjBdCsqdEs7he53HHpHubDMD
         9MLRwtka9UHyWBDr/bQ0yRsZFDzQTT0GtMh8Gt2PZnsYpZiZJO3C4596DUFMKrbgjUYE
         D3r3dWENSEjFPeR6CHnoBPbGVs1tlaOFm71hAYzkJW+vKoXOK8yNJwLaugmIgXo4Pn73
         1VdqfXEd/KDm3xGfZc5sPqlzoUGsXJQQN007i1ASUow/IDjSNHdEpQExnoA+kvDbHOMJ
         I4oVgjSaIbctdhERmLglsnZ5oV0hbMGL4HU8glaDCBNMlFXM8cz2YEmRQptnLTFi5+tp
         rVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pd7hm6WK8o8e6i+b7Zv6UCur9ctXO8OlHFUJ7f8oDsg=;
        fh=oRc5BQHO7K0k04wyWrYFNzQTWAM8siS2VBECN+JvXiU=;
        b=nqQnGGDOXW/uZl2hL0135kopGmKdYerbQm//dugl/1RS/KzF5ThoXXaq4xSXVSNI5l
         TBnhwvS6tWIvsjlZ30Q+McpqvJZRLq2dZU2ZFPq8OkUZmyiPjJGNSWUm9mWidPO1ovze
         HgEzkuJwWDKG3Zqbr4Zl/h5K9C3JyNjqHTXSZJQDB0PHyq+03I3s737XhxBclgqgtzix
         3ku6vkypo+dgoWFp5b7t+Z/Cy+KQWaWp1ZgWm7vC2jdXl+jUX7GquYpPiSHpuiF2NJGv
         qqOO8vTI/UHDTlqKs9pgnbLVTE+h5EWTZE79LY5CtLvoK9FWXQS1POjn5ebqw/LxyGSZ
         YEAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1782718694; x=1783323494; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd7hm6WK8o8e6i+b7Zv6UCur9ctXO8OlHFUJ7f8oDsg=;
        b=Ki4eWQW0qm6JQJWPmuU+3zfRPkfnM1uw5gEwhs1DgmLSS6rGGL6BoXdowcjboZpLaq
         O7iGxqtYdPn9WfBgYNzE7KFG3xbpvIQaaXYOikidLUBKhM+PU8e4UYxUHvmNyCEHj6Io
         kpTiOJpYJ/T64mYxr2ZO3xOXX1ZZ4bflxSBzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718694; x=1783323494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pd7hm6WK8o8e6i+b7Zv6UCur9ctXO8OlHFUJ7f8oDsg=;
        b=m5fOQ2vSo0TiaHNT33FMGWTdWYKsxttVjb44Dqva0cA00HVDyIw6J92It1wmGND/ZF
         +lXymAp2MBW+FE7h0O5DI5OBavXYHm0wqbte/c69vNm/YlKLvyY52zxO4wKHSDsHh27X
         bSBaUhqJSE/ZGSYI1ldw/DNGaG6uaSvlrQwGaZygIviaUYvO/Ar3kZMqZNXFKmahIcok
         XYsHiHUsT+udDLWmcJYyaZADWHAhtX00n4bGTgIzu7l7B4h9X6iLYIXm7EVTrRQhuEuI
         0mM1K5BxYf/ZenDcos4ZhS/1R6g2f6CulRt4zuPH+RpR84QBbUYtDmFnxnkqI3MjqgOK
         OCQA==
X-Forwarded-Encrypted: i=1; AHgh+Rof0eWAJqLMLAg9rCWjujf5Rbih9urA+roNfDHAzRrMHF5bs0dzR8uzwC/+dY6goYDkP7mBCeaNEiBm2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YybUpP6TaGthgpoSQucDc0RN1mEnsM+vsWFG1rHBPVMXr+nGahb
	iXxgh9acJW1bu9pP5VUyVw84+WLnELvhrRLDXlPQAEtI6vt3ylly/ud1kfEMNKloUSSropx23Gj
	Ux/7+CEgSlFY9NpYe3kZmhAx0XwmTlqfXF+Yzz2I=
X-Gm-Gg: AfdE7cnIx0fP/OQ05Cu541SHNEIW2/dutiNwCOienLShGtNbOIk4X/t6T1rHB7u0uAr
	eVYDv5yMcxsy+t+vl8kyvk7BKghLv7L2C3Y6YCwtypt0IUls87khJX7XVRnc7z1Iwj2Jay2/xY0
	snR6YebKCBG5L3ymXAybePWVVkYiKxhkDUaNx3ZHP9SaWcEvH+L9Q5+gQB4/FxzbSBw0D/sXMrc
	q5c4zqcDiMKPxQ6A0pWjt5BwgaMeDAg3koQ1VWTeGGbKTACUBbVr7LFolSaWU/WqfO+hVBayNUz
	uCDy1QFnr2IAKM3uUCTc7TVPIUs6ElmR32T49z/iAsXjMNoRqh7DxFjmj9K5P8A/9tbXVit9EU5
	92dWAIQ5m11EDjQ==
X-Received: by 2002:a05:690e:438b:b0:664:ae69:230d with SMTP id
 956f58d0204a3-664ae6924c6mr6303386d50.74.1782718694376; Mon, 29 Jun 2026
 00:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260623204058.498120-1-aurelien@aurel32.net> <fd0c06ce-f842-95cc-c517-7e6fb2c5b2c5@kernel.org>
In-Reply-To: <fd0c06ce-f842-95cc-c517-7e6fb2c5b2c5@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Jun 2026 17:08:02 +0930
X-Gm-Features: AVVi8CfrZ0DxHgd1igLcPexPLJEUcJUKLeC4MbDXw4PJwhUz9evvW1RR3clJqdI
Message-ID: <CACPK8XcJZzynnofpLHsPAD6Lbbjf9=soj+nFhU3ey=3yT2056w@mail.gmail.com>
Subject: Re: [PATCH] arch/riscv: vdso: remove CFI landing pad from rt_sigreturn
To: Paul Walmsley <pjw@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jim Shu <jim.shu@sifive.com>, Zong Li <zong.li@sifive.com>, 
	Deepak Gupta <debug@rivosinc.com>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_003816_192864_03E532E3 
X-CRM114-Status: GOOD (  18.01  )
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

On Fri, 26 Jun 2026 at 03:33, Paul Walmsley <pjw@kernel.org> wrote:
>
> Hi Joel,
>
> On Tue, 23 Jun 2026, Aurelien Jarno wrote:
>
> > When CONFIG_RISCV_USER_CFI is enabled, the CFI version of the vDSO, has
> > a CFI landing pad instruction at the start of __vdso_rt_sigreturn. This
> > breaks libgcc's unwinding code which matches on the first two
> > instructions. Other unwinders that rely on similar instruction matching
> > may also be affected.
> >
> > Since __vdso_rt_sigreturn is reached as part of signal-return handling
> > rather than via an indirect call/jump from userspace, it does not need a
> > CFI landing pad. Remove it and restore the instruction sequence expected
> > by existing unwinding code.
> >
> > This matches what was done on arm64 in commit 9a964285572b ("arm64:
> > vdso: Don't prefix sigreturn trampoline with a BTI C instruction") for a
> > similar issue.
> >
> > Fixes: 37f57bd3faea ("arch/riscv: compile vdso with landing pad and shadow stack note")
> > Co-authored-by: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
>
> I'd like to take this one.   But since you're listed as the co-author, I
> probably need your Signed-off-by: as well.  Care to reply with it?

Signed-off-by: Joel Stanley <joel@jms.id.au>

Thanks Aurelien for working with me on this one. I saw CFI was
disabled in the debian kernel config and wondered why (failing glibc
backtrace tests with CFI enabled), and we got to the bottom of it.

This one should go to stable IMO.

Cheers,

Joel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
