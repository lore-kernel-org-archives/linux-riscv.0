Return-Path: <SRS0=eaTI=Q4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E32BDC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 11:52:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2B9E2147A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 11:52:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCxufM6U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2B9E2147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vg6kqKzz7XmLIdRMIiFh9Mmy76oECMLhIdxhwWkIr+g=; b=gCxufM6UpnRusK
	4/gbYXXpNHzu46FTgKFnKcftDeKDjuaY0d0gvn4tiJwM+/A1rvThhW2VQHyudTniTVZ6bnGHJRbXs
	Lyt6J0tVpBsrZ4avYCMkyviijkRovN8Ax5jcgbrFxNezlUXFftGlLrGEjP9pswPad/BrSGNwau7Y1
	49vK3y2opxQr0EwwkbGfovURdjMVMN28U3CPhEkFtIhw96rjYW79SvMizlnZQbm8VSLidgRPKv9QV
	xYVIkLAdzBrzkBBg6VAsgDjeExb8B4jdONgDpdgRXQiZqHFCwY5wcag/boliFdeqhYd1qqtPQUGty
	j29tPNdV28mA4VdnY3mQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwmu1-00087x-Sd; Thu, 21 Feb 2019 11:52:33 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwmty-00087F-3P
 for linux-riscv@lists.infradead.org; Thu, 21 Feb 2019 11:52:31 +0000
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D7EFD368FF;
 Thu, 21 Feb 2019 11:52:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-228.ams2.redhat.com
 [10.36.116.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 763005D704;
 Thu, 21 Feb 2019 11:52:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A344711A9A; Thu, 21 Feb 2019 12:52:27 +0100 (CET)
Date: Thu, 21 Feb 2019 12:52:27 +0100
From: "kraxel@redhat.com" <kraxel@redhat.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH] drm/bochs: Fix the ID mismatch error
Message-ID: <20190221115227.ipwjpn3xm4q7jfg2@sirius.home.kraxel.org>
References: <20190221003231.31625-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190221003231.31625-1-alistair.francis@wdc.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Thu, 21 Feb 2019 11:52:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_035230_164140_3AE7CB91 
X-CRM114-Status: GOOD (  12.18  )
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
Cc: "david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "alistair23@gmail.com" <alistair23@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 21, 2019 at 12:33:03AM +0000, Alistair Francis wrote:
> When running RISC-V QEMU with the Bochs device attached via PCIe the
> probe of the Bochs device fails with:
>     [drm:bochs_hw_init] *ERROR* ID mismatch
> 
> This was introduced by this commit:
>     7780eb9ce8 bochs: convert to drm_dev_register
> 
> To fix the error we ensure that pci_enable_device() is called before
> bochs_load().
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reported-by: David Abdurachmanov <david.abdurachmanov@gmail.com>

Pushed to drm-misc-fixes.

thanks,
  Gerd


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
