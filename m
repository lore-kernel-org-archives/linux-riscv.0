Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DD8C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 08:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHmMnOYRHdIhl7WL7CVMKXrGNTQlVoKJJQ52VHVwH5I=; b=l0L+RE9bFF4ffD
	atgQ/wypLY4vOj+rVO4tmgdr+LnPWQtPJlZSNF9d0HAFii5jYx7B7Ib9qhC5bxQZQ3p3twrivwMFO
	JNZZpCbalqn/q6Vq2aosIuehW8JnuFLATjsHYivLX9sSCKXTybKIYXoWTYGOAkzstO/ltD1Qgkos1
	sQckZ559Cr5M5KTtrf3qQQIU6cHIXgefnmKSxXPUGskH/EIJCMfLX9iVsjwnCfgOgTTd2u5M68x7J
	n6QToqSuGdR6huTop+P6Ew9ZmlcadegwL0TZBmBiT4dM7kHtlsD5ccVhI85tqFWA96p+0UTwi00VS
	NktcBiVytogQEZvmynRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD0bK-00EmVQ-9n; Thu, 27 Jan 2022 08:57:54 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD0bH-00EmUY-9y
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 08:57:53 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F25883F1A4
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 08:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643273859;
 bh=rAWQ6puFnAfnGHvaDRJL0/9MJBEwP+tB4PiTycqmC4A=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=JPAW2Y3j9mfHMYbZpvk78XH7UfhgEuVnb/F7ZIoRDo8oXPsdj8Aqe+9m55+n+QBnb
 lJAdX/XsPH6oUH1VpJBSrIZjkLwCJyTNoUsehzHgIkG6SAl1FQyGF/DaTCc6T7nwJ/
 MtAWqigXrr2jTBO/zh5c6tJIY2eg84lqahmEkm3EZW4qw4efZ2pDxRLP8pxOZsCeac
 TjTtXpk4dBZotvflF+CtfWYVfY27ZNuTgJ+STQE/gUQy7lGWxudyAdX9zTvtnzr0jO
 hV5v/UcJWlTt/GIosuu/y7jdjwR3DDTSNQ6amSRnos5RKJSYjqUSQEwhO+NebCxW5D
 ORIcqZD2pGPng==
Received: by mail-wr1-f69.google.com with SMTP id
 s25-20020adfa299000000b001d8d032255fso783620wra.14
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 00:57:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rAWQ6puFnAfnGHvaDRJL0/9MJBEwP+tB4PiTycqmC4A=;
 b=lOCL0hx+JzNB4Dg0V5wvkoklrc+pWhYm9GLe4PyQQlLI8ImNCSm3CFbISzwgRDwqeK
 hg306HSv9x43o6qH3okwAUIMZoDZ+KLqDgjOuMYVxC84DLkfS7QOTSeQBH5qjUuZlrdQ
 O/vHhRvDGsrf6Rl6sliDBFIqD7P5UVCK1CUibShbL3Tz1Jh579pYl7SX+HomiH2UzVxv
 BV+lR5FfBrVcNIN30BtNdahLs+YTanPTzugBMOS+XVNbepLO4P1ljaobkZGV/sJpfSE1
 I5bxJB+OzxP6fFfxaxzGJMympny7Sz14qqWIT1VIBJDjpexnCbdA26uM9otzmVXJxAhr
 3ETw==
X-Gm-Message-State: AOAM5314iYwXf89yO/jpBYQzE/MwScfQf7JGZqu3/h+dOm5xaGOI00TG
 /KYIrsffRdFgjwwGYS73URZcPi+wo5Qs+N7F0ry2yUTZvFuyy5/kzGLX8KkNF0xQUp9sVay/w9K
 1TZvPu40uYzYqfgY6DQzsmHnArVj3venI0QL08Iq5lWrk0g==
X-Received: by 2002:a05:600c:25a:: with SMTP id
 26mr2294188wmj.184.1643273859626; 
 Thu, 27 Jan 2022 00:57:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+tc5uGSZJ2NLXKSLDBGrhUCHZWHKj1ckOzezNQYB715MSsKTfad8hD58pkhcBmDyb4g1VXA==
X-Received: by 2002:a05:600c:25a:: with SMTP id
 26mr2294172wmj.184.1643273859278; 
 Thu, 27 Jan 2022 00:57:39 -0800 (PST)
