Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941F9C77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 20:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZmxkitxtsjWvyx1yk1EZE20TUY+YaCtqpJBc1L13Gts=; b=YAkehdPIJX9eWhK/0eS2ypaw9g
	S9CRN/jaawR+QZ8bs2pNxrbEi/zOemcSfOuUuP4YbUvphdFteMCY5zSnh65/HLweSNc0+mebOpdey
	Dm3icvBGSitn+nteELAvPC0/dt1Ia+MCkXwM8rGj0bBd5DJp1DJUrOMAicOGhLzGx4M6ZJ8EYMHPz
	aS0K2+8EqhzwFZkcpGI7HTWlKwhNPT0X/kUNl+b9BjgLaFUGkVJuyqM/6hqb7nvSMALnC6fJOTOqS
	Xui45q60SN9N3APyIsURKkSoPwoE0hIdUbN1qeXScWeKZdm0//rrK+++NxRuo/AM2ufcpmw2b3jez
	0pvNUyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psr3w-00D6bV-2z;
	Sat, 29 Apr 2023 20:20:56 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psr3u-00D6bA-1j
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 20:20:55 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-246eebbde1cso1170324a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 13:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682799653; x=1685391653;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eT6Iosx0mXfdelnB+/awy2djLbdEQHSWYwF0l6D7UZk=;
        b=ECOq4apJvbMRfpWybGzzN8N3SQxb+4g3QZ5Ja3lycK6jef0tEat0EPoSm+c5Rl2HQZ
         7M/5vLkgGavbRBNI/Iph1n9oWKXV68c0zRBv/DfNjXL/GpZpy4RmZH/Zl8PQf9bLz8zn
         y6NfIlL5q35D9/JLi7IjUhXukABkG0GPFnHJJPnMg1xpwv0WoRV0MMF09L5WXl1w+pWw
         /8g3OdFZFtvkTkm+joMcc37KH8hz1dNB+hEouJPjOTUVnwoyr2TioClxNWGF2oGtwwn9
         AtCq5qiqM4UMvf9nLwYlqV5rLwkB/9B2nY6FVam34vPR+78+zno8EG0Oblwjci0k1lsv
         ip5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682799653; x=1685391653;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT6Iosx0mXfdelnB+/awy2djLbdEQHSWYwF0l6D7UZk=;
        b=gv7yItyVe+Usgq2XGsedq1G47cDISbCBIU9pgAKbr9qbjUUBekdP6ecii8t0h8yYu/
         NeOasIz1sql6nNNYSyfZKQug8FqLLPABwsK1eKZdzhjiGgZfQVKM6CFQSFqfe3tu4/JC
         aNBRU3PNjwHo8poeizBvJ4Cv1RyPgjDTUqszpYEkXbqDHu9Nhy8nAJxmAtTZF1hXRbf6
         ncRhJJIQMD7lce9hdw/IZ2CNXlFgMZTo4BniqgSuwl+g21I6pRVb3+Hn9QQW5+nBknEL
         MAMjQNSy7ySULzqx5Y6skh86qNqTykVb0ljjm60V2s2yrSOdNKpcKsOKOXDaJffppl1N
         +sjw==
X-Gm-Message-State: AC+VfDzNniGmVhKz0JbKPuvfOWy5mXEfwhwSvos1IjGrUbsRtAL12Wdf
	YjWbXcXSSocNlxagS8ozyoY94g==
X-Google-Smtp-Source: ACHHUZ5WOI/1aioBsqwebacxzZ9ZdQY0r+MMnoJ8pEVhZBGss1o6w2KghYZKaT+eG3K6P9EOLAdM9w==
X-Received: by 2002:a17:902:cece:b0:1aa:e451:e22 with SMTP id d14-20020a170902cece00b001aae4510e22mr1575813plg.40.1682799653446;
        Sat, 29 Apr 2023 13:20:53 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s13-20020a170902a50d00b001a64ce7b18dsm15229418plq.165.2023.04.29.13.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 13:20:52 -0700 (PDT)
Date: Sat, 29 Apr 2023 13:20:52 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 13:20:35 PDT (-0700)
Subject: Re: [PATCH] libgcc: Add forward declarations for generic library routines
In-Reply-To: <74a647f7-cf5f-4c23-aad6-77bf5b04e116@app.fastmail.com>
CC: geert+renesas@glider.be, akpm@linux-foundation.org, linux-csky@vger.kernel.org,
  loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-sh@vger.kernel.org, chris@zankel.net, jcmvbkbc@gmail.com, lkp@intel.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-8d0e378d-10f7-4107-99aa-b204c3d2a619@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_132054_571061_DE312070 
X-CRM114-Status: GOOD (  14.29  )
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

On Fri, 21 Apr 2023 13:38:52 PDT (-0700), Arnd Bergmann wrote:
> On Fri, Apr 21, 2023, at 16:54, Geert Uytterhoeven wrote:
>> With W=1 on platforms that use the generic gcc library routines
>> (csky/loongarch/mips/riscv/sh/xtensa):
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Link: https://lore.kernel.org/oe-kbuild-all/202303272214.RxzpA6bP-lkp@intel.com/
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Nice, this is one I don't have in my series,
>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> I have patches for a lot of other missing prototype warnings, plan
> to send them out after -rc1.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I think I've merged some stuff around here before, but it's probably 
better for some more generic tree?  LMK if you guys wanted me to pick 
these up, though, I've got a smattering of small stuff already so I'll 
have another PR either way.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
