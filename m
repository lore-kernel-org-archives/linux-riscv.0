Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20F2C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 14:27:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A11162173C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 14:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IB+aS912";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="Ty8Kn1Ii"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A11162173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgEbeV7qIyeSeG58El5d4agD3ytkLDmDchOTJgcUtgQ=; b=IB+aS912O6hRn3
	JIYo3QKd6bCL3zV0+I6z9qcKrcdud1FDnZPNfe2cdELvbd+BO1rYq3+NntVL3UntHlZftGqVYr6MN
	4frqkr0oP29V0m7tWSyisZuCCvH9sRBvrx2B0DOXLCrKinOdR1Xj8NRxZJW4hvqxb5AByBlRIymV7
	pqOx5vLF09V8bH1oQZAS0SDi4ZmDnfrg/udk+/4D7EM/AheWQo9x9L3VT6fennsJeLiig9F0o3mr9
	rtXjer8lPQI96nW3T7eKQW6aag9IpcCoI2GsuJVBorSMwb9EL2wH0Wi/SH+kbaZO+A5gtt13ZMXFk
	DOig5J7FUYI7Cx9cEb2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9sTx-0003jY-HD; Fri, 29 Mar 2019 14:27:45 +0000
Received: from mail.skyhub.de ([5.9.137.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9sTu-0003ip-I8
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 14:27:44 +0000
Received: from zn.tnic (p200300EC2F148A000C2303278B6F16CD.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f14:8a00:c23:327:8b6f:16cd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7A7941EC02C1;
 Fri, 29 Mar 2019 15:27:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1553869656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=g66Y9KQ8P8D4SbrmnoAJ95U1RhuiyI40icRHIUKJjwA=;
 b=Ty8Kn1IiSdyJTwi6+WRedQVwaE0a/qMXyVVG9aQFGdFmc7DD+SYoh0cWFzptlZapdtHyQY
 Wb0Yt5LtQfJ3PraLnoCIVq1Qra4r+wsQdbpl+epgmPcTj/k+smSLZpKisXKkvlstymirkR
 rtJX4CvscEoJlKnt6ROcStXPWCrIHSM=
Date: Fri, 29 Mar 2019 15:27:39 +0100
From: Borislav Petkov <bp@alien8.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
Message-ID: <20190329142739.GG21152@zn.tnic>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
 <20190328131657.GA9056@bogus>
 <be7246a0-2426-995d-0a24-f104c173d752@arm.com>
 <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+s77J=Bwiyow2d7Q=e+z+5d64i_cL6xaYn0xdvJDb4Vg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_072742_753539_F4190C40 
X-CRM114-Status: GOOD (  11.19  )
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

On Fri, Mar 29, 2019 at 09:11:24AM -0500, Rob Herring wrote:
> I honestly don't understand the issue with EDAC is here.

The EDAC core supports only one driver and if you need to load more, you
need to dance around that.

Also, if those drivers need to talk amongst each other, then they need
to build something ad-hoc so that they can.

And the other architectures can very well do one driver per platform -
only ARM wants to do this special thing because DT said so. Or whatever.

> Highbank is separate drivers for L2 ECC (PL310) and DDR. Both are used
> on highbank.

That's because your L2 driver does allocate an edac_device
(edac_device_alloc_ctl_info()) and the DDR one an edac_mc
(edac_mc_add_mc_with_groups).

For example, altera_edac does edac_device_alloc_ctl_info() for each IP
block just fine. So a single driver *can* work.

> Only the DDR driver is used midway. (I think we never got around to
> how to report A15 L2 ECC errors within Linux.)
>
> In any case, it's all irrelevant to the DT binding. We don't design
> bindings around what some particular OS wants.

And just because DT dictates one driver per IP block, I'm not going to
redesign EDAC to fit that scheme. You or someone else who feels strongly
about it, is more than welcome to do so, of course. And then maintain it
too.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
