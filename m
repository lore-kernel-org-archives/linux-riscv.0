Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24786C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LaWWgDobs7ExXmRFFdEKFD3KmvE+0SNE6PNTXsmkXnE=; b=wnjN9sBcrDqaOBK5A+9E1dO3ut
	4mC2zcE7++rRF/uzp/yzknVPmariTBHgykQSPCffEubFKOyjeEuV+3rBeQsZM78Lf0NKJ4XkFumDj
	Qaxvt6iExGqA5L3mAcDXA9hTaQYRaOibZccJh5/ew3LqHLfV6gvU6UfBgrPGDfSMwTKgFhnQkLcUC
	vNgNvgHRxXUTevaOGam/ZhPmEavbSZol2NU6vlxNil3Q0g9M+2oziw8tF5UIwXS1prDCfULCQA36R
	WQeARlNLP8Hd3YAr/GbxEdJ4jOw1QBvH8L4+e4t0n7JLF6+gnF78tuKevPrH6TajGq4MEq8gXPnkK
	ddkcqrNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWumJ-007zYm-1i;
	Fri, 18 Aug 2023 08:24:19 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWumE-007zXt-1N
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 08:24:18 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-53482b44007so507163a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692347052; x=1692951852;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMABurkuzxcCubHL/AM70WvfxJrrtNaP5ENFaFyth9U=;
        b=ITiP4gQsAEWOkAqOU/2TBCZdsneLAAsLvkDYb2/LeUtjotEqtvXrgOO7ZmN4uFeDPa
         eQGPC21Hk5RVxImw/llxv5kfBbRzizyy97mVwax8opipAl1nq1EqoUjKp2viAJrJruQD
         aTUHx2xA3paksduun5MU2NANRX18Hqfq8pBmq5xa2KKRN77aPqrBJUzkECa8GCWIoPrW
         3/BQdwV05E1yztutgQQEz/Ozg1mKPT1ZwigUUwcxLptNa5UblkS2NiIkSwvHNFeKyloL
         Tyd9EyvN7vX2jyXyj5kyZmTbz/svS2xikm1GOa4BcnERpBxY4QFnxGiT+GJyfxDcdUbt
         SL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692347052; x=1692951852;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMABurkuzxcCubHL/AM70WvfxJrrtNaP5ENFaFyth9U=;
        b=N4unEbRcscp/YsHekSdIZr+OVqFctX9p2HB4o54vG44F8DgyfHG1fMSQ7Hkld3qMeF
         Nna2Fpz8duiIhk+b/LXcVPGB7zXg24NuhfRfVBZqMXJ5sePdsUp0qaYZj34KvhqmID9D
         4MF9RDGrLRI62q37gofJT7LsmIxsfQieNfqSbXqqEqSxV4IX/8EzfkqFpQ0oFnEOHYpw
         oMtP2cJYF4spCnbKLgiEgQ6L5i6N+TH8JHwPuokuie6glLvQkVaXvKF3gIgp4KX1SYO8
         P0G8NasC+zVgWif4RU4wZN9Ikc/VAoUXQKDktAve3Fr/ATO79MIprgb865AnfnpJDGXj
         h/iA==
X-Gm-Message-State: AOJu0Yyc0g+tO06sdLSmfcUZFJt953/eXO9L4/3pLrLGy3jTC/rxNKG4
	xKEF9zfjv+OJsr8IT6yHJTWfdkU1t4YotOrqY/Xdnlnklm8=
X-Google-Smtp-Source: AGHT+IHluHVI8uqhig9TEbDsQ+IxbXGWS59dC0lSLiEVoYgBXxLFbi0DHhBEsL9GBH8YXn0yx/2Y3vbisNBE81B+mRs=
X-Received: by 2002:a17:90a:b017:b0:268:fb85:3b2 with SMTP id
 x23-20020a17090ab01700b00268fb8503b2mr1690034pjq.7.1692347052438; Fri, 18 Aug
 2023 01:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <ZN8oV98hs1Kt0KzS@nam-dell>
In-Reply-To: <ZN8oV98hs1Kt0KzS@nam-dell>
From: Nam Cao <namcaov@gmail.com>
Date: Fri, 18 Aug 2023 10:24:01 +0200
Message-ID: <CA+sZ8B_hQHw9vH0=epF9q2Uo72ynUjtExiJ9vx0Nws2sCjdZAw@mail.gmail.com>
Subject: Re: where is TASK_TI_KERNEL_SP defined?
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_012414_502458_D52139A6 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBdWcgMTgsIDIwMjMgYXQgMTA6MTTigK9BTSBOYW0gQ2FvIDxuYW1jYW92QGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IEknbSBub3Qgc3VyZSB3aHkgYnV0IEkgY2Fubm90
IGZpbmQgdGhlIGRlZmluaXRpb24gb2YgVEFTS19USV9LRVJORUxfU1AuIENhbgo+IHNvbWVvbmUg
dGVsbCBtZT8KCk5ldmVybWluZCwgSSBmaWd1cmVkIGl0IG91dC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
