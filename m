Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC38CA1007
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RZvoH9D6XHb9gMy6l3DKQMB7MGsDtg35v/MpMwRX3WY=; b=Mb8yoAzDYGgNI3
	GXfVvRUG9RxtRjezFnCUkNemVASpcdJus+NYEUAduyZkmp7i43hKYpob3oMdtWXMnOAFu1ewk9SEw
	Ro6IBp1QBetbwe0m7oUKGL8bE8QPpEgwUhT+yO3t8lBuMeXkqfa0ogzBTu2izgyCieojdWKQcHg2S
	q/I3uEpPBFpInl9n+6vb0Kpvv0RRlbD8wm2Kg/KCXZ8+C6x1Np9LyqRBgRzHhuCXtjgwvojoiaEof
	c253ZojZQTrwACs6wfa47dgTT8PM6Ojtmyi1uT4IGiw/nfhern4LTixj9j60fHAd3Kq/JYLeq98Vd
	2UPr1IwgbmtLNo1POiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNk-00000001ZN4-0meW;
	Tue, 02 Sep 2025 19:09:28 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQnM-0000000HXxm-0ZwI
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 13:11:33 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756818690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kwfSBoK/ve+VpSlNqrICT/uqzddMZnVh5D/ECzeKzdU=;
	b=YWEC4QUpWfHi33bu+UhnWhDbbLoolTpMPiGzXHG164LfKGhOz4XtdxXII/AMMHGrp+lXYc
	uHRVXoatjegkcLeD/n2vfYABtxJVCJ4JifNZNqP/7y18hPF20O9W5mZv/Y+Rk7fEJgmvCY
	V+NUsP5eeVN0etb0l25dAX+35X2e4QyTHuO3OqKmbsEzU/iv41ewySTrPBeY3CY8gPpkK5
	bHcGOlZK8neVtIfVTHdP0WWuY7WphwFcaB704scqmZ9la/g1zsVMyekVv5ecIUTgOPLpR5
	NnoHfehjzDLa8fxMxhXqdGLQk1I78NDiFWMZJSxDPNKnt96xRlQUpGxuEw2hZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756818690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kwfSBoK/ve+VpSlNqrICT/uqzddMZnVh5D/ECzeKzdU=;
	b=ycglXv/8Sw1JkrzRNe1Kxtw+ZTw7kMPurQ2uCOSB1NYRnv2ef2R1D9mRa61JTdHsIgVret
	H4LwdxeiA7jGRhBw==
To: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com,
 aou@eecs.berkeley.edu, unicorn_wang@outlook.com, conor+dt@kernel.org,
 inochiama@gmail.com, krzk+dt@kernel.org, looong.bin@gmail.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org,
 sycamoremoon376@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
Subject: Re: [PATCH v2 1/3] irqchip/sg2042-msi: Set irq type according to DT
 configuration
In-Reply-To: <49e70989c2f0a8a67e48527e57b4877262996214.1756169460.git.unicorn_wang@outlook.com>
References: <cover.1756169460.git.unicorn_wang@outlook.com>
 <49e70989c2f0a8a67e48527e57b4877262996214.1756169460.git.unicorn_wang@outlook.com>
Date: Tue, 02 Sep 2025 15:11:27 +0200
Message-ID: <87v7m10zk0.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061132_313563_A40B0D27 
X-CRM114-Status: UNSURE (   7.89  )
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

On Tue, Aug 26 2025 at 09:09, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>
> The original MSI interrupt type was hard-coded, which was not a good idea.

That's not really helpful, unless you explain WHY it's not a good
idea...

Also for correctness sake, you want to change the DTs first and not
after you changed the driver to read it from the stale device tree with
the wrong type.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
