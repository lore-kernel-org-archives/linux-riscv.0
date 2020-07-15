Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6177C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 03:22:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E55620674
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 03:22:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EJ2WU6jn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E55620674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ewFQDae97vVFMWZ19UYm2SxbFLIg9LNWy+mxQnFT4e4=; b=EJ2WU6jnN3UTnfqgRgXqcn2Sm
	25wm8F0Q+5z/tO9YoLc+lEZxiarveJrYiW904hXqBCF1rY2CCl/97TGKLrpDnhEqG4AZhT4ABhsgp
	VEjMG7cC2D7hdETyhr/g0LH+dZoIFo17eTakWfncmQFDR4Rc6aUVgXXjHvjEy+GUtLwLmH8VLvY2h
	DZjSMgZLuretcxnEvl88TOo/F7oSCvoCrY+nzHGKvfxddfpC0Fp14jV9tb0q3zUP+wG3m1FgnATIg
	QjdFybqGI99P0qP8dkJDzXZiLWlyCaiNW99f7fBYF0+npRvRsokUrywtZPgLHrJKAxLTQPhWMcSjL
	6lD+wcpoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvXzp-0006V3-SM; Wed, 15 Jul 2020 03:22:13 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvXzn-0006UI-Kd
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 03:22:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6600C1FB;
 Tue, 14 Jul 2020 20:22:08 -0700 (PDT)
Received: from [192.168.0.129] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C68C03F718;
 Tue, 14 Jul 2020 20:22:06 -0700 (PDT)
Subject: Re: [PATCH] riscv: Select ARCH_HAS_DEBUG_VM_PGTABLE
To: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org
References: <20200714212611.19692-1-kernel@esmil.dk>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <0d7d0c38-5b67-1793-47d7-b8a7714838ee@arm.com>
Date: Wed, 15 Jul 2020 08:50:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200714212611.19692-1-kernel@esmil.dk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_232211_742791_F388E4F2 
X-CRM114-Status: UNSURE (   9.98  )
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 07/15/2020 02:56 AM, Emil Renner Berthing wrote:
> This allows the pgtable tests to be built.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
> 
> The tests seem to succeed both in Qemu and on the HiFive Unleashed
> 
> Both with and without the recent additions in
> https://lore.kernel.org/linux-riscv/1594610587-4172-1-git-send-email-anshuman.khandual@arm.com/

That's great, thanks for testing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
