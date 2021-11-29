Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675F8C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 03:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHD49L2hdHFk+im5NjtTD9u+rod2bUXtCG/SjNqJWsE=; b=fvyOW5GNzWNr2M
	X7Id3vNg507PqHLsJMeZHsJsRJZgoTvpMigVePgQzsq+uQWxcQU4tYxfBT4x/7sKdzJ96tJOur05T
	1qNdFiDQ5imVsrirRoXv4Nwwur1pF0lQ4VQi+b2B66xED2bzGejIsiKjPlZ1vxIguKKcLQp2Faa4S
	Gzoy0RfJlS/P2vujtJwEosavnj6iApBdbBtPAKRW6vNBNAhjwxSApaEWEkPEWB1HqXjfxN82bOUwO
	c/ZbqKQNRZ6upzlLoa5w/KqOkzPzuHLazUgkqLbfM3hKH6ln8gmigWI9AHPfaX4VzDbd6fs2bRHX7
	MOme7hawZP3zpQ8Tomtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrXWX-00HC0r-NO; Mon, 29 Nov 2021 03:40:13 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrXWU-00HC09-UI
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 03:40:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id v11so33564990wrw.10
 for <linux-riscv@lists.infradead.org>; Sun, 28 Nov 2021 19:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MWox7pMHyR0qcRdGS+0RZRCWvfw/dHAAH8xPTK+l3bg=;
 b=Xk+d+xhG4+Z7lzMNFQPU/ZRqqE2Q8Vku4rPID+rdJv5DwOS8XvIvjgfz0tJKLwGm+z
 b/URVPG9yvCfoXpJxi7nBFCEITlxA3qpPxsVoilHt0IeSzbPeVBXP60Caex28GxHOb8k
 gMT0lDAKzhCl+UL6QB8Fl4vqiR9vFAjNgvTPRM30cFs30fnxtn9EYkG3ony7zFw0w/qW
 bFHGact0uqCGI999gHsRBLtleAlwr/xPaaa525Gizp72gEpPEfLPVbOlcb1AqpJP5etE
 05toy7BXQGGXMuuD/8o9onenREXFlOVqEm9oxqLNcgKouOIMYTOY84mhRH8VgUe4NHVB
 YaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MWox7pMHyR0qcRdGS+0RZRCWvfw/dHAAH8xPTK+l3bg=;
 b=kvEH118J/uw5EFLicp4zJSgD29Mmin2FkOw8N/93XDEMtm1KZkb5OLXFwKQWDjk6Rg
 PQ1PcrWkhx/Jdcu5cBYnc7XNjuMgD8Hg1JcGaPOQu3zflmi76sV2kM1D0O0L4Ft6VSvK
 1wM749k9oMjRxtfvIYik0Wr3A/Vb6+vHJFZ07atExbclU4UgtybmdzffRSYF0qxE9+BX
 +UXzSAmQphOVILzs9MiY0GkFvH6oHbfjEgQsUU5SQFzGs/KPdOJDEUw57bDoEPpYs1lC
 1y6q16nsHLX46OsrFmODouodcRKrqZ2y9q4ULR5EmACsJGPvniZ8qqXmCFPwTPxp7Avy
 8baQ==
X-Gm-Message-State: AOAM533+viyYmNjlhnRcSjOngN3kZJLbd6xQ6PMNZPGWFBhYGECTw4FI
 dfyMNzA0HWdkp+dwImbPEjsQ/H2q3pGgH/vwRek+ZQ==
X-Google-Smtp-Source: ABdhPJwxTF4itSodvdNADBx2t3eVLv2fdXR7JyED2RU5O76/w+2bvnAc9HWZucJxJtZvwzvqgEAh8s66khCIOZboUzQ=
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr29221931wru.89.1638157208592; 
 Sun, 28 Nov 2021 19:40:08 -0800 (PST)
MIME-Version: 1.0
References: <20211126154020.342924-1-anup.patel@wdc.com>
 <20211126154020.342924-2-anup.patel@wdc.com>
 <558e7e30-2d87-a19c-c85c-a2993a354074@redhat.com>
In-Reply-To: <558e7e30-2d87-a19c-c85c-a2993a354074@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Nov 2021 09:09:57 +0530
Message-ID: <CAAhSdy2mAHyA04nTOh_XM==moKv1UARpmqt2QhkQwFZo98kwtA@mail.gmail.com>
Subject: Re: [PATCH 1/4] RISC-V: KVM: Forward SBI experimental and vendor
 extensions
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <anup.patel@wdc.com>, Shuah Khan <shuah@kernel.org>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alistair Francis <Alistair.Francis@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_194010_986073_EF538B95 
X-CRM114-Status: GOOD (  10.09  )
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

On Fri, Nov 26, 2021 at 9:42 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/26/21 16:40, Anup Patel wrote:
> > +static int kvm_sbi_ext_expevend_handler(struct kvm_vcpu *vcpu,
> > +                                     struct kvm_run *run,
> > +                                     unsigned long *out_val,
> > +                                     struct kvm_cpu_trap *utrap,
> > +                                     bool *exit)
>
> Doesn't really matter what this is used for, it's a handler that
> forwards.  So you can name it kvm_sbi_ext_forward_handler.

Sure, I will rename this to kvm_sbi_ext_forward_handler()

Regards,
Anup

>
> Paolo
>
> > +{
> > +     /*
> > +      * Both SBI experimental and vendor extensions are
> > +      * unconditionally forwarded to userspace.
> > +      */
> > +     kvm_riscv_vcpu_sbi_forward(vcpu, run);
> > +     *exit = true;
> > +     return 0;
> > +}
> > +
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