Received: from [192.168.123.55] (ip-088-152-144-107.um26.pools.vodafone-ip.de.
 [88.152.144.107])
 by smtp.gmail.com with ESMTPSA id p8sm1820025wrr.16.2022.01.27.00.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 00:57:38 -0800 (PST)
Message-ID: <61c78bdc-7ae3-a755-bfc6-df07f266b2dc@canonical.com>
Date: Thu, 27 Jan 2022 09:57:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RISC-V] [tech-unixplatformspec] Public review of Supervisor
 Binary Interface (SBI) Specification
Content-Language: en-US
To: atishp@rivosinc.com
Cc: Jonathan Behrens <behrensj@mit.edu>,
 tech-unixplatformspec <tech-unixplatformspec@lists.riscv.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>
References: <CAHBxVyHsJkDQB=4o1hCjy2MRs6J4R6n6+XS3bT1iCA+6Z9NGqQ@mail.gmail.com>
 <CANnJOVF3rnpgSixuiwH9x5C+DOViROL_jjpF=2+fkBTh5Amh+w@mail.gmail.com>
 <CAHBxVyF5A4-Nh2gYHoEGYKGxRGyMEKXuK6i8_T64U5hyUSOm3g@mail.gmail.com>
 <CANnJOVFpq_LpsNz1sd3-dbxJfYnrR9XapzRbcGVw98ATKoMsbw@mail.gmail.com>
 <CA++6G0AkUu_39LwXEvNZ+RRDyaeCsC=vdFY_Oue-ZLiuaHN7VQ@mail.gmail.com>
 <CAHBxVyHygA6k7WxjoK8qAEUv_HTqUwc3=cSyXZp_OaBnxgf3Eg@mail.gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAHBxVyHygA6k7WxjoK8qAEUv_HTqUwc3=cSyXZp_OaBnxgf3Eg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_005751_623808_A81A9AC3 
X-CRM114-Status: GOOD (  39.01  )
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

On 1/27/22 09:33, atishp@rivosinc.com wrote:
> 
> 
> On Tue, Jan 18, 2022 at 2:46 PM Andrew Waterman <andrew@sifive.com 
> <mailto:andrew@sifive.com>> wrote:
> 
> 
> 
>     On Wed, Jan 12, 2022 at 12:50 PM Jonathan Behrens <behrensj@mit.edu
>     <mailto:behrensj@mit.edu>> wrote:
> 
>         If that is the intention, the text should be changed to "Returns
>         0 if the given SBI extension ID (EID) is not available, or an
>         *implementation defined* non-zero value if it is available".
>         Although, if the extensions aren't defining any meaning to the
>         various possible non-zero values, I personally don't see why we
>         shouldn't change it to "returns one if it is available".
> 
> 
>     I think allowing implementation-defined nonzero rather than
>     requiring it be 1 is OK, but I agree with your proposed wording change.
> 
> 
> Sounds good to me as well. I will make the change.

Why should the value be implementation specific and not extension specific?

I would prefer if the specification would provide extension specific 
unique return values instead of introducing ambiguity about possible 
return values.

This also allows us to define further return values per extension if 
needed in future. But currently all of these values can be defined as 1.

We just have to add this value 1 to each extension description.

Best regards

Heinrich

