Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE3EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 23:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mOs4YBpeKtGtoUaYJPrr4LbgkWxIoR6gEz7M0bGpobE=; b=rKcb+QmmKyKPhF
	0uCeDau/JoUb4+c1FMGouNfIxMjCfauA6DZ2jswqSg7GGBKfmRa13w74tZ+ulxuCHWks6iH+oDzpw
	gME+W7ui1m5Y2QzxOcguY0un7aC391tQW/82GO0UkcB2/su905hMuSHEQ80euYCmXeG3Tse+0s7b6
	l2VgK4gOjbnWeXPAxWhf8zB0K5/KJLS56SXP6b+IXj4y1v/uL0eNJXfHUb8hbBZ9Lw3uddjqCKunT
	prATx4xp01fIkGkku13kjUqUuZAZDtLUpoktye0x1GCdnSX9SnnliWoBfPfNwRQhg32hsWFO52nc/
	OkU4Dc34X2wq6QSKM+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0swF-00Bf1j-OW; Thu, 01 Dec 2022 23:25:55 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sMj-00BR3T-43
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 22:49:14 +0000
Received: by mail-pj1-x102a.google.com with SMTP id q15so2196433pja.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 14:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mKF7ACqUicTgwRFQrz4oBsMFvmn+mRrenbI3VwK9VtA=;
        b=Lo1VVBU0quIBqwSjUL/IX6jsQ3Rcbq3kNXFx1b09LmjnR9bQqqs8Qnjl452IWYkBSY
         P1KTyvwrHEdLgoshrms0r4SI8z1ngo83OqCHRxrURyBE+yArcM+Cs5TCeq44GobVkF0m
         IuDj+iWRP2zVVwjI1HJslgwJO64iafu01Owc+4A3/mvkEjyzFr8iFAR19fNs0LBLJTf3
         Kg1ZIMc5fZ0ipGhmHdhLOXnD8uVTRyQX02DQttBjsyjAKjRvEJFav2gCuZ5FSQ6cpVhK
         zD3GLCkmoDFgDHZV7t7XBqH0jElTPRdTcydGeJqtHoccQFH5HqfiAwKx6tg04wXmDFCc
         QADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mKF7ACqUicTgwRFQrz4oBsMFvmn+mRrenbI3VwK9VtA=;
        b=trQMybY7SabNoR2DzhBzK3qqfURNw70A+2cZChoyjubJ7zMp2xiJX3JHCyQ+J+ZKTG
         efAh+GXzSB5pUYIhAcm3Di2fWZ/vYgXhovyjHe9XMrRTu++AjuOyD6jiJPBtfqOB2UiG
         3J4ZCNIRc+HBbkT9yiOPvqN4I5y5VCrS6qG2zKpFCAf6T4DZJ5+S5bppNX4xqKtWHbiu
         NvmfPd7y+dsFWIwGoXzYIijXu5QcDDdHq8b0hOceMMFm/F4xC9AazATwh3Xvrgz1TfVD
         omdJNzr2taSnjxboFYi5KyUioTwF/xk2b6a7fxv2ES+VchnOZX75wdYsNqDl0di2vdrX
         RTrA==
X-Gm-Message-State: ANoB5pms4mhEuDsHX19lahmfgug0XcKyvjo9/ORxmGEKBNkYk0dfVNWh
	0x3ATLEA3IOi1OrPyRBUcA79DA==
X-Google-Smtp-Source: AA0mqf4Wt8uYV/bEa16p+0WrrISPwxZH3fHAX4g+Oh8a2UKzOEMh4LEyPBB3ZTgiAtA3/myS/mdVQA==
X-Received: by 2002:a17:903:32ce:b0:189:a0eb:4a26 with SMTP id i14-20020a17090332ce00b00189a0eb4a26mr13829305plr.162.1669934951343;
        Thu, 01 Dec 2022 14:49:11 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id c73-20020a624e4c000000b0056bc742d21esm3854175pfb.176.2022.12.01.14.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 14:49:10 -0800 (PST)
Date: Thu, 1 Dec 2022 22:49:06 +0000
From: Sean Christopherson <seanjc@google.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
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
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
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
	linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 21/50] KVM: MIPS: Hardcode callbacks to hardware
 virtualization extensions
Message-ID: <Y4kvYlCbhj87rceF@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
 <20221130230934.1014142-22-seanjc@google.com>
 <beb697c2-dfad-780e-4638-76b229f28731@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <beb697c2-dfad-780e-4638-76b229f28731@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_144913_190798_646974DD 
X-CRM114-Status: GOOD (  20.23  )
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

On Thu, Dec 01, 2022, Philippe Mathieu-Daud=E9 wrote:
> On 1/12/22 00:09, Sean Christopherson wrote:
> > Now that KVM no longer supports trap-and-emulate (see commit 45c7e8af4a=
5e
> > "MIPS: Remove KVM_TE support"), hardcode the MIPS callbacks to the
> > virtualization callbacks.
> > =

> > Harcoding the callbacks eliminates the technically-unnecessary check on
> > non-NULL kvm_mips_callbacks in kvm_arch_init().  MIPS has never support=
ed
> > multiple in-tree modules, i.e. barring an out-of-tree module, where
> > copying and renaming kvm.ko counts as "out-of-tree", KVM could never
> > encounter a non-NULL set of callbacks during module init.
> > =

> > The callback check is also subtly broken, as it is not thread safe,
> > i.e. if there were multiple modules, loading both concurrently would
> > create a race between checking and setting kvm_mips_callbacks.
> > =

> > Given that out-of-tree shenanigans are not the kernel's responsibility,
> > hardcode the callbacks to simplify the code.
> > =

> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/mips/include/asm/kvm_host.h |  2 +-
> >   arch/mips/kvm/Makefile           |  2 +-
> >   arch/mips/kvm/callback.c         | 14 --------------
> >   arch/mips/kvm/mips.c             |  9 ++-------
> >   arch/mips/kvm/vz.c               |  7 ++++---
> >   5 files changed, 8 insertions(+), 26 deletions(-)
> >   delete mode 100644 arch/mips/kvm/callback.c
> > =

> > diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/k=
vm_host.h
> > index 28f0ba97db71..2803c9c21ef9 100644
> > --- a/arch/mips/include/asm/kvm_host.h
> > +++ b/arch/mips/include/asm/kvm_host.h
> > @@ -758,7 +758,7 @@ struct kvm_mips_callbacks {
> >   	void (*vcpu_reenter)(struct kvm_vcpu *vcpu);
> >   };
> >   extern struct kvm_mips_callbacks *kvm_mips_callbacks;
> =

> IIUC we could even constify this pointer.

Good point.  Protecting the pointer itself is a bit gross, but it is a nice
stopgap until the callbacks are gone.  I'll fold this in.  Thanks!

  extern const struct kvm_mips_callbacks * const kvm_mips_callbacks;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
