Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE45C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pYJWpVmrirBDvMjzwTlrSOoBw9IOSwBvJvJaR0E1oJE=; b=p6hu6gVS8RBsHzrE+tkE4iFh6q
	N9dDk/twjMM+0lyYNNtUe3thkhZM5xN2iwSk+2iwTMb8H6aRnEWcOLCBhLwKYA0w8Xz5qDoFSyFhe
	pyismDlaSWFNWxRscP9932OpikBAIySQgmiUTZ71YNW+RkfsMUQI8ksdwRIGZAY6zku5HYU3l4kSB
	ciwfwx8/TvtH0IYfnortSH+I8mDuoe6SXjJl0J/SyY5bjS09HmxnpsWQFgIZxzNXirf90mTe4akhP
	oxX9HiWfA0CPEjcoXz4pvkNufe5j2hBJJ/kYeYEJfEQilL2UhZfcA92Ouuj7QL6ECFYuAGvTVky0T
	iPjUexqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyCMQ-0000000Ds9i-21t5;
	Fri, 28 Mar 2025 16:15:10 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttSvQ-0000000GUGS-1oes
	for linux-riscv@lists.infradead.org;
	Sat, 15 Mar 2025 14:55:45 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3014ae35534so763909a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 15 Mar 2025 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742050543; x=1742655343; darn=lists.infradead.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
        b=IBuOAW8FjirGzq3H8Ym9bynMCkdyvrv73YKtuBber2wMLy7mLOaJnnMLzHZ4stftuZ
         Lyy35kM7Ce257bRT/IIS3u2oA7oYSrdKjwPt61eMVq3krEheqaRVgq9q9BoryHcBU/ex
         AWtrveTfD1/7IdH1Z37PZA65PWCkf0KyALeAPCZUuExiYX7QsPxFk0Xq3Xd4RFN5Im2f
         qRSZePuFi6kDDXYn31TINNnTJI/Ay8xcEzRSE+mg1DdKTL5FPPLdjfR0zWvQJjtzH+3h
         eseR8ClSn4jbjWpZkxLgB7GS0FuO2R5symjiziUjKr5eHFOcV8Zdlc1M6riPlndjWhKE
         9z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742050543; x=1742655343;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
        b=vgzzKnkl6LsDCz80B10NPLxIsyeT9RuN7vEPfb9xjsEtBCJDAm5DVHwA2AaK2MaN0a
         +lUe7QxWT7arsF3BCm3nQr/ky6/6/I397Eo06vjF6UdVyoce1mkZCM6df/TOLWKC8zWe
         YB8U2UmjxofgQIad7Qe4NmInMH7XiSTTPjUC3WQCHVbTfDlPYrjfJYd6nLI6wzdPHAiH
         EhzbO7m19qZPgL/iDDQvK5V9XJpx43sKIdxOiAexdTc0Go3egevKDR0RQBXitN5L91IL
         OpWTvkjtDeAkmDFOLMrEEgIiwnOFZQlz6usfdZFBk7Dwd7bdyyRQLQMmcm1JNI4dCBqe
         jJUA==
X-Forwarded-Encrypted: i=1; AJvYcCVRtkZDqZQuJzWpjg/ZeNf91A0t1OVLH9XBGqcUCcrCXgs3F7Ws+gBjL1eZTn18JCwV/TodQdXCFxmLVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzC3OI6sZf5FN8SjcqOUVSVdKhOA+TGulfGtUK5Ul+fhaScNq/0
	YdJPSIpe65WVvf7FNI3C+bY+ovpDilPHcRpyXz5hUAePzmSDLekuQ2l4KqQhva78nP0pdvoLPqP
	AY5WAgzSpSqkAtht5gUFZsOa34BU=
X-Gm-Gg: ASbGncsT0iPFF0SIGilAaoQ8u6VxSH8aWd4RyOfoTDvwOddr9V1iUasADzF7BAlwSa2
	P3yyNYYNJGxxwJ2IP5dsbhl5SWjmHl+h0CuZM5SjnmLEAVS0gmzSfKvsCvAfZL4ThZrLpdhVWfM
	JqL0ZOY8A1PYySmrQI3cppEjs=
X-Received: by 2002:a17:90b:2e44:b0:2f9:d9fe:e72e with SMTP id
 98e67ed59e1d1-30151cc2490mt7920217a91.16.1742050543260; Sat, 15 Mar 2025
 07:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk> <Z9CyRHewqfZlmgIo@shell.armlinux.org.uk>
 <Z9ErEBuMMvd6i2n9@kernel.org>
In-Reply-To: <Z9ErEBuMMvd6i2n9@kernel.org>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Sat, 15 Mar 2025 15:55:33 +0100
X-Gm-Features: AQ5f1Jrmv7KQRCuWBIo_vXTI9aIDRsZr_EQ5uQHAURWeudjXpiSlHPWiANvw4jg
Message-ID: <CAAZ8i80e6CsD1Y36-sVrVs4QPB-82J1gPOeDvHa_+sQtfUpMtQ@mail.gmail.com>
Subject: Soekris crypto 1411, where to find ?
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc <linux-parisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_075544_521690_FB0E4055 
X-CRM114-Status: UNSURE (   3.38  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 28 Mar 2025 09:14:08 -0700
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

hi
this is probably not the right place to ask, but I've been searching
eBay and similar places for 2 years and haven't found one yet.
I support older MIPS hardware and need to find a Soekris crypto 1411
miniPCI module or two, to add VPN acceleration.

Anyone have an idea where to buy it?

Soekris company went out of business years ago.

Let me know.
D.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
