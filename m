Return-Path: <SRS0=8slP=YC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48234C4360C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2019 00:51:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F6BF2070B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2019 00:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rlOCkEcJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FYPYWqSy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F6BF2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wb/MiPd0j76dWwqilaB95F9tcq0zsxUHYHBIBkdKQPY=; b=rlOCkEcJsGbwQp
	PaSLRZEaXFf3bGGLLLw1aifM/3WmC9nLYjLPqifMNL5OBiKDnEhhr8Eugrp+xrqyOLOsnmf1WrxXD
	aDtGSUtoF28q/82XAlK2v92qFR8a2eLASwkIZeQVJAdVB+MnHGBckfSGbBGXF7yR1zNYbU34ZlOe0
	P68+3R1hF1mtTIKXRdmnYiRuEncx4NSIa+3dAcwfmyhcvEDpV8Kyiz86xO9DcWi+0ubtrTW9F9qsl
	B5TZ1v4hkFLI5k2FA/PFrzq+nZrbbUON7x8TqGTRllnbtOc5bTLlUaz0JgD8GEsouIiz/KGtl5Pyg
	PalcBxkdk3NwsAgWzXog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iI0CM-0007Zs-JY; Wed, 09 Oct 2019 00:51:26 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iI0CJ-0007ZP-2w
 for linux-riscv@lists.infradead.org; Wed, 09 Oct 2019 00:51:25 +0000
Received: by mail-io1-xd42.google.com with SMTP id c25so1061976iot.12
 for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2019 17:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=EMZtjM31Em1vP/4BHL66TlLSBp4SJ3Jkhr3vg2//7Jg=;
 b=FYPYWqSyx4I3ZdZfLoUgyxUd20pJG/ZUWUmeIssVu39IfkVLIkxhKVy06RoPkesrsm
 hFaWeoAHnxfoYSf8IZwPDCWB1n5+X8KncOA8FGYqRdSWFpoJEys20ueJ1eEmPy/L6dt/
 DyHkVUXmlwQiddd7cu0vt2BJMC51MIyDgimr5t1fA7UaU0hq5EcGEsWQBVyynaW8K+fW
 KBfCdGxTbpLbrr3CKY2Vt+QzyHOMTQjTAKsi7lzyq/8yxweHp2onHOFAs577ckKV94tz
 SiOGqQEafjAzm1mJqRqqJkUy0VQCsoOiHafkVUqLZT5ohXOw3ezyhsJqN/tE9TTThuEw
 QbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=EMZtjM31Em1vP/4BHL66TlLSBp4SJ3Jkhr3vg2//7Jg=;
 b=F040FdYZCtPvsBzxu/exnet9xYxuWV8QoQtU7QWDUb+iZC9kqMP34BBvzs8wdAQuvg
 xOU8rya1rL6ZmQVdHyMI/kwexVhTO4KjJCKaSrm0aMXVXN+PFY4o9+7w5oCPEo4GAk72
 wedfRP4bX7g1Yse3BcnjYx+J4IU0x84abXdhHhitlXz8trTj4cpyDzVyPqDmbOMO8RPn
 lmL+yiAI9UMnuq9YyCTYDasY4ujGWctKARZKdgI7y81V3ahMRiRKqyfWkz2Hm1I1T3GT
 uFOblOgN8WKQX/hoFMAkhiDfMZEILQFma7ABtJsUzhRwd7Yaetajv9iRjbYPDC4WaKwD
 2FeA==
X-Gm-Message-State: APjAAAUPLrGbKuiNOtHrNmI/l0l7lGNk/F6jM8nq9kye6R6SMu1BfDM0
 WBsQbpQ/Hpe44TwsNhR/fyxkew==
X-Google-Smtp-Source: APXvYqx67KnJKfLnhVzjCetf/uH7UeQb+kzcmcUELfUuKW4/Y+MbDnfd/wSipbJOtBrTJKbztJ3S4g==
X-Received: by 2002:a92:5dda:: with SMTP id e87mr627357ilg.216.1570582281295; 
 Tue, 08 Oct 2019 17:51:21 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id o187sm363778ila.13.2019.10.08.17.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 17:51:20 -0700 (PDT)
Date: Tue, 8 Oct 2019 17:51:14 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v2 6/9] RISC-V: entry: Remove unneeded need_resched() loop
In-Reply-To: <20190923143620.29334-7-valentin.schneider@arm.com>
Message-ID: <alpine.DEB.2.21.9999.1910081750550.32458@viisi.sifive.com>
References: <20190923143620.29334-1-valentin.schneider@arm.com>
 <20190923143620.29334-7-valentin.schneider@arm.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_175123_190331_B6C75058 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 23 Sep 2019, Valentin Schneider wrote:

> Since the enabling and disabling of IRQs within preempt_schedule_irq()
> is contained in a need_resched() loop, we don't need the outer arch
> code loop.
> 
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org

Thanks, queued for v5.4-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
