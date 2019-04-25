Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EE6C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 10:18:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 883C0214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 10:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HeEjTXoh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 883C0214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UpaWZEhqJGcfD3VCPJP7jbYaQ0CjpYHPwPi/xGD5v34=; b=HeEjTXoht43zzV
	q2Hl0g9Y4/euEAhVXszsYJKxGNOUAExb9qs6VBEp2YUc70EsHU7OgaQwO4cUFPMqrTmaFvlaJ63kX
	ZCxmBtwjFsXDotW1N5lhMT0zQ6rOH4xOVu6aUn9yuzAWSS6UrB6mqwCKrPuxOAG9fIhSmJ8yB/hgn
	U4stHZy4BBp0utHJOMkQsiEUiME6WFQOvY9zUpEh4UFYWc8rTEkym5ULx0dCejfmSegesIZHxL9qx
	SNazv8ZUBw/5xFo3GG9vzqb0dJqjGIIiq9/F2YPAxj6+07VFHGdDtCnl5TbpvzjPQr/vMwX60sqqW
	DOqYPRenRD5jWwNZIGow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJbS9-0003B8-TF; Thu, 25 Apr 2019 10:18:05 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJbS6-00039K-RE
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 10:18:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C30B374;
 Thu, 25 Apr 2019 03:18:02 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 678453F5C1;
 Thu, 25 Apr 2019 03:18:00 -0700 (PDT)
Date: Thu, 25 Apr 2019 11:17:57 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 2/2] RISC-V: sifive_l2_cache: Add L2 cache controller
 driver for SiFive SoCs
Message-ID: <20190425101757.GB8469@e107155-lin>
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
 <1556171696-7741-3-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556171696-7741-3-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_031802_886381_5D6E30F1 
X-CRM114-Status: GOOD (  11.45  )
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
 Sudeep Holla <sudeep.holla@arm.com>, sachin.ghadi@sifive.com,
 robh+dt@kernel.org, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 25, 2019 at 11:24:56AM +0530, Yash Shah wrote:
> The driver currently supports only SiFive FU540-C000 platform.
> 
> The initial version of L2 cache controller driver includes:
> - Initial configuration reporting at boot up.
> - Support for ECC related functionality.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

[....]

> +static const struct file_operations l2_fops = {
> +	.owner = THIS_MODULE,
> +	.open = simple_open,
> +	.write = l2_write
> +};
> +
> +static void setup_sifive_debug(void)
> +{
> +	sifive_test = debugfs_create_dir("sifive_l2_cache", NULL);
> +	if (!sifive_test)

Drop the conditional check above, Greg K H removed lots of them recently.
In his words: When calling debugfs functions, there is no need to ever
check the return value.  The function can work or not, but the code
logic should never do something different based on this.

He may not like to see this :)

> +		return;
> +
> +	if (!debugfs_create_file("sifive_debug_inject_error", 0200,
> +				 sifive_test, NULL, &l2_fops))

Ditto.

> +		debugfs_remove_recursive(sifive_test);
> +}

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
