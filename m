Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFFAC4829F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 02:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xANw7BaPDmfoNZifOtR7OLV+S50JVBofZgCnzRJ++E8=; b=i+LRdhxTbLARf5
	KcOJswMH7Jihq6srB+GjnLv2QymYvLls0i9EBhW6BLMNUDriNmFIjZsTl9+paUyDhX+4DctYaEKNw
	/fAP6memMuS01B2DjvKLqVXJhoMF08wDWFf4Yachb24/+z3waUbLrZ7WEJJWNHceme2wgVt9X3jtQ
	Gh5INA4uE/uAaxRwfxvz+qIIzof5kDIxdWgHevVW1MD68YHOGykSdZInSl8gnWKMtoUpv8ZvqHOWI
	ZTOYzudqAX1PNCpn9LhFvNYxNf62+Ujx69EO4b+tuyUxudO/0bSQEwhxYEfgrveZ5KATmYn51Eu/a
	5J6BizJUypBo7npSSwPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTn-00000004D9f-0GsO;
	Mon, 12 Feb 2024 02:55:35 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTj-00000004D7s-3chj
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 02:55:33 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e09a890341so906457b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 18:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707706531; x=1708311331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h3AYwIFOJHMYB8Yfmr8ZbFJXyCyieMlwYjbQspEUaOQ=;
        b=hdVZyjMWVSGu0Se0wKh0m7FWT+GMcZL57neoeWTXKAWXKuEMAY6M6g7KZvtEYP9M8h
         abaPjM//zUP+kd2H9ZOXy7DhDND76b/pk0j1uhn5IWw/kgWJxA97xLEnQ1TKJD5AEATn
         Y0OLwl8mXWuYS7eWKWxOMfyWC1AyuYBah0VWfoy3s1m4/v8647RbGRrntViCrpmJl2q0
         6buc366dL4AWcdqottOBLOeOo7Le1GddYVrflqc1jT3VbMPcnZII9qDjKUmZHCxTgSbT
         1em36fPkCplLvOiT4q70mOPdvibQA80MYfyUQJZcxPvQfJaHKwXEe96roB116zK4y829
         sy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707706531; x=1708311331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3AYwIFOJHMYB8Yfmr8ZbFJXyCyieMlwYjbQspEUaOQ=;
        b=tqZsgFakWMYNS2gBTlDe8TpBbzMRrkdlhDYJIA4CeNu4AnbONLfw6flWyBOwdgXLk8
         ERlXxCGatZliv7yp/FFd5igxEla2/VTLze6fXOpbxVTcdbB2EWuj7CP0gMUYievv8OEx
         kUbtrWOzyfz8P8KBSonTt3071OMWQ/Kc4KwNhhPvhxudI1Y1u/5/qByhaBx4hMKmBvg+
         c9/8uhXpKVzbhSpdk5jDvfsMzPsPtvo1kQOfOZfRmkcCfS2xqbAPYx700nh0C/NQX28G
         SpnNohxRZLw/OohXKRkgzTx4d6N1uLEpR/BpNVfczV70eSbPcplepUVia//she3FKIP4
         oXdQ==
X-Gm-Message-State: AOJu0YxPxR8GT4U9UMW1UFrCbD6SsukDApCCuEVszL2SV4wRu3s6DWVc
	EaalUb5dRIEa1YdW3MXCYakxoCppEN5ATmVzAVzNzonKg8ElMLRTYPSdiPq27lc=
X-Google-Smtp-Source: AGHT+IHVn7UkxQepioSD8cVRqZrIIQSswaGmUNp79rrmDndGmc4Za0zL6SwNiLGJaepituGreaaXfA==
X-Received: by 2002:a05:6a21:2d06:b0:19e:ce71:bb4d with SMTP id tw6-20020a056a212d0600b0019ece71bb4dmr1428086pzb.38.1707706530764;
        Sun, 11 Feb 2024 18:55:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXubKrZzmTdYnKgYksIC7LF2/jitJmpI+rEZAZrqZuUjsezx4fnGP7PrHim6TxQgYg9CzDkcf5BKGh6Sl4hezML4bnOvHsiFNmcnuaq3saQlA+MB9ECyci5CiQpHbTD5wYMtKZJg3FRfKih0ClvVW3Ujf/ANaZw1HuPMprQCa0Aovx7xxtiuVRAi5DhAmIMei32ZkE2QzM1TrU3ttGZC8j8bNHbQtKjXYqTlKGiJtNuXqp4lmEE7y6PuwiVwqwBGM+zgSXq/dwMtveTxZncY1lTI8otEtdvXr+zniNmxzocK/KpTm3oTTBCkEECu+yLu3L79Oijm1Y=
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id lb3-20020a170902fa4300b001d9af77893esm4906443plb.58.2024.02.11.18.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 18:55:30 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	bpf@vger.kernel.org
Subject: [PATCH 0/7] riscv: Various text patching improvements
Date: Sun, 11 Feb 2024 18:55:11 -0800
Message-ID: <20240212025529.1971876-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_185532_098295_FE93C526 
X-CRM114-Status: UNSURE (   7.54  )
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

Here are a few changes to minimize calls to stop_machine() and
flush_icache_*() in the various text patching functions, as well as
to simplify the code.


Samuel Holland (7):
  riscv: jump_label: Batch icache maintenance
  riscv: jump_label: Simplify assembly syntax
  riscv: kprobes: Use patch_text_nosync() for insn slots
  riscv: Simplify text patching loops
  riscv: Pass patch_text() the length in bytes
  riscv: Use offset_in_page() in text patching functions
  riscv: Remove extra variable in patch_text_nosync()

 arch/riscv/include/asm/jump_label.h |  4 ++-
 arch/riscv/include/asm/patch.h      |  3 +-
 arch/riscv/kernel/jump_label.c      | 16 ++++++---
 arch/riscv/kernel/patch.c           | 56 +++++++++++++----------------
 arch/riscv/kernel/probes/kprobes.c  | 20 ++++++-----
 arch/riscv/net/bpf_jit_comp64.c     |  7 ++--
 6 files changed, 56 insertions(+), 50 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
