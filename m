Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A1EFF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 12:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mboUrX7Ff2SjiZfDS+WrQIDf7vRhGvGPjVTfb8yfD2Q=; b=zUO/+ViN0g3yOP
	F75VyhkV4YhZdmmJtKWz2rQE3yLQPVYlz1PVw5PoBlIsf6pVoTLlpQECdyZrQCwwMAdaTZOLc/l4M
	ESMu9XcobDy8LDW8FQWGR15PW4coOeJsJ9QgcM8NUxvqq1qxSWTR4dimqtS+mxpMti4YEmrPrSkAF
	JAsk1iocMP9e56G/+zmwARxi1iXHgClMi4I/QIzyYQgWz/zFG8jP8mAJwchbCO2bszPwNwE0xa0qm
	H2bZX+BYtIFSogEGJC9LaoAn7RnxITsdzGPPoSZqb+OP8hozwPurDUv95sP+r98bz87JECuYdWNqS
	fB/o9VXd7ivFcVjn4ngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3s1-00000003Z6f-2xSs;
	Wed, 29 Apr 2026 12:18:25 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3rz-00000003Z5g-1s3K
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 12:18:24 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8ee63e91acfso743512085a.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 05:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777465102; x=1778069902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MPHSzoCIyDIC9QP5+spsNloO0c/6uT0t+rTHSV9tUV0=;
        b=PEwS3tC+sQ/PWU9mQr5kSjCjb2w6c6TwEPcLKovS7zzzF6wp4aYCJJlbt/DXBfi/ZT
         8KhOVbwZqK0m+DHpeDhq1mH5Xlp0DwqyB/eFYCe8lDJ89aNuktz3fIs2q8kU7f9LlnIL
         dRPNCowlnr4KLRApitSc2QQGQ5bv3R2Y/uyUN0KMqNXW55CzU8eiyhGDgxi1eyNjtCQh
         GhiZ9/IWH493Q6yBdPVB7boAhZqOp6kXkEKCdDKRCplGJfYuooMhxNMQf/vRomgh4i9o
         m+AAC7kVXpCPCyjO+lZcPCOctgQOq1ZVniu3aBusa1S1PpI2YJSSxvVzjbiS6/M1qg0I
         1gEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777465102; x=1778069902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPHSzoCIyDIC9QP5+spsNloO0c/6uT0t+rTHSV9tUV0=;
        b=lLsyXgGLtEYyuv0cjaD3IJuL+qYbjUkXgYIKDrmq3pgzs9CBnxsL2IuXbW8qe3VJpy
         kfgo0CcjuDg7nlQ/auB7bN7siVYAyiM98rZiV+qEyx1MAV3uaQpuvzEyOWUvkcyLg1HZ
         7YyWyXhj7ipfMnN2+jG/qsFXwPga7SWXf97O8fFKGRJo6nZWMI5AtARguMhvRoX6DRqf
         VJcc2Ktv6i65GVL0zPb1diq3hXIGY1UpARcXZY626VwM1AzRtj0/IL1Q0Ewe7V/ZkVuY
         t0BBYbkb+Os4CncKHuJXpMJVptSk85J4mi1S4wLG0TnMrAc+quyfNoVTPhbJ1w9WKWxz
         H5tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/baGTvU1jnp3pHfXRKhCDhz8kdhZOtUgecDmZ/g6zKP9z5MpCBfK5VZvnCy4W9MybNcF+8IG8q/lfYCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyASjJ17kROjSWw0AxLBpn3eLCcCeKY+A7dq0AEX/WlioSXnJue
	r01QxnTPy3NSGudzXm/ykaMnE9KN5yGF1UCOG/G5wQiMYXfbZ3/MTxxwvo9VMsURbXQ=
X-Gm-Gg: AeBDievJ2WrR3ZJVdr0xltT+Qay7W6qMqLC3dkCmsuMSQaza9VJmX1hZzTmcZ0OleT+
	iFa54t95v8oZEYUujOLCkULTXbg0Llhz+BraUzgOfyWL/U5O3LfMUQYIOqIaMDsrUZY6ezYG4m/
	DFFZ04Cef8R9bhcU5nEeoTafDHcTTf28fUEGVVg2vdKTFi6MRgtdJe/yG7W/ZaVnty2+wlrqoUV
	XoTIltstFkF+6Ji88d45R7rBc6xW9xEZfY8KPUtDuPiTJlQSayq9DdofPAuUgbFcVnBXPXO83vn
	uS5x3KEXoTTuMIEq2YBFZRZvqTTFupNh1GlkmGZ/H10MtTDBmllAM+FvtQriwdVoqB1qUx6KJ9Y
	/ahEkeDLWvb1jnrCBwqGWOwN5ww8Ke63SR2WxddOUPddywkoCuc6WWyxSAT/VBKl7UXIXlLGymR
	+sj+1q9PRPk8EspLXq6/Npr2urm/b5zp+zE+gn1qGQJH8bVV0A+ToLP6U1ANVSl4mVOq6MPEIKh
	OCpfWeaV/glsRxZ
X-Received: by 2002:a05:620a:4481:b0:8cf:df8b:1e5e with SMTP id af79cd13be357-8f8f3534220mr552478185a.5.1777465101412;
        Wed, 29 Apr 2026 05:18:21 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f940051f0bsm152785185a.40.2026.04.29.05.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:18:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wI3rw-0000000HF8A-18yU;
	Wed, 29 Apr 2026 09:18:20 -0300
Date: Wed, 29 Apr 2026 09:18:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, anup@brainfault.org, aou@eecs.berkeley.edu,
	atish.patra@linux.dev, baolu.lu@linux.intel.com, guoren@kernel.org,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org, robin.murphy@arm.com,
	skhawaja@google.com, tjeznach@rivosinc.com, vasant.hegde@amd.com,
	will@kernel.org
Subject: Re: Re: [RFC PATCH 01/11] iommupt: Add RISC-V Second-stage (iohgatp)
 page table support
Message-ID: <20260429121820.GL849557@ziepe.ca>
References: <20260428133239.GC849557@ziepe.ca>
 <20260429010650.61646-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260429010650.61646-1-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_051823_612789_96A7320F 
X-CRM114-Status: GOOD (  10.48  )
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

On Wed, Apr 29, 2026 at 09:06:50AM +0800, fangyu.yu@linux.alibaba.com wrote:
> >> @@ -263,6 +281,22 @@ riscvpt_iommu_fmt_init(struct pt_iommu_riscv_64 *iommu_table,
> >>  	case 57:
> >>  		pt_top_set_level(&table->common, 4);
> >>  		break;
> >> +	/*
> >> +	 * Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4.
> >> +	 * The top level is the same as for the first-stage counterpart.
> >> +	 */
> >> +	case 41:
> >> +		pt_top_set_level(&table->common, 2);
> >> +		table->second_stage = true;
> >> +		break;
> >
> >Second stage needs to be an explicit PT_FEAT not implicitly deduced
> >based on the vasz.
> 
> Agreed. I will add an explicit PT_FEAT_RISCV_SECOND_STAGE flag and
> stop deriving second-stage semantics from vasz.

PT_FEAT_RISCV_S2 would match what I have for ARM

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
