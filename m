Return-Path: <SRS0=tx4i=TX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE62C282DD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 20:14:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7D0420881
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 20:14:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rtoJUUNX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UyRxKupv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7D0420881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=BetqEQFjc16dIzZrL7oX5EooTYEBZ4BXhB6j6eb08eY=; b=rto
	JUUNXL45uiDyxns8SHOav5Gj6myD+l0R+FYzVm4fTAdVEzTp0vpIow0jmbRUeSearqczQxWOeWqS/
	ZpbeRAKzpBkoEQaTdGxAIoV//5QUa/7VmCiyVkvLP8rt+ARLr7oWNiEp0Y+lxcaFH/Zkwcu3g0FXj
	xwzagb+me1zNp5OPzYRd0W45JER0ZVMjRvYLGRZfiHgH3jehqt9nGRvMj6Vub8vMNKdVbbSyeM84b
	jX4WuAAzTyS2mi27byx/Yd1JYpi6UQcB9kVDl0yFdkrdeJmMkJQNB48TzQPzqCyYs2ArklUPI+niz
	GJ9EoBHPb6NMl6kNHtPII2Dggr79bdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTu6z-000676-EW; Thu, 23 May 2019 20:14:49 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTu6w-00066B-CT
 for linux-riscv@lists.infradead.org; Thu, 23 May 2019 20:14:47 +0000
Received: by mail-pg1-x52f.google.com with SMTP id h2so643273pgg.1
 for <linux-riscv@lists.infradead.org>; Thu, 23 May 2019 13:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=tZPNt+rLtUBdYZbp+GReAQDN4uohyDhwin9i7fqNR7M=;
 b=UyRxKupvpchv4zUcVTIPwRGpdH+S9gd/1KPfrt85pLEA2muykirPLiTshBFtrZPhpX
 ZNqkJL0sw3Zg6Df5LaOGlwVR64QpchLLcWy/qn+Hx7jyD2lLM13cmRMVzWBrSn1r4Xls
 W1+OlWofLQN3kwd2SlvoKBPOctI5eKRDkyP/zfCR/N64ApQ7yg9jy26CSLtpHGlyVzpv
 oVx0FLxaqMayfkEXnCfNU+h0+QGWjAGFNnN6Mxpm+uiG8fhwLVrdQHDd6wtUmp6ef5Iq
 XGMmnQGmqD9/uut2xzqjkWdYco4zsLgA66rogAMuNCKB3JlYWt/yVT8qnmYJgh9+PNEh
 I0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tZPNt+rLtUBdYZbp+GReAQDN4uohyDhwin9i7fqNR7M=;
 b=CmHrR4aUAKhuBqDQ1Y0nip0oUy/cud8POxSa6lUZ8GUSj8TN+6MyIaAVXp+AJ6aHPV
 uY9jkeM43tMybVqlYYr5pocrzjdR9rUQhiDrtc+f5w3ODxwCEiS1tPzmnCc3KkOPHugW
 PMnZUZeBET+vV7pwXuHp0/CCOI9NWJXhyNj/VemUEG6tXS2YnhjrbPZAb3WTHzIJqJa/
 0raZ8Lat46ciEMFZkN5k8P3vdQEzHRWcwy8gHX2i8hTY4RAPVbsJ9kbsQ0J4MaxNquS+
 pC6MbfgaDWsk/jTbkjoKhil7AuhIuFIlrwKMrzrdOopjpvoJWI1ptjWXOUpu78h56HCC
 ESDg==
X-Gm-Message-State: APjAAAW1ZKDEYPiYIkNJhK31IRjKeaeKCneTqGsS/uPZ/Kgtj0l9RtaY
 OTXOk2Tbnw+xTNdPla+6NWkHxQ==
X-Google-Smtp-Source: APXvYqxdEMuHsSvTD33i4R7P8PwKnLNgtSRQ3qW5XaTRqxwwtBXhqKfM5bY739i1ywptuOGdBFXUgA==
X-Received: by 2002:a63:1820:: with SMTP id y32mr98313150pgl.287.1558642483635; 
 Thu, 23 May 2019 13:14:43 -0700 (PDT)
Received: from nuc7.sifive.com ([12.206.222.2])
 by smtp.gmail.com with ESMTPSA id i12sm180839pgb.61.2019.05.23.13.14.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 23 May 2019 13:14:42 -0700 (PDT)
From: Alan Mikhak <alan.mikhak@sifive.com>
X-Google-Original-From: Alan Mikhak < alan.mikhak@sifive.com >
To: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 lorenzo.pieralisi@arm.com, linux-riscv@lists.infradead.org,
 palmer@sifive.com, paul.walmsley@sifive.com
Subject: [PATCH 0/2] tools: PCI: Fix broken pcitest compilation
Date: Thu, 23 May 2019 13:14:22 -0700
Message-Id: <1558642464-9946-1-git-send-email-alan.mikhak@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_131446_486214_49869DA3 
X-CRM114-Status: UNSURE (   6.46  )
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
Cc: Alan Mikhak <alan.mikhak@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Alan Mikhak <alan.mikhak@sifive.com>

This patchset fixes a compiler error and two warnings that resulted in a
broken compilation of pcitest.

 tools/pci/pcitest.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
