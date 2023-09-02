Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A58CA0FFC
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Sep 2023 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZHCACB73g8ekauTC9lfUXf9UkxiHbha1Hy6Jpn0/i7s=; b=IYKgCk6ONh/s6t
	swuoQbRFgiYP9jKg+K4avY/0s7omtwAkSQbn+CuGvyZ57RWEtfpv1jQEv+pU+pK2By01vhB9tVA6N
	YeFVz+BZppaUZ5Gu+SyFBth8QZWDwvsOqEfy4gopOBC5YAvMrL1s7pgCL5QaBcbLdC6dJ4WFJXspf
	tSnb8yUekNW46+KL3ADzXSgoWjK8JV7Qc6Jz5yT+SADycoj0hkITz9qSA2BL3lRKlTqe3piq8Ifrk
	C+L+wCx1usEKtTQrVLMOC1sMjJlKOMwe9jLIo28zKOqcPhma4UBOQ00H3xdT/TAxF8WBiEycHw3iJ
	u2rL4iaWWBft/p62xBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcLs9-001BsK-2L;
	Sat, 02 Sep 2023 08:20:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcLs6-001Brw-1G
	for linux-riscv@lists.infradead.org;
	Sat, 02 Sep 2023 08:20:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D6351CE25B1
	for <linux-riscv@lists.infradead.org>; Sat,  2 Sep 2023 08:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBC3C433C7
	for <linux-riscv@lists.infradead.org>; Sat,  2 Sep 2023 08:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693642842;
	bh=KHwO7UIvfTXKfukZ51udwiRCxEWS7g7OeG0BlVZvwG4=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=rrg4+EVdzFn+C12M2ZnCeNKBk0wJlQjTgIE7XJMMWUWVx/ZXpbdJby3UO0Iu4P+aY
	 FlLbfKFJKdbn56oqQFEOKgbblvaTlzMbGE9K9UaAcPCWjS96k3oxJ26/BMhwOnCCaG
	 I6DjcpjYZh+HHel+TB8425nr4Hntd9f83aY6kExgsaSnH3KINtfqVlP8UTFxVdt17x
	 KzbvRWU2YAWreLATApIOxMRJL5E7KoV00mDhHF4HYtg3S3nVy7u90+5lqDZePhcgkT
	 5S+IpM9mj6Hb9ycBhJBsvHOZ1isKGL5R17RO9RWo0lvLs8ON+l+It447avjDR5KvTo
	 +1hWTkxdiX4uQ==
Date: Sat, 02 Sep 2023 09:20:39 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_riscv=3A_Kconfig=2Eerrata=3A_Add_depe?= =?US-ASCII?Q?ndency_for_RISCV=5FSBI_in_ERRATA=5FANDES_config?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <89469191-FFA4-46D1-8EAD-936A04C49631@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230902_012046_633500_A88241FC 
X-CRM114-Status: GOOD (  10.70  )
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



On 1 September 2023 12:03:20 IST, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
>Andes errata uses sbi_ecalll() which is only available if RISCV_SBI is
>enabled. So add an dependency for RISCV_SBI in ERRATA_ANDES config to
>avoid any build failures.
>
>Reported-by: kernel test robot <lkp@intel.com>
>Closes: https://lore.kernel.org/oe-kbuild-all/202308311610.ec6bm2G8-lkp@intel.com/
>Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This one needs to grow the same fixes tag.
Ideally the whole lot of kconfig bits would be in a series IMO.

>---
> arch/riscv/Kconfig.errata | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
>index bee5d838763b..566bcefeab50 100644
>--- a/arch/riscv/Kconfig.errata
>+++ b/arch/riscv/Kconfig.errata
>@@ -2,7 +2,7 @@ menu "CPU errata selection"
> 
> config ERRATA_ANDES
> 	bool "Andes AX45MP errata"
>-	depends on RISCV_ALTERNATIVE
>+	depends on RISCV_ALTERNATIVE && RISCV_SBI
> 	help
> 	  All Andes errata Kconfig depend on this Kconfig. Disabling
> 	  this Kconfig will disable all Andes errata. Please say "Y"

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
