Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494F4CD6E45
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJYJVwYlPqvMgAnUEhlcbhiyhW4Cbj+chonVoUCYEO4=; b=0/19mTKedAS2ME
	hOUjpy/Lb/WMDvTGOb9Vw3thiDT7Jcp7IKaUKuZdQvjSaRLGPjDSMWl8nnwtKlDuotP7SPt27OARh
	7awC+RZigCzLbvhx/4W7ghfItJjhgyxrVHX8sLHrxYp1ZkuTrMyQ5Y5CAh1bmd9tTKf54MFg1zRGT
	xY8e9zG9rjkLBI1Q26hLxV3m1RI4Q7yK2qxsGoO9LENEHbhHKM932OZ0LSsIdlQz6wkbLn5OQPwVl
	HveUdGoXPn2ume9WEo3bNBy/8s7UWFJjMYUNpHRCria2wTH/z0eSP94XHbDv+Gwb8lUU5L/y9bkVp
	UzywoJh4F8pgMpyT/lPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSg8K-00000006Fym-0cb3;
	Thu, 28 May 2026 19:11:08 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSg8H-00000006FyU-1uqJ
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 19:11:06 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4855e69a5a4so3630033b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 May 2026 12:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779995464; x=1780600264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vzrNEe9DbP+fLYGZPN0B2cCzwfOboaGnHnnkC3diVU=;
        b=fXpeE55QEXmFSa/XJcaDSS5LKSimXHB2IwzY3GGOjH95u/FF3qJQjDnHlZRnPqfcga
         USVf3s8jX0rlnsMUEjJmIfBOQBImYR6wY/T2OBIM+6H+svXf8yPJLOBRlfoVC3ePTzrD
         tHgLDbu/k0txTg+F5jXT4uSxQfGjoToHuTWV3eqkcAyYj0ko3ehcKOdgCb6hD1IQL+Cb
         Y3EXVP+MrTdX09Zndv/Gu8X8ph4Xmg687j3BxUOueC/akqYP2WbY08v5tW3pQo4A4QbV
         qPrqe9VzmLVJ1fpMwucMHgyoCvz+GiCDsYNTdoweG8lqIjYuWskRn7qLj3ijccqbLv59
         d4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995464; x=1780600264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/vzrNEe9DbP+fLYGZPN0B2cCzwfOboaGnHnnkC3diVU=;
        b=I1ulXM6jkvLQRzj4gocy0INsxAEZfcC8ipnpupEhkt9o4SayPekAxuzKh9/mBEyIsG
         ineh8YMcRLZC9JLfoNGma+vXT+v4ZyzlpmGZeCnDJDhQn+K3soXfaAVQojYWcxxIS6xa
         yktAsfSkHpo8ahKjFhl9qWGN1Jv8FkG9iePE2SsYITXI/3FLYHjs8iUxI3fs9Bb9m3Yj
         7+T41CN8JKPcY5DypwDoj+hwjkJW+vf3fc0G9CBiLUwQUkLY14bobOLXX3ywZ2ZDV5qm
         rQA34bK2f2fB7YrtJFTerTeg83/+FFmoMHS+KsLx7xyyz5cXZEQyZAbH2afrRvX/WHhM
         Hf/g==
X-Forwarded-Encrypted: i=1; AFNElJ9OIyna9s0jGjFbej5fBlVOsFHrmvJ1MkppYuL0qNt/ZRN95W0l9Ej4crqUfJQ3TqjXfOQvYPIQrrsaQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwKC8hHbHYQ2b5KTFc/w5vlwL67I9vB5Y1oUG89eiI2phLZh6t
	sD6BDdUtkKW7gDujsoBLnVJHEX8Lnx8CQn04eAyAHwpW5Dfkp9EJo083gPjVc7ygdTo=
