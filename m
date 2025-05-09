Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0412AC3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 18:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=B6RuFD2ysGuG/Okg5isZlEoDbfdRQo0dy9sR8hfvLFM=; b=Eg90YAM/8MpGEZ85l4ltHAZTtp
	nRIFv+qcf3CihnnzwKZE/qqvNFR/pRK2G2Bl06WzJsDscfrkz/0pIq4QXYXwgESjHZ3M+CK3qYoEp
	IZBj8L+92X6ASHdMASpudYIwYR99oLUmIVXgiev9acIJYX9CCglXlfoxcPxHWvKIYuNqviBQbAUWs
	f60pLS1OBTRvkdKKWtifmjTKgY5kbSl+Qv+dCaRdzR46yFYMX6GipiLHOtBcLWgBkwUoqswaypKLR
	Cva/5MtFysAF9z7ygpUorEnEzssP9+nWKNYZ/sXPzY4LXU6PPvOWBjacGq8Lx9aD6nP9MMVPlNqwX
	26j1kPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSNN-00000004Yoa-2zEH;
	Fri, 09 May 2025 18:23:13 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQIN-00000004EDk-3HqR
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 16:09:57 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7376dd56eccso2493529b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 09:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746806995; x=1747411795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnWvRvLBiox5Bz9Lyem6f8SVAf49ycnR85XD0lPPJ4k=;
        b=W1oDGb1xzkFBz/LX1PsCKtM5DuVpiboBpdmPvP4+34OVzNLlNAjA+a3f+Ds/F9PCxK
         LJf7Uy8tepGA0TldrjGhGylJnX94T7RH9zQVt0H2ypj5RbbR4MZKLzKYYKviBj96HIGu
         0JSv9qirJZw9xTl4UVKAFNlTMIcXEOp02pHgIOdMZNBIdau6D/nWPf9YqUb9iUdftl+f
         lEj8J1uYulnZidQ4jMKldAfDZCC2C8I/tbRkbznZNQCQCgT/NaTVeRnlPTdDTNvC0zoW
         nYyc6oiRBNCNqIo/fdSd6eogfXGzmKP/FVwoKeQjBlXDPaLPnjX9DYss7WHGEIA7d/MM
         83sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806995; x=1747411795;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnWvRvLBiox5Bz9Lyem6f8SVAf49ycnR85XD0lPPJ4k=;
        b=WSaU57yyAad3c9DQg9mxTWkyv6YlpzZzUQ9CRbMj2Ts/nT5pM+/MuIXfQ6HYZFQuRP
         r7FzVRZd2E44nuCA+4EQlgKga4hHo9iHJX45XxOmqrRgxlYFdI2yB2BaB7rv+Wzv44jH
         G/6kKg8BHDinyzMraPdlKN7my5vAS29JfB1sdB6jAmDuhD4+ncQvFNP0cth0uSlJqiKq
         /32cE832hZjfgvOaZ2pF/74aanv30QbTpYe5t8cosApupWlO+x+u4MxST9arNC1CMbZP
         /ODxrKx7ixVxW1OqKoKIZwLI5vpPU0x95DQIXUw7sgqwypP7aUuDuhOWRqpBd+e/g5ao
         z6YA==
X-Forwarded-Encrypted: i=1; AJvYcCUxPkUVTbB+wtsuqk0XqnNh93LJh5R9yybiCz6LAb3Sg2L2cNHFPzlNjiZNQmxm1GW44bSfpo+CK+zfkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzA1Ev+O4us+RXFcNf7Ehl0PTSBndJyrLvgzvuDarC+7s4Luhs1
	j/V/rLOg8ba8ij6U2kK8Nd1dMLNbsOvh1PBKrMzt/DXpwkDV/zGvpRWmVrA/hzI=
