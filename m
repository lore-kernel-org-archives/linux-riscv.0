Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C18C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 08:50:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E559720775
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 08:49:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x5DBHIni";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohW2o1jF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E559720775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MqXIVsdKMMD5h5kyDZNm5fLwoNfsiHBWICriBDUwJY4=; b=x5DBHIniS3g/E0sm8ho1R4YQA
	Q+riQgZFuklk3pD+/+FUi5GZ4fi4whhxPpYWlyeeTsf+Z4lteo4vpvGv0u1DQiFx1ROBWgr9lG7wY
	cS4PYoAX+QMOZnEE6/2hZ548JjWMXvTSfSzpACVA9bbH1mUYendFwdMKyUEw+NfiPKFibLHhnxC+7
	hz5Ov95HL3fKNPLeY3rjnwBvAUcT/AWMwrdfFA6NXgFZJ1ZPEcdvtkzDhJ078T/6WNjCjpPI8Uokh
	AZAjOa/ArpjgqVBr3zjnQ0ZZu5IdQxiFrrk9bbrjyusv20aJUSigSGcMlejLZS8CmDjr5Uy/WI3u+
	1PQsojEbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvzaT-0001QD-Lw; Thu, 16 Jul 2020 08:49:53 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvzaR-0001Pg-Pv
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 08:49:52 +0000
Received: by mail-yb1-xb43.google.com with SMTP id l19so2508460ybl.1
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 01:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WPztnUdqm52UibztW9R9dnkjNsKL7m+g8nfhypM29Tk=;
 b=ohW2o1jFhFxvXdhGmL36iuEuOG6xGhI/rBWI0I/D1UxkSCgKFbhmm3TI5R8p6Ypxzm
 uuePEQYVlgd5rh1w3Xz2NKB56cmWfUyfsq8nrW+CkuCIcjFp1h26hFPO5SAAFgjxnPeS
 p+T7NZslKngOQyQHFm82g+GKmVmmbfAzoMS+OmUYJXjPlkO3YbtUKgddFHPIzpxLXUVJ
 JSLO4qs9gI32/dc/d39/0dZkn3O9GY+uuvs5PMOg7l5NDvSXkP2Lu4EQl8hBvzKDgJzd
 WuI+4HAb4tuRFA6T/NClbYx6Iv4mtCIQDlT9/I3kV17sttm2WsnnhvH0rV6Blnl90r+y
 /EsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WPztnUdqm52UibztW9R9dnkjNsKL7m+g8nfhypM29Tk=;
 b=Wsmq0rUs4qLnmzzb7SdKAPYG42DWzWsvtRHhfMU5hRpq1oJNe2OiuPsGTmqY767/23
 2UADRuyMCZe6jsKbjyZpO0mzsyvPK/DJYPdBfskiIlG+3ARfdrzMH0cgF5reTaUtn1jD
 3UnOmRLOztrhraPtqMqIgF1Tn25JbNbBmU61BfIIakT3q0Xw8akwVnqKgaw5QzPDrsax
 qd1cCV3IFMTnd2WD/6DLdqeB1Yrywnd9DixQTMq/5tsOMbXBGXsFU9axvYuqAHBI8PPq
 A69Mzc4PYc0aNfnxBhQEP+7nLSPi5JtJT7iFKfQ8kefPL7rSXCxw892FR4O/+wJvC/gG
 li1g==
X-Gm-Message-State: AOAM533lhuOBj2JFAXp7eRPYKsTjNWykKsPEvn7eoFxpRLgAVWkL0hVF
 Fdj7/ZaNLo7lKuQr5Etgv9HV4LdLWrCjLzv5k92W2A==
X-Google-Smtp-Source: ABdhPJy6eKRgHJVKj5Kuf5YzkLjzfy2+jsuD8Q8gF+7m2fmKIDdzRMo4nhWjLS4/EihXchnaYlKq5NXjgvbpfTBzlqE=
X-Received: by 2002:a25:c342:: with SMTP id t63mr4815851ybf.122.1594889389766; 
 Thu, 16 Jul 2020 01:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmV=rThbdZnjY_cbkKBeuRYNL0O2QLoJQGFPRc90SZjHoQ@mail.gmail.com>
 <CAEn-LTqnsygh40cqMf4Z41FuZh-tOO2bubNv7vqZUgMbWJT+RA@mail.gmail.com>
In-Reply-To: <CAEn-LTqnsygh40cqMf4Z41FuZh-tOO2bubNv7vqZUgMbWJT+RA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Jul 2020 16:49:38 +0800
Message-ID: <CAEUhbmW2UHRFJct=Ftizdb5zgib0ZRCwEot=sT0skrhoJtWLJg@mail.gmail.com>
Subject: Re: Patchwork for linux-riscv
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_044951_982769_3B80BD56 
X-CRM114-Status: UNSURE (   9.65  )
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
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 4:33 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> On Thu, Jul 16, 2020 at 7:50 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi,
> >
> > Patchwork for linux-riscv seems to be stalled.
> > https://patchwork.kernel.org/project/linux-riscv/list/
> >
> > Or am I looking at a wrong place?
>
> Yes, it's stopped updating.
>

Thanks for the information.

> There was an issue with the mailing list (and emails were lost) at
> almost the same time.
>

Ah, I see. OpenSBI mailing list encountered the same problem I remember.

> See: http://lists.infradead.org/pipermail/linux-riscv/
>
> This might have caused an issue with patchwork.

So could someone re-configure the patchwork to bring it back online
for linux-riscv?

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
