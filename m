Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCE8C88E7F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 18:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMXrFvX3gmDbLeASNVDWN5dIk0D6/y6boyyKBWlnbnk=; b=Z+O+coScjIBl+m
	gELNeJq8LVZ33EOCQuT1emRKV+mtAs00gppXdlXptis5X0ydZKvR06Ejlnk3mZ5QewMAP9BihyPxA
	iFu12luhtUbZezeQrGbORoUyjS4UJ1bo348Z8a+i3/pX1/5tCGyCmX4Q72YwlZuEq4K8RMGxbLjtD
	2vlL+A78d+IClhE9C8R1BxUr+VYgHruVlDjo4oQvLJvq9GT2ZBPLIf9BR7v1kIp4XA1QNZF8HTPsg
	f6yMMaflW1/ryReik0TuknE4Y3qfwIW6HkG4aD5lAqRP6Jh4Ejp1GjkbGqnZ7VgbZifm1ATYjelKp
	1WhP17ylVN0tv850q+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uTK-00000009xqm-0dzP;
	Wed, 16 Sep 2026 18:35:06 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6uTH-00000009xpt-2oyP
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 18:35:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789583695; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Uzf8xjv0RWXzfhEnadNb3hn/NSq84yfAXfHH78fkjMJCc4kc9ABh2u/Ostnoq8W8aaSFaL5ykc5YqIVoGjzCaIXdErTPVkNnVoqYka9yFv+MtMabBDprdR/ZQXeqh/I8FyPxRqqHpKj2MN90N71Uku9Ww2C8ymaniWr7cHxMBVY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789583695; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ec60ZOz9fzZSy+ZoxPFSAmSl79Nfm2yiHGyvhxmd1b8=; 
	b=EvN/9pb5+9V3vXFJAYy3/kCB/a/v2qC838EGcRILxLAWva7CJXUAFoqRSotl57C7PAMe6Yo2clG0yjmefwH72GvH8UUkD9pUESPtN4tVupvtQd5n0rPOc+qzD8Q/qQXngmWLDDOy5GvgmV2sf4/WOEF4zgXboiWQV+C7PkDt11U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789583695;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Ec60ZOz9fzZSy+ZoxPFSAmSl79Nfm2yiHGyvhxmd1b8=;
	b=OtxJyOGtM5UR0k0B6USDpitLX47etcAr59f+1lQtwp9iRypJDJ+N7B0kQeSmzMZj
	0yTF1zt02kKbigdKFwpy3LdLq0k2mMqpsCixK47wF3R2nexJqPObCEv+tFrqSQf31p8
	+0m2x99dh759+LK9L9jxBcHohZkiXtRiagj21X68=
Received: by mx.zohomail.com with SMTPS id 1789583693351451.04523271072355;
	Wed, 16 Sep 2026 11:34:53 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:34:46 +0000
From: Yao Zi <me@ziyao.cc>
To: Andrei Lalaev <andrey.lalaev@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
Message-ID: <aqrhRic7Ww6fPhxg@pie>
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.567.80
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_113503_782590_92A697FA 
X-CRM114-Status: GOOD (  11.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 16, 2026 at 06:06:30PM +0200, Andrei Lalaev wrote:
> The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
> Reserve this region to prevent Linux from using it.

What if the coprocessor changes the load address, e.g., in a new
release, and how could we support other bootloader implementations
with this modification? Wouldn't the part of memory be wasted if no
coprocessor firmware is loaded at all?

It seems to me the best solution is to modify the FSBL to fix up the
devicetree to reserve memory where the coprocessor firmware is loaded
instead.

Anyway, this reserved region isn't defined by the hardware, thus we
shouldn't include it in the upstream Linux devicetree, since it should
describe the hardware.

> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>

Best regards.
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
