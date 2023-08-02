Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76913C04A6A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 14:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zcvZKgL7tRjq2Fzg4uhqFEt6F3r7GJOyZ4GCXpjmJk=; b=WDn6WBF57j8jt7
	tr1XizSCpW0fRXLMs+Ce/djNnQkU4ZBNe5S7YdLOwzCqZyvfYS3jjC3nJtPzA0G6KFhP2hOt7v0l8
	2S9zubFCgXemyL55zL6gGyvVsdUK06ygvBjslfZYkzI10Do9JuXhuZa9TtGtFmY1kcYmUDA10Wz6l
	VBQtZ+rTZX/mRVORLF7B4EjNN96yBODS7HkhC4QVJW4sA5hwRmMi5KHasaCGaght3UPionQH/3+1b
	mLt7P5IE7D/5bpZyZjhjIrrSuHtobt9fdapfZSE1w230it10vpz83sn8A3aIErqagia035kzFFx06
	b4Z+OmNgHjA2lSFU+xTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRCv2-0055q3-1i;
	Wed, 02 Aug 2023 14:33:44 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRCuz-0055pN-30
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 14:33:43 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9cdbf682eso87723881fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 07:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690986819; x=1691591619;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3dqB5EgASBhBjqdDKjXg2ApMsomN/KHZ6sHTKgO6Y/s=;
        b=ZSd0mJM7DHjOdeRXwJkcc31Bue5Y9dDq5nMFe+96NtE7WRFqj5A3GgWaLuAqgO9/A2
         xjregt8PEhQya2YZ+0SWLPrbt2+H3rg0QI8v3Mo4PR80DopgfzXMAfGJ4ny/qaxK1EHc
         yeJS0MrKXy4jHZqzvXN1EFKeAmsw4LHisSVVomP1q7O51zKPl151FckW68nGmYCv5W+z
         mNBhDOCmS3Cz4JEF3Nec7YrddGlQee+GWWIlCHIfeHDwY9p6Gv8VOINRBCRv6vQ74tjt
         QxHausIq4Nl3UJMDrQNCBtgNDoJoLbJdxkiiR5paJlGW48go/y5jsigKl+TdfPWVCWu5
         cFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690986819; x=1691591619;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dqB5EgASBhBjqdDKjXg2ApMsomN/KHZ6sHTKgO6Y/s=;
        b=Vvbm8x9nuI6TkuOlKfvqNxerwlyb4LPu4tAHOsrSdi8dthU+TCd6Ctfdbm2ETLZgLr
         ZVSkFKsmcD2wRX/rb5s8o7c+HoL8IIZj7aIT7NgnElfYgMdK4jFreQdt/GPv9Hckplq+
         ifas1t5F10I+Z8J+VvgFM+oImtFOh3lYjMDOT30jONzYUZiwmHzFlssJvUW1cmI5hNJ6
         4oMTDCW95cfe2zwodH08+LGti/8HifzVKjvg+FT/MRZ8Tl58e6jhB+LQz3ITb8Q8hYeM
         QR3y/1whR6GXxGiMyJwI3yD5kRWZtQOI84v10VokPTNDe0MsnufJBeCW+eH0tFtN7eEk
         K95Q==
X-Gm-Message-State: ABy/qLZt53X6HYUdiGKfp7GLuck+frOJt3+IeziZP8XI3WHjFvgBhdG5
	H6Njv+7jVNRpWjVLWfM3sVc6cZ8Ie1mgG6mjHiAbgMHh
X-Google-Smtp-Source: APBJJlEDoHZ9OXBnYU66Cxy1TDojlHLl6WDdbfWkoIWesrEDo0GdKQT0npGbjT3KKq1HPGSij9AuOBZSrvAwQZkuS40=
X-Received: by 2002:a2e:850b:0:b0:2b9:dd3b:cf44 with SMTP id
 j11-20020a2e850b000000b002b9dd3bcf44mr5253823lji.4.1690986819283; Wed, 02 Aug
 2023 07:33:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9cd5:0:b0:2b7:787:e49d with HTTP; Wed, 2 Aug 2023
 07:33:38 -0700 (PDT)
In-Reply-To: <20230802-palpitate-defection-4908b4cbd142@spud>
References: <CAPm8-H43P4WrgibV2MGNFZt7ommkchAeom4m0Kt3N-CsG6D9RA@mail.gmail.com>
 <20230802-palpitate-defection-4908b4cbd142@spud>
From: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date: Wed, 2 Aug 2023 17:33:38 +0300
Message-ID: <CAPm8-H5d_Hp0zaYh+uX6=KhB2GHGHTkaB6tu6Q82AgR4zK-4xw@mail.gmail.com>
Subject: Re: dts - linux,usable-memory
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_073341_988537_D0012068 
X-CRM114-Status: GOOD (  14.27  )
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

On 8/2/23, Conor Dooley <conor@kernel.org> wrote:
> Hey,
>
> On Wed, Aug 02, 2023 at 04:51:47PM +0300, Laurentiu-Cristian Duca wrote:
>>   my name is laurentiu-cristian duca and i am an open-source enthusiast.
>> lately i have tried to use the linux,usable-memory in the dts memory node
>> and linux freezes.
>>   if i use only reg, linux boots fine.
>>   does anybody used linux,usable-memory and can you show a working
>> example.
>>
>>   here is what i tried
>>         memory@80000000 {
>>                 device_type = "memory";
>>                 reg = <0x0 0x80000000 0x0 0x700000>;
>>                 //linux,usable-memory = <0x80000000 0x700000>;
>>         };
>
> What are you actually doing when you freeze? A normal boot? Kexec?
> What hardware is this?
> Are you using OpenSBI, and if so what version?
> What version of the kernel is this?

  linux5.13.19 with busybox minimal rootfs, bbl (berkeley boot loader),
hardware fpga board with only uart and memory 8MB
i simulate in verilator the verilog sources and i have success if the
dts has reg.
 when it freezes, i can not see any message in simulation
if you want to, i can send you the sources

  please tell me if the dts memory property is written correctly for
linux,usable-memory

thank you,
laurentiu
>
> Thanks,
> Conor.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
