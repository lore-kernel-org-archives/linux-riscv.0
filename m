Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5460C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 18:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewnhwR9uZ72Eq2dTYbyOaaTuc8T0Ghg8Lxf6RJl821I=; b=Tt6inZHYArsQjV
	lWRG0Lk7B8FT5Jqc9R9I0bo7a0uE4HxK6Lgs0MlFbcIZMATI7Qd/LRg4Vn6CHW7ZQLj0IXVpFOOD5
	6iunovUzRzc1PxR7RRnNb7bSdRCKt4qNAdPL3C6XytcWEzKOATe1n2aWrGA+9OOs6eGPXNMyyOGCx
	mBdIgbwitkWs5ly9LA/NgmAB7j1JwPaHXXvb0svx5PhOvCDjjN8VG03kyP9jQmF3VV9NFZmpHiE+t
	sBa+mTM5K9ADGHlAOXfKX31i3f2Av8wdEQlHfR8Fz+YNkb79tktFEJY43kyTcABt2EyBOiQvmqBo9
	zAZ5NxAdsuxx5Qfnc0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc7mE-00000009BWT-27a5;
	Thu, 08 Aug 2024 18:22:18 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc7mB-00000009BW4-1Q9s
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 18:22:17 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fd9e6189d5so12098175ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 11:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1723141333; x=1723746133; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSN6cVC7evWmcpEk6TU3DWLWOkdqjYPRuNB/eln0SAw=;
        b=hWsM9+oHqjeebDG6A1sD9S50MiwYtAPjYV7g+MQeeNv//h79vFlx+MYLL0Bhq5FYG6
         zlTkz8PccwrF7TuLke15VCCkq+zuK7dGgd3LW504+XZWJ+mVmlN1XV9NIVXpH4EzqYX+
         YMIeIpZpWAxRYSHWNtcy2Wb/zIzvkHfb0QO/5ERRZaD4k8AGmTreqYmpdpFOTb07IUqK
         x6gfDXuBHpk1CICVKm8Z8wZh8yYoNVVipYzawBje8jQPD5ovMeFgRp0wQz7vV5M99YMX
         YDgYk+XIVZLy9Qm8cNUSIRbBOJX69q9Ac9BgJeFnPnXoAyJk20PXyTgIP1OEV6XcUrlU
         28bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723141333; x=1723746133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSN6cVC7evWmcpEk6TU3DWLWOkdqjYPRuNB/eln0SAw=;
        b=ZOnI3iNbsOBcft+KupwAPFoHQgSyudVpfOa1EunSc1fdapalxfNscR3OOx9YoJOked
         XhOVclsC2TKQDkUDCy8YzQySWO5jBmsyg9bepP9xIVIJxASOMQsAQGeMVEYiGSZej6xj
         KL4WrBP3oMEDrgz0Lab+ZsbvSNwgu3I7plsDsq2aqEgniYEyIuga8pmped0buDKiKFLe
         P+StZ5QywlCI1qQgdtfb0E6czSVRcFfrvsBrBWa+HF3Rxcsxlwxf6cPh6nl3NS1zaAaM
         2NGpUEWCGEAoDW8MGnYp46YjXDRajsFk3j+fcfxV0l6m7kHM1wTuzmkVNS1WGwBqWSOX
         Uh8A==
X-Gm-Message-State: AOJu0Yy2J/lTCK8AfQZo8mdAr+2W3G72vlJQP6Gx6e5JvZeHK6QPF0nd
	TekZi7Sm4QHje1Dyyj+KPo8D5+88VY8qLWn+kvPm+UC5+ILtIirqLXBl33CZGzA=
X-Google-Smtp-Source: AGHT+IGSExsQlp8XnwcQGGcHAy0C8Cn8njTwT9JbzTIxv6ZA/erMbbJPhhtrGwGHUFr5dn5pGpZekw==
X-Received: by 2002:a17:903:2287:b0:1fd:6677:69b4 with SMTP id d9443c01a7336-200952bf93dmr36841005ad.49.1723141333252;
        Thu, 08 Aug 2024 11:22:13 -0700 (PDT)
Received: from x1 (71-34-86-94.ptld.qwest.net. [71.34.86.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5929ad79sm128033615ad.264.2024.08.08.11.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 11:22:12 -0700 (PDT)
Date: Thu, 8 Aug 2024 11:22:10 -0700
From: Drew Fustini <drew@pdp7.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH 0/6] riscv: dts: thead: Enable TH1520 AP_SUBSYS clock
 controller
Message-ID: <ZrUM0sJQ62XijN7T@x1>
References: <20240801-th1520-clk-dts-v1-0-71077a0614b8@pdp7.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-th1520-clk-dts-v1-0-71077a0614b8@pdp7.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_112215_601674_4201D6D3 
X-CRM114-Status: GOOD (  10.83  )
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

On Thu, Aug 01, 2024 at 11:38:04AM -0700, Drew Fustini wrote:
> This series contains the dts patches to enable the TH1520 AP_SUBSYS
> clock controller [1] and convert peripherals from fixed clocks to real
> clocks. The dt-bindings and driver patches from a previous series [2]
> have already been merged into v6.11-rc1:
> 
>  ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
>  1037885b309c ("dt-bindings: clock: Document T-Head TH1520 AP_SUBSYS controller")
>
> [...]

Applied to thead-dt-for-next:

[1/6] riscv: dts: thead: Add TH1520 AP_SUBSYS clock controller
      commit: e919fe036a97f6ed96eecf39ea61963eb2ff3442
[2/6] riscv: dts: thead: change TH1520 uart nodes to use clock controller
      commit: c101b4a028e21ceaa4e39a62ee36a404d7b4bca9
[3/6] riscv: dts: thead: change TH1520 mmc nodes to use clock controller
      commit: 03a20182e1e0f4a824aeef9aa7bd1d46ea6d0196
[4/6] riscv: dts: thead: update TH1520 dma and timer nodes to use clock controller
      commit: 89d58327fd7451533fd313d727b50a8264477bf4
[5/6] riscv: dts: thead: add clock to TH1520 gpio nodes
      commit: 7f5b28218cec55072b562be386675ccae41acca1
[6/6] riscv: dts: thead: change TH1520 SPI node to use clock controller
      commit: 2d98fea7491a00dccd61fee019843b262e60f819

Best regards,
--
Drew Fustini <drew@pdp7.com>

Link: https://github.com/pdp7/linux/commits/thead-dt-for-next/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
