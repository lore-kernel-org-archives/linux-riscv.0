Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34F8D3C533
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 21:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=oFvIgTM78RbHELw6sAfpdkLtITbai0i+Y3ij3LxGuB4=; b=Sk4S/GV6pXLUCdPn1e1ZWMg379
	WnLEGfZ5PQH26eYJrJv6nGSfwgE/HHULb9uyWvmBfFNsZlLEbIDbITr8Zf+isT6PPYs6lHp1nmyxq
	QIAGmA/02KKCqo7mBdqfaytlG0vs8ZNhD68PY5zvHBpDbSEIylzosubLecq8SCoE9u0zO+i+BSEIl
	nU+udjMDGClrvYzRX4jKwTo2by4u3eUz09bUqfNtSfB+NZhbo7JdEnLJmu++2QKiHihuXrX2y9SOs
	sU9sXk/VxXsptxY99u/CJMw0adpa8tt4rCooyaNTcHdt03OZUcavt3lf1Vovik775FKJTlfGJHDy1
	R0obLvhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1YNW-0000000GHLo-0PXQ;
	Thu, 17 Oct 2024 21:49:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1YNS-0000000GHKF-2rzS
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 21:49:52 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71e5a1c9071so1137470b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 14:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1729201790; x=1729806590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lu/dxnXAMTzuUeZdFobyXdEI/zCxHQSZLPRWhAzrc2c=;
        b=XOXKJ3OVEnjYy5SPCdEglUlTo0ao8aKTDU/uAsDb3mncAqVA/3PpiudMvJKV8cmcx5
         96lx8tb3TLLVZnH53Y67GHnNSGeL4bz/kPHEg4pXdjoP30SKdRnvcKFRwTvhS2IgJTeJ
         bfwqAXSQZBY7riiT4E6NrfrLWGMCd5sI/p01Nc/XFV4p54duFF7AozAUZKs0zc7AafhS
         rbQKQMLZEavsH/a+AR19Gk1a03UJ+i4InsN8+Kwep/43rKZEriLIpKqne2roP2wDGz41
         4pXf9sdfTIfKT6kLK2TMoXqDvS222vA89IE3RWRxeqJOqEQel3JlQt+4mapDdAyT2gH+
         J/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729201790; x=1729806590;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu/dxnXAMTzuUeZdFobyXdEI/zCxHQSZLPRWhAzrc2c=;
        b=v4TxTPgPpdZNzq95K+Am1Jqs+dqAXMHDPC5Ok8Xjscae6ejVEiBn5LvEanZVVXsFun
         yytq5oI+kQwlaS8ITHqpCNsJc0reh8Bkdo1So/QIoIzBUvxnMwDj3yjzARRdv4rica19
         lcozGQi3OYp6s9/H0gbywQpCyrr/u43T8I8/ZbzWwHYEuGP/AbvcVtz1xD5sby2duaNH
         1MSuCfJOFmfSSfOsrsENwkUAbon8kIj8nav74zKQ6rK8tiLgiAW7UaATgAJWDQR77WRW
         D+2eEcY5YZw1Jb/krNdEUCIfdaDRbnZXs1F6ucv1SdqJDifmP58aLoE/eXleTqiLB3SA
         8PsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlDIvR/2Ytk+KA9j7sg2PJ9g/nNCz7YqMpwC+VDwiDGXWYrwVEm/T8oLaAIFOyq58m5txIcJstXoczjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiBFM1RmtoPLONAb1SaSyFdW22qohatjw/7USf5botwEzWiQNy
	nbUOMY/Gre/40VhUBUk5XT8Vji3m18m80uiWIqQ/iyepzbohOOQAKVpchqL+0iE=
X-Google-Smtp-Source: AGHT+IGmY3bCaEMXb29cCY6tmaZsUZCoNqD8MeKKY+vFnpDezuSI2SqDrji03CqXJjFB8/1kPsAZ+w==
X-Received: by 2002:a05:6a21:114d:b0:1d9:2c23:66ff with SMTP id adf61e73a8af0-1d92c4ba7aemr371347637.5.1729201789678;
        Thu, 17 Oct 2024 14:49:49 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc28baa6sm80732a12.73.2024.10.17.14.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 14:49:49 -0700 (PDT)
Date: Thu, 17 Oct 2024 14:49:49 -0700 (PDT)
X-Google-Original-Date: Thu, 17 Oct 2024 14:49:46 PDT (-0700)
Subject: Re: [PATCH 3/3] riscv: add PREEMPT_LAZY support
In-Reply-To: <20241009130530.2Sv2p0Eo@linutronix.de>
CC: peterz@infradead.org, linux-trace-kernel@vger.kernel.org,
  linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@kernel.org, juri.lelli@redhat.com,
  vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
  mgorman@suse.de, vschneid@redhat.com, ankur.a.arora@oracle.com, efault@gmx.de,
  mhiramat@kernel.org, mathieu.desnoyers@efficios.com, jszhang@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bigeasy@linutronix.de
Message-ID: <mhng-02463d30-c55e-41a9-beae-ac4cdff9fc9f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_144951_137711_C80BBA98 
X-CRM114-Status: GOOD (  13.36  )
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

On Wed, 09 Oct 2024 06:05:30 PDT (-0700), bigeasy@linutronix.de wrote:
> On 2024-10-09 15:03:07 [+0200], Peter Zijlstra wrote:
>> > diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
>> > index 9c10fb180f438..8b5a5ddea4293 100644
>> > --- a/arch/riscv/include/asm/thread_info.h
>> > +++ b/arch/riscv/include/asm/thread_info.h
>> > @@ -107,6 +107,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
>> >   * - pending work-to-be-done flags are in lowest half-word
>> >   * - other flags in upper half-word(s)
>> >   */
>> > +#define TIF_NEED_RESCHED_LAZY	0       /* Lazy rescheduling needed */
>> >  #define TIF_NOTIFY_RESUME	1	/* callback before returning to user */
>> >  #define TIF_SIGPENDING		2	/* signal pending */
>> >  #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
>>
>> So for x86 I shuffled the flags around to have the two NEED_RESCHED ones
>> side-by-side. Not strictly required ofcourse, but...
>
> I can shuffle them. I don't think the riscv camp will complain (saying
> this for them to actual complain if so).

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
