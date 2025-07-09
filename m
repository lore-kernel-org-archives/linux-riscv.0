Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93435C8303C
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 02:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2yGCwBorS+RU69H3Wm98sRpWSp7S+NZlV8/dvA0yXZk=; b=t1IhnF8hZbrDa7
	p2zNkw+PGHS7kaK5E+8wAqx+GFCjMlc2lchNirgsbOXLoCnndd0gaO0N4+ZUZMGUr9IMd1YBv0Omx
	tTj6waqf9sXHy1vvWoFYXkg1UhN3tQyHs50WW+hvULhrw9C5Sc6srENT7z24Ud41p+wg4VKPYnSQ2
	WGv76+Ys2xnwFza0GOBz2NEboLgjFvcrSM4y8h9aacaSYE9Yfw+RFNdsvTlQXtRPQm+a7bgGEBfa5
	Fa8UDASeRlgcx+KoqXxsz3dcIDtSQZAFmzU6umvZnqVFZYjRRNpb20k+N0SyDsDu27utCBiPBFNxh
	9EjbIgt0Q+f9TO0ZTyPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKz3-00000007Db5-0w3B;
	Wed, 09 Jul 2025 02:56:33 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKz0-00000007Dal-0KPC
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 02:56:31 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7d45b80368dso530098685a.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Jul 2025 19:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1752029789; x=1752634589; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1i/QAIc583IpkMjBijyjcuESsW9rfIE8tQioyhnlVC0=;
        b=jK5ZNbEzYD6qMWNZr16WxN96t1+mny/d/XFOv0ACv/mbojNYmn0JB/HBOTTQm54Bfp
         LZUVjKAUttXCBc96vKoQhzai72Yy5854SfvVSJYyska5YjNAoL+RCcltsBzi3JQMD571
         V7PM1zvGwekixmu3ITMgUXW0O4llVQT3TQt3Q47TWVTvSDQm4R0aejiBO33fTp1KIr6P
         B+QjcGS1nFCW3UyRqelsHjAnDlZ6N/HcFoEY2g0ggyMVOoR7KuVrsvOdgYMrY7YSPAMm
         KJF+BcsIjmj4bMZ/wALNuGG2b+WmtrimcE0Q14kAiBvy2e4kZWqPM8hcXnbLUudRDSuD
         gW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029789; x=1752634589;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1i/QAIc583IpkMjBijyjcuESsW9rfIE8tQioyhnlVC0=;
        b=j686a3NeXY6wsnah20O40sqc6EP+/1xFkwhvapzt3jYU8586Ir4AQ8yce4P7EDG5n0
         OqnZlVhqO2hGHfmZ1snSi3ymafQQjy/u/xh5cq6u75H8r39u8H7vZPjziO3AJyFs+0Id
         JaiJZsw+sNxpGYcGJY/mMsRkA7ysKQluyB4MKFFl2fwkgqouMVafR5zPcbeiGACjG7hf
         Km8MrcJY74fhGP6XBrzIQV3rG7oOFkbaOgidVRxo979dDeWsZ8Qj+l2WOtzosAFmw4y9
         URSY/YnYjqugHWMOLLGowhQtTJTGWrBMFin6GghO6vPdc6TiZcGv8mah9WuYhM9C1ZSj
         nuQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVftfLb95RUSK5FTUVkAS5fKLPZ/e0kOGLxVRK1R0PNCf7MoYndijz4FS37WqPIDVsxSU0wT2vf83FCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGF6ffvWzZ/amZaaztwf8Kt/nu9Ely8c3U5vOQypkM3QltmOFX
	e1rL50VZPp7Ij7Dv1TovDOmc9t0AOTibTHdo6ovSwoOyJi03DIxjNPtVZKuv0SGyMw0=
X-Gm-Gg: ASbGncuJ763Ynv64V2d6gFX3+IyiPGpqO+rcIkQZ9FHyb0UOW5j+9MZHFMmGxFUpqJE
	vhDalyO6gYPZ2Ws3oC8Jd6QeAduruuBVjTXh0pLGrxTxunUzjFwsofREVCc8gP1ljNLuChuZVDl
	0CQvvFO9xU6ou3oHv4/jvDekAHZ0LzLTH3FDDwwsWYPyGKt4DfkvNlJVLbF5oRLZ5mAG/xt185u
	3NhhPqQ80n3k8MJ+TLWEhPE0gg4/JaDC6pZ35XVBUwsNuybxwAmdJWqLNthOOrtlTKTs57J4NnX
	JWmLrWxvVQzSzNiwAm8xVmwja+K8QhXGTVxySQKBVLC/5PWEAPHr4hYnn/EzktBxPBptwz0rsM8
	w4hTwYaPD
X-Google-Smtp-Source: AGHT+IFA0C3qk1/qPUa6d7cEeYkO9kvbWz7A2v9WwUMcz8UG4LK7HBJXktI/qvDuxsbxsIPpu/5bQw==
X-Received: by 2002:a05:620a:171e:b0:7d3:8566:e9ad with SMTP id af79cd13be357-7db7cdb7a75mr171959485a.34.1752029788962;
        Tue, 08 Jul 2025 19:56:28 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbeb2318sm867257585a.107.2025.07.08.19.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:56:28 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 0/2] riscv-imsic/aplic: Save and restore the registers
Date: Wed,  9 Jul 2025 10:55:14 +0800
Message-Id: <20250709025516.28051-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_195630_140185_679DC01B 
X-CRM114-Status: UNSURE (   6.13  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Since the APLIC and IMSIC may be powered down when the CPUs enter a deep
sleep state, it is necessary to implement save and restore functions to
ensure their states are correctly preserved and restored.

Nick Hu (2):
  irqchip/riscv-imsic: Restore the IMSIC register
  irqchip/riscv-aplic: Add save and restore functions

 drivers/irqchip/irq-riscv-aplic-direct.c |  14 ++-
 drivers/irqchip/irq-riscv-aplic-main.c   | 143 +++++++++++++++++++++++
 drivers/irqchip/irq-riscv-aplic-main.h   |  12 ++
 drivers/irqchip/irq-riscv-aplic-msi.c    |   3 +-
 drivers/irqchip/irq-riscv-imsic-early.c  |  40 +++++--
 5 files changed, 203 insertions(+), 9 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
