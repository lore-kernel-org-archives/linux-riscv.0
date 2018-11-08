Return-Path: <SRS0=/DNs=NT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333A3ECDE47
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 16:57:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07B3920825
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 16:57:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lv4qsguM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fBqeo1Tw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07B3920825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=mZ62hgDxHoqDTkRpRp+Ag4gNBn1CgFx7yYPAtt9oJpY=; b=Lv4qsguM4CFPswUMKJgJFLtIw
	sRQGOhGnaIZmNi3Wg41XcLxYE6UEclLJh6Ihabw9vd9rIYtpCU0tX5bBDi8nCGy6A0HhHF2dCT4Ly
	yWUF5XzuOIzMM5gHtsvhGnUlKt6AD677hUMtnwWmTdFB2u8fGGkWPOYwn69Pkbcsr6QJ9XTF4RHIV
	ktwWU0GR67gcqLWU/iGH1ls8vIoNJ991cyGGf1D0ukNxGzIdMJ+/0lhNI0fHKphkd8gjVhaNmKgNl
	UZ4AMei0LGHq4ndjS9YESj3KGwjUYYYNvFLQunCPmQhbNVnVfxoSRf4tEu7DL2WAGyKGWLS4gvDaj
	2LY6ga7Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKncg-0005XV-Aw; Thu, 08 Nov 2018 16:57:38 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKnce-0005Vp-4T
 for linux-riscv@lists.infradead.org; Thu, 08 Nov 2018 16:57:37 +0000
Received: by mail-pl1-x643.google.com with SMTP id t6-v6so9807090plo.9
 for <linux-riscv@lists.infradead.org>; Thu, 08 Nov 2018 08:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=IcXWo4Ru8Po2n0qcDZDRzwCHw21xpgGQ6HLWe7ZXU8s=;
 b=fBqeo1TwPBxPRMe8MZ9QnKq8HPLbCBTkJpFNe1GfG+tgLdHj3JuEq1QT2DAg0eGG5z
 EY1Tz2NhKboqZcX8BoyXbx5hepSR3i3+MsSwh/sghjxos5uW3qhhzwMSK5dgOxZdgcWG
 izTxv/YqRsTznULOv/IK2ESe1f26sIIzmBOZ9KmXL4U1r19IJrGueH64n/IM9Ug/7Q15
 AwUAf9dhxdgvEjp+MUvZHPxs9zwyeSwVjjZRpOsCJLrmLt8OFi/aQPAmmgNbKA6KPy2n
 jACAnrKd5KSaj2pWCQDZ0XPw6O8Hl9Mhi2ruNjMS8cy3F5Y6VeLyeTe53iE4HwIISHDd
 7M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=IcXWo4Ru8Po2n0qcDZDRzwCHw21xpgGQ6HLWe7ZXU8s=;
 b=QE14DiXEWS+jwtUujMAp0OT6DNalCC/s9v4FdmNiX51lhMh/1Viz2Feep/MFjAD+s2
 7ObYJewQKK+IxTdGvM2enWnWQPZ5ZdoSkt54CAjI33OynHeTuqdOnNnCx9/yM+Do4id8
 9faRdgV9wngl0JCx/5lycNR1FqZpZjOF3xcTjjKZURFu0mH6J3h+jrIgTFXN8rTIKOaZ
 TLVHYYdVCCizL+WWwsvCMAa705iXQYtXOEg8+dCllIsMS7HJjrTGIZ/l+NWQ/oEHVQ0q
 MYteVkPvJZyip39XLx3glaEB+AARw3XAwhIdck33YMZn1MAuMK5WS0OgaMdUpm+n0fxa
 OWVQ==
X-Gm-Message-State: AGRZ1gKziFDC4hZXM8Q9mj8aebfXCXBcX/0hJmTLY8BPzevw871jNKmk
 1DoFihzR7D8DquP93yOH7PIFPA==
X-Google-Smtp-Source: AJdET5fcm7ZpwDm1e19hsStaS1X/NjR3IKQ3ZemaROE6NwBitEIdbzdpV79XvGF9UZ42z0W91jwncA==
X-Received: by 2002:a17:902:9a44:: with SMTP id
 x4-v6mr5155730plv.121.1541696245237; 
 Thu, 08 Nov 2018 08:57:25 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id l23-v6sm1691597pfj.179.2018.11.08.08.57.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Nov 2018 08:57:24 -0800 (PST)
Date: Thu, 08 Nov 2018 08:57:24 -0800 (PST)
X-Google-Original-Date: Thu, 08 Nov 2018 08:31:33 PST (-0800)
Subject: Re: [PATCH] riscv: add asm/unistd.h UAPI header
In-Reply-To: <CAEn-LTqCT-u0_QNdOSf3bLKYa5S2vz4T0X5yKmnS1AE4pDYOkg@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-dc92b5a0-ee9f-4e63-a99e-34e77058c77a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181108_085736_172408_3EE2AA66 
X-CRM114-Status: GOOD (  20.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, marcin.juszkiewicz@linaro.org,
 linux-riscv@lists.infradead.org, linux@roeck-us.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181108165724.fnP1O5iV0K2WF1665K__2YMn6dbj6o4iQtIIwuTszSI@z>

On Thu, 08 Nov 2018 02:38:22 PST (-0800), david.abdurachmanov@gmail.com wrote:
> On Thu, Nov 8, 2018 at 3:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 07 Nov 2018 13:09:39 PST (-0800), Arnd Bergmann wrote:
>> > On Wed, Nov 7, 2018 at 7:30 PM David Abdurachmanov
>> > <david.abdurachmanov@gmail.com> wrote:
>> >> On Wed, Nov 7, 2018 at 1:08 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> >> > On Mon, 05 Nov 2018 12:56:15 PST (-0800), Arnd Bergmann wrote:
>> >
>> >> > The target is still the next glibc release (Feb 1st) for a stable RV32I ABI.
>> >> > That's progressing well, with one last blocking issue related to some of our
>> >> > floating-point emulation routines before we can submit the port.  This should
>> >> > give us ample time to line up the ABIs correctly so everything works.
>> >> >
>> >> > So I think the correct answer here is to drop __ARCH_WANT_STAT64 from RISC-V.
>> >> >
>> >>
>> >> Then if you agree I could do and send v2:
>> >>
>> >> +#ifdef __LP64__
>> >> +#define __ARCH_WANT_NEW_STAT
>> >> +#endif /* __LP64__ */
>> >
>> > Looks good to me.
>>
>> This is a bit pedantic, but I'm not sure what the right answer is here:
>> "-march=rv64gc -mabi=ilp32d" will not define __LP64__, but will define
>> "__riscv_xlen == 64".  I actually don't know enough about how an rv64gc/ilp32d
>> ABI would work to answer this: would we have "long long" all over our syscalls?
>>
>> Probably not worth worrying about for now, as we'll have to go audit all of
>> these if we ever end up with an ilp32 ABI.  So just go for it and we'll throw
>> this on the pile to deal with later :)
>
> GCC will not allow "-march=rv64gc -mabi=ilp32d":
>
>     cc1: error: ABI requires -march=rv32
>
> I see that arch/riscv/include/uapi/asm/elf.h already use __riscv_xlen so to be
> consistent I will use it too (but I like __LP64__ more as it is well
> known macro).
>
> Looking at other UAPI headers I see that include/uapi/linux/rseq.h is using
> __LP64__ macro. This header is installed on riscv.

Yes, it's not currently supported and there are no concrete plans to support 
it.  Like Arnd mentioned, it's a big headache.  It was really more of a 
question about how this might work than a concrete review, I'm happy with the 
patch as it was suggested.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
