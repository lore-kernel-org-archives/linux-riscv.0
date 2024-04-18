Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA6AC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGnrDw+fkbqWRNNoAtG3e4MX7v8jeBOqPXfp2a9HszQ=; b=bgRryCYJcjMunP
	KYOrlkYc2Vcl6+qXIA83qoqOMQOeVcJO/CsPuZ684rPYXDCBRFLnC4eyNYHyk8/erd9A8mBqdyoQD
	D+SfSXEfVNvM4M5a4GFC3ChrrmccUI33O71gOFEIf8nytZrZwUzdXjIQe/LC1rhDqWSVNct8XDLKz
	0SPqs2Ei0Y4Ae6gddTFpgFLRrsGJnrRuvXPFIxvvJyzagpGA/yEjic09pdQmeWpjAFsxa1cVAV6D9
	aDGTc0+LVgzHweUQruOK2Sy6/MaAk3Ovvp81WY12dWt12zb3wHha6gkDY5VBaOJoXne1AK95tkvW/
	n1LY1O+ds35pgQtBemBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRU9-00000002JXN-3RoV;
	Thu, 18 Apr 2024 13:07:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRU5-00000002JV4-4AfY
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 13:07:28 +0000
Date: Thu, 18 Apr 2024 15:07:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1713445642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvo4IB9EX2vgtvJVoBdjCViGeeUjaKsOvZ3vCy38w78=;
	b=c2SdpSPfmg8garIOwBGnXvJv+xZ574a6J0d+i6DmmczkYNsWCT1YJnHLNMguhg/C2xkOXx
	cCdeYwnJmftxBmq8OOHCS1zzpnMSxVrb/84exI26N/KDpVKbTVRvBAi6Dnty/SzPQFkZxh
	Aj63zVR9bT2z8Wo+8PiOBaDZQ6XU82YW6AbudIXj4FNLOXwH8bhvwSBmv6zeDMAOUli0KN
	NzlpiBoi7ShRCggyBm2Vp+wrXAL7QFHbGNa79vLUwtTvaVvXtbKYASJCMeIrb+DjyKj3hU
	b5UpUIYtpPLOjMIeAvlaVGH8G65L+TKxTROEHUR3i8gcPZ2bCtB6MlXc8UEvfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1713445642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvo4IB9EX2vgtvJVoBdjCViGeeUjaKsOvZ3vCy38w78=;
	b=43Uwr8Spr789PRY19/kpBrkAVJmwqG6R+wfHSCcTUl4PAEWCZfc2pvl7hw6yFtOqkJyayk
	MQvkZ6u8hA2H+IDQ==
From: Nam Cao <namcao@linutronix.de>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andreas Dilger <adilger@dilger.ca>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, "ndesaulniers @ google . com"
 <ndesaulniers@google.com>, Luis Chamberlain <mcgrof@kernel.org>, Ingo
 Molnar <mingo@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Tejun Heo <tj@kernel.org>, Krister Johansen <kjlx@templeofstupid.com>,
 Changbin Du <changbin.du@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] init: fix allocated page overlapping with PTR_ERR
Message-ID: <20240418150721.25d0e82b@namcao>
In-Reply-To: <20240418150148.6a0b4664@namcao>
References: <20240418102943.180510-1-namcao@linutronix.de>
	<20240418131238.636bee2c@namcao>
	<87edb2sv0d.fsf@all.your.base.are.belong.to.us>
	<20240418150148.6a0b4664@namcao>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_060726_219916_CCD24BEA 
X-CRM114-Status: UNSURE (   7.75  )
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

On 2024-04-18 Nam Cao wrote:
> > Mike hints that's *not* the case
> > (https://lore.kernel.org/linux-riscv/ZiAkRMUfiPDUGPdL@kernel.org/).
> > memblock_reserve() should disallow allocation as well, no?
> 
> He said it can't be removed if we set max_low_pfn instead of using
> memblock_reserve()
> 
> If max_low_pfn() is used, then it can be removed:
     ^ I mean memblock_reserve()

> https://lore.kernel.org/linux-riscv/Zh6n-nvnQbL-0xss@kernel.org
> 
> Best regards,
> Nam
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
