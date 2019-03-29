Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3D9C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 20:24:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56BBD218A5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 20:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pp26DBmT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="Oi+QWpnm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56BBD218A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xWOkI4PVcDyTNiU1z/ilitN2n7uaBcSlGj9R2QXbEEI=; b=pp26DBmTp95MmB
	h7x4GVnAjx4Kn4zDzIu3lQqaJ51O2lq2EuySAl4ah9HPIovGzkXxtc0e9RpJQk4+QViN1V+etmFJK
	gs0dwP57jStzKHPbvobPj+pAivnNgs40pcySm6ceQtVjaeto5Hlt2EYEIqKMIIQb8tvf9wi1KMqwo
	wlgr+VAVIAImNCjVzjkNbjlSVo98VAWce8FLWBJl1egBTliCPCl3rgTncbB6hSiiBj/JYyoAANuiE
	CtSPX1Ey4nOyYQKwszi3j2I6IYYN0lO8C1JfsdTZQ3OLYcRHuc53f+vAHnm9ycDVjQZizfhVplEka
	7Np1zHP+9gqisYXRG6MA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9y3A-0000w3-CG; Fri, 29 Mar 2019 20:24:28 +0000
Received: from mail.skyhub.de ([5.9.137.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9y37-0000v0-J8
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 20:24:27 +0000
Received: from zn.tnic (p200300EC2F148A00E59BAD4CF0BA983E.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f14:8a00:e59b:ad4c:f0ba:983e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 168FD1EC00FF;
 Fri, 29 Mar 2019 21:24:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1553891054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=WCNTVbcKj6aP3VoHv0OOak5vhWNJhjZVZAm5pLFuQlM=;
 b=Oi+QWpnm5zcoX4nxl5tVGQlHyIlVjYA7H9QRTD8Fl7FGN5VX8HnNnidUEEmamM1X3cJUWM
 HJ4W7eRCcgm9RCfNkQJDqjYIP6C8jonsNcxLdJhdmac3ZTa5AiBgzV4CTyFcZWhc14SAmm
 K1/31p0/51t089gTs/2Zycos2e6WFSk=
Date: Fri, 29 Mar 2019 21:24:16 +0100
From: Borislav Petkov <bp@alien8.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
Message-ID: <20190329202416.GI21152@zn.tnic>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
 <20190328131657.GA9056@bogus>
 <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
 <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
 <20190329142739.GG21152@zn.tnic>
 <CAL_JsqLQ1XvQq7L=xA5Z8Y0Xa4Bmp0t2pgxn+hLF+tD=_L7Mvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLQ1XvQq7L=xA5Z8Y0Xa4Bmp0t2pgxn+hLF+tD=_L7Mvg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_132425_782461_80991377 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@sifive.com>, James Morse <james.morse@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 29, 2019 at 02:41:05PM -0500, Rob Herring wrote:
> DT dictates aligning with what the h/w looks like which has little to
> do with OS driver design.

Ok, then, where does this goal for doing a driver or compilation unit
per IP block come from?

Because everytime an ARM EDAC driver pops up, we are having the same
discussion.

> I never said you should change EDAC and I outlined how things should
> be handled if it is one driver.

Ok, we will add that to the EDAC driver design document we're currently
working on.

> DT and OS subsystems are independent things. I can't tell you how to
> design the subsystem and you can't dictate DT design (based on EDAC
> design).

I don't think I've ever intentionally or unintentionally dictated DT
design - all I've opposed to is having multiple EDAC drivers on ARM.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
