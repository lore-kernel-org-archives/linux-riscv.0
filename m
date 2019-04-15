Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A95C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 06:07:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE1AE20833
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 06:07:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l5As3TQI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fKGa7by9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE1AE20833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CnrdKmVZM09MwUI3MlBfdl219Nuhkt4wtNj8gyLbU0=; b=l5As3TQIq6M08L
	ZSoZkzKtP0r3HGDhPJ+cE5mqOze5ab50H+s2RCuKXs1qIRzYx682LhP7Patr1vPnL7GBVCNp09QNS
	GHJpMeQRaTQGbReViVQnMA/r8DAZd2Ofoopzmza7TfmIoCEH15vrgnocuIIi6xk4pb617iYaBnYia
	YFCckabtI1e55Lm5Uw9b+97C1bTYcF77PpiDV9Cbd9vR/6pRrLLlpPqqkKlyo9M8ouURq6IEYGDgN
	gstAcF4VDqEmtXumqa1d0QLGJXT9OgAcIazM8CmZ86tOfioXQR+prCX35gbutckJ2vKJfRd0XywMg
	QJyE+Vm84L+boc0tvSJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFumC-00019M-MU; Mon, 15 Apr 2019 06:07:32 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFumA-00018e-CZ
 for linux-riscv@lists.infradead.org; Mon, 15 Apr 2019 06:07:31 +0000
Received: by mail-lf1-x144.google.com with SMTP id t30so12063573lfd.8
 for <linux-riscv@lists.infradead.org>; Sun, 14 Apr 2019 23:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GW7M4MHHIkdd6HVQz82d2WszDsg/6I6fTV7AdaP6ddI=;
 b=fKGa7by9308ZG4pUNv72cXFoW8iWW29xMC86t01xUJ5gLEwQefS/JYG7GZVgjPRgJh
 jdx8VzNKD2TRtjY8P0p+xNnaVhsrHWbbkwUlz2hYG9dSRXPI5vfS0SW5Wt2tDalm8XDY
 XkYx+BvxWJoVY9KyK/H+iHPDpn15fteLUo6BgxyBy0Y1TdNTLJ3gM/JtCtxQz0Fp6Unv
 w1YO/7iLm6c7dTu6lkr4jciS0tom/y++q49nIsKPRWEIxpMzShtXwwtgeTqPFAnoBskq
 BfQVLr9NhvF/d8+uX3++dvsJS/tknxSJlqnPs0/mQv8STnCoQfiEd4W41Jut5YbfT93p
 TLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GW7M4MHHIkdd6HVQz82d2WszDsg/6I6fTV7AdaP6ddI=;
 b=kQZ3rm4q3YtDyg/zHigudZbawpzcWYBTnG96RmFBhwyKMR7CtaLq6F/z/tIEVH5Mzl
 CZep5LVrj1PZt7qO61xNE/py7sYnn9UUsZkBtXdXlYZqaUE9DvKcO3o4Ao5zLk9QN8U5
 0RDNjNcsCkMCf8goFik+mbeidGlECH/sFwkOidyWOirDyhRwWiuMJA27ONBSYJTlato7
 MYumWrJmTTAUy9rmAEV7ePhDZ+HRWHo7CXsMu1wEpA01nDnbogzowno4qeZzQhqosiJf
 s00whDbJBB/vQcxUmXlqEy78lkqFKk19azIz5zlv7VaC2cXt0IPlQNCWq6c6//754Ps2
 rulw==
X-Gm-Message-State: APjAAAVInGI+NQmAWkg861qwGSO4khSEV5bFiRF8bjG4CC+f/msCVN2h
 TNqHBrV65ACo0Bidkeyw8nNyRhrCI+3HDnHz1Ec6FQ==
X-Google-Smtp-Source: APXvYqzRmGYbJwfZKgoXZng5xC6EIs3HK92tsvwK9Xlv6E90GYGlv0vzWnDND9BQbN5cO2R61NRo3nQcYoo7vk/b2Zw=
X-Received: by 2002:ac2:43cf:: with SMTP id u15mr16750868lfl.67.1555308447972; 
 Sun, 14 Apr 2019 23:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <1553508779-9685-1-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1553508779-9685-1-git-send-email-yash.shah@sifive.com>
From: Yash Shah <yash.shah@sifive.com>
Date: Mon, 15 Apr 2019 11:36:51 +0530
Message-ID: <CAJ2_jOF8RsLWHkcCJzwfpeMN0+G0oqbHto=nBBnpZDNfuQMKOw@mail.gmail.com>
Subject: Re: [PATCH v11 0/2] PWM support for HiFive Unleashed
To: linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thierry Reding <thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190414_230730_440191_A283D09C 
X-CRM114-Status: UNSURE (   4.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Sachin Ghadi <sachin.ghadi@sifive.com>, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Any comments on this patch series?
Any more changes are needed or it looks good to be merged upstream?

- Yash

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
