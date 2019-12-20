Return-Path: <SRS0=aj0H=2K=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8EFC43603
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2019 11:08:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F3024679
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2019 11:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h8LMUb4h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iENtrLMN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F3024679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nqoS5tYqLZszZEkeln6BME5bfDmS2wgCY0AhSGjAR00=; b=h8LMUb4hQ/hSoxEG2ZWvuCePS
	g5zWXdMFzFL0A5b0ag068Qg9oJLRHdeorcSVJlb/v0mVW66LLnmlJTNA3dMoSThFYLJiEpNKUeggN
	/ILj73F481TgWXd+kViPyaX3hbL/uxq/aT9se+rpcTKAoAeUjCLsng9CvKpeOJnKBEj/f9rGnZn/U
	7SqtX4ZhQDFk03a7eUGk/lCW1wH4LBNjCATn/USoV8TlLjPJ+hSDtX/z1skPIIeejl0QFKrWo2R++
	c1CLYbZjXzC/DhT4Bnyck4VbZ0KSCXM7Vm1eGtCHzlDuDWX/OUOiCw6lSPv3pwifHHWhkcPRwB0Wu
	fcT2SuMsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiG9E-0007R6-UA; Fri, 20 Dec 2019 11:08:44 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiG9B-0007QE-U3
 for linux-riscv@lists.infradead.org; Fri, 20 Dec 2019 11:08:43 +0000
Received: by mail-il1-x144.google.com with SMTP id v15so7646593iln.0
 for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2019 03:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=nqoS5tYqLZszZEkeln6BME5bfDmS2wgCY0AhSGjAR00=;
 b=iENtrLMN4QyPmh9JUuuZvwD52ZdaT+pz4AMAFeo1p6YilJzq/yewAvOuEJCjnCeXe+
 PGX9O2OmHO9VUVEE01iO/KApQ05qhoKzP79tj08wZyx9LnIIyEKfmmqAUy4/YhBPiCnS
 5ZjU/lX6L7w7ujWfWSTGmNuJ8xKla7xZ0ETZR68VrvP2T6EqEbFmPjEWLERFAzGoRljO
 IY9mldHGAp8Kw1zwaxXgjxH7RbfRrzXHST9FVGfzB5xsJhNa33PiPihKdaoL6fQ6uQct
 bWCvYOnrXRYHAcyqZ4QKrUnxWFfLvPMITTXhm8jZ1gsXqGkXpRPJMla4ZWtnZfQgkUqZ
 vufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=nqoS5tYqLZszZEkeln6BME5bfDmS2wgCY0AhSGjAR00=;
 b=XDqyBjTEHb1h21fPWB80HCiayQA9ZHGu0V+B2HLMHLa/3wz/PNepyJrhg8LdsQWgLJ
 S8pGPCvDaYcqYacW78auA/tn7/7IP7jxgBovsaBWSZlIs5DL5K7TF5JBU1nv8nH2rqcm
 mL/zcIvqiwVP8jmnapM9rqq0l8F9qOdA5XRLZF59zZkk2rp6PzMzdpbGxq5+3YvSsDX0
 iP9tYwBwiS50BV8ge7nmGUP8K3FCUH/f5IQXAMMmaEnwBoLLpVFV1Jyf8gq6TbwQNuxa
 0zm0MwqnG6RQzELPu5aMqcuPxwkEz7uvk2FUf/sqSp0AjyG7ctz8xB0Uq6F5Ezz5bdzK
 mCZQ==
X-Gm-Message-State: APjAAAWwBJGax+1QjkMMuTe3mCugEpFvd+ZwqLvGSndqP2uJFyCAEl8l
 bNH4rAfXFb5QeTpP7OU2GdquAQ==
X-Google-Smtp-Source: APXvYqzmtUBDHLQYZ/T8nMK7rlY4JPblpQvbwP3kEvacI2QUvVGsNhI0SSeNSwVqg4tOvZQd8uoUOw==
X-Received: by 2002:a92:1d98:: with SMTP id g24mr11386978ile.307.1576840120863; 
 Fri, 20 Dec 2019 03:08:40 -0800 (PST)
Received: from localhost (67-0-26-4.albq.qwest.net. [67.0.26.4])
 by smtp.gmail.com with ESMTPSA id n20sm3098227ioj.83.2019.12.20.03.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 03:08:40 -0800 (PST)
Date: Fri, 20 Dec 2019 03:08:39 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH v2] define vmemmap before pfn_to_page calls
In-Reply-To: <20191218082814.895851-1-david.abdurachmanov@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1912200307400.3767@viisi.sifive.com>
References: <20191218082814.895851-1-david.abdurachmanov@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_030841_982432_129150D4 
X-CRM114-Status: UNSURE (   9.59  )
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
Cc: Stefan O'Rear <sorear2@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Yash Shah <yash.shah@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <greentime.hu@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Logan Gunthorpe <logang@deltatee.com>,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 18 Dec 2019, David Abdurachmanov wrote:

> pfn_to_page & page_to_pfn depend on vmemmap being available before the calls
> if kernel is configured with CONFIG_SPARSEMEM_VMEMMAP=y. This was caused
> by NOMMU changes which moved vmemmap definition bellow functions definitions
> calling pfn_to_page & page_to_pfn.
> 
> Noticed while compiled 5.5-rc2 kernel for Fedora/RISCV.
> 
> v2:
> - Add a comment for vmemmap in source
> 
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@sifive.com>
> Fixes: 6bd33e1ece52 ("riscv: add nommu support")
> Reviewed-by: Anup Patel <anup@brainfault.org>

This looks like it was due to my error when resolving the merge conflicts, 
not Christoph's.  Queued for v5.5-rc, thanks David.


- Paul

