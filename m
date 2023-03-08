Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12B5C678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 11:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIZ6hRe47m9OfWliszzs3JiP+aJ9eBUemDlcVTI/F/c=; b=Zo8fWT2Tx0MKU1
	d/uuAnYCM9JHcQw89imWG9VxquDp8usO3I7kU1AZYhh46Obpywu6dofHOrNieQXNPKyieZB0mxRpI
	jUGwKZ2B/K9Z3SjOQC14aOXTeRnFLpG2vJcqbmjhuX8P1fM886sEEoHfbSFalY5s3atnVZEeCUHLm
	Jf0bil6YtzHtXUPaNqYVVP3byZrM7Zdi03h/5Bhi2vJJeyHQ+6/yJBGezsSYElQ3GNP8n0ky8h/9C
	FU2c+yp1PD+lnXnGypgFEbRJ8yTnW+mmidc86EZkqFXa6ZuJUzMswYFf0frA6QbiXArKoW0oHenat
	o8Sct9n5y0NV2NH/Z09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZs4v-004dGb-V9; Wed, 08 Mar 2023 11:35:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZs4t-004dEW-1D
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 11:35:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFE981042;
	Wed,  8 Mar 2023 03:36:01 -0800 (PST)
Received: from bogus (unknown [10.57.16.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CD7A3F71A;
	Wed,  8 Mar 2023 03:35:16 -0800 (PST)
Date: Wed, 8 Mar 2023 11:35:10 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	pierre.gondois@arm.com, conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "riscv: Set more data to cacheinfo"
Message-ID: <20230308113510.fb6y2xhylavkrgtl@bogus>
References: <20230308064734.512457-1-suagrfillet@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230308064734.512457-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_033527_164205_E70EBECA 
X-CRM114-Status: GOOD (  10.67  )
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

On Wed, Mar 08, 2023 at 02:47:34PM +0800, Song Shuai wrote:
> This reverts commit baf7cbd94b5688f167443a2cc3dcea3300132099.
> 
> There are some duplicate cache attributes populations executed
> in both ci_leaf_init() and later cache_setup_properties().
> 
> Revert the commit baf7cbd94b56 ("riscv: Set more data to cacheinfo")
> to setup only the level and type attributes at this early place.
>

I had noticed the same and had something similar when we did some rework
around for v6.1 merge window. But there were lot of other issues to be
addressed at the moment and hence deferred this.

So for the change in general, but as Conor responded, it would be good
to do some checking to ensure nothing breaks and all the requirements
this patch(baf7cbd94b56) addressed are already handled in the core.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
