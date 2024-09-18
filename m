Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE32CCD1A5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxqe05ioZiNQd8yhX4aYnGkGwIxI5xxJmeHQHJLX7To=; b=HpptXwQS6sGk7p
	5xiq6s0KsW83jojtkQcmE4f/Ylv483zu9MOh0uy67O1h84jNbrxeUBBgg6X4WGPizsw242V/1Y5t6
	RQKhXnFwDcF0XASOC0u7QR/nJzluYY0PaXtzEpfJtkxUWNL0443159jbU4s9n+OFixKa0cXy/iY6Q
	prtWTK3HISAr3ls8IjT5ebLoQnta8lYlMbNuCoe5N7iK6J3ev4Bwwxb3MdL4YWO1Bz6mof4VLcO+0
	jAl6HUb3g4jG4rQzGFMlLweDb+8IgVV6mCVPwEFfBR+UjnXzjRawuatDNaTDP3Rqvj1r/Y0PThVXt
	Newn2oR73sSIzHajQ+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqvB4-00000008OWH-2TIo;
	Wed, 18 Sep 2024 13:57:06 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqvB0-00000008OUz-260I
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 13:57:05 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c3d2f9f896so7706049a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 06:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726667820; x=1727272620; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jw9R7zHcU6wAlHrH9jZChqK3i5AsMOvAHMYccAaAi1I=;
        b=i7hQQsue810D1C6G0TgNUFRYWOpF+yHvuZ5oGSiirOV1y0UOG4QutmDDGf+QUbCDpl
         D794JvUny9xgNd0sYm5jnxtxSmj3P8C81c8Y1eVs7gyzxjb2CcunEdAYmrfqF/j8S8kA
         GvTMCwIJYRs90bLWWzcl4210NYLXGfNC2GMz3KmgIEjzAK1Ef5h1iDRD7T6d27+33VRo
         2v11D8CnbcHiqpyUiOdfx9QMuWmRo+tQB79IqtFWnVVBCNvbhsOJzYq1Zz3qlY/BnmpC
         HJECyKp2UAw4cWnKNFGMnznDAObVsIDQAokKAqQbn0kL6XzGKc8UAp2WiRQY/iSgf5oT
         cEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726667820; x=1727272620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jw9R7zHcU6wAlHrH9jZChqK3i5AsMOvAHMYccAaAi1I=;
        b=oMXCDJhEvYnrdCCWNCMVHmfd4EWyHjJWBdQKsguBiHmWdBICkSKO5iIGyvGwPyruHz
         ju6n260i3xAe5wPU7B12lF2VC7MYpRNrU857UZcoX851ThBr5xiE+DPydvdvh0ltaRWa
         cexGNaKPxcvHQ+rYuVh2yoU/u3PQ2QFoLvPXFb4x01hN1JdfrTpmcrsp42Gyvc3pyXiB
         3kGmXTDTac4+CZVymxI/Hx7cGvzjj5Jvg2XfrJ+s2FemD0CWLrTRyxW2StqQrgEK6dHl
         9xrxEBwkst91jAAwcflTb9qQXybB+CU+Yy2XNtAS18QO3QKTNYk42BoWKScABsuzGyMn
         iXgw==
X-Forwarded-Encrypted: i=1; AJvYcCURXXk4kjFMpM7Ou2+36PqRLweQC5LFN3Y1zDQreg6JKSYCmJDUpgKmMg4aN/V69fh1dSMpKZkhI2I77g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEuSizbnH3jv5znRgnpeSfSR/7Qub6vfMz3tiWSvpMspOlJgrD
	KxXI6ZULtv0qaN+1rFKHVMkLoLIEF3JBfc/Xt+pQZkFvqcnq/EfGDi6OSjQHfXw=
X-Google-Smtp-Source: AGHT+IEnUf2BBLrMw6AF9knDQNnY2Bh71rIsr9GcMfumfal10/pMPKRiwjmEtak/OEyud7HuRes7Yg==
X-Received: by 2002:a17:907:971b:b0:a89:ffd0:352f with SMTP id a640c23a62f3a-a90481045d7mr2005808166b.48.1726667820268;
        Wed, 18 Sep 2024 06:57:00 -0700 (PDT)
Received: from localhost ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109662fsm594583266b.38.2024.09.18.06.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 06:56:59 -0700 (PDT)
Date: Wed, 18 Sep 2024 15:56:58 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, 
	qemu-devel@nongnu.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
Message-ID: <20240918-4e2df3f0cabdb8002d7315d9@orel>
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
 <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel>
 <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel>
 <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
 <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com>
 <CAFEAcA-L7sQfK6MNt1ZbZqUMk+TJor=uD3Jj-Pc6Vy9j9JHhYQ@mail.gmail.com>
 <f1e41b95-c499-4e06-91cb-006dcd9d29e6@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f1e41b95-c499-4e06-91cb-006dcd9d29e6@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_065702_564057_2022CA0D 
X-CRM114-Status: GOOD (  28.74  )
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

On Wed, Sep 18, 2024 at 03:49:39PM GMT, Heinrich Schuchardt wrote:
> On 18.09.24 15:12, Peter Maydell wrote:
> > On Wed, 18 Sept 2024 at 14:06, Heinrich Schuchardt
> > <heinrich.schuchardt@canonical.com> wrote:
> > > Thanks Peter for looking into this.
> > > 
> > > QEMU's cpu_synchronize_all_post_init() and
> > > do_kvm_cpu_synchronize_post_reset() both end up in
> > > kvm_arch_put_registers() and that is long after Linux
> > > kvm_arch_vcpu_create() has been setting some FPU state. See the output
> > > below.
> > > 
> > > kvm_arch_put_registers() copies the CSRs by calling
> > > kvm_riscv_put_regs_csr(). Here we can find:
> > > 
> > >       KVM_RISCV_SET_CSR(cs, env, sstatus, env->mstatus);
> > > 
> > > This call enables or disables the FPU according to the value of
> > > env->mstatus.
> > > 
> > > So we need to set the desired state of the floating point unit in QEMU.
> > > And this is what the current patch does both for TCG and KVM.
> > 
> > If it does this for both TCG and KVM then I don't understand
> > this bit from the commit message:
> > 
> > # Without this patch EDK II with TLS enabled crashes when hitting the first
> > # floating point instruction while running QEMU with --accel kvm and runs
> > # fine with --accel tcg.
> > 
> > Shouldn't this guest crash the same way with both KVM and TCG without
> > this patch, because the FPU state is the same for both?
> > 
> > -- PMM
> 
> By default `qemu-system-riscv64 --accel tcg` runs OpenSBI as firmware which
> enables the FPU.
> 
> If you would choose a different SBI implementation which does not enable the
> FPU you could experience the same crash.
> 

Thanks Heinrich, I had also forgotten that distinction. So the last
question is whether or not we want to reset mstatus.FS to 1 instead of 3,
as is done in this patch.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
