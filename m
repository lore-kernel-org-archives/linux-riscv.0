Return-Path: <SRS0=fYNd=P2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C12C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 14:04:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 144DF20652
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Jan 2019 14:04:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YJsFOfzr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 144DF20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GJcMjLGfclQvtvd/wMf3kq538CczZWZU3wT1jUfR8HU=; b=YJsFOfzr8fHbyI
	p7BbKqn3RSYOzqf7KseCLphljGeHlO7bLi3W0FoEcoN7aN0+TFAhsZoXipRHHTLmNZSMCSAlywAl8
	Rm5imOk14kYQYEtoC36v4UU8nIClk7a3+1lmUna3ED0JcvFXGXvQTZlQsWXIF6AgxT0o4rwkARzin
	QkFgICiIpINE4LakzuQcL5Kn/6TytGMYYVmRKjORUV4aMTmjpfgHVH7PMZs/avLcfnWFAb8vuo5N9
	WM2PAubCWgi2i/E9860bkHxOGUJyVie9PeT4g+7/lKZndIcNBgJhmViH/kRAPFtBzX2Hu1K05msIo
	mi46GqkX27h5o+hYGSeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkUlM-0004mt-2s; Fri, 18 Jan 2019 14:04:48 +0000
Received: from mail-lj1-f196.google.com ([209.85.208.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkUlF-0004gT-Sy
 for linux-riscv@lists.infradead.org; Fri, 18 Jan 2019 14:04:44 +0000
Received: by mail-lj1-f196.google.com with SMTP id g11-v6so11731453ljk.3
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 06:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6s0qcmO7aLfyfOw7s9z/Yj/ilkWPQG8suncvc1U/E+c=;
 b=Udvr0R03NkOIyT2w6Zx+BkrPQxY/yvlC/9crnHr7vnLKFivsfNfM+uZm5MQuaALawG
 ZAVWBKX5v925gvuA2FCxcnLosKkKx6kjZAqDigheoLzRWtPGpTKO3Jv+tFJyy7xFgg2U
 j3BZtyR3wYpiLjEa+zdX5MQR5dDb5RWHLf1cpF8D1xM7UhMHBguJtTQmbgrheEBDmd5n
 GfNzhueSDQ0nUjWoWAac8+XAvYo99OjdaSXqmrcfTOd32/Ya4lQWXUxvCClqw8+onWaw
 rQFxBEOxAyhDIL1Y1kklqzQdAP4pSu4XeXYM3ESr+lNciJLpKG2K8NBVvaNQbFCFy1+F
 bzQA==
X-Gm-Message-State: AJcUukcelMw7hudwI/S52d7pdKy8KgvkYv09AmvKtNSGn4PIA5EAR5ol
 qxuemFZfCcsqP1j+yWSaPRM=
X-Google-Smtp-Source: ALg8bN64/LFaxgPtmOG1WY9K4KR8K2Fq6zla9/G9/fJ0S2sFKUtlfG32I3QTc5UBnKjNhY8cSR5cdg==
X-Received: by 2002:a2e:58b:: with SMTP id
 133-v6mr13063600ljf.127.1547820279081; 
 Fri, 18 Jan 2019 06:04:39 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id x21sm809546lfe.6.2019.01.18.06.04.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 06:04:35 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@xi.terra>)
 id 1gkUlB-0002Vn-2C; Fri, 18 Jan 2019 15:04:37 +0100
From: Johan Hovold <johan@kernel.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 0/5] riscv: minor fixes and cleanups
Date: Fri, 18 Jan 2019 15:03:03 +0100
Message-Id: <20190118140308.9599-1-johan@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_060441_971959_4B4BBC06 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This series fix up some minor issues found through inspection.

Note that the fourth patch changes which cpu (hart) devicetree nodes
are enabled by following the Linux convention of considering nodes
without a status property as enabled.

These patches are against the riscv-next (and fixes) branch with Andreas
node-reference fix applied:

	https://lore.kernel.org/lkml/mvm8szwwo1o.fsf@suse.de/

and have been tested using QEMU.

Johan


Johan Hovold (5):
  riscv: add missing newlines to printk messages
  riscv: use pr_info and friends
  riscv: fix riscv_of_processor_hartid() comment
  riscv: treat cpu devicetree nodes without status as enabled
  riscv: use for_each_of_cpu_node iterator

 arch/riscv/kernel/cpu.c        | 28 ++++++++++++----------------
 arch/riscv/kernel/cpufeature.c | 13 +++++++------
 arch/riscv/kernel/ftrace.c     |  2 +-
 arch/riscv/kernel/setup.c      |  6 +++---
 arch/riscv/kernel/smpboot.c    |  4 ++--
 5 files changed, 25 insertions(+), 28 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
