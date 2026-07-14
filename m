Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CCEC44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Nf75dl29ixLQcbRkQR8mUiv2qwJeAxa8PXJ6B4M000=; b=iBq3e4uP5VVFr9
	9pD1bYxaNsVMr+H4IfymQt8Dyw44+HciXrbVc0iAqwBNC0zO79Rd6KBQT0xRiN751XHYmWllmRkkz
	yAkevI9TL8j79cKVs6W1XYq5rKucyYC07sAGkSImEEEVU93j2RFOMxq8rf5Mw9/7P3I2Dz8Kv2uu5
	WRRXHf0Jf6e8SMtQ0pBJ0+lwzkrKDY3Pu0ncL7b9tSLezhIe6fU/tk4994OWRmqZAq+k5miu2RZs6
	VBhgLc8dNkRGxrvUFvrXMhZUAfC9uTrdDoig6VM/t+Pjp+MCJW7h+IIXPpvr0XeO+fPqTSBjMH7gQ
	47XsJECHBAP2/zKu1Cnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdjY-0000000CHIJ-3Hq5;
	Tue, 14 Jul 2026 14:03:40 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdjW-0000000CHHZ-2ZQU
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 14:03:39 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6a376ad8fc0so1457420eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 07:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784037817; x=1784642617; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lIWNtYbjtsZ0PQI9/iIL6fWurRq5Hy1V2922aR85kK4=;
        b=XLGxbpZMJLLAmrx8MCp5lss78/iIWYZ3jKEt8GUfSTAJq0VPbn3iDJglCGulR7wwUu
         NjA5I8us6k3E9+LSj4QS0H0Ner/FkKRYAV5lcsAnsERN+tV6R6Y813YLU4VvaImLllRQ
         XiV9wD22xzfChdH4i9FTTtuvEDUYUBGEMg1E7+4cj+/LVY3zdd/IXRXGX2m6fUxiWPsc
         6rhFwNU8QrJow6ARgHpunSzMAG4AHQot3PjCbnz79q4RxXcCx9966JZWUNgdJ2n4sImK
         cUC3WjReFcbk+BmXSa9db0pAULd4GiLQWk71m+cFgXe+Z5M0zoNshf6Vshx4Ar5iVUDe
         HcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037817; x=1784642617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIWNtYbjtsZ0PQI9/iIL6fWurRq5Hy1V2922aR85kK4=;
        b=TjKngeSlSkc+anv2GRBS2WkM10Q+0OuBxN4DEbe0RqPdLn4TwItxKt//vFCzTCsuI6
         tUXRyKSXvuzmwN66u/Ndi8EXkBC8D9k+AbSY0oCzXvQhrgnN3IouP4mppXBN34pZsZQN
         bd6IO0/N6J5np6tHr4rq1oM4mKBvjJnxLCa2ix6ssFh5m9COnwhRQZDQvahzJQfy78Ku
         yxscGaBOEEYIvQLIqgp0Y8H3ixSVdxRF2AxohcloPdN5GacQiRzy0FW426PX13LF2dPw
         y1hQOz4xh4g6B/iHq/Fkn8TtXvpnz7oKa8xfMgkn/IIrCFkLrAF0uolLMVSJaPjq+sUd
         m15g==
X-Forwarded-Encrypted: i=1; AFNElJ9iCZAVv167pdxTi2ZlV8vLtmHBcNE1CGndr4kfLzlcWXrfcfGYekCm3lkzzPfSkvljckAs/Cd5p6mt2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxqbsAsd4jBXxfmwTKyTB3P1pu7GHWAY2nAjU1GPhXVy642pCZ
	bdDdjJTyvRGUdZRVbIUiYSV+Tz16Ds4n9jv0Zjhp/3tgyggZ1ACS+Si7cYdKOONOrXo=
X-Gm-Gg: AfdE7cmJdTkAF7MReBTRlhKXz28pD9aRk2r+eTmcQylrif/RZhe5PkmsGzX7OqkFDYu
	2zwIcLyzclVZ1XRJMgUCFsOTQJSYRX+KCiYeIRAvNsTxGFanqqvBFYuzirP8KA1lRhwlzb2U0nI
	vC0regpMWC9IvVxlf67biyOID1E5S5r1BfZcUcXpChH/rdnOja45cwVHi8J0u5W6aldntylaRiw
	7dT+tVC6MjIoOyohSR/8wbOGOtQPPpJu5S4MCrnB3sBtLbFH7NBpXdmWuAjUXqF4DRzF/wSwRCY
	zunIlztPRK4FEwFIJUv3AFdgzAyP92Uk1wf7MwXyCHh6yMj47kh4M64N3IjnchJ55JCl8pf9x1Z
	H5uIhokhphKkcMz4eFoAhdW2WDFIlnsDuttuE4NmjdYXDQFWpKiGGWrqxc9gxtfRQgi+Z4J0=
X-Received: by 2002:a05:6820:1f12:b0:6a3:1dc5:3557 with SMTP id 006d021491bc7-6a39a5b34bbmr8055289eaf.16.1784037817485;
        Tue, 14 Jul 2026 07:03:37 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6a77csm1521115685a.45.2026.07.14.07.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:03:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjdjU-0000000FeUS-19dr;
	Tue, 14 Jul 2026 11:03:36 -0300
Date: Tue, 14 Jul 2026 11:03:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com,
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev,
	will@kernel.org, robin.murphy@arm.com, fustini@kernel.org,
	pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
	Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
	corbet@lwn.net, shuah@kernel.org, kevin.tian@intel.com,
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com,
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, x86@kernel.org
Subject: Re: [RFC PATCH 1/7] iommu: Add group lookup by ID
Message-ID: <20260714140336.GA3716926@ziepe.ca>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-2-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260714130657.46963-2-zhangzhanpeng.jasper@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_070338_670225_0C56AD04 
X-CRM114-Status: GOOD (  17.60  )
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

On Tue, Jul 14, 2026 at 09:06:51PM +0800, Zhanpeng Zhang wrote:
> Add iommu_group_get_by_id() so callers can resolve an IOMMU group from
> the numeric ID used in /sys/kernel/iommu_groups.
> 
> An ID lookup must keep the group object alive without also keeping an
> otherwise empty group active. Embed the devices kobject in struct
> iommu_group so its address remains valid until the parent group is
> released, and return a reference on the parent kobject to ID lookup
> callers. Add iommu_group_put_by_id() to release that reference and
> iommu_group_is_active() to detect when the devices kobject has become
> inactive.
> 
> Serialize lookup against group teardown with iommu_group_kset_mutex and
> only return groups whose devices kobject still has a live reference.
> This prevents a concurrent lookup from dereferencing a stale child
> kobject while allowing external users to discard bindings to empty
> groups.
> 
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  drivers/iommu/iommu.c | 107 +++++++++++++++++++++++++++++++++++++-----
>  include/linux/iommu.h |  17 +++++++
>  2 files changed, 113 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index e8f13dcebbde..da269d10f6bf 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -40,6 +40,7 @@
>  #include "iommu-priv.h"
>  
>  static struct kset *iommu_group_kset;
> +static DEFINE_MUTEX(iommu_group_kset_mutex);
>  static DEFINE_IDA(iommu_group_ida);

I think it would be better to change the ida to an xarray than to use
a string search on a kset..

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
