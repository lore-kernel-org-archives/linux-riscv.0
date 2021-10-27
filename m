Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272B9C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:09:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D710561039
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D710561039
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=F8gpDr+fUjt5XiDRTGRkdLILW74dHhEr2mFCdYvwumM=; b=S1TLpVJSaOYBxyRKkKR6+3sej+
	S7c/j+asH75h/kVgMYQGFBCrDieWiHFxZ3n3GQ5YrlXH4bqxz+u3QxpCt1FtvA0HM4k4X8UABuqiK
	QtG1s0GCPbsmZqqkPD24tRJqPWuxnm5xZ870ZGUtvNcV3u3NAW7QfgNbJWqkegjBYIa8vP42AfpQZ
	moqJY/f4XWXpYAJcwCCuE6RGx2ifp/hGyrYzYhdGbrMKJ3f7hca+RSK3K0S6sYAxX7kdNZZw1UDH1
	9z9GZfZWTyxOspLEBcbzrBl73Bv9BygJm72T6uixGDNH5MhgyfY1Bn/T3sc1Zi3ggd2QPZ6ZpW1Tf
	KMWUnf9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfs2h-006T9a-0i; Wed, 27 Oct 2021 23:09:11 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfs2d-006T8G-MW
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 23:09:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id v20so3075512plo.7
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 16:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=z53gTOEVxYIb2lgRgD1L0JMW+iobeAI2vEOAm7ftuvk=;
 b=lV/g05Uypl1OzKYE1QMWJyYIU8xBPn8A0CXWkz0mdqne0nY/AhG62U7txhv33/8DBJ
 L8QMapRM1yzfc2+j9bzuWXoyXiXhAbLXYxCt3WAjfpBecHdHe6WwRzd1zri9JzCqhiaW
 pZkpAUtcH+ZPBVClrhm5qjb6xz1xV+yfzRODN62gaVcYIi7sCPobs0xde5NJ42Ox0xDu
 Vm9O+wT3VUTdonNpQP2UTPs3G3ya+XOMxAZoqAT86EVmCLMpHKdDUxwUt3v8X0kZvmwu
 8F8ObOpydb6ih8EwhOpDBxicaZ5mhVmwPgQqDO25HgcULLaWmkyG/l53yLZsNfrjWZBq
 8cEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=z53gTOEVxYIb2lgRgD1L0JMW+iobeAI2vEOAm7ftuvk=;
 b=ToYuzrsxNg/Kyd+SBDd1L5DzPccYipCqfw6v8C6TsNUbsb1VJvfi9mc4WoG2M81SYc
 WgJ3A7ABxjI5T6L3/Uetytz2cZaXnK4zixJtJ/3HodPXklKpl6eSz4IEW4BxQGVRIWV9
 Vss9N2gAERmRolyK1eoOkcHfQw6Y89cNQ3RKCVWb1AEO+grGUJy7jxgYPteBpdONvRDs
 Qo5t3G0P53HReW1JFn/X2/9r31kq8b/mUjpF0N8+Zy4xYHgDs9PhjEHZJ1VpoA7IWB0l
 JJNqqwdBQjh9D9FYU87MDuio4zOEAMMQm4n947BAukd8OPVI4VhilBpQxd5KeIdBgzNT
 S8jg==
X-Gm-Message-State: AOAM5332b6isMQCdeSrQi97Wu+fceNNTfV8GanppU8RXDHNyCnSUDiRG
 vhAsAD5e88XnKuTkpcSVArr4aA==
X-Google-Smtp-Source: ABdhPJwzxaxiDrbf0kl3QEpL66IJ+PcLfivFj41ahyeu/Lr51qQFioruTUwYw2IXhembXFga6qL70Q==
X-Received: by 2002:a17:902:e808:b0:140:55fe:1b4e with SMTP id
 u8-20020a170902e80800b0014055fe1b4emr413929plg.87.1635376146401; 
 Wed, 27 Oct 2021 16:09:06 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:60fc:a50:6d27:9fd3])
 by smtp.gmail.com with ESMTPSA id d21sm1000958pfl.59.2021.10.27.16.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 16:09:05 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:09:05 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Oct 2021 16:07:37 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Make CONFIG_RELOCATABLE user selectable
In-Reply-To: <87ee86ajig.fsf@igel.home>
CC: alexandre.ghiti@canonical.com, alex@ghiti.fr,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-95082d33-c7f4-4d3e-9794-7e0534324218@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_160907_756799_35E0DC49 
X-CRM114-Status: GOOD (  16.82  )
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

On Wed, 27 Oct 2021 02:45:27 PDT (-0700), schwab@linux-m68k.org wrote:
> On Okt 27 2021, Alexandre Ghiti wrote:
>
>> On Wed, Oct 27, 2021 at 10:03 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
>>>
>>> On Okt 26 2021, Palmer Dabbelt wrote:
>>>
>>> > +config RELOCATABLE
>>> > +     bool "Build a relocatable kernel"
>>> > +     depends on MMU && 64BIT && !XIP_KERNEL
>>> > +     help
>>> > +          This builds a kernel as a Position Independent Executable (PIE),
>>> > +          which retains all relocation metadata required to relocate the
>>> > +          kernel binary at runtime to a different virtual address than the
>>> > +          address it was linked at.
>>> > +          Since RISCV uses the RELA relocation format, this requires a
>>> > +          relocation pass at runtime even if the kernel is loaded at the
>>> > +          same address it was linked at.
>>>
>>> When in doubt, do what?
>>
>> Then do not enable.
>
> Please add that to the help string.

Thanks, I forgot about that.  I've added it, but this is still a bit in 
flux so I'm not going to send a v2 right now (it's on top of Alex's 
other patches and should probably be squashed in, anyway).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
