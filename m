Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2140CC4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 14:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=r6prfXxQYgY0Np2JvM+kw16KGR7wozy0DGPK5a/ySJc=; b=3qc
	D96THlFgBmounipuw4HRb0GEMZTcBqMucTB7JZ0axuzWd7H3dGOf1v0zhOQ2UV8SNBsmTGQhO3DMf
	vqhTrvifCktqp7ps9oRa7QrKjtf2H+DVrcBCquRo++159+woQPSoYHJ1jTuxuIus7fv3u14uHWIO6
	txWQxxUTHz/kScTHFoJc/uf8iKJNTJgblJH8ZbxUNcc3KDdWyn7Tvr6FUqpUKmDNXE4xyMjt3EU4K
	Cr7HIbaoYlvIps/oLyQeHEz5ULh8V1zmNND2f7Mt43qn0sx/sO8JX6xeT7bKDbBjAi6FRCls+0mPD
	RyZRMS6J+nTApZQgS2Jvvym+nCvWOPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtkI-00000009VRO-2F90;
	Tue, 13 Feb 2024 14:26:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtkE-00000009VOy-0rx0
	for linux-riscv@bombadil.infradead.org;
	Tue, 13 Feb 2024 14:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=BXEQKabWvB1bJJHi91N778ioTs4M81H6SuoVCunbpKI=; b=psCPV6fDRwVJm+KocjF9XtR9UJ
	f7gP8NKlfUuKzCeZ3avxM6JZ9ET/Xn9nXQIWOWyHDBgl4E8okvusZeztS/ahya6SCX4YWBwQJXet0
	nfiduhe4VcfgidP7RFWGb0iktI9+joBd9TC1Ky4+iydv/kCG3irlnBNDLHW+N9UFzn6UCwnqepilP
	MfJSvDFI5cLSu4KODoWYQsAgznEQcLJNiueqrojNm6xS0Ywl0qXVSLjLQlsEByaOKVE6piMTNh4sd
	exeWgHo0w5v7x2+aqUq/9wq8UGW1At7ZkaaQe5yAorT9yGkzqxHi9wLJOi0eT7w+NCdELxfa63djy
	KjeO4/lg==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtkA-0000000Fm4A-2mCT
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 14:26:44 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dc6ade10cb8so9641341276.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 06:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707834399; x=1708439199; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BXEQKabWvB1bJJHi91N778ioTs4M81H6SuoVCunbpKI=;
        b=hNPvOaebU6SyVzCnrTPkAdzK21yk+m4aQtzBIPponNuD0oOxfx2r5Vk0rO9pOvXoQ9
         +YXLZSONILCK22awTqxP7NBbLOp+OTK23OQGDDFYR+qO989Qz3Rou4NTFJI21tZMu6mw
         yOttc+oHz9qZ2nVHmPwj5nmVrkNor+oak8IgoY0Qix4T6jlSrUmBzhewqvUb3soSeezj
         FNjGmXvsbRb9Dq2xH0m9/bC1G+ur95XJRzrN3v404FhttSgvzK/A4xfZIE+Il7ofNnXG
         8Z+mA9zLvwhOnnvpS5Pgnji6m7Kp2NWIq2yGr7bs8iIhVKrQ5Bv3A2rYHWQQuvIjIeAP
         usqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834399; x=1708439199;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXEQKabWvB1bJJHi91N778ioTs4M81H6SuoVCunbpKI=;
        b=lSQFEUD0EYCViVPmpHmgLFphtyujgQg8VgyZSBuX4aC13Joi+hooqqpYNtXH5R+Osh
         nft1IRf937nqJqMLHjwNojkwh7wXPXsqs8df+uydwawTndI1NGMfweZ//FN6RofttQRF
         yyg+aWzWoxteCyFQ7FW2oJVi9dv64PAEQyzNrOvec/mtGGC7TZ47PfnxjyvEztiSWUjz
         7bNbRxM30cPqCPYCDP0aGTAukZovYL4MiCf315AHiDd1qTaY+tJrpjA1gophr9UPGh4X
         VxBZHyW+JiLZFO5UXEho/cYW8aKWxvMzeeWh7URFey6JypTfjUnhjZMGsAznoma1Tuwf
         xkwg==
X-Gm-Message-State: AOJu0YyrJkWAiXqAIsU/w60ecgXGnVRFuyJ6oMQokJEZ6aNPkZ0/soto
	dScWLNcWxadb5n62YV8SkUWr26QmwOyOgj/Ui6d0d7/JndOTqdBE9s6Nnb76vM4+Ha4TSo8wcCg
	zXNkVcj+UR8IgGvbaKA==
X-Google-Smtp-Source: AGHT+IHea2Q/ymFpGwvd1rep/akiLkqQzrKrZSAjVHimm9/M2Ji6KNJv8IiH8r9fY0dWo/q7kKW4wkes3yOj8Nq0
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a05:6902:1109:b0:dbf:4359:326a with
 SMTP id o9-20020a056902110900b00dbf4359326amr632590ybu.1.1707834399195; Tue,
 13 Feb 2024 06:26:39 -0800 (PST)
Date: Tue, 13 Feb 2024 14:26:31 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213142632.2415127-1-ericchancf@google.com>
Subject: [PATCH v3 0/4] riscv/barrier: tidying up barrier-related macro
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_142642_870937_C7000D92 
X-CRM114-Status: UNSURE (   7.82  )
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

This series makes barrier-related macro more neat and clear.
This is a follow-up to [0], change to multiple patches,
for readability, create new message thread.

v2 -> v3: split the patch into multiple patches for one problem per patch.
Also review the changelog to make the description more precise.

v1 -> v2: makes compilation pass with allyesconfig instead of
defconfig only, also satisfy scripts/checkpatch.pl.
- (__asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"))
+ ({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })

[0] https://lore.kernel.org/lkml/20240209125048.4078639-1-ericchancf@google.com/

Eric Chan (4):
  riscv/barrier: Define __{mb,rmb,wmb}
  riscv/barrier: Define RISCV_FULL_BARRIER
  riscv/barrier: Consolidate fence definitions
  riscv/barrier: Resolve checkpath.pl error

 arch/riscv/include/asm/atomic.h  | 24 ++++++++++--------------
 arch/riscv/include/asm/barrier.h | 21 ++++++++++-----------
 arch/riscv/include/asm/cmpxchg.h |  5 ++---
 arch/riscv/include/asm/fence.h   | 10 ++++++++--
 arch/riscv/include/asm/io.h      |  8 ++++----
 arch/riscv/include/asm/mmio.h    |  5 +++--
 arch/riscv/include/asm/mmiowb.h  |  2 +-
 7 files changed, 38 insertions(+), 37 deletions(-)

--
2.43.0.687.g38aa6559b0-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
