Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D6FE82CA0
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 14:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=uj3gMnH8vpnzmyvKRpoBfCKNw+447uFkwxkJTxZ28Vw=; b=RLYpxWnqPb5LfhcGyqAzA4qyCB
	l1XhvwQQjnkCQ+Vnvv5cu48WEZvJE1igTqUC3a6PyZkC/hn9VZ8nUI9xMgaCPg71QwKHUyu4u1V9z
	9T+mRkEexT9oXJ1NbmZ0MZURYhnc6WVSsLFFah0Owg8cFXty3qz6hDCfTZLKXozKi3i5sHpleraxU
	u5ib4NU2IElRkn+PZobGPG6IO/eNTBPOl5YbQDyTsGHzE4UxorYJhvKJCZ3q3R0CMac44LzNOqDJo
	Bw8s4vcx8bu1NKTbgesiX6ovgZQmbecBXZl1SLfbMGDYsAspUrghPAFMCTfdV5c5pgxfOfiRC95xf
	+OMKQWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVoR-001AC2-33;
	Wed, 27 Sep 2023 14:46:51 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlVoO-001AAi-23
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 14:46:50 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1c0fcbf7ae4so6912113fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695826004; x=1696430804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omvtnjTwFHylSUcgBWmwKr5GCWh6LMXMvDjr47nbvvk=;
        b=BWU86uA5ROZ/bJpTSpiYAuuFSPhRXpqyfSMb0NDPhKfNgQSMMSS3zUbE+nXqT/b3Yz
         gO8At28ZKevQwx9wa693bZviWrmjIOtWifVMAn0JEEmNusi0mgAki3fH1CClmSMSkEt1
         uUcY1vpE+2EkgEOn1QbjA8Q40LevooD+fNZVoeoj6kuoKbADe2JmSpnZLvglL3QXj7pa
         xd1mL/m9CStyJjl5xA2oGtSlofdcwDfU1Ur9FOFn1XwwzNWbwZbnHDFp2wil0mw7hv3Q
         Z1Dc5sjiwxyK0RvA62eVAVxmj/tTKVnq6J3uJJsP/KFlDFLWlD6s3SjuSH7MMsLFO/3D
         RRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695826004; x=1696430804;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omvtnjTwFHylSUcgBWmwKr5GCWh6LMXMvDjr47nbvvk=;
        b=j3C2xafqH1gRfDu8vFS0OGZSonzApPiSli7dR/Z65B6yumHpyrK5pUDjK2vBXchC9g
         4y/4qnkyWEjMWdQNrdpDbY6SixrajpNhDiFlGz/ENYc/N6AHv2NXSO7O5LZsXEO41rQO
         JDghpLHs1rgq06fzLDZI4GtjQxEaBkenGWzeujdCJS/cvB77FMmU6UN3NUmW+5VPU7UQ
         zmFs5Ef0FQjlMpUBTes/KwhqqJ6fNRvJy8o/TXcn5jDOEZeCXs7FC+19kD03nNak1eD5
         GIZhk0ICbxmv5m8GFFk4CQ0zirCQnYUPdai52F9s8pCTxGhew1FTCfqpdFfmI8a9hla2
         ZH9w==
X-Gm-Message-State: AOJu0YxRetPTmMfEy+KuK2m/vrTw0i3jsv5woqrhS1ydg1ljGYUVvYS0
	NnZXIhyDVa5fYhcszzHrJb1VqsX5cGexetcgH3OjEg==
X-Google-Smtp-Source: AGHT+IHwYkpmbFepwSLDv2uPO9OKeAgL+ivoUoYAKRJCFBr93pX2WXP/GXBdmbXlUVvxawzKB7sIog==
X-Received: by 2002:a05:6870:c195:b0:1d5:da78:5c7d with SMTP id h21-20020a056870c19500b001d5da785c7dmr2849559oad.50.1695826004322;
        Wed, 27 Sep 2023 07:46:44 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id l3-20020a639843000000b00581d45a5ac3sm2218024pgo.84.2023.09.27.07.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 07:46:43 -0700 (PDT)
Date: Wed, 27 Sep 2023 07:46:43 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Sep 2023 07:46:25 PDT (-0700)
Subject: Re: [PATCH] riscv: signal: fix sigaltstack frame size checking
In-Reply-To: <f30a4d64-c265-4f6a-94bb-632b1c07f15f@leemhuis.info>
CC: linux-riscv@lists.infradead.org, andy.chiu@sifive.com, greentime.hu@sifive.com,
  bjorn@kernel.org, prashanthsw@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, heiko@sntech.de, Conor Dooley <conor.dooley@microchip.com>,
  vincent.chen@sifive.com, mathis.salmen@matsal.de, guoren@kernel.org, abrestic@rivosinc.com,
  Vineet Gupta <vineetg@rivosinc.com>, regressions@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: regressions@leemhuis.info
Message-ID: <mhng-7799d3a1-c12a-48e9-bb5f-e0a596892d78@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_074648_918910_26024DC4 
X-CRM114-Status: GOOD (  19.51  )
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

On Mon, 25 Sep 2023 03:07:47 PDT (-0700), regressions@leemhuis.info wrote:
> On 31.08.23 23:58, Palmer Dabbelt wrote:
>>
>> On Tue, 22 Aug 2023 16:49:03 +0000, Andy Chiu wrote:
>>> The alternative stack checking in get_sigframe introduced by the Vector
>>> support is not needed and has a problem. It is not needed as we have
>>> already validate it at the beginning of the function if we are already
>>> on an altstack. If not, the size of an altstack is always validated at
>>> its allocation stage with sigaltstack_size_valid().
>>>
>>> Besides, we must only regard the size of an altstack if the handler of a
>>> signal is registered with SA_ONSTACK. So, blindly checking overflow of
>>> an altstack if sas_ss_size not equals to zero will check against wrong
>>> signal handlers if only a subset of signals are registered with
>>> SA_ONSTACK.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] riscv: signal: fix sigaltstack frame size checking
>>       https://git.kernel.org/palmer/c/d77303a57c95
>
> Just wondering: what happened to this patch, which afaics is currently
> in neither mainline nor next? Because according to
> https://bugzilla.kernel.org/show_bug.cgi?id=217923 it fixes rustc
> userspace crashes with 6.5. Was a different approach found?

We talked about this in the patchwork meeting.  I think I just dropped 
the ball somewhere -- we moved offices and then I was at the cauldron, 
so things are a bit more hectic than usual.

I got back last night and I'm still a bit out of it.  I'm going to try 
and dig whatever computer I was using out of a moving box and find the 
actual commit, as I'm kind of worried I might have lost something else 
as well.  Might not be super fast, though, as I've got stuff all over 
the place and I'm pretty much falling asleep already...

>
> Ciao, Thorsten

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
