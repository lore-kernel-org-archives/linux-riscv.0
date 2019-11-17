Return-Path: <SRS0=Gcot=ZJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF98C432C3
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 17 Nov 2019 23:36:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76602206E6
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 17 Nov 2019 23:36:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M7fnPW2h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UtE6bh2e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76602206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tTmOBI10DhzFVUKnqQy5fGVISGuJjrmzv/lRHOWHPY=; b=M7fnPW2hlbgKhz
	dS0XvWhO7sMV17L5+Ot89ZI0tk/4oXUV+0108oTR9pYPOdTQrhN16jwYn7OddG4IFNqiLftOoP443
	3u0VBOa+Hesq810Htw3wa7sI4rW2+dMc2Bs2rAwH7WCsgnRb2HWruB3Jm8zpoShZa2kjYiJWGN2nI
	yYbdb2A+0nGQhKrUYt0+sGLYsvt67Guvaou9DYe8VhMk97OLWOIhhmdIYeKFnSWfIUE3tKEbC9zbf
	Jo0tDnKlMG0RV79oND1x61hH75tFm0mbS5gqYCikkVcHcz/HulHZWtXZnfc5i8U76kmgz0NveDW6U
	md3qxI2gNsvPc5WeSNVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWU5f-0005xZ-FI; Sun, 17 Nov 2019 23:36:23 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWU5d-0005x3-FK
 for linux-riscv@lists.infradead.org; Sun, 17 Nov 2019 23:36:22 +0000
Received: by mail-il1-x144.google.com with SMTP id q15so14298392ils.8
 for <linux-riscv@lists.infradead.org>; Sun, 17 Nov 2019 15:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=msWSzD8IfTAYrl4tYtx34pXBNjkOEIKpiBWKfcfxxgY=;
 b=UtE6bh2ev/JFO+i+hDnU0aVPBHoI+suqm0t2ovLD19rNgUhRaNpp+IXSGPaFkvSkLq
 XgYT2OjAhl1FCEdZLEhNN54EVu0spzkuDQKzhZjsjmy2+UiQsLH2eWpOJ6sgZ9kas4ej
 r/sHBXUjGE+MEj6j2+32iAIecBsQceIPzhVCgukTvzEtASRDpsjXymPbtm5nCscAM6Md
 pMCVirZGMJO+1EV9Y4RBAYmrCSLtXR5rRoEDNqgDYds+5nsRPPHbxQzuSlRr7r6ZNma0
 botnVNVahkGGGtdtBS/ZMreuwts1H2GIjakW1sMc18U5fEgCZdhBaDkHLIjRo+f4soAa
 laBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=msWSzD8IfTAYrl4tYtx34pXBNjkOEIKpiBWKfcfxxgY=;
 b=cd42y9NNpDYY9RNvGfwJqfrXeFvhMuZttp/kCBd1JycBNToW8xxNcKi9PTDaQf+bx7
 Vd2teWrLZbZV8TKoniL2mkanSkkcBVum3nqd/nz0exX7pEH1qhcV/wGfSawZD1bJ78Ck
 RJDLv2m7qrEFYfGUYOE6uj+LRzXrmD8ADnZJs9IetjzKSuFmoYcm3l8bwrygilRupeJg
 tCnX7P8AnH8bpvPRVDMMiwqlvg3BPuaVL1XnYS03Jr0k3rfLeh3X6mVofgap+BcJhFNq
 Wk3UQmnHYgQWJNTcGw4eLqXJfrS+xm+LsohGW/TtzMwOJ8RfgBiOdVOUB0KYaP/0N4NC
 uQxQ==
X-Gm-Message-State: APjAAAWa9ngcmSLThXEVYuky4LVHsSH2wGe9RWJPEPgHpIbUkqd8lFGn
 JhRRiZNWIHZh3b/yltIePrX/Dw==
X-Google-Smtp-Source: APXvYqyJs9bWjm0GDpDmcty6YsVNmG1z32hUAsZ+dTXTjuPsJfqqtHxzoGKfzjAiw1BPxG/Vg4uOKw==
X-Received: by 2002:a92:c981:: with SMTP id y1mr12624894iln.53.1574033779357; 
 Sun, 17 Nov 2019 15:36:19 -0800 (PST)
Received: from localhost ([2601:8c4:0:9294:cb6f:4cf:b239:2fee])
 by smtp.gmail.com with ESMTPSA id v15sm3967781ilk.8.2019.11.17.15.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 15:36:18 -0800 (PST)
Date: Sun, 17 Nov 2019 15:36:15 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] riscv: separate MMIO functions into their own header file
In-Reply-To: <20191031155608.GB7270@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1911171533580.3813@viisi.sifive.com>
References: <alpine.DEB.2.21.9999.1910291053450.1601@viisi.sifive.com>
 <20191031155608.GB7270@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_153621_520149_B67E32B6 
X-CRM114-Status: UNSURE (   9.42  )
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
Cc: yash.shah@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 31 Oct 2019, Christoph Hellwig wrote:

> I think it would be a better idea to move the kernel virtual address
> space layout out of pgtable.h into a new header, as pgtable.h pull a lot
> of stuff in.

Agreed that we should do this at some point also.  It looks a bit tricky 
to do this cleanly due to the usage of STRUCT_PAGE_MAX_SHIFT in the 
definition of VMEMMAP_SHIFT, so I've passed on it for the time being.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
