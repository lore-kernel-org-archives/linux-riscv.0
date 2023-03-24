Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD888C77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 10:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GBZOoVGeiivP/Kt6QthKYA6ZvRi5+utx2pOHz+j9eLs=; b=t6t1LZ6OlqX7eu
	dCp+L+kYhNV+TQDzdwuOpZtmO4ksA/aRIDMqIPgdY7im1eMVhqtiTvrUuHvQv5LUXuyrNy2NixxbR
	R6sCvg4AkXi7x1qaj5gWbpgHMSn8IFYqtidsHo9CXye6NvDQBUkpveFZ27V6yaGHsuRqG5IgOOZwK
	Z9a6AWjdr9V4izRRYPJ+d6P5eSSQ7/nH0mIhs+21aN6Hmt7xj3lZPUwUQZzoyHbp4uwr+u8snY4PJ
	gr7rbGYt6LtU1TmmWUO/2KyFqPz/VOt6hLuIvjpLYZ5Gn3yhAO9Cj8Fr7KtveO2APs4VA/I3+XQhX
	TSL37EENFotHxf6POy1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeJn-0046mB-1s;
	Fri, 24 Mar 2023 10:06:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeJh-0046jT-0w
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 10:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679652397; x=1711188397;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=htACZM7UlhSwkOQstbGQxtdxCYSPTGxE1Ea6gOWEefY=;
  b=lYfoWsKbMTqNZ/8n9V3bmfJRmsC+NvTMrUsMpfreYjoiyccNyJvBQ0wR
   FqC3XKaxi3tZRDab4ZZ0kzqh6+cmUK2+jCdDIqjUimUJGkKJg48POgzbn
   gINF7YIgx4AbOV8uryvfudF4AgKZ63Lc9tKsoP2GIJYx1InlL6NAwJCJP
   wSh6+V2Qm5blp4GYqsv08V9pIhl61e9QR/tND2rLgvA7ZczU6FtI3O4k9
   HsADAwTYT1fqFaRg833tLXStvxk5Oqnum415l7N251RwTVArW3yAFMda5
   RJnaBuB0J7ltyYg7Q0Ik3rmXqQezHRa9BZmDPhYDoXHb9vkasrhMWIAB3
   A==;
X-IronPort-AV: E=Sophos;i="5.98,287,1673938800"; 
   d="scan'208";a="207071497"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Mar 2023 03:06:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 03:06:30 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 24 Mar 2023 03:06:28 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, "Andrew
 Jones" <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] RISC-V: Fixes for riscv_has_extension[un]likely()'s alternative dependency
Date: Fri, 24 Mar 2023 10:05:37 +0000
Message-ID: <20230324100538.3514663-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2362; i=conor.dooley@microchip.com; h=from:subject; bh=htACZM7UlhSwkOQstbGQxtdxCYSPTGxE1Ea6gOWEefY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmypS92qRYZn+/YlrjG1sNGZr34v4z95suYXz++czb4TPqu CFeZjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExEVImR4eHLHNk3rpevrGdmW7vnjd H5wBD+vRMavs5abMKx67HCvUBGhu/lbb3nd1vNtrNOMVC5eefqYzVxUY/eXbGPF+48a7ViMz8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_030637_384721_5A4FF89E 
X-CRM114-Status: UNSURE (   9.90  )
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

Here's my attempt at fixing both the use of an FPU on XIP kernels and
the issue that Jason ran into where CONFIG_FPU, which needs the
alternatives frame work for has_fpu() checks, could be enabled without
the alternatives actually being present.

For the former, a "slow" fallback that does not use alternatives is
added to riscv_has_extension_[un]likely() that can be used with XIP.
Obviously, we want to make use of Jisheng's alternatives based approach
where possible, so any users of riscv_has_extension_[un]likely() will
want to make sure that they select RISCV_ALTERNATIVE.
If they don't however, they'll hit the fallback path which (should,
sparing a silly mistake from me!) behave in the same way, thus
succeeding silently. Sounds like a

To prevent "depends on !XIP_KERNEL; select RISCV_ALTERNATIVE" spreading
like the plague through the various places that want to check for the
presence of extensions, and sidestep the potential silent "success"
mentioned above, all users RISCV_ALTERNATIVE are converted from selects
to dependencies, with the option being selected for all !XIP_KERNEL
builds.

I know that the VDSO was a key place that Jisheng wanted to use the new
helper rather than static branches, and I think the fallback path
should not cause issues there.

See the thread at [1] for the prior discussion.

Cheers,
Conor.

1 - https://lore.kernel.org/linux-riscv/20230128172856.3814-1-jszhang@kernel.org/T/#m21390d570997145d31dd8bb95002fd61f99c6573

CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Heiko Stuebner <heiko.stuebner@vrull.eu>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Anup Patel <apatel@ventanamicro.com>
CC: Jisheng Zhang <jszhang@kernel.org>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Jason A. Donenfeld <Jason@zx2c4.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (2):
  RISC-V: add non-alternative fallback for
    riscv_has_extension_[un]likely()
  RISC-V: always select RISCV_ALTERNATIVE for non-xip kernels

 arch/riscv/Kconfig             | 12 ++++----
 arch/riscv/Kconfig.erratas     |  6 ++--
 arch/riscv/include/asm/hwcap.h | 50 ++++++++++++++++++++--------------
 3 files changed, 38 insertions(+), 30 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
