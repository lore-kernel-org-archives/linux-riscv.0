Return-Path: <SRS0=37yX=YQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998B4C47E49
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2019 22:05:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B2022084C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2019 22:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g/nI6UHG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CvPPc+ni"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B2022084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Dg6F1SCh8zuIgwUZoHEbIsap7+Ha7ElTpTtOKvs3yU=; b=g/nI6UHGwSsNNB
	4lSkyAMgTBogDr/iLg1i1kMf8P2LWuqMqOu2KEp9VCFd4kdLovyAiNLGoy7Z6y+5fWWPH2zGuK9G8
	0c8njVkVIdouzV4TfZXD50HKVpPZbu9cmFZLDORA4DCsjdyxQ0kbAEF1qLICcZElNBIFrG+UXIlgi
	i+Yli3cGeUTPRI7zXZ/xGZbp8Jmm0SwbTljbBBBCN9Ld6qvbSqYgdaZj0UaV4cr6StwCstsIDhup7
	X37rni46lSVAX/GDU5FU41VL4KrbFBOtAMUHX+6g0aOkVR3pqrTiYOMJEe0rRmyg1vOM6EFliUY7k
	4R7uuUYdAj9e+pi9gyMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNOl6-0002yq-3n; Wed, 23 Oct 2019 22:05:36 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNOl4-0002yW-10
 for linux-riscv@lists.infradead.org; Wed, 23 Oct 2019 22:05:35 +0000
Received: by mail-il1-x142.google.com with SMTP id y5so20439252ilb.5
 for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2019 15:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=6nNENVA+itqkpIQzusrAU/yenbBYQKj6dV7c1bpwXz0=;
 b=CvPPc+ni++8l/tgBZsJga/63Afatp4dAhBpkHiaekonYGAecYw9T+FrpwLyAKbMYvr
 dnuorpGtZ+7lXI5RuZ/15abvyX51iXf9ZgLmu0AFhVW2tdYjzn0uw80DXlANBcSZn1hC
 rqQioWQsnDVncQhMDIYUJDzAuYb4xBdRMOOReiaRWSKOp0dlc3hHV/W3gAwL9GgvLCXN
 Hk0wI8BtHEuhqHHpZWpJ65iR9TJ2uaC2K/atx2qowegeUp0X0o+MG0Mvs2Nyw9N5pfOx
 AxC7H+4jCU2zfM0NvdLkZyK12X8oJ/F536QdB/y/lTrDjJfTk3QeKyXsZkPcY4I91pQe
 jy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=6nNENVA+itqkpIQzusrAU/yenbBYQKj6dV7c1bpwXz0=;
 b=FNTsAofZWbutSfK8yPoOVZrKU1ONmgi024KCeP43pD5k9AWGZncXbbuTCTF2jeKwSQ
 f5VTfCkr4ouA3+QLzEo8b06P8qhiiT8s9Dz6eWN97NVnGmvLPo95/qPfKGSjPqnPyrQR
 3zZTrNMHN/Z01BqZ5cZ43bEsjCHCPkjFirCuOZx/Uv+1mjWVJHNQ7y5YZtYkkTkLPv/1
 jX96MJf+qDQr86WRBEkmf/Pg9yX+jrqmm9qqS07bRCtPffbF5o3mUEk85VSMfJ01ucBw
 djfhJUSJn5+8KMGXf2/sujRB+jhAIV6AVu2vJa3R2lxpVipJJ3W75a8wIi0aZCGc2gIe
 23Hw==
X-Gm-Message-State: APjAAAVYS6X7cH2RPLYB9tF/YRA8rR1Npe95SuMBDJGGdwpkBqf8Yfh1
 tvZZYmabz+1U9evV5FHF2VfH0w==
X-Google-Smtp-Source: APXvYqzCVL6/ED1XfSU6ZwasV1fopkH1VvPNO4zpWZ5VdnWQoKnpy32UtyRduLuAvPAODzzp6WeAug==
X-Received: by 2002:a92:d3c9:: with SMTP id c9mr24486179ilh.259.1571868333002; 
 Wed, 23 Oct 2019 15:05:33 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id j21sm4998581ioj.86.2019.10.23.15.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 15:05:32 -0700 (PDT)
Date: Wed, 23 Oct 2019 15:05:30 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 02/15] riscv: cleanup do_trap_break
In-Reply-To: <20191017173743.5430-3-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1910231505140.16536@viisi.sifive.com>
References: <20191017173743.5430-1-hch@lst.de>
 <20191017173743.5430-3-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_150534_069268_B9C88569 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 17 Oct 2019, Christoph Hellwig wrote:

> If we always compile the get_break_insn_length inline function we can
> remove the ifdefs and let dead code elimination take care of the warn
> branch that is now unreadable because the report_bug stub always
> returns BUG_TRAP_TYPE_BUG.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks, queued for v5.4-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
