Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C486C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 17:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gURs9ZSwPV8xniLUMAwjbCGUBkJc3JJt++g2TztHyBQ=; b=4gK+90QLUuE+Ze
	Aj88CNluwJeFMVPhRzqh8dP07cKy52LPymgc+XCPq8+TXWnxrb0pt1p5xrRXSmOB8qM1S1Z0ogUaH
	vfRw4bFUrf1vzvXFCjttsfs2Fxlmv1dIWwiMzi4GaiykRYdkZGebCMIA+vUqX6D6O/OB2yTwl+660
	oSymm0cRFUCeNNDo3ZXBIZ+bW73bCpjGGrZ8RFEOC7MEvEo3CKpXER1WSywC0x2pdTsYtnOo5hfz6
	bbowINh2oG+IPWvoDi6/JjKx42YDzmMBTwpqUWgo6K506H59Ou0fmF9wPd3C1a4oZK3jaRxa2Kf+8
	hZO42bmYV9y4esOy0eew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19XL-000FtJ-9L; Fri, 02 Dec 2022 17:09:19 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p19XH-000FqF-O2
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 17:09:17 +0000
Received: by mail-pg1-x535.google.com with SMTP id 136so4884769pga.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 09:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JbEpNpUzseZTQupf42Rj1IKHfu3QLHpqGxrYsl/wNeI=;
        b=mI5cA7a7Sg4TXS0Q5VfJBHIQvZ1ELh7hKpc8t0/8ipN5qOI6hp/FHLxfcP/hVRDl7P
         uQyB/HYT89CTdt+HkzoUetTK9gKWusrqfNO79ltDCsyA23omDi8YKC3AmYlXhZlQxuAu
         /fEsFl8gLO0PEgvinbnVwi8rBO9Ba+PbMnoy/k8tK2glpCxr5G6SvJ4hJpMuWvPZpVH5
         E3VosW0P14YRG2cOzOzTYkSP/FAXH8pgRonht5k8KDdk6x7ljewzNaK9uMvCc2qXdgH4
         zFi3S0RkARbtcDqxxZLnk46HSHdSS8V7JBcWI+/tQFwsfSW1THHtNRdqNchAAYIFnQ7v
         IP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbEpNpUzseZTQupf42Rj1IKHfu3QLHpqGxrYsl/wNeI=;
        b=z/+XmfI8iV1Rmfo5mVXFWd/t1mPkbijHsRBXhOP9PTRpgf05Bx6CG41FxHDHNR5/JZ
         od83Yw9oUvajfDuc7CAXM7psUkvJHOBV3OMfkzZnyQK9te14GzUY7JSdUo9XWuL2jUP4
         buYNz0vTg3S6TNi0cksqxERjR7TzZxpNDi48LIaMisRuYJ1GPpPBVJSyNCFdyjOLq1jJ
         u2+1pc/SQy9DjqAzB7Uew2Y7F32PrkGmg6v8QAikz5QZTvQT3HFpnsFxqDMioQsrUx6d
         s45SJSWDWKNj+kh7Gk4fC13FTTR8pz34qxqGFwdBUZrGQsrOGVPHjj2G2f7nI8YzEDHi
         4fxA==
X-Gm-Message-State: ANoB5pmN4EU/LZJWey/oKPIi7i9mmStwE18Zdx6+Q31+X37C+/8FNK+y
	tHHvvjh1J0hoGSM/bL1bAVjCRewBH3ZpDaRM
X-Google-Smtp-Source: AA0mqf4kl0zvfaDO4FTtGaa5lHreKmD7cstYdlvhz+MAO6zO8v0H85mFV60iIiabONC9Ox4WnKDcAA==
X-Received: by 2002:a63:ed0b:0:b0:477:9319:eb4f with SMTP id d11-20020a63ed0b000000b004779319eb4fmr47408147pgi.257.1670000953165;
        Fri, 02 Dec 2022 09:09:13 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id z18-20020a170903019200b0018853416bbcsm5879737plg.7.2022.12.02.09.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:09:12 -0800 (PST)
Date: Fri, 2 Dec 2022 17:09:09 +0000
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [RFC  8/9] RISC-V: KVM: Implement perf support
Message-ID: <Y4oxNbQwOldICdnw@google.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
 <20220718170205.2972215-9-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220718170205.2972215-9-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_090915_794439_786B8782 
X-CRM114-Status: UNSURE (   8.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 18, 2022, Atish Patra wrote:
> RISC-V SBI PMU & Sscofpmf ISA extension allows supporting perf in
> the virtualization enviornment as well. KVM implementation
> relies on SBI PMU extension for most of the part while traps
> & emulates the CSRs read for counter access.

For the benefit of non-RISCV people, the changelog (and documentation?) should
explain why RISC-V doesn't need to tap into kvm_register_perf_callbacks().
Presumably there's something in the "RISC-V SBI PMU & Sscofpmf ISA extension" spec
that allows hardware to differentiate between events that are for guest vs. host?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
