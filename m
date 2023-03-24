Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617B2C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZbT3w0HvcbG0OWRzlRWb3GQfs5YDgk0j/G8qyGohCQ=; b=VeoCyIPTV9heR6
	7oBJgoEXLIP0CyA0XUgMpdvKSAiijJFTWOFwjsRxwpV+ZqIqI1lqe2oKwsc+j9k8NTwPrB8gNo9EP
	bu7upz8ha9fVxWCNWR7LvyLOqY/V+ZbZxL9kHUkigDUS5RwO3BuYycfb7WxihKhKAPXZZKnNYHkC2
	kkPnoH5w8cPet7RZWVSUcPY7VXgTkATe/LDk3tJ1h+F7J19If55om2arlwADFHN4VYydijr5FOj77
	k8SHGzTyNdXRlVqzi1mSa6SvpdWM9p9PBHdPGHJcIKkzgcd2x6i2pvCOMzlvm/+GIDGL4zeigKc8R
	RyJ03f+FePewY4KDYeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfg2c-004IWa-2w;
	Fri, 24 Mar 2023 11:57:06 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfg2a-004IUS-2W
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 11:57:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id m2so1542108wrh.6
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 04:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679659019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0unISm1YBF3N3u4OntuyZTyz64WUPRtz0o+7OArZng=;
        b=YXMMlF27QUTKyRH1BAGSxUvTD4ybqs5cxcjfarqa9r0dB+bDWv35cVDxfVt+oR3xTR
         qHwJ0BvHHK+liKcecydMhp6TJvK6kQt8UUydikByoG6W0PEL8UQPEpWqudrV1/kdsLAc
         4Jx0ZTTbY157T/nHWBieS/eDtmg5lIVrDMjWjuRRmObJVNX+gzdn62sYJ5jsNC1WAQeO
         1xJ3eD7wtLEEhUSw//gu5v7j+8sYp2i/vQPkYCDlNvRWFc50+8NLyKgMrBKgjOh1ZRCP
         VCwKoffEwdcl2cAyHRfPjf8lFvFy3Bs1pbdj7P7nkmX4gep5HVdSU+F6pfpgzEysVwoV
         xdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679659019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0unISm1YBF3N3u4OntuyZTyz64WUPRtz0o+7OArZng=;
        b=jxSQFA9Ew/OMfqKKWQLzgDQc7msqo6uj5Sk3qZRd8d6/2nSqfxaLat7SssFnZ4lfuB
         jzss3XR7KW8Y8iWqApmp0/xcZ93yXVtaN3ykmXsxrwsAaUzBUxbN1r1/lx4NTzo87Msb
         dDKgGmM/EGkr9rim4jlXDprsHOJSk/OJ4Dt7n69hkj3sM8IM1ne57X3v0VXTLZfgngmX
         UKH1x9qm9qYC9BeTuoFR/usnWAmde2TmePsCMsZ51omomcT6JofxArL1m1xZDsGYsPg5
         h1pHdPMBWGYTQ+oR7xKobsrbUAoUHzlGciOYz96PSC+GsByfWr/ADg7d9UCriZ6GYCgL
         knVQ==
X-Gm-Message-State: AAQBX9dnx4OUh2ut9w1W8lMYm8gsFuuTdPMvyHX/3x7DIW826BL8Pxmw
	10QwAbbdgEWrml1ytq2Q66HPig==
X-Google-Smtp-Source: AKy350YI4YSy6q90vi2zy6fOPKcDzbIyXuo/qjulHMB60ZqKeQKZd4Hk6rIO5h01CvkypuLrObHloQ==
X-Received: by 2002:adf:dcc6:0:b0:2c7:1b4c:da75 with SMTP id x6-20020adfdcc6000000b002c71b4cda75mr2255785wrm.69.1679659019426;
        Fri, 24 Mar 2023 04:56:59 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p17-20020adfcc91000000b002c71dd1109fsm18370048wrj.47.2023.03.24.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 04:56:59 -0700 (PDT)
Date: Fri, 24 Mar 2023 12:56:58 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 0/2] RISC-V: KVM: Require alternatives
Message-ID: <20230324115658.lqkdsdzntorchmso@orel>
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
 <6d263b50-e2f0-4331-b930-c54e27f52fcc@spud>
 <427628e0-4c6d-4934-b873-fa1b81b7daa0@spud>
 <20230324113259.jbfncctnclvkzjkz@orel>
 <a58c463e-a3f3-4a4c-8c6e-df707bbd76e0@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a58c463e-a3f3-4a4c-8c6e-df707bbd76e0@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_045704_823268_A0DCA9F3 
X-CRM114-Status: GOOD (  28.23  )
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

On Fri, Mar 24, 2023 at 11:52:13AM +0000, Conor Dooley wrote:
> On Fri, Mar 24, 2023 at 12:32:59PM +0100, Andrew Jones wrote:
> > On Thu, Mar 23, 2023 at 05:57:14PM +0000, Conor Dooley wrote:
> > > On Wed, Mar 22, 2023 at 07:40:14PM +0000, Conor Dooley wrote:
> > > > On Wed, Mar 22, 2023 at 08:28:56PM +0100, Andrew Jones wrote:
> > > > > KVM makes use of riscv_has_extension_unlikely() to check for the
> > > > > svinval extension. riscv_has_extension_unlikely() is built on
> > > > > alternatives, which means KVM should ensure alternatives support
> > > > > is available.
> > > > > 
> > > > > The first patch takes the opportunity to cleanup KVM's select
> > > > > list. The second patch selects RISCV_ALTERNATIVE.
> > > > 
> > > > Reminds me, I need to re-submit my patch doing that for the top-level
> > > > RISC-V Kconfig...
> > > > For the pair:
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > Actually, I would like to take this back for patch 2.
> > > Per the discussion on the other thread about XIP [1], I don't think
> > > that KVM should be selecting alternatives like this.
> > > Would you mind if I picked up these patches & submitted them as a v2,
> > > alongside a patch trying to make sure that we do not clip the wings of
> > > of XIP kernels by selecting RISCV_ALTERNATIVE?
> > 
> > Hi Conor,
> > 
> > I take it that resubmitting these patches is no longer part of the plan.
> 
> Ah crap, sorry. I meant to reply here after submitting and forgot.
> 
> > Should I rebase on "[PATCH v1 0/2] RISC-V: Fixes for
> > riscv_has_extension[un]likely()'s alternative dependency" and change the
> > select to a depends on?
> 
> I don't think you need to. Does KVM actually make use of alternatives,
> other than for riscv_has_extension_unlikely(), that are not gated by
> extension/erratum specific config options?
> 
> With my patch 2/2, alternatives are always enabled for !XIP_KERNEL
> builds, and will fall back to the "slow" path in
> riscv_has_extension_unlikely() otherwise.
> If KVM doesn't need alternatives for another reason, I don't think you
> need to introduce a dependency on them and just inherit the decision
> made by CONFIG_RISCV.

Ack, thanks, Conor.

Anup, we can either drop patch 2/2 or the whole series, as you like.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
