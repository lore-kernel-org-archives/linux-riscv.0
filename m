Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B91ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9/UkXg/PEwjWN4N6cm7DP+UGd99aOUxOQM8wxbOd6g=; b=IgnTcieNaortR4
	GpfieY6e1TYiqCwBQTrnC57K9xg8WPyIMMsoPF5Vb24KDF5x0eiHB8TKxVN9nF+Lm2XXSVhqwKm2s
	hUCVP9Eepl7q3JD2zs1UGTnUJKILY2bPWfrJ+bEbIuyBI8PmbVWQiz8M5cQoYsfTp7G5jDZwtxbej
	7TnK0j06LsteTnfQLtxny8GI+JjttTMD1VHxNnPhqX7cMLY0QPdU1nmSfMfMj24xWUR/gMo6qGj4i
	Hlh4qk8NHPKm6jkhZMVM2Ge7Lzqic3TDz4FA8NgfWR0/xV6adVYIXvlHZniHKA1Nu8GOfuPPQDioD
	4mkbAV4ckREhjhd8+yJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUSZ-00BaIo-R2; Tue, 06 Sep 2022 09:01:31 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUSV-00BaEn-Vn
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 09:01:29 +0000
Received: by mail-ej1-x633.google.com with SMTP id nc14so21630541ejc.4
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 02:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Jl3fGJXL3iBC7veQCMRQweVhWHhnQ5NCezKm0eSgEXU=;
        b=Gi2mb4Lq/KUVv7ACkQrwpMgX79q6JYQxpP6zhKaQPGvDEtasWDYrUQmPTJeANvlBxW
         UH6DManO9UnsYmyxhV+J338CFO4G4+pkgTmH8mStidC6DsxagJdkmejATz4j0TiS+Yq1
         zAOMNdEsc9MKaIwZzfzVxll5y0e3ItmioeW8RBHv+qT0czIgBPuBbC85CZF5hq8XfqFl
         du61o2xy7/lLMnZ9XcnHnCYGfyoCsgnkI12r3srgKOMLAIfvncU0D+lt8KSJ10+Sciy3
         I+FHIzlRIB6alV+WtynG+qrclKbEEGU6D39VYbVLSumYz8lUeb/zH/ENr84yMPLBl5IE
         XFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Jl3fGJXL3iBC7veQCMRQweVhWHhnQ5NCezKm0eSgEXU=;
        b=4DEg0pcqK6jvvjqqQKV+QKT66z5JZgWHzg795991H7dIPtRR6iC79AK6jNLXbbGiTx
         ZzseIY9TacTyk7KtCkOKXkUsL5vGz7DxWwrEig0h9inlw/EtNJxk3KodaIDCgZIja0eT
         R+Y0QR51f3nDclJB3wZN7KDDANBAskuJZ4xoGX4P4g8RlgXq4Uh1cl4mfdtKlJW07TZv
         7q+KW+G41B3j3UArhswWrR9LTqF8sTjUyWSpGyt/jVEakzdbKJWAwJ5xjtFF/46M8Y7a
         usUl9JYR/CXQAmPp/K5eu3nXdNF5meFFUYFtFauw8+GYMOjs0sh7XuL0SYJ1E8h1ZfXL
         fMIw==
X-Gm-Message-State: ACgBeo3dVuH6jwoxEAbf5iTxGRR4NXK6ZenmnlpLNKjfb5dDMb1wEHxr
	n8N3TOspuKVEzgur/lI0T6CXkQ==
X-Google-Smtp-Source: AA6agR47XXHxmjItbSm+yGg2La1AzBzwqr+S2FImo0NHByFjD+puHTxu5uNWdg8LhQSf2mhK7q6kwg==
X-Received: by 2002:a17:907:6297:b0:72f:9aad:fcb with SMTP id nd23-20020a170907629700b0072f9aad0fcbmr37941328ejc.161.1662454886446;
        Tue, 06 Sep 2022 02:01:26 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id f17-20020a1709067f9100b0073a62f3b447sm6280401ejr.44.2022.09.06.02.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 02:01:26 -0700 (PDT)
Date: Tue, 6 Sep 2022 11:01:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor.Dooley@microchip.com
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, heiko@sntech.de, anup@brainfault.org,
	atishp@atishpatra.org
Subject: Re: [PATCH 1/3] RISC-V: Output cbom-block-size
Message-ID: <20220906090124.f4aexh6ygvsupayd@kamzik>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
 <20220906083555.931806-2-ajones@ventanamicro.com>
 <3da2f5bd-104d-4562-3748-847b2d1c8166@microchip.com>
 <20220906085533.orfbu5gyeur5xj6i@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906085533.orfbu5gyeur5xj6i@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_020128_062503_A8FE8323 
X-CRM114-Status: GOOD (  28.22  )
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

On Tue, Sep 06, 2022 at 10:55:33AM +0200, Andrew Jones wrote:
> On Tue, Sep 06, 2022 at 08:40:23AM +0000, Conor.Dooley@microchip.com wrote:
> > On 06/09/2022 09:35, Andrew Jones wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > > 
> > > Provide an info message with the block size when the Zicbom extension is
> > > present and the block size has been determined.
> > 
> > Why might someone care about this?
> 
> I was unaware of anywhere else besides hardware descriptions where this is
> published. And, while dmesg isn't really publishing it in a way that is
> useful to anything other than human readers either, it at least makes it
> easy for a user to check it for sanity purposes (which is what I used it
> for) or even for applying it if they want to write something that needs it
> and the OS provides U-mode access to CMO.

Of course for applying it in U-mode programs it'd probably be better to
introduce a sysconf variable or similar to get it.

drew

> 
> I'm not married to the idea, though, so if people would rather have less
> logs than this information, then I'm fine with dropping the patch.
> 
> Thanks,
> drew
> 
> > 
> > > 
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >   arch/riscv/mm/cacheflush.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > > index e5b087be1577..8595baf8e403 100644
> > > --- a/arch/riscv/mm/cacheflush.c
> > > +++ b/arch/riscv/mm/cacheflush.c
> > > @@ -122,7 +122,9 @@ void riscv_init_cbom_blocksize(void)
> > >                  }
> > >          }
> > > 
> > > -       if (probed_block_size)
> > > +       if (probed_block_size) {
> > >                  riscv_cbom_block_size = probed_block_size;
> > > +               pr_info("riscv: Zicbom: Cache blocksize is %u bytes", probed_block_size);
> > > +       }
> > >   }
> > >   #endif
> > > --
> > > 2.37.2
> > > 
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