> 
> 
>         Jonathan
> 
>         On Wed, Jan 12, 2022 at 3:32 PM Atish Kumar Patra
>         <atishp@rivosinc.com <mailto:atishp@rivosinc.com>> wrote:
> 
>             On Wed, Jan 12, 2022 at 10:59 AM Jonathan Behrens
>             <behrensj@mit.edu <mailto:behrensj@mit.edu>> wrote:
>              >
>              > If I understand correctly, per the description of
>             `sbi_probe_extension`, each of the extensions are supposed
>             to specify an "extension-specific non-zero value" to return
>             if they are available. However, right now I don't think any
>             of them do. Is this something that should be fixed?
>              >
> 
>             The description says "Returns 0 if the given SBI extension
>             ID (EID) is
>             not available, or an extension-specific non-zero value if it is
>             available"
>             The specification says it should be non-zero as the value "0"
>             indicates non-availability of the extension. The exact
>             return value
>             should be an implementation detail.
> 
>              > Jonathan
>              >
>              > On Wed, Jan 12, 2022 at 1:44 PM atishp via
>             lists.riscv.org <http://lists.riscv.org>
>             <atishp=rivosinc.com@lists.riscv.org
>             <mailto:rivosinc.com@lists.riscv.org>> wrote:
>              >>
>              >> I just realized that the below email was not delivered
>             to unix
>              >> platform mailing list and
>              >> linux-riscv mailing list because of the attachment.
>             Reseeding it again
>              >> without the
>              >> attachment. Apologies for the noise.
>              >>
>              >>
>             -----------------------------------------------------------------------------------------------
>              >> We are delighted to announce the start of the public
>             review period for
>              >> the Non-ISA Supervisor Binary Interface (SBI)
>             specification. The
>              >> SBI specification is considered as frozen now as per the
>             RISC-V International
>              >> policies.
>              >>
>              >> The review period begins today, Monday Jan 10, and ends
>             on Monday
>              >> Jan 24 (inclusive).
>              >>
>              >> The specification can be found here
>              >>
>             https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v1.0-rc1/riscv-sbi.pdf
>             <https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v1.0-rc1/riscv-sbi.pdf>
>              >>
>              >> which was generated from the source available in the
>             following GitHub
>              >> repository:
>              >> https://github.com/riscv-non-isa/riscv-sbi-doc
>             <https://github.com/riscv-non-isa/riscv-sbi-doc>
>              >>
>              >> To respond to the public review, please either reply to
>             this email or
>              >> send comments to the platform mailing list[1] or add
>             issues to the
>              >> SBI GitHub repo[2]. We welcome all input and appreciate
>             your time and
>              >> effort in helping us by reviewing the specification.
>              >>
>              >> During the public review period, corrections, comments, and
>              >> suggestions, will be gathered for review by the Platform
>             HSC members. Any
>              >> minor corrections and/or uncontroversial changes will be
>             incorporated
>              >> into the specification. Any remaining issues or proposed
>             changes will
>              >> be addressed in the public review summary report. If
>             there are no
>              >> issues that require incompatible changes to the public
>             review
>              >> specification, the platform HSC will recommend the updated
>              >> specifications be approved and ratified by the RISC-V
>             Technical
>              >> Steering Committee and the RISC-V Board of Directors.
>              >>
>              >> SBI specification is non-ISA specifications and will
>             evolve over time
>              >> with new extensions as long as they are backward
>             compatible. Any such
>              >> proposals for new extensions can be included in the
>             future releases
>              >> after proper discussions in the platform working group
>             meetings.
>              >>
>              >> Thanks to all the contributors for all their hard work.
>              >>
>              >> [1] tech-unixplatformspec@lists.riscv.org
>             <mailto:tech-unixplatformspec@lists.riscv.org>
>              >> [2]
>             https://github.com/riscv-non-isa/riscv-sbi-doc/issues
>             <https://github.com/riscv-non-isa/riscv-sbi-doc/issues>
>              >>
>              >> Regards,
>              >> Atish Patra
>              >>
>              >>
>              >>
>              >>
>              >>
> 
> _._,_._,_
> ------------------------------------------------------------------------
> Links:
> 
> You receive all messages sent to this group.
> 
> View/Reply Online (#1667) 
> <https://lists.riscv.org/g/tech-unixplatformspec/message/1667> | Reply 
> To Sender 
> <mailto:atishp@rivosinc.com?subject=Private:%20Re:%20Re%3A%20%5BRISC-V%5D%20%5Btech-unixplatformspec%5D%20Public%20review%20of%20Supervisor%20Binary%20Interface%20%28SBI%29%20Specification> 
> | Reply To Group 
> <mailto:tech-unixplatformspec@lists.riscv.org?subject=Re:%20Re%3A%20%5BRISC-V%5D%20%5Btech-unixplatformspec%5D%20Public%20review%20of%20Supervisor%20Binary%20Interface%20%28SBI%29%20Specification> 
> | Mute This Topic <https://lists.riscv.org/mt/88379909/6300605> | New 
> Topic <https://lists.riscv.org/g/tech-unixplatformspec/post>
> Your Subscription 
> <https://lists.riscv.org/g/tech-unixplatformspec/editsub/6300605> | 
> Contact Group Owner <mailto:tech-unixplatformspec+owner@lists.riscv.org> 
> | Unsubscribe <https://lists.riscv.org/g/tech-unixplatformspec/unsub> 
> [heinrich.schuchardt@canonical.com]
> 
> _._,_._,_


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
