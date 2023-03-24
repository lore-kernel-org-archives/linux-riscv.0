Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAF0C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 11:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbzFg+abyhPwuzub/RDKUVkE88moWmQYcfb4YWtTUk8=; b=NKbjI5IjlaOkuX
	+y6fCV9Q2vYnnt+n4IUu0VxYGTTazKZ0Ays8MZvrcupBti8Wi+S8vLC4GwuXxz3VBeHbGgvNexyh/
	UFT1D/Ozf7sFUJRAAdmrOqfKi/piRdGBgQHucVKCYT1C89tIiQYvIDF6LWyKfWU9uTkwxZdoympJg
	6GhIG/ny4ew3dIv2gHppKiS0dugl3/jkXe+RW1/zwGzKYFlYy5oqzEqJMjFgDhfGh6ayvSgTHhx2v
	auCK41ogXRBwlloyqUEke8OkugSiZc8IECj/Ucld6fBEC+hdraBwVnXYxwCc7nK3ir0xUZ8ZBTWZ/
	S4a2v6xkgN6l/oIQ46sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfffQ-004FnY-2U;
	Fri, 24 Mar 2023 11:33:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfffN-004FmT-2v
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 11:33:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id y14so1471200wrq.4
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 04:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679657580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9mfBPHWNXxTIV1nQvXSPtgehyiQ/bBaTzK8juytk8Q=;
        b=JaZ3WjwRx2x3DXON+Dzw4Die5tS3FHA3mLfgJNuYOXKL2mOZoXxFGo3n5hzThLZ40G
         /EVDXHiC68IvxsqXpZOIBM/Pe5gijz2+eysIVMGzklSx2s2z+AkcuUwoZT50r1af6tWZ
         9ciXPnXZtCXLgdOh5BuPX6a3W+ehk0txs7KfoDXFQo4wv1m/jsFrVG+TeNyx+RjDKSO3
         qh7PFciMXKkw1KT5RcFvVAgc3aXxUjHN5Ozo/4jep3DWASx1J1pl5+yuY8L0pcHVgeo9
         9GWhtnfA1YDsach8O3F9en4wX7ncRMhot+cLVEyAmNwyBM8jnFFaQ65Ja4N8nwFWJO1E
         9Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679657580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9mfBPHWNXxTIV1nQvXSPtgehyiQ/bBaTzK8juytk8Q=;
        b=hfHdjYQwbk2MTAUk6MAlQGayOLiFUqdWipUm3bMMOpBwDRKqzvM/Bjeue2EVBGYfid
         ZJDWu1gilklCjAK0DX8BuJJyspbFZ90CbPfq1zplEpp8yLmtf0k5IM9Zb5ebeXztXVbh
         vrx/u3O8jysjZ/CImxm6e7B9uR3T7gD6gKuN2/7iVJcUBaV1KHosE8cNB6Jrr7QYY/Zl
         RxVYuOJN/jXsiDzFCVBIqhSDt7flqBneq2y0t9U8kW8NuxPGz0ZjjsF56cbat0hhELnP
         bvSGLTqjvWi5CUEFA954aSVsQ8+L8hbABbmFnhOsprJkKciKNm+MKswV/KhIAlnG7Sur
         lybQ==
X-Gm-Message-State: AAQBX9cUXRj7pdw5E1kwQkazuU3igx6nOuADQysBYr8QuBxlkvcSTbP6
	JXmEv63yvieJ/PuvnCO7+mOMRA==
X-Google-Smtp-Source: AKy350aBxNX7eHqvxLnHFQWKp5rLscPVvYmFvx8SewNdH/IanXYNfineJs4agHM6Lz8XHBl3gEbZzA==
X-Received: by 2002:a5d:484c:0:b0:2ce:aa63:6dad with SMTP id n12-20020a5d484c000000b002ceaa636dadmr1658548wrs.45.1679657580544;
        Fri, 24 Mar 2023 04:33:00 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x2-20020a5d60c2000000b002cfe71153b4sm18204863wrt.60.2023.03.24.04.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 04:33:00 -0700 (PDT)
Date: Fri, 24 Mar 2023 12:32:59 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 0/2] RISC-V: KVM: Require alternatives
Message-ID: <20230324113259.jbfncctnclvkzjkz@orel>
References: <20230322192858.1189272-1-ajones@ventanamicro.com>
 <6d263b50-e2f0-4331-b930-c54e27f52fcc@spud>
 <427628e0-4c6d-4934-b873-fa1b81b7daa0@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <427628e0-4c6d-4934-b873-fa1b81b7daa0@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_043305_951995_9FDFED10 
X-CRM114-Status: GOOD (  18.77  )
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

On Thu, Mar 23, 2023 at 05:57:14PM +0000, Conor Dooley wrote:
> On Wed, Mar 22, 2023 at 07:40:14PM +0000, Conor Dooley wrote:
> > On Wed, Mar 22, 2023 at 08:28:56PM +0100, Andrew Jones wrote:
> > > KVM makes use of riscv_has_extension_unlikely() to check for the
> > > svinval extension. riscv_has_extension_unlikely() is built on
> > > alternatives, which means KVM should ensure alternatives support
> > > is available.
> > > 
> > > The first patch takes the opportunity to cleanup KVM's select
> > > list. The second patch selects RISCV_ALTERNATIVE.
> > 
> > Reminds me, I need to re-submit my patch doing that for the top-level
> > RISC-V Kconfig...
> > For the pair:
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Actually, I would like to take this back for patch 2.
> Per the discussion on the other thread about XIP [1], I don't think
> that KVM should be selecting alternatives like this.
> Would you mind if I picked up these patches & submitted them as a v2,
> alongside a patch trying to make sure that we do not clip the wings of
> of XIP kernels by selecting RISCV_ALTERNATIVE?

Hi Conor,

I take it that resubmitting these patches is no longer part of the plan.
Should I rebase on "[PATCH v1 0/2] RISC-V: Fixes for
riscv_has_extension[un]likely()'s alternative dependency" and change the
select to a depends on?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
