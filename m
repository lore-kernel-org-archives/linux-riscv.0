Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7B5C43460
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 01:10:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D08B0610FC
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 01:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D08B0610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F1owdAn3SO6U7DShjToi8QfcNEY+5PpjBILMBTXb/iA=; b=cdEe/79diagQjL65ipK/u2H0b0
	bfodnwQXjvlQuEpHzvLniDx22HZ7qHPdx96XryIBWeMd+fTzhNIgLlImt5V0dOwLn3uLNAmtwMm6i
	83610QP7qX1CpR45SMCq/kAyH4KDIL25bDsqKiGwBqbyZuZGUzk16oFu6qLve2jVFwiV0LAUwcGVd
	eCzfq7TpRbohuvn7C5x0e7OYkI9FvmBBPmSyRPPIxUN3lOtCZl2UoX0M246U1HioolV2bM/8vOUxc
	r6pu4v3orP1j5T37+xhhYsBQFOfWignNUTnQiVYjV8g0DtjrAn1Z+Ugvgpbb4CnsP4voSO8/1H3+1
	ZcaTMfeQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXZTl-003vja-HV; Sat, 17 Apr 2021 01:10:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZTc-003vhe-Gl
 for linux-riscv@desiato.infradead.org; Sat, 17 Apr 2021 01:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=+YQiaEQm9MrxbfxHO/4/8kLRxztRCUW54q3Z+/cO5pU=; b=Je3aVMNKV1HmSGN8icrIs0+1Ji
 qN/zAJFnUgF+uFcHsPhXSECIfO3oxmuRNaGL+fGGXmM+8cJShbE7tNOBMGR6zyrX6vV3rC1Dk3vie
 vjUlslGNzxKeoW8PZwDrxX4i7QtyOprTN/fH1oe8mF1xv+kqb32lLQGdE8ewBWb3VZTooAb0fzfCn
 6TwywAdjsYiiFN0okLPsBhetAhqdzWwtixDVDKXCsUwhfn1pb9goUE9JU5JTuDHtLO0anHefLlpqw
 ie4gUB3F8GhoglHvQMtgKRWbTmJQYoT3bEByZQzS4RmZG0VtAcbTHdP5+IeLSRLypm+pjPRGXPkHk
 VJfs9n3A==;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZTX-009owN-Dj
 for linux-riscv@lists.infradead.org; Sat, 17 Apr 2021 01:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618621819; x=1650157819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Zm5rXOuoxnhCqnsnX85LqLLaCeZAEf+Eqn2CbNRDuc=;
 b=WfsWzDXHr155Dh+RHPrAn76HjGMbKL055x2uCO9qcyv3sAnNWVclos+K
 UuwqKza+QwXbMrw7fNAEBSvqlqH5c8A5ci6z5lsiOjnzjplbOWcTkbmCy
 vVFQh0pAW8M+z2OUTnUIzEjMi8ZCS6bjzRVGMzDJ0eDEHUvxT95syMhPd
 rZX1CPoHR+tXMVkSHhOUBycuBb/WYXWzR6wWV6ovjKEmE3GJJ10uxvDii
 l937gu/OIVuAPM7lZe9NADD6SXKCaG+kkICQ4PPMge9uq1tuFL1b5WyLA
 Z+f63lrEFXJxXmb5abtwpXTo3SU10jqpJ9Zq2jZgUcGA+pLkhU61gKLS+ A==;
IronPort-SDR: LdzBvPsaRBYARALerWbeHsVQlnRUgbN8fuVvHfFGfbZ16gu6jWRww4vaO/nCxhekU27WAaR5u8
 DBez7HA0+FVYj3nTRzfFb3iwpHbosnpGTeEvafy9EZggx5afkdh+3zJmbgNOw1KaFMkkktkEe8
 ydbEm2nJBHElYkucdWw9YpNXx0//voyWSfpFgxk1DSIQFAJIzBp6UhU37UN92/BrUki1/S8Lqd
 ifTkqx+MOmbE2iyBwlhSkMtA9mqTjE431U4xrBJ/8QFaf9SOAc1+KvnoQzGneootWGkFGcelUg
 +4c=
