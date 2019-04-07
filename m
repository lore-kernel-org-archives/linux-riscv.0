Return-Path: <SRS0=ACrE=SJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF7DC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2019 15:30:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B52A20880
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2019 15:30:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MVZkXvQ1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gHdsQquy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B52A20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+1yAiLW5S58a6T5nCf2nEBUVG9QQ6EuWK33ZCjKSZ0=; b=MVZkXvQ1DWff1q
	eq/0rxmkB1nXJo+bnMcuSozmwfrVN+ZWW6qhrPC6ocIovomDtcEaWrDQoplVUJO1uQAPEOLxjLIXs
	wKxR3pDBa2aywjE8kYvzbu4qNfaWu61y0YSzcE+sBuAKW5cJdT5jdglOX5G55upnJ1wu+kEgxN4fm
	/7n5Gfjoy32Tz0tbXwLAJMPA0CuXHbZsXMPrwgg1ZZ71hzoWL71fgJB6uXdq0xRiKzkeOM9peE+Xa
	gYWjyMEsmJmoijTWyvb871dlsBoAy9jzEbqlWUk2yKSAtvz4uEiw9P/l75L7G66toMKP4Jf1ppg0b
	a6L/aItrE8B3JaGgr+bQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hD9kh-0005CI-2H; Sun, 07 Apr 2019 15:30:35 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hD9kb-00053z-WB
 for linux-riscv@lists.infradead.org; Sun, 07 Apr 2019 15:30:33 +0000
Received: by mail-vs1-xe33.google.com with SMTP id i207so6152273vsd.10
 for <linux-riscv@lists.infradead.org>; Sun, 07 Apr 2019 08:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PSZI9so9txzw27Q6VvTCPwfEKIfctKCk8sNH7E4xcEw=;
 b=gHdsQquyfw8kRxEjh4mbVTeKQHNAtRNaLGV6oqEv4UywfC86br8sbmGV8H9dXJ+g8G
 5/1/R8kd6yB1Xs5CowoGK5dF+sRAhXpcnprW64eloKTON+0H0tvtI4dLbVVwlFSYfDwt
 AMxmkTT/gBrs6XwbB6l6lvOd/FVtMuG+5Eh7LIxQMyLSuer0X1YFMgtvxeLM4dXgOLwF
 uGJ3yNHeYuYuo/Mj1/bPTl9N1AzCjyWfk57vzGjBW7Gk4vwpJT3ZI8s64oVOf0aGeCTl
 HIsrzm4+8grLdqxgTvzy+viBAJB1B8iU2db+kpU2gIc1+da75mGcR2p4ga5nrvejFKrK
 y35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PSZI9so9txzw27Q6VvTCPwfEKIfctKCk8sNH7E4xcEw=;
 b=qtbZvOU1zof+vQyA8WF2Ul4K5307TgjwisYJEf/NBKF852lMkyGbrIGgN719mQEf0M
 zRsbSDVMDIuY3CFspddBzsuAbkkqN9KUqXlJbm5hzP7FAP7fmfnY43vq4WbCepdv6+ue
 3sgpahVp28tbJX/TM0oBUWB4uiDNazG8W+rWkDN2lO0QKViIJO5P44RB6EThopI1gEeY
 8NVqk4H3a+4B6umwOdcFCntJD0XGdY8n8Ny1yWJ0YxL2jXc5UJX3DFVJRqqEX6PtI8Yt
 YZf1I0Jfim+9y55ZROASYBrJROHhp0f4VgnKLq+zDiw4JENf03sIYaZqABPRwg+nBU0Q
 Lzpg==
X-Gm-Message-State: APjAAAVfNmKloxDDPWM59I5qytabBEv0ZguDxMuunTeILmAA3kxg1viv
 jLjjS2fY3j4d63dviF71PVpA1Kv7DaO/OJ8VORuUqg==
X-Google-Smtp-Source: APXvYqxzVyjChgalUWXWUDDRSH7gq75iRnx1iuRqcvbscg5tubOugqm+rx1V8jLc+Li2vvW+LXG+oUN81ZhxpU0ODM0=
X-Received: by 2002:a67:e28d:: with SMTP id g13mr6600398vsf.121.1554651028344; 
 Sun, 07 Apr 2019 08:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-99966160-5466-4cfc-b3d8-48ad48d3dc74@palmer-si-x1c4>
 <CANs6eMn4+6XGaSOGyWoD5RK2DjQo2SUUHphqmL_dwQD-Xu-omQ@mail.gmail.com>
 <c1ea959e9114929b72f5b3d687e70429a3737d25.camel@wdc.com>
In-Reply-To: <c1ea959e9114929b72f5b3d687e70429a3737d25.camel@wdc.com>
From: Jim Wilson <jimw@sifive.com>
Date: Sun, 7 Apr 2019 08:30:17 -0700
Message-ID: <CAFyWVaYEL9neXc_6rA+r-exON6AQRgeoTY2jq6nfgcgP6ukEew@mail.gmail.com>
Subject: Re: [isa-dev] Re: UNIX-Class Platform Specification Working Group
To: Christoph Hellwig <Christoph.Hellwig@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190407_083030_515255_7E3F96F4 
X-CRM114-Status: UNSURE (   6.34  )
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
Cc: "isa-dev@groups.riscv.org" <isa-dev@groups.riscv.org>,
 "palmer@sifive.com" <palmer@sifive.com>, Atish Patra <Atish.Patra@wdc.com>,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>,
 "hw-dev@groups.riscv.org" <hw-dev@groups.riscv.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Apr 7, 2019 at 12:36 AM Christoph Hellwig
<Christoph.Hellwig@wdc.com> wrote:
> So in the past the way to join was through workspace.riscv.org - but
> login in there just returns an internal server error.  Has lists.risc-
> v.org replaced the above infrastructure or is it in addition?

Ignore the server error.  You are actually logged in, and can click on
the groups or projects links to continue to the workspace site.

Jim

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
