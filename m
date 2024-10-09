Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64EFCEE336
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=A7ozTQvxYmfSLXOPNFOiOmD5D4OJmw3WF9HIt5NuS5A=; b=BrjxwlIPVDBSXNBZm4be+E2slV
	LXjTg9xDuhOMH3RDt6wDQmVccGTXcYL/gke10dYqVGO7vvDGv3y8Qmo/ALvyWEva98CuGZQqyI6mJ
	ODPvixez33HYZrpURKSd0Ce6XwsR5Lize6zaKJDg6IlnxgesSsHVsVX3Gh2NhqLsMo73m650WfFG6
	hN827GLXp+rs9MvW6uwg/hIVrTB5r+34YRdVTOv2tv4NjwBv8tzJ+QhgY7b1rh3NRnRHkcS7nSRw5
	MEQKMh+zqkX5wo20gNXYa8o/tx2/M/+YdxVa80J3TgdIwi9RI+c/cgzHNIU/wghrlrVTpceY/U4C6
	OMaiejzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syaVm-0000000AAzA-2dQL;
	Wed, 09 Oct 2024 17:30:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZoB-0000000A2tN-2CxM
	for linux-riscv@bombadil.infradead.org;
	Wed, 09 Oct 2024 16:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=nYDkPIyO5e7pPYqNdXupJmuYO9zC4Hxiz8OIhsrkQ5k=; b=YqDbv3FPaAb/hjDRn1WZUUvDJT
	q3lilJZ1bR7hxY5UfGouu1K69gYZKD7LrUwVqtbvX2MMYfxHIVeGvfcs8yhEpGnpK2u5jc8y+4hUP
	otuhNsz4iUNVQ9ApnDwVz8SMEgKwa7cNkGC42FVYVik2ohtgZhN0d4zOdWjVLTyj/Zi+CfMHaf2Q6
	5oFZYGCvFUqQmafqkgk7r6o93yqZEM1SOXso3gY1PHB7PcKcV1SoHrO17QMnfBrvQ9JFZFjSme631
	1cT9xlNsEpDZpgP3djsMS9aXxMyRllAAt8dLfA900K/5H5M0wtz7d9BntquxG67AegvThZ7S8KLx6
	P8Cr0ncQ==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZo8-000000052sV-0ZjG
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 16:45:06 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20c544d345cso99955ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1728492301; x=1729097101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYDkPIyO5e7pPYqNdXupJmuYO9zC4Hxiz8OIhsrkQ5k=;
        b=e+lIQc/+OnhvhkWoExESi4jlqegcrsA4IzBVrE4AqI00q+UuYcFFBeCJit+2M9t2EX
         bdvsBy803lt9c9rPbPv8MTHDV/Ygn1IHYYLiJxulYmU9lG9D0SwLIbBswygI+B/aewMa
         SHtWa7kQAF3MBASLTXKhWx2LeG5J0uFdHU/kBbm0fLhqBsQFtKbROo41qxgMW/YiWDPr
         B63dqobCU93Wj291Tr22LdeDP/zHj5QCQwpQD56ZfRN2YoNw11nbQTdMKXPZeGVHKzE+
         bURl5gMVn9PvrOsLeUJKzljgToJN0hJ1lvBXAIexGooSvib6zORrJDg5WLTbmlgBukgA
         aRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728492301; x=1729097101;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYDkPIyO5e7pPYqNdXupJmuYO9zC4Hxiz8OIhsrkQ5k=;
        b=mo3daDPDe1NN+hdoQnAdrlNNs0TlLQ62eYoXdbjsXgZS5E3/GX3FV3JlNSouXzjzPx
         knCXv/J8MZAdLSByefnP4YvWm7KI2052w5mwNiJ9Lrqks5+TE17ZHc2Jzu087gV97gnJ
         VgeH1c9rVU+OvjGN9itZjODvd+JCbN4OMv758s0QgFeEhn9yuHsjoufwJXGc79HmnnsO
         A7lgzEv1zH0LgPUiHc9Y9wrCEBPSht4RA0kjX0LQqUipFxygVlp5zFzqGXp70TTalWBc
         svldW531GhUSbAQwnyCPwLYv+7G0Tk3JgwrZN8eIbGZGjdyCfVu8Mzial+0YCjFcAHa/
         vYKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd5YqWcTsLxPjSthJuTdVfZsyjgIwzJyV9JACzthG5WN3aGbCUPlTwJXhr80fkZ4f61tVpTDHf5x2Fcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEReg/3Z1BpGPLitlE1eG2SlNKWA4N1Xld5oW/GOa0XpymK1Vw
	ApPUioslwG5cu28TGwGZvNKvheslFXHfwgjWBfAq0HEbr79WJ0ri5Jz3tJ6joL8=
