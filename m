Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D24F60744FE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 16:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zYvNzoe/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K4P3hoqm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pXHstrdz4ocz9ujvGW2wr3LdjIFd/ydUOacsu+CdWO4=; b=zYvNzoe/51unc7fAOWVU2jMMvw
	o29jyT4ukuccVeSEBM9WFgBcuqO3bkavh9OZplbO8eWoYSgdnQSLynEig33Thrj2LzmatZ9XMkIqk
	BRyDnMsKgcqhNZBiqW4k9aWuHb+T1is4QcgDKzsrKekiNIi7FuGx5TNcy5/OOUfNGs+NbedYt1ge4
	n5oAEq8ImN7fJ+hRqWBsSpfzTfZs4EZbQDf2INuOIrQbCNpkUl5ulwvt3zFXOGAswb15SdmbaJNmA
	h54j3Jlyp7DQeAsSIfr/w7ut3umvUqhrVNPVNz8tz8rjn6trTX9aVIo1dP47evd1wyeFEGb2A8XmL
	QpjOVlJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtiH-0000000DUVt-2l98;
	Fri, 13 Nov 2026 16:01:17 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtiD-0000000DUSO-2CT4
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 16:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794585674; x=1826121674;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=YG7WmtTH7eH/TRYWGKZhEqx8XmC5j5XvTISTGO02pwk=;
  b=K4P3hoqmB1L8NXU3+GIikHZ91i8x7kqtWhJsdDbJyhrAMIHPEt+DVRdh
   wgUS0zNdEuynvUPVvLlHsZpuFuRIrgmgFnmt8h8oVJqYuO4XALPNtsT+I
   UXIsr9T5Am45j0e2ExPFq3eyhRgvKqXXrcYA6uKcdfDDAMza9jv8xBTxy
   elGw/lwsVSC01JOvX32ZNgcYmAiOuabCxsP1id6crW0FoAsRwH9pgSZpv
   CKmN2CSQUDanziFimhx11rq/hoRfsaQ/rL73/l/T6/h3Ld1m7rtB+ry5O
   yBt/sS3gakjG1UkTQbrciEmawhVcfwv2EAlSVp0GiIoy7ef3ulF7gNztu
   g==;
X-CSE-ConnectionGUID: SvH4hcmlRxW4qDgjf2FCIg==
X-CSE-MsgGUID: YPnIeunrSmeggY97hvGJLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3493317"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3493317"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:01:12 -0800
X-CSE-ConnectionGUID: bPhvzQduTSaESd0DpamkfA==
X-CSE-MsgGUID: iuvrwAL6S+iVWY/tM+JzbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9040375"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 08:01:08 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, 
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-riscv@lists.infradead.org
In-Reply-To: <20261112134905.6100-1-johannes.goede@oss.qualcomm.com>
References: <20261112134905.6100-1-johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2] platform/wmi: Allow wmi module to load when
 acpi_disabled is set
Message-Id: <179458566259.7950.1578678353634598585.b4-ty@b4>
Date: Fri, 13 Nov 2026 18:01:02 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_080113_855683_B14182B7 
X-CRM114-Status: GOOD (  11.01  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 14:49:05 +0100, Hans de Goede wrote:

> The core wmi module provides symbols which may be used by other modules.
> These other modules may still function when acpi_disabled is set, but
> the current behavior of acpi_wmi_init() returning -ENODEV when it is set
> causes loading these modules to fail because the wmi module these depend
> on fails to load with -ENODEV.
> 
> One example of this is booting a kernel with both DT and ACPI/WMI support
> on an arm64 systems with devicetree which will lead to acpi_disabled being
> set. Trying to load the amdgpu module will fail in this case because it
> uses symbols from the drivers/acpi/video module which in turn uses symbols
> from the wmi module. Note the video module itself already contains handling
> to still load when acpi_disables is set for similar reasons.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/wmi: Allow wmi module to load when acpi_disabled is set
      commit: 8ab84b8e07ce3988c4fafbb9c622ec9e12e3b065

--
 i.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
