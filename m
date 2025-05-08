Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D16C3ABCC
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 04:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XxZCAT4HVWv625c5jPAEUSnwZwShml1wCC4K8Ehcgg=; b=X27lykIAuzbMrj
	CC86Flw8cynRciYc+8v/38iwpgJM0KqErkg48kVKXd+u+ACYYjEOG5Ez3f8PuztQX9wuSxWz5VLyA
	Xg4IeEl3yZVI/b9nFfsjtTMH6JwUZT1tpzl/3GKm+Tw7QIUr88sLLLbBMtJ5rZkdhiF4FCRue1NPu
	MVuul78kFSlBUmGidzWjwf20hHdV7V13sJCLhTSgtHBL7cFlI/D8iWozbt20EMJQyMcM4pBB9f0x/
	qQZLnfaoZvmMfQbYcgqTEMFJyaeJtdALCObJNrRPOpUmD0hx6eRYa1gceRYOJCXyWFLK1fPpY8pLW
	b1doVQS2OT425ohCsIVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCsh0-0000000HH1u-1JaR;
	Thu, 08 May 2025 04:17:06 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCsgx-0000000HH1Y-1VIn
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 04:17:04 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 2D90112FB439;
	Wed, 07 May 2025 21:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746677811; bh=0FChnJQPzz1KtzDEL5Eiax95pO/O1yR1baYM2Fap6x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jt5SNyfodEi1ogDoJwe3JVlS0f9ZGc0hP+3ydAncgh4TPciIv+WHzCwS7EA8wgOq2
	 ExSv5WIqFKleXikDRurQOpnO9sLKKj8Q/CP5fhJNZn5kUh2jDrU5XTu7To6LIhEawe
	 WFDjblpoeXZwDN+Ldqm/FxOAzlQInbwgIJDAP4esF4uBqYxSCC65cKhPbsMvR0Y0dV
	 2eWXhRjgfICEPOWW9pW+yT7GhGlS9HPvkT9ilnJPqNAr00waKTa/Xfhhk40aQaIrUy
	 rKQJM1VJ8PhBwDQOmkR96jpecRuVwXY4mbAnRIUwfTW/8DmRPc+eUC3xhm/I6Vqe+5
	 a3VwjXheJfa4Q==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fgf2V28gQU5G; Wed,  7 May 2025 21:16:14 -0700 (PDT)
Received: from ketchup (unknown [183.217.82.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 5306A12FB404;
	Wed, 07 May 2025 21:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746677774; bh=0FChnJQPzz1KtzDEL5Eiax95pO/O1yR1baYM2Fap6x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jjm612SVbUIilb0k9QVvl0KVmSkGUikSuYuzbBvuBrSD+fnVAduVWKdebnCtcuPJS
	 bOgSUhRzYaysNDP8XobasGJEG9gUQOPwQHRiysaB2L4RdM4mCDdLFKkD/DP0n6QBWm
	 jtdMDoHluKfzN6CUl3jbvGPyi9z7FDSzt2K3FSqrjHf5qlKRqE8MCQrqbekSDULahk
	 IOgfsFVcmz+2cXs/VEaIwmHDHYBzqylZjIp0rIg0NVDqocTjKGghXWegGWFPjRWR2W
	 knFk9wGYe8h6H7KIIXOmNWK3T4/acDoX6Sow2npJ5medxWk0Cuv+FcPnY60vHHiJn2
	 5mfxKRxbEIxGg==
Date: Thu, 8 May 2025 04:16:05 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] soc: spacemit: create a header for clock/reset
 registers
Message-ID: <aBwwBSfnkw6XUOLA@ketchup>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250506210638.2800228-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_211703_727651_57CBE1CE 
X-CRM114-Status: GOOD (  10.94  )
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

On Tue, May 06, 2025 at 04:06:33PM -0500, Alex Elder wrote:
> Move the definitions of register offsets and fields used by the SpacemiT
> K1 SoC CCUs into a separate header file, so that they can be shared by
> the reset driver that will be found under drivers/reset.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 111 +--------------------------------
>  include/soc/spacemit/ccu_k1.h | 113 ++++++++++++++++++++++++++++++++++

CCU is abbreviated from "clock controller unit" thus the filename seems
a little strange to me. Will k1-syscon.h be a better name? We could put
all syscon registers together when introducing the power-domain driver
later, which could provide an overall view of register layout.

>  2 files changed, 114 insertions(+), 110 deletions(-)
>  create mode 100644 include/soc/spacemit/ccu_k1.h

Best regards,
Haylen Chu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
