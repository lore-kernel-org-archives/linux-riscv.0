Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E87DC5DF89
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdWHBMV/L4wWedSYgaC08DLBJYI/hW0+CSOTnz8tmVo=; b=qOgVDj7IhOMrFe
	WplouUFev7+4sIwHVl42TmD/90zoTIaqvrtuZTrqilKI0tJZiVa6nTMcX+8sqsUB68EPhWTanClHR
	4QlXlIxLWmKJEm4N1J8wKuEbP3lh0iivpAUx6vO7m6wCeYH81gD62Ua0n0lvact5SqsBC+I6KJYNC
	L65RhyIdAuTfRfmjovg08uzlc5qr5cKdHzFTGKGHQ/DfHxFoTVloEzA7VkE36aJxLAgMYrukLpoYd
	PUkj9LmMaCnP42LY1DZ2Zws26bO3XkDa/t7hYnz4IkiaA/rE1jsOcLWiBIhRdZcTqHYY93/r45zg0
	sLbGJ7oo2kFd4KbZyoQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPqY-0000000DUbP-1Ibq;
	Fri, 21 Aug 2026 14:03:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPqX-0000000DUaw-0h5d
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Aug 2026 14:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Om6T8MSyTD/SG92U5RChhVeEZVX1cV43aK2KvbHIThQ=; b=WDA11cpO+LM0FEUP5CAyk0ahRY
	op0uLOh/x7O4crKeflDTwDf5SGBiSrVzQFOrrKaQXL8xS1tuFw/DetqUEY8OLiDQfsqNPNlCCSmnT
	6yWDmjIHnKiuNgQ/DJiPaZcABausaAMkZfA74Me90Snq0al0fHR1Ho0s+NkCugc5EUlzMzvrDsDqS
	Imc09rBqxJeuC8gVJ2LxQUzpHGfuHbjh+YiB0nrHPAxW4BqMc2YEXyn53zavS0L/XygGKWK//PD8s
	z7tBPV+3MLOjCp/jOXKjPwrivMfbwUML42aMrNAy3v4pkbpgVkNCQ7I67BM+eXTkiICUSZcbvrDHZ
	Jd6mv4yw==;
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxPqU-00000003ojH-0oPp
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 14:03:48 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-51c0006ea8eso7174061cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787321023; x=1787925823; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Om6T8MSyTD/SG92U5RChhVeEZVX1cV43aK2KvbHIThQ=;
        b=hhjr4Js1x6kJgPOPtMFSgp2sXCV5CQ4e9Ph4DN91wxrEAuk+M1qCVBuRJrLwu9YFWl
         yh4J5tMBamw/voYCXR/oxaxT7ygXYxVuor1l25Z2pIbMhpZjna2Uk44ryeBh3FQx+6Aw
         Q1yQp02cFLTWz7Ggo1ClLyVTwRPyOAApvRn5anQdG+fz0vnUTgcrIPnJA4utb1wTIY5D
         gunD2TeARV2lypRmIqiBDNtE/Xx2XuIRnm932muKqMT82/FJgX4Vc+KaS2cKz9WFYZ2O
         sdsrWyaWtAaxJ3oIjI+FFpMmLbm3hn+sJmEa+L8LUTtcbGVIGlsARNfc4jWLm0Hm4fwk
         Z4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321023; x=1787925823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Om6T8MSyTD/SG92U5RChhVeEZVX1cV43aK2KvbHIThQ=;
        b=gZ3rfkB5xC2xdawqKkr9mX6exfyss+HsTA23VrhO8+6KdbRIwcdHKx3LrAKwrxolts
         eD3QvZ6uUBCTqILiyIXzqJrl7bYi4WPPLXdm90lctxbkyoHIySw+h4OBLANYtPD0PYsE
         iRI1OHEKPvxZyLu5qvXKLZrCPzefSQzJd5nY5SYqIruvb7OvCua3US44jwigzRuWGP1T
         lrI135NPpRwwk/SX3zLflKMdfSnjJrsCRDbXtpaUC+yKO6CcJuJ+qdhWJloay1YMKgIF
         rJb8Hes0KXaTjCiqB82AwmVELIZ8B2K0J0pGUhQR/i4S/6msWUfU4uayuWIinbyLpA26
         QDKA==
