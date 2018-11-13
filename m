Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8884AC43610
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:04:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB8E2243E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I6tRA07f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bBYkVoYU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AB8E2243E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqsSanmUdDB7mmrJpjZaK950WqJlAsboaJdp49YI9k4=; b=I6tRA07feMoTFW
	6rwLKpJSX3HAsUZS1pqqpt04+Qa5J2O10bFyB6m4xD1LcPeCIwn7OaT63Nc+Fg52DuS9rmAOj/laB
	gD50MzAXPyUidlDsgTI81oeFIpuBJCca+Y3fc/3iKutqJJh2392o2g8FynJszi2JJvQFcMnKPs/8S
	LxM4wpldXrE32BPTN4FRBepPzzt70yDt2IdIimjr6/nURZLpqLkEsYBbhN3iaTgIoQtb9IBuqe+7g
	2fQ4sHO2l3W+n3DV/kIFCYuxcNkoAXqRyl81jhTaMgnxqgG61mL9JLyipn7sobx2fLA2kB9hsWTuh
	LY97WNSbMdTE6VmRXulw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMO3f-00068z-Jd; Tue, 13 Nov 2018 02:04:03 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMO3b-0005qf-H0
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 02:04:00 +0000
Received: by mail-pl1-x641.google.com with SMTP id p6-v6so5204108pll.4
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 18:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=j6C7eYKMwxezR19YXqvK92VNNRr0E9JdHBvUwbh35IA=;
 b=bBYkVoYUDtAp6Y66U4BYhcgc+83bly87dtKJMmfVJYGLAB8LMUZSvjOhPhvlF2u8La
 uzPM40fBm5mj22GE1Mjc/s8aEnaGulJmN5I642GTsYcrusQHq71nMqjPewR5WBWusTyO
 +bGAWDyje/cgkuIvnOmiCYV6ivM9/mcKDwYdN/vuVruk6MouzfRcosCRFCDd93SaoFx6
 TBNaF8RfLpbR1KacAGTSTsAM3jfPeLrgOwkWmw9AnXPtaKWK822lLCFN0wgau9hrE6Ev
 geNwE6jQdYNuRm73ibv2w8mK+U73eUs4Oz/bh0QCEdYy0yIJVcQ9KJNG5Oy43wHey+1D
 xoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=j6C7eYKMwxezR19YXqvK92VNNRr0E9JdHBvUwbh35IA=;
 b=DjR8Yt/iDhHkxEF3ZitkQ13kC2Is7HzguCCg6dhb3ytozOMouxQeJztKHpjg2ytPln
 OJAE1JVkOAEWiA6Jst6++ZwLgg8pLG9f1VAXybIZMCSheONOd842/UKKQgdywUvc1bpn
 k14u1BChCltW1Qqy9aDc1hjVZhGICbkczz0Klz7hgkG75X7QKrJSrF7S3spTo98jTV1y
 v0VAeARxNc/GumNzkKCT464J4MYNnvZvOx5ya5JzfGu9flZSGgiSnm/RZVkM+wYb3uRJ
 Sy5bu532GPSFsCsicMc0w0TLFMt3rxLnnIqahm06wlwpYh0py2oVzJVk3kZzVzvjWDrS
 tDqg==
X-Gm-Message-State: AGRZ1gIvrV5s/MrCXasDV98zF3GgXEpbs+dnSFd/gWVohzYxvnnqWk50
 zhaqyuOns6amZyUSR0du5qCfeg==
X-Google-Smtp-Source: AJdET5f+IeCOUgwYtlZJXefJNCayYufuSc+tWahuDcPnWC0vkagfmB4Zozi4VPBeLuKRXlIHmdsRlw==
X-Received: by 2002:a17:902:9886:: with SMTP id
 s6-v6mr3233545plp.55.1542074627796; 
 Mon, 12 Nov 2018 18:03:47 -0800 (PST)
Received: from localhost ([216.9.110.2])
 by smtp.gmail.com with ESMTPSA id m17-v6sm20195855pfi.102.2018.11.12.18.03.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Nov 2018 18:03:47 -0800 (PST)
Subject: [PATCH 6/7] doc: Indicate that parisc supports kprobes-events
Date: Mon, 12 Nov 2018 18:01:12 -0800
Message-Id: <20181113020113.29640-7-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181113020113.29640-1-palmer@sifive.com>
References: <20181113020113.29640-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_180359_569284_4EC74221 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: andrea.parri@amarulasolutions.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>, corbet@lwn.net,
 yamada.masahiro@socionext.com, jhogan@kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 jglisse@redhat.com, linux-doc@vger.kernel.org, dhowells@redhat.com,
 jcmvbkbc@gmail.com, rmk+kernel@armlinux.org.uk, mathieu.desnoyers@efficios.com,
 ren_guo@c-sky.com, david.abdurachmanov@gmail.com,
 linux-riscv@lists.infradead.org, mingo@kernel.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113020112.lK_bYa56_ylUYV6E5MVhZ5enhVHJT5t0_WHcno1WHvw@z>

This was suggested by features-refresh.sh

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/features/perf/kprobes-event/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/perf/kprobes-event/arch-support.txt b/Documentation/features/perf/kprobes-event/arch-support.txt
index d8278bf62b85..86ae33c70475 100644
--- a/Documentation/features/perf/kprobes-event/arch-support.txt
+++ b/Documentation/features/perf/kprobes-event/arch-support.txt
@@ -21,7 +21,7 @@
     |       nds32: |  ok  |
     |       nios2: | TODO |
     |    openrisc: | TODO |
-    |      parisc: | TODO |
+    |      parisc: |  ok  |
     |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: |  ok  |
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
