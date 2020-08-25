Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B98C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 16:20:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D3C62076C
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 16:20:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nM6ADpHP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="UFYOs0nS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D3C62076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/JIDVgh6L0B2V0IAd1c4z+o/vK/r5gOpq4h2eN/wGBo=; b=nM6ADpHPkK84LTcA/pBS2UcG3
	4dTB4Q4KmKlQKbdTIDYSMFYuo9fPp0DRKL7e9XcUTuzKdkjkXJLdcxD6Ld9dUbHoyXy9oXVoy1Asb
	U5YG0zb8HeGiSOWWPMCyk6VsZ+crDurm2grTT1ViiCA023/HAX5ExdZa81IbR3HW0/r3tjuWM3EIw
	vxI0Bd2v/bF99wgRUuqv4/jWGqbHzCk/7VbjW9Am+T5tfWe1ZSTxTBlGbX9JNNdfxjXTs/3zzmNgd
	1VD9mWiSyu+oeEeVXCu01ZYkvjF/C0muzOWPQyqa2pWdRfLJ4qqWNZwJoF1kRtVe5iKQIa3Z/R8Lc
	vaB48UE5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAbg8-00068j-Ef; Tue, 25 Aug 2020 16:20:08 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAbg5-00067X-Fd
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 16:20:06 +0000
Received: from zn.tnic (p200300ec2f0c5a009557515e5e730b1a.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0c:5a00:9557:515e:5e73:b1a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6AEA81EC02F2;
 Tue, 25 Aug 2020 18:20:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1598372402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=5IBziXPpKvbhhwgqPns5G/U34kVP+yhkOY8NKitEfqY=;
 b=UFYOs0nSLheWet86YKFgFmeHP+EMoJimZ0vnWmXbT1qWa8UsoTHbee/zvk/w0UlO9/ceSw
 BfUOS4IJxsClx3SFCN8Gf/TvVSyB9KRmuqIkj967x8OTtgTPd62rRRNr4hCqJxLECSPXnr
 s4TsdOj8jF4pcoCnx7YaLlUqeRfplAE=
Date: Tue, 25 Aug 2020 18:19:58 +0200
From: Borislav Petkov <bp@alien8.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 0/3] SiFive DDR controller and EDAC support
Message-ID: <20200825161958.GE12107@zn.tnic>
References: <1598357182-4226-1-git-send-email-yash.shah@sifive.com>
 <mhng-eeb15e05-0af6-42bd-8c35-0b7e9bbedba7@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-eeb15e05-0af6-42bd-8c35-0b7e9bbedba7@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_122005_674388_36FA0B6D 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com,
 linux-kernel@vger.kernel.org, rrichter@marvell.com, sachin.ghadi@sifive.com,
 yash.shah@sifive.com, robh+dt@kernel.org, james.morse@arm.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 mchehab@kernel.org, aou@eecs.berkeley.edu, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 25, 2020 at 09:02:54AM -0700, Palmer Dabbelt wrote:
> Thanks.  These look good to me and I'm happy to take them through the RISC-V
> tree, but I'm going to wait for a bit to see if there are any comments from the
> maintainers of the various subsystems before doing so.

I'll have a look at the EDAC bits these days and give you an ACK if
they're ok.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
