Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C733C4708D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 14:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QtLkCZKqwOnj1C9lmVOtbQHmSTOVfsCXZVH87BWJGHw=; b=trqH+QgYP6XVBA
	88Y9nt9Za9vkk+wehIUk8wB43vZ7Vj9ip44TnRxgecC/052lUrCvdY4NJUBMaBFQbYVllDi/bDh8P
	AJ/PmkLTRMXnFQh3d7UHwdIwBSAv1oIH3b4GBBrLqad+0JyD1ki5LZfW1erxdqJDubywOBov4Enm+
	3ceyy9ZqhL9cIA0Tuy0WKJ7mNycZQhSotNz2jhGimgpEiEeKcLJo8ELwcLkD42rDXfG9LVy2U+5wJ
	4uAZb9apKHx55w+4sZnF9iLTDoa1Tcm335l5bpVPQW0EZlcIvjKkmTjCDV7lS09Lk45+J1w8ErdFf
	zZmSNMTTxLoP7uNrIWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Cje-004C0n-CV; Mon, 05 Dec 2022 14:46:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Cjb-004Brq-CW
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 14:46:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1670251579; x=1701787579;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fNYiF1ogl3tzaX/gkv9v+1He+AojtwgLXxTo8k5gkC4=;
  b=qR9ojPJcW0J+bAe/R6x4ChCkjbx0u+0hI37qdjahfPgFo0j9F2RIgexr
   mov4yVXFlULL8+q5PMjitDYVoVmro3yYi2IfTT9jW31SYNl/Qs6FYRoVi
   giYlbRx3Ztq1fdFE4WhMVoA/pwMy7MJizMKzI8XpjOjnC/uHvk5C3uB9D
   jkkzhYK5kTnqAL2tOi3T9SJBjudFmMSoj5DAKEi3Hxscoh7M4InfOwBLp
   83nGq0aC8ic66RMwOaCi4kgs2eRBO+a9peRfAiuiWA+wrq/P6re+KuZR2
   thNkX+4y4lURTjX9ySU4ZCXTIe6v2fP3//dJFMBVO2TXKJ74RS2MiXhDp
   w==;
X-IronPort-AV: E=Sophos;i="5.96,219,1665471600"; 
   d="scan'208";a="126535113"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Dec 2022 07:46:12 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Dec 2022 07:46:12 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Dec 2022 07:46:10 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>, <ajones@ventanamicro.com>,
	<aou@eecs.berkeley.edu>, <conor@kernel.org>, <corbet@lwn.net>,
	<guoren@kernel.org>, <heiko@sntech.de>, <paul.walmsley@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v2 0/3] Putting some basic order on isa extension lists
Date: Mon, 5 Dec 2022 14:45:23 +0000
Message-ID: <20221205144525.2148448-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_064619_550022_78EDC0B9 
X-CRM114-Status: GOOD (  26.21  )
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

For v2+, I added another path with some uapi docs & switched to Drew's
suggested ordering of alphabetically, except in the /proc/cpuinfo array,
as per the discussion today in the pw-sync call. I also added a
sprinkling of comments around which things should be sorted in which
way.

Pasting from the chat on v2, since it's relevant to whether re-ordering
what appears in /proc/cpuinfo is even permitted..

I wrote:
> Drew wrote:
> > My biggest concern is how much we need to care about the order of the
> > string in proc and whether or not we're allowed to fix its order like
> > we're doing with this patch. I hope we can, and I vote we do.
>
> Being a bit hard-nosed about it:
> - the spec has said for years that this order is not correct
>
> - their parser cannot assume any given extension is even present, so the
>   index at which the extension starts was only ever going to vary wildly
>
> - to break a parser, it must expect to see extension Abcd before Efgh &
>   that order has to change for them
>
> - expecting that a given pair of extensions that appeared one after
>   another would always do so is not something we should worry about
>   breaking as it was always noted in the comment (and by the specs?)
>   that new extensions would be added in alphabetical order (I'd like to
>   think that if a clairvoyant wrote a parser and knew that there'd be
>   nothing in the gap between the extensions we have now & what may be
>   produced they'd also account for this re-ordering...)
>
> - the re-order of sstc is going to land for v6.1 & the addition of sstc
>   out of order landed in v6.0, so either that is an issue too or this is
>   fine

I'm sending the patchset, so I think it's bordering on obvious that I
think doing this is likely okay & maintaining a "strict" interpretation
of what the spec says is the way to go.

I think the only case we have to worry about breaking uABI stuff is if
this changes behaviour in a way that could not be done by an otherwise
valid change in the ISA string, so bullet 3 above.

I'll leave that determination up to the Higher Powers, but I think it's
going to be very difficult not to accidentally break this order in the
future if we decide that what is currently there, must remain exactly
as-is.

Thanks,
Conor.

Changes since v1:
- strengthened some wording to use "must"
- reworded the bits in both code & doc about what canonical order is
- added some missing "... must be in alphabetical order" sections to
  both code & doc
- forced an _ before multi-letter extensions
- there's likely a trivial conflict with drew's addition of an assert
  for RISCV_ISA_EXT_ID_MAX.

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
