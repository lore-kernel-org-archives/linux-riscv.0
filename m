Return-Path: <SRS0=Dqti=TV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5CCC04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 10:34:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB3AB21743
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 10:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aVtp0JiA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB3AB21743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMFXgEZWcDSenV6Nda4mQxqUMj+T2ZM6OWHFqDyj+qM=; b=aVtp0JiAL9o4zQ
	lSMwFIKgEtGPPPLcuG1Kvtw30TOp+Ns5tEp6cIH1UE7cPY5h7l0ZSDcK8q8Q0fjOfNdPBTfNie9UQ
	SxfRTnUAcITJK6MIF+teB9U14hEyKVg4Yudq2UimrPGJrZr3wtlvNZHsj8+pbjhyMxetvsC7tkUyg
	jgQ235wolMsUuWHqNthLwkcDQx59wxA+Nmp4OciAhpw0cuhff4y+ehp7hMWVgWwLmjTE20lSYHx3b
	RvAonlvVhn/XjPZyJ0TzeFSNglUdNqF/BIwsQEopOP/bh2tsGBvFwkxwaus4N/qU2mWnoLJ9UHT9I
	AseL3N+dblJ3jTLXZDAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT25q-0000Uu-Ho; Tue, 21 May 2019 10:34:02 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT25n-0000U5-Uw
 for linux-riscv@lists.infradead.org; Tue, 21 May 2019 10:34:01 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8704EABF4;
 Tue, 21 May 2019 10:33:58 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 9/9] riscv: call pm_power_off from machine_halt /
 machine_power_off
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-10-hch@lst.de>
X-Yow: Did we bring enough BEEF JERKY?
Date: Tue, 21 May 2019 12:33:57 +0200
In-Reply-To: <20190411115623.5749-10-hch@lst.de> (Christoph Hellwig's message
 of "Thu, 11 Apr 2019 13:56:23 +0200")
Message-ID: <mvmo93whzai.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_033400_146006_368A8990 
X-CRM114-Status: UNSURE (   7.52  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Apr 11 2019, Christoph Hellwig <hch@lst.de> wrote:

> Also remove the pm_power_off export - at least for now we don't have
> any modular drivers overriding it.

ERROR: "pm_power_off" [drivers/mfd/rk808.ko] undefined!
ERROR: "pm_power_off" [drivers/mfd/max8907.ko] undefined!
ERROR: "pm_power_off" [drivers/mfd/axp20x.ko] undefined!
ERROR: "pm_power_off" [drivers/char/ipmi/ipmi_poweroff.ko] undefined!

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
