Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B57C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 02:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elmY/s4t54BgRjH6xYlHLazQ7brIpui8u9VFtfH5PTY=; b=PTcvGahDLv4mEb
	zOyyTDEhGTTbhGOvt+KhtCs3XhDOqDkh7liWD0+ip8RCcmhcEbXoIKpSQCEL3vJ9hxqPW37AvfOSV
	uhi4QTKb0kSLvZeJfjYtitZmGnuMjOF1NluiNAwmSZafl72f66Mb0EZojyv66hZtcmwyGnitr6xUM
	mPG9lFdIN+bhUA863/8xBGwRX1tegqoroJSJI0JSLRr6eMYZEI3cZzQ1NqrgwofMhrEn2LbSOu5dl
	P9AzASGA/qBBoGSZtPUMICR0q9KbBv37H35lNvE8Tn92m5iynWTWZ40276QGfPXjTuoxlvyYYPLSs
	MjGgEyH/ZdACXtPPoNfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0vZC-00CWk6-PY; Fri, 02 Dec 2022 02:14:18 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0vZA-00CWj9-9t
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 02:14:17 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 136so3258524pga.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 18:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NNVoFsm0p2fmF+8XIvCyUUB0uikNlFRO7bl1K7LYxsY=;
        b=EjXyetsIzJRIHvrJOub61wyRzOouXl+GPsP+Cnagu+T+FFqE0vn5Zx7VFx2oAiFYdH
         mCjw+v23+XVU+vi4oBlsfH34JCdgq3nevhoaSs9hllsACh1GlDyvDhROawwyQ3sDSFZe
         b9xyfXKoQ3+0q6eRqENvAncZaAlBuHJGqwf39Z9qR0bsVT5Y4vdwayOaNmEqQ18gGau0
         kCk+wBr0aB+4cKu2RdNRbZAKLezJZ5EFiXZ7O/eoxsXCGB1f5+nUEAEMiIMbZ//4zTfd
         J2Cq8YQS0i6AKYDAJkaM4PvGnKuhDza2gcrFsp+4NJIrso0Ec3DUw/bhzJs7Pf7RuyVb
         Ftcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NNVoFsm0p2fmF+8XIvCyUUB0uikNlFRO7bl1K7LYxsY=;
        b=ipH07RTS/CQJhqp0/VJpy8+nj+5R66Bi30BM9w8f734xIPtby4yXGxfWg6TEPW6OUD
         obNkOTipy5StrxRfTc/na8w0HMdNsoEcDN2lihfr5V3e/hzVEIpCql6QAn2fyJkh/KFa
         5/u5ITkUCH/U/5N0Hc4mdIfjjTpiiJCETF97fRbmaD1KAzFQnxTxZ2dwsEZVo+3a3wt1
         iHRd3wWcPqA/0eWe1Zu5xDb0oBL7CFmPwQ25mvoWC6nMjiTHanvfH2gmxuvRBtQclyhm
         s7AL0FzBncX4u0M3cgcuqZUGn/QYOgPLfaPLkIFeQ8f6gBmDm48WKRf8/glvo5XeBb6x
         IGmg==
X-Gm-Message-State: ANoB5pkIbAgmYZ77FW4/ysNrtCd3ctF8w6DBOyhlzuOIRTU4WIT1khz8
	t5rsspU3uquGIiwEBGq/ZTk=
X-Google-Smtp-Source: AA0mqf6gz6A13yBGX1W5VBbvMdl3XinEw0aSx1UfmvWSa8VCPJeNADCW+6HFko9k7cS44X/8S1hbTA==
X-Received: by 2002:a05:6a02:108:b0:46b:3acb:77ab with SMTP id bg8-20020a056a02010800b0046b3acb77abmr42945327pgb.359.1669947254276;
        Thu, 01 Dec 2022 18:14:14 -0800 (PST)
Received: from [192.168.43.80] (subs03-180-214-233-26.three.co.id. [180.214.233.26])
        by smtp.gmail.com with ESMTPSA id e9-20020aa79809000000b0057507bbd704sm3911674pfl.5.2022.12.01.18.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 18:14:13 -0800 (PST)
Message-ID: <66b3fd78-31bc-c435-ccc8-c8682b3cacee@gmail.com>
Date: Fri, 2 Dec 2022 09:14:08 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 3/3] Documentation: riscv: add a section about ISA
 string ordering in /proc/cpuinfo
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, ajones@ventanamicro.com,
 aou@eecs.berkeley.edu, corbet@lwn.net, guoren@kernel.org, heiko@sntech.de,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20221130234125.2722364-1-conor@kernel.org>
 <20221130234125.2722364-4-conor@kernel.org> <Y4gZ/KZz9rdYj/0r@debian.me>
 <Y4hjIWHTuYcf90ja@wendy>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <Y4hjIWHTuYcf90ja@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_181416_376083_45A68402 
X-CRM114-Status: GOOD (  17.45  )
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

On 12/1/22 15:17, Conor Dooley wrote:
> On Thu, Dec 01, 2022 at 10:05:32AM +0700, Bagas Sanjaya wrote:
>> On Wed, Nov 30, 2022 at 11:41:26PM +0000, Conor Dooley wrote:
>>> +#. Single-letter extensions come first, in "canonical order", so
>>> +   "IMAFDQLCBKJTPVH".
>>
>> "..., that is ... ."
> 
> Hmm, that reads strangely to me. s/that/which/.
> 

OK.

>>
>>> +#. The first letter following the 'Z' conventionally indicates the most
>>> +   closely related alphabetical extension category, IMAFDQLCBKJTPVH.
>>> +   If multiple 'Z' extensions are named, they should be ordered first by
>>> +   category, then alphabetically within a category.
>>> +
>>
>> Did you mean "most closely related alphabetical extension category in
>> canonical order"?
> 
> I am not 100% sure what you are suggesting a replacement of here. I
> think I may reword this as:
>   For additional standard extensions, the first letter following the 'Z'
>   conventionally indicates the most closely related alphabetical
>   extension category. If multiple 'Z' extensions are named, they will
>   be ordered first by category, in canonical order as listed above, then
>   alphabetically within a category.
> 

That LGTM.

>>> +An example string following the order is:
>>> +   rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
>>> +
>>  
>> IMO literal code block should be better fit for the example above,
>> rather than definition list:
> 
> Uh, sure? I'm not sure what impact that has on the output, but I can
> switch to a pre-formatted block.
> 

Something like ``foo``?

Thanks.

-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
