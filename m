Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F6DC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 06:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jwT3JFL9k2MqY1Jp7qL4zpz0OFlTkULRdn2BjjqaVIw=; b=TLbLL1nnbIWX7Q
	cwXnIA3D4RhP0qg2krMc4DHMGzqt4Pibxw1DpdDWl+eZeldFnu7Besrym/oRHYncB3fdp0Wx0rqpr
	DW8BASFIZaoNy1H0/UmIS/BHSOetWusd/9GrHTHzhir7Eqy/IXEww/LFTc3k9/wL3XSncZTES4N+r
	EoDA6hYghsrVDLvId78n1LEEW9Ueum3CpXqt2poEMLiuogaBoxYYY5JlwwlfczwS0uhOiidPFj1qh
	H8kpokt6aLOHoSgN0IBbwoARhnoFiAzj1xguo24/pqONC7WFMeLO0tPAxzflfPVoXrWnH4uSF3RZH
	Ka+RW49xfKGPEmMKj3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQER-00000004nfs-2LNb;
	Tue, 18 Mar 2025 06:15:19 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQEP-00000004nes-1lBG
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 06:15:18 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3f417de5e25so1972017b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 23:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742278516; x=1742883316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SwppuJlAFjDRGZBTGAcU3W99FXz7w1ciVwQO9dUzifk=;
        b=ggvRaquQ0+G3Tsooj7TETpsNrvP+f5DY7hfphF/E4i6LCCjqZ6i0KfTiGwxV9u8dft
         5v3SPsBzGSdAU9WzkSwu8vGxOVBP8S69hpYx4Eok+S2/feyiuuj60VusuhCQVbDa8JL9
         k+UBxqJQFj6f+MLo1Qh+dSzILfUQPzKPFu3not82t94UDePKWQTJZ3KoFB2NKmNuyi9L
         zzB8PffhYlJsTJWFyoOr+hNKAdM/jRwarDPPs0xBqvW+lHgjXd20R+4OG1K7dY9R0qFn
         3HB0fWPezFQBz4UBZ91C3CqftQOYgcuweoOq2e8oFZLV1c/OEAwHodrbR9d5qDoK4lrT
         mFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742278516; x=1742883316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwppuJlAFjDRGZBTGAcU3W99FXz7w1ciVwQO9dUzifk=;
        b=Xt/HXtUEzF7rlJ7jfslyi/FibJgpwCb+UI5ZPhgx716GJu2mXVzkQse+lxDjFscHHL
         bUd/0u3Q4Nicmo+jS70wkjlnuhctoSb18HBuHy9Yb8blf5Xb4FZHIIOXZxjwK0ifcEkI
         5QYzE1ysptUvbo6fMfiPOLUChOhuspi5s6+nMxznpXc6SLCb+ld1RdWhLK9Nu5e4rXAV
         a58JdbxKdgILn3Itg1lRJRm/rzOKai3qAs//yYuiJ5WyoSMVyL1xTRh/8cAdUmC6pcUD
         4O0S1uWF3NIfhKXkpzUtT41idUSNrOu4NAF03FnjRn4AYBnhrcTLyv8ppWoAu/KlHin1
         IBeg==
X-Gm-Message-State: AOJu0YyDmwuV7aT9MHqW4RrmqSp5t2x4YrtKZPPKRQkEEYesA4Xf9tNJ
	ktRaHh1SsOPg5lDleK0p/EODAQjtQEeSPvwz2y+uEWTFja8OR0t13x0D1qyFlA==
X-Gm-Gg: ASbGncug7bIT8MpxU23OQ1d2BculGUqM8n9moHbVl9hfYv5KNlhfv/8lKaaPc6pxtzr
	FNKAI8k550z4VzAwP3N+Edt9GRz1us6xb1horOdgEtHJymQQDRJG4w4533M/ktYc7nlB7NhSST+
	I83SbHLCMdEpfesDnjPvEf+Md4+so5Kq3JD+d3SboXxUl/7aqkcf5rzG2nUoZKkOcQ53hoBYyYb
	2/HD+tYYiU8X+7cXavGDaAlQmKjkTnqIgDPiKjtrbF0LC04tfQmecOyaIjZnGlL5hjywcx8NZ2p
	JPCUkdhFpkiv0FJCJMdWTU9J54L6oMWxph0qbp9+d4QjUi5xLAmXUNOLingcjWk=
X-Google-Smtp-Source: AGHT+IEvs1FoNC6R/cXbhA/3oJJADjGI8dDrbJPGZmXUNHn72DZqatIY1VucAS4DD9EA3K5vofASig==
X-Received: by 2002:a05:6808:1a1c:b0:3f6:a6a8:d340 with SMTP id 5614622812f47-3fdee930e72mr6839018b6e.16.1742278516340;
        Mon, 17 Mar 2025 23:15:16 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd403b882sm2051642b6e.8.2025.03.17.23.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:15:15 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v4 0/5] riscv: uaccess: optimizations
Date: Tue, 18 Mar 2025 06:15:09 +0000
Message-Id: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_231517_468092_C396B554 
X-CRM114-Status: UNSURE (   9.95  )
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

This series tries to optimize riscv uaccess by allowing the use of
user_access_begin() and user_access_end() which permits grouping user accesses
and avoiding the CSR write penalty for each access.

The error path can also be optimised using asm goto which patches 3 and 4
achieve. This will speed up jumping to labels by avoiding the need of an
intermediary error type variable within the uaccess macros

I did read the discussion this series generated. It isn't clear to me
which direction to take the patches, if any.

V2:
I've taken on this series as there isn't any response from Jisheng. No
significant changes other than build fixes.
- Fixes build breakage in patch 3 to do with not having used 'goto' keyword.
- Fixes build breakage in patch 4 on 32bit not having delcared __ptr in the
  macro.

V3:
Significant commit message rewrites.
 - Corrected the justification for patch 2
 - Better explained/justified patches 3 and 4
Minor code changes for legibility and more comments

V4:
Fixed checkpatch errors
Added a unsafe_copy_from_user()
Added patch from Ben Dooks to save SR_SUM bit on switch

Ben Dooks (1):
  riscv: save the SR_SUM status over switches

Jisheng Zhang (4):
  riscv: implement user_access_begin() and families
  riscv: uaccess: use input constraints for ptr of __put_user()
  riscv: uaccess: use 'asm goto' for put_user()
  riscv: uaccess: use 'asm_goto_output' for get_user()

 arch/riscv/include/asm/processor.h |   1 +
 arch/riscv/include/asm/uaccess.h   | 218 ++++++++++++++++++++++-------
 arch/riscv/kernel/asm-offsets.c    |   5 +
 arch/riscv/kernel/entry.S          |   8 ++
 4 files changed, 179 insertions(+), 53 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
