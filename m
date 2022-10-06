Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DAAC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 20:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxY3Sf/g8SBUfe3XhM4vzmFTyUQksrHWLQ4jtEs8a4I=; b=CML67sjEyNorlG
	d3eG4z8vpQNluyAUKsoyKfeHoalycfENYpAdFERQMibLpA0LLHs2RfauVes3vZAc/P5s/gcr+2HAg
	qhEIFRzKgtL+/+eoO1y1sFS69Akzu1tmxjG/BXjJjOfgPkcCxPvz5irlWvOllQwm8jA/hkvJ1yhl1
	1TRFJVP95TAemXkWG1KJuBop/n3QDiLaWMttSr/2x9/5SbN701vpGu3BvHZVU4MrhnnFB8bs/Cf4c
	xxT6Z0KUINX4nB/5wrGlOAx7UtG2NzHO1IwhrogGs6WCexWryKaETsqg4bUbP16DEH4WXrzyV5ijT
	apzN0AYkIXq4WK8pOj/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogX5P-004uJu-JH; Thu, 06 Oct 2022 20:03:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogX5N-004uJ8-PH
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 20:03:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 373FB61AA9;
	Thu,  6 Oct 2022 20:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED84DC433C1;
	Thu,  6 Oct 2022 20:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665086591;
	bh=jg/F5Nfsai+GHWDENA+u//M5sa0QkyRZvdPLfGMX7DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0Q2xLvLbXBp81MOPxT/iFS53g6EVwTbgO/oRlhTC1kQ7F0EbX3Kzsr789YWkK4AV
	 E466DopvqnTXLPp4QiBwR1BB5XKq1OOS2w7W/cEclSNzk4neA13ktoFjSyW7ZfVJ7J
	 pQkXgluyBVH6pV2G4V1ubCPq1ukPAxmYyTuwDXX9YNLgKwLI99RAupttVQxlDznBkt
	 cn0W0ZVtLaqQzh8iGCLpSg4hqW8rYVsFqkObtrVsMiF2UgA486HGj/GWho86ckvGTI
	 UV+qZrV1u2CMxuLyz9xNWyvjuX4CKhppxtcxtTXgMm6YmMoS2QRE9b6OSeFsVUWHKo
	 UBkk4GHC+mkWg==
Date: Thu, 6 Oct 2022 21:03:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Eva Kotova <nyandarknessgirl@gmail.com>
Cc: PH7PR14MB559464DBDD310E755F5B21E8CEDC9@ph7pr14mb5594.namprd14.prod.outlook.com,
	c141028@gmail.com, coelacanthus@outlook.com, dramforever@live.com,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	xc-tan@outlook.com
Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
Message-ID: <Yz80ewHKTPI5Rvuz@spud>
References: <Yz8r71PjHlpLy+kR@spud>
 <20282242-5cad-42be-ce6c-834b0e7ef269@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20282242-5cad-42be-ce6c-834b0e7ef269@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_130313_887040_5F3D9398 
X-CRM114-Status: UNSURE (   8.74  )
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

On Thu, Oct 06, 2022 at 10:55:00PM +0300, Eva Kotova wrote:
> Patch "[PATCH v4 2/2] riscv: Allow PROT_WRITE-only mmap()" applied cleanly
> over 5.19, fixed issues with OpenJDK.
> 
> I assume this is not yet merged into linux-next, because problem persists
> there, hope this gets merged soon.

Yeah, not been applied yet. If you reply with a Tested-by that will help
though! Would be good to also note that it breaks userspace.
FYI, you've got an issue with your mail client, my msg-id from my last
mail (Yz8r71PjHlpLy+kR@spud) ended up as the reply-to address for this
one. The first email you sent tonight was fine though.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
