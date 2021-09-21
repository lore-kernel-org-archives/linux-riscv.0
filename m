Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6D3C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 23:22:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE533611ED
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 23:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE533611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0klYSUeyYU2nsyU0227plex1hoeMW14SdMhP7/ap+IQ=; b=HcB+W96Pb98c5k
	c4dK8WZKyPsdKeVu5imRdaUQK+7rWV+fIS2LMMt3l/SMBcnAsgUHdTifoH45MUTG050x9vsOsUdgv
	3TW6nJpBD7pHhLuS6fu94isXAAF4k5ffDr6Tpz3txEFfomfE94NnjhV3y4CZrOLeZGx1c/mS60FwR
	/h2fmYmYMhyJYjevKfWeozY0E2FO4yAQN1+h4lSEh39muLGGIfp7FrNwRiqYdb93HQbNjcUDgh20V
	NRwAzZhV6JMc3pM7L8GxYrPDl2CosYPWjL/9DJLXBR2vmkwWcENoZH0FQSv8XbpB31P+i6LdlKGdU
	dHodQRl/Fh4AFDhits8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSp5p-006EHn-1N; Tue, 21 Sep 2021 23:22:29 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSp5b-006EG9-Ae
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 23:22:17 +0000
Received: by mail-pg1-x534.google.com with SMTP id 17so681934pgp.4
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 16:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SrgpsGNJ8rqjyV4/EJo88O9IIQbG0UxIB/O/sCFEHCQ=;
 b=Aek6S4Ex4HL+FlRX8wezQ0nSn8PZPLVSwGFM6Tuf5Vb5PRgM0t3QLU9WUHFeTsdzAU
 QtJBZLxCtSTzHjvsrBDZHuAtRs8M/UcTtn16UVPyICkA/9SmSo6/wgDRXNjilfk6+22r
 W51t+bozYpGIBCS76o+pBdu3BTXYTvAYrWg54kKw/zUklVknkRQaSR+HYh+NPP+yi8y9
 Yb/gjfeOPPT4vB//YCwqd+j/uNNgvnBzGOO9gtxuEZPi7zBRKotpsZHqTtUaIjyqVYgT
 sIUYBMdsmRG8oPPacCtBAXZP+CTj2FLeluAQ6fbuqzgy0II1EfOxhsPqM2kyF7AdcmHW
 W4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SrgpsGNJ8rqjyV4/EJo88O9IIQbG0UxIB/O/sCFEHCQ=;
 b=PugHKXb0TEulhcWfxhwB5XxoqTIB9k05uUTjD8wGKCE1cWMV3Bm7sN6zQtNutZx9CU
 YoyuXb1vsylFDGvoyQkrtTWNuBeG7Q0cdJJfXtlwSXw0avHpxCVC156qLeLlKyfkU9XM
 gnIJbhBYpt5CZxZ4EnoGvUMkoXiBwMO3CpD3zZhk1NNyaIL0iW6KXw/OlFkyQILulLoj
 Y1dQ5JLM//qIw2RLPiUDo+/soB9sns1QxwGWSsqCKd9SmjMK6Zu+zvWQfNYM1+5W/16u
 wmHK069hFu5Iq1P183Ku/KiApErI/jX7P71rbVfzsBKdICapo839O8aW6TAemHa5aYmx
 m+Rg==
X-Gm-Message-State: AOAM530tsN6wmJkDBArdqZCc2JOABj9bisIr2gwiQaUQG2so2y49uwVA
 X1uIFDDzFkZbOKqGN1Dj83ogAA==
X-Google-Smtp-Source: ABdhPJztKWJhnn4ll+uIjZV6ppsKBX5LhsnC09hXPT7pT0HwfgdemziHQj0i0h1tKYzjFbRFxZd+Gw==
X-Received: by 2002:a63:bf07:: with SMTP id v7mr30381034pgf.333.1632266534266; 
 Tue, 21 Sep 2021 16:22:14 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id gp11sm3483849pjb.2.2021.09.21.16.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:22:13 -0700 (PDT)
Date: Tue, 21 Sep 2021 23:22:09 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: peterz@infradead.org, pbonzini@redhat.com, bp@alien8.de,
 vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
 joro@8bytes.org, kan.liang@linux.intel.com, ak@linux.intel.com,
 wei.w.wang@intel.com, eranian@google.com, liuxiangdong5@huawei.com,
 linux-kernel@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
 like.xu.linux@gmail.com, boris.ostrvsky@oracle.com,
 Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH V10 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
Message-ID: <YUppIQxphCUK6ZLS@google.com>
References: <20210806133802.3528-1-lingshan.zhu@intel.com>
 <20210806133802.3528-2-lingshan.zhu@intel.com>
 <YSfykbECnC6J02Yk@google.com>
 <186c330e-be42-4c49-545c-8f73573b5869@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <186c330e-be42-4c49-545c-8f73573b5869@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_162215_465925_E1A6FBCF 
X-CRM114-Status: GOOD (  10.68  )
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

On Wed, Sep 15, 2021, Zhu, Lingshan wrote:
> 
> 
> On 8/27/2021 3:59 AM, Sean Christopherson wrote:
> > TL;DR: Please don't merge this patch, it's broken and is also built on a shoddy
> >         foundation that I would like to fix.
> Hi Sean,Peter, Paolo
> 
> I will send out an V11 which drops this patch since it's buggy, and Sean is
> working on fix this.
> Does this sound good?

Works for me, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
