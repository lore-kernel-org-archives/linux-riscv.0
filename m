Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FA5CCF9F0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/QJk6G4k33GqBJ6huGNNSNHPDREKydd+ROSWDhmLfV0=; b=QzB5hhfkHCq6//
	IkWCG0uLDSrlwbxuQuvCsWWVB1YkoVLR9PZkx+15VRGjitGXO2xtUrtyiHEfY4cNMD5Km6fkgbsaB
	FcWCdkvLTm3JdJjHrPlaOo5V0bUqzf3kIcc71KrvREfR3N48k/gOQ6FSS6bbLljov4UCBKuwUQ01W
	FBowOiTl31bm5avps+aF1ALtrWJZG8XvyeHbJLTASFaUiJnTBB4SIVZVrZMzrZiDmf4KMH85WUCL1
	rIfLkuMPKebtQ8jnU/bhguKRy+nZ6Yes1NsHBFi42dbxD8KoZUhDOBi57X+qN5J+38P0q3G7oOmco
	AEg7czV+dzhXt9HO7kQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET9I-00000004GAq-2PtB;
	Thu, 30 Oct 2025 13:57:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET9G-00000004GA6-0BG3
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 13:57:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-294cc96d187so13639585ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 06:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761832622; x=1762437422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jk8TnzOxyuLBQtldVmhC9Imz006gRUGHy0jLbQTIeSg=;
        b=M8PZiYx2kzfDiTuWPh27n12NJAi0IGjqlvEkO7sGK7iS/w7SGSs0QgKw//C14vdPNP
         qI/N3VwqN4XWO7E2ltI7/BTU6iB+6C8eu9sTch4ebZR1p+n82rK1K2iWiatjsLU05Pnl
         cPY6t5tOR9n/gMePOhN2Q5ZJAjP45zTEthYBgfj6x4ns1kjTbCiLC1PSY03U9R4Aak8z
         Xg4iByA7aJON+AUb3GraV/x02CpKctSbyYILDyQAArhoiQjVCe6wLWVNRsWeYhQHyhCR
         Xikijf3yOlVOadwzldw4rERSPIsxPhJtQY3W0XhD6PmSqKXm+FWdd3k2V6BNfvfo8Oz8
         65Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761832622; x=1762437422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jk8TnzOxyuLBQtldVmhC9Imz006gRUGHy0jLbQTIeSg=;
        b=FTfQ3C+FS4BZgkXA041UHk+XVh4kS0cp+8RjMk72ubjwavfOuFyDgqYaw+onR4/cjC
         Mpf2vAlhjxgRT7/gpXhT82R48H0KWQR7eUlB+EG9V+iMhLIVHhsHCZDu1VzDbBTRjTV9
         CSI2dJroLTmQjFmuJ7CY+UAdORMUNY9jVM6Sft2QFhyzYVJn2Zk9odKLYL2Kqb2NLtMj
         TADZ0s0nbZfZ8HTOlMiMEuEZqV/EuzpWTVKvLfngl3m10TKDdwwzqh4/ZamF6dKZuypN
         2s/ztRAioY0UYONVQv1t8mdbQ1Y+q49Mx3fMjHl38uzUTmU45csy4f7M6IDzz8E1X4M1
         XIJg==
X-Gm-Message-State: AOJu0Yz4Qu2aJ1y8e3FBD0Pkwgt0tMrY5wgjcuRjmQFXMAQ8Fer9vJMW
	45PvUfhvTOHI3Lle7AZUhGv6QSqq9xAyZInrGcZV8ltTcJ7hLKZVXD1+YFgty/wq0arRZj2tGoT
	bn0DOs+k=
X-Gm-Gg: ASbGncvddK+ujHIfRJZstmbYHkeJLIAJH00/8JEHvOx9daq5m01+sEFAj5GCZPRx0zx
	qz4GzvXhBs0A35Gz5VJice9gvNDJ7JvIEClY1UK6tToiTHnW5tKWK2P117IWJbJkZf9qIl+J4LE
	b66X8Ph8P4yqcvvi0ectjpkzIF7uaBELdPjDSBpKEj+x2oFc8AoNwxXP4Mnpe15qakNB42YFOYh
	rpD4mJMl9XA9aUj+lkq5BfKeXgi0rnASDEmjLi933nI7Ta9wqVTFVLZB5IWxUQnnn6T8JCqq3aS
	ilx1X/he7tgAESWxbMaFlOyQOd9sEjJN/elK/WtAJTarur2MdEc3/rECKEE/L75Mhut9SfZGoRV
	WsYD30wiW9aEPEKi4pJZ1hCs3gaSQpNk3Nnv0Z4WP26SnCvhaVkanSoWyAMbnSbGqdIuzOwW820
	Wo3SbJcdl8XqzSGBuGoQf0R00NpTkgAgYaqhRo4vFT9u2V52CnUJ6FgmhHFg9FsbdewRjSiE56Q
	Q==
X-Google-Smtp-Source: AGHT+IGpaSpfBxlrthCicNKtIDC5somDGkkgwjpvULUEKqRhdtcWOa61ZR+A4h5HiaDX2of1Cz4ySw==
X-Received: by 2002:a17:902:c402:b0:294:e8a0:382b with SMTP id d9443c01a7336-294ee477f04mr37227085ad.54.1761832622332;
        Thu, 30 Oct 2025 06:57:02 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e495e8sm187071905ad.110.2025.10.30.06.56.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Oct 2025 06:57:02 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	apatel@ventanamicro.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v1 0/4] riscv: mm: Defer tlb flush to context_switch
Date: Thu, 30 Oct 2025 21:56:48 +0800
Message-ID: <20251030135652.63837-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_065706_085918_51AD02B7 
X-CRM114-Status: UNSURE (   9.10  )
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

When need to flush tlb of a remote cpu, there is no need to send an IPI
if the target cpu is not using the asid we want to flush. Instead, we
can cache the tlb flush info in percpu buffer, and defer the tlb flush
to the next context_switch.

This reduces the number of IPI due to tlb flush:

* ltp - mmapstress01
Before: ~108k
After: ~46k

Future plan in the next version:

- This patch series reduces IPI by deferring tlb flush to
context_switch. It does not clear the mm_cpumask of target mm_struct. In
the next version, I will apply a threshold to the number of ASIDs
maintained by each cpu's tlb. Once the threshold is exceeded, ASID that
has not been used for the longest time will be flushed out. And current
cpu will be cleared in the mm_cpumask.

Thanks in advance for your comments.

Xu Lu (4):
  riscv: mm: Introduce percpu loaded_asid
  riscv: mm: Introduce percpu tlb flush queue
  riscv: mm: Enqueue tlbflush info if task is not running on target cpu
  riscv: mm: Perform tlb flush during context_switch

 arch/riscv/include/asm/mmu_context.h |  1 +
 arch/riscv/include/asm/tlbflush.h    |  4 ++
 arch/riscv/mm/context.c              | 10 ++++
 arch/riscv/mm/tlbflush.c             | 76 +++++++++++++++++++++++++++-
 4 files changed, 90 insertions(+), 1 deletion(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
