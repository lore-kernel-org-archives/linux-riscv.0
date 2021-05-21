Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE21AC47076
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 17:23:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 389F561168
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 17:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 389F561168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEAynHV8GNbJUuMG8Qzc8sXW1UVrMy6gKmG8NZjmL4Q=; b=MuO6mTn2wYTV1tclt+gxLYXuFb
	pT8PXnkJ/aW0PFZtiuYA4SbqOQoeSE1UEitItVT2i3C3QSzjopPVim+Y70+S3AlOhVKEX6mp0Rj/w
	UctuicL4l7iUZ06JARdQ9Xoay7mhcUG45JWqAZa1FWzpAUxh3sYLiJxlGxTkGcNmAkeJsadUhQeGS
	kwrgValg6378yN7InOUFq9t1p4v4yWDvZkBWygei9286gpzg9BT2qTjvx71o9oqfMtdVw8+OaOcEx
	61u+oHP3kpAPfqkJhYcian3tAWO5Kkf9x2A9D2AlD7X3vUEBDip3Q0a4KOkDu407Odd9in5M5TKDC
	lMBovp5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk8rO-000Tbu-C3; Fri, 21 May 2021 17:22:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk8r0-000TST-Jf
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 17:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:References:
 Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OxzA+Gn/ccTryb9Et76MKiO/XUXjIk86duT1i91PIbc=; b=EGarGTzvFKF/OKVFjQ+yvvWEO7
 8zSZKVs52SLD4vjtywdcrOnjZjMB2UF0GdquqUDkinAXe7VB2QJxp/3Y8FAZ7lUHWTeKts+q22xoU
 a2ajEirQIzVWBXc5C6Upl2XkBK9D/gHn5HiHnQnLcWc2g8z7Lvfdm2EGwLn1xtgmf89hxvA5DVdLp
 90roHDTrDdtLAAVoDiE3r57OQlGpyq83XX6Z5Hpz/wAyAQupy3FDTKySSG9gldB5eHhyL6LD+QAUv
 XptaZXkLgpj+opJAPVXtZD7rCTTuWH886cUTABe0DfRleTqhG8KJEnCpgk7dXr9RKbCxsEZGk32KU
 aYzB6GlA==;
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk8qx-00HJD4-Nu
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 17:22:29 +0000
Received: by mail-io1-xd2e.google.com with SMTP id a11so20912353ioo.0
 for <linux-riscv@lists.infradead.org>; Fri, 21 May 2021 10:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=OxzA+Gn/ccTryb9Et76MKiO/XUXjIk86duT1i91PIbc=;
 b=aq0lY0K3ymgvdxaaWh+7wFuf0qKh7K/+R9p5xjwFFufrr7GaSSw6pzHTei8gpQXWuK
 7LVEojqiUriV2Ecj3v5U8adtDbR+PndPTswQxXdgyvOirjC33kQ3eIhW4f3vcDU3vIPZ
 T52/Qzo691vuY+pjjpxkHRDycx+uf4MPqtTnZjyrJnBTP5Y37NGSGC6Q++V1CIeMbIGK
 3saI7RocnZIpu54MaN2tzvQ07whUeStvSnBHh4FsHRZ/j7dNhvbyfnMwxt440F4FzWa0
 JwLY2qIaTuiK4xENy5d2cRw5VyXL9nV/+EORvboQTxl1Qq7gwxxAyp5H4QWPgsHORloa
 11Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=OxzA+Gn/ccTryb9Et76MKiO/XUXjIk86duT1i91PIbc=;
 b=jADnVtTJ73mOUH/OQXhOfXFggGPr3AwZ7P7+GupgKldH9Xs8h3oLlmcsw8wFSBphn7
 gAWh3ynL+UDwy/KHaAO6W3aRcIEOsgEJ6jDOHOM0gYTRkKAVKthGnuV98kQ2o9mhL3AM
 61gIRs/c6oHFT+cqiMA0aZfLg9gyqfbjCMKr6fhQK9X5pTq7EZinc8KTxwcGG3XxS0Fx
 ELUbJhd31oRh7yvZ1JLGOkSCjDmiLPIv1rb1hPvbq48zYD4QLy56V1AgD+M/uad6UzGa
 IHeZXWAtSh/oJRdWpesXqG4d4PbOjDtgB5lm0xsdrUz4sj5FK92mgNclTUZ23wg7qc5x
 t9Wg==
