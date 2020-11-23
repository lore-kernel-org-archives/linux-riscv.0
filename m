Return-Path: <SRS0=TXXs=E5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4B1C388F9
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2020 20:55:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 329D5206B7
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2020 20:55:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hejp8N6W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="Ax4UYuaY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 329D5206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IkvzD3jRk98iG6+BdSJFCfTTiQGUr+DG94UEiESWHXs=; b=Hejp8N6W/GweQZSUxDxSKs/f9
	khmduRpkGehaxbux0GXn8o4iGjnfeErzYyTYJJzjA976pMooJLDZToOCHBRK58XPhE1MtffS4DlEO
	Ix2h53FBGeghFFoN/YZmUhXxrF+moqFU7+Dz1dm4rpotL35IsiiJ1DRpF9DVjLWyPhMNHPMPbeYVE
	toIIXdo0DJMBdPpx5yG/x+ZZVsoOYKncjSCW40fW6hJCQHjXzomkKolqv+NwX4v515S+f1PYvuH1S
	VHVaQrNYjjpZt+2isyukFMQmIW4BJH+HbVEu/+80ETJXwy1JghtBT85SFS9oPjP6xbohiOCiTKtpb
	mwBkXo9Rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khIra-0000qI-Lq; Mon, 23 Nov 2020 20:55:06 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khIrW-0000op-Ns
 for linux-riscv@lists.infradead.org; Mon, 23 Nov 2020 20:55:05 +0000
Received: from zn.tnic (p200300ec2f0bbc004db97da25dfc8587.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:bc00:4db9:7da2:5dfc:8587])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1AF6F1EC0506;
 Mon, 23 Nov 2020 21:55:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1606164900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=eOxsNY7Er405uLXDsZt8H9k38WgOvAwa9tKguJYOqQo=;
 b=Ax4UYuaYggVY1jvgLuF6jrJBpT1tgAhDIW85bNQ/6QCQZ3cN4++42EfPZxl9NA5ijzQSq4
 93w4FOMIm5QyAEhJ8fxMWCoqR/qRzgwapgc/1bi3LdJ+DM0TuNvv11PX6BsAFl5PTPvsxe
 ISQpzkyf3WS135ypXyIwOz5T3MiLS2Y=
Date: Mon, 23 Nov 2020 21:54:53 +0100
From: Borislav Petkov <bp@alien8.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 3/3] EDAC/sifive: Add support for SiFive BEU in SiFive
 platform EDAC
Message-ID: <20201123205453.GJ15044@zn.tnic>
References: <1605182457-86046-1-git-send-email-yash.shah@sifive.com>
 <1605182457-86046-3-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605182457-86046-3-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_155502_973398_203FA53E 
X-CRM114-Status: GOOD (  10.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, rric@kernel.org,
 linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com, robh+dt@kernel.org,
 james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, mchehab@kernel.org, aou@eecs.berkeley.edu,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 12, 2020 at 05:30:57PM +0530, Yash Shah wrote:
> Register for ECC error events from SiFive BEU in SiFive platform EDAC
> driver.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  drivers/edac/Kconfig       |  2 +-
>  drivers/edac/sifive_edac.c | 13 +++++++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)

Acked-by: Borislav Petkov <bp@suse.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
