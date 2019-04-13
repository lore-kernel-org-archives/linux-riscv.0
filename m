Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29A0C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 08:14:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 815362075B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 08:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fsyUYHBv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="MUlymysR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 815362075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KfcEetSZf8wWdUmuUeeXkUgDmAQPsbvJYTgTz9fa21s=; b=fsyUYHBvup66Vg
	jFcNJlB8IuMd56rQm2al4XsZPjAU2CJ/HRq4y8dShUZmoBC7IdXmU/6MOCgf//HzgwNBLLV5DAPAs
	n5t2lJ/GTysLY6xP+fKSKStPnDvfWM5VFwW84NBil/fP+rtL/JOzUHPVcgQ7jeICgWeI9nxTRaEnE
	SUz4XjQuK+TnrisS6zfROL2qyXfgT7s9JawgXfGQZEG4ISYljcU5tqBiY22p5T7bASQYgvJcPrPGc
	ttbIeXZKoDaW9QGQ7m+VhGg07TGKYOmibyinmF6Gqz4Nv7hnkH5Jfl9VR7Ma2d5CEIiC0neJC3z6E
	uKWiMCC9uNbzccAn5kWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFDo4-0005Vt-HY; Sat, 13 Apr 2019 08:14:36 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFDo1-0005VN-DA
 for linux-riscv@lists.infradead.org; Sat, 13 Apr 2019 08:14:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id h4so14869888wre.7
 for <linux-riscv@lists.infradead.org>; Sat, 13 Apr 2019 01:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wn4/xM7eXxUVxJInAMlGqk/Y3nt07oH+FHDMqGpVAZs=;
 b=MUlymysRm4wgBaNp4BGtjqDOxDRkuiyq3vIjJsDg9NI7vGsv28yqcy196A1I/2XM4g
 bQdyDqqp1FKVQXgYQB3JntfZ9xev47hXWHYZ3S236rpYCjFd12RJ2HgshuoK3AWPmG/F
 zMDixzU7uTPU3nOK1jDwnyvjvenxU2BMydAXbynNJx/WpUTJKAjlfxeapYfSHOffKFmM
 7wa0CSgniqQKLVqL/gOMLezWJuKUZA7yNr1MvpI9/mabhINCtfW1YC9gZGWt7GZb3gXw
 fWNoX7gjaQlUCFJnZPy4Sg3c3Svhgv5pgwLoGwFJCJUgYvMNKc2bxvE2/9+1SLNP05UV
 58HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wn4/xM7eXxUVxJInAMlGqk/Y3nt07oH+FHDMqGpVAZs=;
 b=V0+QAhFjVqTmo02a09WYmOleb052uLR7syzOCsP0EncG4SnmHf7NLzzXCdQnxEh87A
 cggl8NUxwhR+EcdFLrnHg2wP+0hS8ki9jCOFxasXFb13Jfm/ERploW98K29vK+F9kZep
 8n1KXZBv9CAaOKXhDyQpDUQ3mxnVPAQzBZpI90/ii6Wqq3hFeUX0YFwk7izVd4eeuSuH
 v4bhMxqXwc4++U0NAHf7iAIyNBRskrwiVhvgFzw+BlJ98CrigIwyPT3jNVCCQGpSeA3d
 3srcKZEWsZywNkIqjG6jua9fDs71fo6yvBOylGn76v40OTXW4I/CuN1dAvsE0CqIaM9y
 rGSA==
X-Gm-Message-State: APjAAAWd9ni9j0lGx3MeIA0OFooSUWyxbfmTs4sOpm+o+9SCzVMCNgiX
 PeBRjvnMijSqCyN659N510mgghPIwrc2Bpc3ZLfn3A==
X-Google-Smtp-Source: APXvYqzqckDrnbID+rwPmWPFrsdkd6YiQhJ9EDt7tuwu8rpor3/V0tbRulo6NCKekB1TnqaC5tp/OFqsx7G+JZL8iCo=
X-Received: by 2002:adf:f110:: with SMTP id r16mr685549wro.153.1555143269795; 
 Sat, 13 Apr 2019 01:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190413073906.53676-1-anup.patel@wdc.com>
 <20190413073906.53676-2-anup.patel@wdc.com>
 <20190413075355.GA30428@infradead.org>
In-Reply-To: <20190413075355.GA30428@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 13 Apr 2019 13:44:18 +0530
Message-ID: <CAAhSdy0wmMZxdmeo9bhVFNJy4H+DPg5enw2bKw6hh_AUpy0Z-Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] RISC-V: Add separate asm/encoding.h for spec related
 defines
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_011433_581024_F4662650 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Apr 13, 2019 at 1:23 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Sat, Apr 13, 2019 at 07:39:35AM +0000, Anup Patel wrote:
> > It's better to have all RISC-V spec related defines in one place
> > so this patch adds separate asm/encoding.h for such defines which
> > can be included in assembly as well as C code.
>
> <asm/csr.h> can be included from assembly just fine already.
> and we already do that.  So I don't really see much of a point
> in splitting it.

We would be also having #defines which will help us decode
load/store instructions as well. This will be used for load/store
emulation for MMIO devices in KVM hypervisor.

Consider this patch as preparatory patch for the KVM support
we are working on.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
