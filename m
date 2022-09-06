Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ACBECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQ+wdq8E5gRFeVfLz6VCMinJTWpnqeEXF1DjkhHPh/4=; b=ddWw4fQYQb5hz6
	GwIzr2+syOPzwvnAIbDUbn7gOM8dy9QBRfgR+4Y7ZJHQMUVZR1AjjgogQW/lm+AAdoGdTssQtS1UB
	gv5MAYQjtzUwB7yf7aVNiuptqsrD99sZIQQB//Puw2sF+LAwsGh9eujOfwdQ1ygzjhDDYP98ByRsC
	1CFjEt8rVsZFGPScJIA6IiY8iO4K04ud2Z+S108oH0IKUK2cRyxqUWOQP2nwVnaxTx/YPVYSGBgWu
	PDX5/xlbGsdhkXXQUbaGcWvXyQmp/HZbBB5TiCN2MvnEVJbBkTZMlXRe60JHxpA5nfvZeLbY+ThrC
	kVRt27HdpLSf0/EWivsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUMx-00BWcD-LT; Tue, 06 Sep 2022 08:55:43 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUMs-00BWW9-Q4
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 08:55:40 +0000
Received: by mail-ed1-x533.google.com with SMTP id z8so14214261edb.6
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 01:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Ek611JgDauED29IH9RuPGo6hkw+n9gr8q7sWQYplL8w=;
        b=QDBUrdlbcL4XY+u6CM8akb5k8SkjHa0zrFwGDtcAkrKmLkhG/4e29j/IAnGQsDUGG9
         KmwUHECzr0YhtspkNrK4S0cmHLixxi4hgjdTtcVsr5ipPk8gV15dFmuKJDS7ajeIP9cu
         7pmmpiQ0DX7vIcDSGpwTtzcjtoDZRaiQsgGhNXUqzz86yeBKoC0lZo9nB5DCSZotgxw0
         Pq9LWS185ZLRephbxNYJaf4PWEVk7jcVZwhozvnIPQYe+6Drfp1QDXsdvg6xzPMMiUOV
         M/Vl8H3Mdckby+Ss6iuhpJw5q02o77apH01BqFCNOreNs7iEGRF5hnSuatNRimzr0VoZ
         bj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Ek611JgDauED29IH9RuPGo6hkw+n9gr8q7sWQYplL8w=;
        b=IO8dxaRpt0lo4CoxBxj8NeCkKvm6waerldh55mBGbtuJMyGG4/78MAuFDZ5t2OICAR
         PDJj8prtbq5bddZvs38xl+i/mxwqOxu/5+wL49KbV9bMb9hUILsG5z7ZJwrQSpZdd8Tg
         CsPK5EMT4u8mezU04DWHyz7WkGWXvbUBDNJUHm6lUvMGdNuD1zKTlwiYExGyEvhAeiOj
         97RmdYHeUpMJK0tR1iFCRtwsLU8MBTh/1HDXcErAWqoJr51Hw2El25oU7eoBrM5hbeNH
         vSF6Un8IWr5ioaMQoXh9y8MK6JFrdoEFoEFfx47o/x4dOhMTe0tt1stflsOL7SFbLwdU
         BMZg==
X-Gm-Message-State: ACgBeo107NxDiZYNhAQ8Masmns+J1zJpE/F/5ZAkrSs+d21GqocprHhK
	BXHm7blQiJMnKpV28K48Uy0wfwhWaiulUQ==
X-Google-Smtp-Source: AA6agR7R206og2r9LYOcpuH1n5aouraP7Z2cOPqXfe/l0I+kv4xQwkjucqw9lmQdKR+OMK2w3wHLCA==
X-Received: by 2002:a05:6402:3509:b0:43e:d80b:44a8 with SMTP id b9-20020a056402350900b0043ed80b44a8mr47655612edd.255.1662454534918;
        Tue, 06 Sep 2022 01:55:34 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id cq22-20020a056402221600b00446783d4d02sm7977063edb.30.2022.09.06.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 01:55:34 -0700 (PDT)
Date: Tue, 6 Sep 2022 10:55:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor.Dooley@microchip.com
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, heiko@sntech.de, anup@brainfault.org,
	atishp@atishpatra.org
Subject: Re: [PATCH 1/3] RISC-V: Output cbom-block-size
Message-ID: <20220906085533.orfbu5gyeur5xj6i@kamzik>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
 <20220906083555.931806-2-ajones@ventanamicro.com>
 <3da2f5bd-104d-4562-3748-847b2d1c8166@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3da2f5bd-104d-4562-3748-847b2d1c8166@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_015538_921419_2C445C96 
X-CRM114-Status: GOOD (  22.80  )
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

On Tue, Sep 06, 2022 at 08:40:23AM +0000, Conor.Dooley@microchip.com wrote:
> On 06/09/2022 09:35, Andrew Jones wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Provide an info message with the block size when the Zicbom extension is
> > present and the block size has been determined.
> 
> Why might someone care about this?

I was unaware of anywhere else besides hardware descriptions where this is
published. And, while dmesg isn't really publishing it in a way that is
useful to anything other than human readers either, it at least makes it
easy for a user to check it for sanity purposes (which is what I used it
for) or even for applying it if they want to write something that needs it
and the OS provides U-mode access to CMO.

I'm not married to the idea, though, so if people would rather have less
logs than this information, then I'm fine with dropping the patch.

Thanks,
drew

> 
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >   arch/riscv/mm/cacheflush.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index e5b087be1577..8595baf8e403 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -122,7 +122,9 @@ void riscv_init_cbom_blocksize(void)
> >                  }
> >          }
> > 
> > -       if (probed_block_size)
> > +       if (probed_block_size) {
> >                  riscv_cbom_block_size = probed_block_size;
> > +               pr_info("riscv: Zicbom: Cache blocksize is %u bytes", probed_block_size);
> > +       }
> >   }
> >   #endif
> > --
> > 2.37.2
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
