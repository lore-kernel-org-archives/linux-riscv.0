Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917F7CD5BAF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 00:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTliJHueVHg3s+BQaPp6ZEsmtfZIS2YCDSrAvO5vgfk=; b=c2EwEhfgkBGEBL
	UHDjfyYs1GXjaQDQJItth3O73ckOxDfwPirXpGFieP6e3G0iN5uquoapFeQxyuOa3xnZ/DerLoDJF
	vDvl9hR48/UrsV/Z+SEmP9hlcowLeZr9NNtD2onPTgqUJoch6CDgKS4OjuqsvPJ4cwVTCI2xp4LVF
	zTlNPksGJ3/J+aVe1HR08C8bFPusftLVxbtkZVyzgYb72yBatws3Z2C3kmS8cVltrsyz4bnIJTX75
	vn3rddlp4brMk10OhQZ7QHFpGAFmb4cK4k146s/FaYdgFxy9GwwyGE4JSZoUMXYrtQaDP5KNtYtOj
	94xHg2h0B6AQwlhSScbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQDgJ-00000009OfR-3dfW;
	Fri, 22 May 2026 00:24:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQDgG-00000009OeN-2hEA
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 00:24:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LNxnKj778821
	for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 00:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5GSON/0hiBS5ycqET1N4+CsB
	MgT/hpoirbtpuxXnHDo=; b=j6nAgohe17YHjIEKj+Ihg75j5WfPN0JUsHLCk1Yq
	qZ8MVDyv7FkQ7tR4l+tgBPPk1MWRU8xCFncqEpb1b4dLnOm259YGHK7jP4Sddtlx
	Oqm2W+9Oqkw1P+V/m1Am5Xe1OPLUhgkFeGg5yqfrhBe3CMKR9fmBlqi5iPLIqLYs
	CPhAqK7fQnWrrGaIyklLESc2g2NS1FZyjwPOQduckxvVH7f0VhrxaG+01rdVBh3P
	H13GaMEw0iwD1Hrim42IcLFVC1wC40znGo4ksGamtn7JJCUnYMF75mPocrhkhBgj
	BB3Um+efwSOQk5LDGgxnZ3pfhujoC/ayHtKXhOc/5eyBcg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7ar22x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 00:23:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdd327d970so3634255eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 17:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779409439; x=1780014239; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5GSON/0hiBS5ycqET1N4+CsBMgT/hpoirbtpuxXnHDo=;
        b=A9yahcJbbkgbVtkuf5cGGsqtJwxZZR0DGAyMofQqviUwmRm4xAgof0OFkRpA3xAjWL
         KJoGSMC+B71fHntMI0LOJorcM0TqAJSY6P0Kzj//1+iaJ2IVVCsarO22kit3ZaBPn93W
         wWdnBxWhIFQhJPtJUVqn12c5JCOVTTh2ODs6CpCXW8pz7+nTwYzDLzt8sthnq8LbO/hR
         Q6X6+u6uPglEmMDwDbCxVGfgPR1YXOyjG3yUSrYJk75zl6541bZ/AiITPVz7/2ZGQbgl
         Gpv7uN/6cf0EZ2f7wD1JX7izt83M+LVeGcl4Ie2hQZ9UtZE2phrIUw8zrK7VKoDWz1lv
         Fsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779409439; x=1780014239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GSON/0hiBS5ycqET1N4+CsBMgT/hpoirbtpuxXnHDo=;
        b=Qh/7TMTjFYJZWObvWoXcqapTVcN5vcbLbQlpqxMcAkv22c6HoBXhcy3BA74QPJeEsa
         FlEiBMav3P/TuwZ3yRFMiJU5aGt1iRFlKqQqrILWupicEHHe4Nh3O2u7uXD9TFGnPveW
         zs7cz4+SHwEmn01DkROLgVwyBmw2d4L9C0iClZsIyyy4dbdQEUxcJ+bzicfl6GXRhHgD
         LMJVWXKGFA7rXsfRaecNw3EszBnKaVH86i7ozzafVy2lrdgouC8iXhcM4nLPQfI/KrXQ
         fN1mjcg5QrK8G6nzlIS8lenBGGKcSMuL2SwHKmj37K0SpcrrQfnfImVt35/8HimzRB4Z
         kvFg==
X-Forwarded-Encrypted: i=1; AFNElJ8XOYbsD57IUFOC+6z8XEOieEZBb1LmjfH1nk0ZRj68hxe4mdv6gpn/yv7NchMbnCFbbicjr5xltHrFjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWs41fpvA8d0A1SAb99EYN+4R/n011m9U4r6RK1hZ1lndNwgBu
	DGYtKP4WDD3BKozR+27AzHlRraGAQnP5LRKAjs05W9IyCv/ejqsJoCCFqhESV/TfNRx3uIpBdvK
	2dAJimbZTqlhp3MrxixJYjbCTikZVmDdfOqfZVTxhkYWIWQsVZ3MGoEsXCj3yj5cZRmhV8y8=
