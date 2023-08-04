Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09468C001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 14:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDVrX/CEu+Zyn16ApfSUiG08EXXlk0LFHs9XnCMk+z8=; b=tdXKfw+xftheDh
	sBJSrgQrrU9/CebZRUIXBG3EHvypQq1z3+4Gr735yDrey+yXeMap6nsetk+5jC2ynz2j/o6sVXJL8
	eQQqstF9KN/6J2FjL722tymoDewvhLkF83c//vlgjKEKwLr/iwpO6Goli6FsYoTI++A1xsnwDkSaR
	JiLF4qnQyO8ge1LHLcS4rMj+WidAoBim6muimT4Jkj3dN0acZ7BpufqzcGZgtRrdVODlWyuukQWkL
	5wfUqL/e+rIWONVLmRkjEDxZAtl+A9q9zsexnvg7MjSxMLDfzkWWcwY/FYd3A/+O7+RhSl91j5taS
	wNzQLTTmJpLMEmyKDCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRwHE-00Ce8T-0w;
	Fri, 04 Aug 2023 14:59:40 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRwHB-00Ce7E-1w
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 14:59:38 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99bf9252eddso315255966b.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 07:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691161171; x=1691765971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=haxLgvz1q5Yk+iNcNNjz/9sW15Tc+C/ITeGdkf6c1Xw=;
        b=RJB6NZdNzd1Lh6Jqc36CBFKIVo8cAM5yWAWNitJuwtX2kayu+YJa0b9NxROOhM8QGX
         MknqGyaLe098qy454ihbfmo3j9gWn0mL+lx8faq4CnLIxhzXLK5NdeFSgCooWJEjqXRD
         5JDmWJgP/tHIGq4tmaXUiwuyv3/gPxduVPGbs0bXzjfjtyzoXzv86C2AXJJETh1UiQxx
         eoBI8irmtXaxOTj9njvL7v7TeDmAue1fUXBnIv4IM4nRXmMoOEORDBN2BQB34hyUTP8S
         WUKosBTUZezVw8tVUbRQs1aZpQ+yNQKCUVl76lthEr9a/7h1iwqcUmsY16kJlHS91zaI
         5PBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691161171; x=1691765971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haxLgvz1q5Yk+iNcNNjz/9sW15Tc+C/ITeGdkf6c1Xw=;
        b=PzNJ9BW1F0UAzLvpZJ82miY/Eclal9Npdspv0wGHgfqmZVsT3Q3TLxGW2HMheNgsQ9
         Qk3JSxycH+y3DGlhkcznLt+CxSsYvj6uxGAqX/cs/CcqvYrdVlELVcRfsJCLOaeIqVkN
         oOrlYWStZvACRR1/fGbC8cIFipsKIhf3zAo8uVso0XSKQ5BV96MT5GZvsaiQfX4+bNGB
         GzM2woLREqiopmhEJyZL3VYKQWgWjZrH+18Dpa69tAbT/RHSFrVUCtsipA1Le57i1MGW
         8x7ky2xHnhGGTxCKDifIms7MzcbCID8qRQVXbxpIgVd9QavglDKsNW+iO5ph0h3rw2to
         Vr/A==
X-Gm-Message-State: AOJu0YzoQUAwQgi1KPNXG2nkOMQRV/93oS/K9ZoRmyaTI382WooVPR48
	UjZpBjH687mchSyS8+/Ax4s=
X-Google-Smtp-Source: AGHT+IFVDjRaAumBCGtwmib5tiD99UgWEki4/WYWHl30CXnstywEC1ixz7bEyyhr8vcpQ3wmFJAp+w==
X-Received: by 2002:a17:906:100c:b0:991:c9da:70da with SMTP id 12-20020a170906100c00b00991c9da70damr2010322ejm.61.1691161170479;
        Fri, 04 Aug 2023 07:59:30 -0700 (PDT)
Received: from andrea (host-82-57-177-142.retail.telecomitalia.it. [82.57.177.142])
        by smtp.gmail.com with ESMTPSA id re8-20020a170906d8c800b00992076f4a01sm1413167ejb.190.2023.08.04.07.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 07:59:29 -0700 (PDT)
Date: Fri, 4 Aug 2023 16:59:25 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paulmck@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, mmaas@google.com, hboehm@google.com,
	striker@us.ibm.com
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
Message-ID: <ZM0STfpkRSfNQBt8@andrea>
References: <20230803040111.5101-1-parri.andrea@gmail.com>
 <ZMvLoI6PxLR8RJvR@andrea>
 <4bf79f06-4593-134a-04dd-b8f89e96a1b8@efficios.com>
 <ZMxDe0gXKYbY5jgt@andrea>
 <65350c17-3fcf-a057-a280-f6a5d36dcb21@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65350c17-3fcf-a057-a280-f6a5d36dcb21@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_075937_642766_8EF115B3 
X-CRM114-Status: UNSURE (   8.15  )
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

> What is the relationship between FENCE.I and instruction cache flush on
> RISC-V ?

The exact nature of this relationship is implementation-dependent.  From
commentary included in the ISA portion referred to in the changelog:

  A simple implementation can flush the local instruction cache and
  the instruction pipeline when the FENCE.I is executed.  A more
  complex implementation might snoop the instruction (data) cache on
  every data (instruction) cache miss, or use an inclusive unified
  private L2 cache to invalidate lines from the primary instruction
  cache when they are being written by a local store instruction.  If
  instruction and data caches are kept coherent in this way, or if
  the memory system consists of only uncached RAMs, then just the
  fetch pipeline needs to be flushed at a FENCE.I.  [..]

Mmh, does this help?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
