Return-Path: <SRS0=DSzU=WD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC27C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 15:37:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE5621E6C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 15:37:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HEZep3P7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BE5621E6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=wD2yE6ZC2VzvLl7fbT3mDKOwi7J3tRoRInmshUdKii0=; b=HEZep3P7FsnhluETlgEV08hpc
	4RIp4WMySKdRm/WxSvKGx/Gfou6aLzF++r2I8U3HOa6Ae5paok94eHx0koGKnLLblboT7Qnh6rh6b
	zz/HeVIeBgEG7O4M4Bd8ZdvXWB+yN24gFrqe+5ItXXsPQ9ZFK0FmnRHAkitkr4lAaMhlCXrsalnoe
	S3TzhgiZgGGfI59B71BOKd1l4MXdD55YZdqGHkNK8SnjnRx0KI16BeuneWC0rjM56rbw3uLqzXW9o
	KsUZh7ZsFED7YRNUmpz8g5w1kpKhtPwdnEpKSbxMSbWWEeMB+KxNzNBcDu0zdHiNJMn45qbN678FB
	VQd9fLX5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvO0f-0007Qj-TW; Wed, 07 Aug 2019 15:37:53 +0000
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvO0d-0007Of-8X
 for linux-riscv@lists.infradead.org; Wed, 07 Aug 2019 15:37:52 +0000
Received: by mail-pl1-f193.google.com with SMTP id b7so41433942pls.6
 for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2019 08:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=SbXighRqPCoPZWVDEmqUD9WiXHWD2WoHQaBKm2NnUQ0=;
 b=CU0yLaxK5JAnjWZQe7xKHarHTR3GsU6il30cl8BN4LmQE0Z2KTrmu3JhNh1nX2OWTk
 UNROPVyohzArI2zt3qWb1/RlGQD6fx2HyXDkDGBMjUHEBT0lNY8Ufh/m2nX5hV4bHiFJ
 E+S5UtvWewZsaTK/otLX6tq1j6DDPwZrW4g1d17UfYVHnMHHXBD1stQKVGY3jYPeXtnn
 q85bUMctqxa9A6uc6uxZQGwwVRD1fTY7GUF/hflJYWEQPuGXr0VXfplJqFs6hh9wm5rL
 HCA9F6ZP00MSX0hq6Bi1f289B8AF8iaFrV1NuQ8uSIanu2ZBug6IiZ2lQMbVeGqAh06j
 EkVQ==
X-Gm-Message-State: APjAAAVjwUg3zHRSUB9nTmlJgA0MQJQJUQQun7Ug0z2kAxjsfP0kQdX1
 MTlpiopC5sJ3Af3gIDSJSiTFjQ==
X-Google-Smtp-Source: APXvYqwOxmLrwq/hmTiDm7ZkSCDmAQCrO2shh8IxFFNkXHW4/5EiApdsriHIksWl6eUkZz6HIzP15g==
X-Received: by 2002:a17:90a:5288:: with SMTP id w8mr512178pjh.61.1565192269545; 
 Wed, 07 Aug 2019 08:37:49 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 125sm127468985pfg.23.2019.08.07.08.37.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 08:37:48 -0700 (PDT)
Date: Wed, 07 Aug 2019 08:37:48 -0700 (PDT)
X-Google-Original-Date: Wed, 07 Aug 2019 08:21:35 PDT (-0700)
Subject: Re: [PATCH v3 3/5] RISC-V: Fix unsupported isa string info.
In-Reply-To: <alpine.DEB.2.21.9999.1908061818360.13971@viisi.sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <mhng-6a70927a-4b6a-452f-910c-0639d5f47dff@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_083751_325003_2B28C8F5 
X-CRM114-Status: GOOD (  16.80  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 tiny.windzz@gmail.com, Greg KH <gregkh@linuxfoundation.org>,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, johan@kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 robh+dt@kernel.org, gary@garyguo.net, tglx@linutronix.de, info@metux.net,
 linux-riscv@lists.infradead.org, allison@lohutok.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 06 Aug 2019 18:26:08 PDT (-0700), Paul Walmsley wrote:
> On Wed, 7 Aug 2019, Atish Patra wrote:
>
>> On Tue, 2019-08-06 at 16:27 -0700, Paul Walmsley wrote:
>>
>> > Seems like the "su" should be dropped from mandatory_ext.  What do you
>> > think?
>> >
>>
>> Yup. As DT binding only mention imafdc, mandatory extensions should
>> contain only that and just consider "su" extensions are considered as
>> implicit as we are running Linux.
>
> Discussing this with Andrew and Palmer, it looks like "su" is currently
> non-compliant.  Section 22.6 of the user-level specification states that
> the "s" character indicates that a longer standard supervisor extension
> name will follow.  So far I don't think any of these have been defined.
>
>> Do you think QEMU DT should be updated to reflect that ?
>
> Yes.

https://lists.nongnu.org/archive/html/qemu-riscv/2019-08/msg00141.html

>
>> > There's no Kconfig option by this name, and we're requiring
>> > compressed
>>
>> Sorry. This was a typo. It should have been CONFIG_RISCV_ISA_C.
>>
>> > instruction support as part of the RISC-V Linux baseline.  Could you
>> > share the rationale behind this?
>>
>> I think I added this check at the config file. Looking at the Kconfig,
>> RISCV_ISA_C is always enabled. So we can drop this.
>
> OK great.  Do you want to resend an updated patch, or would you like me to
> fix it up here?
>
> I'll also send a patch to drop CONFIG_RISCV_ISA_C.
>
>
> - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