X-Forwarded-Encrypted: i=1; AHgh+RqsDEOsX43vNLVGhGjbIPnPQcA4alZbA79r7rjxaV99Ys7sT4yPoQcstQ43Imr6JT9gw0FFoVbROtfc1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw76foXh8zLYb1Yf/pLu7q6+QNR1h55lAP0hiFh/dxOEbjyI8Pb
	Srvun3qWabuZFv1+ji6/xgPears3NG5SqxO/9GeSyIX+mFjIvR+Z3WZEGmqOGEJ1v0I=
X-Gm-Gg: AR+sD103pp3xGroxjEX+Wpaa5ho99hx3GJO6/nEb5eNVGrJCrJI2t4jLXr3o2/nyTDk
	tRWdMga2woWzCqaioOUfWnUc+Ni5YoR5/TitEQIhDunAUbO8iK68U68vi9Eo+4KZ6KEISnLr0Ci
	8+ATayRxnhBW8GUTxYzlmdOaOAjmedOvhCWYgeBOjTA0GzF3EY8lwsIYtGcqGNiuXtQV3Z5hnae
	JTmrpHEEE9AHRjl4NzIn4UXqp/tJ2uI4qrC1MvsXr6jvf8mD7ul9NyT53tBkGKnfPA+pIXKQLW/
	PXyt3/L3yTUr6SGeAQTpSyT84hYqfaI1FH9xbUAaHY1k6eY0eE02Sj49BNUX6RBvjJM5RPUyB3/
	ug/gC14Z7YGXh0pR8L0mo46czRkhrAdz8OXbaA6O2CHlXgqB983WV82LN2owEn2mpeb7+/JHF1y
	vObjkoi+Y+obcBTF7rXx4kf71WlbklHcki3rdPSGesPy5IWVMZ7xhfzeprhT9JaOKH3yZTB+4Qu
	Wxv4AWxD8tDuzUky41HnOx2wpPrRXmy1uWZjG1rX0WQxg==
X-Received: by 2002:a05:622a:2305:b0:51c:849b:86b with SMTP id d75a77b69052e-52df5ba9d6fmr58940341cf.43.1787321022876;
        Fri, 21 Aug 2026 07:03:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd87823efsm51424521cf.31.2026.08.21.07.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:03:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wxPqP-00000006349-1gzv;
	Fri, 21 Aug 2026 11:03:41 -0300
Date: Fri, 21 Aug 2026 11:03:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, baolu.lu@linux.intel.com,
	jroedel@suse.de, zong.li@sifive.com, andrew.jones@oss.qualcomm.com,
	anup@brainfault.org, kevin.tian@intel.com, atish.patra@linux.dev,
	skhawaja@google.com, vasant.hegde@amd.com, guoren@kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v3 02/10] iommupt: Add RISC-V dirty tracking PTE ops
Message-ID: <20260821140341.GC1114497@ziepe.ca>
References: <20260821132749.82070-1-fangyu.yu@linux.alibaba.com>
 <20260821132749.82070-3-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821132749.82070-3-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_150346_395356_ADFDAD4C 
X-CRM114-Status: GOOD (  13.27  )
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

On Fri, Aug 21, 2026 at 09:27:42PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Implement the three dirty-tracking hooks required by the generic page
> table framework for the RISC-V format:
> 
>   pt_entry_is_write_dirty():
>     Check the D bit (bit 7) in the PTE.
> 
>   pt_entry_make_write_clean():
>     Clear the D bit across the full contiguous range.
> 
>   pt_entry_make_write_dirty():
>     Atomically set D via try_cmpxchg64() on a single PTE.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/generic_pt/fmt/riscv.h | 43 ++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/iommu/generic_pt/fmt/riscv.h b/drivers/iommu/generic_pt/fmt/riscv.h
> index 5692c033dbde..09581798e753 100644
> --- a/drivers/iommu/generic_pt/fmt/riscv.h
> +++ b/drivers/iommu/generic_pt/fmt/riscv.h
> @@ -226,6 +226,49 @@ static inline void riscvpt_attr_from_entry(const struct pt_state *pts,
>  }
>  #define pt_attr_from_entry riscvpt_attr_from_entry

Does this work for all stages or does it need  pt_dirty_supported ?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
