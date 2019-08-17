Return-Path: <SRS0=lGgd=WN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDC6C3A59B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 04:43:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF8A22173B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 04:43:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mUsu9y63";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="I+BSH0Gv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF8A22173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rI/sz4SYFItCgxGuvgpxgCIeOEpb7uPLuQm2pZK6HM=; b=mUsu9y630oKbBP
	kAPto3LbEDmUYw4tmIJnDenGPJUQPwsneVJkdPYXxC4vGz5dGndpCcQU9oVZ2zmPubjQW5mYBqcUW
	H4MUy1VBTQCIHH8iKBLB7lxXuWevfFeuajtXc6F+PA2HeizSKlYmUV6DFpyCVcqKZZQK2spHgoyru
	fF3J/lAr9T7fA4+ZMeE+gKdmEHYt3jjpxyDht+eT5sthetd5oJqQ133+sz2SlBgkqX46p2oCle0X8
	R195D+GVCj3Eh4jdYnxSta4SwlNG7KW58WdCoKsIU/6aOIoE/QcBjNP/jW65ijjkebdPlT64L3k6E
	08/uCXVgn2akPbyy6eWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyqYu-0006sc-6s; Sat, 17 Aug 2019 04:43:32 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyqYr-0006sI-6H
 for linux-riscv@lists.infradead.org; Sat, 17 Aug 2019 04:43:30 +0000
Received: by mail-pf1-x442.google.com with SMTP id w2so4152724pfi.3
 for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2019 21:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Qx7dTBSG5mnk9PlWmVRYTFFzE3XW/jirUbpR2SM2oiA=;
 b=I+BSH0Gvlmmo/v+XAvC4f1KctY9tlqWzkGt0C/mQ2gw5HOchK0I1p8OoJJlJnk0pQl
 JJ+dHLbFJAa2ESNGTwQuQzfyfmrkLybo+ACnkTe45dIo89s8tgvDBgH3qQXOFxzHiLNm
 PEbTOPapMI6eaczSnfX5GUDCNSho7F/8i3jsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Qx7dTBSG5mnk9PlWmVRYTFFzE3XW/jirUbpR2SM2oiA=;
 b=iUvIUNklbf+vqwtarpRaU8aOc+rDnpVwngJDG7mZ7olCIMPnlXRwjxnCZyNJZ0TuSX
 p4CTc86tt05aR4SyMxchSfk4hkjpN9htXUGZblnkt1032RdzzI9f3fB4vmIviOsxbjFc
 3Uge5gjhHzaP8rB0mTz7ULTyGDFE27Dvdg6fuWIjbv765fZRoid0E2EFRgAwKeZqp/MM
 nlmpTGj/w/N1XrEamJLkdi8BE7VF5y/AMwywYJaM/4FHybOoxI/JdmYQs5Q4t60KBZsG
 mf0qswij9Mre+n/IlUHJHcM07eQ/4JjoF1A1g8ECtKKpunxUEkGtS0XJN7XiarApz5px
 jUOw==
X-Gm-Message-State: APjAAAWed7dbFDqPO6zg9dCxYxJZrMNfWpH+z2CauwerG9iL+2whXhII
 8vBJbfEWs3rXT9bbKzLEBtTLmQ==
X-Google-Smtp-Source: APXvYqyBu3kIqgX8zTEo5NzvbBjhOsyHwgwMssvSZCuLP0+UnBJsxmwTNR4U2NeBP//sTg8GqJYqhw==
X-Received: by 2002:aa7:984a:: with SMTP id n10mr14319362pfq.3.1566017006016; 
 Fri, 16 Aug 2019 21:43:26 -0700 (PDT)
Received: from localhost ([172.19.216.18])
 by smtp.gmail.com with ESMTPSA id q4sm12828431pff.183.2019.08.16.21.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 21:43:25 -0700 (PDT)
Date: Sat, 17 Aug 2019 00:43:08 -0400
From: Joel Fernandes <joel@joelfernandes.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH -rcu/dev] Please squash: fixup! rcu/tree: Add basic
 support for kfree_rcu() batching
Message-ID: <20190817044308.GA139754@google.com>
References: <20190817042211.137149-1-joel@joelfernandes.org>
 <alpine.DEB.2.21.9999.1908162131490.18249@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1908162131490.18249@viisi.sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_214329_234244_F3306DDB 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, rcu@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 16, 2019 at 09:38:54PM -0700, Paul Walmsley wrote:
> On Sat, 17 Aug 2019, Joel Fernandes (Google) wrote:
> 
> > xchg() on a bool is causing issues on riscv and arm32.
> 
> Indeed, it seems best not to use xchg() on any type that's not 32 bits 
> long or that's not the CPU's native word size.  Probably we should update 
> the documentation.

I would endorse any such documentation effort ;-)

> > Please squash this into the -rcu dev branch to resolve the issue.
> > 
> > Please squash this fix.
> > 
> > Fixes: -rcu dev commit 3cbd3aa7d9c7bdf ("rcu/tree: Add basic support for kfree_rcu() batching")
> > 
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> 
> Link: https://lore.kernel.org/lkml/alpine.DEB.2.21.9999.1908161931110.32497@viisi.sifive.com/T/#me9956f66cb611b95d26ae92700e1d901f46e8c59
> Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>

Thanks Paul! And nice to meet you again after many years ;-) Glad to see you
working on riscv.

thanks,

 - Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
