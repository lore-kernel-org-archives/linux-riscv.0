Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD992C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jan 2022 20:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46wj6oDToav+CT6mBo863No4enn1xYjK4tjFQAcxZ/s=; b=X/6g4UwVh4rVmc
	YOPm3we53nGLHQVdvDX/zm5X4AGjvIp/58lsdeBz3xg6U+ZYmG/QDvg4YtvSEub5EpPzweOwd/pbI
	Mm0mc+riF5S+Zw85uwQpRIiEIcfcPzoU0Td76ofwhsoNswp5mhEIJGYXIdbx13p9aDW8DE1V1S8G3
	ms5szXtWw0/EEAc9wvI1Vgdf4OVEP1iDB8lHD2FEQN1MvIoDkconlwYRBODenU0wnZ5sTx+J/5PaQ
	q48nawvSDnteop1VQprO9Nrj1NyM1yvSAwlsVFiUjSDsZCFSd3jdCPS9PHSZLxB7llNrVlUkrT7Qz
	fqiWq+4jGfKwfjki8KFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7kIH-003kUw-OX; Wed, 12 Jan 2022 20:32:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7kIE-003kUO-9J
 for linux-riscv@lists.infradead.org; Wed, 12 Jan 2022 20:32:28 +0000
Received: by mail-ed1-x533.google.com with SMTP id c71so14691014edf.6
 for <linux-riscv@lists.infradead.org>; Wed, 12 Jan 2022 12:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bfkmTDo5+9d/3Iu6ZFoqvybQbgH0wZSDncXBTqBN00k=;
 b=0Qq3mNZ+Udhzy9ugaBXKrYjZ1arwu1YId0DQKp86Hx6JTbg871q8jzGgLKBVXgrxLR
 n6Z+nOwZ/zGx7NA9AHyK9VgaLGhqr2mFFYFP0Q2wVaLIoQ/oa8p4xI99qaukawhZAx+i
 Vmpal013OiiECJQQkIAb3taWoaC+a6wR0uKFAJH9GjXZ0e9Kwt9z3ONMGPvepIyQyLTr
 5tUoMc7Ocd4VqsutFDswIj7M1nvpUWTKC7qLS2prYQCN87tXCf8kYD0hCp0RJAKcdunm
 fMu5LdSjN/ZhwkvXgY8MhOBN2JQteUeYbRgj/exj1sAex711/8ax4/tyFBV03g5CPd8j
 Nkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bfkmTDo5+9d/3Iu6ZFoqvybQbgH0wZSDncXBTqBN00k=;
 b=CNIkxXUBcaDwoVKHEhr3PtuigLdqHKQU1skoOHe9Uam5CnVm60fqfPJkY4Kx5HEcbl
 /J/xpTQ3Xd1T0MU0ymM89amMfwVswuOCp/+wcv3H12xoBq5edsgtZNddI5e5upsPukk1
 SZXRd/0n1Do5MOlJF5beBQg1R1GMMt76qC7meiGImXBGWh98oKYj1VFMswYTK8Zt6QQZ
 hdp4o47EHxJRoCc++numdEizgZLRgj2xoOrNvcnYCYDklwwjBOy8WFWbTCw5yQL6i980
 D11/gmW88QvoMOD5s6NDtcc9tH61QGfXzbC9/c4KU3blmVRUcRvdz8sF34GNyBRQg2aH
 FP+g==
X-Gm-Message-State: AOAM530Hk7X7pUZq8LM/4KZ4tiDEf9abfjJiZNVrzt8jRQo9YMgFOSZk
 1YVubzHXiBIZUWFd4g69f3pHqY9zPGyc4JbHOXJMb/Hu89AmGg==
X-Google-Smtp-Source: ABdhPJwGL0FGN1nTthiftsPZCOIUSe0Lx/jyRS3hCmBACznaDPoXJ29zlhv1gD3NjGxkBmvyvCnZZEWjJ3r0x3iKIdo=
X-Received: by 2002:a17:906:b0d4:: with SMTP id
 bk20mr1134615ejb.268.1642019544373; 
 Wed, 12 Jan 2022 12:32:24 -0800 (PST)