X-Gm-Message-State: AOAM532UsfptXAKhnSma7yd5a9jbHVZnLq7nv7f7rIBsv7zkLFg3kK+7
 CSptklwlOneZzYInQvIobyljdA==
X-Google-Smtp-Source: ABdhPJzmpEELKtk7YrUKq2YtrdOM6YKc8MAFHH9i5izCQfeOTORlV5uPKQqiL4cTgEb/zlY4RallAw==
X-Received: by 2002:a6b:690c:: with SMTP id e12mr13365539ioc.69.1621617745956; 
 Fri, 21 May 2021 10:22:25 -0700 (PDT)
Received: from localhost ([2601:8c4:0:1be::1e4])
 by smtp.gmail.com with ESMTPSA id k13sm4535908ils.45.2021.05.21.10.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:22:25 -0700 (PDT)
Date: Fri, 21 May 2021 10:22:24 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Anup Patel <Anup.Patel@wdc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: arch/riscv/staging
In-Reply-To: <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
Message-ID: <9eb59267-542b-8adc-07-d795f5a43098@sifive.com>
References: <DM6PR04MB70811AC515371C5728DDE6A2E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
 <DM6PR04MB7081D11851CD0D3863C4ABA9E7299@DM6PR04MB7081.namprd04.prod.outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_102227_831691_9EE76C88 
X-CRM114-Status: GOOD (  21.95  )
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

Hi Damien,

Thanks for the thoughtful and considered E-mail.  I know you addressed 
this to Palmer, but maybe you'd be willing to discuss this a little bit 
with me?

On Fri, 21 May 2021, Damien Le Moal wrote:

> For the hypervisor extension and KVM support, the specifications are now very
> stable and while changes due to the advanced interrupt controller specs work,
> among other, are still possible, the changes will likely be small and should not
> cause much headache in the kernel.

This is the part that I don't quite understand.  If everyone -- including 
the architecture folks working on the ISA extension at riscv.org -- agrees 
that the H extension isn't going to change significantly, why don't they 
freeze the extension?  Could it be that the RVI folks are worried that 
they may need to make significant changes, and that's why they haven't 
frozen it yet?

> Given that there is already HW (and QEMU) supporting H extension, we 
> really need to move forward with merging riscv KVM support.

This is maybe a side question, but: has someone actually put the H 
extension into silicon?  My understanding so far is that it's only been 
implemented into an experimental FPGA soft-core so far.

> That will reduce the risk of seeing forks pop out here and there and 
> greatly facilitate Paolo and Anup work.

When you write about forks, are you worried about architecture forks, 
forks of Anup's patchset, or some other kind of fork here?

I ask because in the past, it sounds like there's been some concern from 
WDC that someone else will come along and submit an alternative RISC-V KVM 
patch set that we'd somehow prefer over Anup's.  That's pretty 
unlikely; I think everyone involved -- certainly including Palmer and I -- 
know that you guys have done the foundational work here, and you guys 
would certainly have clear precedence here, unless there turned out to be 
something wrong with the WDC patchset that you all wouldn't be willing to 
fix.  But maybe I'm misunderstanding your concern?

> For this, I propose that we create arch/riscv/staging as a temporary location
> for on-going work for supporting ISA extensions that are being drafted but not
> yet frozen. That will allow the community to share a common code base for the
> support code, and also allow more eyes to look at the extension themselves.
> This way we can both facilitate and accelerate riscv ecosystem development while
> also speeding up the specification work by providing constant feedback.

If the goal is to create a common code base for testing and discussing 
draft extensions, we'd be happy to maintain another branch or another 
k.org tree to hold these. 

But in terms of the suggestion to create arch/riscv/staging, I think 
that's just going to create the same problems that the RISC-V patch 
acceptance guidelines were intended to solve.  To put it differently, from 
my point of view, it's a feature, not a bug, that we don't send code for 
discussion drafts of ISA changes upstream to Linus.   But maybe I'm 
misunderstanding what you're looking for ?


regards,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
