Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CFAC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 09:50:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5FD720820
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 09:50:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sl0xVTEm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5FD720820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJPdJHyAYUdT+O2k8MjhrgeI16hspiHXyaF0MdxTNsc=; b=sl0xVTEmslgU9s
	+wX6EsXazbBKY485mqzXx9o011jBxpJOoUNY6eMh7Dk11AQslZsRLhgbfjdhJZaa06OM/C5tQIRED
	cZHiCHOlljKvt+e5wis3Ps+7yoDUfWUkeV0PC99Yi1QX8oSYNLbVIugYTRPxcUNqE2VtVEYKglHST
	FT0hpEB1fWwRlukTxBOUG5xCC3badyVQ4/hLjkiHzTwpD4tfsXUfUj1yzHyvP3MqBRBjmF9L3KR4D
	maSQjuNVlLZbtIR+w8vRVc+QvGzeZYVhHBoOgHHX3tStaBEAWkpfAh2htzllK6wYiSFumFIz74r6U
	rzX1ymeYYsI4DlnRoGvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE9s2-000150-Mw; Wed, 10 Apr 2019 09:50:18 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE9rz-00014e-Db
 for linux-riscv@lists.infradead.org; Wed, 10 Apr 2019 09:50:16 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 28433AD6D;
 Wed, 10 Apr 2019 09:50:12 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: macb: probe of 10090000.ethernet failed with error -110
References: <6fc2e90f-cddb-3772-5b4e-f2e2c3466537@wdc.com>
 <f88db43d-f343-1ad0-87b9-07afe6082173@wdc.com>
X-Yow: Is there something I should be DOING with a GLAZED DONUT??
Date: Wed, 10 Apr 2019 11:50:11 +0200
In-Reply-To: <f88db43d-f343-1ad0-87b9-07afe6082173@wdc.com> (Atish Patra's
 message of "Fri, 14 Sep 2018 17:07:07 -0700")
Message-ID: <mvmsguqi3zg.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_025015_607058_E9C22061 
X-CRM114-Status: UNSURE (   7.14  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Christoph Hellwig <Christoph.Hellwig@wdc.com>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "Howard.Hicks@microchip.com" <Howard.Hicks@microchip.com>,
 "Raju.Lakkaraju@microchip.com" <Raju.Lakkaraju@microchip.com>,
 "Allan.Nielsen@microchip.com" <Allan.Nielsen@microchip.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sep 14 2018, Atish Patra <atish.patra@wdc.com> wrote:

> This fix proposed here is just a hack and should not merged into upstream
> code. Ideally, the fix should be done in FSBL code.

So what should that be?  I tried removing the second reset in the FSBL
code, but that didn't change anything.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
