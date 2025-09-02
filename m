Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE06CA100D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqLoDZe2CHwRobPJcMZvCHwtR8XVCI+RH+nj1lBTQjA=; b=zlJ1Nk3/ymRJPL
	j03XAQZy92sY7L/72yhThKYBIaig8sEklqYTsDQ7e8MYhqaGlNt1SGMoy67jMm48NNUC75qusocxB
	wzrcnpi49ubA7NcOgzehuJo7czIMpxAYqV7Txkgj9ThPSNqGT2YDq/XP63ojpymYppgMxGvkyzeMb
	qlo64soAapGVQ855mQYmlvrliML545lafa6hl+uM8s5vXv+usPIpX8Mm4vtQzqMtk+eVzLYdEyJ8A
	k0suQUxhDPUctRTW0BIB6tVWr+iA6z23xTv52eXcVNo1peY9i0nbSRIohoDYzsszEyWiwiBfmpD10
	FetJboeAppfg11qXs3KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNm-00000001ZSH-2VYh;
	Tue, 02 Sep 2025 19:09:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQoY-0000000HYNS-40wZ
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 13:12:48 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756818765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5msd1yIMdY5vtXm4sNilojUTHfQgb9cCb+7QeNrAlg8=;
	b=kpDQ4IgDMyN94F0DynNn5eSbOI0L2CiD9PXpcjKY27nOaHsHhYZo9oY5Fzxfdxvlq/8bkM
	+SNXQo756Viw8DFyZafHZCYBn9PQrOIqHjvD/d53pLs09r+8P4zQoj7kB9DU5YeBSdPc87
	kr+zO96ahEztJCixdLc8tInsJtjDXDsHbc1yq/9PMrlsTVNYRfYJcQ88j1DK1zKRb3OlG9
	3fiMylo7KCSQKFuD3aXn9cRZ+URgN4huvzCVfvDksCrBUWEqADZBR6l7w16qnZpT8U1qeT
	S4lOxUxU5engXh/y4YqGFWWLm844YlB4fzfCQNq82Bj0gEOYF5h0tDFa6PRcsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756818765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5msd1yIMdY5vtXm4sNilojUTHfQgb9cCb+7QeNrAlg8=;
	b=y19eCle9Wtsczi3sigCknY7Y10aJr8DNqztsevZNiDN6Yb1b0ZzwnJlm3TjrNifp1zMi6c
	6E/pGZAY5Fr8cYBA==
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, inochiama@gmail.com,
 krzk+dt@kernel.org, looong.bin@gmail.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, sycamoremoon376@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
Subject: Re: [PATCH v2 0/3] irqchip/sg2042-msi: Set irq type according to DT
 configuration
In-Reply-To: <MAUPR01MB110729FEE220A79D00B52121CFE07A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
References: <cover.1756169460.git.unicorn_wang@outlook.com>
 <MAUPR01MB110729FEE220A79D00B52121CFE07A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 02 Sep 2025 15:12:39 +0200
Message-ID: <87seh50zi0.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_061247_136242_28FD2E99 
X-CRM114-Status: UNSURE (   7.28  )
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

On Tue, Sep 02 2025 at 07:59, Chen Wang wrote:

Please don't top-post and trim your replies.

> P.S. Since the modification of the DTS part is closely dependent on the 
> modification of the driver part, I am not sure whether you are willing 
> to pick these three patches together, or just pick the driver part and 
> leave the DTS part to me?

They need to go together in the right order obviously.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
