Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD82EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 15:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x35dvsKaoTwipGwhPVJLyy+j6woM+qFvh2qXO0ynzno=; b=gGfKCvzhFhoJ6f
	8zW05Af3dsKqGu6hl2HrEenFNdcarfm0sz7A2lKKqAyW4/DJcpnwEm8XrrBNAXlEIDKQcuEvkPtVs
	jJ4fGf2nPj8tYm0p0xBhKY/5620kN80KAlg3YeWSNgk2DntpaJUqbkcNeWiF5yE+oT++87aAW8QML
	0x2c7RBqBC0bhpVY+XcCQ0T0+R/VNHTj4cPQsmFCoGbckIoeVlySCWXV+trftXbX8uMAdj48BlRCu
	y/eBTROqII0Z+mwJh4E4+4wQzhyzbQkl3E6G7f6K8r5sR6a0vPJHpn8Vmo0rTPrxsxOUvYg6o+yhi
	fxE1vAi1Z4/K7iYTlKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovgcp-00F9Zi-4X; Thu, 17 Nov 2022 15:16:23 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovgcm-00F9Xn-H5
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 15:16:21 +0000
Received: by mail-pj1-x1031.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so5680813pjc.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Nov 2022 07:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Geqy1MGLbG4CNNhTg6ig5gMw4IRIu2ApDkqg8kUu6fE=;
        b=im3ECY8irru0d2J3PmRkK1oS6XMYGDmkKrSKiLpQr6kggh65U519LacoANhp99/wDs
         yHeOZt/b6IK2ihlol7f0Ba2me3bs0cr3TxYhTcQThAifpYqs8dB3p/8NK2dEXBDay90O
         bW6pXrP7B14I1MNWa+NfggtZKbyTz1rnHhMsVYBCQiIPWqcakktYyuja6CoTLxQtkpfs
         JsqTKBMeEN72FgBWe/ihbCXP9h1x9TEb9ulziUgPn3ZIyNK23YQtGzg65j8/As9Xyk7K
         3+HVs34s1miAiKC8ZfgoVMv73WwF3DJWJcQDYskZpYkejUuTFt6cPMAw/xSDBCQyvpM1
         B6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Geqy1MGLbG4CNNhTg6ig5gMw4IRIu2ApDkqg8kUu6fE=;
        b=JxrRXZGID9gvI6w0Ho6pvH9TUnGM6kQRKukxaPxkje+91LheQF3HbtpeI3AE6unokC
         3WHiE9Pn620NJigzykK9p2Xm6CR5QKnhtQZUA7I/ueHqX2Lh5iz2bWhcUXKkOxE1vgeL
         2tnpLBtEr4AZAalkpTVAIIYW46DUvkfuSu59XRgv5c1avxqCkCI890JnwoG9tMyWpN09
         eODeSVxaaT2LRJSzO6g+Xvt6bUUXQGypdeyrd37QHXlKd9KZAjWBaBYpbdBuf+lSoo7X
         ja8vuXoF7zhMSr7ocYLuzCSoMYDO0NYT1lsCgJdHpvgzVl0KZf2b/D6Ibkxzl9Ouu420
         fE8w==
X-Gm-Message-State: ANoB5pmwnblYPeJJ1u7R1oopoKgBq4f7UBHiflBW/7h5TmnQNUOxeiRq
	9SrqnNfN43uzEyThvxOm37xAkQ==
X-Google-Smtp-Source: AA0mqf5Drbj5GGUy8zNXmPljMG8UuEFTPTHf+YuwVXyWlSocFeljs1OjIQ+Ab7mWXZMNXetmsxdGbQ==
X-Received: by 2002:a17:90a:6b84:b0:20a:cbb0:3c9b with SMTP id w4-20020a17090a6b8400b0020acbb03c9bmr3280802pjj.81.1668698179289;
        Thu, 17 Nov 2022 07:16:19 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id r12-20020a63e50c000000b00476dc914262sm1135777pgh.1.2022.11.17.07.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 07:16:18 -0800 (PST)
Date: Thu, 17 Nov 2022 15:16:15 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"Yao, Yuan" <yuan.yao@intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Yamahata, Isaku" <isaku.yamahata@intel.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"david@redhat.com" <david@redhat.com>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"farosas@linux.ibm.com" <farosas@linux.ibm.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alexandru.elisei@arm.com" <alexandru.elisei@arm.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
	"Gao, Chao" <chao.gao@intel.com>
Subject: Re: [PATCH 38/44] KVM: Disable CPU hotplug during hardware enabling
Message-ID: <Y3ZQP3C1f8pk199t@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221102231911.3107438-39-seanjc@google.com>
 <88e920944de70e7d69a98f74005b49c59b5aaa3b.camel@intel.com>
 <b198fe971cecd301f0c7c66028cfd71dd7ba7e62.camel@intel.com>
 <Y3PzhANShVlTXVg1@google.com>
 <95ca433349eca601bdd2b16d70f59ba8e56d8e3f.camel@intel.com>
 <Y3UZtoIidMyE8qVz@google.com>
 <7fb66c497b6c41049167b05c63267cbc301b1c20.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7fb66c497b6c41049167b05c63267cbc301b1c20.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_071620_608694_0572B9CF 
X-CRM114-Status: GOOD (  13.69  )
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

On Thu, Nov 17, 2022, Huang, Kai wrote:
> On Wed, 2022-11-16 at 17:11 +0000, Sean Christopherson wrote:
> > static int kvm_x86_check_processor_compatibility(void)
> > {
> >         int cpu = smp_processor_id();
> >         struct cpuinfo_x86 *c = &cpu_data(cpu);
> > 
> >         /*
> >          * Compatibility checks are done when loading KVM and when enabling
> >          * hardware, e.g. during CPU hotplug, to ensure all online CPUs are
> >          * compatible, i.e. KVM should never perform a compatibility check on
> >          * an offline CPU.
> >          */
> >         WARN_ON(!cpu_online(cpu));
> 
> Looks good to me.  Perhaps this also can be removed, though.

Hmm, it's a bit superfluous, but I think it could fire if KVM messed up CPU
hotplug again, e.g. if the for_each_online_cpu() => IPI raced with CPU unplug.

> And IMHO the removing of WARN_ON(!irq_disabled()) should be folded to the patch
> "[PATCH 37/44] KVM: Rename and move CPUHP_AP_KVM_STARTING to ONLINE section". 
> Because moving from STARTING section to ONLINE section changes the IRQ status
> when the compatibility check is called.

Yep, that's what I have coded up, just smushed it all together here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
