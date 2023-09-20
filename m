Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58833C00E86
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7sAhoes5dYCT4vW4PdeHI7LEoP56Fmo27sBBm/rm6k=; b=mxoj89TOSSUXjl
	eLBMUWzRMoin3lfVC9O4puchL8Gi2vYjPJpSH6ZJEZN8VLxqPNmt/9ejVnaBbga1hFoDOy60X/uDh
	hG0gDVAgQxW0XaJV+kxSvsXEfRD1oSRg5chAQPSK0Py30UfZTSHWsBB+fO/cCpawRX9Gd9HYWaGKv
	tqmC56mxe4I6Bj58pz49xYUj3xhhA2SaVG1ZEjDuBivTJW9ItNdvOMrXTlVDx1R0rSsw7Ci1FwZ5k
	JrMK/sKw3dtWbOf/NekVwpl8sZVw3XKTP2DFaLpFobX8aAsOEgFKs/NFojWaQV8nTj3f0ZDJZT00Z
	xhHW+8845kXobjHbdGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiz7W-003V65-3A;
	Wed, 20 Sep 2023 15:28:07 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiz7T-003V52-2S
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 15:28:05 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bcb50e194dso111964941fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695223682; x=1695828482; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a9Ljunvy3dj+j8HAtMF260p6n6RyHL/IrNz1gCKBLAQ=;
        b=exCsgwg1D0+sMWk84cqks/TsN1I/Ylm6DiWWpXmQKH5O2fy8/EXyO0TuEx9L6LoNix
         r7jY/MtOmSB4Ou7hsJFuG7jZ3pB0DBlEodd4WoOixNo+x7cF1o2fUogvS3B9pkry01gh
         PTaxmqRNyHNRiIK5gJZ5LFOYwLqa6UsiCIV/i+iKTxVdi8VGIzKgYadte3haPjEDWZBE
         H738Q+95Pchbe5MgKW7/xJ5eMo0IDWaohnz82kvJgvDeSpAK/Soi8iglgIEAPztZKTBS
         anH2oHI5FYf5TA6ECwTSPpjyhd2YETT9h6ht3XZvCd3tWuj/tHFXUQxmlg0zZ4Su9Vlc
         iepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695223682; x=1695828482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9Ljunvy3dj+j8HAtMF260p6n6RyHL/IrNz1gCKBLAQ=;
        b=KFlaQ2Appdzf42Bgm1bA/4+VhH421XSrn9XGjVXEzHDzFBcdcwzAaPr27mARcyAskC
         s4pFcwHTpO/gcGzhT9pM9t/WErn9Li787t6ge03lTi0wVTXM0M//ScfxclbNZqBI4w1A
         sDRkmJC3rR90IZZXYFVtdqwhubbmYY74+XcCUTePYAtW/9IrJkzAZ72yRQJe0Ubrl5TI
         caq7JOl8KRocHXT79Gd7dlDyKUNBaw/GobG71gZQQO5NScIgpfhI6c3fI2yOcTpsE6+6
         kX+53OiXFis+N2AjrUws9Lf9c8IAJn80iyomfAL6QKklytgVT/6owpphOqeevrfwjthI
         eRYA==
X-Gm-Message-State: AOJu0Yzn84WUO2C+y/m3mF6mVX97slWLbNrAf3aj84FejDlIlDRCjUGt
	TsSn0nVNciIUfzVn1EFkl+ilUw==
X-Google-Smtp-Source: AGHT+IGNxtOpqNHHVeBEePX5GCdzZ9zpk1m34sQUUbsO2HoGwIEyAVOWL+KE/saT9mHOcQc7JV3nFw==
X-Received: by 2002:a2e:a167:0:b0:2bc:eceb:6a4b with SMTP id u7-20020a2ea167000000b002bceceb6a4bmr2471577ljl.28.1695223681954;
        Wed, 20 Sep 2023 08:28:01 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v15-20020a17090606cf00b0099275c59bc9sm9433551ejb.33.2023.09.20.08.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:28:01 -0700 (PDT)
Date: Wed, 20 Sep 2023 17:28:00 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: "Xu, Haibo1" <haibo1.xu@intel.com>
Cc: "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "anup@brainfault.org" <anup@brainfault.org>, 
	"atishp@atishpatra.org" <atishp@atishpatra.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: Re: [PATCH] KVM: riscv: selftests: get-reg-list print_reg should
 never fail
Message-ID: <20230920-326d0d84a57240dcebca6277@orel>
References: <20230920143713.6896-2-ajones@ventanamicro.com>
 <BY5PR11MB3909D011A5633AF7496CFFDCB0F9A@BY5PR11MB3909.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR11MB3909D011A5633AF7496CFFDCB0F9A@BY5PR11MB3909.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_082803_811181_32B1E2A5 
X-CRM114-Status: GOOD (  22.28  )
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

On Wed, Sep 20, 2023 at 02:59:07PM +0000, Xu, Haibo1 wrote:
> > -----Original Message-----
> > From: Andrew Jones <ajones@ventanamicro.com>
> > Sent: Wednesday, September 20, 2023 10:37 PM
> > To: kvm-riscv@lists.infradead.org; linux-riscv@lists.infradead.org
> > Cc: anup@brainfault.org; atishp@atishpatra.org; Xu, Haibo1
> > <haibo1.xu@intel.com>; paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu
> > Subject: [PATCH] KVM: riscv: selftests: get-reg-list print_reg should never fail
> > 
> > When outputting the "new" register list we want to print all of the new
> > registers, decoding as much as possible of each of them. Also, we don't want
> > to assert while listing registers with '--list'. We output
> > "/* UNKNOWN */" after each new register (which we were already doing for
> > some), which should be enough.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  .../selftests/kvm/riscv/get-reg-list.c        | 93 +++++++++----------
> >  1 file changed, 42 insertions(+), 51 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > index 85907c86b835..054706538b9e 100644
> > --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > @@ -112,11 +112,13 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct
> > vcpu_reg_list *c)
> >  	}
> >  }
> > 
> > -static const char *config_id_to_str(__u64 id)
> > +static const char *config_id_to_str(const char *prefix, __u64 id)
> >  {
> >  	/* reg_off is the offset into struct kvm_riscv_config */
> >  	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_CONFIG);
> > 
> > +	assert((id & KVM_REG_RISCV_TYPE_MASK) ==
> > KVM_REG_RISCV_CONFIG);
> > +
> 
> I think we can skip this kind of assert test since the function was reached by:
> 
> switch (id & KVM_REG_RISCV_TYPE_MASK) {
>      case KVM_REG_RISCV_CONFIG:

The assert is to ensure developers don't call it from anywhere else, where
they may not have already confirmed the register type. And, that's why
it's an 'assert' instead of a 'TEST_ASSERT'. It's for developers, not test
results.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