X-Gm-Gg: ASbGncsIalFyNk3bpaW2VczI/dnN+ljmo9ofS9wJBsnrEXBZeRv3rjGeD559b1pe06C
	ZdAuXRMBAjfsG7rK6GfOD5jIaNPOZLSThOPyI4EQnOtyVeYgeu+xIfN+O2FLdQM8xDIQ+JJBbjc
	c0USNQU4wUXZiNdgyFgsiPutJ59BaS+nqPBV6uT8VwLQ5dlTaRxvaJCt70D7TH1b0OC3f6Q6Gq+
	NGgD+Lc6mHl4CnoX48wA7vh15Jas+lSXrGDO2rpa7GD1flVlqhTSYSmMwyePBYsmkctz39XOc9t
	7GcfQ0DkFeUyacF+vmfWCBKyxWpE/b5oRw==
X-Google-Smtp-Source: AGHT+IEaZucBNObFCPlL+hxe0V/lS5+Y6rCoZP8rip8WDQP4X8PU+EirWpJnUHe7qNQ+TAoVPn0hPg==
X-Received: by 2002:a05:6a00:f0b:b0:737:6fdf:bb69 with SMTP id d2e1a72fcca58-7423be92b53mr5075987b3a.13.1746806994709;
        Fri, 09 May 2025 09:09:54 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3cfeasm1935720b3a.140.2025.05.09.09.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:09:54 -0700 (PDT)
Date: Fri, 09 May 2025 09:09:54 -0700 (PDT)
X-Google-Original-Date: Fri, 09 May 2025 09:09:50 PDT (-0700)
Subject: Re: [PATCH] riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm
In-Reply-To: <20250507180811.3CKhxtu0@linutronix.de>
CC: samuel.holland@sifive.com, alex@ghiti.fr, linux-riscv@lists.infradead.org,
  aou@eecs.berkeley.edu, bodonnel@redhat.com, Charlie Jenkins <charlie@rivosinc.com>,
  Conor Dooley <conor.dooley@microchip.com>, joel.granados@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  cuiyunhui@bytedance.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: namcao@linutronix.de
Message-ID: <mhng-4654dddb-920a-456b-8fc9-2caaa80c4781@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_090956_086420_0BBC2870 
X-CRM114-Status: GOOD (  24.81  )
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

On Wed, 07 May 2025 11:08:11 PDT (-0700), namcao@linutronix.de wrote:
> On Wed, May 07, 2025 at 07:52:18AM -0700, Samuel Holland wrote:
>> When the prctl() interface for pointer masking was added, it did not
>> check that the pointer masking ISA extension was supported, only the
>> individual submodes. Userspace could still attempt to disable pointer
>> masking and query the pointer masking state. commit 81de1afb2dd1
>> ("riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL") disallowed
>> the former, as the senvcfg write could crash on older systems.
>> PR_GET_TAGGED_ADDR_CTRL state does not crash, because it reads only
>> kernel-internal state and not senvcfg, but it should still be disallowed
>> for consistency.

We talked some in the patchwork meeting about returning success for the 
flavors of this that could be emulated in the kernel without hardware 
support (ie, disabling pointer masking on systems that don't have it is 
trivial).  The general consensus is that didn't really help any, as 
userspace still needs to deal with systems where these will fail (old 
kernels, Kconfig disabled, etc).

Happy to reconsider that if someone cares.  Either way this is going up 
as a fix, as it just keeps the interface sane when taking 7f1c3de1370b 
("riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm") into account.

>> Fixes: 09d6775f503b ("riscv: Add support for userspace pointer masking")
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>>  arch/riscv/kernel/process.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>> index 7c244de77180..f7a1a887ae68 100644
>> --- a/arch/riscv/kernel/process.c
>> +++ b/arch/riscv/kernel/process.c
>> @@ -330,6 +330,9 @@ long get_tagged_addr_ctrl(struct task_struct *task)
>>  	struct thread_info *ti = task_thread_info(task);
>>  	long ret = 0;
>>
>> +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
>> +		return -EINVAL;
>> +
>>  	if (is_compat_thread(ti))
>>  		return -EINVAL;
>
> I think this matches what the man page says:
>
> "If the arguments are invalid or this feature is disabled or unsupported by
> the kernel, the call fails with EINVAL"

Ya, it's also what we do when the Kconfig is disabled so it seems like 
the way to go (we talked about that some too).

> Reviewed-by: Nam Cao <namcao@linutronix.de>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
