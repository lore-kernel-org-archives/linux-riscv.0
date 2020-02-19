Return-Path: <SRS0=GYez=4H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4014AC34022
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2020 07:28:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 130772176D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2020 07:28:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tZicMHZM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DMfJ71H6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 130772176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MrarYAMqza+J0QKKe8PvPEfyTGD94a68EnzHuCXh0SA=; b=tZicMHZMGSz8sO
	QG9FHDQ5HiYUpLbJ9xTTIv0exdkbqBMk7+v157k9fMVvQENsysSjkprqfwfwSipZbwA92hPG8ntty
	HxopznLrbTJiXqXHZhh3ElyL4C4YXtn+5c8ImIZBrbxQ8Q/6gx4dMbt3hNVJszuMUmSUmoq25g/M7
	d0pPzOvFsPTQXPtE9OgndIG80/sspHrPBaXM7ikcE928ozeZUrJUGvrDX9m+SqfVgYiOewQypRlHd
	hcrduAmQ/RX9JSN9eMJl3Qya48wdmPJdGk6vjc0hHT66cSlk5WkD9lPTeLJxqlWJzKXxRXq+qClRE
	IEyif1exEgbclbYoj32Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Jmo-0005It-7H; Wed, 19 Feb 2020 07:28:46 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Jmk-0005IF-9k
 for linux-riscv@lists.infradead.org; Wed, 19 Feb 2020 07:28:43 +0000
Received: by mail-pl1-x644.google.com with SMTP id c23so9200035plz.4
 for <linux-riscv@lists.infradead.org>; Tue, 18 Feb 2020 23:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MrarYAMqza+J0QKKe8PvPEfyTGD94a68EnzHuCXh0SA=;
 b=DMfJ71H6gQlGthl9/LDH5Rr+fe+L2NSjH6WPIRpW2n+9UJ0xKS9nFAfgav1qJlriNA
 z85HpIAiF+LHKFFvjDgkcKYzTml8wG9CnJu26gxNmYWDDowckPwhMuQL+O49dKi6tC/N
 D9RZtuAgrKPGrAgRn/4RV0Y8VwSd1UHI6yr4LGhDgnREKN1ik6Jb23ZmoGYyqqBorliW
 0/iMqCezAAj/io9VbZBZn8hDGg7GMLSF2Wt43IQ8oapE3WeyvCWXkQ7McisjaJREQ8U4
 kiTv7maCTdKLPtocH8dcfDU+3dpNOCaa3VHZbF5xWMiykmGJF6dwE9mRULvHMUInFHRQ
 4WZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MrarYAMqza+J0QKKe8PvPEfyTGD94a68EnzHuCXh0SA=;
 b=nKhrcu5AySRytRqv1w50RerBVLgOC6DSjPjEwXZSRljTCaYGyhErqtQkHaBe5RSeEz
 sj79AuquYbfixMDoIkVhInCwjYsv5Bgyr7CrWzMV2+sK1j4HopSUMbiPXLDwBP9+jCcc
 SS8BbZHwRAw4JvI6KTQ2B1bjdf2ilRcSpGCVN4hpzT+J/VqYNxrcaIjHEahkA3DkgkvW
 Rd/ebPL+t6lYZKlRgfYQ+GzHi+44hRqlAziUgHyN9JJa5OkPCVoIGgz8cBOtA146hna9
 OmNCeplwcoklbvSyk3KaiV4u1SdeE3egh+sKpsOwNdlUE91I1H2x96ctC+/5ThAGN2Hx
 9Lmg==
X-Gm-Message-State: APjAAAVDFsnbKkOqOGUfdFl2iiJJFGEgayMOJcsWiY8qIFAesGZl/mQ8
 vr1DmZbP3hVbbFSeLG6aoZF7og==
X-Google-Smtp-Source: APXvYqyhuIrs8PAcFa6AmoPnbH8cagTPCxSiJSIT8ewOnLAleAIOFBFZdq5IKilUcmwBoUc9tA8oDg==
X-Received: by 2002:a17:902:467:: with SMTP id
 94mr25475050ple.267.1582097318121; 
 Tue, 18 Feb 2020 23:28:38 -0800 (PST)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id c188sm1500699pfb.151.2020.02.18.23.28.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 18 Feb 2020 23:28:37 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com
Subject: [PATCH 0/2] solve static percpu symbol issue in module and refine
 code model of module
Date: Wed, 19 Feb 2020 15:28:22 +0800
Message-Id: <1582097304-5547-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_232842_372120_52A0BE90 
X-CRM114-Status: GOOD (  11.42  )
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

Becuase the loaded module locates in the region [＆_end-2G，VMALLOC_END] at
runtime, the distance from the module start to the end of the kernel
image does not exceed 2GB. Hence, the second patch changes the code model
of the kernel module from PIC to medany to improve the performance of data
access.

Vincent Chen (2):
  riscv: avoid the PIC offset of static percpu data in module beyond 2G
    limits
  riscv: Replace PIC with medany to improve data accessing in module

 arch/riscv/Makefile        |  6 ++++--
 arch/riscv/kernel/module.c | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.7.4


