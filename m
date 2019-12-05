Return-Path: <SRS0=wiyu=Z3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED1CC43603
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2019 17:01:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 638372464F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2019 17:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RwKZAkoZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="IOhWBLdA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 638372464F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YZZKoeme5xqeP330LDusDo42nmGku+QMxsQ4s+f0hSs=; b=RwKZAkoZybe4FdDk+dxa/V8FY
	ngKJBqSIDW6ZzHYbhlczYNKLmXtp5vlGJrXzi6tdK7P+miomrBkkzRZ/2QFb6wEqZ8vsmPsQcly0b
	OhtZjaGrJVqf/DYXiLBFjkdYKAi9ZzN0GU7IJcbncC3wtqNVKJvdKzJF2t2aaDG2nuwmdEbksfPdp
	7iGFT/Szl1G6fLeWhX4E2gBwy2Iw3biKeaBRls/t0MXgStUJsd4UdJU+Eo87rdXYGd5n1HJRWeRXw
	xmCwxdfDO6fhKAxfSiv3USsvbqNRYCk2tIkYKIgFCE7zvrJV+I0xP7rD3+PBwRP1Ni3j2DHBUe3ZO
	rmcIA/FjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icuV4-0004km-GD; Thu, 05 Dec 2019 17:01:10 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icuV1-0004ib-HB
 for linux-riscv@lists.infradead.org; Thu, 05 Dec 2019 17:01:08 +0000
Received: by mail-io1-xd41.google.com with SMTP id z26so4330180iot.8
 for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2019 09:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=YZZKoeme5xqeP330LDusDo42nmGku+QMxsQ4s+f0hSs=;
 b=IOhWBLdAxgPlmd0qEiroKhiD0mE4Z+Yjpl8sgB1Eatqqvm7NYrd825cwcPb0Bb41uf
 erz+nBeYO+uwWCfiwrjbzRSOTuXPD69HXV+4W2RvBZdp3v31q6Yi+LN+WHNm/udVcFms
 ullbp65eYtHDn37/VK6qc+sSh/KI9nRt6ZG+UYvvx5EtdVcRPZc/N1gospp+KhVz566P
 SuK0PKafbiPW9ExPB+XIeq6Yb+VvL6g9XHB2xfEwVu9QfvWtUHhnSzGFu9KMD15qMGb5
 FMXvRJPaDp5cUCJrUcybHWbOVVHa8JcAgQ3+fgmJSJ57gZv2TndldQrbRr/GkDDjrElm
 oQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=YZZKoeme5xqeP330LDusDo42nmGku+QMxsQ4s+f0hSs=;
 b=QYY6Mk6KdU46iuCQsgelSANzoxLz33DuuPb2IAIsXpiQv4rq0qa1vOdAhqltdwmG4M
 6cFXBS5ZDd4ELGaVHfCGuyVvxJ2qyFUN8xANXFf05reLK4MLTg5fWmcBiszzd99MOY72
 bVxY/g3Wh18qXb64+ZvI1PaWZ8a3Xr6XQCz5miNJi/hHj3mpkqb1HkXGQOQdRg9K3QyN
 GHCvdPQlj9rIfBp1SBWZOOk3MaknvYI6Pgqt2vmN6uEz6NN3Cvik/mJ+sDPYfQ3suKia
 ZshOtLdsCEKVyKujOv9OAuSZNpr67hH00lSsKThX50oXU0tdSvRtd87JcZMdrE/xHlvI
 CyDg==
X-Gm-Message-State: APjAAAUlezGDk7iNcL/Hyc+Zpzh1sUaQD9SkAmENRPl/27Dha8eWXjhi
 QDFZB3c9eXDHWh2XGRR8yRBhAw==
X-Google-Smtp-Source: APXvYqw/zZ+sNL+hS35Q+rSxXrpQS4vtMuwXq+OuY5kqldv6dcTOsmCgm+R7PYBh8CgLOoWtrPH67A==
X-Received: by 2002:a02:9f09:: with SMTP id z9mr8952499jal.119.1575565264904; 
 Thu, 05 Dec 2019 09:01:04 -0800 (PST)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id k19sm2400909ion.81.2019.12.05.09.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 09:01:04 -0800 (PST)
Date: Thu, 5 Dec 2019 09:01:02 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH] RISC-V: Add debug defconfigs
In-Reply-To: <CAAhSdy1RQw3MVcVT5y1EHr72LDNADKRL5nO2E8OrzBi+tpuvtA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1912050900030.218941@viisi.sifive.com>
References: <20191205005601.1559-1-anup.patel@wdc.com>
 <alpine.DEB.2.21.9999.1912041859070.215427@viisi.sifive.com>
 <CAAhSdy1RQw3MVcVT5y1EHr72LDNADKRL5nO2E8OrzBi+tpuvtA@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_090107_695410_B7F41F46 
X-CRM114-Status: UNSURE (   9.18  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Christoph Hellwig <hch@lst.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 5 Dec 2019, Anup Patel wrote:

> I understand that you need DEBUG options for SiFive internal
> use 

[ ... ]

> This is the right time to introduce debug defconfigs so that you can
> use it for your SiFive internal use

[ ... ]

> and you can find an alternative way to enable DEBUG options for SiFive 
> internal use.

What leads you to conclude that this was done for SiFive internal use?


- Paul

