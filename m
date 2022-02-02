Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A140C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61hy5+go4oL2aFRQdI7ZjE/Y0vSNdGWHZ12T5lLfFz0=; b=RsuaFXQarGWHJe
	zSdpRMR8MCFM1jd9GcFMjU76MZ6fYYAO3y0u3YvLHyYAqot6b38bLUnyUFVghw5wpQCLOMvGSvCp4
	5GkzlhUGkBErftWixfUHgsYUSoXdRoU2NHdEv9htbP4fxcduOEV1DcU6Uq00SLushTRGG9BApgol1
	cVlaUnwkprfsk4OVjmdorvhtupTs2Vd+7lMYDDOvz142Ii+6Jsi5ZQgCu3HZd+G2+C68TiBHBm+2Y
	GkobKCWnpXzuqU/8wrS8L5jFStaGOpMn2h+gvll9IhwkWVhVFrpxijikTnNEanKdvCdMSI1hiN+kV
	SirhkWSMDayJCUZL9whQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFFY6-00FKnw-4A; Wed, 02 Feb 2022 13:19:50 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFFXr-00FKhS-6K
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 13:19:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id w11so38282617wra.4
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 05:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=UYI//ra1wTgLyHqKdRvMjbFjIxVxiJ90kyMxoCqfe7o=;
 b=BdnTyOGFvWo7ZOsPwl6fux65m4DLYweJEERzekMEE8H27wwdS3+nQ/U2j33dBYMudw
 Eq0TXwdago9sG6j3KDWOLpvLf3b+IoUHY8DL/rwfZEN5abJJTKke3i2EeSxkj/Ah1i/K
 j3J6uUnSK95UqDWXhoHzCS2LbBvYevBbttD5uFfKCiQplkh/aunp0/MbA0xKhdasCknv
 uuWvt89ICmhS2Urtrfl6SYFsHIJ9WxX2eyyy4qkEShPKDPo5IDvaN1UaQIWuwiJFZSjA
 A0muRiAE1N2UClRfFkVFgLfzEKz36nyYyXsHY3s0LIvJzL/7Y1wOVa0n1bW6jSX/+iJm
 aukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=UYI//ra1wTgLyHqKdRvMjbFjIxVxiJ90kyMxoCqfe7o=;
 b=fbmtBDz8MlDnTcr90M6qGvSlCu04WxAwwJ6IAEZc2Z3vc0EWLn074yXk6VzPl+oT05
 jIi9QFOfJLPBpc/vWKIw0F4CCf9CHf70f4clprsjyevLZR0OWh9oqgHxwRdF1hrYix28
 X2RfxbnrAbgklHPAOFSyPaRa9zNWfVVOA5yybnNl2+yoBOeTJWwBfWOY7SRRsvZeBvWn
 nOoXBMviuqmti3uBVf2lm6E8DIezQhW+5VH5hUQOJEAT09s3IvQ9yyAVFd150nzMKmzt
 PPxMGnEY/8zHbQoy6PtZTYOpswjTjrolZiAmD8u1Q4fPZXWiH4gAAC5jdPMl79pXzySq
 nmvw==
X-Gm-Message-State: AOAM531319WLvVOpGl64wF9eIMcKXVpw5a0q7JYrGEWDAuuRBVj/l4Fx
 zOIiuGxXRwbC5yrMogJiKzguWg==
X-Google-Smtp-Source: ABdhPJzICvYrz69A0ityikLYb25DkNUNN2ptebetqW4p1gmz63PHRuJ5vDe+5x5Y5OTc6DJ6I4foww==
X-Received: by 2002:a5d:614d:: with SMTP id y13mr1433428wrt.553.1643807972109; 
 Wed, 02 Feb 2022 05:19:32 -0800 (PST)
Received: from smtpclient.apple (global-5-143.nat-2.net.cam.ac.uk.
 [131.111.5.143])
 by smtp.gmail.com with ESMTPSA id t18sm17797789wri.34.2022.02.02.05.19.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Feb 2022 05:19:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] RISC-V: KVM: make CY, TM, and IR counters accessible in
 VU mode
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAAhSdy2wX7Re4yepV7ReNQazF9jb-eqSUDE7rLCarr3iUchzkQ@mail.gmail.com>
Date: Wed, 2 Feb 2022 13:19:31 +0000
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Message-Id: <B04F937F-6FC8-42F5-9D6B-7EF1148F9646@jrtc27.com>
References: <20220131110307.1684739-1-mchitale@ventanamicro.com>
 <CAAhSdy2wX7Re4yepV7ReNQazF9jb-eqSUDE7rLCarr3iUchzkQ@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_051935_340360_518AAAD8 
X-CRM114-Status: GOOD (  15.09  )
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

On 2 Feb 2022, at 11:14, Anup Patel <anup@brainfault.org> wrote:
> 
> On Mon, Jan 31, 2022 at 4:33 PM Mayuresh Chitale
> <mchitale@ventanamicro.com> wrote:
>> 
>> Those applications that run in VU mode and access the time CSR cause
>> a virtual instruction trap as Guest kernel currently does not
>> initialize the scounteren CSR.
>> 
>> To fix this, we should make CY, TM, and IR counters accessibile
>> by default in VU mode (similar to OpenSBI).
>> 
>> Fixes: a33c72faf2d73 ("RISC-V: KVM: Implement VCPU create, init and
>> destroy functions")
>> Cc:stable@vger.kernel.org
>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> 
> Thanks, I have queued this for fixes.

The formatting is clearly wrong...

> Regards,
> Anup
> 
>> ---
>> arch/riscv/kvm/vcpu.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>> 
>> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
>> index 0c5239e05721..caaf824347b9 100644
>> --- a/arch/riscv/kvm/vcpu.c
>> +++ b/arch/riscv/kvm/vcpu.c
>> @@ -90,6 +90,7 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
>> int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>> {
>>        struct kvm_cpu_context *cntx;
>> +       struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
>> 
>>        /* Mark this VCPU never ran */
>>        vcpu->arch.ran_atleast_once = false;
>> @@ -106,6 +107,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>>        cntx->hstatus |= HSTATUS_SPVP;
>>        cntx->hstatus |= HSTATUS_SPV;
>> 
>> +       /* By default, make CY, TM, and IR counters accessible in VU mode */
>> +       reset_csr->scounteren=0x7;

... here

Jess

>> +
>>        /* Setup VCPU timer */
>>        kvm_riscv_vcpu_timer_init(vcpu);
>> 
>> --
>> 2.25.1
>> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
