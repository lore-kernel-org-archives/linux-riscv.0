Return-Path: <SRS0=OdZr=L5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3A8C07E98
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 03:55:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93A9D61283
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jul 2021 03:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93A9D61283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhRuf4fsrLLc4UjaMZJO0HlSCgvlVVwVMFSrnX9vBeA=; b=entjR5PF+jO5Pz
	EEi9DU8k1L17Dxx+tpPOHk0oK49VzLkl1mHBPD3Pk+gVfZ3feg86T0LFcFoy0Tn0tZ40coVRG1ZjM
	la8mfDDEaIhPmBS/wd47LRm8SuQ+3L3OP6E9uxC8Fz476PORVBWAaPDNVkvAG7u5ldiDB2NNRKRj2
	zkcje8BxgoCz/qOg7PKMKcznHqgT8452acIti8upfsflS/wUVYoSU4daW+iqHGzd5qB4D4kIv53El
	YwW20Q5oFxsYms2uSB+VxtKPTnvqxP2COirCWNAFPwEnvDw3ikDhjWIVv8P5Sy0weGdyhVFI8kB8z
	PTdBNSc3qt1wesJBIhyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Fhj-007hhi-4Y; Mon, 05 Jul 2021 03:55:31 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0FeK-007fwf-NJ
 for linux-riscv@lists.infradead.org; Mon, 05 Jul 2021 03:52:02 +0000
Received: by mail-pg1-x536.google.com with SMTP id u14so17035374pga.11
 for <linux-riscv@lists.infradead.org>; Sun, 04 Jul 2021 20:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YUiMviEM4qWdeD7ggunch8ZPUKg+2qZoar2m+NNRGS8=;
 b=uNOJqNlVsqFRp5V3Dtzs3LyZ4JxAhvTmnE2809JkV8BYzbjdgNXFu/SCqBZDhETWtO
 UxCzhkRR3gQ9LF2lJDo5jlBbXhNOIpCTWJcJC11PU3INIgaXe2QcHww5gjZXuPFWDjNJ
 /GwAKJfmf+1yV11uKI1brbUqXQGZUM0DqsCjdMD/F05M83wDT87QoJe0N/HgWS/Nwnhy
 /y1aMKg7oUZy07MQjOeIRCkOVeKjvYcASAUb7Fygz0e4Dp9TnbkpE/Z/mQKeK7ASxeCc
 AYYz7glhgtksIRljwLiWrvk+WHYi20dA2hwcZqR+hXZwhiB0ZMObCtEleUrCAoSdapiA
 RQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YUiMviEM4qWdeD7ggunch8ZPUKg+2qZoar2m+NNRGS8=;
 b=BK/r0I8rvWf3XdmDXfixifxeJzMWZOJYPIqKnm4cuX2OmJe53gFXRAvdbDjnPWdfv1
 5+wsDCZFpHlgeuhrOiQsZaD3JTUwhuplm2HbYrLmUOay8BxK6RmByHzxreDQx+xtfD2i
 P35xCmidh+1LyOcfwC2ggK5LUh25mDEPYuf0S/Q/LqycGfVRM40G9POrixQuLT+kgJVd
 RNotkfB6cc7qdI2OfAKp9mgO/zzo+Pv5xfxk+iF7agrn7M0SO8yhYJ3ij07huFFVBuD/
 E0I+LrZBO7N5Kbir/df3WJXW+avwyuihQbiJ3OZoxHof/NSpyrCYw+jJxfql0MF3jw1M
 708w==
X-Gm-Message-State: AOAM530z6bpembd5tqpIg2ZkjxyDo5ZUPAD8Yk3KcEa1SqL1LM3hdOls
 duL/DRdVziURsxfsPswT/DLKoA==
X-Google-Smtp-Source: ABdhPJz+JXkVhZeNayxLP5SNBpR8ubLc6ozNA5fTH8fBBTnhakkXSO8gz+YOe0X4leyKkb5WHzk6hA==
X-Received: by 2002:a63:d60b:: with SMTP id q11mr13345118pgg.270.1625457115683; 
 Sun, 04 Jul 2021 20:51:55 -0700 (PDT)
Received: from localhost ([106.201.108.2])
 by smtp.gmail.com with ESMTPSA id m2sm20299200pja.9.2021.07.04.20.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 20:51:55 -0700 (PDT)
Date: Mon, 5 Jul 2021 09:21:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 bgolaszewski@baylibre.com, Jason Wang <jasowang@redhat.com>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 linux-gpio@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20210705035153.rceytdfbmvj5tvdt@vireshk-i7>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <CAOh2x=kcM351ObubnQSzUa=FVBQUmAUhz4u8ExORUthQQ0WbGQ@mail.gmail.com>
 <253f218d-07ac-1963-75e1-9ac2d035437a@metux.net>
 <20210526033206.5v362hdywb55msve@vireshk-i7>
 <20210703040504-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210703040504-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_205200_851266_F7B2FDCC 
X-CRM114-Status: GOOD (  22.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 03-07-21, 04:05, Michael S. Tsirkin wrote:
> On Wed, May 26, 2021 at 09:02:06AM +0530, Viresh Kumar wrote:
> > On 25-05-21, 14:59, Enrico Weigelt, metux IT consult wrote:
> > > On 24.05.21 13:27, Viresh Kumar wrote:
> > > 
> > > Hi,
> > > 
> > > 
> > > > We (Linaro's Project Stratos
> > > > https://linaro.atlassian.net/wiki/spaces/STR/overview)
> > > >   are interested in this stuff. I was trying to look at the last status
> > > > of all this. Few
> > > > questions for you:
> > > > 
> > > > - Was the spec ever posted to virtio-dev list ? I thought that's the
> > > > very first step before
> > > > we merge the code.
> > > 
> > > I had posted some spec quite some time ago, but it wasn't in the form
> > > of patches against the .tex documentation files yet. It's been laying
> > > aside for quite a while, since I've been busy w/ other things.
> > 
> > Will you be fine if I take that up and restart the thread ?
> 
> It's been a while - why not right?

Yeah, we went past that and here is the last version I posted.

https://lists.oasis-open.org/archives/virtio-comment/202106/msg00033.html

which I took back later on to let Enrico do it, as he wanted to.

And here is the last version from Enrico:

https://lists.oasis-open.org/archives/virtio-comment/202106/msg00048.html

Lets see how this goes in coming days.

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
