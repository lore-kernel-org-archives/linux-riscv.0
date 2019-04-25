Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1966CC10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 10:13:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA9C1214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 10:13:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bXp9lhnw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA9C1214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5eNf7SXW9XARcQ5MtcvelariT8UScZ5GYizaJgVIlw=; b=bXp9lhnwV65F+Q
	5RwAYAbQkXKhizMCuuQ4YeGgCgBWOxdUTgxKC9xDFv8sBPRPoP+nBg8zrIukLPSmInJzAOVPXk5i6
	3EGGtdFUhCilWZlJAqMb3+Jml4QTfe3GI0KLpltxAW8PzQfChqRIEmceJvv1rqAAUi+XCxdnEaeGJ
	2XIWAKexlE3czbLiAvxVFchaHzHQfOWrGDH6DaREuq1N44DBBP8jBXRLCSFqQ9jNFqOFBGXFxXAfK
	G9IITmJKB4CSvkV4UukqtiQ9tYvDwnfC59M7U6LskjByHKwsD0pAtGtLNgFmTkLMD02elgwkVUEy5
	50HqU4PKL5Yy3D3VqCPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJbNx-0000TV-Tq; Thu, 25 Apr 2019 10:13:45 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJbNv-0000Sd-E1
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 10:13:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABA34374;
 Thu, 25 Apr 2019 03:13:42 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6DDD3F5C1;
 Thu, 25 Apr 2019 03:13:40 -0700 (PDT)
Date: Thu, 25 Apr 2019 11:13:35 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/2] RISC-V: Add DT documentation for SiFive L2 Cache
 Controller
Message-ID: <20190425101318.GA8469@e107155-lin>
References: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
 <1556171696-7741-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556171696-7741-2-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_031343_571352_BF8ED508 
X-CRM114-Status: GOOD (  16.45  )
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

On Thu, Apr 25, 2019 at 11:24:55AM +0530, Yash Shah wrote:
> Add device tree bindings for SiFive FU540 L2 cache controller driver
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.txt  | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> new file mode 100644
> index 0000000..15132e2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
> @@ -0,0 +1,53 @@
> +SiFive L2 Cache Controller
> +--------------------------
> +The SiFive Level 2 Cache Controller is used to provide access to fast copies
> +of memory for masters in a Core Complex. The Level 2 Cache Controller also
> +acts as directory-based coherency manager.
> +
> +Required Properties:
> +--------------------
> +- compatible: Should be "sifive,fu540-c000-ccache"
> +
> +- cache-block-size: Specifies the block size in bytes of the cache
> +
> +- cache-level: Should be set to 2 for a level 2 cache
> +
> +- cache-sets: Specifies the number of associativity sets of the cache
> +
> +- cache-size: Specifies the size in bytes of the cache
> +
> +- cache-unified: Specifies the cache is a unified cache
> +
> +- interrupt-parent: Must be core interrupt controller
> +
> +- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals)
> +
> +- reg: Physical base address and size of L2 cache controller registers map
> +
> +- reg-names: Should be "control"
> +

It would be good if you mark the properties that are present in DT
specification and those that are added for sifive,fu540-c000-ccache
explicitly. Also I assume you can retain the stardard "cache" compatible
in addition to above. I am interested to see if the cacheinfo infrastructure
can be used without any issues.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
