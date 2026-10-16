Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30595CCA46C
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzZj926dnJA+rXXp4YqYd9I/RNJ/XPFWVs/wQQ6/3bQ=; b=x5J8TtG9WOo/PH
	oUstnzcGCoPNVl/AWPnMUDp+kvNVG/NzE4n2t0lWfk7/AHxbuV44aooG/NcXuV8bvyenI3vO8rgzy
	p+xB20eRP4r3GNlbfbGl1ArO32EtRT6puUgpG8PNC4peD/JnFuk4FklPTq4SZ8EXiOORkLTsnJW8+
	4iUkn+jAzqMLgp0U5B9ZMNovX/r/rq3hfNUNAp/VPUjoRdgbdrENJjaRjG8EvYljsJ/3r7hsM4Lcz
	B2G0Nz6cLHDgMatvr9yUo/XMHCx6HYZic/37MHlIWnXHkMV74gMMt32/aGbailVcvAyl/hkY2pH1N
	ChPw9dDkX5McU66+0Qsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjQV-00000003E8p-1Tby;
	Fri, 16 Oct 2026 15:00:55 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjQT-00000003E7u-1G0f
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 15:00:54 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-917b78dfe30so1119346d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 08:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792162852; x=1792767652; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qAdHy+XfZaVWAHH+k3kEYHLQsWiJDDa9Am4rmLNBNPw=;
        b=iahrap8247jye3lY+WeYy/hvy1Wv8PDqjb6XI4vSw+QCXBhJPecVttjUf1W5/B+bzs
         c5ZtsDTLIg5qdoYg8dpbVsP/INs7CP20mNagLABZLiqGF2CWI4Ln4RC7v8iFUDYKKW1O
         ENgI/GbTwWfSd0iVTgvusYnvhLF661xU1uQ5fNkS+tc32hIQfjHdywjFeegX3xrOJioe
         gUjqsiH7kOaPrcXyqk41MqzDbui/TUy7vynHD4ccJw7A52iryq9nF1VF9ZkT1+N2LSNE
         cnvUDwpo2vOeqcEl8ikSDIDt2rM0qY/iJlnc6hqlH46vJuIZI/ArFJOxGyAFL9Gdy1ui
         H8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162852; x=1792767652;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAdHy+XfZaVWAHH+k3kEYHLQsWiJDDa9Am4rmLNBNPw=;
        b=W07pSAByK0zThK/XQcJuQnaDLls+gT2/oJPUrsK6LPrTJY5cDlhHDdcaj/8FGeV//V
         xoH/Aqhfn/UxPX/fAkQqoiwJkE80OFlFWyhssgWI0qipHYfXvaKbEiInnAc8xvt3jIl2
         hriubLy5AHqrO6vJJ9+Yy89KgFW/pkiv3l4MwuNc2b8fdCJLZ78KV2CfrrSTCxT3rUQH
         dxJVdlRJwxZPudyvoIimAZcimVY3BVqMurAkS/MD6ifAX4KM1eti/+pNLwAG/nmC+aOM
         rorQSn6A3KH0LlGbS7c5mn/C/hI+LPnI+vXZVRKLL9fawSB/Jqk4I3nCKJmompDQmEcc
         WdKA==
X-Forwarded-Encrypted: i=1; AKwUvBwV3FQAZ1j1GuDHoZ4whHdNMqaBfZGJsc5ialA8/qFRQAMJLNM/P/HWAAIw9NVfsQH4+etCzAR4JuvSXw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIYpGEjjpDcJr6TShqD6zO8qJOtUE1L2liq6GUnBw+fTryJ3MVC
	xkpRF6etwjnpnPTrVLFcbjOVnwlsCGywRt4ni1wDy4keO7yApZy+fYRTb3joWwy6OoUKHBUpL4c
	rMmS3
