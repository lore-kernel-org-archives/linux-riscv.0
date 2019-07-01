Return-Path: <SRS0=AGdw=U6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BB7C0650E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2019 18:52:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B2A420B7C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2019 18:52:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c7Udua/n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KZy85/4t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B2A420B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlMzVSAMBj1uuz/VpBqENYpPjOvh9NCUM4jj66l1ryY=; b=c7Udua/nAcDobQ
	+pWx646skAVcREoMiUwkhKpPuB6sLB/XY7N7qCbhZo601C9WssoXjRiADtuC+uqoZNuemwFhmqwer
	DrrybChxCvKihXoilSwDj7klQfw1GBhZK+NqK3OBScByt4FRQo8q/lx1JeAiTATONQKjP2s+H2c0T
	l/S4JYQwv0q3Bj/z2eWRvtbNDWDqIncNkYMJ91bGRlcEtsg2MWfQKtdVD4tCZ0M34JSi2TeKQUNh+
	5YQa0Pt9LQfj7uOQqSf3K1RYJQj1gpmmF/P4AZpv4LueCWHl2iuxNjeNiyN0E8U9AKKli3Yha1vAy
	uOi8LINSPy+w/+h7BLQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hi1Pi-0002f7-C5; Mon, 01 Jul 2019 18:52:30 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hi1P7-00028g-Mq
 for linux-riscv@lists.infradead.org; Mon, 01 Jul 2019 18:51:55 +0000
Received: by mail-io1-xd44.google.com with SMTP id u13so31250413iop.0
 for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2019 11:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=DYrhizvtIbWqHkjv2BkSfsRwmy8RzQ5cYYvDtrQv3lo=;
 b=KZy85/4tTSnfbHIjMO+VoX0+BzXfz2fZQXO03A8+ppgNGdVN1iiRyi0w65nxrfVUZl
 LepUYO6VLS+jWb4ZEZIP29HDqaCzsslQpNBhXbiOlIoxgSn2uuIl4ssVV9xuCXFt8tUT
 TL+Z5XhuSUaJjo0+lMAckhVGAYw8uHtOm4kXAp4cKTJsd9jeJqnnFl8VS6x5iUdwAk4o
 bvnvtEKAJCVVT91seyxUHFcUgBIhvWFC6h1heJaNnYcHpP3SG2SKIXfdKgofJ/rKSkPj
 aYy7DtYis+jalc6jZkzq+JsJ81egv/yIQivLKN+bVoPVv6YsKV8EOVJwFQr95bRlUiwD
 dPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=DYrhizvtIbWqHkjv2BkSfsRwmy8RzQ5cYYvDtrQv3lo=;
 b=gxpVpKH8Gt2ls++uLCknC/HXy4Sxw7Q3I+QH8Qbp0d1A8H8Qrfp1ItjTPzdRivgp1l
 zj8oLnT4aaBMZx0bYCqIq6BRfWKVo3ZtbUuKnH4pOin31nNcHLAuuiBNpRB42e5WyAg4
 +AVilDqlK8e5857FcU4OPdN8D55IaYoCsbDbdPX4/JMv9dji2QMA0rYe2gt5pEhK3sGG
 5zh3eYtZaJs9hqQWQZQD7Tng19wVzHQSAvBEFq53Xop0bSQtKKSrFUISb6XPXwelECxM
 +DoaqkmM9hYScwW5Ow4OcTMrhDzCSi7w2PenDDoWQIoV0iDRCaBfweNXT4RseNBH79jR
 JL8A==
X-Gm-Message-State: APjAAAU5eQJxPP1CIonDGbjOX9iURtz7afqONUBvh1nsz8wT0/OD7uCf
 9o4JyrYe1rbauX/XL7qbb1Dc+g==
X-Google-Smtp-Source: APXvYqx8evMbqCB5mcUZCJSlJkUvQvODT7P9GsKOEHqnl7p98ygfjhRMioyAwvw2nWgeKnX/BBIurQ==
X-Received: by 2002:a02:cb96:: with SMTP id u22mr30802401jap.118.1562007111969; 
 Mon, 01 Jul 2019 11:51:51 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 r5sm9977978iom.42.2019.07.01.11.51.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 11:51:51 -0700 (PDT)
Date: Mon, 1 Jul 2019 11:51:50 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Palmer Dabbelt <palmer@sifive.com>, 
 Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3 1/2] x86, arm64: Move ARCH_WANT_HUGE_PMD_SHARE config
 in arch/Kconfig
In-Reply-To: <20190701175900.4034-2-alex@ghiti.fr>
Message-ID: <alpine.DEB.2.21.9999.1907011146550.3867@viisi.sifive.com>
References: <20190701175900.4034-1-alex@ghiti.fr>
 <20190701175900.4034-2-alex@ghiti.fr>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_115153_839234_19C678D8 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "H . Peter Anvin" <hpa@zytor.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Catalin, Palmer,

On Mon, 1 Jul 2019, Alexandre Ghiti wrote:

> ARCH_WANT_HUGE_PMD_SHARE config was declared in both architectures:
> move this declaration in arch/Kconfig and make those architectures
> select it.
> 
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Since the change from v2 to v3 was minor (the removal of the "config 
ARCH_WANT_HUGE_PMD_SHARE" line from the arm64 port), I'm planning to 
apply your Reviewed-by:s and acks from 

https://lore.kernel.org/linux-riscv/20190603172723.GH63283@arrakis.emea.arm.com/

https://lore.kernel.org/linux-riscv/mhng-4d1d4acb-f65f-4ed4-bc86-85a14b7c3e16@palmer-si-x1e/

If there's any objection, please let me know as soon as possible.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