X-Google-Smtp-Source: AGHT+IEem2fBzcCqAqcfXJrDn5xc82NZIBAdjPT/4BAATxAitaIQIj2ulJn/HqNtN9vHeV0FBTgZzw==
X-Received: by 2002:a17:902:f686:b0:20c:5ffe:3ef1 with SMTP id d9443c01a7336-20c804faeccmr4291235ad.17.1728492300683;
        Wed, 09 Oct 2024 09:45:00 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c78e2b33csm5549785ad.285.2024.10.09.09.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 09:44:59 -0700 (PDT)
Date: Wed, 09 Oct 2024 09:44:59 -0700 (PDT)
X-Google-Original-Date: Wed, 09 Oct 2024 09:44:57 PDT (-0700)
Subject: Re: [PATCH 3/3] riscv: Allow to enable PREEMPT_RT.
In-Reply-To: <mhng-64eec780-df98-4e8d-bf6c-0aa07a8d85da@palmer-ri-x1c9>
CC: bigeasy@linutronix.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org, hpa@zytor.com,
  aou@eecs.berkeley.edu, bp@alien8.de, Catalin Marinas <catalin.marinas@arm.com>, williams@redhat.com,
  dave.hansen@linux.intel.com, mingo@redhat.com, john.ogness@linutronix.de,
  Paul Walmsley <paul.walmsley@sifive.com>, pmladek@suse.com, senozhatsky@chromium.org, rostedt@goodmis.org,
  Will Deacon <will@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: namcao@linutronix.de
Message-ID: <mhng-f0f516a0-6774-4c87-b8da-313601bad133@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_174504_461296_D99F6E6E 
X-CRM114-Status: GOOD (  18.23  )
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

On Fri, 06 Sep 2024 11:48:03 PDT (-0700), Palmer Dabbelt wrote:
> On Fri, 06 Sep 2024 08:13:24 PDT (-0700), namcao@linutronix.de wrote:
>> On Fri, Sep 06, 2024 at 12:59:06PM +0200, Sebastian Andrzej Siewior wrote:
>>> It is really time.
>>>
>>> riscv has all the required architecture related changes, that have been
>>> identified over time, in order to enable PREEMPT_RT. With the recent
>>> printk changes, the last known road block has been addressed.
>>>
>>> Allow to enable PREEMPT_RT on riscv.
>>>
>>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>
>> With the printk patches applied:
>>
>> Tested-by: Nam Cao <namcao@linutronix.de> # Visionfive 2
>
>
> Thanks.  LMK if you guys want me to take this through the RISC-V tree,
> but no big deal if you want it somewhere else -- and if there's some
> dependencies already going in through some sort of RT tree maybe that's
> just easier.  So
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> I don't have a test setup yet, but I figure it's a new feature so I'll
> just flip it on as a config post-rc1.  Presumably this just works in the
> QEMU virt board, or is there some wizardry I'll need to copy?

and it breaks my boot test script.  Looks like it's actually working 
mostly fine, I'm just not getting the "reboot: System halted" message 
that I'm checking for to make sure the system actually went down 
cleanly.

I'm not sure if this is expected behavior in RT land, or if we've got 
some sort of bug.  It sort of smells like we're losing the last printk() 
line...

>
>> Best regards,
>> Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
