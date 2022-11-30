Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5039BC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 03:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=J5A1w3tNe2vzYuVg455JPa11d3S4/mytlmi4+8gzrjE=; b=l0iwp7Fn4MncpTGJAaAn3K/3Gs
	y9ZsLwILcWgENhFw64lvoF7pv1sjfcLdjW8yZkZK1EJ29xzoyTgFziZI7dRiVWCF2tWnOGieZwTa8
	RywlgXM1CrbMSIe9vDeNhITzlvA1kHMNP4lEX1yHmRIoX7QdvVHDUCVp33SAFonzQ7t8T4jfudkHm
	eJkl3yRPGnksPRHhUhRblo4qJUAN/kQXen285ih3bqlAFCXTT16vKZKDx8DD0stqTwqStwt+Snrwv
	DtBIPl2zG4Knvnd0sQr3CX58emwuFqXaxCJjstYUExYygu7kZzAt0p0bkV5Zsqceimnzblgx4RHW8
	8S0TmDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DKt-00CNYW-7D; Wed, 30 Nov 2022 03:00:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0DKq-00CNX8-P9
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 03:00:34 +0000
Received: by mail-pl1-x62c.google.com with SMTP id g10so15334520plo.11
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 19:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UTTKtw9h/uDbm2sJVfPVsezkUtjRi/h4SZI/iHnG9Y=;
        b=k8lZtI/9upV1XjKYxj6UK1eTBLZPJiWF8ENyjv+QbEmsPmmQpquoHC7g8okx1kKPSt
         mQjm6DM42IDKuL6H/+eyk2r5qa5kUwjsgCHGJrYVNSMnG9oJNnba3UywSf9LybkTImG5
         hT1Ha5Xj86XyySxPYQCUGL8E2aepf74J1kp34+yUiX7lHgjjikglWYXIuzh/agr1AGDG
         cdyWNV3WLjWaPD/Le7vUFBw+TDVGujDmgKOITjkIezWsglloj2WtWt5cl0VWSIIKTou4
         enUwlbAG01JqIIWExb2MszQEfqHcnoLwuVZlRCBTcD8U/Kf80nYUCM0dnJ/AWDDzaG9P
         hy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UTTKtw9h/uDbm2sJVfPVsezkUtjRi/h4SZI/iHnG9Y=;
        b=tkQjN/dBlR/LthgZjkDU1ADNM4ONkr7M3GCkO1DlAyJwF/dq1nhhpebjzv6+rdEn8a
         1MScKMUuEzsKJGIh7QyOQZ5k8ES4EfW2pO2719M9tTwQAA6MKagalmL9gHWGnrNB/DxL
         QegkYc8F6UOQwV90Nufl8WpTqe/LjYE1wKuCGQokwI5wZPTeF7rQHS3HU8oe10iKlbOo
         k1WSqRjdvR6U5njvYp47tPunvTa2KeQRPEFHFWw8Nh6plhcPyFF8LRIVqwnZKM5T7YFw
         K6E/VJWkZ1iTCjAucPLmK+Zkd6gTb2IYCUVk89gstg6pEfQr1AWCDebjmPu1iq3cM9u6
         hW1Q==
X-Gm-Message-State: ANoB5pklv00CNYtY8A9PYZ8UW1+Q/FE9D+HsE/HIUMjmWd/JcrP6fnbX
	goaHmdksuTE0iZWWJgFKqqNadRxS2RkcgA==
X-Google-Smtp-Source: AA0mqf7aaJe0L4LvowJ1ooGBcGu5N74WM1WKdlGm9HYpnPv86VmcYosD/uucvwnEBzXbnPsu5kdMcw==
X-Received: by 2002:a17:902:70c9:b0:176:a0cc:5eff with SMTP id l9-20020a17090270c900b00176a0cc5effmr49371814plt.128.1669777231878;
        Tue, 29 Nov 2022 19:00:31 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902eb8e00b0018685aaf41dsm55167plg.18.2022.11.29.19.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 19:00:31 -0800 (PST)
Date: Tue, 29 Nov 2022 19:00:31 -0800 (PST)
X-Google-Original-Date: Tue, 29 Nov 2022 19:00:23 PST (-0800)
Subject: Re: [PATCH 1/2] RISC-V: Align the shadow stack
In-Reply-To: <CAMKF1sryF=inn0B=n=cZi7ZmRcWh3cAtR4uq9DYJfVpD_zOpVA@mail.gmail.com>
CC: jszhang@kernel.org, guoren@kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <mhng-5a2b0379-88e4-43be-8d47-1f019aed05e0@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_190032_845494_8A3CDBE6 
X-CRM114-Status: GOOD (  20.81  )
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

On Tue, 29 Nov 2022 18:56:48 PST (-0800), Khem Raj wrote:
> On Tue, Nov 29, 2022 at 6:50 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> On Tue, 29 Nov 2022 18:47:55 PST (-0800), Khem Raj wrote:
>> > Hi Palmer
>> >
>> > On Tue, Nov 29, 2022 at 6:36 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>> >>
>> >> The standard RISC-V ABIs all require 16-byte stack alignment.  We're
>> >> only calling that one function on the shadow stack so I doubt it'd
>> >> result in a real issue, but might as well keep this lined up.
>> >
>> > Is 16-byte alignment required on rv32 as well ?
>>
>> For the standard ABIs that's the case, it's so the Q extension can spill
>> without aligning the stack.  There's also at least a proposed embedded
>> ABI that has just XLEN (32-bit on rv32) alignment, as the bigger stack
>> alignment has an impact on some use cases.
>
> Thanks, so in this case 16byte will be valid for both rv64/rv32 here.

Yes, though the long-alignment wouldn't break anything because we don't 
have Q support and we're just calling that one function -- it's not like 
the compiler is actively checking for 16-byte alignment or anything, 
it's just assuming it.

Still best to keep things to the spec where we can, though.

>> >> Fixes: 31da94c25aea ("riscv: add VMAP_STACK overflow detection")
>> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> >> ---
>> >>  arch/riscv/kernel/traps.c | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>> >> index be54ccea8c47..acdfcacd7e57 100644
>> >> --- a/arch/riscv/kernel/traps.c
>> >> +++ b/arch/riscv/kernel/traps.c
>> >> @@ -206,7 +206,7 @@ static DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)],
>> >>   * shadow stack, handled_ kernel_ stack_ overflow(in kernel/entry.S) is used
>> >>   * to get per-cpu overflow stack(get_overflow_stack).
>> >>   */
>> >> -long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)];
>> >> +long shadow_stack[SHADOW_OVERFLOW_STACK_SIZE/sizeof(long)] __aligned(16);
>> >>  asmlinkage unsigned long get_overflow_stack(void)
>> >>  {
>> >>         return (unsigned long)this_cpu_ptr(overflow_stack) +
>> >> --
>> >> 2.38.1
>> >>
>> >>
>> >> _______________________________________________
>> >> linux-riscv mailing list
>> >> linux-riscv@lists.infradead.org
>> >> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
