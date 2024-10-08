Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAD9CF042B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 23:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/vwitqZyllXthwhlbTLJ0X2aNdueZ96z1EgugO8XAw=; b=TmMi1UUcOmqgY+PdHqiFy5X9XJ
	NfGZ+Qh4TSTrnIJYp4YqU7egWozU5HzPo0RF8Fk7WUtvS+friioXUVmBVJRnDINC5l6RjZ1vq8ARs
	zIgPs/lZsGYBAqTvyuRRKRBmZEDPgBm35J65qFNHpsGKsKH5WC2Jjbrkblx/vZykuPOlfp3Xxh20h
	sNPbFJpQafiUxNpHSioa4HzaW6TJeUqLL/aaR8m2WZoBuvFA6t1Nbod+SaG5WT+cE+9Mwsdmn5a4v
	9YFgZ5N1+EbIe/VCnqlFEoyoXNrI0w99rtIy5Ci2U40z+dP0K9814DVHLK+V7tM1ZSMBMUxm0chgj
	3kMKXsfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syJSk-00000007PDO-1Ivc;
	Tue, 08 Oct 2024 23:17:54 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syJSi-00000007PCe-0n1H
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 23:17:53 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so234701a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 16:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728429471; x=1729034271; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=84oqUYHHA4jnRjNWhrPRTTubksgbEji8zyCvQWhxvkk=;
        b=3C1jm2fhr2EVV6ysyVXD//kra69h0zSpSfCAOS13yyFZGrm364Jv3lR/Ru+djnDXwp
         WSqLygeUKN6CD2OJYeCi9aWzkptQd8OJlVdTLjrGcLRZ+Qdj9vqUxHNlc/NcxjRc/ymX
         xjfGqAeK0nkUQU2TYjUoTNnof69h5wJ8UyXBQil7J3vmmg7XFLGfEf59A0u/EUMlLels
         rfLFTR9VIWemIrePmIF2u4VJB6gREZBXbDIfxwblxQUalCwyJIShezOXdZyvTQn1HJk/
         QRukFK3T8UgX5rMkBmJCqu6mntD+7q/GQ6w+Yml9TWo/LyDcoqSwbenDnM0lY60mjI/s
         YqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728429471; x=1729034271;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84oqUYHHA4jnRjNWhrPRTTubksgbEji8zyCvQWhxvkk=;
        b=AXv0Kjju4g0vWeKIA3VtRP/sbGVgzLM204t+nIWTCvakC7/sZdtln7mDmSXe4WGvlT
         +IsCtlrdXKXrUy1KbTQoVzf7+3u5Qn2x17YKPPmRMlQhtVXh4HR3H1bOOkR4SQ33VQeJ
         KkD+wkq8vF4s/jz3CvqrVCOZHGBr3Ve9VC05qMmRzkSfJiI3DHk+YaJnwnPvQs+K49HU
         lazdTgEDvG1moY0iKufMKRcf43t7YbETEd6KFILOOMCfURBB6Iq+RiCMTWKfiwJ4GJ10
         TG5hBE7CFKr2Hxr/IY22kKFcUnKobgaG/gqqkatR1OaSIrOxv6p6zlOGNoVKgYq+tnTA
         AtYg==
X-Forwarded-Encrypted: i=1; AJvYcCUIFgDzTSepGunAPzfHxSr4UMUBoEOEG9zQU0r8IRUUc/UOd05oMSz+8/7j/jysM/84r1wm2ZkDX3XgZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7E0WTtmYhsBZPoJtAXDyeaIYSeJ4pnvJjjxf7B/s2iYYraZGg
	UP3jepjGi91bF2njKoTec1F+kNYpMyYPdhGmF0vAKv19z2DB7mwjiUZLFG1B7Jw=
X-Google-Smtp-Source: AGHT+IGxbclCqX1bt/+XMXoEabpsMwXOYl+1J5QNTxY9IdVlmLlwPn5SdI2aGJZaqusXEkmXDVEomQ==
X-Received: by 2002:a17:90a:d384:b0:2e2:7f8f:3ad5 with SMTP id 98e67ed59e1d1-2e27f8f3c85mr7490705a91.2.1728429470996;
        Tue, 08 Oct 2024 16:17:50 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5caa753sm140231a91.54.2024.10.08.16.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 16:17:50 -0700 (PDT)
