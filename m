Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1660C2BBCA
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 20:21:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75B2A236FB
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 20:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75B2A236FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4utXxLfTvyImxSS2WvTWZ5wY0IQfpdRmHFPAuxbVn8o=; b=lakzCReEYNs46a+hg9tq2EYZ+
	5pnZqrXBlt/YKb4v3DaLZSO0Gm4pcFyf7/O9WV3FjHzBmLKqj+ydeKC6BlAM38F+ZgsT0bGeYSEFQ
	ITCsJMrq3e2pqy6oa+AZc4rUCSQX0PDCHrZSOWc3cqAcDIDTEWM+uy4Xe3Tq05g76XScCCU53bj1L
	YjR09xhjh+02MNpIPSfDF3iJ1eedRVymy9UfXPpjWIz9fKBs6K7kRRF7DzB91QhbL28rkZCmPPBjq
	g8CfqER8NwlGQAHvU0rlkDatPWnQqO9tQAd8ncVmsdUBOoRcu2gFEyA5yEejCjvVlqrJk/vz9099V
	4Me7BAMRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpdIU-0006I9-1z; Wed, 16 Dec 2020 20:21:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpdIR-0006Hc-1b
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 20:21:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608150073;
 bh=E6+S0iH7JA6VSioCcRQNsQtNX73hr73AJHCOek3qQ2U=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=i8ELWSJXsO/nvyD3rEMIkiZpJ4FaJ8R6rvUnukYchKNLenDvb7MAnP1Wc8X48UBhA
 HKBT6liNXbsbYY4IFcH3+wQAJLe/JLdvH/4xkUb1k7eJWHIlveQJ6I5ZdMNPV5Mard
 uiVgwDb0dc7XOWjgW5DfLCDNhsfjjIGSXiQjXsv9xp3Odu4xMx7gR6t00nElfk3wmu
 Tq1br+HoRo1Ew2hispa81r9iNWU20hE47XMtSCKZbAu1ucGyxBQCYyVWeEF5eUDTIi
 ZedmPDoyxPFIes1cmB5KZCRMOVrcDbw8IVWeS1Y9D3UAKiIvywrCQVx4PLhnDdTsnD
 X93r0EneG75tw==
MIME-Version: 1.0
In-Reply-To: <20201209094916.17383-2-zong.li@sifive.com>
References: <20201209094916.17383-1-zong.li@sifive.com>
 <20201209094916.17383-2-zong.li@sifive.com>
Subject: Re: [PATCH v7 1/5] clk: sifive: Extract prci core to common base
From: Stephen Boyd <sboyd@kernel.org>
To: Zong Li <zong.li@sifive.com>, aou@eecs.berkeley.edu,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pragnesh.patel@openfive.com, schwab@linux-m68k.org,
 yash.shah@sifive.com
Date: Wed, 16 Dec 2020 12:21:12 -0800
Message-ID: <160815007240.1580929.5097103153471981375@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_152115_543734_EF0C933A 
X-CRM114-Status: UNSURE (   6.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Pragnesh Patel <Pragnesh.patel@sifive.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Zong Li (2020-12-09 01:49:12)
> Extract common core of prci driver to an independent file, it could
> allow other chips to reuse it. Separate SoCs-dependent code 'fu540'
> from prci core, then we can easily add 'fu740' later.
> 
> Almost these changes are code movement. The different is adding the
> private data for each SoC use, so it needs to get match data in probe
> callback function, then use the data for initialization.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
