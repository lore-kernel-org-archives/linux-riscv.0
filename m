Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B56CC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 03:23:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B954464F77
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 03:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B954464F77
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ANzhiFHk2WDfJl1525otr5S7Db0wx5mIoepvmcfysik=; b=JWoL7MezcNMmGXcPkr/VzSdLl
	ZvnQ4qRvIFkkeSw1Q9AOCgq1WoWg4ZPhvpTa8wTVOveA4JxchBT/cdtIpCvPVEowp10MUYLEkVkAU
	Lp13oGPB2hS5GexZ58WdSKhzNloXfCyJJx6K24zWjiaSAqa99cTq0f3/yxYcJQ9hIJatMRIib5jzh
	xxB3FLzfiyDkkZnAUgKAdk69/Lg8bp3lsUvx59M0GO0Vmki+pOKgpCU7UwtnWDXD4F4piBxBqtzm/
	7WGU+pVsJIt/uMCciCcbTS55Y+NkxB5sTwKaP6QG3AMnIpHujLHRwEDa7nWZvf73nifE09uQ3kuhk
	gQ1fRJA8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJpRo-005ubZ-3O; Wed, 10 Mar 2021 03:23:44 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJpRh-005uaK-78
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 03:23:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id e2so2514489pld.9
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 19:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=DWyTUhvwk7T3icFRK4BtJnm+zs8Gs2hcwj9A3iJOz3A=;
 b=0GxaKgJsaTDDVtT034u0SRTqHS4k1CmbhQlB6ba3wW99r8ttLytrR9yDeILChO7yPo
 C6lCvpOrfsJiKx4QQTce7HO3LHkzgGG8xdFuRzZKoBCT/LVj3A7wP45OyYAEKMCrZjKa
 ifr5w1AadvudERIFmEnhErWJj66HHhQeIcz1bS7yuFYhDQ1s6Ur1/H23t74pczW1LlqC
 K4O/66GhTsnDXROeVJQhxO/9uJaOTZaq06CPbHBVelI4oZ4mUf3vyasiyBtNKu59uX1e
 dTooqNokOUyLLwjTNDHBDj9aJunIGw/V76ydWL+z3AATtgLw0CKvggO7Qkn+odHgxwyX
 PuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=DWyTUhvwk7T3icFRK4BtJnm+zs8Gs2hcwj9A3iJOz3A=;
 b=Lxwocx7GJ2ao/q92WCPKiFvDarmzzdiuGa4jHXH+RIsFjFvp8aiwnS4NfukhBcwz/d
 03k5bgOKmLFqFzEVhb6z72FuhyHRMeqn1eJa7iQkdvab1Zrv0oSRNd73UYZvjL6YNWCm
 HihX5MDWIlro2DvBqX1WNcsLdkWtz8YldL7aS20b31PGbkMfqqj4RbiLLXWNPSlV3EPC
 sDfXMeqcToZPXSlcxrw3JiMCizAMd1G2WRyoRNdeS+Xgc2M1FxkknYVG/Wa10bis+Ebt
 dEoDrD9ufnJiKHxSkJYZKQepBhit5yndATQFWNPpI0TpL6AC2dwUhbCTIn7lDYVM0kes
 gqaw==
X-Gm-Message-State: AOAM531c38HEzgTXSI3E7hTe6R9jCbzwI7ubKbeMbY+89cdbbtKyllyN
 KIoAo0U9HWn/S1sp+bedXlt7ww==
X-Google-Smtp-Source: ABdhPJy9QLWAguT1HYxJMNMcPIK9TGvBSO8t+XA+FMHO6VEo5lC0BX+oBGKtR9k6KYsLiRnC9WajHA==
X-Received: by 2002:a17:90b:fce:: with SMTP id
 gd14mr1246512pjb.64.1615346615567; 
 Tue, 09 Mar 2021 19:23:35 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k15sm8430751pgt.23.2021.03.09.19.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 19:23:34 -0800 (PST)
Date: Tue, 09 Mar 2021 19:23:34 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 19:22:05 PST (-0800)
Subject: Re: [PATCH 1/1] RISC-V: correct enum sbi_ext_rfence_fid
In-Reply-To: <CAOnJCULZFHPPXhL5ZyH9qNfb5BgUHos1PU2q6Khb7uT=N-7a3w@mail.gmail.com>
CC: anup@brainfault.org, xypron.glpk@gmx.de,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, 
 Anup Patel <Anup.Patel@wdc.com>, wangkefeng.wang@huawei.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, seanga2@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-559b7914-90be-4626-9f00-487e35289eac@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_032337_764553_63A3B43E 