Date: Tue, 8 Oct 2024 16:17:47 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "robh@kernel.org" <robh@kernel.org>,
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor@kernel.org" <conor@kernel.org>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"arnd@arndb.de" <arnd@arndb.de>, "bp@alien8.de" <bp@alien8.de>,
	"kees@kernel.org" <kees@kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"jim.shu@sifive.com" <jim.shu@sifive.com>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>,
	"cleger@rivosinc.com" <cleger@rivosinc.com>,
	"kito.cheng@sifive.com" <kito.cheng@sifive.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"evan@rivosinc.com" <evan@rivosinc.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"atishp@rivosinc.com" <atishp@rivosinc.com>,
	"andybnac@gmail.com" <andybnac@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>
Subject: Re: [PATCH v6 16/33] riscv/shstk: If needed allocate a new shadow
 stack on clone
Message-ID: <ZwW9m6pqcTFBovuG@debug.ba.rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-16-60d9fe073f37@rivosinc.com>
 <aa75cbd142c51b996423f18769d8b8d7ecc39081.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa75cbd142c51b996423f18769d8b8d7ecc39081.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_161752_256538_9DA8F676 
X-CRM114-Status: GOOD (  19.26  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 08, 2024 at 10:55:29PM +0000, Edgecombe, Rick P wrote:
>On Tue, 2024-10-08 at 15:36 -0700, Deepak Gupta wrote:
>> +unsigned long shstk_alloc_thread_stack(struct task_struct *tsk,
>> +					=A0=A0 const struct kernel_clone_args *args)
>> +{
>> +	unsigned long addr, size;
>> +
>> +	/* If shadow stack is not supported, return 0 */
>> +	if (!cpu_supports_shadow_stack())
>> +		return 0;
>> +
>> +	/*
>> +	 * If shadow stack is not enabled on the new thread, skip any
>> +	 * switch to a new shadow stack.
>> +	 */
>> +	if (!is_shstk_enabled(tsk))
>> +		return 0;
>> +
>> +	/*
>> +	 * For CLONE_VFORK the child will share the parents shadow stack.
>> +	 * Set base =3D 0 and size =3D 0, this is special means to track this =
state
>> +	 * so the freeing logic run for child knows to leave it alone.
>> +	 */
>> +	if (args->flags & CLONE_VFORK) {
>> +		set_shstk_base(tsk, 0, 0);
>> +		return 0;
>> +	}
>> +
>> +	/*
>> +	 * For !CLONE_VM the child will use a copy of the parents shadow
>> +	 * stack.
>> +	 */
>> +	if (!(args->flags & CLONE_VM))
>> +		return 0;
>> +
>> +	/*
>> +	 * reaching here means, CLONE_VM was specified and thus a separate sha=
dow
>> +	 * stack is needed for new cloned thread. Note: below allocation is ha=
ppening
>> +	 * using current mm.
>> +	 */
>> +	size =3D calc_shstk_size(args->stack_size);
>> +	addr =3D allocate_shadow_stack(0, size, 0, false);
>> +	if (IS_ERR_VALUE(addr))
>> +		return addr;
>> +
>> +	set_shstk_base(tsk, addr, size);
>> +
>> +	return addr + size;
>> +}
>
>A lot of this patch and the previous one is similar to x86's and arm's. It=
 great
>that we can have consistency around this behavior.
>
>There might be enough consistency to refactor some of the arch code into a
>kernel/shstk.c.
>
>Should we try?

Yeah you're right. Honestly, I've been shameless in adapting most of the fl=
ows
from x86 `shstk.c` for risc-v. So thank you for that.

Now that we've `ARCH_HAS_USER_SHADOW_STACK` part of multiple patch series (=
riscv
shadowstack, clone3 and I think arm64 gcs series as well). It's probably the
appropriate time to find common grounds.

This is what I suggest

- move most of the common/arch agnostic shadow stack stuff in kernel/shstk.c
   This gets part of compile if `ARCH_HAS_USER_SHADOW_STACK` is enabled/sel=
ected.

- allow arch specific branch out guard checks for "if cpu supports", "is sh=
adow stack
   enabled on the task_struct" (I expect each arch layout of task_struct wi=
ll be
   different, no point finding common ground there), etc.

I think it's worth a try. =

If you already don't have patches, I'll spend some time to see what it take=
s to
converge in my next version. If I end up into some roadblock, will use this=
 thread
for further discussion.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
