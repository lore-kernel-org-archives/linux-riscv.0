Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020C5C636D6
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpXeigs+vHIazwonl8geEt2o5+8lJ0W5CwTgk3CxRkI=; b=IOf959/peXnp5k
	h82nHqvOrFImlKyQxum+i2wuxD65NQTZss8aJo1+G0fw6mZte+9sUzThPcaAEJhgGb7LTcT4kI7cM
	lX+UX0G2r7cHV1OjQHtOr59Ksrm7egjY+O2aVlypiNNKWQu8JgVJrTWGnhZnyDanA59llQp1ogOzJ
	8jMrNxUqmewcIsT6X41m3HK6g2J83rLjsytgWlgO2Y70Za5fTbat1BJ7kVAtHAXUSefmxEJZEAwEB
	dvmD5qghgugNORo0OYfryYlvY+6K2IBCQ9JVXIWztlRdF6O7+V5nHBQO3s6aLV+TaINVps43pbl4P
	lK84uJ7k6RkpThoCE6UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUBle-005Lpo-To; Mon, 20 Feb 2023 19:24:06 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUBlb-005Lof-QF
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 19:24:05 +0000
Received: by mail-ed1-x52b.google.com with SMTP id x10so7756908edd.13
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 11:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+W576wch7Ejl3mYpyTbLAtA/crTpFO6iA/dT2MnKVPk=;
        b=YmcJMXcQtNzGVqS/1S4+SXkh7fpGR+cxbvx4kLpDqCnJ6l2oPTpKeeG6vgaRtzFd8h
         kdpxTdaRsd7N0T9UkM0rqrOwKdkjMwk6slrRgr2XvOaid452FC5hawyx3wXVIdWO9uOV
         mDPo6h4gC/k8/Eeh9RWjqW2nQanCVP97XQxWAAMmNM8hsvi72yuaLMRKcTbsF7iu2SMc
         AZstHlgQCu1xXWSEwDXsl2SZ0nCqmCdFJ+bBt3oFrXyQsdwC5zUs+Losj1NooyhAgRYz
         4x6G5PU0jMS7ov/CW4L7Xy+g13oTYToEFHG2kRbrWOLUFHRiw+vj9J0sgKpQOABkHTx2
         FX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+W576wch7Ejl3mYpyTbLAtA/crTpFO6iA/dT2MnKVPk=;
        b=gXEIkWW1DxXFzRAXBfbsOZZbSrvc8esjpSg+yJKBLf8k2/DAXxSPTxVkYT6KRs14Bn
         wrnt/Y6rlX/5hRBKmIQM8+aT8skwWWOqjh6sKA8C3gJ1RKqDCck0U4kn11HctUjcxZOr
         c+0R93+mKWyOotmP/TNdTNizaqSSfso6JUKmDGicvKnds081/JHAn2PT7lm6kCwDqzdx
         Bk2jDGdmtL2iaJo2lBBfl5YhXRZ3P7Dp5I+eg9A2Rdj1qvolnjZlqIeE1BCex/F8cdfg
         OaYZjDPMfI2wzUCjahkGwjVGnWAp3soX86Pf7fVtNu3JjI4YencUt5OfgJOoiquYiazX
         7yIg==
X-Gm-Message-State: AO0yUKUErlHl8nEGFta8W0wTfwQxAesMejoZZ+pwLJo6F/AK+IlQLJfO
	vLgjDnLxBI64jKvkEySZL2RCaA==
X-Google-Smtp-Source: AK7set+ZJwmHPuEnG8sjgTeIL2hlMtKAC+ZkKZcmGWa0p/43DqnXEafw6jrJ95Ws0rgy/oUj7mUhug==
X-Received: by 2002:a17:907:170e:b0:8b1:3483:e3d5 with SMTP id le14-20020a170907170e00b008b13483e3d5mr8615511ejc.48.1676921041285;
        Mon, 20 Feb 2023 11:24:01 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ke27-20020a17090798fb00b008b12b9c6c49sm6135924ejc.125.2023.02.20.11.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 11:24:00 -0800 (PST)
Date: Mon, 20 Feb 2023 20:24:00 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, 'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 6/8] RISC-V: Use Zicboz in clear_page when available
Message-ID: <20230220192400.ycqqugbrgqyvorqq@orel>
References: <20230209152628.129914-1-ajones@ventanamicro.com>
 <20230209152628.129914-7-ajones@ventanamicro.com>
 <4a25cf89-bcf0-e78c-a8ab-7ba0c4f8e2bf@codethink.co.uk>
 <b348f0cc-4868-2924-9935-00ec18b36da9@codethink.co.uk>
 <20230217122943.24caosketyvfcc4f@orel>
 <ff11ad0f-7ea0-1dd3-32ce-5a28c8816397@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff11ad0f-7ea0-1dd3-32ce-5a28c8816397@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_112403_859149_2D4996C9 
X-CRM114-Status: GOOD (  14.59  )
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

On Mon, Feb 20, 2023 at 06:43:40PM +0000, Ben Dooks wrote:
> On 17/02/2023 12:29, Andrew Jones wrote:
> > On Fri, Feb 17, 2023 at 10:50:07AM +0000, Ben Dooks wrote:
> > > On 17/02/2023 10:18, Ben Dooks wrote:
> > > > On 09/02/2023 15:26, Andrew Jones wrote:
> > 
> 
> [snip]
> 
> > Hi Ben,
> > 
> > I'll be sending a new version where I don't touch vendor-id anymore, but
> > rather break errata_id into two parts: id and application-data.
> 
> Do you have an idea when v5 will be out, if it is this week I will
> hold-off our internal tree rebase to change to v5.

I'll bump it up in the priority queue and try to send something tomorrow
or Wednesday.

Thanks,
drew

> 
> Thanks!
> 
> -- 
> Ben Dooks				http://www.codethink.co.uk/
> Senior Engineer				Codethink - Providing Genius
> 
> https://www.codethink.co.uk/privacy.html
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
