Return-Path: <SRS0=OKTc=LX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66636C11F66
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 13:42:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 361FA61D8A
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 13:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 361FA61D8A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2uXudcQl/8w4Tk9KYBtPNecSDh29EuvqOusRRfhwcYs=; b=HOLYNNevxUoDb+
	G+saI0+17xrNOYretvoxslc6tKXlMJmmxfcaXPWSy+dgsVhPNYNmgJpMLp0kE57KYbbRA+artb7Wm
	B6aD5ST/t+tSI/EJoeFrSTcvG3F1eFhuvsYTAIMGa38lddzMtfC/9VzGTkQMYT81e41YRlhsoPbx4
	a9NekBasOgdCkqL/ov9xzQ782zGLrKywoGKtBCZ52IIhskqRz0bukN5uoVn5pLH3twbixFOpVSfkU
	mpxQBloJiE9PLC7+ZcHx3oT0gmhLOXQH4IFIJayThlWQG6uarQP3czts+pIJznCkcUgprpAng/fwm
	JBsuiHQsP1yEDwh6FkPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyDzr-00B8MC-In; Tue, 29 Jun 2021 13:41:51 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyDyg-00B7cV-Ak
 for linux-riscv@lists.infradead.org; Tue, 29 Jun 2021 13:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1624974026;
 bh=p5AhWvJObj5E48c5fHGcL6jXDuBVZdpgQb8yMlXS5lQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=kbNAu9qrfhjH8KLiI0jIC/qkXlvAf5WyXLSyNdHAHYUDGWZB2UDKqDUZHp4kCXDwE
 7GreXgsYkwrIovrYN8d6/PUWSVJ3HlwnQOZhRTtrP07B//BdrpL6FPD5hKZknLbSeh
 KdKcMrGbq5DZrA7ghlvFfDFahf0FTEtGdOlIXPhY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([88.152.144.157]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MIMbU-1m3iAQ26PU-00EOFS; Tue, 29
 Jun 2021 15:40:26 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, linux-efi@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1] RISC-V: load initrd wherever it fits into memory
Date: Tue, 29 Jun 2021 15:40:18 +0200
Message-Id: <20210629134018.62859-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:EgBc8Ey65V6us9wivMljuEpQjELTw45ZYekN3WeWP7EoTZQqdi9
 lSTJfNjLwwn39LG5t+wlOV95sd/H5CVCUd2fcTQeINYy7VKpqnR5PvKUBw3tFj8vXTlLIRA
 xdg/VFCpoGQmlBASv2EnqDMC7oyUTAD6jzc3KfeuAsAwck59dBCiQSEcBkvVgxPraBjZQWy
 QzaGFch8Z/36PVcA2KcMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4vb5uaMYpIE=:5sDfrtR1QE2vNvA9ao0JqE
 QCuwt/pPqkBuNXZG6n+V0YepLxjcDmHWEkz0B/7tbDMrZGb/RnsgaYGZzPLYOEl7j+euc12aY
 XhImlGTnVQKvO0n0d/aR83TCkr5ie+etSl2BFe1F+ten38vMmkK6dH3m2/jyZCGLM1GaGHxhG
 /NrnWeNUlldqlRm1CjK8bTxj2fgFd2qf9zo2PXx9Ha41vtJGyMGa8KapunitBeV1AmA1QcVSU
 XmM+G3zQLGAOYSoOynunILlEH3yhiJ8LWGjSqk7hevu+vMd+z9XZKNnCD0iNhA2ku0L1frBdG
 RSGLwQXnMzokwwZW8PMySbic0VYy5yqGo7Fk901OokEfTHoz2GkqbSDnHid9VABbWDXBRV65+
 aT+PUuAP/iD0QHGflYWOokZXuzh3+twCKwHMMdU5GcKw1JyEv3/7zsg2WnLUSDM2xgiGwMscW
 Hg41CcaZbAIQMbjHQ7Tecy3Ko28hQKQ3rjid0kMd3mzIh97wARBfXgm8PJukYxEPbbe4CbSGA
 Y/2ecd0XEp2pUcsgDuaMut2NGQYgJGkddbyucAuEKt7c0n+ekRyio0GVwoQuTJwAqRoLJUZRD
 EeH8s20BCAd56PLxDnGjaItR8G+qr72D/GxG6h3Ga4G9ZP4cYuQpEpzz4zbD9aDOc+pHJheAT
 uFjQGNOnG4ipeXTV0ObUibh+cGmUlVZeOnqey1oaeIcvi18+a0aziBynTRKemC1rbt7pQgxeE
 CMTHgTVfIQIzSm0zff2ftyvvj68P73k3HiRUF7yMbrUwmOsfLjEd5nTdGLV+h3nOS3SSO1Zxj
 hHu9PBop3QFRgmjYDwwoteERFqYfTHT619wxtfXK07JYySnYm/xcneyAcuNj8XFsKXJ94+elh
 +/jbr4Y73K+6iBruxN4XKYdmXthtKJKdKp/wwNAppODlqcCwQsAq1vvAVJnZCT75XYdvuC5AZ
 CUIzh8gPAHE3PyQskMkvh1Wk73ICGpPKbQ0DXKUb16f1js3XVvkTpD3LGfp8uiNcYAKk8LVT/
 YllnIUhcVaO8EqtkpePpN58I/qAaX4j2Z4Cz/h1cz786BolNO+kNT86hIDjiIm9tH69AOOEBw
 t4xkpPWoQ4ZF1DyrfS2jXuD5ZZu3aA08NeJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_064038_747067_A7F1A268 
X-CRM114-Status: UNSURE (   9.33  )
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

Requiring that initrd is loaded below RAM start + 256 MiB led to failure
to boot SUSE Linux with GRUB on QEMU, cf.
https://lists.gnu.org/archive/html/grub-devel/2021-06/msg00037.html

Remove the constraint.

Reported-by: Andreas Schwab <schwab@linux-m68k.org>
Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 arch/riscv/include/asm/efi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
index 7542282f1141..649ab513dc99 100644
--- a/arch/riscv/include/asm/efi.h
+++ b/arch/riscv/include/asm/efi.h
@@ -33,10 +33,10 @@ static inline unsigned long efi_get_max_fdt_addr(unsigned long image_addr)

 #define ARCH_EFI_IRQ_FLAGS_MASK (SR_IE | SR_SPIE)

-/* Load initrd at enough distance from DRAM start */
+/* Load initrd anywhere in system RAM */
 static inline unsigned long efi_get_max_initrd_addr(unsigned long image_addr)
 {
-	return image_addr + SZ_256M;
+	return ULONG_MAX;
 }

 #define alloc_screen_info(x...)		(&screen_info)
--
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