X-Gm-Gg: Acq92OG8ijIIsVDRDW4VMOCVIcfh3DRzls/ahHQIJ7Pb6i1Z/8O1EYwLZ127+JPUDio
	B1Khg+poZDEIwPP1yp6z3EgUD8Pa/9Mfz7ty7ygh3y2d2Qb/Xdr61d+jBOQhidK+y9FMBUdp2l4
	S40gGt8XvWEaLzwUIdP5aSh6HBy5I4O9OBW9q+wbd0relEvDcU2dei1T7RMjTYyytoNCMgf7AUW
	mWP9ZOtd8eLsNcMEnj55tb2PlUEt9moJ2X3GhUaBr4hvqMCyasliGxpd1t25O8Ry4zxFK/RhgMD
	Uz0zOI9m4l02ffyyEMHbZ6DktfVfEVBLlfckBqcmslQi13dqYIm19e9fUWgqn9Dwv11AAzeM+o1
	Gp9KmmeQE2zCowsAUFG27f4fmnapJW8E=
X-Received: by 2002:a05:7300:230d:b0:2d2:d5a3:e97c with SMTP id 5a478bee46e88-30430e40401mr2728645eec.12.1779409438524;
        Thu, 21 May 2026 17:23:58 -0700 (PDT)
X-Received: by 2002:a05:7300:230d:b0:2d2:d5a3:e97c with SMTP id 5a478bee46e88-30430e40401mr2728626eec.12.1779409437908;
        Thu, 21 May 2026 17:23:57 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3044b6d16f9sm804742eec.2.2026.05.21.17.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:23:57 -0700 (PDT)
Date: Thu, 21 May 2026 19:23:56 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix TOCTOU race in SBI system suspend
 handler
Message-ID: <yirnowpcfq6wqru3jshbbaicqftfj4ef3dcss65jdtuon6nzml@iyv45tnmmfha>
References: <20260521142030.1560861-1-xujiakai2025@iscas.ac.cn>
 <zfvysxe5eqyogy3cesmp53omigq6a7cjajs3ffbrfyqq7huph4@bbfw7ro5zz7l>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <zfvysxe5eqyogy3cesmp53omigq6a7cjajs3ffbrfyqq7huph4@bbfw7ro5zz7l>
X-Proofpoint-ORIG-GUID: yEwpnV2Uwc2WeMrXiaFDGe7rEElKoogT
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a0fa21f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=pGLkceISAAAA:8 a=xEbelNxs-k07UTx3eFkA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: yEwpnV2Uwc2WeMrXiaFDGe7rEElKoogT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDAwMiBTYWx0ZWRfXyWoXV+5AT4yX
 hh6UJ71SCa9zYdxolfVGktjU4Zne8mmOIquVPm1Y4abNvpgOzZSJw4UvKE62GyVU8EKediSoDMC
 EBE+aU3UO+PuMUziF7r+8iQvdl4EGCY7eyzu4buuYipvjFPUNpjwCQxyDq08SP9g35+o9B+lS16
 T4FebbacwM8eo5DBjqTIOSrWSj8xo5EX6vmEk3LPEXP9om8ys10mfYcaz9bcbH81gbwV5IRtdIr
 Y+OVh6CXr2DsS8vXdMsOyaSdI6ccIdXaAsf603J8wFfTFcE323x2QKZzJUZwCVXhvwKp//u7z+G
 q6W2iOkJtigfidezDbqaApox75z6HKHDue2i9D8MJeKX1w6KF2riSO+HnzgjtphTXY/LpDTv3NN
 ntYJOEFioGEo20JPdlWav7DrFZnN7YnKNKmvfVMDy5pwavsCn+rJ7RzHjw9j2ELYVVZJmZ5SE24
 3u7+oPQuzvShIyPeWSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_172400_802073_C8D3E525 
X-CRM114-Status: GOOD (  35.10  )
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

