Return-Path: <SRS0=zF8f=YB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2482DC10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2019 21:34:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC0C2070B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2019 21:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oWCpqLiB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hsox7f1O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC0C2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2Mf1ZK9GeUTi5akgpk9P4D4U4UlSEx8wBP187QIDbA=; b=oWCpqLiBvflHiq
	osgvV8SRBHpGvtuvTVVCMgPbfzNWh4nVd1wMC4rMZ3opzr491/hf/KzgE69Gvvb0MM/1EpRPhPZac
	Gh4+DlntDMkQkuf1ReaVozNwVZuiKFdvolqm9RzZd16P1vMnLNsLoaFt/ypB8OjXOYsj7dTSfc2MQ
	Z7/zQ9M8hb7A51zVo7fZFKRu8ZDPs2yYnn1Cmzd5dl23tLZkM5LjKEXB2wVUKLIhRjRPqhrWZe4Mc
	nFFv3L6DTcSEZ0VNf7Vy3uTaKsH83YfIw2WvK1kEooRcOlE6+7p1PXMbu9RsVANay/ttDYT1PDiTN
	d9iiE7bG15q2svpEYzxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHx7O-0005Tt-1F; Tue, 08 Oct 2019 21:34:06 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHx7F-0005MT-Io
 for linux-riscv@lists.infradead.org; Tue, 08 Oct 2019 21:33:58 +0000
Received: by mail-io1-xd41.google.com with SMTP id u8so298683iom.5
 for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2019 14:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ZuBgbJzoXltmhH0lNq67zyda70EYzZtMbVg27O16d4E=;
 b=hsox7f1O1JhOkCIRKYbrxjgajBPsOSDqi7B1Lgvugxaamtq9i8nHkkuJBUx+fuqpmy
 BAak+i52MGnX+KzvK730xUE8OgRGhRjWhnGkFA0okRMkJZ8lV6Q62WhiPg+6n0vFgHbL
 VCEAwKUPWz0rPth4e7crkTcSlit2voXqJ0ejpl9sJAU7dNLLjT4gqcHH0rIgjJllHUEy
 PhH3RYFcBRHAIgaKfDAF6XcaX/IvuwtFwRKYJ3kZi33kqKQ1pMfAy1jUs6Wj0FZ/F1G3
 kGyRJLvuLqMwxBTP7vx/7G4QtZd9roGDtY1NKikyRwzKqH8JMU5sTbhDnrBfv3XSNB4G
 +aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ZuBgbJzoXltmhH0lNq67zyda70EYzZtMbVg27O16d4E=;
 b=Q0/c0GpwnXbDOZe/cvhV9J7Dg1YJz8UVTw1T7rWkkB0E7fS0RdyDJCK+04BPAoIod4
 D6Hd/3jPqrLlVtQSqTAx2l3BrydH/bmWuO7jwvKhjn+o8aY+L/uNy+WwSTVmd3LKpHTo
 JyEPIphXQP5bccMJlrNOrBJm8kPmc7tK1jxNkdUyn6q9zkXporNIn3K0N9uoGqmsO/nS
 RbqZnQNsZBCJFeOHZ75lHnQTn5SYyBYkIsotOT8TshPkgvxy5ire1Lp0RPgDuIV3GjJS
 wsmSM7bvLGDjqL64jfXNCwSCPTD9ckL25itdDOEbq/ghgDSQEzVY7osE0QmkyTTwk93x
 VaPQ==
X-Gm-Message-State: APjAAAVqHCabPEF1d+A7DilZghKl7sdFAegd4TRSX9gLkF3ptnDetQ3K
 pNJr17p5DkKzCPflbrk2s5xhKw==
X-Google-Smtp-Source: APXvYqzsdLumb009bSD2b+NTzNpdbo2nocSDdqyWA/rpF/UqKzncKB6JaSotk0ttAt3W1vuG0mXL5Q==
X-Received: by 2002:a6b:c701:: with SMTP id x1mr331218iof.162.1570570436145;
 Tue, 08 Oct 2019 14:33:56 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id c8sm107904iol.57.2019.10.08.14.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 14:33:55 -0700 (PDT)
Date: Tue, 8 Oct 2019 14:33:48 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Steven Price <steven.price@arm.com>, alex@ghiti.fr
Subject: Re: [PATCH v11 07/22] riscv: mm: Add p?d_leaf() definitions
In-Reply-To: <20191007153822.16518-8-steven.price@arm.com>
Message-ID: <alpine.DEB.2.21.9999.1910081431310.11044@viisi.sifive.com>
References: <20191007153822.16518-1-steven.price@arm.com>
 <20191007153822.16518-8-steven.price@arm.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_143357_651313_2A52E55B 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Albert Ou <aou@eecs.berkeley.edu>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, "Liang,
 Kan" <kan.liang@linux.intel.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?ISO-8859-15?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 7 Oct 2019, Steven Price wrote:

> walk_page_range() is going to be allowed to walk page tables other than
> those of user space. For this it needs to know when it has reached a
> 'leaf' entry in the page tables. This information is provided by the
> p?d_leaf() functions/macros.
> 
> For riscv a page is a leaf page when it has a read, write or execute bit
> set on it.
> 
> CC: Palmer Dabbelt <palmer@sifive.com>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: linux-riscv@lists.infradead.org
> Signed-off-by: Steven Price <steven.price@arm.com>

Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # for arch/riscv  

Alex has a good point, but probably the right thing to do is to replace 
the contents of the arch/riscv/mm/hugetlbpage.c p{u,m}d_huge() functions 
with calls to Steven's new static inline functions.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