X-Gm-Gg: AYBFou1ZYCttHqvAR+HifpXhMXVggVpkhetgB1ajb7MM2HGoRhawhVwzE+US7BZTA1C
	O/Om67+RhqRCr3faiTuWTyC5A9YvWA4c5wG7jguUx8PH8bQsIzS32fOuPRX5cq/a4GUxhZHZl7k
	918P1Ba2YIDSwzlKWKW38Bboj72h9Sq6ucn0aXOjcV0/k3L+9DNCvHrE1n6HmcMpOGsoqCKDscq
	uNZC8oP9yivJuIFepAURBY9IFpaFcXsO8KdBJTVoxTOlSRgSLPVuwTiPOrZMq43wxzSUa3SrtEg
	tqc3wWrSjHAKTv3NujTPS+lINjVV5sy6kOB9XYGK/62Mk+HbE+WCXk4DUOBQzcfXQTuXNTioxAc
	hvIIlYJbE1ZIfmGXsAqLaOoZHTRX7sa/uyPzcihzozXm0biTvcxfn4EDdukTit9BggQu1JHvCMu
	bpNmT2kQ4gLcUVeB/aANte1AOCbh+oQwdBb+W6APlf3vIj4yIvjFKWYlFexux0gL3YvYPPy2EWo
	q43FgMRYjZ1SNy6VosNq0+Y5YjL+vsMxPvPFAfBCM5yxxXUoiVgoerT
X-Received: by 2002:a05:620a:40c3:b0:93e:646c:9133 with SMTP id af79cd13be357-93f29da5d84mr10749685a.64.1792162851675;
        Fri, 16 Oct 2026 08:00:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a0d0718sm232558985a.5.2026.10.16.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:00:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHjQP-00000001teG-31SO;
	Fri, 16 Oct 2026 12:00:49 -0300
Date: Fri, 16 Oct 2026 12:00:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, anup@brainfault.org,
	aou@eecs.berkeley.edu, atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com, gsh517025@gmail.com,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
	robin.murphy@arm.com, seanjc@google.com, tomasz.jeznach@linux.dev,
	will@kernel.org, wu.fei9@sanechips.com.cn,
	zhao.qingye@sanechips.com.cn
Subject: Re: [RFC PATCH 02/12] iommufd: Add RISC-V IOMMU hwpt and vIOMMU types
Message-ID: <20261016150049.GG14213@ziepe.ca>
References: <20261015235400.GZ14213@ziepe.ca>
 <20261016073020.10119-1-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261016073020.10119-1-gong.shuai@sanechips.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_080053_351807_D8948618 
X-CRM114-Status: GOOD (  12.38  )
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

On Fri, Oct 16, 2026 at 03:30:20PM +0800, Gong Shuai wrote:
> Hi Jason,
> 
> Thank you for your review.
> 
> > > +/**
> > > + * struct iommu_hwpt_riscv - RISC-V IOMMU stage-1 page table data
> > > + *			     (IOMMU_HWPT_DATA_RISCV_S1)
> > > + * @tc: Guest device context translation control
> > > + * @iosatp: Guest device context stage-1 root page table pointer
> > > + */
> > > +struct iommu_hwpt_riscv {
> > > +	__aligned_u64 tc;
> > > +	__aligned_u64 iosatp;
> > > +};
> >
> > Like the others you need a spec reference explaining exactly what
> > these fields are.
> 
> I'll add references to the device-context sections of the RISC-V IOMMU
> specification ("Leaf DDT entry", "Device-context fields", "Translation
> control (tc)", and "First-Stage context (fsc)"), and I'll also include
> detailed field information, as ARM does.
> 
> Also, I'll rename the field from iosatp to fsc. It holds iosatp when
> PDTV=0 and process-directory-table pointer (pdtp) when PDTV=1, and the
> two share the same layout, so the name should cover both interpretations
> and the uAPI won't need to change when Process-Directory-Table (PDT)
> support is added.

You might be better off just to have a data[] array of the device
context. I prefer the fields are not parsed out in userspace..

Future specs may add more guest controlled bits and in other places?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
