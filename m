Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CFFC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AdcUugLm4U8n0tGOAMqitErCnnIrazg80qiaMvhI23g=; b=dvtDMyZWCkbA9T
	tfr5A/znaFTx+pTZlGyMup3HfJyOzrlhMHeWLnOlhk8PnXbmDp5/Jk0AqMZDCG9Dw63bo/+jVirmW
	Ss5cSWQsiBqIre/iyaW65xvUfiZnWEox3YBaMzj3EVi+5mKcWEniPaIacjtn71ryVs3EdPLo/Pu6E
	jxvOhPV/D6idS7P/HQSuwG+6dKJ7R1vPpvlf9y/c/3tcXzyzPEXwunhiIpBZjVLWNa9fcKp31c/3d
	aTeHKDkJ2iKAvJvVAiKBCrant/HcZZaAybBTeN0L/ZY7UUBCaGHs282aF5+AOIHSgFHbtw84PXgHT
	lg2Et3/qubdylrd1hqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0XAz-003WuM-Vr; Thu, 01 Dec 2022 00:11:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WiF-003Jku-AR
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:42:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 59CC361E1B;
	Wed, 30 Nov 2022 23:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DB1C433D7;
	Wed, 30 Nov 2022 23:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669851716;
	bh=eiDyEPrPFONwuiVxz0Bl5Re71qAslT/jb7BX8jhuC4E=;
	h=From:To:Cc:Subject:Date:From;
	b=nGGP8AlviNIGy6DUe4KSoJIk14WQ0lGfsC7QD87q7uSkk74mPS/lE72vj/72ZRYfV
	 YT+6/KwXJ9HmJkBWyfBIcorfnPPGneT0mvB6CwzpkaIx98QGjsAvMU2ODOaOHHTghB
	 bomhVG8ZIwQMpqE9rGROXa44Lcgxv/jnEB6bHywQw9lHO77qSvIjO/+/kI2fj6SgLk
	 ZTufMqnY3Ubw7X6uZNVjRvXYEouyllsZlKb/irw2lpvVnE2LMuQ2EYZ9SwG48vDcek
	 v8GUxsC2JMuh+IEVGwYHlsfizOdfcO6R38/bQjmXAyF6DQFxWQkIAR/8rnr68c3p1X
	 wM2iVPWXxOT+w==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	corbet@lwn.net,
	guoren@kernel.org,
	heiko@sntech.de,
	paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 0/3] Putting some basic order on isa extension lists
Date: Wed, 30 Nov 2022 23:41:23 +0000
Message-Id: <20221130234125.2722364-1-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_154159_544396_1B50F976 
X-CRM114-Status: GOOD (  11.26  )
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

From: Conor Dooley <conor.dooley@microchip.com>

I don't know for sure that I have not re-ordered something that is
sacrosanct. It seems that all of these are internal use structs, and
should be okay, barring the obvious exception of the, intentionally
re-ordered, isa_ext_arr.

With that caveat out of the way - all I did here was try to make things
consistent so that it'd be easier to point patch submitters at a "do
this order please".

I never know which of these can be moved without breaking stuff - but
they all seem to be internal use stuff since they're not in uapi?

For v2, I added another path with some uapi docs & switched to Drew's
suggested ordering of alphabetically, except in the /proc/cpuinfo array,
as per the discussion today in the pw-sync call. I also added a
sprinkling of comments around which things should be sorted in which
way.

I guess consider this an RFS, with the S being Screaming in the case of
me doing something you abhor :)

Thanks,
Conor.

CC: ajones@ventanamicro.com
CC: aou@eecs.berkeley.edu
CC: conor@kernel.org
CC: conor.dooley@microchip.com
CC: corbet@lwn.net
CC: guoren@kernel.org
CC: heiko@sntech.de
CC: palmer@dabbelt.com
CC: paul.walmsley@sifive.com

CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-doc@vger.kernel.org

Conor Dooley (3):
  RISC-V: clarify ISA string ordering rules in cpu.c
  RISC-V: resort all extensions in consistent orders
  Documentation: riscv: add a section about ISA string ordering in
    /proc/cpuinfo

 Documentation/riscv/uabi.rst   | 42 +++++++++++++++++++++++++++
 arch/riscv/include/asm/hwcap.h | 12 ++++----
 arch/riscv/kernel/cpu.c        | 53 ++++++++++++++++++++++++----------
 arch/riscv/kernel/cpufeature.c |  6 ++--
 4 files changed, 91 insertions(+), 22 deletions(-)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
