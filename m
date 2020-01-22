Return-Path: <SRS0=iMHb=3L=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208DCC32771
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2020 23:46:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0EBD21835
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2020 23:46:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ae157zDq";
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZVCwpEl/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0EBD21835
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:Subject:From:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+D2p0Wm9U7BIJopf5V09DNgijK43wVtC5id58Byk26g=; b=ae157zDqyC5YTgVaiuscnur9Gq
	gS2AGs0D/54x9t6cRR+EymA3iPnOK5K5xbFY6m/Zprg9Luc6PBu3v2hbuOLWnVo1ja6m47susERPB
	MVw5o4V1QrFmoXU3VpKpvPgBRSNQSC00d4YXpfH1++msQ+cB5Wq5sdxRdc8VIRDan7zTFRAjNDpfO
	IUVgXIKnSYSm736frmhysO5gt41/rOpJkgEFqQaVy3SVB1qQR85FD7hevedq5+t49ch5P3xSjCM+4
	9VvVh6JLJGUl1LRBre+aGSnvdTg7H1+kV7EKIZzP7dCBKhdkKbfTXmOzOYNiNsUbspPkDA+4wy7Sj
	6AkzLkvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuPhS-0006aV-0M; Wed, 22 Jan 2020 23:46:18 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuPhP-0006Zt-9N
 for linux-riscv@lists.infradead.org; Wed, 22 Jan 2020 23:46:16 +0000
Received: by mail-pl1-x643.google.com with SMTP id ay11so514566plb.0
 for <linux-riscv@lists.infradead.org>; Wed, 22 Jan 2020 15:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+D2p0Wm9U7BIJopf5V09DNgijK43wVtC5id58Byk26g=;
 b=ZVCwpEl/eZOE+RIHkmo5HKKs/0+/CooyHDWfIkiGgH5gqbZ4LEnKItDhLbqYP2ag4V
 pOv63H3PT/6jyhgwyC1LG+Qm7fEXkoDLwV8YIkljPb4ghwyCg7ff2n+8iaHQQWebUBS3
 CBkj8dyAqC80USJN/cJMeV2pPIa+Vh1FYzIsXy1gBJ1sRVWLKhN5vbkmanz3CQns5fv+
 PlPIfv8i1czya9w+3d4/tfGgObk4lgI74tvcWIWaQvKQhm7NoOUVtI7SnVsoeDxjHhKd
 KJBBqmOmSL8owXOFOKNQwJS2+OkLxovn7M3y9xyCeCvlZ/J6RWumNrEaM/r7/eT7obIb
 Ndig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+D2p0Wm9U7BIJopf5V09DNgijK43wVtC5id58Byk26g=;
 b=BSJt1m6R318JVw1uV+a7fwtE/jL5vVNdwjnyBQ4ET8eCFNItashuwr5QI/ohbnv+9M
 DOD60dTg9k3ZbEe32QuapUt9tV1R1WKA6X8cgolcusFX4rmeriEPaLaDRPeh9pmcKyHb
 snbvQknh2mLw0GkH4KV3WBbRXFtq8SzU8Or+u+ShG/Xnuss03eB7RyqnKqZ7g1Qf5dRZ
 /TcmLEOljYl8jmWVglkgL7KOfdAo9liDRikqp2lVpfKXxC5GS90fuKq1CTLpIxfbfhU6
 HdjOnnQW/MBhe+xI2Dx3/x/9pEpNeSxt/Avy2ZbFDPYfAXsEnxkAUmPe5p3P4VA+Mkip
 J08Q==
X-Gm-Message-State: APjAAAXzDprnWO7gUWOX39gPASgTmRgzBVsLlslyIcQqihu/jd/IQA0M
 Idc53l0dBjcXuKabJJqLCd1eF2zN8gY=
X-Google-Smtp-Source: APXvYqwo4dgbtolPHqAnvh0oD3Awicu3rd2KJfEqg9hLtDQi0Veip4q+kCNZtKGC+ZkiY9vdeZuxLA==
X-Received: by 2002:a17:902:b28b:: with SMTP id
 u11mr3058028plr.54.1579736772428; 
 Wed, 22 Jan 2020 15:46:12 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id j17sm60238pfa.28.2020.01.22.15.46.11
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 15:46:11 -0800 (PST)
Date: Wed, 22 Jan 2020 15:46:11 -0800 (PST)
X-Google-Original-Date: Wed, 22 Jan 2020 15:46:09 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: linux-next and patchwork
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-1a26ba3c-8fb6-4c6b-9243-871caa5292b1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_154615_351805_6EBD3252 
X-CRM114-Status: UNSURE (   6.20  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

There were some conflicts, so I just rebased for-next on top of 5.5-rc7.  This
is what I intend to submit for the first merge window, modulo any issues I've
missed (I'm about two weeks behind on email).

I also decided to take a shot at using the patchwork instance we've had set up
for a year or two now on kernel.org.  I archived everything older than Jan 1,
2020 (which happened to be the oldest patch in my inbox at the time) and am
keeping it in sync with patches as I merge them in.