X-IronPort-AV: E=Sophos;i="5.82,228,1613404800"; d="scan'208";a="165185052"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Apr 2021 09:10:16 +0800
IronPort-SDR: vKgsTMDSvTj60xiVKK7pYGpy/vV8gNTgHWZgZczc48OoTNErdU4XDk2SWNLSraznJHNCTfGjhR
 cUoPLPcBAkCmRDvdk/4A/Tb3G+JAw9qDQZD4NC8oIAtw9Rf1GzN/Bpu17S+C+Mad00xXkDqL2k
 RChIuOZXozrH7TmNiPlLMizGaRsCD9T4/nIxvqjhMiJNcTJ5+I2XJwCvXNFq2PEy1H7hIVcgBH
 NCwkNtFpLVdxt5AVQ1h3vytTWR1srnL/qtEv6dRPecjuonwDqaYe/YDd3pZSlyg7Ty80GjKBls
 5t8hbui94O/9FKaYfAlI4LLJ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 17:49:29 -0700
IronPort-SDR: t/sQcqGKZClTo/liT6bedqOZlkIQPGkBtzN2/WbRRe2vUlcY9ZHoZMOZLwXbIgd/2SDbG4tHo1
 iSDTFz+nNMIFpB1s8nOHUzxeRITbtsURGCI6j87L1OFXDbr04Hdblv0jr4uUKlKrxblyO7U71V
 +jU3mRTnTff8Jw0tKFmhZdMH7rq6O0oCKCveVXXpl2yHpLptMBUii+sQYao9fUWYF2suObZFNy
 TbYFS5A9dkNW/f74Fv/klbz6GfKhC2HkuLJOyUHDe1E5FHuM6yucNr9+C7BRkq9bS3awW6DxVU
 F10=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.5])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Apr 2021 18:10:15 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: uclinux-dev@uclinux.org, Greg Ungerer <gerg@linux-m68k.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Christoph Hellwig <hch@lst.de>
Subject: [PATCH v4 0/2] Fix binfmt_flat loader for RISC-V
Date: Sat, 17 Apr 2021 10:10:07 +0900
Message-Id: <20210417011009.54569-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_181019_486638_17AA7634 
X-CRM114-Status: GOOD (  14.30  )
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

RISC-V NOMMU flat binaries cannot tolerate a gap between the text and
data section as the toolchain fully resolves at compile time the PC
relative global pointer (__global_pointer$ value loaded in the gp
register). Without a relocation entry provided, the flat bin loader
cannot fix the value if a gap is introduced and user executables fail
to run.

This series fixes this problem by allowing an architecture to request
the flat loader to suppress the offset of the data start section.
Combined with the use of elf2flt "-r" option to mark the flat
executables with the FLAT_FLAG_RAM flag, the text and data sections are
loaded contiguously in memory, without a change in their relative
position from compile time.

The first patch fixes binfmt_flat flat_load_file() using the new
configuration option CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET. The
second patch enables this new option for RISCV NOMMU builds.

These patches do not change the binfmt_flat loader behavior for other
architectures.

Changes from v3:
* Renamed the configuration option from
  CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP to
  CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET to clarify that only the
  offseting of the data section start is suppressed.
* Do not force loding to RAM (contiguously) if the flat binary does not
  have the FLAT_FLAG_RAM flag set.
* Updated commit messages to reflect above changes.

Changes from v2:
* Updated distribution list
* Added Palmer ack-by tag

Changes from v1:
* Replace FLAT_TEXT_DATA_NO_GAP macro with
  CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP config option (patch 1).
* Remove the addition of riscv/include/asm/flat.h and set
  CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP for RISCV and !MMU

Damien Le Moal (2):
  binfmt_flat: allow not offsetting data start
  riscv: Disable data start offset in flat binaries

 arch/riscv/Kconfig |  1 +
 fs/Kconfig.binfmt  |  3 +++
 fs/binfmt_flat.c   | 19 ++++++++++++++-----
 3 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
