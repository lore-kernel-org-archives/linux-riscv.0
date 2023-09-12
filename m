Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91E8CA0EC3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 07:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2LyLe1xgeTLWyXdG+3LGkgSr0pLg2VMeqtRWI+qAZM=; b=SujEHO69KHF+25
	Z5YBoXCgVd8xoYZkAwpnPwcHmkxaegBhwKh7tRvO4tQoz0P88i8nh9impMHFrqHSRXal5wcm5tWR0
	b50Gc+uJ/LCXn+szKSS72StHicWbnWhekDBLmgXq6NF9pa882XGcQsWubdLaAK9ePAgFso/cULW1E
	B694R3uxP0GviihNKXnJWS8IyHOxsf4B7iUrkdq6i7PPD4ol5Suu02Erpf02SvdwTuWpPgLLlGUkM
	iDhqkyOu1kq81rAJ/vxiUWgcvzXUM7hbVJGhp3Uc2lmD5qpAY655OeJ547CMFUcukKg4SCOvNrdFm
	ml9euP6mewUtDK57ikDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxci-002MoT-30;
	Tue, 12 Sep 2023 07:15:48 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxcg-002Mn6-1F
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 07:15:47 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6befdb1f545so4017112a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 00:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1694502936; x=1695107736; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWNdyPVUhTz83dozDzHZ2crOn6mqNkmosICyn2Ni38s=;
        b=am1oyih7Z/GMIwMLQeA9p5oxEcHiPFGKAmcGIyiqyIdhes1SQwZoZPk68ZX+glufBY
         IilRQ5CfGl/g6dIaHu5nUNyXRN9PpLjio2IOIzbBRw5k4rvSM7eREL7rvD0rKDZKDMNV
         oYOsLeQLs8YxMql5rD90V5G8ksRC1fEcwHUYpviHhVnw0CZlsW33P1wGgBPLk7YG8NuB
         vjlZofG4xMJnipX68+LQfomT0K0ngE/ovpk5Km6q3xX1wnpQnhk2zBXDqeJq6mXivb4z
         mZ2xfs8jV1DF9g+v8Eneq52wz2wvH1RueL7XDHO4D/OldFl+haybDIP0YgEv0JFWLkRE
         u1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694502936; x=1695107736;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWNdyPVUhTz83dozDzHZ2crOn6mqNkmosICyn2Ni38s=;
        b=jkq2SdZCSnTb0E1WI4e1EcGpPBBht8wbz+nsvul5aILl7Ehsn6yQkofS3NcAr5yyPw
         wK/wvhWbUqbeaWwOdXBYqV26q0n4vfKk0p4rBngBFzV5sj6qYtFCy1Iaq1NxnEpD5QfE
         8kIXsNpZA701XharAMs1Sdq7g21eT74MfiVC1a4A16eZgG4LMy1ka/vQM2jbQmhrQKkU
         6HlGoBXYx0GsbFYQUyvzR6zkhqiR1jncKlidtmes+atCnHLKg6PYJZxtr8WB8qqipNhv
         /FfeXyiM8KsCAJ2zcfEXub9hkjS+6wd2a8iX9W5UY/EWBzDLKB8LwUFW1Ah/yeqZfunW
         6/fQ==
X-Gm-Message-State: AOJu0YyuQPI87DemaRQPMETannbaMHP1GPclZM9M+ZwQ0DX/TgUaMKfa
	I0FjCKFgxJgD32nkBgLXTWQBCQ==
X-Google-Smtp-Source: AGHT+IE7BxX2OK/dGjEsVl/1nUADEVB1Xh2UIPWp4SnQmZuKPv8XSDoqNWuJTTw59mIrzcsHuontdA==
X-Received: by 2002:a9d:7c8d:0:b0:6bc:b2a2:7b02 with SMTP id q13-20020a9d7c8d000000b006bcb2a27b02mr11581966otn.7.1694502936238;
        Tue, 12 Sep 2023 00:15:36 -0700 (PDT)
Received: from ?IPv6:2402:7500:4dc:9c7e:c46c:519:8d4b:654f? ([2402:7500:4dc:9c7e:c46c:519:8d4b:654f])
        by smtp.gmail.com with ESMTPSA id bk17-20020aa78311000000b0068fc9025a08sm2742425pfb.151.2023.09.12.00.15.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Sep 2023 00:15:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v4 10/12] RISC-V: crypto: add Zvkned accelerated AES
 encryption implementation
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <CAMj1kXEGnZC6nge42WeBML9Vx6K6Lezt8Cc1faP+3gN=TzFgvA@mail.gmail.com>
Date: Tue, 12 Sep 2023 15:15:31 +0800
Cc: Eric Biggers <ebiggers@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 palmer@dabbelt.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 christoph.muellner@vrull.eu,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Message-Id: <1BB805D3-FF47-4A58-8507-CCA72A27DD82@sifive.com>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230711153743.1970625-11-heiko@sntech.de>
 <20230721054036.GD847@sol.localdomain>
 <CCA32056-CCE2-4FB5-8CFC-62444CDDA89F@sifive.com>
 <CAMj1kXEGnZC6nge42WeBML9Vx6K6Lezt8Cc1faP+3gN=TzFgvA@mail.gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_001546_424720_9E5A8D54 
X-CRM114-Status: UNSURE (   9.97  )
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
Reply-To: CAMj1kXEGnZC6nge42WeBML9Vx6K6Lezt8Cc1faP+3gN=TzFgvA@mail.gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sep 12, 2023, at 15:04, Ard Biesheuvel <ardb@kernel.org> wrote:

>> We have further optimization for RISC-V platform in OpenSSL PR[1]. It will include
>> AES with CBC, CTR, and XTS mode. Comparing to the generic AES implementation,
>> the specialized AES-XTS one have about 3X performance improvement using
>> OpenSSL benchmark tool. If OpenSSL accepts that PR, we will create the
>> corresponding patch for Linux kernel.
>> 
>> [1]
>> https://github.com/openssl/openssl/pull/21923
>> 
> 
> This pull request doesn't appear to contain any XTS code at all, only CBC.

We have some license issues for upstream. We will append the specialized
AES modes soon.

-Jerry
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
