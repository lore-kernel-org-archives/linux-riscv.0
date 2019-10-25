Return-Path: <SRS0=akOg=YS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3641ACA9EAF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2019 03:09:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08DBF20867
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2019 03:09:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ByNv2KYr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ark4hOE7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08DBF20867
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntZS6RyCZME88F4OSaqN5xF3u38Va2qYISDkCoAzGO8=; b=ByNv2KYrTGPeQO
	2MJqQRhs+M+4J0cdq2PP8w7IaKaCJWdtB58B7twzti2HWaJ28Si4tM31FJ9YfOlg6DKjFoFvoe+5r
	4EV5oAjzam80RUufj4TUpxxHIQ8bd+iQ3SHNMwa06hRBuSKQx+MYoeVssOhKRbNW6K2khwDYOOEZG
	P+gUXqn69erMEkj4DSBdeSreVKovNt5k5q6xg6COrsGT8ibFfRGXItZEN15GRE8vwDYOo6d1HYTOJ
	zm3KMxagGFy8y0I3zM4EhMejJnjFXrAcjZy39hXqfvB4tFOE/jHrAVFC4xqMvu8+kNjfsWR0oqzlT
	cI+89Uxs+I1d3fppH7OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNpz3-0007wQ-RC; Fri, 25 Oct 2019 03:09:49 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNpz0-0007ut-Ad
 for linux-riscv@lists.infradead.org; Fri, 25 Oct 2019 03:09:49 +0000
Received: by mail-io1-xd42.google.com with SMTP id u8so723275iom.5
 for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2019 20:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=NDnBP4/LxhdGXSkB81z59K6SH35dARBNL26jgxKs1DU=;
 b=Ark4hOE7lqn5cgq/Ov0R55L1DNSP47nM+/2lKqSaYlr/WWlTf3ju7IgIPjgTmpii/A
 hALDty3X+F3p4kuLNe7SxZakxh/OnoIYX14cm2g3aeUL8r9kav7bIKNzKfJKEfdw+tNP
 Ej3qXt9Zonj4wENgpQNwu9KuYvrc3Ec+cAPRZcUbxqpW3Jttr+ND4OrNkpFimhkVb+Z7
 l8ImnHWofoJtjSU6dElBzmF6xcaCJXJ7J2cSY8/T9xg5pfhS9hvbHPKD0Ix+YT53mKlf
 zE8Dqgbu/kVRb7r0sCsXmaQFxvlp4gMpY7fpAynPSaKrgCcNQGQcTO4shg8rOIK92I6n
 XFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=NDnBP4/LxhdGXSkB81z59K6SH35dARBNL26jgxKs1DU=;
 b=TgBT0i7qCZr9fPlsG+cQhVfd0MOFsNT1rhxppSmuJUt5z42NsNnYPp2CqgGBal78lw
 OMY0mR0tNDIaQl0GfysrctclFkJRPM/eE0KqTAnIklWElPRlPt1pjOv64QIROco7Vux5
 qdv6WPJIXBSGs1swU+9Texa2mtFypdl/vAHOfi6cC4T194ctBSrS3OdOLKCyKa/+mrNv
 YQVQAZoqGU8oWCI/o9jptYYp7bDc3SywahaxuslyhZdP8Ia0zpE0IgbjEf9djPRLsHie
 i1EQj8T2kwuL5VunCfZiAVVWFkIjacqA9EvnCpe5inawwDmXf4KHCo2z93sRKxfmuYcc
 XoHA==
X-Gm-Message-State: APjAAAWyKhujkYrRB6zmjA4yQVHa3gh0AD9zWi1HNA53PQDs6HqBaEQ6
 8xzgYB72W01ZXzsGVZu/Xu/r9Q==
X-Google-Smtp-Source: APXvYqy0FbVU82h3B9ymHO5htMn2YmR821IaXarEdMsXRvsC8BJsi2gz+DV6xh78xXHlEDsYOjR82g==
X-Received: by 2002:a6b:7d0b:: with SMTP id c11mr1526968ioq.236.1571972982795; 
 Thu, 24 Oct 2019 20:09:42 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id d6sm173269ilc.39.2019.10.24.20.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 20:09:42 -0700 (PDT)
Date: Thu, 24 Oct 2019 20:09:40 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v4 0/3] Optimize tlbflush path
In-Reply-To: <alpine.DEB.2.21.9999.1908301939300.16731@viisi.sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1910242001550.28076@viisi.sifive.com>
References: <20190822075151.24838-1-atish.patra@wdc.com>
 <alpine.DEB.2.21.9999.1908301939300.16731@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_200946_429466_E84C596E 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 30 Aug 2019, Paul Walmsley wrote:

> On Thu, 22 Aug 2019, Atish Patra wrote:
> 
> > This series adds few optimizations to reduce the trap cost in the tlb
> > flush path. We should only make SBI calls to remote tlb flush only if
> > absolutely required. 
> 
> The patches look great.  My understanding is that these optimization 
> patches may actually be a partial workaround for the TLB flushing bug that 
> we've been looking at for the last month or so, which can corrupt memory 
> or crash the system.

I don't think we're any closer to root-causing this issue.  Meanwhile, 
OpenSBI has merged patches to work around it.  So since many of us have 
looked at Atish's TLB optimization patches, and we all think they are 
useful optimizations, let's plan to merge it for v5.5-rc1.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
