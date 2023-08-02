Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B648DC00528
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 09:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++KzBM7AMcnMNml0IEFxDCcFvroroXhmT6N2CyFzd60=; b=eVVJdjcESa//ww
	AWDvTsREAICAd6gs0ZZahJaK6J+DW5WWOa8G4ga0HnhHYlxmjnLWWWLvMfH+YSqimdkbBVzXds9X8
	zRGiV1K9W3Vecuc1/xrYOPQORWAquQm6h+ODzOK5hEjKSpm5679AKMTODBSrSn8rw2H9lsd2YNdmE
	2oqqldnhkZhKAwg3ZFR8U/ZA0bFweEwUZHJaNE331NcH7TiS9IahGQeMaeIs8YbsnLQs/Mw4hqjnt
	BR8dk95/YdBOCzZzkexVXpFLn0Awp7fsc03Mte4yUX2h+hEBCoOyfdb86/QaChQQenAmsywsVCDjS
	NjWdq9aFV2GMUwh6grWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7o8-004RLT-0k;
	Wed, 02 Aug 2023 09:06:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR7o5-004RKD-1c
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 09:06:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe167d4a18so42814585e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 02:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690967172; x=1691571972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hu7P5NCl9aaC7aDT0yq18Lt0mz/hHx0pz3Esj4sF7tc=;
        b=oQvmT7QbVMz1rQJc2hqTRIugO9tin+bDcsuf5SX4TEsk+tYvlmIWlh9fJWKZ4AoMcr
         gARTaxdsGTXg24KXWXUs3mBJoeehoeOEhPckHcMQYYuc0BB75ijKlQ1vAJmllvmIOVEn
         Uc3GT99LCrUoJL0OoKV9qNO/ZC5xJmLYVCckeoHJlyAS98vKDbGjvhhHeMbsqk7TYON4
         hUHupyeFVTLO2+ucyGcsN1s44h2GgkhSaEx7CCcYgChXkrd8JcCgfkQB7ALohlhuqyBm
         DH93KRiIJceoGhv+xJsouyN6ncwTJ+YZ7VnYJjzIpdkcIAiC1awM5nvcDdWMYu3d/EMb
         aaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690967172; x=1691571972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hu7P5NCl9aaC7aDT0yq18Lt0mz/hHx0pz3Esj4sF7tc=;
        b=hILvICdms838Wjt0ra7PQvtFMMwdtbrnO/pB2GGAYcmD2fZxNU/n7B5SNjgdv0kCZ4
         17yeb8t4swQbCGW3MqprDEEctD5/YaGU3djqLHk61yZ6ubeqh6eMDSt5DhXsfPBJ2zIU
         FTU3V32HSaq91TWBEzvniYahG6ORX06Ejgdswyj+Jz220gY3xVWEyqj2dyiMMdaVDgbF
         UgaQtvXSXvLaOj5o8A5il0WJCD3EQSsJAknVgpAWaQlNU3lBFw+qTKn2pGA3tafvuty4
         N2iUjL8ZiSnQSS4ZMq+vxMYtmYerVf37WZ8/LOUOQiIvc3ZS9TNvO8YhDIshjfHPR1ba
         vPZQ==
X-Gm-Message-State: ABy/qLaYR5hxiSsYjeR2/XlP/4RjACiHkjxez4JfX/eN9rhVKHAxUuG0
	OUFkLNNvMLMYyHmxzoR7444hPTnyH1l4BSLRNp7Gmg==
X-Google-Smtp-Source: APBJJlEsXnC7nncMeMiZPH9VffceoGFaN6V3Qjtf1+JRBLMjYToZP6nobGWbHzAcwa7EngAI95KEKA==
X-Received: by 2002:a1c:6a0e:0:b0:3fd:2e89:31bd with SMTP id f14-20020a1c6a0e000000b003fd2e8931bdmr4472634wmc.14.1690967171602;
        Wed, 02 Aug 2023 02:06:11 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id u5-20020a7bc045000000b003fe1cdbc33dsm1157210wmc.9.2023.08.02.02.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 02:06:10 -0700 (PDT)
Date: Wed, 2 Aug 2023 12:06:07 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH v2 0/9] RISC-V: KVM: change get_reg/set_reg error codes
Message-ID: <20230802-7d4fdd5978afe6f5edbf9a01@orel>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
 <20230802-c76d712d088bc4b3057e3095@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802-c76d712d088bc4b3057e3095@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_020613_544657_8E7FA0ED 
X-CRM114-Status: GOOD (  24.08  )
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

On Wed, Aug 02, 2023 at 12:04:25PM +0300, Andrew Jones wrote:
> On Tue, Aug 01, 2023 at 07:26:20PM -0300, Daniel Henrique Barboza wrote:
> > Hi,
> > 
> > In this new version 3 new patches (6, 7, 8) were added by Andrew's
> > request during the v1 review.
> > 
> > We're now avoiding throwing an -EBUSY error if a reg write is done after
> > the vcpu started spinning if the value being written is the same as KVM
> > already uses. This follows the design choice made in patch 3, allowing
> > for userspace 'lazy write' of registers.
> > 
> > I decided to add 3 patches instead of one because the no-op check made
> > in patches 6 and 8 aren't just a matter of doing reg_val = host_val.
> > They can be squashed in a single patch if required.
> > 
> > Please check the version 1 cover-letter [1] for the motivation behind
> > this work. Patches were based on top of riscv_kvm_queue.
> > 
> > Changes from v1:
> > - patches 6,7, 8 (new):
> >   - make reg writes a no-op, regardless of vcpu->arch.ran_atleast_once
> >     state, if the value being written is the same as the host
> > - v1 link: https://lore.kernel.org/kvm/20230731120420.91007-1-dbarboza@ventanamicro.com/
> > 
> > [1] https://lore.kernel.org/kvm/20230731120420.91007-1-dbarboza@ventanamicro.com/
> >
> 
> I found three missing conversions, which are in the diff below. Also, I
> saw that the vector registers were lacking good error returns, so I reworked
> that and attached a completely (not even compile) tested patch for them.
                                                   ^un


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
