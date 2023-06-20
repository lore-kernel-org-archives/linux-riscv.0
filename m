Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA45EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 20:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=MIkD5yiLviOE3gQ/ZM3G3IBVZc3NwerAmG7Kcevx5eU=; b=ypOtitcINbhlC+B0Jx0l3R4uDe
	h6TQqUbDEDx7NcN/UIkwrilOCF2FObTyuAHEUrcEvBsMKXV9cP+R4TAbY4TIeTurnnddfQ6KXlnjn
	I82o6Vvc0EdllAk/EdMmO2WqHi5/8xnQ1rSSB9+nAsWfEhEX294vYBpi4KqaWWoIHF/iCjVXioCCo
	UFPe+DCZHEDxwCso58RLoj857zSxFysvtO37uR6F57b0E9rMcMaFJgUqgelDY6pU8RU0gY2yKbeG4
	gBaYZjd+CzXzxuMQujxI5ANQsg4WVXpk11aKDkL+P2vNUIjDWin8C3pN9+rJRG8+ujgRCwXpSIiNr
	NC0jqMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhnG-00CH02-0E;
	Tue, 20 Jun 2023 20:17:38 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhnC-00CGyY-1b
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 20:17:36 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-39eb3af4d8cso3098634b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687292246; x=1689884246;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j61lPz1ySH8VrcE5kFsDOYTdEi2FoYJLs1a7W9C6KgU=;
        b=GiwlIgQPYygCWhdB2eZ1JY5cMATuumlvdNVT9RL36gMQrzlqUkSxnJwQWw51VyF/uf
         jas2j1KhAiMkCTHiUfurwIbQYqs2vZl+OEKey7XXa05FVh+SOF37ZfiEwzDusksrNPEq
         i5M6zy2rZoNk3PW83CrWH1um1gq7tVlyEC7FL0KGI5IGaHT3Vn9ZKhbh1gq/zK86T+x/
         4XBcbit2aBfoMb60DGRgu0WAZDY8iXzdXFJv1/yZr2FkWvuEY9mbfEkk66KgyMZc/h9N
         SmxzrebYgAgSiY3hY2mm1+PaNZv9qOZJSH58m0+mz/hlbt47qu7LXkuDWqDKzrn7kEXH
         sv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687292246; x=1689884246;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j61lPz1ySH8VrcE5kFsDOYTdEi2FoYJLs1a7W9C6KgU=;
        b=HqRizuxcAHE+hhvHZJA/38kr6QdjHOQGAyiAHYDvYxCzfAvQPhGvA0nMLzUTyP6E9c
         ZhqCrcf9jWY4AK3nHTjo+8Zlstr+BqqIs1gP98fb+jtNCWDSh9at+6aCOBEfmWkh66Ws
         r/JSpss+WUolPrchCLJKcwdCCPLJZ1od1hfEKXZjL0MmqEyxikfos2FqbC41+YY97ZwZ
         ZLkZmJzZ6Ws5F2kxJxRQgFrs709RI5kgLKn7C0DnqoRLx1kLsqrBUqmTt3leMCRbyYhJ
         JTMkl2lAeFBGf9FxrFtVeDV+/jEtsL3MH/EPNULEkXn4nLrZkJhrlilHFBriUwJEXELr
         Mx+w==
X-Gm-Message-State: AC+VfDy6KvFuyZH5oCySpbtbNWB6ZZPDPBJPjmMJ4lJM4EcFSdbKL40p
	CFFGWm0bb8MYZ4K9POoPW1uiXQ==
X-Google-Smtp-Source: ACHHUZ48+YUD2VZh8/4myxORawpTx1nMloZt9tP8SC5pqwZ2kn4iEdNtzxofzmWvJJqDA3VO0aH/UA==
X-Received: by 2002:a05:6808:2393:b0:397:fbe7:a0fb with SMTP id bp19-20020a056808239300b00397fbe7a0fbmr17793969oib.18.1687292246737;
        Tue, 20 Jun 2023 13:17:26 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id o17-20020a634e51000000b0052c3f0ae381sm1771597pgl.78.2023.06.20.13.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 13:17:26 -0700 (PDT)
Date: Tue, 20 Jun 2023 13:17:26 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 13:16:47 PDT (-0700)
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
In-Reply-To: <ZJIIUn8Da15neIwI@google.com>
CC: falcon@tinylab.org, Conor Dooley <conor@kernel.org>, guoren@kernel.org,
  linux-riscv@lists.infradead.org, npiggin@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
  paulburton@kernel.org, vincent.chen@sifive.com, tim.bird@sony.com, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@rivosinc.com>
To: ndesaulniers@google.com
Message-ID: <mhng-ae249af7-37cc-400c-be0d-c1fa6f75c8ef@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_131734_558042_11FA68D3 
X-CRM114-Status: GOOD (  13.53  )
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

On Tue, 20 Jun 2023 13:13:06 PDT (-0700), ndesaulniers@google.com wrote:
> On Wed, May 17, 2023 at 04:29:36PM +0800, Zhangjin Wu wrote:
>> Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
>> the user to enable dead code elimination. In order for this to work,
>> ensure that we keep the alternative table by annotating them with KEEP.
>>
>
> Just cross referencing the report from Palmer against v2; I see orphan
> section warnings from the linker related to the EFI stub when building
> allmodconfig with this patch applied.
>
> v2: thread for reference.
> https://lore.kernel.org/linux-riscv/CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-EtxHcBnADkhnyitMKQ@mail.gmail.com/

Sorry for replying to the v2, I'm marking that as superseeded in 
patchwork.  IIUC it is a real issue on your end too?  I'm also not 100% 
sure about the hang, I just let LLD cook for about 10 minutes before I 
noticed it was still running and posted.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
