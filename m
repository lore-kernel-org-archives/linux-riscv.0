Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B9ACA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wi8HLTEtIa15ujIin5LOtVHEVAVW/HSWzjgJgscB144=; b=28pBngyqQs+ADq
	YqAYyo86xZSpu193WHDmG33DAY+6qJSzwKUnffppFh8gOHYw/BEwx3M+hbZVj7TsQIG6ZkCwPzPcS
	R49t8UR63PudDOlBmCGTQrtwTcbeflRtltPACFZ2CkV6SqY/1+T2UHpQ8k9H30846ctylk/SRqqlC
	Qy9zk3oQbf9I7kuN4QCToqpyS2v0Q9zNZb9LS97mfeG/0leF3T9U2TTzqP4oDm0QUW4fhoW15ahtj
	+10T92akwryDCRwyj4szCF2hJvdivGHRB7dHIt/ezCBx0HZwLJjlk5ANeMlfVCLrgCqHr0CNF1JSX
	Af4bxBfNU2COlzLgbgtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGhh-00000000Rdt-3Pgi;
	Thu, 18 Sep 2025 15:37:49 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGhf-00000000Rcp-1UDU
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 15:37:48 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-6241ab7fc41so434608d50.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Sep 2025 08:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758209866; x=1758814666; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7xlUHVUZs+o/rLsFgTFSWQv5sonPIDCOjuBaYxKvxdQ=;
        b=E0YWc4NA83IpLZWYDkk0umyizSbsWJMQxfBYCObqfcBLkKm2PR0J1lSoFJysFo6BIe
         y8KyKc4Viea9oR/J+oNzXJN47ams67PpBBq8Z7h/aPBxgODQQ4HDDZqY+X03EszX/k76
         u6In6XCZZ6rwbZeZGPqtcLEIeuu+idBb8SxgyFU48RY1WgzKeG94JmPCmqf+yoYUWt9z
         a/soYSX5USVC8s8JOZU/Q7MDCKFY/6/NGTyNdfh7fckK6CMnzd565UAruB9nIT2F28Gg
         Z/UW1iowy7hOQ33V4190J1UqAmU8vJHRIWLbd1tEwIS7yY8BTpob9s2/V+EywT2Tqu8+
         Ru+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758209866; x=1758814666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xlUHVUZs+o/rLsFgTFSWQv5sonPIDCOjuBaYxKvxdQ=;
        b=w/+kgvdetJxmY4Pk4mCNhJSkwD2IXDVhDyQczepUdLRz6tfxwu8txZyo5PaiQogBBl
         /vFOJuHDtI17Hm6gH+iZC5/OBABMnrZ/4nWWbt3bHHPUotcagE3yiWP4KxR//Gzi5YVD
         /NzZ6v8zLL4k32MXlZxb7SqLPhdIc4pUWblSt3IEkkGtml2zeNcT4N8UkysTohX4OkpS
         xTpiCCojXg4Fosqz/B0XjFHKIVb6zzEls0Fs9o/sTn37SqJE6BzAVc7GlnVOcu4iqpsE
         qw13DrISH9M0uvMkWYSSwy/msyNcroB+CxWi1RLbPu/WvBO6CVsM/9XRKzuytOYak+Ro
         B15A==
X-Forwarded-Encrypted: i=1; AJvYcCUzrnW+3Ah0AY9ZM/LVvopva9wL94D7XxL2Yl/SPwAor7stb0DgXwsSlv57guUlke6xcEqtpClOFCozrA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8hihygVLaeX/RU88qenmWWeL/Ov5AxgVXORQEAjv3WJDblR53
	XmC0xQwM1/bDVVRypjoAlnC4Nqm4mV7I35ihvfMHGvhknTIfT6R8MRRXDwCIJGLZhFg6UzIQz81
	jAHMI7rATV1wWkvGGAPMLePXuUSmSOPJvTb0RYzf+iA==
X-Gm-Gg: ASbGncvyUmyEtngBINUNkqB/Q5jLBR+yc6oasST/MYKnOlPISB/5SAIauucRQGHKpvF
	e51keDIo8Qk/C/aQpQosjvMw0dsbYd96ofSK+gx6MIJqsOQnK+73qOSaPHEA7RBw2vu/0sREr6D
	mjasl5J51re90TQCfnoIdAQRaDdLAJgAcBaW3RVzKFsJE0iGPbkyDQhNrafjiF5JwX6QjRTgw2o
	zT1yEhuxlYtQ5EeYUf/6G8hHw4=
X-Google-Smtp-Source: AGHT+IGtqJvo4MVxS472kzqGxtAHHh0rdIn7sRNAQ4ViXkzVaniJnHWJAGXpjD7HDhokIclkvH7bXIC8ZMqw3sAEmsY=
X-Received: by 2002:a05:690e:15da:b0:62c:bb1d:5694 with SMTP id
 956f58d0204a3-633b074bd1cmr3510380d50.35.1758209866010; Thu, 18 Sep 2025
 08:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250818074906.2907277-1-uwu@icenowy.me> <20250818074906.2907277-2-uwu@icenowy.me>
 <i6slr5csro54ys5g7diqyacq4deidwm6f2nhpm2uwmgjlu6tyn@otrbpij4vdya>
 <aMm6UIMTFOH0Z3Ug@x1> <7ru5tunm3vlmtuulkbc7kpunyim3ks3he4ielc77ivm7vxieqk@iw6xmwmsn3lk>
In-Reply-To: <7ru5tunm3vlmtuulkbc7kpunyim3ks3he4ielc77ivm7vxieqk@iw6xmwmsn3lk>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 18 Sep 2025 17:37:10 +0200
X-Gm-Features: AS18NWCLe6oh-uLn8GnYoZwHpnz9EAYCU-8ecy6whZL-NO0kp3ol_7PTuu2q400
Message-ID: <CAPDyKFp221d_RQmqoLDVxKOuphqASKK57UB4FzndKJFT5VBnHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver: reset: th1520-aon: add driver for
 poweroff/reboot via AON FW
To: Sebastian Reichel <sebastian.reichel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_083747_399204_5E614F06 
X-CRM114-Status: GOOD (  21.70  )
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
Cc: Drew Fustini <fustini@kernel.org>, Yao Zi <ziyao@disroot.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 18 Sept 2025 at 00:18, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Tue, Sep 16, 2025 at 12:28:16PM -0700, Drew Fustini wrote:
> > On Tue, Sep 16, 2025 at 08:22:02PM +0200, Sebastian Reichel wrote:
> > > On Mon, Aug 18, 2025 at 03:49:05PM +0800, Icenowy Zheng wrote:
> > > > This driver implements poweroff/reboot support for T-Head TH1520 SoCs
> > > > running the AON firmware by sending a message to the AON firmware's WDG
> > > > part.
> > > >
> > > > This is a auxiliary device driver, and expects the AON channel to be
> > > > passed via the platform_data of the auxiliary device.
> > > >
> > > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > > ---
> > >
> > > Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > >
> > > Greetings,
> > >
> > > -- Sebastian
> >
> > Thanks for looking at this patch.
> >
> > What tree do you think it should go through?
>
> I'm fine with Uffe taking this together with the second patch or I
> can take it and provide an immutable branch once the second patch is
> ready.

Okay, when patch2 is good to go, I will pick up both patches (no need
for an immutable branch then), np!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
