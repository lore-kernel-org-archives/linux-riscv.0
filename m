Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B37C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 01:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEJgA/Oyw1P04/bBS2+F2dL+zhN5GXQORfBC9unE/I0=; b=cD00my4aKbtIAO
	ytBkn+rIfA2M9BR8XljDamIhaxLVLncDu6rX5SB72doaLJklf0Ja3anUbM4K/Z+6s/4Fsb1jtepUH
	vQ/iDFfDqwy1rQOZMctwtMPrReXiGeViwnQuKIWAeJ7/F0bXizCKS1bM+tkmTn+diUri9+mlm3Es1
	eIrW+lLNMpv2/2sP5DU2B62XtRDzFTSHQaHxmLUsi34EN4OxOeyda05MUUcNisICImOykoYdyGiga
	gnAWG0b2+xX3Pvra9jIvmtWeu0b+J+fvr5JL+P7rTmz1mtdGMvj6z2xHx/+B/GwZLbaIH4nsgu5Ex
	iUVFIR1RkwMQzLPbEDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov7fE-00GMSY-OX; Wed, 16 Nov 2022 01:56:32 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov7f2-00GMDb-Jv
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 01:56:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id b21so15082507plc.9
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 17:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KVMI/nFFiiWGPsODZP4uTO9+eDXKExXBhUQy4MPYB78=;
        b=ZkhmtpyvuQjtpiKcSTwV4FQaNI1BndPmVfYwRbI4kyGyIBWLGYAK9adsViZh/yHJ7x
         GuxgtogV7PtxaPytplYxo+Klt0B/2ry2vtbUojn3VI5CZqcW98TXvlxs8G1FSU2NCLPG
         osV9xc1d2y7cg0+wNaz5Nf0N26qzO6pIP5sDWfotE89nSnvse7sYp7t8PQ00S927CjrN
         Mt9iItQr7ceVWaHS8qhCiI1BYymChnkKt5hyJqGOY0FEweE8dtCPm+eSBErPLu7yhTm8
         o9dFADTr9ZdWsubEfckpwD5DI+8OZmAD6JfaYPF77XPfSWF6ATOhEkaqdt7s4F4xOEiQ
         xj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KVMI/nFFiiWGPsODZP4uTO9+eDXKExXBhUQy4MPYB78=;
        b=rDTRGom7z6o4CXfPkW2CrILw0gO9xjQnoISy1wnOY3oDBPrd01cIFvecglTu2nXYJf
         UBSJnwUibO7ZXKI6c7nKUrZj4N+7gQMH7ZB41rBMVz7kxH2pzRLdjR12p1wApnlSsnSI
         YDkOPmk5a3WUDX6qQPQ5JIhO55purRrp/WquOBIvpZ2hJYf20UNl6M0D/svVE/ER6mAr
         euwYDGoa7fBysgsMIq47CH+i8jakOFhdlhCi5I5M9L4fondwRyHZjeYVLYZtLAAH/0Oa
         c9eaCvkwFky1Vn3PuKq+gdFV/UVOi0SuqJvU+OsBCZ8ij7V0wZxJGZFGofdVydnbCKwL
         RM3g==
X-Gm-Message-State: ANoB5pn66hzesfTmnV65hQsWdx0wr3jayJGiu8/fhhyhOXpRkEBgejjd
	B/pzzMqbWf7ZcSf6AfkP2ThTcg==
X-Google-Smtp-Source: AA0mqf6H0QJ9u7lmf5OzgdM3vacJIFtJ+zbl369j6MJCYNSFKT6kmzTaZY88ji+zMgthkUAHrSJWdg==
X-Received: by 2002:a17:90a:5883:b0:218:f84:3f98 with SMTP id j3-20020a17090a588300b002180f843f98mr1206419pji.238.1668563776878;
        Tue, 15 Nov 2022 17:56:16 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id z25-20020aa79499000000b0056ca3569a66sm9483483pfk.129.2022.11.15.17.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 17:56:16 -0800 (PST)
Date: Wed, 16 Nov 2022 01:56:12 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Yao, Yuan" <yuan.yao@intel.com>,
	"farosas@linux.ibm.com" <farosas@linux.ibm.com>,
	"david@redhat.com" <david@redhat.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"alexandru.elisei@arm.com" <alexandru.elisei@arm.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"Gao, Chao" <chao.gao@intel.com>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 33/44] KVM: x86: Do VMX/SVM support checks directly in
 vendor code
Message-ID: <Y3RDPOerOIf6SwI0@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-34-seanjc@google.com>
 <95c3cce88560024566f3b4b0061ca7e62a8a4286.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95c3cce88560024566f3b4b0061ca7e62a8a4286.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_175620_666134_2211AD03 
X-CRM114-Status: GOOD (  14.58  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 15, 2022, Huang, Kai wrote:
> On Wed, 2022-11-02 at 23:19 +0000, Sean Christopherson wrote:
> > +static bool __init kvm_is_vmx_supported(void)
> > +{
> > +	if (!cpu_has_vmx()) {
> > +		pr_err("CPU doesn't support VMX\n");
> > +		return false;
> > +	}
> > +
> > +	if (!boot_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> > +	=A0=A0=A0 !boot_cpu_has(X86_FEATURE_VMX)) {
> > +		pr_err("VMX not enabled in MSR_IA32_FEAT_CTL\n");
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > =A0static int __init vmx_check_processor_compat(void)
> > =A0{
> > =A0	struct vmcs_config vmcs_conf;
> > =A0	struct vmx_capability vmx_cap;
> > =A0
> > -	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
> > -	=A0=A0=A0 !this_cpu_has(X86_FEATURE_VMX)) {
> > -		pr_err("VMX is disabled on CPU %d\n", smp_processor_id());
> > +	if (!kvm_is_vmx_supported())
> > =A0		return -EIO;
> > -	}
> > =A0
> =

> Looks there's a functional change here -- the old code checks local cpu's
> feature bits but the new code always checks bsp's feature bits.  Should h=
ave no
> problem I think, though.

Ouch.  The bad check will defeat the purpose of doing compat checks.  Nice =
catch!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