MIME-Version: 1.0
References: <CAHBxVyHsJkDQB=4o1hCjy2MRs6J4R6n6+XS3bT1iCA+6Z9NGqQ@mail.gmail.com>
 <CANnJOVF3rnpgSixuiwH9x5C+DOViROL_jjpF=2+fkBTh5Amh+w@mail.gmail.com>
In-Reply-To: <CANnJOVF3rnpgSixuiwH9x5C+DOViROL_jjpF=2+fkBTh5Amh+w@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 12 Jan 2022 12:32:13 -0800
Message-ID: <CAHBxVyF5A4-Nh2gYHoEGYKGxRGyMEKXuK6i8_T64U5hyUSOm3g@mail.gmail.com>
Subject: Re: [RISC-V] [tech-unixplatformspec] Public review of Supervisor
 Binary Interface (SBI) Specification
To: Jonathan Behrens <behrensj@mit.edu>
Cc: tech-unixplatformspec <tech-unixplatformspec@lists.riscv.org>,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_123226_406542_08CCE6D0 
X-CRM114-Status: GOOD (  17.01  )
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

On Wed, Jan 12, 2022 at 10:59 AM Jonathan Behrens <behrensj@mit.edu> wrote:
>
> If I understand correctly, per the description of `sbi_probe_extension`, each of the extensions are supposed to specify an "extension-specific non-zero value" to return if they are available. However, right now I don't think any of them do. Is this something that should be fixed?
>

The description says "Returns 0 if the given SBI extension ID (EID) is
not available, or an extension-specific non-zero value if it is
available"
The specification says it should be non-zero as the value "0"
indicates non-availability of the extension. The exact return value
should be an implementation detail.

> Jonathan
>
> On Wed, Jan 12, 2022 at 1:44 PM atishp via lists.riscv.org <atishp=rivosinc.com@lists.riscv.org> wrote:
>>
>> I just realized that the below email was not delivered to unix
>> platform mailing list and
>> linux-riscv mailing list because of the attachment. Reseeding it again
>> without the
>> attachment. Apologies for the noise.
>>
>> -----------------------------------------------------------------------------------------------
>> We are delighted to announce the start of the public review period for
>> the Non-ISA Supervisor Binary Interface (SBI) specification. The
>> SBI specification is considered as frozen now as per the RISC-V International
>> policies.
>>
>> The review period begins today, Monday Jan 10, and ends on Monday
>> Jan 24 (inclusive).
>>
>> The specification can be found here
>> https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v1.0-rc1/riscv-sbi.pdf
>>
>> which was generated from the source available in the following GitHub
>> repository:
>> https://github.com/riscv-non-isa/riscv-sbi-doc
>>
>> To respond to the public review, please either reply to this email or
>> send comments to the platform mailing list[1] or add issues to the
>> SBI GitHub repo[2]. We welcome all input and appreciate your time and
>> effort in helping us by reviewing the specification.
>>
>> During the public review period, corrections, comments, and
>> suggestions, will be gathered for review by the Platform HSC members. Any
>> minor corrections and/or uncontroversial changes will be incorporated
>> into the specification. Any remaining issues or proposed changes will
>> be addressed in the public review summary report. If there are no
>> issues that require incompatible changes to the public review
>> specification, the platform HSC will recommend the updated
>> specifications be approved and ratified by the RISC-V Technical
>> Steering Committee and the RISC-V Board of Directors.
>>
>> SBI specification is non-ISA specifications and will evolve over time
>> with new extensions as long as they are backward compatible. Any such
>> proposals for new extensions can be included in the future releases
>> after proper discussions in the platform working group meetings.
>>
>> Thanks to all the contributors for all their hard work.
>>
>> [1] tech-unixplatformspec@lists.riscv.org
>> [2] https://github.com/riscv-non-isa/riscv-sbi-doc/issues
>>
>> Regards,
>> Atish Patra
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#1637): https://lists.riscv.org/g/tech-unixplatformspec/message/1637
>> Mute This Topic: https://lists.riscv.org/mt/88379909/1775851
>> Group Owner: tech-unixplatformspec+owner@lists.riscv.org
>> Unsubscribe: https://lists.riscv.org/g/tech-unixplatformspec/unsub [behrensj@mit.edu]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
