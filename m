Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7502EC19F2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 21:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FdLPP2gcskS+jczU8n5oaQcbHJ5+XJ0MLWLSddutm4w=; b=0TkSORbh8hhsUGMbVU5XE1c/Yv
	UYO2oy54+dS3YOAXAqCwIAbvChNiWpXH/1zfKXlSH6PDa8jARfYGC2n5U8pRzszRhwK740B9umtTV
	N+I/Eb3LhOImNS9Px7R2Xmw/ZZs0fh4xlLIJ/xA/es/4VbdrLkO+Fd/P04jm2D5GYSEG9NDgH2kLY
	tBJEel1JAUL4rQcIOwBWGe/khXL3VNZqeFTmMsu6RESCw0mqUl/FieZK2uQihfzppDG3hrVcBvM+O
	jrzWxGhV7hHtniLESzcqoiMJG66NS/nE+3rPsuhhsem591NOieIihxsstanMCf55HuFd8dAxQc8pI
	m1WiidEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFON-005KDu-W9; Thu, 11 Aug 2022 21:07:00 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMFOL-005KBa-PA
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 21:06:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id p18so17948617plr.8
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 14:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=DVb1z5kbBA1ujjv+xteyYloR7hoULhfIuEQt2vBqJwI=;
        b=pNYmvDNysYVnE4y5bj1U2pPQKZhnczdw1WnTDfu9aNj1/nEdGinf042LPTih/OaFlE
         V4h26+g7TJFlK35T0cyNlZpbfK3Mv0wvUrHmErAczQbmnLnnGvLm0Hdy7G2rbWhAY99N
         7gIzo5l+Uz9j7uJ61XUPc3O1uP3nlXc4IEic3n/xnfDrqfeKp78nopWEkgHXFENdgQ10
         17Pt9pzKV1a38XwgA1ZwNNdJR+L5JYcwLBZhYaCpHBw5j+E4XTkEUtGAaiWdYIMSE6WC
         kcqJCw04jzdvuHwAd4Nr0qPOaknSJVD+aJ8gyRtaul0GqOGYqX8mP6LvqkV3aYssrBIU
         W1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=DVb1z5kbBA1ujjv+xteyYloR7hoULhfIuEQt2vBqJwI=;
        b=rHXm230jqYLNcF9fMzNCSfpC1i6K1f1l0jr7T4hoICSoOJYj4krGgB2Kk9sdn9CcGO
         v0+WKljGUh+kvuaE0Mb9y0CvWyBnNSuWvSsZd2Bh0H3cHwSclu+lRLXIXVCXIwUHBkv4
         iLEZibuq2pCIjkShuvUKV/2pGC7PAFS6Is3O5x6NyuaLfIxy3I7S581Suh//Htn0+Bhv
         EHS/dfO+vwiVswn8gfyf3esH58Dm6gJNejR+WFwysApYV8H9eqkaYGwCk2aqgxmlvJf/
         2p4ktxdMTEd7ruo/AgmJluaxs1iq2RWFuKgzMrZs1/yiIc0VZoL9ry4jD1mI34V7lbgx
         GlDQ==
X-Gm-Message-State: ACgBeo2E3wotX3Hhc1ALKFFX6o9SpNbWEeJKhRyVc7P8D4ibz7Vmpta8
	Zd8AvK9mi4aGoRI+QhHcXmYKzw==
X-Google-Smtp-Source: AA6agR721/2w32bRDonI7TCGaPitO08W/FFsdL1xIehUgwWUxXReEgXRnl8nsgo7Emy01/s6+rWZSg==
X-Received: by 2002:a17:90a:2b42:b0:1f4:fc9a:be32 with SMTP id y2-20020a17090a2b4200b001f4fc9abe32mr10310074pjc.221.1660252015738;
        Thu, 11 Aug 2022 14:06:55 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id y22-20020a170902b49600b0016ee4b0bd60sm107352plr.166.2022.08.11.14.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 14:06:55 -0700 (PDT)
Date: Thu, 11 Aug 2022 14:06:55 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Aug 2022 11:35:28 PDT (-0700)
Subject: Re: [PATCH v1 0/4] Add HiFive Unmatched LEDs
In-Reply-To: <20220717110249.GF14285@duo.ucw.cz>
CC: emil.renner.berthing@canonical.com, linux-kernel@vger.kernel.org,
  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>,
  plr.vincent@gmail.com, bin.meng@windriver.com, aurelien@aurel32.net, w6rz@comcast.net,
  qiuwenbo@kylinos.com.cn, geert@linux-m68k.org, nerdboy@gentoo.org, jianlong.huang@starfivetech.com,
  kettenis@openbsd.org, sven.schwermer@disruptive-technologies.com, andy.shevchenko@gmail.com,
  davidlt@rivosinc.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: pavel@ucw.cz
Message-ID: <mhng-ac0025f9-3572-432f-9e8d-64ef87730b45@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_140658_064266_084FB701 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 17 Jul 2022 04:02:49 PDT (-0700), pavel@ucw.cz wrote:
> Hi!
>
>> This series adds support for the two LEDs on the HiFive Unmatched
>> RISC-V board.
>> 
>> Emil Renner Berthing (4):
>>   leds: pwm-multicolor: Don't show -EPROBE_DEFER as errors
>>   dt-bindings: leds: pwm-multicolor: Add active-low property
>>   leds: pwm-multicolor: Support active-low LEDs
>
> Thank you, applied. Not taking the dts change

I took the DTS change (#4) on riscv/for-next.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
