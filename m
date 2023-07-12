Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB283EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzC6HwaVswtxmAH1bXk3leVYtt5nOSusn0irTYiHj48=; b=3qWY33q8Jd8cf3
	Ze6g33ykZbGb8o9hT26+xyyUgiliQ5hIL8+nvKtfoVIXNw8SYW67v6SQBFcgq2oZQBVFLgYXAMkNT
	lCfXgy7elfUFgTLQIse1WAX7Fg6DjQF36uOf8M2h8HyQj42yudMVmCK542eSm3VoV8bL/uqUvI8tr
	tUmgZ64UjsKj4inhnuj1U0PDF6jxfC1qR71R9BGIHescTClskX9ahyPhebRtqWNySkoOufPcccVS/
	Gq6xyhGaxsa2oVeenTTXrzrcj8sfRL7JkqP1bK0BXpLAe3+ZV4ue76Onf0PEkJgCGt7iYDCx5/nfv
	7yLMb4m4yYkwQvT+FS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJbbc-000KO1-1T;
	Wed, 12 Jul 2023 15:18:16 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJbbV-000KFk-2a
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 15:18:13 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51e5e4c6026so3891299a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689175085; x=1691767085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jSRYzXQJjSzscDofbSmSLHS50IQUvlXSSpTRB4ma0qw=;
        b=WKN/SIA/XO1lPrDOTg9H5Y9QVBzMys/4dO7qOvkxg1kVrOMCUj8pB5Pbg0DIjZmGwn
         CcKtivJweKIAjfuiRB7mY43/5IAjGbHWjAcqZoMs8+byLSpnbrQ3kv1Yuwn9wZoEE9m/
         0Z80z2qmtMyoFi/x0ZyYXQLbsZf9Bq0kTrXxgw8TAKwcquQxZ6+Ke8koEbAq2EfRkI0A
         GBOZT3f6nCGYjJn2lJbR2+2zPKGR64oif3/jQo1o6KbuTWpbXBGK/eAr/OQwVkC1tgU8
         Q/WyF3BgPozt9JQJtCL87WEWgue09s/r52S83yRkEz6dQd3Xju3J/LKflptrGuq8oxg1
         JNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689175085; x=1691767085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSRYzXQJjSzscDofbSmSLHS50IQUvlXSSpTRB4ma0qw=;
        b=IW7vuCjT4s0yor5k95Nxmg/APKNnteYmDmz5aGkX+Q5MLnWRMV0C0ZxHPVRdS9KL88
         xiD1qzW4dhdjcDXMMvpWUqXTzXD6PAk5USQr1wSQ503Ua5Ga1ojf12VdTrUVhTDlXhO7
         V+pvY1XXn/hYaKUfYq3rB+jwBsE+mr5RUoyfFY3oK8tBj2UqFnJQuE59R6HAU3AzRTT5
         4laG5Grk/eId8vl3PNmsjC8uosVbEerWaQWJZMxbv2BDAnvsKQPzSoQQakNIBjkfOUs2
         uH4+MLjSKMXyWLydUIbGGyRqK/0mm5Kk0bo16B96CE7gYB14XG0VH8k5o5FdW/nZ4/6M
         MinA==
X-Gm-Message-State: ABy/qLZv9JpQANAVyu7QTNS0bTYUbpLE+tPkiho+FGKuITnJmBuf4BSK
	SWMPb2HPB0/EGbfSIpOEkNg=
X-Google-Smtp-Source: APBJJlEk9gtg7L60OsOJ5R6HcLlpMod3vSrX0zpJyJcfqUvOGZpC33tgecmEO/qzBuuVg/63uT30ow==
X-Received: by 2002:a17:906:6485:b0:98e:419b:4cbc with SMTP id e5-20020a170906648500b0098e419b4cbcmr19173591ejm.12.1689175085246;
        Wed, 12 Jul 2023 08:18:05 -0700 (PDT)
Received: from andrea (host-95-238-70-145.retail.telecomitalia.it. [95.238.70.145])
        by smtp.gmail.com with ESMTPSA id qw5-20020a170906fca500b00992ed412c74sm2668251ejb.88.2023.07.12.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 08:18:04 -0700 (PDT)
Date: Wed, 12 Jul 2023 17:18:01 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv,mmio: Use the generic implementation for the
 I/O accesses
Message-ID: <ZK7EKQjCQV7fNPSx@andrea>
References: <20230711133348.151383-1-parri.andrea@gmail.com>
 <20230711133348.151383-3-parri.andrea@gmail.com>
 <20230712-lesser-deflector-d18f7991477b@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712-lesser-deflector-d18f7991477b@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_081809_875573_5806CE90 
X-CRM114-Status: GOOD (  12.73  )
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

On Wed, Jul 12, 2023 at 08:05:16AM +0100, Conor Dooley wrote:
> On Tue, Jul 11, 2023 at 03:33:48PM +0200, Andrea Parri wrote:
> > The current implementation of readX(), writeX() and their "relaxed"
> > variants, readX_relaxed() and writeX_relaxed(), matches the generic
> > implementation; remove the redundant code.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> 
> This fails to build for (64-bit, I didn't check 32-bit) nommu:
> arch/riscv/include/asm/timex.h:20:16: error: implicit declaration of function 'readq_relaxed' [-Werror=implicit-function-declaration]
> include/asm-generic/io.h:342:23: error: conflicting types for 'readq_relaxed'; have 'u64(const volatile void *)' {aka 'long long unsigned int(const volatile void *)'}

Thank you for the report, Conor.  Looking at it.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