X-Gm-Gg: Acq92OHRMVcJGvit0wfoVlZxyMhpcTfttB3qwnoBWoyBEThZe1wloTba3uRQaJE+NfD
	WKR0BPJ7Dz0iW/jNEZRDQgRrXaw99A3SIUWdnqeSpeLe6KW/CkFfmORdvS24i4x2l/Pid0GqVUx
	AY6AoZyBhYu49XlAY3m1YWeVjcqkF2uOuhLRRB6/XhZuG/7P4mdm3tP5FbXnjsYOflKu9V/x2yY
	pnLZxKAFB5yHxNgKemxzqt0xyhZP4qSIvi5uCf0KhC76HcMyJ0Xpmztdq0dqnnBBMi2aM4K6IT9
	C3c7Y/w2Unscl0eu6oOAOEhS0zsabFrEpTvythxfcZImLZCA+NdQd8qom7V2vw7lcetpaqjkFAc
	TvEjaFMhPbakHMqQ6VZjMrXcjgdF/ZxH2VLuddiZbp++yhcIZScSmchMMRdBgpL6c94aZl+lpVu
	N3cTfum2DTD982V2TmPCY2K6Paifn74rbqU5AfSpfDnWwDv70mrlnxiAL+rlFLlgxtH9p7GAAdH
	WjQAw==
X-Received: by 2002:a05:6808:1524:b0:479:fbe5:3a4a with SMTP id 5614622812f47-485e3fa6baamr303347b6e.46.1779995464050;
        Thu, 28 May 2026 12:11:04 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e606482b65sm14849267a34.10.2026.05.28.12.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:11:03 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v4 0/4] riscv: optimize Vector context restore on syscall
Date: Thu, 28 May 2026 14:09:11 -0500
Message-ID: <20260528190927.886558-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ag_N8H3e3YzjRb8j@chonkvm.lixom.net>
References: <ag_N8H3e3YzjRb8j@chonkvm.lixom.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_121105_610396_143A20E1 
X-CRM114-Status: UNSURE (   8.36  )
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

This patch series optimizes riscv vector state handling across syscall
boundaries and context switches. The kernel now keeps track of the
INITIAL state in status.vs to optimize unnecessary context management
operations.

Link to v3: https://lore.kernel.org/all/20260521162521.188629-1-tchiu@tenstorrent.com/

Patch summary:
 - Updated patches: 1, 2, 4

Changelog v4:
 - Fix a build warning (1)
 - Prevent setting INIT when it is already and provide performance
   meassurements (2)
 - Address comments from sashiko (4)

Changelog v3:
 - Refactor function names. (1, 2)
 - Merge daichengrong's patch, with a fix and optimzation. (2)
 - Fix ptrace GETREGSET failure. (3)
 - Strengthen ptrace SETREGSET semantics and add a test to cover it. (3,
   4)
 - Fix a potential ABI break in signal and add a test to prevent future
   breaks. (3, 4)

Link to v2: https://lore.kernel.org/linux-riscv/20260402043414.2421916-1-andybnac@gmail.com/
Changelog v2: rebase on top of for-next


Andy Chiu (3):
  riscv: vector: refactor vector context operations
  riscv: vector: adjust ptrace and signal behavior for INITIAL state
  selftests: riscv: Extend vector tests for sigreturn and ptrace

daichengrong (1):
  riscv: clarify vector state semantics on syscall and context switch

 arch/riscv/include/asm/kvm_vcpu_vector.h      |   8 +-
 arch/riscv/include/asm/vector.h               |  52 ++++----
 arch/riscv/kernel/kernel_mode_vector.c        |  29 ++++-
 arch/riscv/kernel/ptrace.c                    |  13 +-
 arch/riscv/kernel/signal.c                    |  11 +-
 arch/riscv/kernel/vector.c                    |  39 +++++-
 arch/riscv/kvm/vcpu_vector.c                  |   8 +-
 .../selftests/riscv/sigreturn/sigreturn.c     |  71 +++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 111 +++++++++++++++++-
 9 files changed, 294 insertions(+), 48 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
