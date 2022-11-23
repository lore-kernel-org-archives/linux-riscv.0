Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356C6C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 13:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9OKIdqW4Sypc5ETeFI+PLIgdvT0Lb3Zd+KiJuxlCs4=; b=J105k5Bx/9SubU
	T7acORAn+SoLhK6NsWA6aY4w96ptb6OYbPHgs5Ccb4jZHujNkgJEcpbAtJxr+R2UfslbL6l5uZxfy
	/cOVXD1QBHTRfAnyxAUSLKpTpBGxciiX1dQ6OBVqY5Tk1DnOCO7VXKLA4a3+7Le7e559pPAVPJ4sr
	GjYW4cvNSxtUJ6N/ZIbnruJbdbvGT0U9NkZlxnI6C0Vpb8BG+iwat6/1IWv2yqRbmVYXSUC5cX1qd
	b/zAho547U+Qtada9d9oXVBa3tfHz95mpJ6hqJOWiNqcGp3CudTew4jbOyiL15sRUff93qI/4JHjC
	gD/6phQuhhfktlJMUPzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpX1-00H9N7-91; Wed, 23 Nov 2022 13:11:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpWv-00H9J9-Tn
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 13:11:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id r9-20020a1c4409000000b003d02dd48c45so1067565wma.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 05:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qO5DEzg9eRRuBV8jaHiQFeKu/GccCwk1qPJfoU46Cww=;
        b=CnW9K5MsY6Wf3jSh4utny6DqmahPNJagWfriIUNy/qkhQn32bRwL97MDUUxOZnePgy
         FNj9HyyK3YrOn4SJlbbd0p0tzEzvPBASXSZxdsEzqRQjbLbAoqwCmzTg3x+JE5kD3uF6
         OPIYScYRFaexia9m7Q+XiCf8wJJIOeuMu4BweOJRP5UCLo3sujWNFSCrgRP32HNL7hR/
         cytBZ4+TqETXckTFUcKymTjTCM60UNgWiTLFmJN1MweY3sagJKkpu9ODoHe1Yhp/k8+5
         NGpAK4e+LCmx96FgecBhWn1uOBVCA42nTf4wb/bMXvH8ndaqKyffyhmywl3KlYDCH3bI
         njxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qO5DEzg9eRRuBV8jaHiQFeKu/GccCwk1qPJfoU46Cww=;
        b=4fDD79KEpzklqEXHMrZcUQshyBtLjQHqf2rEPoujSWIvbboIGkGS5pTsayEMQMCkhS
         /+s8lLdgttgiJrZY0tzoi9G0d8vbn9wiixoV8qjt5L+YIwmznylYHLVy6ZECypsoBjzI
         jjVRq1z3kF/N0mVQeqJWtuOMqu7kItJpC2PNzEjOCZuVr9jZBLH+8Vg9s+wTINy2DJQV
         rKV1qW1TNKnbTw1v7wSfaNb+TnNlWih74iLVH2DaoKF5wPtIycVN7q+a2/cb4QazMCEX
         LpstGRlDkI5C/q4NLHL8N2FOwuTRdwL2ck2/wO0GW3OpiXlZZHDcLA7WDqPDm1mT/ceb
         JFCg==
X-Gm-Message-State: ANoB5pn1WX0uPCmLoy8TqT1gIVe/yXsREzxOzITSGZv/V9IDQOK+MIEA
	ihoYcaJcTaYPlGS0scWnNGd4gw==
X-Google-Smtp-Source: AA0mqf76uYwMlzyOM+qud4kNA0YszPN/V2Rdqoq71qfx3tbuoZucNH9evqNJ+7NlMDTFJJOvHad5ug==
X-Received: by 2002:a05:600c:4f12:b0:3cf:e7bd:303a with SMTP id l18-20020a05600c4f1200b003cfe7bd303amr7157554wmq.151.1669209066243;
        Wed, 23 Nov 2022 05:11:06 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id dn14-20020a05600c654e00b003cf4d99fd2asm2372934wmb.6.2022.11.23.05.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 05:11:05 -0800 (PST)
Date: Wed, 23 Nov 2022 14:11:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC 5/9] RISC-V: KVM: Add skeleton support for perf
Message-ID: <20221123131104.zglb3osa5tsgkkkb@kamzik>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-6-atishp@rivosinc.com>
 <20221101141329.j4qtvjf6kmqixt2r@kamzik>
 <CAOnJCULMbTp6WhVRWHxzFnUgCJJV01hcyukQxSEih-sYt5TJWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCULMbTp6WhVRWHxzFnUgCJJV01hcyukQxSEih-sYt5TJWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_051110_002043_A468EB66 
X-CRM114-Status: GOOD (  17.01  )
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

On Tue, Nov 22, 2022 at 04:46:14PM -0800, Atish Patra wrote:
...
> > > +     kvpmu->num_hw_ctrs = num_hw_ctrs;
> > > +     kvpmu->num_fw_ctrs = num_fw_ctrs;
> >
> > Maybe it's coming later, but we need to give KVM userspace control over
> > the number of counters to allow it to migrate to a larger set of hosts.
> > Also, a previous patch said the virtual width must be the same as the
> > host width for the hw counters, so we need userspace to know what that
> > is in order to determine to which hosts it can migrate a guest.
> >
> 
> Yes. The entire user space access control needs to be sketched out.
> We probably need another one reg interface to set/get the number of
> counters/width.
> 
> However, Is it a common to migrate a guest between different hosts
> with different PMU capabilities ?
>

Ideally we'd be able to define a virtual CPU+PMU which represents the
least common denominator of a set of hosts, allowing VMs which use that
VCPU model to migrate among all the hosts. x86 pulls this off pretty well,
but arm64 doesn't. In the least, I think a goal should be to enable
migration of VMs from hosts with less extensions and less PMU counters to
hosts with more, as that would support host upgrades without having to
recreate VMs.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
