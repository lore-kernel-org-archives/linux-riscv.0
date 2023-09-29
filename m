Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6382E71D58
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 21:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gyJ7SRBh6KxlrdU85KwF9MKJP3LXP6o57RVn6YtCrsA=; b=UIQ
	KkDHUsb40n0TsIOJv3JTPunN+/b1oca4EgtZhUDJd/YY6g4n8AFxccLa3jzuXc46+loekMGfUwlPl
	UAby9xTQ8VPtB/ZGDElpGoHXNxpPxEdE9jpYTZK26G2cdTAHqwry6N06IDUHDaC2i1oyRQ2JNKrVx
	Q8poiVbxwMwmDDNrKl7pOfIuoprFOmZ3MBMdohygDyHc9EWVsQhgiWvyl6ZrDwuC0OVwqrZL9B2io
	Fqkyygx8vaBZHDDHIHFCvWre7pRNXTzqAJp5aPqqhSyJ7MTqIEUZJc/Yjp7BPhLNK0/5JxzRsEfOY
	WXiaMi8W2PM4QSKjIVtoRpMP0paSh8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmKmP-008aTp-0q;
	Fri, 29 Sep 2023 21:12:09 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmKmL-008aQs-3B
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 21:12:07 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d865a8a7819so19593350276.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696021918; x=1696626718; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qI6+evphp8TRNLDsXrgWEBj/E5cavHWN+P8xd8/8MDM=;
        b=apMk1YoIbEaj9f8+nnnqW1GFntruDzJChN7aX/xNHAWfoSZ3A1N8Nj2MWneM1L056U
         Qju/ngCsTKkcrmAcVuQJGcw5OXok74YSgBvJTR+wI2VVrjUi8SqKgZLGO6glzv1+B4mo
         ZwpDKLPukzhFSiTnsv7W9c1DZpb+YeO7EhmtwShh1KLEBNzhw/12V6hYD+OXZSH5GMWB
         xCb1JGYYFb85Yt9byO5D99MP7forTXVsW7uHLbGXmcQ8X3acx6apddAVndRJlQIVWfJK
         LtEjgoEk6uwmBRmlFYV2e75xMbvs/1jWAAaKejA4vqope1NEIF6dn08+JNa0mCHuJuW5
         Os+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696021918; x=1696626718;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qI6+evphp8TRNLDsXrgWEBj/E5cavHWN+P8xd8/8MDM=;
        b=SxCRZEzTi+0KD6BrLApFufnDxzqhLUC+4/fhu2cNXb0gqgxLeG2hHWa6Q/9IIDz2rk
         0KHlo8fpltNTi1pCgFJ1oCdhs9eGvIqIpYY/TlT/Pc3+Zh4Kv0nQ45NOJUX+glOz8NkK
         opAbeZv+0iI12yNJ2u0xEgc3v9CN3gXauR1HV3J+dT8XMShXYt0UaZKYKbcf0/G1EnA5
         OybDtxNwauoNiM/VB1ESzrHviIxeeuKJlEUH6YAOZz8HlvxLYXexWfUBckyHl2gCw/7U
         O+MR+bKUBe0PE6sgQZFpX8qw0f3lL2KqH2/rRiD1guMtW1wZImHCXbZFj6WdzyE12ad/
         Oflg==
X-Gm-Message-State: AOJu0YxpeeKFAF+Pwpf0G18t4sjab8Q9YxjX7M+52EhTSbOK0I8TDO/u
	cnwJTI7nzrVt1kfNw1irk7Ugh2Jwfzjieq0vgtY=
X-Google-Smtp-Source: AGHT+IGjD5ILJnbbyCB0lpaKNSDkrgUS5mwaokgtSD8CjgjpWZhKS+xQi/ZyvDLcSGZs4gGR5Nixr3sWaAppp9HPVPc=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a25:ad0a:0:b0:d7b:8d0c:43f0 with SMTP
 id y10-20020a25ad0a000000b00d7b8d0c43f0mr85777ybi.11.1696021918263; Fri, 29
 Sep 2023 14:11:58 -0700 (PDT)
Date: Fri, 29 Sep 2023 21:11:56 +0000
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=727; i=samitolvanen@google.com;
 h=from:subject; bh=Ko6nN36PGlYW1laUEIPPBze9YPFWfBooBOFzOjRaBRQ=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFz2b825e14pVS6UiwTyLbmjRM7MleUeCEvyhI
 HQ9Yi7cABWJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRc9mwAKCRBMtfaEi7xW
 7p9uC/9v8/6JNqB5Fbep/hRFQKiCO/kScjQBMmlHvInQfP3gwUfbFCkkKYSVRSOR4Pxeo+/um1b
 AFvQRu8TawGoy7GtfAlC2T/3RZQcj6xNwU/+K5WHsVdfqZNa6xsNhtBstdrsW91ELm7X4wBhnPs
 9dYkZsrMXL8JtJvTDL1VQ3EjQ/tTab3SiJiqIF2J694+4vXbP83KGUAsC8z11QRsfCkb9V0cHNb
 qMaWfvoF2E3/MtrWUF/VlddoLs+4VfwsIz2eTQZm1X5Ll3CAeOMw8TmTQqQ3OT2OM1kJ1GKFGjs
 kpo/58zC+ziTSyL0rCbs4jrdHHMyEYwJ50108kvKlUuWGKE1joh0omULdtzfezNnIwzMPwuVnD+
 4eCKnZSAXhZxbKFAC20jcgErpJusDmn0lx2CNHUYsVuPL58GkYaK49lTYq09WuoCRWjrP+iv4BO 5JlmAMEmM6FrNg93Mj3ALgwQi7uUk7LHPkg8Rs7a3cO1p1MoInq21V6B5zk6DfXYcBSdA=
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230929211155.3910949-4-samitolvanen@google.com>
Subject: [PATCH 0/2] riscv: Increase mmap_rnd_bits_max on Sv48/57
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_141206_025551_69EBC9CF 
X-CRM114-Status: UNSURE (   9.60  )
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

Hi all,

We noticed that 64-bit RISC-V kernels limit mmap_rnd_bits to 24
even if the hardware supports a larger virtual address space size
[1]. These two patches allow mmap_rnd_bits_max to be changed during
init, and bumps up the maximum randomness if we end up setting up
4/5-level paging at boot.

Sami

 [1] https://github.com/google/android-riscv64/issues/1


Sami Tolvanen (2):
  mm: Change mmap_rnd_bits_max to __ro_after_init
  riscv: mm: Update mmap_rnd_bits_max

 arch/riscv/mm/init.c | 6 ++++++
 include/linux/mm.h   | 2 +-
 mm/mmap.c            | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)


base-commit: 6465e260f48790807eef06b583b38ca9789b6072
-- 
2.42.0.582.g8ccd20d70d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
