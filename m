Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7937DC43610
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:03:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4925D2243E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 02:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CWaoMXEQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XuGcgN50"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4925D2243E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KMJ8S62PlMVgTgBdfsqoWoebvCjO6GlnqMw3V5gPqHc=; b=CWaoMXEQHGWCf7
	fz/XEm+BNYUVaDO4axofjrnoZJXej+AboTOOWtoeCL4h5dT023kbVBY78hub4eAHOOO7FiHd7H8LK
	1THSzZa+6SFcdmqrOFMyB+BpB3sFkKMSDag0sznhfaYl4HMXQgClxXD5HCNpoynpuROKsAZZZKy+H
	x0VruipcGdW3c3zVv6Zi2Fe6FjUiGnPWfZ3VkkwglTCPxejz1Mm+kLPWBXSkx6tysbpyi0l0aeRkl
	YsHKiiFsB5eRruX/nQ8foH8QKrr9gyL2ZG30tvyBTT1i4sTnxxKL3MRId5Z3yppRuazvhFudGoSV3
	dKMIUboOlr6wI/YX+7lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMO3W-0005xo-SV; Tue, 13 Nov 2018 02:03:54 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMO3T-0005pk-5O
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 02:03:53 +0000
Received: by mail-pg1-x541.google.com with SMTP id d72so1466664pga.9
 for <linux-riscv@lists.infradead.org>; Mon, 12 Nov 2018 18:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:cc:from:to;
 bh=JM+S/eFsNskgo7atW/iBIZzDQR4tvlY1/M1nNBefE3A=;
 b=XuGcgN502rs9GsiYN10cXgrgKSex88J3/+pPISvc+m2TdFHfUDOnNFsNs6ZBGtV5qL
 Jj+0p0S1FE8+mMwy0k4BGzRJLNVOOJlEhMSVzRlhWNCaSGK4smyRQnUPoE7TOMT0UnIr
 1AwlGVZfM5qGDJ1jKKrAzTdaNhcvjf4TqrAFg0ScnkT5CjUBihY1i1D4eHc3FCYzjicL
 nGZKQnRH5kLKqz9tOnVTsI7o4QZSHHfSglDhfCzVdRIqPACRLORn1tvhJQlF34l/t+Ag
 c5jb7J0r1BHpXWgZzsrO0iL1cQc/Q4SWgDDdPMGXrnyVBcTLMpPV2aL+Qt+WchCqmG/E
 471w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :cc:from:to;
 bh=JM+S/eFsNskgo7atW/iBIZzDQR4tvlY1/M1nNBefE3A=;
 b=ZkLVNp1Bky3RH6Q7dfw+P1JslaVz7jsu2L/nArA5LpehYahvK4DBB0bqTNVgSQQrGw
 sIXrpRouYf2I12B+gsOoScWzESosKcnTfTxx14iPPGlD9q6F0O5zkY5lqLOL6FBPj0WX
 qHviG4YM0w00+R23rDEClii9XAGOwD2hgy+XMn6ZTBgxunXCOL9PoNDijJEl35LTHRZd
 0i3M/M3MnjyN+DqLOQh6rfku3HRouV0mY1wNKJgLg9mZv/Fc98m3KYo4vN1/G6NaDhvw
 scStjN8VDgh5B4lKl7cnx9E6AYo1al6r7O4Xigh0eqRtpWZ2eEQY57cUzlgbjwYZnPvq
 slOg==
X-Gm-Message-State: AGRZ1gLBVIhsb80Ll2Ve2JDVDAggpMR2ztCygkqqVwqBURHugfgEiWRV
 lJtvHiZXHLSpl0ONcBJGvMslXg==
X-Google-Smtp-Source: AJdET5e5F9BMkGMJpsPyH9pjxG2eOrIWxjz1Z71qqgOUywCdnDfywSML5a9VGIZ5Wm3QckGBAzfIlA==
X-Received: by 2002:a63:31d0:: with SMTP id x199mr2982886pgx.10.1542074624095; 
 Mon, 12 Nov 2018 18:03:44 -0800 (PST)
Received: from localhost ([216.9.110.4])
 by smtp.gmail.com with ESMTPSA id d65-v6sm24529216pfc.144.2018.11.12.18.03.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Nov 2018 18:03:43 -0800 (PST)
Subject: [PATCH 4/7] doc: Indicate that xtensa supports sg-chain
Date: Mon, 12 Nov 2018 18:01:10 -0800
Message-Id: <20181113020113.29640-5-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181113020113.29640-1-palmer@sifive.com>
References: <20181113020113.29640-1-palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181112_180351_202180_A84B3CE7 
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
Message-ID: <20181113020110.mps_uhSlb2Sk1X6amJnc-KhQH76WdUAlBzQ7E8CGhgg@z>

This was suggested by features-refresh.sh

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/features/io/sg-chain/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/io/sg-chain/arch-support.txt b/Documentation/features/io/sg-chain/arch-support.txt
index eac96f99174f..3c85efb8bc8d 100644
--- a/Documentation/features/io/sg-chain/arch-support.txt
+++ b/Documentation/features/io/sg-chain/arch-support.txt
@@ -30,5 +30,5 @@
     |          um: | TODO |
     |   unicore32: | TODO |
     |         x86: |  ok  |
-    |      xtensa: | TODO |
+    |      xtensa: |  ok  |
     -----------------------
-- 
2.18.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
