Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3472C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0LYnFMmGpbXEC5O8vVcO7+a1D3jz55DhgUlyrPNmJI=; b=Sc8KUdSnnclkQg
	tHxQthAaEGFy4IiO1XEN8+Bpzuwphe08cXYvhXab9XQX5q+/oOxiU+Tpj/wSYYtg17Az+Fg4uzU82
	sb67zizDUOQ+ct9XjfCuDkLMAsakDpiEVZ8V5e14/ZpRWpLMcjP63+1fKJXZwcuH0ikcmQhXfRIRl
	9BMMbSV7B0hX/Vshn3/D5JH3hlNunl99WEUrALDrS5SmM2Rg1KfS3HjpNTKCi5ap1vdUZQ1+ukJdA
	x/atby+/bGBXaMVAv/VDtZZsHNIjCOdKytZpL1QFkacfs5ismTgNKBR+j/3TAExBm7hpzdloimC32
	0pcMJF0pSCsNbIvZ24CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJdQ-003TvT-0x;
	Mon, 17 Jul 2023 08:31:12 +0000
Received: from out-14.mta1.migadu.com ([95.215.58.14])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLJd5-003TrD-2h
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 08:31:10 +0000
Date: Mon, 17 Jul 2023 18:27:09 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689582648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOmp5hitjZ7fhm1BXyLkFc2kTKDhZG8EGRqz2ebffbc=;
	b=GpXQf4zV2MwaDwhojYBOz5NC3XWNInzUGL9/0EirKSVhkIYqIJUXbUW8pkL6ukdaeW7FKE
	yZAjZCIPZufRStV9/QjGJBAvYi6ZijuhVWLYOU+IrU2AeHam8JGb2mK5exfQxf+an2AaPd
	I4Z/lvhjSF74e+9vL/MR4b7YiUMxgYQwYoft/Nm/PDk1F7K42H4DSRK1EkvlDpZgYJkppm
	JYAC5jQl53ExB+Gb0lg6AaJ7kRSMfhy3/38OrpD9RndOhYRby9eAE2NWAo1tXN4wU5obhU
	WhzbMoQe2Hi7Vf2OYHDLF596+3CaK8dHwUc8hPzKzl1D99agbwLgUkGRllzuGw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 0/4] Add support for Allwinner D1 CAN controllers
Message-ID: <ZLT7XYUziT11D8Nj@titan>
References: <20230715112523.2533742-1-contact@jookia.org>
 <96641e09-c676-2702-149c-885002f45a64@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96641e09-c676-2702-149c-885002f45a64@codethink.co.uk>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_013052_055364_E9208D27 
X-CRM114-Status: GOOD (  10.16  )
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

On Mon, Jul 17, 2023 at 09:00:47AM +0100, Ben Dooks wrote:
> On 15/07/2023 12:25, Jookia wrote:
> > From: John Watts <contact@jookia.org>
> 
> It would be better if you sent your sending email to be the same
> as the from, I think you'd technically need a signed-off-by from
> "Jookia" as well.

Yes, this was a msmtp mistake. Will be fixed in v2.

> 
> -- 
> Ben Dooks				http://www.codethink.co.uk/
> Senior Engineer				Codethink - Providing Genius
> 
> https://www.codethink.co.uk/privacy.html
> 

John.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
