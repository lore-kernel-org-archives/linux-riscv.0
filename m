Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD472C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:47:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877D461989
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 05:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 877D461989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=K7n7MH7g3inVjBrA08Co1FiF0d/ZughWuVg9jznC2SU=; b=OY437+raO+13M3gXRGut77Q+g
	i7EOoRWYxY4ica83wU7KIB9VN8tk5tTiLGcGETM6Y91O2/gClG+VfAsZesEadNND3Jwsse8nmTjV2
	E0q9VckiubXKZdA5JZX9NjvzvLYwe1bKkJRkfSiZutiyW/jxiXqgST9ay3HD3ayUGG4tVFMBSxjXe
	eWukOVlscjXczhUiwqobO5HTliR3/pHe6coC6FZIhNEQDvwrSa3faDQomEkPGwKVW/aAtO/h4CAdD
	SsBwNUK3mZHdDZ5LKviJNf1HNx2MhbAVunywBtNfbpZBQWrxZnmA8kTk4GO4AoCPfkSO4i9wx653O
	BOU3fyhfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR7E2-002msK-3O; Tue, 30 Mar 2021 05:47:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR7Dw-002mr2-PR
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 05:47:35 +0000
Received: by mail-pl1-x630.google.com with SMTP id g10so5572363plt.8
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 22:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fsxSu2+ndgLCeGgepTuJkVxKJNHJTpGkhzlK+c730GU=;
 b=fE/ZZGsAQ6HGwEG8CTjbdh3bpJ43vEs+QfFzTWBwEwR/tbYREd2GQYyER8210Mog07
 QJK3HlUwKsLtLFZ2phJRcWo3oeBZl7zefFkk2MtPfEtP/EkZStkvnMQLhVOWB+OWa5nF
 B4qNhE88bUj+AcAR8bzSwpd02+vXhQbNWp8X5EhUH92So/yv1EjJSZ0iZ3m84PsagERY
 dSlm4eFh8VPf1OlJ8byqSTcCJWmyTwbqQZNiMkhA92F9SPxU1UDLFrGFk5M3rEmzOwTR
 TAZNHJgMbXumBS5BV/MZllC1FB6/ID0nN24Ble98bUaEm4jXOX/eDwJP3OjHWr0a7Puk
 o1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fsxSu2+ndgLCeGgepTuJkVxKJNHJTpGkhzlK+c730GU=;
 b=icQQMObymZ4TD/OtXWWgKu70epczvai/7LL4NXpyKmv3o/IjxI4wDZUSnxVnoRYwJx
 Uh6MqMBne0jeUQydh9xDlZfI6DJhObWXtnCJdP1D/W3uQupVF4Ko1frds7SCt+oilsS4
 WDOKLqaMlnEVqMEADVO5lBSmpv2+rZUFiYkrHCqiSaq6KlZJx81MLKCymAHafyiQ16Dx
 lHmFfT+K2yKjlu1xRdE86b/SYtpS9v1AVuNmhwwlgQRTTHDo+u66RlAXDjW4BWFp3TBC
 FhTHAycZwX570kloH+br7DaFqyXoUDUnfLQmXj2HF/hvlasdnMta6l/u1XqgmO0DwGVk
 VltA==
X-Gm-Message-State: AOAM532aKTZQhcYuhe1WWh6GaJ7Q03GrLPN7xXomzkqzTckAqTEr8tFw
 HvPKy679b77BXu03o+YGxAA4FMYy1pg/VQ==
X-Google-Smtp-Source: ABdhPJwTcjQehZFqJ8ADWyVr6hqZ2uSDuviPFsgGcjiuIAZJ/dNM0IBYUyFlJBG+w5WhB2k6gB5zvA==
X-Received: by 2002:a17:902:e5c8:b029:e4:c22d:4da6 with SMTP id
 u8-20020a170902e5c8b02900e4c22d4da6mr32407906plf.10.1617083251002; 
 Mon, 29 Mar 2021 22:47:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k64sm18620755pgk.23.2021.03.29.22.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 22:47:30 -0700 (PDT)
Date: Mon, 29 Mar 2021 22:47:30 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Mar 2021 22:46:35 PDT (-0700)
Subject: Re: [PATCH v4] riscv: evaluate put_user() arg before enabling user
 access
In-Reply-To: <20210329095749.998940-1-ben.dooks@codethink.co.uk>
CC: linux-riscv@lists.infradead.org, javier.jardon@codethink.co.uk,
 kejia.hu@codethink.co.uk, ben.dooks@codethink.co.uk,
 syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com,
 Arnd Bergmann <arnd@arndb.de>, schwab@linux-m68k.org, dvyukov@google.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, alex@ghiti.fr,
 linux-kernel@lists.codethink.co.uk
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ben.dooks@codethink.co.uk
Message-ID: <mhng-3ecad305-7902-4715-a1f3-20534c101bea@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_064733_747802_03C76F59 
X-CRM114-Status: GOOD (  19.92  )
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

On Mon, 29 Mar 2021 02:57:49 PDT (-0700), ben.dooks@codethink.co.uk wrote:
> The <asm/uaccess.h> header has a problem with put_user(a, ptr) if
> the 'a' is not a simple variable, such as a function. This can lead
> to the compiler producing code as so:
>
> 1:	enable_user_access()
> 2:	evaluate 'a' into register 'r'
> 3:	put 'r' to 'ptr'
> 4:	disable_user_acess()
>
> The issue is that 'a' is now being evaluated with the user memory
> protections disabled. So we try and force the evaulation by assigning
> 'x' to __val at the start, and hoping the compiler barriers in
>  enable_user_access() do the job of ordering step 2 before step 1.
>
> This has shown up in a bug where 'a' sleeps and thus schedules out
> and loses the SR_SUM flag. This isn't sufficient to fully fix, but
> should reduce the window of opportunity. The first instance of this
> we found is in scheudle_tail() where the code does:
>
> $ less -N kernel/sched/core.c
>
> 4263  if (current->set_child_tid)
> 4264         put_user(task_pid_vnr(current), current->set_child_tid);
>
> Here, the task_pid_vnr(current) is called within the block that has
> enabled the user memory access. This can be made worse with KASAN
> which makes task_pid_vnr() a rather large call with plenty of
> opportunity to sleep.
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
> Suggested-by: Arnd Bergman <arnd@arndb.de>

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
