Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01A6C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 17:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1r1ocu5KXKizQFue79ATosxMK0b6suhBRsY04lvUruI=; b=FJrVv5KX0WAu/0
	DAh+hp00NxtQU1WZvGShg61LvLzhbcp5VZiV9/eBUDrfeofxoaInc3kQrhsCdsr9CIF+qB2cP6rka
	ARAn44GQUO8FaohyrwDMEELgjFoZj+8WefolPTppOZSNwz0vvQcVAFPMyWi3vkkurMyo68ngeqDVJ
	2tTXpq4s0Fox/oSHfjtkhYq2BBMQhV9l1TQSxm7ATeohTXu7JprSSI23ukwjIKQswvb2THA4tnKBe
	x2CJFGDdtnXy64jPihxqpIzbFv29z6YkQcYRUrn9QpuJsa+AOwvaqoG5+BSgZ4bpQSCjNU0DLA23n
	XAoEmzB5hZ0hK9aYQ7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf0pR-000000066pB-3XRt;
	Tue, 27 Feb 2024 17:01:17 +0000
Received: from mta-04.yadro.com ([89.207.88.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf0pM-000000066mt-2lPA;
	Tue, 27 Feb 2024 17:01:15 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 6DE4CC002E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-04; t=1709053260;
	bh=MD+Aeir3B6NSv5VxdWchXqnIlbEpAOLGX4DiWLdrVQs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=odVUulp4NTJadskyMmbqTctpkueG6DuJQskXWlApGq9Of11jwpjc+jZO5lNzUvULZ
	 4bvfaTF5pihBqOcBZ4aR1kVPpxK3+yOftUV9Evv2ArDHGzfXGP8h5xdCEuxag8myTE
	 WBMEn60qMbaRZ36RLeTEVg53ecVqA2XHm/qYjJXvWiiszQrlAWsqGXp1F49zjZyms7
	 WBneShy6r8Q7lxT6xk9iXwBjR3ULiwe7TDnEKO3cjXmxrS02y0HjSbtWsq3TqCdqJW
	 dPEJpGGPAn6mCorXzK6eHLDuJp+0rfipZ6axfB4js2nRdXVYBK4So8wUrpdbhKvKdB
	 I5k50oiX+0Z/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
	s=mta-03; t=1709053260;
	bh=MD+Aeir3B6NSv5VxdWchXqnIlbEpAOLGX4DiWLdrVQs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=QEUyMi2grJRDP+vJgy1S9AD4Dh5Bl9f2gqJEX8jl10Wj0syR3GLEoi6sPoXtklDhj
	 XD13tipkqxWH2MiC965NxNSKfSN62lyCnhxs0syGb0uRvwMlJJWQtvEra1MvVUKTuu
	 hsFnLrLpSfxujVW8WsnZpGzdgClB5jnO1BcYFTQ5W8l8fIQkkzlIuzu1zDGLBrU2Xo
	 hYPC3LEVZbPKM0zzDEEc43vVfzcFbxk83TkYIpdlRJkI9kG/4+nPhkQGZfYDqVkWLv
	 vwHeE+HZK+9YUrsgeGEd9vgTEe7qQb1EE0tRlYdCZ0vMoCshElQrt3Pg4ShrDtaC74
	 qyXKMNMXXb/8w==
From: Vadim Shakirov <vadim.shakirov@syntacore.com>
To: <linux-riscv@lists.infradead.org>
CC: Vadim Shakirov <vadim.shakirov@syntacore.com>, Atish Patra
	<atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, Will Deacon
	<will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2,RESEND 0/2] drivers: perf: fix crash with the legacy riscv driver
Date: Tue, 27 Feb 2024 20:00:00 +0300
Message-ID: <20240227170002.188671-1-vadim.shakirov@syntacore.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-ClientProxiedBy: T-Exch-05.corp.yadro.com (172.17.10.109) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_090112_953145_F8AA0FC8 
X-CRM114-Status: UNSURE (   5.55  )
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

This series fix crash with the legacy riscv driver when configs:
CONFIG_RISCV_PMU_LEGACY=y and CONFIG_RISCV_PMU_SBI=n and you try
to perf record

Vadim Shakirov (2):
  drivers: perf: added capabilities for legacy PMU
  drivers: perf: ctr_get_width function for legacy is not defined

 drivers/perf/riscv_pmu.c        | 18 +++++-------------
 drivers/perf/riscv_pmu_legacy.c | 10 +++++++++-
 2 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