X-CRM114-Status: GOOD (  32.20  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 09 Mar 2021 11:28:39 PST (-0800), atishp@atishpatra.org wrote:
> On Mon, Mar 8, 2021 at 2:55 AM Anup Patel <anup@brainfault.org> wrote:
>>
>> On Mon, Mar 8, 2021 at 1:19 PM Atish Patra <atishp@atishpatra.org> wrote:
>> >
>> > On Sat, Mar 6, 2021 at 4:12 AM Anup Patel <anup@brainfault.org> wrote:
>> > >
>> > > On Sat, Mar 6, 2021 at 11:19 AM Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>> > > >
>> > > > The constants in enum sbi_ext_rfence_fid should match the SBI
>> > > > specification. See
>> > > > https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc#78-function-listing
>> > > >
>> > > > | Function Name               | FID | EID
>> > > > | sbi_remote_fence_i          |   0 | 0x52464E43
>> > > > | sbi_remote_sfence_vma       |   1 | 0x52464E43
>> > > > | sbi_remote_sfence_vma_asid  |   2 | 0x52464E43
>> > > > | sbi_remote_hfence_gvma_vmid |   3 | 0x52464E43
>> > > > | sbi_remote_hfence_gvma      |   4 | 0x52464E43
>> > > > | sbi_remote_hfence_vvma_asid |   5 | 0x52464E43
>> > > > | sbi_remote_hfence_vvma      |   6 | 0x52464E43
>> > > >
>> > > > Fixes: ecbacc2a3efd ("RISC-V: Add SBI v0.2 extension definitions")
>> > > > Reported-by: Sean Anderson <seanga2@gmail.com>
>> > > > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
>> > >
>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
>
>> > > Good catch.
>> > >
>> > > I guess we never saw any issues because these calls are only used by
>> > > KVM RISC-V which is not merged yet. Further for KVM RISC-V, the HFENCE
>> > > instruction is emulated as flush everything on FPGA, QEMU, and Spike so
>> > > we did not notice any issue with KVM RISC-V too.
>> > >
>> >
>> > OpenSBI & Xvisor also define the same order as Linux kernel. The
>> > existing order(in Linux kernel)
>> > makes more sense w.r.to Lexicographic order as well.
>> >
>> > Should we just fix the spec instead ?
>>
>> I would not recommend that because RFENCE is part of the released SBI v0.2 spec.
>>
>
> Fair enough.

Yes, agreed.  It's very important that we don't change the specs we said are 
frozen, that would be a huge mess.

This is on fixes.

Thanks!

>
>> We have to be more careful in software to follow the spec correctly.
>>
>
> Agreed. Apologies for the slip up.
>
>> Regards,
>> Anup
>>
>> >
>> > > Looks good to me.
>> > >
>> > > Reviewed-by: Anup Patel <anup@brainfault.org>
>> > >
>> > > Regards,
>> > > Anup
>> > >
>> > > > ---
>> > > >  arch/riscv/include/asm/sbi.h | 4 ++--
>> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
>> > > >
>> > > > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> > > > index 99895d9c3bdd..d7027411dde8 100644
>> > > > --- a/arch/riscv/include/asm/sbi.h
>> > > > +++ b/arch/riscv/include/asm/sbi.h
>> > > > @@ -51,10 +51,10 @@ enum sbi_ext_rfence_fid {
>> > > >         SBI_EXT_RFENCE_REMOTE_FENCE_I = 0,
>> > > >         SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
>> > > >         SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
>> > > > -       SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
>> > > >         SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID,
>> > > > -       SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
>> > > > +       SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
>> > > >         SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID,
>> > > > +       SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
>> > > >  };
>> > > >
>> > > >  enum sbi_ext_hsm_fid {
>> > > > --
>> > > > 2.30.1
>> > > >
>> > > >
>> > > > _______________________________________________
>> > > > linux-riscv mailing list
>> > > > linux-riscv@lists.infradead.org
>> > > > http://lists.infradead.org/mailman/listinfo/linux-riscv
>> > >
>> > > _______________________________________________
>> > > linux-riscv mailing list
>> > > linux-riscv@lists.infradead.org
>> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
>> >
>> >
>> >
>> > --
>> > Regards,
>> > Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
