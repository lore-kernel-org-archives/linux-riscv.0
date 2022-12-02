Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523CAC4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XivEv02dlYbkuNXgfFJOn7hIFWAJdNzMwL0usczAl3Y=; b=WXLGo/4MOabpfm
	PjAsQYcjUVR+rMdY/PxZViUJ+sCJH36FtNqNT9/xG0nGRCt/SF7ueiRlef/uU6Yg/O1hZJq7iwopk
	W4v77V/T0swW5NwnTtQY7ZmaT3aKBNaqmNvs+ZErffDXHejzNDzBDst7OnCz3ADYGNvOfnGSKj/ix
	yPMEg4t74HM4QFg3ktA+Ovlf83LAdUAvaFNb3n0TOUWiIzpe+UyNgA8CbJlGeNR40NR37zii+5AEd
	RZ7Iu6tWAUccLLfC4O7vKlQNGEVK5VS2jS09T0eVYINoVSf+286FQP6qAqd7IQVk8zvV3zjpAstw7
	I5bZrLWPYr5DocfAlECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p18ah-00HLyX-Bo; Fri, 02 Dec 2022 16:08:43 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p18aC-00HLTA-Cd
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 16:08:19 +0000
Received: by mail-pf1-x42d.google.com with SMTP id x66so5316084pfx.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 08:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LMdFvNSIKdTJxppFI5JflU3ZXHxkZjSJ4fG5U4tk7Tk=;
        b=kw0qyCOMp2u+ojev0wrASw/lF7r9rOnRJHqLy08FIIr+f+qpPtSFohe59bJmaOi/rJ
         xcGzBwmHctfDCuY/HsZstsw01nTTKqB9D0ItsIVCZBuDkF6U4LFd8/XxyiMZ9HQQBawu
         5Br6kbHRMEkmhVdkrdlpAnXBg7aXr8x1ngEkT987D0vDq9wJ1LYSA7pyGWl0PB6S36YX
         Ye0BXjX/JFQwCFB0idj1kNjBh1WOFf2yIueArh18nn+f3Kk6RhG95XRHvHGlIJTCnyAw
         T+Hf0HOA9lpO63L3167YfTmLHua9wbiTHz1XwCqkS0us3SdkuoK9a/bX1aNd1tZdIG9m
         GSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMdFvNSIKdTJxppFI5JflU3ZXHxkZjSJ4fG5U4tk7Tk=;
        b=xr8J4J0LBh6+xPmShXEU/IhoTJXgwpHUCVmjTC5KFpKmoJvU9WC9rqACVcETgTpIOv
         Q4YODEaZ3o4dGcJ0qhOteRmqYOinTSOqgz6Tl0QFyc5fLSena3FIvD64IN3N0ZR2uinS
         KGWAGWlrAdMszenuD+Q76rKWARVuVceKg4XxHsy1Fs3gaoRNRZYJ5ABE7EppP8huD4T9
         Qrq7WDYvznWYtIwusBFT+1BlyQYzKkPsenZ00CDWbOOw/+J0EQxwaqxXa+mlzvFjgBgw
         /iIs7Nv2PPYz99DsuZrHTju/If48RaDSe2G+l0z6F1zZqsAf8BLkurVLAaTHKFd923Qi
         vvTw==
X-Gm-Message-State: ANoB5pkyplEsHaRknxPo0l46JFra3sxoZJGmc6jBS8DEeuGwUiP84Eav
	c7ygW/UkzmE2rHYAKBWIsNXCAA==
X-Google-Smtp-Source: AA0mqf5a5KU+HXt1yCJ0zhlFtswkW2r0VasQIXpEBIwwE2hKQw/T3gXBywz5nj+1M/Ux52wSBF1P1g==
X-Received: by 2002:a63:495e:0:b0:470:75a1:c6d7 with SMTP id y30-20020a63495e000000b0047075a1c6d7mr47336241pgk.120.1669997286584;
        Fri, 02 Dec 2022 08:08:06 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id w23-20020a1709026f1700b00189667acf19sm5714233plk.95.2022.12.02.08.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 08:08:06 -0800 (PST)
Date: Fri, 2 Dec 2022 16:08:02 +0000
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
Subject: Re: [PATCH v2 41/50] KVM: Rename and move CPUHP_AP_KVM_STARTING to
 ONLINE section
Message-ID: <Y4oi4oRk7jsCqYJO@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-42-seanjc@google.com>
 <c74c88ba6a17da2d36e2d340ce22af127bda8383.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c74c88ba6a17da2d36e2d340ce22af127bda8383.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_080812_526902_02DB551A 
X-CRM114-Status: GOOD (  11.93  )
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

On Fri, Dec 02, 2022, Huang, Kai wrote:
> On Wed, 2022-11-30 at 23:09 +0000, Sean Christopherson wrote:
> > From: Chao Gao <chao.gao@intel.com>
> > 
> ...
> 
> > 
> > Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Chao Gao <chao.gao@intel.com>
> > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Perhaps I am wrong, but I have memory that if someone has SoB but isn't the
> original author should also have a Co-developed-by?

This is the case where a patched is passed along as-is, e.g. same as when
maintainers apply a patch.  Isaku posted Chao's patch, and then I came along and
grabbed the patch that Isaku posted.  I could go back and grab Chao's patch
directly, but Yuan's review was provided for the version Isaku posted, so I
grabbed that version.

> > Reviewed-by: Yuan Yao <yuan.yao@intel.com>
> > [sean: drop WARN that IRQs are disabled]
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
