Return-Path: <SRS0=TPRL=V6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E3AC32750
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2019 17:32:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A4C0217D7
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2019 17:32:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XxEB/Z/L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OH+JYcXQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A4C0217D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaOKcnKaNIOzDhXR61+DpHyJLou3/2FebHieVRuHg/k=; b=XxEB/Z/LnU7zti
	aA0ygtDYb/8zwLB9HFuQR4VIuLc1nTFlKn7puCdqJkfvjzuwFQtiJWrxACFzAjFer726zJIruqQFJ
	AIAb0+OQhUyTQTvbDj4cQk4/bDrOlojtD2cc/6BvOkVvhfQr4t1QNB+vaU9IP7w6VJXncBH1YRota
	dUIZCbpG3n4rLqbCAl8iNGfWeqz0kS70rlHLfweIzFjN2nIr+ljQ90bmFv1EovNS8De2P2kW5TBHz
	eXJlt5e1lA+Lps1WWvlDumVrE+VRBQLfn2oomT1jAnRFxJNOzE4pWOcX/6AOQb6/44OtR/Y5qJl04
	IzFI+R8hKqKlk53EE3AA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htbPy-0006JV-Gs; Fri, 02 Aug 2019 17:32:38 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htbPv-0006Ip-Ta
 for linux-riscv@lists.infradead.org; Fri, 02 Aug 2019 17:32:37 +0000
Received: by mail-io1-xd43.google.com with SMTP id g20so153868115ioc.12
 for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2019 10:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=D9D5khdP3Rqxb/CaZPyIGpR3v/XHzzkHopBjvuoxuWo=;
 b=OH+JYcXQNHH/2WUzGBsq7HDtC421LQGB3qwgrAZc+ppMWOR+uSf+ZEK+VVLbQAQdAX
 dQDXjgkcFYiNM6RVAFcdnuLEX+Mc4blqLKBW+1FR+yuSN3bNi2N/wEFqcZeOrD4/c49x
 y2kXYkvV/RwYOBJGwHeJyHbIdrkEk0eNoIdqPUoqDCSsaYh/kGCQx2L5+i5q+u90Bl1L
 Gv2qNLebVgX1TiVBscoKsLUw0N8Ets7ram8yF1E+Q5hekqXXtwB441k95KqF+JSm9/Hj
 MMK8h0UkW+RTqpR+AK+cOp0Jt16b677LCn1j3kP6Jh1fYZFBx4QSAKzXgJsmyF2sf2KH
 whjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=D9D5khdP3Rqxb/CaZPyIGpR3v/XHzzkHopBjvuoxuWo=;
 b=ETV5BoAWW9ym+SWjr2q8UChIMKzMtK7Q3X5JzlcvgCsuZJXObn/YNxI4qlWhIirhYX
 nMKUzogxmsRYMe2vEkvwiZJSRRzk7IIq5NUkiunFOQuJe2eFUJoGog8w/HEhFoNVTZEu
 qBdTxJ5dZHcljD6hoaA2hDejdipXbTpqI6X0DoYjB0wSIk7A0sSVI0q8KYX/i4xzUbW0
 q0XfM7rbIcb50rmIYxUPFJ2/WHLFL0AR7HCvto9nNzpHMT2XcN+Wk0lZGFdoEH06G8o+
 SrFFByxF5kr61d02rUyfzZvmkmiA87OYTZPC10PUh20kz8B9Vj+cez4OxZnWM6ktqgrj
 pL4w==
X-Gm-Message-State: APjAAAUXWwa+zat1wl9BuXd0JKMGmUHk8AMEqpxTKpN0+0qVy3YFXz6Z
 ejmZWaUkrttKl6OAHgYsWVhEpSCLo1I=
X-Google-Smtp-Source: APXvYqw/gTJgWaUYmRYeMvRcpX3qa5Vvu7QZIr6NDl7tY0tSn6j39GFCnfbREKdhskoZf6uP2ajgag==
X-Received: by 2002:a6b:6001:: with SMTP id r1mr48552907iog.229.1564767154891; 
 Fri, 02 Aug 2019 10:32:34 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 r24sm54009942ioc.76.2019.08.02.10.32.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 10:32:34 -0700 (PDT)
Date: Fri, 2 Aug 2019 10:32:33 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Andreas Schwab <schwab@suse.de>
Subject: Re: Random memory corruption with v5.2
In-Reply-To: <87ftmjvkg9.fsf@igel.home>
Message-ID: <alpine.DEB.2.21.9999.1908020853120.9827@viisi.sifive.com>
References: <mvm8sshcdwc.fsf@suse.de>
 <CAEn-LTpM-0TMxkNNh6nnLH9Bnr9Zm+VFLf=z1y9sER6RXrQooQ@mail.gmail.com>
 <mvm1ry8au3f.fsf@suse.de>
 <alpine.DEB.2.21.9999.1907301709510.4874@viisi.sifive.com>
 <alpine.DEB.2.21.9999.1908020022400.11222@viisi.sifive.com>
 <87ftmjvkg9.fsf@igel.home>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190802_103235_983885_22747FCA 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org, palmer@sifive.com,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 2 Aug 2019, Andreas Schwab wrote:

> On Aug 02 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:
> 
> > I was able to build glibc, and run most of the test suite, on v5.3-rc2 
> 
> Did you run install-locales?

I just ran "make -j4", "make -j4 check", "make -j4 xcheck".  This is with 
rootfs on microSD, rather than on NFS.  

Do you still see the failures if you only run the above commands, or does 
the failure only appear with install-locales?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
