Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B4FCAC5B8
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 01:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMDJMWosG7MKpmLSCDsxH80oqTlqhf6moisCwZyawiY=; b=jgiG/KHjLvkJwI
	ikfG5YhrkNlhy9Oa80jHZZy1ZS+XBlM9D+FMoYiLa9nRFcbbUfWe3uRkJh3bwfMg9rvEATgU4oK4V
	i8u1DfdXCUcKujW3yWQV60ooyD+kP7V0rAq9Nm48sAixJsQ2hOz2mJbHLveTFw1VRdxKKfahYuCib
	59i3lKUgjmNHyFDxEfdQrYP7YmpR6bevlriOKgLgmj17znbHtmCTxaQ24mOLrSIvvje4SW+Fon86p
	rOB0lm0HQukjyatx+D/TvaEeSq6mbOaA1pbYa4RtfrjBpHBqqZ3eVFaaXc8+jy+9mErtCyb17yhU8
	h1fAsYfb9HLWUsV+wwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ui4-0000000BVez-0KTr;
	Fri, 03 Oct 2025 01:35:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Ui1-0000000BVdr-1dp6
	for linux-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 01:35:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0BBE43B4F;
	Fri,  3 Oct 2025 01:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A577C4CEF4;
	Fri,  3 Oct 2025 01:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759455344;
	bh=rf1er9a4lReCT/NehrRHLXkGnEVIVFBXkdHlXO9+QZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s4kKW0mHQPFPHhmpNE0b6fwkBcc7TE61EriU4uKvhaypsTBE9FNmEnwaYKfUlFqRH
	 XzZLXWLO9Njmfyl2FIPvfs48XcP9Xe3aDTailo/hWPS/HH3/8D1ALbq0D5YJfVIu5c
	 8vwsKQTxzD4fv4iM7GEbYgPc/p+r4AKXv6uQzJRSvtXcdPUCjo/8E3aQ72g1gADcJZ
	 Htzcyt6GxlfZfAqCSaKmCsavlQyZ/mA0qSEymI09a9r5bDa94PFt2GVXjwxHwOaS4Z
	 SYHQaMaQA8hXZZUoXI+YImH7P+wxMFN6p8F3K2xgdKSEkKnY4TZUvV8bcdZP9P4Y70
	 swBRfIlJ86S5w==
Date: Thu, 2 Oct 2025 18:35:43 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] riscv: dts: thead: add ziccrse for th1520
Message-ID: <aN8ob0mIu85m0nGO@x1>
References: <cover.1758228055.git.rabenda.cn@gmail.com>
 <71ac2ff73a63bd8674c4bc91fd287390d5339609.1758228055.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71ac2ff73a63bd8674c4bc91fd287390d5339609.1758228055.git.rabenda.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_183545_445931_59BC233A 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 19, 2025 at 04:44:48AM +0800, Han Gao wrote:
> Existing rv64 hardware conforms to the rva20 profile.
> 
> Ziccrse is an additional extension required by the rva20 profile, so
> th1520 has this extension.
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
