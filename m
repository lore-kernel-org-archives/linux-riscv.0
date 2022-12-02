Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D08C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 16:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jvn4NeG+aVV4297kCu5k8zVBh2K5rai21TTY6yBuSnU=; b=0HrKlmIN4JkxE+
	L+2euQBctItHCjyEuSQIKD+deKgcBNqXouGhkJLFpClmCziZWW0O+PdF+N6QAJIZdGWc8Nwksiike
	9Uh/MLioAnc8/sVrp3Ooc4Utfi7C1HuSy9E+pJID8J7gU1IemXHmPjHX0FC23NQl4mF1iJf+zIziG
	+I85CiNYcmdh3pWJ1rueS22PQPyYxHloQLSTBSxW3QamiaohWSDAfgLqHzwWhwTnejTr54qHfEOAN
	iVh7EM+PYcxKbNJyyUBxKEbHy7LRB9odiyTTxMTiSagoCqL51Nic26WBSdVpAe5G2/in7i65eZhy7
	XjzI5kydQy3YuRTr2Bpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p18Z5-00HKo8-Pk; Fri, 02 Dec 2022 16:07:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p18WQ-00HIiC-05
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 16:04:21 +0000
Received: by mail-pl1-x634.google.com with SMTP id jn7so4993242plb.13
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 08:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b2GsRYGpugbtZSHFD2RurCZ4JW4xZuzTsOfxXrCkfT8=;
        b=NpcRjd8PL93RDmu18EFPPR+cTZLP3kvCDAEAva9wUQzgEtv6dhPvDs1R9Q9+h2mN7N
         H42dGaT+sl8xeMuYK2rfUD+midQutKuG+T3MUl21HeEIW4MolVpdsUIo9SmBbkggNx39
         8eN3yXePSJelVozj19wEaq9z6VDhzvEr0ForIWyEXE5qa5rozQa3WxAYewh7SubIBKmO
         02PPePyseXuLiMMtCMvFiCLdBEv6hZUEsP/WY2KPh2svytXFAqt8tvoUSmd0DdfZmIR5
         sLez1JP4ikgagdRRPh2k9RbfsucGTq+KVdolkDHLvc/Uk58Zr0iw+nxpff3e47GDmBB4
         X4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b2GsRYGpugbtZSHFD2RurCZ4JW4xZuzTsOfxXrCkfT8=;
        b=QJUhMM4pGQxaFNPPLULskRFs6qzuTNSDzCpCzkC3+AmWxJHuSRy/8E0gCnc+brbqRB
         vTVqUgK0Bn3KvKeCJiJPvHbPTPXm7Qbif+WXhUOQF0pvx89HlsYIQMk+6wqE4bU/j1UE
         ADKU7Dv4u9sZCG6536+W3IJSGPkzz6OZmBYhx92yezMs63dGfDHQsRp73Ah4fupVh2ou
         KeG/wtPoIcQvPcqoXBnsuOhbqO9CslsCwoRTuWy1iZpIqzwAdc73cOVlRRg8nmtfsfPr
         NInk/Ssht1s48R0V+uk51jmre7yzZ7QD6yFXrs6yBwkDeW3p9eY9ZE7Nggd7DlFVLrJh
         E6tQ==
X-Gm-Message-State: ANoB5pn7QJ9k6MHWD6ST3qNuxRdMTRs3I7y9NdmXS7jVlqujNAHfu8lH
	x3oOFg/9Oocw7/mAgwJliEgErg==
X-Google-Smtp-Source: AA0mqf7w0TN/IsoZof5JEkNGBQ8Yd2Zjjhh4wCVFAlaPO07IGqPcQWl6OiCMwNp3DG6Q8B9rQJAiYA==
X-Received: by 2002:a17:90a:9a98:b0:219:2f90:4fb3 with SMTP id e24-20020a17090a9a9800b002192f904fb3mr28837193pjp.109.1669997053879;
        Fri, 02 Dec 2022 08:04:13 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id q42-20020a17090a1b2d00b00219752c8ea5sm3349337pjq.37.2022.12.02.08.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:04:13 -0800 (PST)
Date: Fri, 2 Dec 2022 16:04:09 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
	"paul@xen.org" <paul@xen.org>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"farosas@linux.ibm.com" <farosas@linux.ibm.com>,
	"david@redhat.com" <david@redhat.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"Yao, Yuan" <yuan.yao@intel.com>,
	"alexandru.elisei@arm.com" <alexandru.elisei@arm.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"philmd@linaro.org" <philmd@linaro.org>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"Gao, Chao" <chao.gao@intel.com>
Subject: Re: [PATCH v2 40/50] KVM: x86: Do compatibility checks when onlining
 CPU
Message-ID: <Y4oh+XsbifA2BSj9@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-41-seanjc@google.com>
 <cf755389c21c73e8367d8162cabc83629d3f9a74.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf755389c21c73e8367d8162cabc83629d3f9a74.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_080418_140399_28CD1F63 
X-CRM114-Status: GOOD (  17.26  )
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

On Fri, Dec 02, 2022, Huang, Kai wrote:
> On Wed, 2022-11-30 at 23:09 +0000, Sean Christopherson wrote:
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -11967,6 +11967,11 @@ int kvm_arch_hardware_enable(void)
> > =A0	bool stable, backwards_tsc =3D false;
> > =A0
> > =A0	kvm_user_return_msr_cpu_online();
> > +
> > +	ret =3D kvm_x86_check_processor_compatibility();
> > +	if (ret)
> > +		return ret;
> > +
> > =A0	ret =3D static_call(kvm_x86_hardware_enable)();
> > =A0	if (ret !=3D 0)
> > =A0		return ret;
> =

> Thinking more, AFAICT, kvm_x86_vendor_init() so far still does the compat=
ibility
> check on all online cpus.  Since now kvm_arch_hardware_enable() also does=
 the
> compatibility check, IIUC the compatibility check will be done twice -- o=
ne in
> kvm_x86_vendor_init() and one in hardware_enable_all() when creating the =
first
> VM.
> =

> Do you think it's still worth to do compatibility check in vm_x86_vendor_=
init()?
> =

> The behaviour difference should be "KVM module fail to load" vs "failing =
to
> create the first VM" IIUC.  I don't know whether the former is better tha=
n the
> better, but it seems duplicated compatibility checking isn't needed?

It's not strictly needed, but I think it's worth keeping.  The duplicate ch=
ecking
annoys me too, and I considered removing it multiple times when creating th=
is
series.  But, if there is a hardware incompatibility for whatever reason, f=
ailing
to load and thus not instantiating /dev/kvm is friendlier to userspace, e.g.
userspace can immediately flag the platform as potentially flaky, whereas
detecting the likely hardware issue when VM creation fails would essentialy=
 require
scraping the kernel logs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
