Return-Path: <SRS0=37yX=YQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6072CA9EB6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2019 18:27:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AABE2064B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2019 18:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YM57T3x5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lhTutehB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AABE2064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=phppEIvXinoTLWVB2IGp2Z5Pmr8R1s1hHwtCv/AAo0Q=; b=YM57T3x5b0Ulx8
	HoibkVH69gHtP6oWKUy3ImhRYLTk+A7WL01RM1UTvGjYrlRTlFBSH1fkKJqtsXVB7oAFK+ppfF8NZ
	bUrBFdVs1yhS69sMUqaUjrYJCiZcJvcdaJICXcm/dcLsE8SpeBzfyivjZYcs8YIdMxnKb+W1BOAIv
	pDstU2S4qPEykrXcDXjQfm8xWNu4LeBZL0eZXC0kcZ1DYjjoAHiIafw+/r5bZSJ3VHlai3g73E1IY
	xLaSNSvK8o+eTDJeyY9BA3EV+DKdSVxxc/KOLOA0Z1hU/ma4a7bt68jJ9wWvs4whmaCaZfzD5lZe/
	nb8N3zdFrt+vmq/G4LgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNLLc-0007JL-Lx; Wed, 23 Oct 2019 18:27:04 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNLLZ-0007IQ-MO
 for linux-riscv@lists.infradead.org; Wed, 23 Oct 2019 18:27:03 +0000
Received: by mail-il1-x144.google.com with SMTP id m16so13444831iln.13
 for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2019 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=RkJKF0j9uFpC5ZmCPsgCAHHsmJXOIc2DH5GNueCG5EY=;
 b=lhTutehBUlpS3Sx6m0ik9vQiyWMq9Mm3RK1rsUn+BBB9y7i42TJVwtVds2UiMmQxqp
 Da3S7H5S/7ut2hcHXWb3KD+A5PXjdu8+HpUZCxcDqOCb5qlAOz9/bwX0ZUysKytZnUfG
 bMOTkFQWdd1msxjCT8XD46RpW/i2scYQ8gugLGccBpVKHP9TDWOB4Kit60Bf3A0h6sVh
 J25+POfGR63tGMWUfsSUVg62hZjHMZx+FZnRLXBKXWcnh32SpljsVoVO+WXv5C6Q3Tfp
 teBHTpxBPVwvQH0+SI8HRWUVMllRVd8uWfJ0g6pYgvEX7EyhqE3sQn0lrgL7UTB43rCr
 cSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=RkJKF0j9uFpC5ZmCPsgCAHHsmJXOIc2DH5GNueCG5EY=;
 b=gMjSeHEKH2dXWwnylhEH+4I1o+MyWlXHd9uNNkxtMtxFNdO05i8XDdw0rVohFeODLt
 5a5WjCvzoS/c7D/uloTqRjUts29oYfutrNPOEWPlyuXLo579O7noXqJi7IHbnPMIFmbP
 iqVlnmy+DRtK3TWiq6QlFXa0R26pGaY2VHgIo2k4YdANpaQD198535ttwlc+8pKk7Pvx
 x7IebfhqlvhX7Z/uCuNKkx90qhafdubqeKv03v8i1mxjt4XkgJKOWUW8bNtl/j4nTmDF
 dgBNjs1k7RRA8WGLS9d5W7wTx93SGvrNeAXqRU1a+nn1JGXj41kWMqOwEVqbXbR9ywnu
 9ShA==
X-Gm-Message-State: APjAAAXl6QaVuMYSOm1N5eK8z3sa7hedIT5fbdI6pIhWhEYy+FxDX3Iy
 8U+5XZN1ErxPVH2XzDQT5j4wPw==
X-Google-Smtp-Source: APXvYqz4yApQMNxgNkvIf4Z212wXIfr5BHVblDav5IMfmoFupkkkKB890XCiKHQ+koqtI9ecP+82bA==
X-Received: by 2002:a92:980b:: with SMTP id l11mr22329851ili.194.1571855220737; 
 Wed, 23 Oct 2019 11:27:00 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id u190sm9474355ilc.36.2019.10.23.11.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 11:27:00 -0700 (PDT)
Date: Wed, 23 Oct 2019 11:26:58 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 2/2] riscv: Fix undefined reference to
 vmemmap_populate_basepages
In-Reply-To: <2f1d943a-6021-3a2c-1d04-2e5939925f86@deltatee.com>
Message-ID: <alpine.DEB.2.21.9999.1910231126460.16536@viisi.sifive.com>
References: <20191023032302.160388-1-wangkefeng.wang@huawei.com>
 <20191023032302.160388-2-wangkefeng.wang@huawei.com>
 <2f1d943a-6021-3a2c-1d04-2e5939925f86@deltatee.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_112701_760032_F71EF26B 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 23 Oct 2019, Logan Gunthorpe wrote:

> On 2019-10-22 9:23 p.m., Kefeng Wang wrote:
> > Using CONFIG_SPARSEMEM_VMEMMAP instead of CONFIG_SPARSEMEM to fix
> > following build issue.
> > 
> >   riscv64-linux-ld: arch/riscv/mm/init.o: in function 'vmemmap_populate':
> >   init.c:(.meminit.text+0x8): undefined reference to 'vmemmap_populate_basepages'
> > 
> > Cc: Logan Gunthorpe <logang@deltatee.com>
> > Fixes: d95f1a542c3d ("RISC-V: Implement sparsemem")
> > Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> 
> Yup!
> 
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Thanks, queued for v5.4-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
