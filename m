Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52712C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 10:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNcV1q6tDMW4iYxP/ZQi/752f9og+UNbY0LG9RoluFU=; b=vKGD5m/nfR6jDC
	0wzLgI8pf5/yOCXtTpu+FcjUMyWaJNrbZECuJgvZPPNyg2PCD2e50Mu722z9RPYCJmiaiC+EZzmTQ
	zcZWboqLy1+lkbiT30fXyOFfIC4PmuFk9g7RAVR4FCBwE9bj2Jnc0wftxDnRfHwCLN0NJ2eeJUYSI
	Nh2IKT93LpwDPMEDmeK2uPF1Dzizlv9Yfvntjm3pUzSYQ1KYIE2enbMXg7ZMOA8EPHZ3Aqq0vLFJX
	NvAeId/CMfR9F8G5KBuaG/HYrfqxYfgqeYiJpWZsU8co79SG1U07WW80gOexZ08h/olB1Iq2u5tli
	vBrdjiTVOlYwqYKN3oUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQxk-0030no-S5; Mon, 30 Jan 2023 10:00:32 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQwK-0030Fh-1n
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 09:59:05 +0000
Received: by mail-yb1-xb34.google.com with SMTP id c124so13265083ybb.13
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 01:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YoKzreuTWkm8iCBf1EBE+XySj8qF1az5gLokgdEcFfY=;
        b=Fx9Gq6iPm/GasNiJUxyjKXHHGwlmlzDeFvJhX2SwPrda2srpnsWGOdwVInIW5jT+t/
         AN+t+XjWUWtQDTtf7eD3F96Zs3aXPXOpDIPjNHyKdT7l/6lCsQYcr+9iPWa9Su+6cnIn
         Pqe9EeKXS0wZrI6q7dLZA+fzEsHCJ76SHj8tbXH2q+b9d0tdw0FUXGsW4lbveM/x5GEU
         ThZTzavk865+3MoDFB8xSfVPnWUEzNoTIV2YSlrt590fOIAJd57etH2+lLcsQANLXI9z
         rxoJAGbVI1tuAFTf59bdEyTCBUt5ww1EJusPwFyflZ4HYH79lu7Ek250CmHOSqqw/TKq
         ksTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoKzreuTWkm8iCBf1EBE+XySj8qF1az5gLokgdEcFfY=;
        b=Fr6rTTYPmRbxw0b4N7BtrsbqnBWk5vWHbmZPwWiqIQj5UfjV+9hR39ycGXKnViigqz
         gFwTRh/UTlUI6YZh8vPebKjilNM1n6jqGxTmSBbsSCcMjIdJ3ez2eRVBpgzFnfZ5/9Pl
         2zxGqHO/ta1bFIPYyhNmvuxCI3r/29KBS0Tefo3UgXXxZjrNHWlXPuSXSHlGYnYG0/6d
         77seqIx/IpZzkDZyUn56lOrQW5qwKQ16Dc/UDklG7wPCxRJsSivkiOmb2fEDU7yaCeYd
         YSM3z9LXRRvEq0NRoSXThnK+oANYFsDgwgciy/wo4xMYklwuSBMijcQNUhHABgtGn5YM
         k9Og==
X-Gm-Message-State: AO0yUKXuUhlDyJ9sKHXFcoZsgCr6MRDOmL77Fu1bfeBzB9HNd01tqbYe
	vpqiYkPLE4apFV5p73j9XQJMowFXaSHLWORWmSQBJg==
X-Google-Smtp-Source: AK7set/vUcpKgiWJsVos8LAymmHBq1qACtgf3TpIkwJoAZSZ2hqheLAyitSF96PJUdF324nVPYFeIEvaMKbTenn+Y3M=
X-Received: by 2002:a25:8388:0:b0:80b:79e1:bdad with SMTP id
 t8-20020a258388000000b0080b79e1bdadmr2845506ybk.196.1675072740706; Mon, 30
 Jan 2023 01:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-17-andy.chiu@sifive.com>
 <Y9Q3i2z8uh1Bttzw@spud>
In-Reply-To: <Y9Q3i2z8uh1Bttzw@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 30 Jan 2023 17:58:49 +0800
Message-ID: <CABgGipUR1+MRkt5WH8=cEr+9XB3x5TRsMOefu8adFfNkjWZ_nA@mail.gmail.com>
Subject: Re: [PATCH -next v13 16/19] riscv: Add V extension to KVM ISA
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_015904_140256_0BD8DA62 
X-CRM114-Status: GOOD (  17.82  )
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

On Sat, Jan 28, 2023 at 4:44 AM Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Jan 25, 2023 at 02:20:53PM +0000, Andy Chiu wrote:
> > riscv: Add V extension to KVM ISA
>
> I figure this should probably be "riscv: kvm:" or some variant with
> more capital letters.
Ok. adding it
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > index 92af6f3f057c..e7c9183ad4af 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -100,6 +100,7 @@ enum KVM_RISCV_ISA_EXT_ID {
> >       KVM_RISCV_ISA_EXT_H,
> >       KVM_RISCV_ISA_EXT_I,
> >       KVM_RISCV_ISA_EXT_M,
> > +     KVM_RISCV_ISA_EXT_V,
> >       KVM_RISCV_ISA_EXT_SVPBMT,
> >       KVM_RISCV_ISA_EXT_SSTC,
> >       KVM_RISCV_ISA_EXT_SVINVAL,
>
> Ehh, this UAPI so, AFAIU, you cannot add this in the middle of the enum
> and new entries must go at the bottom. Quoting Drew: "we can't touch enum
> KVM_RISCV_ISA_EXT_ID as that's UAPI. All new extensions must be added at
> the bottom. We originally also had to keep kvm_isa_ext_arr[] in that
> order, but commit 1b5cbb8733f9 ("RISC-V: KVM: Make ISA ext mappings
> explicit") allows us to list its elements in any order."
>
Thanks to mentioning this potential ABI break, I have moved it to the
end at v14 revision.
@@ -105,6 +105,7 @@ enum KVM_RISCV_ISA_EXT_ID {
        KVM_RISCV_ISA_EXT_SVINVAL,
        KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
        KVM_RISCV_ISA_EXT_ZICBOM,
+       KVM_RISCV_ISA_EXT_V,
        KVM_RISCV_ISA_EXT_MAX,
 };
>
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index 7c08567097f0..b060d26ab783 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -57,6 +57,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
> >       [KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
> >       [KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
> >       [KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
> > +     [KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
> >
> >       KVM_ISA_EXT_ARR(SSTC),
> >       KVM_ISA_EXT_ARR(SVINVAL),
>
> This one here is fine however.
Great!
>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
