Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997E7D3941D
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 12:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lscqkOzm/m9uJazQmakuEgpgx7H8qowGQwdLe5sJwTw=; b=2fVtSnaVk9QEkO
	676ajcgbsUZJ6wDBObJybrmlcuoCo8FPsLxDlIARVRTc2sVOtQjtr7udzZLrKFzC9IbJnnC60lZmI
	uAlyIxvQSLTEp3nlzLFEJ6Yw4mO4VrlTFz/8k7Rm8u52pNjTflAdJUMf5qd1GLg4De4buxh3Dc8Qw
	mNCxruJ8z0Ex97s7k5VyeXKzjZNMaVWkqLqvgzSYPG1Ha6ngS8eN4LjcbRiDeXK54bm2zcLzpaC2L
	5TkDPYUyBRCOjjiSDuDwiWXWXEgcFHY1rczIBUHStnH/SSV5NQXR0/+xRYHZMrIV9kwCALoe4WV6g
	nrUCLN0ZGhNI0AfxBlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HAq-000000003AU-37Dg;
	Thu, 02 Apr 2026 12:29:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HAp-000000003AN-1iCI
	for linux-riscv@bombadil.infradead.org;
	Thu, 02 Apr 2026 12:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vcXn6b67rRj+CqXQSR9AVzCdCSKAtKskjZ3iuSBT3lw=; b=Q9B6zXj9O6qSdV8+VNsRseGsPf
	mWgFkZxYOGGczhsUk5kH2SVpwNOxSQIExeceqSN9XmnCW/8quGo57WooKGXK/868o2uom+DZ8chMH
	YiuDGW9yLJxgSvIQWX27TyRFjVzJCrec0DnF5z8N1sqWkJfLSdA3j8cI/HOkelqGhNt4/9ILKrnr+
	VKOXRy871tQzN/hN1IW3tjrXnkoGTz1+d52tqh6OwQWpYJiUJayQdM2wK282C10Mt/0aiSwAhrTej
	5QncOeAnWYkN7V5cz2teKDh8ukq2Z+vlEihkpfq9GGVrzWdDezLi9k7RXu5eslvjS9VXmyKFjQt9J
	dTiLbYPQ==;
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HAi-00000002ROW-2LWV
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 12:29:22 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8d006a80ccbso105546085a.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 05:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775132954; x=1775737754; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vcXn6b67rRj+CqXQSR9AVzCdCSKAtKskjZ3iuSBT3lw=;
        b=QwyrMmA9gu0H+C7RIJpgog5Ta4cgfCm7lnM9iAQQ50LP9xGy+zZeFBi5S6OCuFkETy
         xOhNJJwEul6O9vSdaLlphQgFD4TAkLlvP5D/UI1YEIvJwuL2AiZyOXoB8Jtq80iIBOHc
         LkbrgugNYoORIC0mp7lTSOsmA8VyK5IjrIMWsImONsfT7QksyMydTAYhsoSynBBKgRfs
         C+AxeImYYZOLvoG/a/q94VWJgEQpJkBfalcGwxwG5j28zRBozo+oLkYsb/Xri0s+irwT
         JlGiDEH3nlrZeN0HSTcDICzaYnlxPBx3lW+qSdtT3dI5wJpWrlfB17Daiq36DHhmSwKC
         2/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132954; x=1775737754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcXn6b67rRj+CqXQSR9AVzCdCSKAtKskjZ3iuSBT3lw=;
        b=QVXNDh5tK9G7JfwsNfgsH92B0E/9HWwm9rZ8VGYh2hpmax1K+LPAg4P9UaHt82v3uH
         d0PKohdyC7z9mts0moqHZC3jIs59SjE5186F1R5BHhF/fXXgqLWjRg9hyZBzHJsMB8Y2
         UH7wm3BZdOCCdNzsqkFeZgtePlg4TxLTG7RzXsjpQB9JG1RKd37by6jAJ7ONivRuPs2D
         ZfF/1E/rMqQGAEoXCqAF4tfKzBwEf+fRZj+UhG6AaG37oV9xYhtvu2/tlc1xZ8/IYh9q
         yMiYHl6+BWkYabQAJYGXSmtiEAS/0SexFWJoS0s7lQViAjg2MoRNhEe7Yy+jvtu7knpv
         GzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqJfCewZspAjD4jNgB0C+vG525GsPXmX87hwAsEtwFytW7SvBqzh19wyZkwKLJKq+IGzxvK6Lqt4FMlw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0i3Y/QsgfsuhZZrns+WVZ5Bxo3GUNKo1UV/toHk5i2KEcFcFT
	uLmppGc9apoOSSEHsL+IsZcDDIRm7d3ck2DmZ8MumJnydnjg7vtAo4G9
X-Gm-Gg: ATEYQzwNB/qJptVL+XXcobQMiAS5/K6pCT5uLW5f/R7MVv/SICSm/I1t4aIF9KhVVxm
	2Ht0cLOpJmcoU4F34kbDlYJIC0/QXrCH22coM2qliMRBsiVLERSVYTTzTLMhesj6y3vGlf/tyZF
	+r58DQrbfOfacV1Zeg6Qfb4iK+Dfeaf4u70u5BG/YADaW2prw7bSN125WdkFG4H+gQ5hESVrlfh
	DLzUID+rtrmJdVIfnXL09hbsz+aXsEBAwkLpFcfeR0xru+cQIOcW+u6X1frodJKq4FDNPgoYgdV
	g26kK/1vBeaZaUuGdN5Yjmqn7fuqgkJtI5vRupPZiwVHxED9ndYY7R7XUB09b7YaIdrjX58b+vV
	I1XznrWpvoQA75kvWtBjNKAD47CBh/M3U2MGBRxZ7CWnlZUTAonAT3LCG009SPx1X/7snm702/7
	hR76WEGfhCnSuVRwb2VKC10hQlJDQ+Ein8tuYGx2FF2VxtXRK4WrRjS1q4
X-Received: by 2002:a05:620a:4802:b0:8cd:b38d:be7a with SMTP id af79cd13be357-8d1b5aac3a6mr1091790485a.4.1775132953851;
        Thu, 02 Apr 2026 05:29:13 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a8647b4esm202845285a.32.2026.04.02.05.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:29:13 -0700 (PDT)
Date: Thu, 2 Apr 2026 08:29:10 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com
Subject: Re: [PATCH v4 0/5] Add initial Milk-V Duo S board support
Message-ID: <ac5hFgLav_4oB2QA@sleek>
References: <20260328173450.219664-1-josh.milas@gmail.com>
 <88400fa8-4545-49eb-af04-d82b94a89757@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88400fa8-4545-49eb-af04-d82b94a89757@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_132916_769602_7F230C94 
X-CRM114-Status: GOOD (  10.86  )
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

Hi Michael,

Thanks for testing this. I am not seeing that issue on my arm64 or riscv side.
I am able to add an IP and do anything I can think of on the arm64 side.

[   96.618687] stmmaceth 4070000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
[   96.633977] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
[   96.676436] dwmac1000: Master AXI performs any burst length
[   96.702852] stmmaceth 4070000.ethernet eth0: No Safety Features support found
[   96.748740] stmmaceth 4070000.ethernet eth0: IEEE 1588-2002 Timestamp supported
[   96.772880] stmmaceth 4070000.ethernet eth0: configuring for phy/internal link mode
[ 1359.377528] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control off

I can do the same on the riscv side but get a unhandled signal for TLS traffic
which I believe is unrelated as it doesn't happen on adding an IP.

I'll send over my configs to see if that helps.

Have a great day,
- Joshua Milas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
