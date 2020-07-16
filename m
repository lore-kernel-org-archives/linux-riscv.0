Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9108C433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 07:11:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 941162070E
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 07:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QSfIeoKC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEj2e0uQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 941162070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sODQUUC70MuPaCdbZOcDVPZ3qmt9oyPssi3UrXoDIGI=; b=QSfIeoKClxQp2C4mqnXQDrEQ5
	KfxUNhLmaMKOC2hzZkBR4/Un607XpKwYr8WkRC+shdJQnE6K2Pc5WR2wEhRhY2wbK3Mt+FGUQCbpZ
	ie0BkqkDP7MdItroivJKpyNdmKdWfTnh41mFb8GSzl4MSHYr3qTkjiKURX+8VhvCv+BFK2tTSjj86
	4h1nChxEw1xTMUcZ9kY5+71hU3TCbOvXbGAtsAltPZGaM6V+Ae2Am8XTYphl27+j9fG/8nUo8v2BH
	lHTbZaDvUZB7iUj4cH3EA6ANlmRmjIG5nVN6R8wAuK9aqu7TUH3OImkyc85CLlnXr2TBojFclsUEw
	DFClGCmtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvy3P-0005Ql-ME; Thu, 16 Jul 2020 07:11:39 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvy3N-0005PZ-LU
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 07:11:38 +0000
Received: by mail-qk1-x743.google.com with SMTP id e11so4627427qkm.3
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ROegDUCMbOPfiff8onpiuWKK5fP10rADXj2kAfYPzfQ=;
 b=WEj2e0uQM4cpTKdNW6Ykzaysy8NWbkSWNfV3nrn9b1/DU3PMRlKvRw9V19Eg6XYY8E
 4+SIqkC9nrqOu5AewYhI4mZvhprvHr6mCEH3bGIHPKOyxlyxMvHOnhaB29Q5GfJHdbxV
 uhBlmmnkgmXh1E29XP6vc3moJtZqN/6MN3WRDgVlLIgeVrfrIM/6DRRzKvSBU3sZqGrj
 awp9EUEhTUj6nZiydt8op1sPqXMDaQ6YTqmLTkWp5uLVLT+ndS842EH8A/tq2BlLRaqV
 OWoqpafaG5W8rWEgMUhVvcsOezi58fBot+W3fSwQ4jnhJUqkf0Q9SjodQFwzwzTX36/e
 RTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ROegDUCMbOPfiff8onpiuWKK5fP10rADXj2kAfYPzfQ=;
 b=P97l//S1WYI10i3AmXHBikAOqmDVUH0tCeTBRfgWmLyceenlXonogCQZq9ZarCkF4h
 WL2l4iau+k21aIAaD2Nrj+xVbvzfiWZVGXqKjp28e2BJU/1W7VPuFqO4xz5xhfIIctaR
 oECzixvxzkO7jzB9nY3Hss5f207EBQ7rSrfopDAzqS122gOhTmMs3AMxK6FPliHLbcMB
 jRsTF9QvoqT6KQZB+flT49Gksw7UV6OyS+TRs+BHMC0K8k6kb5gphh/Qh0sl25W+A1OH
 6vlXAZBPcH/xnbirgPY+ajGnP+ACdAH54or/YQcJpKnpGFPVg4av45Km3+Nx/3Eoq/sy
 UWmA==
X-Gm-Message-State: AOAM530XPXBfzgmpODDEpJvqOdD1aKDOmbb6hTMuXXuUKu3UI0xqokWy
 cnTn425IbXYNh/ZqSmvDOMbycz6Ia+foNvLAbCY=
X-Google-Smtp-Source: ABdhPJzNnTtaVx8wrGIAFkZ+oAraxxEDPT2R5W7Xl+2T3Ftueo/ACrghB96323WzQA3uLoqKR/x5XaK8kB74IPIEXsk=
X-Received: by 2002:ae9:f803:: with SMTP id x3mr2510007qkh.488.1594883494596; 
 Thu, 16 Jul 2020 00:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594880014.git.zong.li@sifive.com>
 <28365b581b04d0237e127363a63c1ad72dbea683.1594880014.git.zong.li@sifive.com>
In-Reply-To: <28365b581b04d0237e127363a63c1ad72dbea683.1594880014.git.zong.li@sifive.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Thu, 16 Jul 2020 10:11:18 +0300
Message-ID: <CAOJsxLGHNd1DcStOALkQkcg8u25zj8Hpf0uF1kMj+uO127q+yQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: fix build warning of mm/pageattr
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_031137_724890_877279BE 
X-CRM114-Status: UNSURE (   6.02  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, LKML <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 9:16 AM Zong Li <zong.li@sifive.com> wrote:
>
> Add hearder for missing prototype. Also, static keyword should be at
> beginning of declaration.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>

Which prototype is missing?

- Pekka

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
