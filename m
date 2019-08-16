Return-Path: <SRS0=HKfm=WM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4869C3A59D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2019 20:50:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76B562077C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2019 20:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nWyoLHrl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=carlosedp-com.20150623.gappssmtp.com header.i=@carlosedp-com.20150623.gappssmtp.com header.b="pjCp4m/u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76B562077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=carlosedp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFr2Ynp3NwTGj86xtTGUKOYIG2WsJjhr38FaNo7J4xo=; b=nWyoLHrlSLWX//
	pMcIU8gI59qAtpGqdgi8QPafIlI05dvufFmg+D0ZoMdvw9efvOyqEmE5xALkpf/jBf38tvGzH+t4S
	IFk8nRqhvA7Rlbw//iUM4l3O6b8BEV5e657TB1TVS6pjMTNXZD22SIBVEuAeWhoUl6BH1+NRWjuv2
	96inu+riUhy8UdUB78s9q7XsliDhMwtpAHVsGlbrT8hqhJU8b84iKFF2hEjLgK3uicRTu2Xo2/7S2
	KRe5VKkJkLPixjVbEvrB6oFLO5ir3DaYOOAxrTPAyEvpush2RJvhw9+QUUi3h6A0nXH/i8s5e06vg
	x4urW0ykpfg9NqtQFtHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyjAw-0000Ta-C4; Fri, 16 Aug 2019 20:50:18 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyjAu-0000TE-9f
 for linux-riscv@lists.infradead.org; Fri, 16 Aug 2019 20:50:17 +0000
Received: by mail-oi1-x243.google.com with SMTP id v12so2082754oic.12
 for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2019 13:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=carlosedp-com.20150623.gappssmtp.com; s=20150623;
 h=sender:mime-version:references:in-reply-to:from:date:message-id
 :subject:to:cc;
 bh=CqRLxZBxO7f8troQHzcJ3w0fDlv39JCLi4iRZkUnSO0=;
 b=pjCp4m/uhpLP+xfREjmVP2jK88nTn9ZQ3RbqdfR7jYgNeLnxxvMvIMLiYkJkvWWXWp
 vU8sA4v4T2mjXqaLMAcgEklJpQ1HU5bkHvofACQgGqSWZT7G8niv96iw2OmZ5oViIPm8
 FyuQWTLnXurOqLPfshN6g6WgBl/tzzSWHS825l7Nsqvg5FEViJmv0acdNrAjuKSlkKt8
 IRyGe4lCioi/0NUJy+Ix416J94Qu68y0ygWr9wOWqALyDxAuRz6qihHbMQJeJZE713LG
 ceGxoHVZw4Q/G/dTSFCzzn3ywaesAmudDRwwct+K/vFM6297UvWV1B9DNC8EGXg75Xsf
 IqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:references:in-reply-to:from
 :date:message-id:subject:to:cc;
 bh=CqRLxZBxO7f8troQHzcJ3w0fDlv39JCLi4iRZkUnSO0=;
 b=o2/F/KJo1dKL49ZyP14KgYzY2ke9KMkmcCLSzY/pRHmNGjzjSgwsS2X/+4Sp5jj05t
 d5Jk8bxc+AZ+y41xj+7JmYfdzYM1D5zNhiSeEQ3ltRznfZF9dDA8/Z2LJyfjWjYdAXq6
 i0fyqotdS+RfhlwFt97E69E7cZgzSYKYdNYxvipuIZZk3luUJ3Bms0msUCUHjQFDnoqI
 zuUnVse83ZcrKzfabxe0Jml5DruiTylCCaB0e7XiMHATzuMUBRgWLRL93roYfxOlQF46
 rEiWq8rjCYm4sfaQz3nsx1moSyIFD2YPr0i1pYiulbMJvRPjhgZworfmSQge7QP3iTr1
 Tygw==
X-Gm-Message-State: APjAAAUKXpxM0FkdCuuJKIyj523DWcwMVZshrnZs8Im6RLI+iA8oA8r/
 RzKdZ1K2S2pnPuK4ol+HIVysIsjjJS0+pQ==
X-Google-Smtp-Source: APXvYqy83p3yo9AZeSI+tBOlqg4q2KXBu5qiaBaSs6tkUuwgCXF1quzN9fOGe5NNe8BFAGSceU4fdw==
X-Received: by 2002:a05:6808:8f7:: with SMTP id
 d23mr5761890oic.35.1565988613493; 
 Fri, 16 Aug 2019 13:50:13 -0700 (PDT)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com.
 [209.85.167.179])
 by smtp.gmail.com with ESMTPSA id x20sm2311098otk.79.2019.08.16.13.50.12
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2019 13:50:12 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id g7so5741315oia.8
 for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2019 13:50:12 -0700 (PDT)
X-Received: by 2002:aca:b554:: with SMTP id e81mr6302242oif.7.1565988612130;
 Fri, 16 Aug 2019 13:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <CADnnUqcp_7yN4WK2uXberCV_uwjPSj0PxpiXg6kp71--QGPJaA@mail.gmail.com>
 <alpine.DEB.2.21.9999.1908131417450.29979@viisi.sifive.com>
 <alpine.DEB.2.21.9999.1908131908000.19217@viisi.sifive.com>
 <CADnnUqeUwjhmFp5moem4Cx-ux1kAmhpdyeerTqZ2cNhyvrT_hw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1908161221010.18249@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1908161221010.18249@viisi.sifive.com>
From: Carlos Eduardo de Paula <me@carlosedp.com>
Date: Fri, 16 Aug 2019 17:50:00 -0300
X-Gmail-Original-Message-ID: <CADnnUqcp0DDy1UOT4nMvokqLR2Y2BMU7=UfnOLnjXy7MQpRn-g@mail.gmail.com>
Message-ID: <CADnnUqcp0DDy1UOT4nMvokqLR2Y2BMU7=UfnOLnjXy7MQpRn-g@mail.gmail.com>
Subject: Re: Changing SiFive Unleashed core clock rate on 5.x kernel
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_135016_363665_F059CA90 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Paul, I've built that 5.3 kernel and also used the DTs on my 5.2
Kernel but on both cases the network interface didn't come up.

I used both defconfig and my own .config, after this I've built latest
OpenSBI with the DT with command:

make CROSS_COMPILE=riscv64-unknown-linux-gnu- \
    PLATFORM=sifive/fu540 \
    FW_PAYLOAD_PATH=../linux/arch/riscv/boot/Image \
    FW_PAYLOAD_FDT_PATH=../linux/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb


Any adjustment I need?

On Fri, Aug 16, 2019 at 4:50 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> On Fri, 16 Aug 2019, Carlos Eduardo de Paula wrote:
>
> > Got it, just to be clear, the sysfs changes only work on this 5.3 tree
> > and patches right? Not on my current 5.2-rc7.
>
> Those three patches in the branch that I sent you seem to work about as
> well on v5.2 as they do on v5.3-rc4.
>
> v5.2-rc7 by itself won't do anything in this regard.  Those patches (or
> ones like them) are necessary.
>
>
> - Paul



-- 
________________________________________
Carlos Eduardo de Paula
me@carlosedp.com
http://carlosedp.com
http://twitter.com/carlosedp
Linkedin
________________________________________

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
