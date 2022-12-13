Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9559AC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUmhnBtdoMdg/Nr6KQbX/VcmXITyF54pZRoyVDewAdw=; b=Yb0TUyGzTqhXUB
	XXjWac+Ta+54whJB/zCptaTTb71eCSNA6/KF8LgAqXq69ymGLqDOmlpVoGicsziRelH+3yIFQw/MI
	D1YB+SfH3Zxs9IIiMYuGo9+eb5GOuYJjmBX1shzH29x/ZhMn3qXz+PCaQ4M3lRTrQ3ax8hmJdHCAx
	bQFhJpv6UD/cnm2S94iBuZsIHBMvRMyfv7sNIzcv6varaxZNPdIOOERmgmkMu8EluMrORIMztM1mN
	Rv4VdMI/JuF616aANBW6YrjDN4qnPfy2WiLSIWCUfC60w/CroFrBhfjqgHhUxizLTq3qhH2D4IS4q
	FLpz/B49BMRhdxDAA26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u5m-008uyu-Qd; Tue, 13 Dec 2022 01:28:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4u5G-008umi-Q7
	for linux-riscv@bombadil.infradead.org; Tue, 13 Dec 2022 01:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sNSL8jiUwkIgQF+f7LKM6ExXdf/VymBG2POuUwuNLgE=; b=Z1JwFJH6ZYwPYcyMEqPqqUunDP
	7MFMM3FN2Nx2g1k4O7fgG2jgQOO0/fpUih5m6HjWT1V84WcjHNEhB0wX+hcVAYyPP7AjqT3MfTslw
	wAURJdsEPhKgDkN6E61D1o4bEVfFslnOY0S0wuId8bcdOWwduTCC7r1MGZEbtBKq1ObYcvy5O1Z75
	8EG1cpF6Si4mcsRbsCXd4nSVB0qBhn39W/MxDARf6XyRnaAOk9E06UazSbfPSpWN9t8Zc6SnWXX61
	swzc0GVFDXraMoCKIlmDZlhcoGXhHzuVe5oIYo/NhoR+OHxtz2+3vhuWWz5cgMeaIuRieDwzQtxwU
	3betHyJQ==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4sz5-009w8Q-EV
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 00:17:25 +0000
Received: by mail-pg1-x54a.google.com with SMTP id c9-20020a63da09000000b0047954824506so2264856pgh.5
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 16:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sNSL8jiUwkIgQF+f7LKM6ExXdf/VymBG2POuUwuNLgE=;
        b=X3XOty/l01/xeN/hKkn1EpgJ33YKq3U2qtH9GiJ5/B0nOJ0DB+hLmj4UfSSjeoJtZB
         r3WCB8nZwf1VlN7+893cXq/5kUvyTwTDCZxL2nIPUKLALlzRPBZMfeoH0Ua0SHFxAPI3
         /Uv3ZxCaECDcW2eeqyV8ZVWd1hAjmNuzXaMV7oaRBjF3tNInWHVE7czGbwWdAPA4Hukj
         Vcsk24frgaF7Oql5xOx7BPdx2Nha0adydl6KmebMs/wKPMnAOgI3pEI6XB3jQLbLNFR9
         iwyZylWx8ZK0kgB1K5whCjACIx96wIRJdQeYwYX5foAv7IbCJ4PHaibz2NHGhj7JHDYg
         U68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNSL8jiUwkIgQF+f7LKM6ExXdf/VymBG2POuUwuNLgE=;
        b=g3z9rbyweFeOACDurlmdD6LPMu9roLipTaS1gFpFzDkkG23OymfhcX6mVZJG4tKdzE
         zDazpufaFeAtWjZD96k5j3JrF/jEzbZinxICKLn/Jbav9ZC2IUx/CNj4ZQHIwIPtHtmh
         5lsM6P1v7+75a2g1g9SpssXqmGEx7/mfU74dTjTwPTumMs/fEGLD7HIURQ6U+CDpHBZ3
         OlmWQxIaUwjDm4qGPvACWYeDQ6cxBWDPAKvtScenpFPRq/OoG1oY+Y5tkpRzEUzQGxhY
         oNnyRVGtp8Gy74+XjnTCCMTNZDm1qlea9a1jjhf9oWJGJq+2GvBfEemate713JbsZL5d
         GxTA==
X-Gm-Message-State: ANoB5pnWdjCoVgFjEpmuWeNsXOuKZYld6pL4IKi5yy89RDC9PH+3NBHE
	iNkqrwsJMb4qBwzh3x05Ku198NHqPT0=
X-Google-Smtp-Source: AA0mqf6O/+6Xz33uYXNagfPhZfGdLb4gsoDNpenMWb9N8M3Pf/4lwZ6k3UWvF8FLs6w60jREU9TzRW9INS4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1d98:b0:578:2fb3:b373 with SMTP id
 z24-20020a056a001d9800b005782fb3b373mr577725pfw.33.1670890641355; Mon, 12 Dec
 2022 16:17:21 -0800 (PST)
Date: Tue, 13 Dec 2022 00:16:53 +0000
In-Reply-To: <20221213001653.3852042-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221213001653.3852042-1-seanjc@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221213001653.3852042-15-seanjc@google.com>
Subject: [PATCH 14/14] KVM: selftests: Enable RSEQ test for RISC-V
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Tom Rix <trix@redhat.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>, 
	Sean Christopherson <seanjc@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_001723_780705_61B49C9A 
X-CRM114-Status: GOOD (  10.32  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable the RSEQ test for RISC-V, which according to HAVE_RSEQ is supported
by the kernel and thus should be tested.  The RSEQ test was added shortly
before RISC-V selftests support landed, i.e. was likely overlooked during
merging.

Note, the RSEQ test currently doesn't compile with clang due to an issue
in the base RSEQ test code.  Given that clang is constantly broken for KVM
selftests, enable the RSEQ test and deal with its broken clang state in a
separate commit/series.

  In file included from rseq_test.c:23:
  In file included from ./../rseq/rseq.c:33:
  In file included from ../rseq/rseq.h:97:
  ../rseq/rseq-riscv.h:657:17: error: invalid input constraint 'er' in asm
                                      [off]                       "er" (off),
                                                                ^

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/rseq_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/rseq_test.c b/tools/testing/selftests/kvm/rseq_test.c
index 34c3df9b4e81..3045fdf9bdf5 100644
--- a/tools/testing/selftests/kvm/rseq_test.c
+++ b/tools/testing/selftests/kvm/rseq_test.c
@@ -22,8 +22,6 @@
 
 #include "../rseq/rseq.c"
 
-TEST_UNSUPPORTED(riscv);
-
 /*
  * Any bug related to task migration is likely to be timing-dependent; perform
  * a large number of migrations to reduce the odds of a false negative.
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