On Thu, May 21, 2026 at 06:47:26PM -0500, Andrew Jones wrote:
> On Thu, May 21, 2026 at 02:20:30PM +0000, Jiakai Xu wrote:
> > The SBI SUSP handler kvm_sbi_ext_susp_handler() checks that all other
> > vCPUs are stopped before entering system suspend, but it does not hold
> > mp_state_lock during the iteration. A concurrent HSM HART_START from
> > another vCPU can start a target vCPU after the SUSP handler has already
> > checked it, violating the invariant that all vCPUs must be stopped
> > before suspend.
> > 
> > Fix this with a two-phase approach:
> > 1. Set a VM-wide suspend_in_progress flag before the iteration to block
> >    concurrent HSM HART_START. The HSM start handler checks this flag
> >    under its existing mp_state_lock, closing the race.
> > 2. Hold mp_state_lock during each per-vCPU stopped check so that
> >    mp_state reads are ordered against concurrent power_on/power_off
> >    writes on the other side of the lock.
> > 
> > The flag is self-clearing: it resets when any vCPU re-enters
> > kvm_arch_vcpu_ioctl_run after the suspend-resume cycle completes.
> > 
> > Fixes: 023c15151fbb ("RISC-V: KVM: Add SBI system suspend support")
> > Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> > Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> > Assisted-by: YuanSheng:DeepSeek-V3.2
> > ---
> >  arch/riscv/include/asm/kvm_host.h |  3 +++
> >  arch/riscv/kvm/vcpu.c             |  8 ++++++++
> >  arch/riscv/kvm/vcpu_sbi_hsm.c     | 11 +++++++++++
> >  arch/riscv/kvm/vcpu_sbi_system.c  | 10 ++++++++++
> >  4 files changed, 32 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 75b0a951c1bc6..c4e710ec40f90 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -93,6 +93,9 @@ struct kvm_arch {
> >  
> >  	/* KVM_CAP_RISCV_MP_STATE_RESET */
> >  	bool mp_state_reset;
> > +
> > +	/* Set by SBI SUSP to block concurrent HSM HART_START during system suspend */
> > +	bool suspend_in_progress;
> >  };
> >  
> >  struct kvm_cpu_trap {
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index a73690eda84b5..ea6f14244addb 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -838,6 +838,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> >  	/* Mark this VCPU ran at least once */
> >  	vcpu->arch.ran_atleast_once = true;
> >  
> > +	/*
> > +	 * Clear stale suspend flag from a previous suspend-resume cycle.
> > +	 * The flag was set by kvm_sbi_ext_susp_handler() and persists
> > +	 * across the userspace exit; clearing it here ensures subsequent
> > +	 * HSM HART_START operations are not blocked after resume.
> > +	 */
> > +	WRITE_ONCE(vcpu->kvm->arch.suspend_in_progress, false);
> > +
> >  	kvm_vcpu_srcu_read_lock(vcpu);
> >  
> >  	switch (run->exit_reason) {
> > diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> > index f26207f84bab6..2f88d93768bc8 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> > @@ -31,6 +31,17 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
> >  		goto out;
> >  	}
> >  
> > +	/*
> > +	 * Reject HART_START while a system suspend is in progress.
> > +	 * kvm_sbi_ext_susp_handler() sets this flag before checking
> > +	 * that all vCPUs are stopped; checking it here under
> > +	 * mp_state_lock closes the race.
> > +	 */
> > +	if (READ_ONCE(target_vcpu->kvm->arch.suspend_in_progress)) {
> > +		ret = SBI_ERR_DENIED;
> > +		goto out;
> > +	}
> > +
> >  	kvm_riscv_vcpu_sbi_request_reset(target_vcpu, cp->a1, cp->a2);
> >  
> >  	__kvm_riscv_vcpu_power_on(target_vcpu);
> > diff --git a/arch/riscv/kvm/vcpu_sbi_system.c b/arch/riscv/kvm/vcpu_sbi_system.c
> > index c6f7e609ac794..b79c1cff7a996 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_system.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_system.c
> > @@ -35,13 +35,23 @@ static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >  			return 0;
> >  		}
> >  
> > +		/*
> > +		 * Set the VM-wide flag to block concurrent HSM HART_START
> > +		 * from racing with the per-vCPU stopped checks below.
> > +		 */
> > +		WRITE_ONCE(vcpu->kvm->arch.suspend_in_progress, true);
> > +
> >  		kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
> >  			if (tmp == vcpu)
> >  				continue;
> > +			spin_lock(&tmp->arch.mp_state_lock);
> >  			if (!kvm_riscv_vcpu_stopped(tmp)) {
> > +				spin_unlock(&tmp->arch.mp_state_lock);
> > +				WRITE_ONCE(vcpu->kvm->arch.suspend_in_progress, false);
> >  				retdata->err_val = SBI_ERR_DENIED;
> >  				return 0;
> >  			}
> > +			spin_unlock(&tmp->arch.mp_state_lock);
> >  		}
> >  
> >  		kvm_riscv_vcpu_sbi_request_reset(vcpu, cp->a1, cp->a2);
> > -- 
> > 2.34.1
> >
> 
> I'm not a big fan of this approach and I see sashiko found it has gaps[1].
> I'd rather we introduce a mutex to kvm_arch to serialize cross-vcpu

Eh, not sure why I said 'introduce' here. We can just use kvm->lock.

> mp-state operations. So it'd be taken in SUSP, HART_START, and also SRST

And, even though SRST doesn't really need it - why not... Consistency has
its merits.

> (anywhere that reads or modifies another vcpu's mp-state). Operations that
> only modify the calling vcpu's own state would still only use the per-vcpu
> mp_state_lock.
> 
> [1] https://sashiko.dev/#/patchset/20260521142030.1560861-1-xujiakai2025%40iscas.ac.cn
> 

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
