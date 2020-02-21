Return-Path: <SRS0=xk+u=4J=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6929BC11D00
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2020 02:48:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BD2824654
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2020 02:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Djac/37J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MlB7DS0O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BD2824654
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qSX2UQu5IIhqMnlLqXpGYvxqIimPf5Ry/x+uqa3y+Jc=; b=Djac/37JCZPUYD
	vma7uCuNCDKVa6eaCT8vIWZVey3Hzcig+XhwTDGBtco6jJu6Oo6gCfQv2JL+L/gA1e96wLZbw3RhA
	ahARzkilMNfnxmfQOHK/jJXLL4DGcppSbpm8q6JlAwA+/HC//dkmxoTrx4CKZDzA2IUDkSTetqWD8
	yckER7DS5M6ilc09LHccSCNxWpEYBChNLWLysSjIwLT4tsetvCRu7gKISwHcZ7JAYlOYSBULRvrLs
	ky53y50/MCrSMgvr8vWe+viwTLaO2Rv6smxyLvQDYRIu63A25BJ3rA9LgXc++HTUADFDhF/g7HkbZ
	wIIlX+Xr+bfWnkr+1oIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4yMV-00068w-6c; Fri, 21 Feb 2020 02:48:19 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4yMS-00068N-9g
 for linux-riscv@lists.infradead.org; Fri, 21 Feb 2020 02:48:17 +0000
Received: by mail-pj1-x1041.google.com with SMTP id m13so87032pjb.2
 for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2020 18:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qSX2UQu5IIhqMnlLqXpGYvxqIimPf5Ry/x+uqa3y+Jc=;
 b=MlB7DS0OMKms2cMMv3cMMV2YROR1Xm/OhKtpxaoecilkrWlLmYbVRRGe8freMcA59/
 u1JVUP4BQnFjPpJkasHLEuqbSMmXZb8/9dEOBgasMGOjMRhMix1EVG5K4BhVnAmy/CTx
 Dk8phtV0UTw9g3yUq5SMxDFbd5AXyYAqZ5dca1tuvtjH2CX+xUfvClhXlEJTRonelbPM
 HOhz2W322Jfm8MV9SQWWgd4SOLUSInmo8sf1FMMmlzMhecuQscnrgVAhmE9fsGA4Ap6y
 lk8yihWpRLrCyH8aAfPBpCKWh3dayruNgApaHeCD0qzEDv+9UfKV/WADtdL+Xx99F+wD
 qZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qSX2UQu5IIhqMnlLqXpGYvxqIimPf5Ry/x+uqa3y+Jc=;
 b=WGbGA9ve0KNRX8s2mP+zpXvMg9TY1UFX7c9R1TlU2qVNHCWCalGh2RmV0LDssgoIMK
 GofoNAQutq6ANzkYFqB9sCaLi9P+wubHS5U8tvzVlIzLd7LTZOlUhyH3zMOqf89wM1fb
 MAd9Kuvqzx2r4tYmFUIW9zvtWny7M0Sk4rq2QJOhG7AD9i63mj8EYcYkwbQCtMUgOxS/
 oOKBY30YNM8mg3SS7Sk+E14Z70ux4tmH6Nqfu0x2pZCoGzG0/OOUMMWFcFGdEOLBuq85
 Fiu0ZIAmhJCvxNKLWh4uPs9hluFkd8MjfAdMkRtxitXpY2Yc2wV0BEH+lL9XNlXiRaao
 2i9w==
X-Gm-Message-State: APjAAAVJxz69r8PA5ZpvoEV6HZ+sTcisUUe/6AHRw/hdK7227vyvhMOG
 PTpeobBDHlW61NldJOH1obF278f/475G2Q==
X-Google-Smtp-Source: APXvYqyWZRmaSzd4oe2BIZ8IWN9MjeQCE9nXqWiFqtH/nVo5BWBMD+KDbaKl0ebM/QGwsWh5vgtifg==
X-Received: by 2002:a17:90a:f492:: with SMTP id
 bx18mr340292pjb.118.1582253295329; 
 Thu, 20 Feb 2020 18:48:15 -0800 (PST)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id 28sm618810pgl.42.2020.02.20.18.48.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Feb 2020 18:48:14 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com
Subject: [PATCH 0/2] solve static percpu symbol issue in module and refine
 code model of module
Date: Fri, 21 Feb 2020 10:47:53 +0800
Message-Id: <1582253275-28181-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_184816_370670_8285C762 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: Vincent Chen <vincent.chen@sifive.com>, linux-riscv@lists.infradead.org,
 deanbo422@gmail.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The compiler uses the PIC-relative method to access static variables
instead of GOT when the code model is PIC. Therefore, the limitation of
the access range from the instruction to the symbol address is +-2GB.
Under this circumstance, the kernel cannot load a kernel module if this
module has static per-CPU symbols declared by DEFINE_PER_CPU(). The reason
is that kernel relocates the .data..percpu section of the kernel module to
the end of kernel's .data..percpu. Hence, the distance between the per-CPU
symbols and the instruction will exceed the 2GB limits. To solve this
problem, the kernel should place the loaded module in the memory area
[&_end-2G, VMALLOC_END].

Because the loaded module locates in the region [＆_end-2G，VMALLOC_END]
at runtime, the distance from the module start to the end of the kernel
image does not exceed 2GB. Hence, the second patch changes the code model
of the kernel module from PIC to medany to improve the performance of data
access.

Changes from v1->v2
1. Unify the definition of VMALLOC_MODULE_START
2. Modify the indent  

Vincent Chen (2):
  riscv: avoid the PIC offset of static percpu data in module beyond 2G
    limits
  riscv: Replace PIC with medany to improve data accessing in module

 arch/riscv/Makefile        |  6 ++++--
 arch/riscv/kernel/module.c | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.7.4


