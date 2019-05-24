Return-Path: <SRS0=JLSQ=TY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F63BC072B5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 May 2019 04:40:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32648217D9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 May 2019 04:40:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qxm66hso";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="JYahaxVj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32648217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpBzSFmx3yX2SswY6pexfsELPDbOoDr/brybVVBIMz0=; b=Qxm66hsoO02gvv
	Xs+Tn+iuFCms9F6WpUm536Yhuu6UvkwYtjORrOKrGNPoQd7180U9XWItNYoFCej/CwI3cg7BziEMf
	6K97Jy+oc1r5fsw+H2QsDhfcX3X0B3u9AiNas7QfOgfrVRW7z3MhtVSevj/UqUZ+lKHYscARNvGvj
	DUflGRwzrQB+We2ntzVgdPQeKOZx8nrVsrHTn5kGf+1JhDBf5wFK39Ty+MLphJ2v5Ip50GczRPou1
	jNZWeGJxCQm4/5g3OlEqaUvxSPD2c341s3zGtsDlyQKbE+ct2iXeL1Fnmf2g02Ul7KS0cdBj/oW/r
	/Gjo3eTeJZ5QTW+b6T3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hU20W-0004DI-6L; Fri, 24 May 2019 04:40:40 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hU20T-0004Cw-BQ
 for linux-riscv@lists.infradead.org; Fri, 24 May 2019 04:40:38 +0000
Received: by mail-lj1-x241.google.com with SMTP id h11so7468704ljb.2
 for <linux-riscv@lists.infradead.org>; Thu, 23 May 2019 21:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rRM8a/2TtZzcDJu40/I1y3WAHnEd2NwaRkAkmAY7Pbs=;
 b=JYahaxVjVRWEcKQda8kVjGL2wDABM1W5WBX/QUgmobVeLwQojkfjKb9PRxyYNXasrg
 IKej1xeUqkWYvs8MSxYCSz2eckUPl9QYwVSvU9wIDRISXtICeXlDoiN8N5l+n9PUMdzU
 jxo0/kvTMRTgRSQG2nCCRK/khQNCwkVsaJo0TvU366iBxlTUum4/OG6jeY6R7y1xnM8M
 jfDFyOi6F+NaxhkHh/GSZ+AqLwXaMAKvGFRB29mD574459O/mnCaBIFERL+Bvdpd5PVv
 neMNBP/zkzT8R+0AoYdaWMtzS5azRHDPF82fbyGymiIy5PMglmcEksZZk0V1OaqWE80l
 rqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRM8a/2TtZzcDJu40/I1y3WAHnEd2NwaRkAkmAY7Pbs=;
 b=ZUI2TE4lBC3NjuOmc008Q9YQsChtlXMw1TGmwlvKM5tOYjXHw9z2xNRhjsw49BKIQe
 b1+bJLGW0qiehx1TdTCnoedQPGsBpv7dfEVzh/zw75kFQp7lrKk3UUiZQbIH4cXXtU4O
 cUVxF0pUXvPU0G+se/yvd2CdGD3OP2R915pPcBysEelimNPU5WrqIuzza3JVwEL/LKfR
 oxdOS72muwytL1qBfCDcZezS7S42sAK7Y7GVdUF9dXcvRBIK5rO2rI7PeJNoXHV2MlZZ
 7EnKOtJ56z8YFYrtpB8SZfMnhkLMaNzvSXqOwPxx9beRWxBy0iU6BoaF+aYesOPOid3S
 dOFw==
X-Gm-Message-State: APjAAAVL1UNhP7tF5Spmh53C5R9rRHqAs9e4VbpalAkb3DMGWigDETgi
 /rlb6sJUzE7QllEBEYcwd+HdAAqNITnCyGGPomHeaQ==
X-Google-Smtp-Source: APXvYqyPMrr+pems5snP2y5pBVnjhlfmJgkwgMVDQOSPLPyKkA9ga7l8hVA6NbIaTAmeEBPJ+euWW69CwomX7WDRnxs=
X-Received: by 2002:a2e:82c5:: with SMTP id n5mr15440974ljh.175.1558672835426; 
 Thu, 23 May 2019 21:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <1558611952-13295-1-git-send-email-yash.shah@sifive.com>
 <mvmwoihfi9f.fsf@suse.de>
In-Reply-To: <mvmwoihfi9f.fsf@suse.de>
From: Yash Shah <yash.shah@sifive.com>
Date: Fri, 24 May 2019 10:09:58 +0530
Message-ID: <CAJ2_jOEr5J7_-81MjUE63OSFKL-p9whEZ_FDBihojXP2wvadVg@mail.gmail.com>
Subject: Re: [PATCH 0/2] net: macb: Add support for SiFive FU540-C000
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_214037_450995_7FC3D8F9 
X-CRM114-Status: GOOD (  10.53  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 netdev@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 Sachin Ghadi <sachin.ghadi@sifive.com>, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, ynezz@true.cz,
 linux-riscv@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Andreas,

On Thu, May 23, 2019 at 6:19 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Mai 23 2019, Yash Shah <yash.shah@sifive.com> wrote:
>
> > On FU540, the management IP block is tightly coupled with the Cadence
> > MACB IP block. It manages many of the boundary signals from the MACB IP
> > This patchset controls the tx_clk input signal to the MACB IP. It
> > switches between the local TX clock (125MHz) and PHY TX clocks. This
> > is necessary to toggle between 1Gb and 100/10Mb speeds.
>
> Doesn't work for me:
>
> [  365.842801] macb: probe of 10090000.ethernet failed with error -17
>

Make sure you have applied all the patches needed for testing found at
dev/yashs/ethernet branch of:
https://github.com/yashshah7/riscv-linux.git

In addition to that, make sure in your kernel config GPIO_SIFIVE=y
In v2 of this patch, I will add this select GPIO_SIFIVE config in the
Cadence Kconfig file.

- Yash

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
