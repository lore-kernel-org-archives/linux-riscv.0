Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6858CECAAD7
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 20:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wb8aN3N+VCUZhRlOxNicsTcGiQvyE6ebUYTQN8rdcJk=; b=uK+cdnWH+00L9K
	mZH4ZlATTC6EvLHsA0Qk2/MR/I2U+I4odWLkcDHW28zCNEOK7HDhH7D32ijG7p9SxnJfnCymYFgmy
	4HFSVBKFe27raXn9Ht6UpA1C9YewdtR4YBewUnZ+zu1UtA1Hz804lgI/dxMDLz5p2QyJGbqNcm+BA
	5Q7DVBST9nGQ15XdACCSiJpdOcVSVctcWwOa7w2k0elUmuyF0oeXMog0GIFdkhwS6lbd9AohKA/uy
	YBm6nQRJfN9UHpECUem21pcj9n0nACpF2/lBuSrwpejMoEnlQYNTxb9YaBcHg8E39uRClLa2m4P8q
	ajafduGLndmgj75WRKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRg2b-00BtTr-Pr; Fri, 26 Aug 2022 20:34:57 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRg2Z-00BtQh-Nz
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 20:34:56 +0000
Received: by mail-lj1-x22d.google.com with SMTP id u24so2665685lji.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Aug 2022 13:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=GEOlHE8O2rR0vFQHXv5ex+L+HckOQPUR1Jiu0AbCYTQ=;
        b=IS6XEBVoNuqw8vCPTt3BhrPBL2tNakwvPCv9OdDdDp2wZwGSZaei8qyV7m5EFdc/pT
         gUi6Hv1GdDHEULHyEnsAg0bpTYNt5kwsz+wfXQYPKiKgRXPb1L9R6JtZ+AEYBSi9nsHY
         tYLvoTPen0vGWa942DCQ3d0cA0v/CEQNVJ6PtDu/ykGxeMN43Z1Zo1c5TxBtYz9h+lVO
         e5xX9pUPX4MW4ZYcCHe67CreJYDHdsvbKBNqJrqTfh4uXvJoWb6YyHXqI2AWvaJ3P2X6
         i4rwdCtwrqv6V0GNrirkGgQGCkCAXQFGoVpusneeD4Rht3HGIOtmzrzIC0h52f6rBV41
         ESxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=GEOlHE8O2rR0vFQHXv5ex+L+HckOQPUR1Jiu0AbCYTQ=;
        b=tjKPLc9fptebtaYJszvMQ/cfHlC/fKBJH//C7GwxH6E9AlDKmeHhDYVB7hF/Knq2FO
         7yeQpkF0LlLeeDHAm9N34gVk7Jq5VHmM9BrLTkiNZWRPwUInZFZv6C5gp6sU/XGv6nlS
         lAwnoXw/kIa86RL8Mw1VWwYBebe56A14yHK9DFdUH0NCTNatGZTBHF+oLKAl9+cdcVuL
         f9gg+6bWToBt0WPhFw4lzmSwy/PahEIOGUZKXR4TbzVuj2mcA3sxdjxdU5vbUfLaUGR1
         MIHJ+0jRvLDwJXhl9fyMXp5JkGNnr19oBRY6sW0NDX9NMC0scPrEFIXicLn77p1tiL5x
         717g==
X-Gm-Message-State: ACgBeo3lD+nY1Gg5RWogPAq90H8Ph2ht7gl6A/KW/K1AD1XMWo6qqcJQ
	BT0/8tuVqoh4/5+5btwFk8BGynvKM3A=
X-Google-Smtp-Source: AA6agR4ozOAR/KhFPD8D9EjZ3flOm1uycXtCb54T5YG9p9EfNevSfgg/Y7dUjZ30QIvMhBf1fpKqjA==
X-Received: by 2002:a2e:1417:0:b0:261:c241:d9d3 with SMTP id u23-20020a2e1417000000b00261c241d9d3mr2875409ljd.406.1661546092445;
        Fri, 26 Aug 2022 13:34:52 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id v6-20020a05651203a600b00493014c3d7csm452424lfp.309.2022.08.26.13.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 13:34:51 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v3 0/3] perf: RISC-V: misc fixes and improvements
Date: Fri, 26 Aug 2022 23:34:40 +0300
Message-Id: <20220826203443.823906-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_133455_794133_0EFF3F88 
X-CRM114-Status: GOOD (  11.21  )
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

It looks like the previous revision of these patches has slipped through
the cracks. So I am sending an updated version rebased on top of for-next
branch in riscv kernel tree.

Regards,
Sergey

v2 -> v3:

- rebased on top of for-next branch in riscv kernel tree
- added RB tag by Atish Patra to the first patch
- added perf throttle patch


Sergey Matyukevich (3):
  perf: RISC-V: fix access beyond allocated array
  perf: RISC-V: exclude invalid pmu counters from SBI calls
  perf: RISC-V: throttle perf events

 drivers/perf/riscv_pmu_legacy.c |  4 ++--
 drivers/perf/riscv_pmu_sbi.c    | 33 +++++++++++++++++++++------------
 include/linux/perf/riscv_pmu.h  |  2 +-
 3 files changed, 24 insertions(+), 15 deletions(-)

-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
