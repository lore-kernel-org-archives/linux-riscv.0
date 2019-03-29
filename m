Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1740EC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 05:05:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D980521773
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 05:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kbvvkDPY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="P5ixH0El"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D980521773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QgRnvPp8CjhLGojUTIKS4f0/dgvUO0XrsyU/F7RGHX8=; b=kbvvkDPYY2lW7n
	bwx+JC9YzXrdwxrchIDtkK7ye0F5/a3VEghTWc6dFlrG4Mjwy0A524EQgbtjnAlihf+GYLzufkSrj
	YBDy3s2/22vOhk3Nceqtv9UGDN91XZye+l+QnpMJasoalbRLQGEb6GDu6G2yOfRkLIL4S/xzRPFYi
	eCXaKAdyapbYf2ECwvoR2Is40Rj5kIf/ZrijcL2e9OE6FBts42ybdDFw2TWoG2cMVECOg9+WhIN3b
	RpcS7CQIf6Z2yHKPnqehP8U4xzJokhO0OHnYNgtFwXy3ghooZMVEAmSz756VLh70NXDDe9PDNcw+o
	GcexWjWfEp2tPuiQtDBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9jhJ-0000ys-6g; Fri, 29 Mar 2019 05:04:57 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9jhF-0000yX-Jm
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 05:04:55 +0000
Received: by mail-pf1-x442.google.com with SMTP id 10so465389pfo.5
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 22:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=K+fXE3nC/D4jJXfV8N8hV2CYYuqRjfquUFVQdpA86FE=;
 b=P5ixH0Elavs4nmxY2Tnhnen3+SwWDR2up3kw1PoV46Ulk73Ac4GAe3vpQqb3VzMio0
 Fo9l6qAc9rcftO4w5TNr6ruekqM1nJXYewIwoQi9F/NFNZi3/KFtxXEJm4EOVTbDwem2
 Uu4hL7bwjy2KLPYAIf7eF3pX7aVB1ZYYAw+6YV5NSIQxTnXHu8UAuI736BsoAoK7kTA5
 hXZvevqss1Bm8k/u92Xi03UPECpsQaNRN1zfTUxDktyJwhXqZwbDOiGR8ZGm+cr2qaFd
 opupknyxVfxPgKZwLa6uZOsXT2ZYCFKRyQYuyz9pXJgrytxulkUaiSgGCUt9UZbsfoIE
 NBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=K+fXE3nC/D4jJXfV8N8hV2CYYuqRjfquUFVQdpA86FE=;
 b=BfmH1mDsu/FlHnJsjPmx5TgM6kt2MQA0KNidua+lTZ+sNAZNOlsOX17iDlNmhmIW1K
 wF2z9JObTSPQEKwRLMn8SviWZHiArxepsNNwOl3WVAT07k5kxnu6x+PVDOHRS8/5rSJC
 8mxlDXILXx9KrBuh35WkFKCW2z9WHCwjNSi9uLwjED1BR/ReL+zZAXMNr9MxIWbLTtWt
 aVOENr7svY1hG8PDlratVxT0NiWkPL5nLqBP0cS86GUN3/z/jafg8gWQWxlrdNSCZPlz
 o21fxE63SPYrrVZjKwCH+Q3sNJXVFnb5T6cYFT6XhD1QLQxdYFA+N66yJr4DHhL7b9lG
 VedQ==
X-Gm-Message-State: APjAAAUdTFLGCP/hGxGIl8pJ0SkCqO4JHmfvCpF0tVzH1z3zdwzW8KFR
 z8IpcA56BrZOhpIQjZIeAsg8cw==
X-Google-Smtp-Source: APXvYqx25PwAjqQt+KdgZC3k/hjKJVSGn61vOVJWPctuRg4c7wnF/Zws6XBqmGWGZRj3bs36c1baYg==
X-Received: by 2002:a65:5685:: with SMTP id v5mr42573716pgs.365.1553835891264; 
 Thu, 28 Mar 2019 22:04:51 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m20sm1481475pfj.142.2019.03.28.22.04.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Mar 2019 22:04:50 -0700 (PDT)
Date: Thu, 28 Mar 2019 22:04:49 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH v2] RISC-V: Implement ASID allocator
In-Reply-To: <20190328063211.13052-1-anup.patel@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1903282158510.25278@viisi.sifive.com>
References: <20190328063211.13052-1-anup.patel@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_220453_754587_81EF10C4 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


On Thu, 28 Mar 2019, Anup Patel wrote:

> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
> Changes since v1:
> - We adapt good aspects from Gary Guo's ASID allocator implementation
>   and provide due credit to him by adding his SoB.

This isn't the right way to use Signed-off-by: lines in the kernel.  See

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/5.Posting.rst#n213

and

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n418

The only people who should be listed in Signed-off-by: lines are patch 
authors.

If your intention is to give Gary credit for changes in your patch, 
describe what ideas or code snippets you've taken in the patch description 
itself, above your Signed-off-by: lines so they would be included in the 
git commit description should your patch be merged.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
