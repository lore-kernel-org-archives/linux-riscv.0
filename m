Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A639C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EndRqNSCiSyMOaJJii99TbPtgshiAt9bbdZqz8J80L0=; b=4NTU30TGAJ8zqL
	w4ThKWvHYqJeTCnry2I/dLhNPaLeS7zx1bwMWGh9c6BSUxBWUo+6Lqg1E8neYbJvmBsvSaa2wAMvh
	yylw6HK6pkteY9bI1WURjAphQBYtGYLLJhsGeN/9rh5IVzOFWsK8OnON13ks/0Y8LX+w78R3R0tpY
	LJaaC9rpNKrqViyStVgzyYTHjdFPMLG9EP51wJW+xaSZHoVSs7t7TbkkQg8hMaVFnHIAL5jsgWfsC
	rST3ScTrsRW1WCDqJi15k2GWc+Y64O+yXPfJMV0mIBDNFZE8mSKzU+reEHN9A5+KtDmQj27Iqhc69
	SZig+TrxbARIPEfTsQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01xD-009S0G-Vs; Tue, 29 Nov 2022 14:51:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01xA-009Rxl-Qi
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669733480; x=1701269480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1i28Wk5Zmf2QpwRYWuzzGRuioCBIh5xXRO+2UEVDDDs=;
  b=c2NmL31zpzmTnTz1I5ew3sBm0NrvgpQh9YVc2bPV0RZaNa3qnxsiDLE1
   rDwrS4FfoUesMr/lyZ/fS+QQM34TkXnAcTabNG3TI2H5Cjrp2e+rQcsUB
   RMZ3pJR1VMSJH5S5AxYtle5g/3kO8TylQusa17siIzkhntLovNf/jL4qP
   b36/n3HFAYx3WyFqp70cuwuTihEHMlPA/PVYhckwU0ptvg7V8QKHVtQxN
   +VU2iDZCRDBVU/P3+bZQfvYzcVw2gA4imoiqoyJjfI59ndpUw/lo0v5kr
   SV54TU+kv0C+f0v+Ygpy077XEZZ7DMJYX9EXQ31OLXfFjmNpxuLJVGI7k
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="125626126"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Nov 2022 07:51:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 29 Nov 2022 07:51:13 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 29 Nov 2022 07:51:11 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, <ajones@ventanamicro.com>,
	<aou@eecs.berkeley.edu>, <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<guoren@kernel.org>, <heiko@sntech.de>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-kernel@vger.kernel.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh+dt@kernel.org>
Subject: [RFC 0/2] Putting some basic order on isa extension stuff
Date: Tue, 29 Nov 2022 14:47:41 +0000
Message-ID: <20221129144742.2935581-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <Y4XvnHIPw8ZuBZEk@wendy>
References: <Y4XvnHIPw8ZuBZEk@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_065121_033435_722505F6 
X-CRM114-Status: GOOD (  11.43  )
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

RFC:
- I have not even tested this, I just did an allmodconfig
- I don't know if I re-ordered something that is sacrosanct
- I don't know if I changed all of the instances
- I didn't write a proper commit message for "patch" 2/2

With those caveats out of the way - all I did here was try to make
things consistent so that it'd be easier to point patch submitters at a
"do this order please".

I never know which of these can be moved without breaking stuff - but
they all seem to be internal use stuff since they're not in uapi?

@drew, I didn't touch the KVM ones - are they re-sortable too? My base
here is rc7 so if you did a reorder at any point there I'd not see it ;)

CC: conor.dooley@microchip.com
CC: ajones@ventanamicro.com
CC: aou@eecs.berkeley.edu
CC: conor@kernel.org
CC: devicetree@vger.kernel.org
CC: guoren@kernel.org
CC: heiko@sntech.de
CC: krzysztof.kozlowski+dt@linaro.org
CC: linux-kernel@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: palmer@dabbelt.com
CC: paul.walmsley@sifive.com
CC: robh+dt@kernel.org

Conor Dooley (2):
  RISC-V: clarify ISA string ordering rules in cpu.c
  RISC-V: resort all extensions in "canonical" order

 arch/riscv/include/asm/hwcap.h |  6 +++---
 arch/riscv/kernel/cpu.c        | 26 +++++++++++++++++++-------
 arch/riscv/kernel/cpufeature.c |  4 ++--
 3 files changed, 24 insertions(+), 12 deletions(-)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
