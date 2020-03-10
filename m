Return-Path: <SRS0=s16l=43=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4A2C10F27
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2020 10:21:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E3D22467D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2020 10:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mc7ZN4kS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E3D22467D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGseYenZvW6fGMcvZyVaRbEAZpAeyP78sOHTazv9RmQ=; b=mc7ZN4kS3DB57A
	OcorCByWUSgNFKUe6u2ehpmN/4YQBiderbmZoYGxNerUjW13V5oaGEKtWO+CNgBYHmMJPZ85YmSR+
	Vu/1iOG/TLCrRx9B1MXUrZL7DmbtjjYsElxIAS73/pksgUwoAP675imgX7GBKA+jWip1oCo3gxFPS
	4Xul7AP/9RqAHocQHhiRP4b99UzeXo7KpbCG8v5q+xf41yGClxejEdsQRXdakvwsOZhYckFoIc8P5
	/Th0aBPQKUmPtXjEHr1BZzmzCHvoENPfqTXzPOOiGR4RUpfta5PWsennqVC2+WCtszOSwUu3gpA2m
	fINIB5zRa4G1rIbKhrGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBc0u-000192-8j; Tue, 10 Mar 2020 10:21:28 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBc0r-000182-AF
 for linux-riscv@lists.infradead.org; Tue, 10 Mar 2020 10:21:26 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8DE20AEB1;
 Tue, 10 Mar 2020 10:21:21 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH 1/4] RISC-V: Add kconfig option for QEMU virt machine
References: <20191125132147.97111-1-anup.patel@wdc.com>
 <20191125132147.97111-2-anup.patel@wdc.com> <mvmh7yx4z2u.fsf@suse.de>
 <MN2PR04MB60611C6CE40C024E336C8ADC8DFE0@MN2PR04MB6061.namprd04.prod.outlook.com>
X-Yow: I'd like some JUNK FOOD...  and then I want to be ALONE --
Date: Tue, 10 Mar 2020 11:21:20 +0100
In-Reply-To: <MN2PR04MB60611C6CE40C024E336C8ADC8DFE0@MN2PR04MB6061.namprd04.prod.outlook.com>
 (Anup Patel's message of "Mon, 9 Mar 2020 10:24:05 +0000")
Message-ID: <mvmmu8objdr.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.90 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_032125_501265_0E8EFEE9 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mär 09 2020, Anup Patel wrote:

> Perhaps selecting DRM and NET_9P from SOC_VIRT will help. Can you
> try and send patch ?

No, the config option should be removed.  It is useless.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

