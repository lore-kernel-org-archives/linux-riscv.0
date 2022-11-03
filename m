Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36897C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 17:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4JB+cA6t8luwE/WMVcxzuCPuEkcqUduCebePNwdo2M=; b=eqZJQU5xwaPeYi
	JqCbFuM4R7zaR+YT4b0a0crOTE01h2mWuLoHhO4/x0RkRcYOFNQL10bYqsTs/xJ8AWEyeGsmq0knW
	0MQcHdeRX+KMh1a/5N4v6l0ieif5t5Wfh1j1o1XkNrt+yuDpVF6yisHAOqpxeikYuTHgOAhiSXGym
	G2MRUoYcSEFFBRIIvtNxUlJdTZtC/TYpOUcNuwqPf0AMWaFroXZKwJkJgbrp/ywZOK+tPQBBXmv/V
	vu+QURMCkTxUAyWDInHs/NYJ7PrMeKLeAvqtFqM9ss6N8sc1vnB5mvSO99Ih9Gp4UOCjkJRZazVbp
	mRIWSD+JkOO9cDs67umA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqeGX-00179n-G7; Thu, 03 Nov 2022 17:44:33 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqeGV-00179S-8S
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 17:44:32 +0000
Received: by mail-qk1-x729.google.com with SMTP id z1so1622573qkl.9
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mA1Z7Cm83w+Vyx+oBgGwMaOfCfLAZylXYXAtJ1Raiz8=;
        b=dod+VUiBUEq1hk72lAssa/ES6lzBPt/3grGL93+x6xqazqzSesxF5gOoKjy5hsuBii
         dpyo6KG7QmoqhIT3bctyKBZuOrbntQ/3KSRaUa+QlclegAP50WUv80YibEtoQqHjPJB6
         Uu61/FFf2iArbTLONCqSdQPP9r8phlQw2FnrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mA1Z7Cm83w+Vyx+oBgGwMaOfCfLAZylXYXAtJ1Raiz8=;
        b=edC4lFT1d4hBK79PIu2pwYymDXo8RkVcGOLNALL/aWu0NlrczDAWYx2xdLnkuo0dPo
         Um/gl8abZtqh2zT+b4QTqnCa2vsEuK/3GD2c8flwlHSY9IWoWTYH//80OvfP1yxgB0wo
         W7KfE926qNNWZlBQWwCVnO0UBUcrU6LZV2F5ZTCPPQ16wuEY+aocR8qLPr9hdYEXMhQM
         /sjnYKqq2kxywwSwCZq0iMF3bQa/45yVoo46KEFDQsDnW2Yebn9juQjHV22eSwnYZJ/o
         vYalOFkl76bfySio5B2SsPB5vDQ68bzUEFFyNUFqQ06tINCk1yhsJIrdR6tMjEViySRl
         gBqw==
X-Gm-Message-State: ACrzQf2rgMKlUYdFWZ2oK4ZY3UW7N7L76xhhfda0iuyNT9MxqWBLNjPD
	mumN4Ds7ZGU9uqab4FI22f8X8uWevJI8vA==
X-Google-Smtp-Source: AMsMyM5IpmetbjBmH5IvEH+Vx13Ueb6xqFgzRZvJnHJvqNKC8AwZI5HL/aWs0OMlOmKrLvl7jejRWg==
X-Received: by 2002:a05:620a:448e:b0:6ce:8dd2:bc46 with SMTP id x14-20020a05620a448e00b006ce8dd2bc46mr23999717qkp.705.1667497469641;
        Thu, 03 Nov 2022 10:44:29 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id o24-20020a05620a229800b006eeaf9160d6sm199456qkh.24.2022.11.03.10.44.28
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 10:44:28 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-3704852322fso22422877b3.8
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 10:44:28 -0700 (PDT)
X-Received: by 2002:a81:8241:0:b0:370:5fad:47f0 with SMTP id
 s62-20020a818241000000b003705fad47f0mr22362989ywf.441.1667497468069; Thu, 03
 Nov 2022 10:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <87o7tossaa.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o7tossaa.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Nov 2022 10:44:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh87aGtg3eJPkA31V0Pn22hah0DWRc8oWsQ__5P2SXaTw@mail.gmail.com>
Message-ID: <CAHk-=wh87aGtg3eJPkA31V0Pn22hah0DWRc8oWsQ__5P2SXaTw@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-4 tag
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	schwab@linux-m68k.org, palmer@dabbelt.com, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_104431_350979_9693A2DA 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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

On Wed, Nov 2, 2022 at 7:09 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>  - Fix an endian thinko in the asm-generic compat_arg_u64() which led to syscall arguments
>    being swapped for some compat syscalls.

Am I mis-reading this, or did this bug (introduced in this merge
window by commit 43d5de2b67d7 "asm-generic: compat: Support BE for
long long args in 32-bit ABIs") break *every* architecture?

And people just didn't scream, because 32-bit code has just become so rare?

Or is it just because those compat macros are effectively not used
elsewhere, and x86 has its own versions? Looks like possibly mainly
RISC-V?

Side note: why is it doing

        #ifndef compat_arg_u64

at all? That macro is not actually defined anywhere else, so that
#ifdef seems to be just confused.

                 Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
