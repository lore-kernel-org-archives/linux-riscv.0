Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCA5C9EC86
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 12:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=virnbHPljD0H8AGrz9sAA4sp37OTBSX3zH0V/vXPd2I=; b=4aWCL6AlEkBCjY
	DeLVOnbx4w8jxxc6N6uk6HOptU7146nvjx/p167SJAK+voEa6zchHNpfZe5IPbBwX1eOr+iQGqtl/
	yXhNckCdkMrDIwdAxjp2vvhWx1CX7sFdJzlIgcGQP0TixwIVjOFGMLDOtOSHPESxGUPjwHrS6uY6x
	F7HkUyvLEzPvZNE940Ap5oxhjFjwtfq+ljgiN6C7DVUSdTF07TWcQsu0cnlV2ePmJPzvHRpKfym+X
	rkJHVlVjOzSVRdcdw1cbFLhUUtKNaxhXGZG14XOO+PdzGkksIVh3MDnZc9EDkSDMJXFfQfMu0uswp
	WLAvQcvVSI/1/kt/94QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHRu-00000005MDv-3Q5H;
	Mon, 12 Jan 2026 12:55:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHRs-00000005MD7-2ycn
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 12:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768222507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rhxkLbdZYuCDIREBJ5aMnl1Pqa4kOCAZc2N2w1wi0pg=;
	b=TNaknWhJL4CAG/bQRtmyuyEJyucrzaKHl5MfFz/T5nV/cXKdUg1JCutR23d6r3/Spr3kRT
	mWV3QlMHuIM8CvD3WDQNG9QJ0cswRxVXV/aZZBJ3zbs/kVKuHxPrvTk6fTGHyf6+7zvkU5
	uxCTyvj2pR0QymHOaOZeAZkXOyfTGmM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-sxus7SeZOLauba7IMpsUbg-1; Mon, 12 Jan 2026 07:54:59 -0500
X-MC-Unique: sxus7SeZOLauba7IMpsUbg-1
X-Mimecast-MFC-AGG-ID: sxus7SeZOLauba7IMpsUbg_1768222498
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b872c88d115so44149166b.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 04:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768222498; x=1768827298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rhxkLbdZYuCDIREBJ5aMnl1Pqa4kOCAZc2N2w1wi0pg=;
        b=nu+TCi4a0TvlBrjZlpf+9KPoaxrILawdid7yCP1OCqaHNkGfM4MMITbM1vaY9W2O0v
         oLAtBtE3XtRBOhi4fD0vqVF9+aWNo1O9rlEQY1kR2iJ0ahAiFvZVNXcOvUjr35mHaCrX
         CCSb/BaAMuNA0MX9OCNq0VtzlpCRjlyX+QNqXj6GDkj/cB8Z03vicFXo3S1JnX1svB2A
         azuqLtJyPmajSjj0cdIV/nH6LsILQypfS98lUE7VlkNFA52uc0sGchRKilAMnQME5NZ5
         FGiR3tZB+7Lqx93/DDOf0WFy4Y7vsnghxQ09GgxqVvJ+jPlZVzEeGUk4ekmRcz0qBMiC
         8o6A==
X-Forwarded-Encrypted: i=1; AJvYcCXYC1Ca46/bFKPIoT3JB6DNZORq5AWJwpw7v2t/jHR+w+0wslULCHwRBdq9C4OZ3m/hEXupYZNZYe/VZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBrWarK+CKhRc8SVM9Injq3/t9PT2a82I9/oDy+EpLzRvNdDZ5
	GZpzWVfyS2in6Oo3wqtv4JhDoE0fUJeD1Mp0k9z8nbEyAguP+KA6Fa8IMe6zdPhzQsNvAKiCLgT
	sncmO9DufA63dEB+AyGq71Y1eIcqjh4ttFTWU12n0kpgeBPcHR6nXT72UuSHoXxkluhsoLQ==
