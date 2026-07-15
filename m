Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9270C44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 13:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DWEE9DXb3l/GZJ+CDs+Nc6X7sX1sj8583/748/xsPns=; b=pNMHVOI3NB+qOU
	AlczkJmXMTsEb9MRYzbz7EMtRq6VA3NAN8t85B2ufrOat/GDlK6xdSKeJ/fbtsx5nvj+5YkJ7jAro
	GFSwB0M79/dmjYTlkS24KRGZt9XGpRRu+jqp3ag7fmFJv4rTVmw/fcfu8Nuq9WzNelb57CSHaG4R/
	T15tKaMHKeZE+aVJhUhFmmBwHwrl9G/lnIUme2mnVbdL4dhhT3MNWCU1aVWKPRSGF2AHZLUfkFbe5
	HY43epMbxoJ68AhE7TvuvLJ0JmBrJR5kn5ESA1jbalbv/O/OPPwfm9S/yyAYiCt0rpxgNjO3tqL0R
	DSpYNS7RlLHA+HM3EkZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzXB-0000000Ev8E-42NB;
	Wed, 15 Jul 2026 13:20:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzX8-0000000Ev6v-2w2k
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 13:20:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cc97653887so62243605ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 06:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784121618; x=1784726418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T/y13290HREwIAZ9kl25aMNAKQ9TkHoZHGqR+8kmNks=;
        b=jUnpWuU7/eAmpBSmx6zwl+K4pzjX92JjHVAcRCjgDyyjUV6KFgfUMFV0KvGhzUp//A
         MTRx2rlnfayM5AgQD4uY76zWndWVQwfk8fixhhzjd5ve6HCOuirTEquKN5AqQoipNTYf
         6f1aG5Q2vMcqqqj9FHSWbnA+XXGi6AmIG4GkOR4LqdO82zvKnKYP+Bnm3EJz1MLnneXG
         xxWH2La6fuWPfGv5ExXEIXfyhpV6D6nOwlJHL7dKvWSyn5moRzaXLJNi1K+Bi1YIY5D7
         7mN/33tpNYKF2fqDwQXuas/mlchCsodBhZXYWbFaAQlyUZTcm+gR7ckuTNDEJufXFiaK
         pccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121618; x=1784726418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T/y13290HREwIAZ9kl25aMNAKQ9TkHoZHGqR+8kmNks=;
        b=XD8239/I3IDKqwzBWDY22m39FBXBXVOi82NAh1auitCok+xKhKreTfvpbZbu4BiNCm
         //lpFaO7Fkb9rabYFDd2mMmcBHWSGU257c7IgTgox0VaZOC4a+qqCXNFv9hpIkmoIjeO
         cmxejm2kacQ/YGeFvUQcxv8KsFTIW9YJfdizwC4u/lFsRrpLzdwqMC2IvhZHvL1/BgQz
         /uxNcBpsMkqX4coFHPxuM3AxCf9T2nZWj4yrYrULw5hk/jMTqWhrPW4G/KJChJg00I4j
         jcAQXipVz00CFQbrKvQpuUgwhn3yYafrwU57RlGsXe9EBUAJmNo4QwlI6LuFxB3CcDCT
         00mQ==
X-Gm-Message-State: AOJu0YyE+Vt6jXdV1MhdgPYNIgnL0tArF7+dSY5SnMx54SJNLQGW29M9
	n6ycEh2JT6UuK09Bs1IHtl6AQu6qkROPrJLr5/O2OpOiQNJLwdp3YMufwsC616HekEPwD4ILDE0
	yXl6OENc=
X-Gm-Gg: AfdE7clHpm/Y+R/BGTTgPtNDHMY0fsmVsdpAJIpQBFMTZT3QluEiNpKQdw2TRidkdgd
	yqPoSaD8RjGwIyIrYmCZKRYGnnDUNiheAi35L8sWkg51anvi73sSkCg4NL2proRNhQ1Cz42K8yn
	q/rIhH3orQxuph5Es2KdXClheCUc735lQxT+BKvbGdPOzFAk4CFTol61ysCtEGuR1ooK+TU7O7l
	UQmq5HmjTixBfp9+Gc3thFg+Jx2fLm+BEeiGb/1Su3ugKOqN5OfYxWcXY6sXe9xPrUqIfrQr2Pa
	p8aizPhmfbluyN4AZnstZrhxuSALRj3gp3R5nY/BWGhSUKtIhsJ4ntGJSpnnXzWm63S/FdkplOz
	+2fLsgg8P/jpptkSiPcsMS5hX67pCqNVEkT7lyDb5jeT/zYt7jLqpHfUeJx0PoU4uvRBTo2DPDH
	zrLnKPGSneeSF7W5dpd8S5CnLhGEPL4XmYece6BtTNmX1mqlHEpeuy4i6BjbwIKla1s+G/meLb6
	jHrck68+vallPMO+x74dKgXNmztNO7k3Hw=
X-Received: by 2002:a17:902:fdac:b0:2ca:5a42:d8c5 with SMTP id d9443c01a7336-2cf03e1f2f5mr22432835ad.46.1784121617542;
        Wed, 15 Jul 2026 06:20:17 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf100e42c6sm2465085ad.9.2026.07.15.06.20.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Jul 2026 06:20:16 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	klarasmodin@gmail.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v2 0/3] riscv: mm: Some optimizations for tlb flush
Date: Wed, 15 Jul 2026 21:20:06 +0800
Message-ID: <20260715132009.10634-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_062019_175217_38D210E1 
X-CRM114-Status: UNSURE (   5.99  )
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

Some optimizations for tlb flush on RISC-V smp:
1. Apply Svinval in update_mmu_cache() to avoid flushing irrelevant tlb
entries.
2. Clear bit of current cpu in mm_cpumask after local_flush_tlb_all_asid()
to avoid potential IPIs in the future.

Some false positive spacing error happens during patch checking. Thus I
CCed maintainers of checkpatch.pl as well.

Changes in V2:
1. Split the modification on update_mmu_cache() into two commits. Thanks
to Paul.
2. Fix address errors in the svinval processing path in V1. Thanks to
Klara.

Xu Lu (3):
  riscv: mm: Use ASID in update_mmu_cache()
  riscv: mm: Apply Svinval in update_mmu_cache()
  riscv: mm: Clear cpu in mm_cpumask after local_flush_tlb_all_asid

 arch/riscv/include/asm/pgtable.h  | 12 +++++-
 arch/riscv/include/asm/tlbflush.h | 23 +++++++++++
 arch/riscv/mm/tlbflush.c          | 64 ++++++++++++-------------------
 3 files changed, 59 insertions(+), 40 deletions(-)

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
