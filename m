Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318C5C54EBD
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IHn7OFw0mDGwEGn5m++qaQSyzbXYBtUXD0+ixisjDs=; b=fAHCdm7sWvHW9h
	NR2r5JOtE5xmu32Lpb2kxXg3LvO58nQbpfhls/1nycO6s7fTz51zuhDkPYKh2xeA9Ra7raV3liJmn
	RiWL3izUmrKaZ9BY3cRR+0CTRNQGxwXzODpKbICB+tWn/nxEh6OHK5/2j6Cor/c5MxxSL+Q49iPzi
	c5G1kECyvBnwwA+kHVzX1jmTRppTjDX34v/sUBPmHxW96W6qcLGY2U5xkj2NaaziU6i9gmDx0SNS2
	X7Hvq0YDTS1kie0u4G5bCbyAB/Clft2VH4+P7ovOUeE+TP03IyCTmJ1NOrx6azIjpSkRSIPYUTps/
	OY6JM0ZjH4ZlnfUjBnNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEP1-000yMh-Fx; Fri, 13 Jan 2023 07:23:03 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEOx-000yKq-EK
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 07:23:00 +0000
Received: by mail-ej1-x634.google.com with SMTP id mp20so3634209ejc.7
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 23:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWuYYVoSqXot/DOZI+j//EtGO8VULweHV3rtUrUQKts=;
        b=ja86f1GwueYMphnLJRJI+y8gdBDP53NwgFZ00T5Q3TkwtUQb4qfUWt1B00i9SggGUK
         INLTM0VaHEXQnm5mC9Y837MkP0AiDrUQl2LLpRdw6SE4zYa3z4p48is+LkXAvh5tCzqP
         RxKbu+Oy51lmZCKiVs9piG7eKrdmGOHcT2cCDYlSAwTPi4Qj2Z6/fx5/A6+hFvJKsoWJ
         2bAe6zqPvgqcpAZsDbjDlHXUu11YG/tYcWS8F5/qhHWhThlN3hJFt5ZvJe3d7xfnQuFP
         lL3t5i2cvnQqyfFZMJq9psHOOdXeRzlEvO0M0GBzPjVxEmfoXL7xM0BxsGigja0nNv5q
         bxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWuYYVoSqXot/DOZI+j//EtGO8VULweHV3rtUrUQKts=;
        b=W2pFB1/mxa+DUUe062nexmEwlaB4RkKsNE14oSTlOi8u+ETfXZ4+2Gxznxq5lGVOTQ
         W+0kSK+G8vNoTT/uu9VvdQZAlQ18l/vaFUdBnxD+vpwIpjtjJhDGH9FcHLRikHHo4wHp
         a7r0mnAi0RQmTNS6XyKDxNpUsluhsYOIZ3NqRN9Mfhy/nHeuV2l8eQKEfPeWDJQBP0Qk
         nozYG3UdVKD/DjEv5OWHLKSm10FM6rw4pM5RfAwxb/5PiUfcZqJzgYwXGzSNWjkmJzpi
         Jv+YsXeX0e9+aGlXsnx4iMEo69lne2lFuU19quoWuTSt18aWv5OJlI/E63wGQSJ9uaYv
         cQhg==
X-Gm-Message-State: AFqh2kqb0GNpubvX2iVPt+pMSIofK4OEjGZkw93lk+VfpM3+rK4QXonQ
	kBdlZSzhmaipApNm5gkQuSy29w==
X-Google-Smtp-Source: AMrXdXst/nbGaFkV7tpr0xcLPzua3V2BMbolci8e6vxk00MeX1OaHUgkB3WAdHNwxahT4gB0JunbNw==
X-Received: by 2002:a17:907:c70b:b0:7c0:e535:13fd with SMTP id ty11-20020a170907c70b00b007c0e53513fdmr71184178ejc.70.1673594577254;
        Thu, 12 Jan 2023 23:22:57 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id q1-20020a17090676c100b007c0d4d3a0c1sm8262849ejn.32.2023.01.12.23.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 23:22:56 -0800 (PST)
Date: Fri, 13 Jan 2023 08:22:55 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 01/11] RISC-V: Define helper functions expose hpm
 counter width and count
Message-ID: <20230113072255.34cnyautbwiy25p5@orel>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
 <20221215170046.2010255-2-atishp@rivosinc.com>
 <20230112100608.d7tnvhbotjfctlgk@orel>
 <CAHBxVyESkQ9Krmn-44f-A8hYzMrZBtBfq15fdx-sHDQfkBMtKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHBxVyESkQ9Krmn-44f-A8hYzMrZBtBfq15fdx-sHDQfkBMtKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_232259_504580_4FC40EE4 
X-CRM114-Status: GOOD (  14.77  )
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

On Thu, Jan 12, 2023 at 10:18:05AM -0800, Atish Kumar Patra wrote:
> On Thu, Jan 12, 2023 at 2:06 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Thu, Dec 15, 2022 at 09:00:36AM -0800, Atish Patra wrote:
...
> > > +EXPORT_SYMBOL(riscv_pmu_get_hpm_info);
> >
> > EXPORT_SYMBOL_GPL ?
> >
> 
> Is that mandatory ? I have seen usage of both in arch/riscv and other
> places though.
> I am also not sure if any other non-GPL module should/need access to this.

TBH, I'm not sure what the best policy is, but I presumed we should use
_GPL when we aren't aware of anything non-GPL and then when a day comes
that something non-GPL would like this to be exported, the patch that
flips it will provide the justification in its commit message.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
