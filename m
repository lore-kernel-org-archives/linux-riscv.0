Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D412C001DB
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 18:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEMQazeTR4KapOI+o4lF5homO47Y/YRTUHiyyg9QRvI=; b=qJchM3IR+ReMuO
	bXRjc5hGfjBB+NiasdvYtykRwDjTp71e4dGYKUZf9lFkClw4btDhuflSyh1n7+ca+EMdBE4DfMvCv
	bIi3OgPcehI033zTc/bYiHZFS4fP1mIfDAtV2NlsEss44kQzU/JU9J96kXvNyvobGDYBdAEbqXtoI
	4ZNxs4Xj4cwVYMOQjTY/MjajYYlcX6iCOd/Sb6StsfIemJsYDuFtVmmibNqba/2vftuW+rXhwXOXG
	KFnpHoLIy1gBUt6IJvA63v/M82Vsz18fxolRnOvwYi90BsCCjdez26JEJRKgtvBDT+05uBcRXdGpL
	NPCBnwa5apfOqIdt+IRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT56S-000QKk-0O;
	Mon, 07 Aug 2023 18:37:16 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT56O-000QJH-1I
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 18:37:14 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe0d5f719dso7975001e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Aug 2023 11:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691433419; x=1692038219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+8Yj5qVDFXyAwTzwIhUHgilERDq5+y/zb0F33+hQJss=;
        b=aC7i6pch1TzHViEGULhCEXWGI4hxO2x6M7+ndIV80XDAQwJ0tZrwKMxEKKvR9QIF0Q
         SC/zpjyjOdvLv9V5BTdm46CpIOh6ipPKDr8laEK8Hb/0MzVMDH16eyQIOLE6X3XDxoQ6
         n47m0dGkG2Bzh0oZHRyqQDLDaTlnfdDFqMtwoCcLIUmnFb+NlFlDKzCW349+3H6fFwkh
         q10K2LDvEz6z+75odwoYtFyUq4xTxKJ9IoXDo30GFHgtZI7yw2czpabwz312NZj4ft2x
         830GPizrX0eb2VfTZyAw/n8whJ6RAiHKktl27kj74swBF53oBppcCIDHW4LU0FhoZTjI
         ZQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691433419; x=1692038219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8Yj5qVDFXyAwTzwIhUHgilERDq5+y/zb0F33+hQJss=;
        b=G3Y0/b2K92f7geYoduSY9T5X9aJ7pWy+1JYj7a8vU/uhx0z1qTD592Cd8SMTIY0+of
         fOeG4/l/7L2be6+FluaDH4AVnW2Z/xoz2Z8AoZsvKq/eMaPXk/t4Z1arnnPdeKn+hZkf
         QF8Y8Zt/Dz5qf4ZbqR7S1JHNTbdQ2CHOIrMKlNtjEaZhY6oKHQq4OLUjPczW+ywKBgeW
         PChzcqQXe02A3vYOhhxJItSJRyKRfaWK/3ZzpGlbjtdwXZ5bvokM/7GusDKDIFXOT4qG
         HrvszQN51FHKh2lXAEXvg6246nYRdvFe55w/k4hyiLfgMxG3QqZTjhuEWfWsQ6EeQ3yz
         rtkQ==
X-Gm-Message-State: AOJu0Ywll3utIEJyT67jLXtvafmmqL0mmreIeBb91Br0vs+Py0FFhODF
	/9yaV9htT+taeR06vL11kpo=
X-Google-Smtp-Source: AGHT+IH3qxFu9sZKMc/iwCfmahwlUDyDWE0sqNuD9k9uePaao6ObXkQBAJPG9IeQt4jjirXZzaPEcg==
X-Received: by 2002:ac2:5e23:0:b0:4fb:7675:1c16 with SMTP id o3-20020ac25e23000000b004fb76751c16mr6284536lfg.49.1691433418994;
        Mon, 07 Aug 2023 11:36:58 -0700 (PDT)
Received: from f (cst-prg-21-219.cust.vodafone.cz. [46.135.21.219])
        by smtp.gmail.com with ESMTPSA id a25-20020a50ff19000000b0050488d1d376sm5523914edu.0.2023.08.07.11.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 11:36:58 -0700 (PDT)
Date: Mon, 7 Aug 2023 20:36:55 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: guoren@kernel.org
Cc: David.Laight@ACULAB.COM, will@kernel.org, peterz@infradead.org,
	mingo@redhat.com, longman@redhat.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2] asm-generic: ticket-lock: Optimize
 arch_spin_value_unlocked
Message-ID: <20230807183655.kbnjtvbi4jfrcrce@f>
References: <20230731023308.3748432-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731023308.3748432-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_113712_439325_969519BF 
X-CRM114-Status: GOOD (  15.54  )
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

On Sun, Jul 30, 2023 at 10:33:08PM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The arch_spin_value_unlocked would cause an unnecessary memory
> access to the contended value. Although it won't cause a significant
> performance gap in most architectures, the arch_spin_value_unlocked
> argument contains enough information. Thus, remove unnecessary
> atomic_read in arch_spin_value_unlocked().
> 
> The caller of arch_spin_value_unlocked() could benefit from this
> change. Currently, the only caller is lockref.
> 

Have you verified you are getting an extra memory access from this in
lockref? What architecture is it?

I have no opinion about the patch itself, I will note though that the
argument to the routine is *not* the actual memory-shared lockref,
instead it's something from the local copy obtained with READ_ONCE
from the real thing. So I would be surprised if the stock routine was
generating accesses to that sucker.

Nonetheless, if the patched routine adds nasty asm, that would be nice
to sort out.

FWIW on x86-64 qspinlock is used (i.e. not the stuff you are patching)
and I verified there are only 2 memory accesses -- the initial READ_ONCE
and later cmpxchg. I don't know which archs *don't* use qspinlock.

It also turns out generated asm is quite atrocious and cleaning it up
may yield a small win under more traffic. Maybe I'll see about it later
this week.

For example, disassembling lockref_put_return:
<+0>:     mov    (%rdi),%rax            <-- initial load, expected
<+3>:     mov    $0x64,%r8d
<+9>:     mov    %rax,%rdx
<+12>:    test   %eax,%eax              <-- retries loop back here
					<-- this is also the unlocked
					    check
<+14>:    jne    0xffffffff8157aba3 <lockref_put_return+67>
<+16>:    mov    %rdx,%rsi
<+19>:    mov    %edx,%edx
<+21>:    sar    $0x20,%rsi
<+25>:    lea    -0x1(%rsi),%ecx        <-- new.count--;
<+28>:    shl    $0x20,%rcx
<+32>:    or     %rcx,%rdx
<+35>:    test   %esi,%esi
<+37>:    jle    0xffffffff8157aba3 <lockref_put_return+67>
<+39>:    lock cmpxchg %rdx,(%rdi)      <-- the attempt to change
<+44>:    jne    0xffffffff8157ab9a <lockref_put_return+58>
<+46>:    shr    $0x20,%rdx
<+50>:    mov    %rdx,%rax
<+53>:    jmp    0xffffffff81af8540 <__x86_return_thunk>
<+58>:    mov    %rax,%rdx
<+61>:    sub    $0x1,%r8d              <-- retry count check
<+65>:    jne    0xffffffff8157ab6c <lockref_put_return+12> <-- go back
<+67>:    mov    $0xffffffff,%eax
<+72>:    jmp    0xffffffff81af8540 <__x86_return_thunk>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
