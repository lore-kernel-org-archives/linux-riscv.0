Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4015AC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jun 2022 11:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ti433J9efmoKCtRjOvZ937APsJBFGHhLGlev6OWYSgQ=; b=qQpAZQH7bAkuqe
	1Dh4V3xZXLcIpYxHbhA3JDjQuJvPfAhZTtsEsMzwyo6ulviXajq5YKPLcUwReYxSedET7qVFIu8A4
	6VTHS3t12nR0IFab+yKF4SXYh8PhlwTUmiFRlqdtAff9oyfLabTeWSPrJm/YBIT6IW5s1pLY8CdwJ
	QwBVObFQFmh3QpZ0zvrjL64NQ5k06Yt71nZifiwUvF/Pt/a7CFTvaMHEjBnWfBwEnpeOU2uj7k8xq
	G7c/LMqqeesnV5CvZYtxOzdrW3TFAU/aD0cTuUFItoMaByr+zYRzfh1kuvlZO2Y1mqLAm7YWUE2Tz
	vjP/WtpREBm1kMW8KtAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3y9m-00A3k3-Ks; Wed, 22 Jun 2022 11:04:22 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3y9j-00A3iA-3s
	for linux-riscv@lists.infradead.org; Wed, 22 Jun 2022 11:04:21 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5460D92009C; Wed, 22 Jun 2022 13:04:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 5101192009B;
	Wed, 22 Jun 2022 12:04:09 +0100 (BST)
Date: Wed, 22 Jun 2022 12:04:09 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
cc: Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: [PING^2][PATCH] RISC-V: PCI: Avoid handing out address 0 to
 devices
In-Reply-To: <alpine.DEB.2.21.2204271207590.9383@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2206221202590.57474@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2204271207590.9383@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_040419_366415_6D7E95E0 
X-CRM114-Status: UNSURE (   5.18  )
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

On Wed, 27 Apr 2022, Maciej W. Rozycki wrote:

> Therefore avoid handing out address 0, by bumping the lowest address 
> available to PCI via PCIBIOS_MIN_IO and PCIBIOS_MIN_MEM up by 4 and 16 
> respectively, which is the minimum allocation size for I/O and memory 
> BARs.

 Ping for:
<https://lore.kernel.org/lkml/alpine.DEB.2.21.2204271207590.9383@angie.orcam.me.uk/>

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
