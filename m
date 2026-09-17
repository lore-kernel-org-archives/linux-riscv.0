Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D75AC982D0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 19:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/hp64aZMd2OZo9u1zID55+ZDhsXG1kD2nzbDOp9DHo=; b=Ma5UW4Xn26S6yF
	oTqLUzSkIxfTrBJlwzOdfoBWJMAFvxZYWzarZRKdwwuNUQ8+L2r2Vkn4ec0j3IMsj2xbIkRFxtYN4
	Hk2YVlxjXFDUv2EyVcdEcNpA0+oBboF2QytNAPx6RcChQqb8lyCFkKBs5UyFms89cNsP8ShY4Dxse
	tLy9nlWE7fc1m3l71PKrsyeRWAqgF2IZ626NFV5sV+1t4N9HMDPdq4H2jbAXAEhFW4ywrvoIVWprw
	Fxh5dzN+Dcvue6/XG4Ibya5HiRWm+ZVFDGCO8iRomGfF+jiUyeLfSv4xsyX3zIEAzpYhaCiCUvwaI
	0o/jv56SVAVin93aVlBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IGJ-0000000CNrq-1LJt;
	Thu, 17 Sep 2026 19:59:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IGI-0000000CNrk-0Bpb
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 19:59:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B529E601EF;
	Thu, 17 Sep 2026 19:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626FC1F000FF;
	Thu, 17 Sep 2026 19:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789675151;
	bh=Rm9+vd+pl+ynAYoyabNq6vDDpUHMo6kqP+gIWl7nZkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L0eVvy+mH1eenfGVjEfEaybB8BJ59de+ZscjhT6IHlLDcV7dxvtUmwF9EpODkRfRD
	 2+5ph5YD6WQ+aNsRXJ1bz1nlQg01GD8VGgjnGeYbkCKwzGwzHsytcU99CNLCpVnakb
	 b/H4GOC2BHFvRnscJrBCpo/FwBvl1J/cafoTSqDpWSX3PAhUWW1Nl9ptfmaznGL7AT
	 gcYiIx+ZNQF7bUA5oHIbZ1zOxLZPd73RKRpxIIh2BiWVUNIvKAm0Pnw0LEtM6Ni9CZ
	 dAjRk0FmOZDCURrbguTaX+RhRqEDocnXTWZR12NYkgAhoxkrEB9uTyfigTmIAn3N5z
	 uo4U8RP+N5OSg==
Date: Thu, 17 Sep 2026 12:59:10 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <aqxGjrK1dIpZs7ln@thelio>
References: <20260917-dfustini-atl-sc-cbqri-dt-v8-0-7964e8d73fe8@kernel.org>
 <20260917-dfustini-atl-sc-cbqri-dt-v8-2-7964e8d73fe8@kernel.org>
 <20260917165743.390201F000FF@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917165743.390201F000FF@smtp.kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2026 at 04:57:42PM +0000, sashiko-bot@kernel.org wrote:
> > +		d = cbqri_create_ctrl_domain(ctrl, &hw_res->resctrl_res, cpu,
> > +					     ci->id);
> 
> [Severity: Medium]
> Does this bypass the capability agreement check for dynamically registered
> controllers?

This is a valid point. cbqri_resctrl_pick_caches() only compares the
controllers present at late_initcall, and riscv_cbqri_register_cc_dt()
does not refuse a later registration. The scope is limited as this
driver is built-in, and DT overlay is not likely for a cache controller.

> Could this cause capacity configuration operations to fail gracefully with
> -EIO when hardware limits are exceeded, or otherwise abort CPU hotplug?

It depends on the mismatch:
- If the late controller has fewer capacity blocks the read-back check
  in cbqri_apply_cache_config() fails with -EIO, the domain is not
  created and the CPU online is rolled back.
- If it has more blocks the domain comes up and only the upper blocks
  stay unused.

I will add the cbqri_cc_caps_agree() check to
cbqri_attach_cpu_to_all_ctrls() to eliminate the above issues.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
