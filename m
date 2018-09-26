Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C180C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 04:17:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6942086E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 04:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NsAe2mH5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="ANuk40/o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D6942086E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5n8A5DQBiwB0ZcE59PQNa2w315AQHWpUIksj9cZclcM=; b=NsAe2mH5NypvCi
	P2lFJMb1QArsENQ1fHztPSyFeX2Nll0YIgxm2g1BnbozWtvL+bv7hKL2jvzk6h5PeRTjwdeeXtfan
	EY7aUAntCMA/wGBqz+UdEoECrufeRBps/rqGiYjuMJABw+8ZvjcMSGdDtVDhoxApU2L1tmxBLdq5j
	rWFIcvnddRKCg+KmI6vo5q4gr9EEjjdT5FaSRM5qo6A8GOdeU6NlO+PZIwT02TG13CYVBwfCkL7WW
	QXrbdyv5pxdQQGaz5A0ijv7H63VGMEJjL1onmvmjD8nwRFoMEnclTcqs0V9uozQiAavmUGeuULvrF
	xfN0KQiJjcH8679L1+Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g51Gl-00072R-48; Wed, 26 Sep 2018 04:17:47 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g51GO-000708-JO
 for linux-riscv@lists.infradead.org; Wed, 26 Sep 2018 04:17:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id f10-v6so4408536wrs.0
 for <linux-riscv@lists.infradead.org>; Tue, 25 Sep 2018 21:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oqLycqIGwEmchXvmKuBrd2D6JWsajBs4luqysWC9dxI=;
 b=ANuk40/oKxvEFqgGRefMDb0IClRhoVovhDoQweCJAthTo00OJIrRTJLThwNymQxAcM
 KUYx99f4NP0dMAK7aeDxOKk9B7cOHdR9obi7i8+tgqdZSNHSp1Y5zMBbLi/eIOaoTtGt
 HwI25Ypzurd03kQPB/4mVPY+01170tjsxcDh2lAMjclskYvpIdGAgucXfLxRQItNqy9C
 e+6rQId4qKb3jz1W1h2s2HIu3bcPzYT3YnyAHC91LS2yRcmFSeE+B8rXSq1D1kFkcC5U
 ybP4DVJZyi2KE28wkj75RmFuGJWEFy1dda7aBfLD9bzrGWrBIJivbucmbpSNVHiNufWO
 VKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oqLycqIGwEmchXvmKuBrd2D6JWsajBs4luqysWC9dxI=;
 b=l9Yz5Ww89WQmuCJ6GMV4r8VhT2dK7bm1Xe71p8PqImkuae6Dgjnrh/cq2aSPOGIoBy
 5xpOgcCaASBKO4cHUBuc/rCzXemSxYZRchIZ4KUpijdjFNot/cviuyh0xvGUMnHRGswQ
 t6u4QYSxbluvt1BY2DTj6LnuzurxB+MOai9t4ZO7vbySuJJgk+T2xBIdYN7o5ixhVPLx
 n5Kpjk4ricKEFkYPx5noVtsqq/BJMfIbDVP0orJkWFpylQ965YKRG4Tavp4FcJF0UGXV
 KOiVnq14fkCfyrjQgC+tyJQhd7Mj3EJQuzwgmRQnjbm8Wxm6aJWunST/ZIgUtMk6LDfx
 3/3w==
X-Gm-Message-State: ABuFfoicA8yAKLOMeonHUQHkPkkxBBarwLqx7lq6w17SHpyohWCVkOmV
 RKCsQRL+EJ8E4w/wtly+BhO5mgKtobh5xpIclUDrow==
X-Google-Smtp-Source: ACcGV61dMhx+9b1lIz+H5naFgRKnn0NiTqf2K9XnM6FHCfZd+W7Gr8srBA1uIdOALXgPhB0BqEPIhD2RB5Wff1w4734=
X-Received: by 2002:adf:c554:: with SMTP id
 s20-v6mr3138812wrf.46.1537935411755; 
 Tue, 25 Sep 2018 21:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180923133737.22693-1-anup@brainfault.org>
 <a7c64e1a-405e-6a2c-cb42-211c4f89367d@wdc.com>
In-Reply-To: <a7c64e1a-405e-6a2c-cb42-211c4f89367d@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 26 Sep 2018 09:46:40 +0530
Message-ID:
 <CAAhSdy2ZOXk3fDt8W_G1=h_OrifFsXP3XwZ2xnXwt9ztzW4GEg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Show CPU ID and Hart ID separately in
 /proc/cpuinfo
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180925_211724_702559_F7D3D183 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926041640.wxLHEZR2Wlv34q7kJ0jq_vJWQJ0ycx864Oyi61e8F2Q@z>

On Tue, Sep 25, 2018 at 11:29 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> On 9/23/18 6:37 AM, Anup Patel wrote:
> > Currently, /proc/cpuinfo show logical CPU ID as Hart ID which
> > is in-correct. This patch shows CPU ID and Hart ID separately
> > in /proc/cpuinfo using cpuid_to_hardid_map().
> >
> I noticed it should be cpuid_to_hartid_map instead of
> cpuid_to_hardid_map. It was a typo in my smp cleanup patch series.
> Sorry for the inconvenience here.

Thanks for pointing.

>
> I can include this patch in into my series fixing the typo if you want.

Yes, please.

You can also include "RISC-V: Show IPI stats" patch in your series.
This patch was reviewed by Christoph.

Thanks,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
