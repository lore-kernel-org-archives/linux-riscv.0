Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E01C4741F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 09:31:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C944820786
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 09:31:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gOe3E0K2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mbxPu3UK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C944820786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6RipFIM7EeGi6LA1XDy9U+fuO4ePUxxYLVQvhVZTlqA=; b=gOe3E0K2rZIbLhsTTnYF6HaB0
	9vkQZbJtL+XOKypVeG0bmZiqQ6wcJvZ4fhBo5JgnWsfxDhLXJMOwtZXFpnC8FgptNxEyYUOwAzIT/
	Mc4SiF2p3TDIDc5TJRDGkKMsdSzmejZRfscYmQoLSP1nmEuIwnJJs3lpwvJjL44oi6rjxQ1tQcnFt
	QX3WpbKwOnYwY3lmOUy9achJCvOjZ0bn7b2cjqnAnqFrauRY7fEjLqGv5BgUPy2T7PQc09T02kpkK
	SNx/Pt7ZX3ad3SGtPj8cTGyVoTD92hlRauCfr71w8qORgWw6ilB7XYesBeS6o+mHJp3k9vnY0yTVA
	kMUjpBm2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kabbv-0003TE-SE; Thu, 05 Nov 2020 09:31:15 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kabbr-0003S1-G6
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 09:31:13 +0000
Received: by mail-oi1-x244.google.com with SMTP id m13so1012359oih.8
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 01:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LVlXt5BRht7Msns3dWc+vm5sdIuxtjpHGFdLpNX48Es=;
 b=mbxPu3UK+fq+Ovztx/9psvRxP4INSGNNfXhjyN/7XZpPdiOw2hPOZxHaFYALt2WoDr
 CgEgMHhRqQAcwMqHx632hYUobRS2jbmpsVh110y0vHVbR5VGP6VIE4gko2uzJYGCKpf7
 L7LrnnBbbdNJzkb/3rs6argzCy8hPxzZUkRM/8G1p4BEhB+hfPZufa2IiMm2JNg873/u
 7zvk97cP1azTwPr9HYOR2XSnOkQznxnZda6ZlyYtCY1hlxFbFAKjhq83k+/l1TSKXI8k
 yaKy7x6Jk1w2ZZ20pv1lRoAnev2cAK8T1npaVL7mq4iYlvYO9S2gkPGMuDxhh/UJOLoD
 G6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LVlXt5BRht7Msns3dWc+vm5sdIuxtjpHGFdLpNX48Es=;
 b=f3XlSJCsM6MJ1HM0iI7xP5eol/aTj6ssszNsfw9o3BtIhr+TnfRk4B8dbrWSg1Ke8P
 YtfWHDqcTfar7jX3Fh7sXTMFgq4AheIV67rQzchs/fhWjObPoxTeLls5WnFeaKcw5yDK
 QJiVGCQgZMix9kzQfVeKenb/UHpwfXkXrzq6LpR0c63SUu0phRgV/+/Bu3cnMt55sDzD
 2wWcaR79ePhLdoERieVuFoLlDOwXz/uO0ZC2mURlcaMFlU9z+exeC3gGpG7JBgCAQoy+
 n7qhcpgt79ukTT5c9+VFo6adC0scpFNqCnYWbfBchRJN02z5YpwP/s8ZJY8Y8IA4a5VC
 zIUg==
X-Gm-Message-State: AOAM533Ku05WhlTYpragZmioVZzD4G8k3qMVq7TQdiK1tyGwtpond4ek
 M1R5h3mRDi4NghWp6IH3R13Nx8h4o5l6TxoataWKOw==
X-Google-Smtp-Source: ABdhPJyrSKMg3Pisi32xbZXMPw/5VQzRrgQcEcttOCy/1JMCHMRUwxra8w/HmkA2JEIXs+L57kUi1P3riqpHoDNYjsM=
X-Received: by 2002:aca:4b82:: with SMTP id y124mr973648oia.35.1604568669184; 
 Thu, 05 Nov 2020 01:31:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1602838910.git.zong.li@sifive.com>
 <b10784643665ad56ca41ea6754c7f28f8be1c7ca.1602838910.git.zong.li@sifive.com>
 <160454434294.3965362.6100009498384462585@swboyd.mtv.corp.google.com>
 <CANXhq0qpEXejD765A5S5KfbuYQc=in5sFdEmk5K=BzZy2L=nmQ@mail.gmail.com>
 <87a6vw40v4.fsf@igel.home>
In-Reply-To: <87a6vw40v4.fsf@igel.home>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 5 Nov 2020 17:30:58 +0800
Message-ID: <CANXhq0qmo4Vct3KAc9S71O1M6DwPpmU3AFPgnEFO=1BDdmcavQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: sifive: Extract prci core to common base
To: Andreas Schwab <schwab@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_043111_843687_76E7CDAC 
X-CRM114-Status: GOOD (  11.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 5, 2020 at 5:19 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Nov 05 2020, Zong Li wrote:
>
> > I tried to add -M and -C option to find renames and copies, but it
> > doesn't detect anything here.
>
> -C40 finds a copy drivers/clk/sifive/{fu540-prci.c => sifive-prci.c}.

Thanks! I used the default value of these options, I would create the
patch with -C40 in the next version.

>
> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
