Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB45C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYKv/J2nkA6w85i0mKUriLzzMZhB2iAzYJ426PG6e0Y=; b=t5yTqyMSeb7gg8
	+V2SUzwmpd8/6lH8bhzDcxhrrgLXBp7+eFbpbT4OD334gYSNWuEUGnP3Uasf81XFAgR84suXkLzx+
	yUSLt6GvRnctwMNw16Rz2K9nTMkMDq6vnTsBobMqOOmGKSqa0jUCnqL6Vqy55qjbCpk8bHGPSFYyu
	+k3SM2LG2oFmPyu7ttaflfzA0omJTFM0bczr3DdzrSR30Qk2GWJ391mYrRhmlHQMSx+dTtfPPmMzB
	fC4BPp8d/MbgqEcPe8MCeJWKKbwW7m+Sw996clS6GL0cDkrf8aQaVwJlnChXlpJJmJWgAT1lsfBT9
	/SewlnCeMvIFLscYF8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZBw-0056nA-Ag; Mon, 30 Jan 2023 18:47:44 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZBt-0056k4-3v
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:47:42 +0000
Received: by mail-ej1-x62a.google.com with SMTP id mc11so12094097ejb.10
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pz4ufNPrbCDJrRIlkHtfnZ8KTN4KG4DGZR0L1qiySbM=;
        b=OPNJpe/KJTF4c06yWGma6YB9iHvK8CLP1GWLjI8ZirGdcqjIR/mSoK4JK5wIQHxcn0
         Fl/mzgLnkpTAft0+5+SYtMG3Xw+GinsV2HoIU5ep2iJQ9yBf6514qeG5u8QJc24vFJCG
         lSGt7tlIpq3qXQiDD0tZj+ZdCFRQzlpj+fiF7EfDJJRd342YPmun3+DJkkEOdHOzJNH6
         TdVyrlJYFDrMrzwdkcvxqy4bDwXQFt5gARQvw5nH8jTNr3MkaOCkK9BHl3nfY7octvZ6
         3QV4IYw3xWWES1xxe6gDOKlmqNgT0WWdVJeNtUomwJ5ft+Xm+KhmUVepGvqpcahXwn9Q
         o3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pz4ufNPrbCDJrRIlkHtfnZ8KTN4KG4DGZR0L1qiySbM=;
        b=1NwMpjFr9NaggScxdqtrYdVanzRwGIBhmVouuHxm+R6rsTVtprVI0/qG6vzKCbYp4q
         W2Yq4lnFYDpc75n9r13AJWA/3VEAfOWvsnRBo4KM1gOFu7/IjdBVwyb6DouMrm7WOFnL
         QJKKNqT2VM6NoH1bDpRm///QBkKqjl93yq3mrIoEyz/0ROYGYQmsOJZ5rLLXgXNhwWed
         p9HJU/s6ePYU6MpsiCrGXAtrXoOWOMqQOs6/bJQGDNMwpQ/8V6DA9R7YkVDVSNqFf2+n
         w9qbwBFYbTk+TePvXTQAA7KSkBdKthytm6E5HoPcbJEY4j9gTGpvlWsWDfV8RvDCC8rz
         G96A==
X-Gm-Message-State: AO0yUKXRWfpTvJkAsvfMYRlxk2k+F26zw5pN+BdH8K32GuPo0AGFHe5L
	wFt8NpC87jOUBSBwDAuEPjpftWCZ/hRDdIEz
X-Google-Smtp-Source: AK7set9t1VQo8S0LqliZrH1Qky97FQPQ3Up5uRMrBP63W9usp6wQFpZknlpBryCBElWqzXjEqKWn2w==
X-Received: by 2002:a17:906:7c07:b0:887:66bc:97 with SMTP id t7-20020a1709067c0700b0088766bc0097mr6466563ejo.49.1675104459484;
        Mon, 30 Jan 2023 10:47:39 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id y14-20020a17090668ce00b0084d4733c428sm7149781ejr.88.2023.01.30.10.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:47:39 -0800 (PST)
Date: Mon, 30 Jan 2023 19:47:38 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jeff Law <jlaw@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/6] RISC-V: Apply Zicboz to clear_page
Message-ID: <20230130184738.2lzxr57yunny5pxo@orel>
References: <20230130120128.1349464-1-ajones@ventanamicro.com>
 <e9990765-9df9-70f5-cc85-32773b35710c@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9990765-9df9-70f5-cc85-32773b35710c@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_104741_207478_089F7D0D 
X-CRM114-Status: GOOD (  23.65  )
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

On Mon, Jan 30, 2023 at 11:30:38AM -0700, Jeff Law wrote:
> 
> 
> On 1/30/23 05:01, Andrew Jones wrote:
> > When the Zicboz extension is available we can more rapidly zero naturally
> > aligned Zicboz block sized chunks of memory. As pages are always page
> > aligned and are larger than any Zicboz block size will be, then
> > clear_page() appears to be a good candidate for the extension. While cycle
> > count and energy consumption should also be considered, we can be pretty
> > certain that implementing clear_page() with the Zicboz extension is a win
> > by comparing the new dynamic instruction count with its current count[1].
> > Doing so we see that the new count is just over a quarter of the old count
> > (see patch4's commit message for more details).
> > 
> > For those of you who reviewed v1[2], you may be looking for the memset()
> > patches. As pointed out in v1, and a couple follow-up emails, it's not
> > clear that patching memset() is a win yet. When I get a chance to test
> > on real hardware with a comprehensive benchmark collection then I can
> > post the memset() patches separately (assuming the benchmarks show it's
> > worthwhile).
> So a note.  On the userspace side we are using cboz for clearing memory in
> memset.  While the data is intermixed with other changes, there's a very
> significant drop in stores and a host of related low level performance
> counters and a notable uptick in gcc #5 performance from spec2017 which is
> particularly sensitive to memory clearing.  We haven't seen any performance
> regressions attributable to using cboz across spec2017's integer suite.
> 
> I believe our current threshold setting is to use cboz for chunks >= 128
> bytes.

Thanks, Jeff! That's an encouraging report. I'll keep focused on
clear_page() with this series, but once I can get some numbers with
the memset patch, then I'll be happy to repost that as well.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
