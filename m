Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29E1C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 13:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vKtlqoOgdaCKWIIafm3ZvLIjg/Tts/FG2pW9/KuHot4=; b=fnXkzuVzc1NGzx
	5bNq0ZMsiiVP1dE8UsbUKRWXZv8eXHx0y6/aWQuRj7+VE5WqWtvXqwYqGD24zhjPWWW5byT/857Ja
	15oILq2p/2RFWzvh10i3htJrtaPau20haSw9L/SQmgOZ4o8A76JNdOBBi4YHNmxb/BQX8FCctWQn7
	duH4PRGTckQ05r/csj5x60nwdOKQzyBQuEh0EsdrLwsbG6fyGzC9ZNg3THMAmGgSX+q1/9iUR8VVX
	5Gy0fh++GkmLF9tAz9CdfQrStKbmsu4yPnaOFh4yPjY+/kh3PRd78rr1DOE3RtmRPqA0J08GjwKme
	l5/LgeqWDqVOjM+x7blg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFFhZ-00FMKx-46; Wed, 02 Feb 2022 13:29:37 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFFhU-00FMI1-K2
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 13:29:35 +0000
Received: by mail-lj1-x22f.google.com with SMTP id z20so28889777ljo.6
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 05:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ut1heMlmneP+6IiHVYaCsRV+iQnMtY/plsON5gFnw/s=;
 b=pSxMvG+egIt4WW80jF9dDVL3Z8lG/xgxzcN3gE1P+6SGJWoI6nsWsoHQEl+4+ug4UX
 gOar1xx+mu87pvf4RiobK4x+KVC1BJ0rMGMqGoKBLxkSpfVs45nt0jEUavC6xXXffZGS
 3a77UePfRjq+OPgpZjJkUwohMc5aUQDULSqqZwagYfF0RicMliSE9QWN0Hrn0IuXxiAt
 c9ViyFifNmmf1QaV6qNZXiz2p1HT/DmQ2aV8i4BCX+OIXIhGarMZzkeX/thOFYt3BPi1
 X8hme+1Sv7Cr9o2AxrucOVRe6/pynI7ogzarWIANwAiNk6dOQAL3W7orgc2jNEDuDVzJ
 upnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ut1heMlmneP+6IiHVYaCsRV+iQnMtY/plsON5gFnw/s=;
 b=D272yvwZcqqMeJ48RxYIBf0V+yNySqVKVEe4B8dCA2M9a5o0cioSHqmGFV7n+22aL8
 PUh3I4fWDE93P/nUL5HmcBop0pflxP61VPt39aWVNs9On4K0hEP4v8+JSk/X1nohAfsl
 olUsA2Ab3f9OPC63AdsW7jLtpXk3aLrMiq5zsXV1YW1nGTAX9xD3uKkxv+L8Z/PNgx/d
 knfsSN7yi/9l3qHpDafR5wHVIs+MTZziJmijuAURNq/6cJJT10B+Y60v9PMHArwcr7nR
 I5gwCXn3xtx1EYd7klSTXNQYRM9U8GTuaduFZx/lcZIRM/jcSpaFwCHjI7J/L3arrBuo
 VdTA==
X-Gm-Message-State: AOAM533cP5+TUJgNW8J9AjDomlLVZi55an98rFl79uP6tUaunn4AwAd1
 eqscrRm+ugSkVDN8BSOS8barUbxyTJeGmjomEELa7g==
X-Google-Smtp-Source: ABdhPJx5vsaf3f2A8imbwwx+BlfgfCJf+ICQ65e5a/dtBqayDqwZfU1QHrHiSP/evaTJiDLlffNcX5TPkt9HUMaKhUw=
X-Received: by 2002:a05:651c:a0b:: with SMTP id
 k11mr15027229ljq.266.1643808570290; 
 Wed, 02 Feb 2022 05:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20220131110307.1684739-1-mchitale@ventanamicro.com>
 <CAAhSdy2wX7Re4yepV7ReNQazF9jb-eqSUDE7rLCarr3iUchzkQ@mail.gmail.com>
 <B04F937F-6FC8-42F5-9D6B-7EF1148F9646@jrtc27.com>
In-Reply-To: <B04F937F-6FC8-42F5-9D6B-7EF1148F9646@jrtc27.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 2 Feb 2022 18:59:18 +0530
Message-ID: <CAK9=C2WPmH4snAH1Ft4jNoaNuLRQ9dEuYm_K4ePVHdS9wkBYPA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: make CY, TM, and IR counters accessible in
 VU mode
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Anup Patel <anup@brainfault.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, 
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_052932_696370_A346E0CC 
X-CRM114-Status: GOOD (  21.20  )
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

On Wed, Feb 2, 2022 at 6:49 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 2 Feb 2022, at 11:14, Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Jan 31, 2022 at 4:33 PM Mayuresh Chitale
> > <mchitale@ventanamicro.com> wrote:
> >>
> >> Those applications that run in VU mode and access the time CSR cause
> >> a virtual instruction trap as Guest kernel currently does not
> >> initialize the scounteren CSR.
> >>
> >> To fix this, we should make CY, TM, and IR counters accessibile
> >> by default in VU mode (similar to OpenSBI).
> >>
> >> Fixes: a33c72faf2d73 ("RISC-V: KVM: Implement VCPU create, init and
> >> destroy functions")
> >> Cc:stable@vger.kernel.org
> >> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> >
> > Thanks, I have queued this for fixes.
>
> The formatting is clearly wrong...

I have updated this in my fixes queue.

>
> > Regards,
> > Anup
> >
> >> ---
> >> arch/riscv/kvm/vcpu.c | 4 ++++
> >> 1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> >> index 0c5239e05721..caaf824347b9 100644
> >> --- a/arch/riscv/kvm/vcpu.c
> >> +++ b/arch/riscv/kvm/vcpu.c
> >> @@ -90,6 +90,7 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
> >> int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> >> {
> >>        struct kvm_cpu_context *cntx;
> >> +       struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
> >>
> >>        /* Mark this VCPU never ran */
> >>        vcpu->arch.ran_atleast_once = false;
> >> @@ -106,6 +107,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
> >>        cntx->hstatus |= HSTATUS_SPVP;
> >>        cntx->hstatus |= HSTATUS_SPV;
> >>
> >> +       /* By default, make CY, TM, and IR counters accessible in VU mode */
> >> +       reset_csr->scounteren=0x7;
>
> ... here

Same as above, I have updated this my queue as well.

Thanks,
Anup

>
> Jess
>
> >> +
> >>        /* Setup VCPU timer */
> >>        kvm_riscv_vcpu_timer_init(vcpu);
> >>
> >> --
> >> 2.25.1
> >>
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
