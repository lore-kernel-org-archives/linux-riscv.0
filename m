Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468D7C982D8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 00:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9r0VKidzpsz+19sGYn7JaI5tkDph0klK0xOJRNUyLc=; b=C9FE5hFTm9gVw2
	L0bLRu67ZJ6NeApQAbw2NZrfNe8egKV8XWOsXEnd+VpXgFZV06+Lg+JqJ3YkK4oC6bOwgHT6/0VC1
	1NWRosaFPMBBeZQncRRyeQbl9SEk6R4OLfD0nBL4FsHU0sgYsj2M1fYxazhPKRAP5rHOW7pF60Clj
	5fv+RKuzlCqi4lipXpr/+FllR7I/WhpH59JOCTF0TrNtPk1Kk4D+mZuTdbTkOIJ6RkoNLjwTjaCa5
	mQSIGp4+CLFpqqFRkss6IVUeN5knaN4b7aZiaZHFkAaUqgwLOxzgnpBCDEo+ZLvGoxt5EN+Wg8WTa
	ltXdqUfBW/1HprkPLCrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jFf-0000000FnBO-2Lsl;
	Sat, 19 Sep 2026 00:48:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jFe-0000000FnAu-2uOC
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 00:48:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2F936053D;
	Sat, 19 Sep 2026 00:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792BA1F00898;
	Sat, 19 Sep 2026 00:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789778901;
	bh=w79NV+0ncV+YH2CUQ8axp+D09XrccCRmRMTtC2xrIJk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=nekLv9c3M4dlQt5JifbNZjs00uUv6IbP34VIU0EIlp3ht5M1nPNMsE7rria3XAKRe
	 X3Ogtjs3Tu/ng2Dcg9wSyXxvH9hvnZaLWOspEmraouWWBcbD/FgtOpOG9GquBHVrWZ
	 Hqpm92pfnIAfmJq43cnVV3sxxMBoAULmiSXQGntRIQGFrSgMULA5L5iJieXc+lhT9i
	 RauDs6fCVBdnxTvTU4LUfXCZsRGVEJa0nGT9Y4VgZv/Su8T1rB+mjDueTVTN4uek3M
	 xtpI4zyAC1EejvBPIA31UVYHvIBLNq5X7dN1acwT1Sas84XF/NXtXd5hEQ3hSeWXFV
	 rZnUXv5bdhxlQ==
Date: Fri, 18 Sep 2026 18:48:19 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
    Andy Chiu <andybnac@gmail.com>, Vincent Chen <vincent.chen@sifive.com>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
    Greentime Hu <greentime.hu@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH] riscv: vector: Fix data pointer constraints in context
 save/restore
In-Reply-To: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
Message-ID: <a58873a8-5c05-696b-9b44-e1741eea24ad@kernel.org>
References: <20260908-riscv-vector-asm-fix-v1-1-147f314efb2b@linux.dev>
MIME-Version: 1.0
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

On Tue, 8 Sep 2026, Troy Mitchell wrote:

> The standard vector save/restore asm advances datap but declares it as
> input-only. An inlined caller reusing the original pointer may therefore
> use the advanced address instead.
> 
> Declare datap as read-write so the compiler can preserve the original
> pointer when needed.
> 
> Fixes: 03c3fcd9941a ("riscv: Introduce struct/helpers to save/restore per-task Vector state")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Thanks, queued for v7.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
