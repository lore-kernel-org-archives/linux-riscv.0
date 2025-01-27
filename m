Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14569C02188
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 17:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiqLdfWsTx4moWp+SGfc4at++nHdnSXcpBubcHNOhNk=; b=YIn5XD8v1irfYY
	uRfPNhGKKo7WD7S89FGpX8lJ9TQbIr/9riz8ZJJRljUC91Q5/A33D97lydvCASN4yFAD6kATs08z2
	4VSorxw06B7A2WaoO6xqEKKC3rePlfsnGoPfqeZN00doZ6tnDs+2S8HKG4cj0Pjbjw7qMbu1pu3WJ
	vyizS0McAOUqlTqI3kf3IpYpFopx3Sd1wRUghyLNuNzGyxAY9XrEJmRrifPY0hhQdIaDsbJDItj5I
	pF2i0mK3qdOqzas2NsqQvXA0I3KAS6U6awqk5D8nx85So8NFjlVeG4jvOF3GEHI9EMS4lcJjvWmm8
	QqOj11oVY9Ne90foNQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTIH-00000002xLm-1Utm;
	Mon, 27 Jan 2025 17:53:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTHe-00000002wzg-1Eab
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 17:52:27 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738000344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TOlQGAOrFNEkdLS0RWXAijH0T2zahF0AUY6O5HkV56U=;
	b=iJqw0Y/ISbwn6iZ+5Asg5nc8WdREWNtcRf0RX6tK26ZEzj7vdEd70HMF3JhU+kEdjLR1Jl
	coTVpiF9pctggg7wIxgOXKoGlPWWNsOpfFtjqf7ozwPw5YGUAV/uhRdU3NPEKx6aZWEiaa
	i0Okvfse8KwVtd4dbd2EswJ1xXVT8a36W+z98fIHmuadfbAeG26XymgMZLhjCojSrhBWZ5
	q+9vERIYrYf57BvWzl+xR7koza2s/+69cqmyRoK1LOMLgUEBZvUgFDJYwPQYPv3RqL7TbK
	j3XNAYpQOPbMl+3BXKFkKJKxjTTozo7zkHkZWkkPa4/VJeuslqqhW3CnGdw9Rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738000344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TOlQGAOrFNEkdLS0RWXAijH0T2zahF0AUY6O5HkV56U=;
	b=VFGL8DfTCdjujN4Ijpccci2cB2onhOkb3QVnd7xcTSPXNbKCs5gGr4FnSFhU9dp8WAtZWj
	wg6WGWTG7pvYutDA==
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>, Rob Herring
 <robh@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: interrupt-controller: add
 risc-v,aplic hart indexes
In-Reply-To: <VI1PR09MB2333835FB0314EE32094D55F941E2@VI1PR09MB2333.eurprd09.prod.outlook.com>
References: <20250109113814.3254448-1-vladimir.kondratiev@mobileye.com>
 <20250109113814.3254448-2-vladimir.kondratiev@mobileye.com>
 <20250110162235.GB2975507-robh@kernel.org>
 <VI1PR09MB2333835FB0314EE32094D55F941E2@VI1PR09MB2333.eurprd09.prod.outlook.com>
Date: Mon, 27 Jan 2025 18:52:23 +0100
Message-ID: <87ed0o87qg.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_095226_474078_D22406DA 
X-CRM114-Status: GOOD (  10.35  )
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

On Sun, Jan 12 2025 at 08:38, Vladimir Kondratiev wrote:
>>> Document optional property "riscv,hart-indexes"
>
>>That is obvious reading the diff. Why do you need this?
>
> I say it briefly in the description for the property.
> In more details this is described in the other patch comment
> - for code that uses this property.
> Is it better to repeat more detailed description in this patch
> comment as well?

Obviously. Each patch has to be self contained and explain what it is
about.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
