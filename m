Return-Path: <SRS0=ik8O=2Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19935C00523
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2020 00:11:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E068F222C3
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2020 00:11:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BuA72Bpa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NYQdIoD3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E068F222C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WiEa+o5Q5CybKGQcapfVdUUfq/OQ4KhWfLGnp+c9m/M=; b=BuA72BpaYU8q2/mbr3EFDGiUT
	oJAdQfMztLmmwDM8hIBki5hxS96LcJrVUloxIQe0sgG/AggfEpei5yB54g/NG2qwESq5M4B2JErLk
	E9QL12CC9ikCa2ApvcfgkDYPvdLLDiiYGqGghR9CZ1Cj/QzNmroB5JgKvfUxiJ2FGt+fN6RvYtv0p
	c+Blp4xxRk34OKyQOfrwfmg7JiekmSnqSNIGQ5dLl/2lFOwMZlR/3xSPY+PrcikxWzqgwQWWyy1XC
	qKqtSe102JMDNXSZmQJlE/XLppNWdhwbsB6Qrt11fQu/CrBD9uyNmpfwaDpRIPVruvjH7lImIV9JS
	c00CWHaiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inX26-0004dC-ET; Sat, 04 Jan 2020 00:11:10 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inX22-0004cf-C2
 for linux-riscv@lists.infradead.org; Sat, 04 Jan 2020 00:11:09 +0000
Received: by mail-il1-x144.google.com with SMTP id f10so37971364ils.8
 for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2020 16:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=WiEa+o5Q5CybKGQcapfVdUUfq/OQ4KhWfLGnp+c9m/M=;
 b=NYQdIoD3So2vtdo/HpEDg5r/5v7qJvQ2o+0tZ8R6KXN9CkQqgQwbrb5S+Qx8pUSVDu
 VhieqxPsHSMQ9wqLQ7ZxkmbZ/MUqFt+Zka2kpF0mqHiK2PUHJGnLFtVE9yLKyJRRZmZy
 e98QwCZ6YrDmhDifh++T4wt7J7IY1BChfOsmI1p3Ws+7g9NrPcjmjGAADmuyEezAID+9
 UsFZjCNXekajuOskc5PBmVjImJOLKZhqxfnQGuzxFr8mu3wyVyo4s7Vj54qTDiiEm6ZO
 aB/INtigKBdCSZ8LXIbZ7vIEUu9bjxQx1n47JeDIUn6rRQLKujMy8ajc5Ak/sWLoEakr
 Pzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=WiEa+o5Q5CybKGQcapfVdUUfq/OQ4KhWfLGnp+c9m/M=;
 b=DcLL9KbsCteIBRfZYGwSQUu7J7+bPCDuGs0mcITkwguqO4ii6zEMXFcW14+vdCj15Y
 PMjnWSMb9lF1X4eqVxqhEP/fDj532mmSw8gXSywICTVhPbDRYGSLB6PHKKb3pT7nSa/c
 W8IBuRc54y6jfUnWJ6lEWJR0pBLecfQck54i8LnLSTjQpYwu0Gq6Z+TDDjYMsxxJ1ZuM
 EOukaVQpdEWcyL20W/217jDBhkFQuT085MUkJDMGePUXBgWIntyjkXFKRIV3pTGavbI2
 IglB27tIoLHnA6uf63kgMfDWxF11LlLIWsL92Fv1m7xrrsnQZDgT9prUJeLC0WFroQLP
 NTIw==
X-Gm-Message-State: APjAAAUBi9ugODUNIl+JGTxXNSJRQ66gYXeC0TTs5tdvmBjJR8ikMmsp
 GkdKd8v3ascLdgjTXlALyrk49A==
X-Google-Smtp-Source: APXvYqztMA0ImuOwI4vnJlP3KqgCNhVBA+tcEjzNHZNfEO+6ejnXkFxewXTPNXnddnnAha0yRPvIdw==
X-Received: by 2002:a92:160a:: with SMTP id r10mr73359367ill.14.1578096663169; 
 Fri, 03 Jan 2020 16:11:03 -0800 (PST)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id f7sm15152328ioo.27.2020.01.03.16.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 16:11:02 -0800 (PST)
Date: Fri, 3 Jan 2020 16:11:00 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 2/2] riscv: mm: use __pa_symbol for kernel symbols
In-Reply-To: <20200102031240.44484-3-zong.li@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.2001031610470.283180@viisi.sifive.com>
References: <20200102031240.44484-1-zong.li@sifive.com>
 <20200102031240.44484-3-zong.li@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_161106_542106_2BFD02D1 
X-CRM114-Status: UNSURE (   6.88  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 linux-kernel@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 2 Jan 2020, Zong Li wrote:

> __pa_symbol is the marcro that should be used for kernel symbols. It is
> also a pre-requisite for DEBUG_VIRTUAL which will do bounds checking.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>

Thanks, queued for v5.5-rc.


- Paul

