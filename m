Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99395C10F1B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=AepDzzji22M2Xg3trOrGmFmbALuhphemNFFn9sS5wKo=; b=XGjtrPMixTqNoFVmWfItflvJuk
	YZLCxm8iaf04cate6tbKlncTvXoErOmTk8ocSSPuBixoGc8o9y/jnUe+gkhTFrjeBZ/8IfipnbezA
	hWedPdqmH0u8RcZ3W38bUIHRPf6I/WDaJRdH5J9hS6hI6WVD/1ujaGCg9oTf5lxZ5T+OTHlzqiYga
	jZcR1cFcjf9TpE5czarJvXQ2I0wExZhWB41IQjq4jyG0VGsGjADjuXQR6hKYqp96BHoF3ZP+LGa+o
	yrgxthzCDxUxCIOwwgLnAz+EUYojpKkFCK9CQwq2zC823ixTHpG0CyxmOE9GKwsZ7fFjM1VpA+srh
	OKBcSOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59G1-003n4I-5T; Tue, 13 Dec 2022 17:39:57 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p59Fw-003myM-Fk
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 17:39:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so4347749pjj.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 09:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8Vl5JvJ5RJ2jsKglTe94JASQfS6jQ4Nl9BCdoRO1+s=;
        b=tVdZWAkvmAggy2yjJbABiqsgctLjYReEmQlvHFWIrml3GOpmyoSkjKW6grrDGtIWYE
         gcioYHBEICRA3M+ykS7+FfGrhsS8kcIyd0LtVgoeniaIUd2e4PumsQvEWhz+F7h9Iwma
         tyFOnDUkzqP9o5JBKYJ/ZvB9ouSSlIBZq2GpVKueHTh8cf+yvuJSJpRUpwFwO7A0J/0s
         AUr4dI0zHH6DZ43czTWpVlG25lLzlR3yjLfbMnRBJFeBPOtexxBbn4KMT5z4MMcABzA7
         zek14xOwIig/dFoeGmxFckqaREShYosoF8OYTBBDcbWBSQ9ASJIg0i11HgJfNQoAeIBI
         EMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8Vl5JvJ5RJ2jsKglTe94JASQfS6jQ4Nl9BCdoRO1+s=;
        b=PSHx3/yy+5d/k3Y5NdVaVG9z5nGHpaO0osTDKxlDFVGTCW4UZ4uGyS2NqBy+vCfnnl
         64rJ91I2Mmo+yH1n0D3XnOFgimiSY7n30hVDIBhiYRKak7quu9RoAYMgNjyW2+gDrwi2
         RE0LcXQHapQie9kxacVGPb3WMx1qvusCMG6bbrmKslBUvabDVQ2uEa8M940Y7cBlBTgk
         0EIQIid4tLEh5oSuBympWOT64PeskS3brYvBO9Y7daT3kTdfCvcZPWP7FWYKOYBnhYFW
         IYBczQNwBbBTsQ8L0NDPu7dUV5/40yrm9dobujsEXsxSKSmXi19Ov52cxwl5WjrcqOgE
         ZN3Q==
X-Gm-Message-State: ANoB5pmQ0h1uSH++FF54svlO8ghIAqcslUSGatCPcivk1M9C8xFVLY+6
	9FWz+ZEriA1IS+x0WysnHnK05JnNkUHZ6+ub
X-Google-Smtp-Source: AA0mqf4Rmg4nuYwK/S0vFuCvLNDHRIEmU8fqPsy414pTGzvbLkRCJXRzLAIjFOSwd4eDNuewuSVQKg==
X-Received: by 2002:a17:902:eaca:b0:189:5ef4:6ae9 with SMTP id p10-20020a170902eaca00b001895ef46ae9mr21518381pld.45.1670953188115;
        Tue, 13 Dec 2022 09:39:48 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902e88900b00186985198a4sm159373plg.169.2022.12.13.09.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 09:39:47 -0800 (PST)
Date: Tue, 13 Dec 2022 09:39:47 -0800 (PST)
X-Google-Original-Date: Tue, 13 Dec 2022 09:26:52 PST (-0800)
Subject: Re: [PATCH v3 2/4] Documentation: RISC-V: Allow patches for non-standard behavior
In-Reply-To: <4208290.1IzOArtZ34@diego>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
  Conor Dooley <conor@kernel.org>, anup@brainfault.org, Conor Dooley <conor.dooley@microchip.com>,
  anup@brainfault.org, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: heiko@sntech.de
Message-ID: <mhng-6442da08-f43c-47c7-9ef4-f049a9250d66@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_093952_729720_52951C63 
X-CRM114-Status: GOOD (  20.92  )
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

On Wed, 07 Dec 2022 07:41:36 PST (-0800), heiko@sntech.de wrote:
> Am Mittwoch, 7. Dezember 2022, 03:08:13 CET schrieb Palmer Dabbelt:
>> The patch acceptance policy forbids accepting support for non-standard
>> behavior.  This policy was written in order to both steer implementers
>> towards the standards and to avoid coupling the upstream kernel too
>> tightly to vendor-specific features.  Those were good goals, but in
>> practice the policy just isn't working: every RISC-V system we have
>> needs vendor-specific behavior in the kernel and we end up taking that
>> support which violates the policy.  That's confusing for contributors,
>> which is the main reason we have a written policy in the first place.
>>
>> So let's just start taking code for vendor-defined behavior.
>>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
>> Link: https://lore.kernel.org/all/alpine.DEB.2.21.999.2211181027590.4480@utopia.booyaka.com/
>> [Palmer: merge in Paul's suggestions]
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  Documentation/riscv/patch-acceptance.rst | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
>> index 5da6f9b273d6..16b90a31d267 100644
>> --- a/Documentation/riscv/patch-acceptance.rst
>> +++ b/Documentation/riscv/patch-acceptance.rst
>> @@ -29,7 +29,11 @@ their own custom extensions.  These custom extensions aren't required
>>  to go through any review or ratification process by the RISC-V
>>  Foundation.  To avoid the maintenance complexity and potential
>>  performance impact of adding kernel code for implementor-specific
>> -RISC-V extensions, we'll only accept patches for extensions that
>> -have been officially frozen or ratified by the RISC-V Foundation.
>> -(Implementors, may, of course, maintain their own Linux kernel trees
>> -containing code for any custom extensions that they wish.)
>> +RISC-V extensions, we'll only consider patches for extensions that either:
>> +
>> +- Have been officially frozen or ratified by the RISC-V Foundation, or
>> +- Have been implemented in hardware that is either widely available, per
>
> I guess the "either" should go, as there is no "or" part.

Thanks, that's fixed and these are on for-next.

>
> Other than that
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
>> +  standard Linux practice.
>> +
>> +(Implementors, may, of course, maintain their own Linux kernel trees containing
>> +code for any custom extensions that they wish.)
>>
>
>
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
