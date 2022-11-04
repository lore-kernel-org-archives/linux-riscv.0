Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BBAC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 20:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5XqzXaCPEeYEe8ylSc5PcWAMx4Tlu1/X8CCu/71yWs=; b=f2uBuDbTlObxtR
	BGHYak2V7LgjypsrgnmgEZx/HLnXgy907jF5lF5SYlsEKtMljGi3dQvqHY3vtj/lxGxMOobpxEKT0
	mt623GujCxqJaOX9mwpiCyL1HvfKpsGg5yqL2WoAqviTJiXv9kE40Kvqivk1iLa5pxfPxRd+ONTA1
	APRxdyS6Iu96kVmlF1DkAL1n2dFoqEceg2ZT+7JVMLqBTgxhR//PFyX1U624PXuXio2SCCJauK30a
	e7Uw++D4WkZM7gdgfjO2FapX1LqLZYx2hLPsQOmvNhiaRIUGtNy27EQS9vbCmL+71Js51i9NNAvk7
	/1z+NdkszrYCsnuOsaPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or3Hy-00526r-5S; Fri, 04 Nov 2022 20:27:42 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or3Ho-005224-0K
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 20:27:33 +0000
Received: by mail-pf1-x42f.google.com with SMTP id b29so5432365pfp.13
        for <linux-riscv@lists.infradead.org>; Fri, 04 Nov 2022 13:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzyhTv3BAtgpGpRr8HnNLx/d2zCvSqkboAFtik4Imo0=;
        b=q/PTXKQj3ArVm2XzZe97QeFygVMm1eXh+9AVtXcJ75aOhS7rpOmmmorCukrcxmTsXJ
         xtHpP7JyICLKwJpO4UdyBCOfADg9j8qWzQtBsGyOUBj4dtUE2hEcaa0M2lJNL2RYHNdm
         t9CE40syL4mSgI+9axRmHRY3m49U53Bcc5xsUL4w5HmCnvq3rZFCi8RspoeZ0S4Nhg0P
         dklWYN0e+iqclhNFPVLNqLlrIm4bRgIuUSiy6nVFx0aKBZbtXqUzzmm+oTu43A9TiINS
         r9mhyi03/1kAIfHUOzdEnLew/bMGSFKH13ZsSBoEdZkxO+PvUKRhjXGV6DaJ6ZELthJK
         tWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzyhTv3BAtgpGpRr8HnNLx/d2zCvSqkboAFtik4Imo0=;
        b=vtpAnwXSifRbWLKwQo25tc0AYvTbjZ53uypRAX1n5DOtmhuEz5FS1AzU7JAhNR5nsg
         VJR1v2U4RTXEBs1i27jQECpmaNk1g21tsQevAWdA3idZ0i4ZPrlywYVkbhGkEcrg14Oy
         IwNw+KwBR1YY+HgxYIar6VdfHI4/C/rQETgyIlTw5MHvgTfN3qbdIJYt4pD0NpUoVevF
         VgEKGwvEPUJBKwASzQNFOS9/XaXaPf4M9srISFb8WYWqsf8HrfJZzmQ7M0CbBDmlp0br
         N2GTOfNBq80JBYErtohQl6LmvvuBtEGvaMmehRkYGzABnTlIQv8qLcLnFz7JGTDuQI93
         /i1w==
X-Gm-Message-State: ACrzQf3e1jN+dyqnZyCZyAkSZ6FT36VtjoifZdJQasC1edWzNiATUz+s
	7i00Zor7JrLHOYvqZFpuu41xDg==
X-Google-Smtp-Source: AMsMyM6nILnCIcSIsk5JMrE+WRVnxFnaYDn7QGx3yWf1KAa3dZc7TNSn3aZcg19Xay3NbhiF32a9mw==
X-Received: by 2002:a05:6a00:1781:b0:561:7f7f:dc38 with SMTP id s1-20020a056a00178100b005617f7fdc38mr38037687pfg.42.1667593638927;
        Fri, 04 Nov 2022 13:27:18 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id u8-20020a1709026e0800b0018863e1bd3csm159522plk.134.2022.11.04.13.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 13:27:18 -0700 (PDT)
Date: Fri, 4 Nov 2022 20:27:14 +0000
From: Sean Christopherson <seanjc@google.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Yuan Yao <yuan.yao@intel.com>
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
Message-ID: <Y2V1oslbw24/2Opd@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <20221104071749.GC1063309@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221104071749.GC1063309@ls.amr.corp.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_132732_058237_80451D6F 
X-CRM114-Status: GOOD (  11.33  )
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

On Fri, Nov 04, 2022, Isaku Yamahata wrote:
> Thanks for the patch series. I the rebased TDX KVM patch series and it worked.
> Since cpu offline needs to be rejected in some cases(To keep at least one cpu
> on a package), arch hook for cpu offline is needed.

I hate to bring this up because I doubt there's a real use case for SUSPEND with
TDX, but the CPU offline path isn't just for true offlining of CPUs.  When the
system enters SUSPEND, only the initiating CPU goes through kvm_suspend()+kvm_resume(),
all responding CPUs go through CPU offline+online.  I.e. disallowing all CPUs from
going "offline" will prevent suspending the system.

I don't see anything in the TDX series or the specs that suggests suspend+resume
is disallowed when TDX is enabled, so blocking that seems just as wrong as
preventing software from soft-offlining CPUs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
