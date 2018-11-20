Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D4FC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E04E920831
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:30:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ljvy7X+B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AYp+mKq4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E04E920831
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXvHHpExOQ7PNo9Wg4Oq+TWB8dsW7KFwNPhZ6sWRalI=; b=Ljvy7X+B5glP+h
	FXEKx03T1q795WvHt3gXIlX8/Put+5RCl/a5RldjtI+V22xD5ljIaGRZl1U1l30PmerDKJCj2+9nu
	VJodCfaGaU3+W6loGfaxmA2GG4OGTY7eEkZR0Zt4+O9iK+6Gi60HGPOspRwymKx5kijIUcj610YSD
	S1STUcrQREIO+jY3JEXfUDzHtP9AQOA5CaXNtsJBVXHFWrxPgAtbjrSyRfV6B9ejTxGQj+XNCT+K+
	EWpUQw1ijtnIOpINAeX95bXC3AHhuqRtBipSihn4TDQZqJbJzHU8WoLrOfiSzQXn12smbgLAeTACI
	V5EDy0o07ocHByaj09Rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gP8uz-0005pl-Ai; Tue, 20 Nov 2018 16:30:29 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8n7-0003oQ-52; Tue, 20 Nov 2018 16:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iPT7K8PjJPR2XSAiHCt3THciWVw0k7dQTcMfAOh364Q=; b=AYp+mKq4MoUmCJzkjM1fqrxeh
 IvOHavVdgqCdbFWOKeIwf16tFGMt6LiZA9EGijWAU2NWcd/F2vobyVeJGEzW560qR9lMZkVgGYjx5
 NpveROpUIuc5NvoWqeJoMyKrPBAWc6UjG81M+q2nAUHMM6NDVPr2+39uHFFLzCl/b0Q2SEbdSMR1Q
 kYGbwHmZQEkSzrgmUuFwOes0V7LJrw4FPMhz84EkPoXfj89DLJ3970Qjmz08iLVFqErI15iVzmgD8
 kfF5WAE36q8GtcpIkNdHtB67itejG+8zBPK9Le8ik43O343pCLo4uIVU9aIBiltSZ2xkoqoXfNy+v
 BIBEYQ7Vw==;
Received: from foss.arm.com ([217.140.101.70])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP3wu-0006oZ-47; Tue, 20 Nov 2018 11:12:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1906515BE;
 Tue, 20 Nov 2018 03:11:55 -0800 (PST)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2BB73F575;
 Tue, 20 Nov 2018 03:11:52 -0800 (PST)
Date: Tue, 20 Nov 2018 11:11:46 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [RFC 0/3] Unify CPU topology across ARM64 & RISC-V
Message-ID: <20181120111146.GA6497@e107155-lin>
References: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
 <07d92dd4-f943-47ee-e168-46bfaf4ed755@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <07d92dd4-f943-47ee-e168-46bfaf4ed755@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_111208_303610_B38B8C9A 
X-CRM114-Status: GOOD (  13.62  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 juri.lelli@arm.com, anup@brainfault.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 Atish Patra <atish.patra@wdc.com>, robh+dt@kernel.org, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120111146.x4mlVJsRMgwjt7VLnaq-nJ2ce48jyVxJlxUCJh9iK4A@z>

On Thu, Nov 15, 2018 at 11:31:33AM -0700, Jeffrey Hugo wrote:

[...]

>
> I was interested in testing these on QDF2400, an ARM64 platform, since this
> series touches core ARM64 code and I'd hate to see a regression. However, I
> can't figure out what baseline to use to apply these. Different patches
> cause different conflicts of a variety of baselines I attempted.
>

Good to know that we can test DT configuration on QDF2400. I always assumed
it's ACPI only.

> What are these intended to apply to?
>

The series alone may not get the package/socket ids correct on QDF2400.
I have not yet added support for the same as I wanted to get the initial
feedback on DT bindings. The movement of DT binding and corresponding
code should not regress and you should be able to validate only that
part.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
