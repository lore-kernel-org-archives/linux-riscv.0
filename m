Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDF6EDE989
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 03:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWHg6J8dGC7mxmiIjzBdHYIzCTvA2KGHHap0hchJuTM=; b=iw7ClZUT2Fk8eF
	Fk+Hm03a8gWip5kqpRLJgmpaaxgQbuRA5MPYPe7OKVK1wupDBrQVzileumWdu047WqS8p0QZlLokD
	R55UXWKSeCAj5uqW4Wv0sJJNb6mXtoFN0Of3a9W4K4UhziltFZaBr+gTISYloxpN4n2gXDgs0wPbP
	29L5SSbcwYmEym6g9cVtSbnC3U1IIBCBbAcadUTDm4VH2XYQXqg3p6LYiVi/x/NV6em/kzjkFgOjx
	yDtPCMUTTv13YR3EG3OsVdQ1qwt2Au4oWDW20OnBSSawOWVgkKUZKpSqzpY35M64hJQGuNKPWSGdE
	G/ZEvhQAdOHUSQjhQWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgzOl-009fKt-32;
	Fri, 15 Sep 2023 03:21:39 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgzOi-009fKE-0M
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 03:21:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-690471b5889so163528b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 20:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1694748094; x=1695352894; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTDOQBJsYSyw8b1H54D8BUhY8rLLu4LSSYhPNnbLvfE=;
        b=UKIPJCQ4O47mqYE99FbhypubZW7OYlBO9MEdQeUgIwXTzgwSyfqzUUYWTxuggy1Vru
         AmT7FkJqTsFCU8LEXQiB9isWjeslch91kGEC5ANBeFUElY4w4P+lJoG32I/l85Zl3uZV
         gq6CuIKJMhTo0Nagtphq2jdQ1b327iiEz8ipjXELxRQa2l5+et3lOdD9W/uMbiXeAF/w
         Tkp7kFYzzmB1lnewnE1oxlWSmkhbtJHRQBl7BYmvcNUcc44qrbbPrJWxUK7oBR9Z7w9s
         +g7xUc6XIcflOXfhshpMBOf3/6eT8FgNTlTL/KBC+QmCZyMmeOqmXR51807ZK5RHhPzF
         Vd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694748094; x=1695352894;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTDOQBJsYSyw8b1H54D8BUhY8rLLu4LSSYhPNnbLvfE=;
        b=Y+wb1PVpGLbyJULrCeHnNbE+PtcVat8vmERvx8zGdlbkd2i38HyuGfttPV+MTkwyvS
         A3MS3oGTSHs6WIXunMkHh0yfEI9cfzDq8qO+GNv2tkyjTNOAFG81/ynvFWFcQ4NBLkSd
         FvTbJrjLjYjLSS4G2qq23e3mC525xWrbpkAX6LMEBSVprNX29bxZUH5Wjo3fNJB/PlfX
         8ts2dxGLSLa9TKm5F7NQr1ipmmLBWbT9VT6C4oEXmX4VJ0H8VNbr7FmjmCmwyIWXRx0x
         2z9Z939jg1EEvwTGEWl3+2FfgGpr7L+JAyniJvGO+cpdIdXjOsxGjNwJxmiqCrlDFZMl
         qHrw==
X-Gm-Message-State: AOJu0YyKH5ogGYoq0slYfISumhIrR02akc5j5/JcAcXkw9+Gae/RzhGy
	2D5EMVnqAExSWbTA8Z9CiVCtPg==
X-Google-Smtp-Source: AGHT+IEuvHA6qyozCTrAZcaIDeut+4ZIhEGVI11IyUpSTAA3tAcSzOB2bHYHNQ0B0UVKXCDJxrKPYw==
X-Received: by 2002:a05:6a00:17a3:b0:68b:ff3b:e140 with SMTP id s35-20020a056a0017a300b0068bff3be140mr563288pfg.8.1694748093778;
        Thu, 14 Sep 2023 20:21:33 -0700 (PDT)
Received: from ?IPv6:2402:7500:5ce:c546:b4c4:4f04:b63a:c241? ([2402:7500:5ce:c546:b4c4:4f04:b63a:c241])
        by smtp.gmail.com with ESMTPSA id m1-20020a056a00164100b00690397fdd9bsm1350856pfc.190.2023.09.14.20.21.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Sep 2023 20:21:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v4 00/12] RISC-V: support some cryptography accelerations
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com>
Date: Fri, 15 Sep 2023 11:21:28 +0800
Cc: Charlie Jenkins <charlie@rivosinc.com>,
 Eric Biggers <ebiggers@kernel.org>,
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
Message-Id: <DD3113B1-AB9F-4D6D-BD6E-8F75A83DA45D@sifive.com>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230914001144.GA924@sol.localdomain> <ZQJdnCwf99Glggin@ghost>
 <3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com>
To: He-Jie Shih <bignose1007@gmail.com>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_202136_187522_C4CDA9B6 
X-CRM114-Status: GOOD (  13.69  )
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
Reply-To: 3A0F6A71-C521-44A5-A56C-076AF3E13897@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sep 15, 2023, at 09:48, He-Jie Shih <bignose1007@gmail.com> wrote:

> On Sep 14, 2023, at 09:10, Charlie Jenkins <charlie@rivosinc.com> wrote:
> 
>> On Wed, Sep 13, 2023 at 05:11:44PM -0700, Eric Biggers wrote:
>>> On Tue, Jul 11, 2023 at 05:37:31PM +0200, Heiko Stuebner wrote:
>>> 
>>> Hi Heiko!  Are you still working on this patchset?  And which of its
>>> prerequisites still haven't been merged upstream?
>>> 
>>> - Eric
>> It is my understanding that Heiko is taking a break from development, I
>> don't think he will be working on this soon.
> 
> We would like to take over these RISC-V vector crypto implementations.
> Our proposed implementations is under reviewing in OpenSSL pr.
> And I will check the gluing parts between Linux kernel and OpenSSL.

The OpenSSL PR is at [1].
And we are from SiFive.

-Jerry

[1]
https://github.com/openssl/openssl/pull/21923

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
