Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECC0EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdOdmcKbYp8/XlZNudsRFBLUB6ea3cfHz3WcXr5t7qw=; b=TlQUL8lfRFh5IG
	buVBo0XwSu8nfRspacXEPsxTxIwpTZRT52zLitMUnNs9wlqdFHXAGJG7nGD+pSpELfggCb0H8P3Om
	/381EgKNmHdYjERzv/6tAJJC9Ut4vH8GwRvK1I1c+vQ1AqYZT9e/PIhqAShwnCJQOBTmWMSf3EuyL
	SrNTv7ELPaXJ4MhBOoMWtY5QCuRPMhMF+29fBR6S38n12p0eycfsksJw5IciX+EDIqGWECmOSsUUN
	GVZuAODMUFKepRASG6k525Ut91KFwijzT11tjku4H9nNFyRyq+1fzRcktiN7Ybdl4givS7IaWxPrH
	dvz5H+DdMh0xKXSxZYZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMltF-00DR1V-0O;
	Fri, 21 Jul 2023 08:53:33 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMltB-00DR07-1R
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 08:53:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3159d5e409dso1802605f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 01:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689929607; x=1690534407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7y7kST04X30OHH1A/stSxg3XYvaPi1ZnxmarQZzdg8=;
        b=pHDY5oKQjp8Q91ECH+6XW2iQOIrXBXZPwQIAAcMgxXzWyNL/KySefuBqAyVSpU21DK
         b+8M4R744RCMZOeY75f+n4r1bDLK/TJTje83yW71atPHKlAAU6z7UOQzsFbFNg55w596
         48aXsiiRsv0h1pR6pOSZ4mGAfOf2dTPmf1fqjljJ1yWJHebdFpyFF6lm/8cOfxUwQ66P
         xEpKsVGculj8SU4ZH+xp17+VKANqr8IFcn9Pw3h31mswOGKNEq2ZK0UpB2b3IkqAusnh
         S/661EZM4MC7wjsW59Q2iEBO7AnYIiOTPadS19WUQcI0mH43+DKALV0kpvSRwij2HcZ+
         TDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689929607; x=1690534407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7y7kST04X30OHH1A/stSxg3XYvaPi1ZnxmarQZzdg8=;
        b=YXpnAHmRvmZtQKnghvRIWf9uD/5DJfarwqXOVLs4NZbDfYbCGwwEx+RaeOhwzSfRR8
         BH474VPWRZQpcG7r8Bfjbc2ZMbDsQOhrLwGXWgZUepGfttM8ydumZvUKWlEXjawa2jWQ
         i2FwgAhEUc4RqU5yRsZFrkB8rDM9XnM/DOvPbDbK5O7YtL4Ypy5JRdLmEH/znLID5CPy
         RuLOcvNueUu7273+RihVvHsvDEzXulmCzFINdibeBErqJJDsRp1gP0fu1KVl0R68gOfu
         0eghg82kjkmV1JrFbg1ZhxmI84NHWC3WcRJjUT5TOoEn9Yqm1fExKuksOGQnpzDyXL2Z
         r/fA==
X-Gm-Message-State: ABy/qLYx2uTUmLUbGB/ARFQWCM/0/Bd84h1qoyPhPHuB2yAhvNdRo44l
	+mNOpuk5B0FTlXNaH1QOL1fFOpibwpr7fwypIOs=
X-Google-Smtp-Source: APBJJlG9w2xIswKcRZzMU3QdYy5W4qG6EjB35HE/+V0qmbW0arhPWGM9xNE4Fok6PxDo7592bD5WbA==
X-Received: by 2002:adf:f2ce:0:b0:30e:56b3:60fe with SMTP id d14-20020adff2ce000000b0030e56b360femr1259491wrp.4.1689929607117;
        Fri, 21 Jul 2023 01:53:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id cr18-20020a05600004f200b003141a3c4353sm3556131wrb.30.2023.07.21.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:53:26 -0700 (PDT)
Date: Fri, 21 Jul 2023 10:53:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/6] RISC-V: KVM: Add kvm_vcpu_config
Message-ID: <20230721-dbd1895a2b4d06091fdb96f7@orel>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
 <20230721075439.454473-3-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721075439.454473-3-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_015329_488789_7740ADFE 
X-CRM114-Status: GOOD (  10.92  )
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

On Fri, Jul 21, 2023 at 01:24:35PM +0530, Mayuresh Chitale wrote:
> Add a placeholder for all registers such as henvcfg, hstateen etc
> which have 'static' configurations depending on extensions supported by
> the guest. The values are derived once and are then subsequently written
> to the corresponding CSRs while switching to the vcpu.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  7 +++++++
>  arch/riscv/kvm/vcpu.c             | 27 ++++++++++++++-------------
>  2 files changed, 21 insertions(+), 13 deletions(-)
> 


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
