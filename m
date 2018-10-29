Return-Path: <SRS0=Vdo/=NK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACBEC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 00:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E408E2082D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Oct 2018 00:46:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ncW8JF+s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GQtqpfqO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HGl7x17o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E408E2082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:Subject:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7daOGblY1+xX/6oN8g6T83zRxDuM0vIJtM8McfqLyXE=; b=ncW8JF+szGGz7r
	sxhwZBoNex7MuLoaBYdgpA2JGD1ofmMBoVwoJb3JTu15iC3nGVfeIO0c3glNUG5wrVlV3apNLYMoP
	bF0R1Uh2f+si21bB8U/Ov4qXCrGz51AOBNl8EbK3fXgYlj7RC8ZAqSbuBJFHYjaTwvDPj68Z8HJ3b
	+IHu583vJjSWyrp7+uE+zw9XbE1h8IDAtF6G6jSMPZX+HqlY2oT5HcFEHbXh7B0nbMLo23dDNh4+O
	UXksXc8K1tIpvcuCKDHqtB4flJdeHHSLygcwQVhJxkeLxx45NsHs+ecFY0gk5y+CvE1ht4g0O+In/
	LhIuP5ENWEZe5qu31KCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHIBM-0000w7-4o; Tue, 30 Oct 2018 00:46:56 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHIBK-0000w1-TP
 for linux-riscv@bombadil.infradead.org; Tue, 30 Oct 2018 00:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 Mime-Version:Message-ID:To:From:Subject:Date:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mC/usSubJI5bp2dwHXhgscazdV6kjGBMS0CbnQxrsgs=; b=GQtqpfqOg477hINcLsge9T4Emj
 m5nA1TPb9kSPCJqXVoh5WD6GAgVVIbKVXi1B53tv7t/gMJ+h3V41Fbg7xH0m3jLzBqh5vV8pQfsB7
 TXhVPa4PtBsuU43JjS2/NGtz9bhO5Nt+M1vY2e/fH8Tt6uZDRG/dopizo8zFAjJBcg0rmzvFGct+4
 B1UX3LCdi+WRx0BQQJw9sLKubhKMiWGueJJBWsPYYGHVXbf04iTVKxYnDCYr9Ivsk41Lid1v79rOd
 NpNeCpxq+YuzbRImZwVuGHx179Cj45xxV4sp6OEXqoe3mnBs3FYRulw7IX+DTQBpcksXP1haMlMcw
 W+BEXfvA==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHHOG-0007aG-4L
 for linux-riscv@lists.infradead.org; Mon, 29 Oct 2018 23:56:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id b11-v6so4836435pfi.5
 for <linux-riscv@lists.infradead.org>; Mon, 29 Oct 2018 16:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mC/usSubJI5bp2dwHXhgscazdV6kjGBMS0CbnQxrsgs=;
 b=HGl7x17oBVSZOvSOobiKZtoG5bsnDNYxf7DKmpacG9YnFfFze1znmF3kDo7S2xDxhR
 T7s1Sb/Uf5qS7ELP9kEoyZVlG4ENK03c0y23p2l306jZeSUT5srvMQOF0/cTfdRjFPPW
 dOBHjNN38luzt3I69MfQmiznGqVOwkXKDBxOtrWTkqCx1nJsluYNGGdHFPXBGNZ0Cpsy
 8W8Ncz5+eJTALXcNUTqM4gtAqXB9h+v1kkfaMcfsANLVfNi9yOfUIRpE/VpVragXTHUQ
 5RnRKhZVnaSMZW+aqza/uCPhWS2sHboJbO3hlG+mfdWMMvtU7Cl8dHnctsyILxfL3Ioc
 a0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mC/usSubJI5bp2dwHXhgscazdV6kjGBMS0CbnQxrsgs=;
 b=nm70KCxigchs8lyNkY72pFTvnwf2DE7Mmwv6QJbL6UDimvjnNJmAKTe8Y/iksjn+kl
 +j11X3sWAzmxQbH4BWWKsbOoHr/He6uts2lbLqXkX/MpKWPBl3w+p49XmDsIlbonvhr2
 8lMhkpYwJcqdKQ3vKkyirzC7j9mB7M84FEYeSnDVJj0gNMATtSeCXT/x2orgkLlgxRO1
 kyQwSxObOa5zKFUO6GaN11vnEFVpgyKvhtvNOuCVCTB9EZVGpjy8aGLIlCl4dfH6LDaP
 WBdvh0vcZWAc54QbNfD2Z6X9W+XdsJAiHBajF3FU6TrafoQoYOEU2gIfu2aZrExUO1b8
 u28w==
X-Gm-Message-State: AGRZ1gJd4fRAN+Kb6noFJVU7WiVW7w89r6c1CVSY4JuQ6Af386Yb5lml
 T5Xw5pQcLyWg8M6h/NwH67WtdVOa5HM=
X-Google-Smtp-Source: AJdET5fBUTKAgidR1ObIecRZjcX65La5xQP7WaVS2ao0LRKrjG8HgI2fsQrXB/j9464FYcTKcQx0pg==
X-Received: by 2002:a63:d048:: with SMTP id
 s8-v6mr15622679pgi.311.1540857357579; 
 Mon, 29 Oct 2018 16:55:57 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 134-v6sm36181069pfy.97.2018.10.29.16.55.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Oct 2018 16:55:56 -0700 (PDT)
Date: Mon, 29 Oct 2018 16:55:56 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Oct 2018 16:55:54 PDT (-0700)
Subject: riscv-linux-4.19
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-25d728a4-465f-4f0d-99ac-8d14d6548621@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181029_195612_449557_CA698A68 
X-CRM114-Status: UNSURE (   7.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181029235556.uOHoWUXUWxuLX4Zz7Smeu4jwefi-MGyCWHK5RVl2wdc@z>

I just created riscv-linux-4.19 to collect backports on top of 4.19.  This 
currently contains our first PR for the merge window, I'll add Wednesday's when 
I send it out.  Let's collect backports here and deprecate riscv-linux-4.18.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