X-Gm-Gg: AY/fxX5cSoLOHvdGrmxBt8mTStgsDqJx+lttWmi0Wg/HcIYRypCpzdO8aqcp0iftt9l
	IUslW5tH+3s3RPfqsdJuIK9CPC+7AIY/rFpqn+phzpvHwK272g086KtYvx24mFn+7/5NRTOjSDJ
	AnJ0F5UsXXNoT4KNHadF1RSJYzj1lk0oPboIyTSMPXQqDi+KdwWj5Huj8v+ybnlJNlT3wnxrz+F
	fTw76E/ePIhPyWFk5KSdL41zmgmxRE68PNw9T+zFOLKPAvZIeqq90d1xI826CXcWEqBHCjg6+o4
	XZK8HtytIz6/34Ni5SI04OPh6YnGpjnSJpDflVWpXQeU74ADlsPtMR2qeAW7f/csf9K19ImiDqe
	tnAraAR+FFwb6PEHJFmo+rLVefVdpR5gUT6JY8QU+1KTphwQVyFi55oHYtXE=
X-Received: by 2002:a17:907:26c7:b0:b73:a2ce:540f with SMTP id a640c23a62f3a-b8444c80f04mr1718743766b.17.1768222498460;
        Mon, 12 Jan 2026 04:54:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPr3dIgVWRsuP91OEnws2gf/Ukq1HmhAKZbz1wMFay2J0zyGKodjzzWjXpSeXa764C1KXgRg==
X-Received: by 2002:a17:907:26c7:b0:b73:a2ce:540f with SMTP id a640c23a62f3a-b8444c80f04mr1718740366b.17.1768222497991;
        Mon, 12 Jan 2026 04:54:57 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8706c2604bsm497062466b.16.2026.01.12.04.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 04:54:57 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	David Ahern <dsahern@kernel.org>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-s390@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [RFC PATCH 5/5] s390/configs: replace deprecated NF_LOG configs by NF_LOG_SYSLOG
Date: Mon, 12 Jan 2026 13:54:31 +0100
Message-ID: <20260112125432.61218-6-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
References: <20260112125432.61218-1-lukas.bulwahn@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uENVFhw81o1av_auPeaR620gjB8xg32-YOz9mHVDsjM_1768222498
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_045508_820358_35287A71 
X-CRM114-Status: GOOD (  13.85  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The config options NF_LOG_{ARP,IPV4,IPV6} are deprecated and they only
exist to ensure that older kernel configurations would enable the
replacement config option NF_LOG_SYSLOG. To step towards eventually
removing the definitions of these deprecated config options from the kernel
tree, update the s390 kernel configurations to set NF_LOG_SYSLOG and drop
the deprecated config options.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/s390/configs/debug_defconfig | 2 +-
 arch/s390/configs/defconfig       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index 4be3a7540909..93721ca340c1 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -176,6 +176,7 @@ CONFIG_NETFILTER=y
 CONFIG_BRIDGE_NETFILTER=m
 CONFIG_NETFILTER_NETLINK_HOOK=m
 CONFIG_NF_CONNTRACK=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_NF_CONNTRACK_SECMARK=y
 CONFIG_NF_CONNTRACK_ZONES=y
 CONFIG_NF_CONNTRACK_PROCFS=y
@@ -327,7 +328,6 @@ CONFIG_IP_VS_FTP=m
 CONFIG_IP_VS_PE_SIP=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index c064e0cacc98..7750f333a1ac 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -167,6 +167,7 @@ CONFIG_NETFILTER=y
 CONFIG_BRIDGE_NETFILTER=m
 CONFIG_NETFILTER_NETLINK_HOOK=m
 CONFIG_NF_CONNTRACK=m
+CONFIG_NF_LOG_SYSLOG=m
 CONFIG_NF_CONNTRACK_SECMARK=y
 CONFIG_NF_CONNTRACK_ZONES=y
 CONFIG_NF_CONNTRACK_PROCFS=y
@@ -318,7 +319,6 @@ CONFIG_IP_VS_FTP=m
 CONFIG_IP_VS_PE_SIP=m
 CONFIG_NFT_FIB_IPV4=m
 CONFIG_NF_TABLES_ARP=y
-CONFIG_NF_LOG_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
