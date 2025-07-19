Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53BBC83F34
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jul 2025 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/h/kT37ekmTbEM79RMtXKR/5T0bTJqd4/NhvsJSxeE=; b=ZpH7D9avK4jHT9
	WvwemA1PYD+q4QgFBvhboEuO/0TfR/kuvMb6iZwgs0PwI385Xn/oiy7CIX6UdQzclFcroVv8bO85I
	gQd/1EoTwqD1/1yyihyiWzlJuHlFxWZ5vDvFnNVFX8AHnn5vXZBilhfC4abWktfWGbgyR1rXP6LkF
	HSlfmhfx4wtBCM24M3e9yZekk8YRMFGmzGH/SFoQtM64GYvNt0a6NkgJPPJqVcuF8VFS+j6Y1OWI0
	ZkX7Reb6pVcLHEbkowej4Iu+ajqt1ARLjtwPdZ0diXAQCzpYpEqWFJoul33xY1MKfzrIg7+UOA7DL
	FnqodDtCQGyor+3pSliA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud4ir-0000000E8Np-2Kvp;
	Sat, 19 Jul 2025 10:23:17 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud4io-0000000E8NR-419h
	for linux-riscv@lists.infradead.org;
	Sat, 19 Jul 2025 10:23:16 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1AD37340E1F;
	Sat, 19 Jul 2025 10:23:10 +0000 (UTC)
Date: Sat, 19 Jul 2025 18:23:06 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: uart: set dummy clock to silent dt
 warning
Message-ID: <20250719102306-GYA705838@gentoo>
References: <20250718-02-k1-uart-clock-v1-1-698e884aa717@gentoo.org>
 <22fd8b89-b937-48db-a5bf-4e468441b206@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22fd8b89-b937-48db-a5bf-4e468441b206@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_032315_020553_46B926B2 
X-CRM114-Status: GOOD (  11.91  )
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

hi Vivian,

On 15:48 Sat 19 Jul     , Vivian Wang wrote:
> On 7/18/25 23:13, Yixun Lan wrote:
> > sec_uart1 is reserved in DT, and no clock is implemented in the CCF
> > framework, thus 'make dtbs_check' will eject this warning message:
> >   serial@f0612000: 'clock-names' is a required property
> >
> > So, adding a dummy clock to the device tree to fulfill the clock
> > requirement, then silent this dt check warning.
> 
> NAK. This is definitely worse than the warning.
> 
> Honestly, if you don't like this warning, I think we should just drop
> the node. If not...
> 
right, I realised this wasn't a good approach..

I will try in next version to comment out the sec_uart1 node,
unless people have better suggestion..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
