Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4DDC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 06:55:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B41D720854
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 06:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qpFL+YKZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="STWh/0wQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B41D720854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alien8.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9L48b3l/NmV4Vd2/DW1LPHUR0EBORBw90DkBR0whiQA=; b=qpFL+YKZ9A5RFQ
	Qfq5DNINFQa/ROQwM1MjlWsymDJpt0x3eubsAxSReOxBzMigXTTF7VntolJvV8uY78qLnKBNDNeao
	baemxUVpXdzDAsk8+KTOh4CCxDgN5zBtZSWdQvEQy9qZFBS/V0RTu/SJ6Z8v46+rq8nk8wk+zWSgz
	6ruJGlofAHTXLkW5LiJ6MV0kY0jjBjVFJmTCwR4vii4o4zDdF7xrnAjn1tGF3t0TtrNUJoKktxMbV
	RurSNv+JsksAlhM3TS4VC4E5/9C+OqBtO99JwvPq0kI9FHsPVQXgMcai2z9LyL8P/+3ncixTWVn7e
	HO7ZUXGlxedED24H895A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8JVb-00033S-J6; Mon, 25 Mar 2019 06:54:59 +0000
Received: from mail.skyhub.de ([5.9.137.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8JVX-00032D-6q
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 06:54:57 +0000
Received: from zn.tnic (p200300EC2F098000329C23FFFEA6A903.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f09:8000:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DC9BE1EC02AE;
 Mon, 25 Mar 2019 07:54:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1553496892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=LpYxhVlfV2gEX33wV6ozS41lCPpjrz6TfKLaI6w0DWs=;
 b=STWh/0wQCrqwcWm8++Mv75iFq985KBxk9fW2UIzE9jzeS4H/PeIAVTo5GUx3nsNnkuzS59
 3DWXY9nWcoWC+Geg2GaXQLj2/O4PxEs4VY5m1hTHyUwlYawz302mAy/2WyOoncQ8Brp1zV
 EcdwslK0NW/UjdMzrOKk4QP8AyRGFlA=
Date: Mon, 25 Mar 2019 07:54:54 +0100
From: Borislav Petkov <bp@alien8.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 2/2] sifive: edac: Add EDAC driver for Sifive l2 Cache
 Controller
Message-ID: <20190325065453.GC12016@zn.tnic>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
 <20190312092842.GC28589@zn.tnic>
 <alpine.DEB.2.21.9999.1903241705460.8028@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1903241705460.8028@viisi.sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_235455_568777_4008B8B3 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 24, 2019 at 05:16:17PM -0700, Paul Walmsley wrote:
> Looking at the Synopsys,

Look again at synopsys_edac.

>  Highbank,

Yes, that one and octeon.

> PowerPC 4xx, and

also a single ppc4xx_edac driver.

> TI EDAC drivers,

There's TI drivers, plural? I see only ti_edac.c. Also, per-vendor.

> all of those are clearly for IP block error management, rather than
> platform error management. Has the upstream guidance changed since
> those drivers were merged?

There are others which are per-platform and work just fine this way:
xgene_edac, altera_edac, layerscape_edac, qcom_edac, synopsys_edac...

The problem with per IP block is that if those compilation units would
need to share info or communicate, then that is impossible nowadays and
you'd need to build something on your own.

Also, the EDAC core supports only one driver.

> The core issue for us is that we don't have a generalized "ECC management" 
> IP block.  And I would just as soon not fake one in the DT data, since the 
> general DT guidance is that the data in DT is meant to describe the actual 
> hardware.

Look at how the others I mentioned above do it.

> Would it make more sense to put this driver outside of drivers/edac?

If you're not going to need any EDAC facilities - which are not a lot,
btw :) - you can do whatever you prefer.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
