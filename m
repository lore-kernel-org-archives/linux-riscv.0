Return-Path: <SRS0=JNhR=YL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8DACA9EA9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 23:46:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1628C222C5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 23:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sFUzByT+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="byGuFyT4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1628C222C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1icM0Q4Ch/QKuk5/HYL29T+G0shoNJzz9ABzhlMuOA=; b=sFUzByT+X/cZn4
	g4011+r6EDdKl4NGZ5s4ov1IO1rBkMGDoo4ien/PMfjf/Fa45X7YYeycP4ubxnIlYvqgwNOCYU12c
	TR0HVyvHCyV/PJ9G6Ag5Cj7XDwILZb9mbLbspeRWFgCsdGZt3SnPW9BqUufW2BtfTSb7IlVQ7NiNj
	iwE0zS5gWPdTSbEh4B8UPOiOWKTvM9J56LOJAvE/zJWKJ+69707LYHlGV0GGrkSUOGb7ICm7wfFhn
	YvJt7X3meUob/lhFICAEUUCOieejwtes3vX5j2AP5KDctLkIDsn/wpGtXPjTDNMvqpTy95jRt+3HR
	RUwyRpNwgM6MIQtC4hzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLbxG-0007az-76; Fri, 18 Oct 2019 23:46:46 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLbxD-0007aO-7v
 for linux-riscv@lists.infradead.org; Fri, 18 Oct 2019 23:46:44 +0000
Received: by mail-il1-x141.google.com with SMTP id o16so7056748ilq.7
 for <linux-riscv@lists.infradead.org>; Fri, 18 Oct 2019 16:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=b8BrqKv43ztO9vYkl2B9lQT4SVbckdlOosZRspsIwmA=;
 b=byGuFyT4WoHgvclSKO9YILWrRzUHuG+gHQWeYK1nSvNA1i1nnHpPeB76F4U+hFuzMj
 HYrfhUCTyiRXixpLBO9BzNY1p6GG60P2UuA1v1NxLJWtIEhhd6bDT0U1/hmHIrZj7GtC
 QHRDgQdl+qsRbB7C/piwl3rpLiMXchxdR7QW65ggpHbUp9JHrmArdvk9GAEVjwF2DiJ/
 eBTIC4uqx4kkfbzIq+Y+lbPXsovUkObnpmJ8bjruDJZYdHs5hdVArdB3xNYAY49M7tU+
 ewr5xDWwV8dJUhYO4cCsUJT0hqsiPCgV9ENT1bbSo+UoYVPztfBACb9wQ3W0sjW5PWH2
 VjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=b8BrqKv43ztO9vYkl2B9lQT4SVbckdlOosZRspsIwmA=;
 b=UrIr1it/0RqYp1mk7MajVy9tzGKS0aMze+EMD7qAt4PKepAEef1wdTS//ZORQz7BWF
 mTrfzrciFa+dmowRLUHJvwPi9vVR3rhwQp6uJZkqasfE7XH8Lt/QjS2cmNQ69UNQk1nP
 dZEaFEjWgiPfgqs9arLgNSgkuSwj6ZcrfN8hmRS+IxWd6tPaXVXaKtPpd2ipnvsayVv8
 kU918hFR1H986EAmt91N96XXxmEFjPnSipFSvzZVPb33SQUJa9DTMGePF7VAW17RUZQ/
 RG51yJyIKH67DlR/QDIc8T7qHF4qi699uCoGxN6uP5bylT/m5iMaghIspzpn9b3PMUxo
 lwgg==
X-Gm-Message-State: APjAAAUmUW358plMVC2/O0NXUwFmYeaLgySuLXbS4ZFrO2JuL6JnlCag
 +ArmQ1omfCj0/DvWAfd1zgkfug==
X-Google-Smtp-Source: APXvYqzEZhN5ARpmzjKQxSnAAowyxVdqO4Oylbrop4kel8/p8RfWLop7XY2QvWBDHUVLltGRz89BZw==
X-Received: by 2002:a92:d68c:: with SMTP id p12mr12731944iln.89.1571442402188; 
 Fri, 18 Oct 2019 16:46:42 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id p7sm2923605ilh.10.2019.10.18.16.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 16:46:41 -0700 (PDT)
Date: Fri, 18 Oct 2019 16:46:39 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: RISC-V nommu support v5
In-Reply-To: <20191018152520.GA32281@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1910181645140.21875@viisi.sifive.com>
References: <20191017173743.5430-1-hch@lst.de>
 <CAAhSdy1dvFzEh_WZ8aDNyCKi968Dwxm+ru6D0DF08QoOq3JjLA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1910172029170.3156@viisi.sifive.com>
 <20191018152520.GA32281@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_164643_292415_E923323C 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 18 Oct 2019, Christoph Hellwig wrote:

> On Thu, Oct 17, 2019 at 08:29:59PM -0700, Paul Walmsley wrote:
> > On Fri, 18 Oct 2019, Anup Patel wrote:
> > 
> > > It will be really cool to have this series for Linux-5.4-rcX.
> > 
> > It's way too big to go in via the -rc series.  I'm hoping to have it ready 
> > to go for v5.5-rc1.
> 
> Yes, this is 5.5 material.  Btw, the buildbot found two issues that
> require one liner fixes, so I'll resend again this weekend.

OK, will wait for the next version.

I do have one significant request for the patch "riscv: abstract out CSR 
names for supervisor vs machine mode" for that next release.  Will follow 
up with a comment on that patch.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
