Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD1BC48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 08:31:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEECA6101A
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 08:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEECA6101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5f+nQlIrn3deFpKVyBc+SQbAhQHQzxZtLQqC0NP7FPE=; b=JIZ0s6/IyKvJpG
	gNSWRyC6xQPR6JFBq286R2q4m6u8hhauF/QQkMxPbovIQtkDGIBM8irFzbnyZuT6X3xxCtkO83THr
	910C2wkrCgaNtcY9Ai6AU9xFKpJMp8azv8a2nJk2F0jq1/SkV+ksZCTgFd1gH6uPPw8OQzPic7/qj
	W+rX3BjLQQXl63RCm6G7NFlyZFo5k7ZPVOmTKhMpXsbJgP+HzywUvQj0rok62CEZbcfGfy7bDgxVU
	0lZ3lCywn3c/AEIKt7LClP5aix6fKM3dpeXjNtQdOfbvvxAEYx75dcCw52CQgdAUCGqqYSbLVBtx/
	WctJzcifnBiSCXRRLlDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltQxB-005OFB-46; Wed, 16 Jun 2021 08:31:17 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltQx8-005O7B-D2
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 08:31:15 +0000
Received: by mail-lj1-x229.google.com with SMTP id c11so2654115ljd.6
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQWVokfQZgVGHdyHPg/yFmcebJpq41KrWGaOdOQKipI=;
 b=m0/Lt4BIjXjdpqGSJBLEKjOIX3eirzK2CqDEpDte2Sj3Gc7g8xgdCxCBn5e95uOn1v
 ydDh6KT8HjktRKBXr1sdmueW7V4AkYTsqPeNXbUVcW/kihKPAvf6QZEZ26aLyCwGCXrg
 B0NFEy2eKiuPOZbOScS8JT/qvFA26HvVb5TVNHXylkJDGQ+WF7lLmhyxfj0lH189yFUe
 WbameZzm/vatSMhg+KQhcKgMzrom/GUB5AQ4qAJPeNo2uMheV3oy2PfOEwlMbfyR503e
 S6lCpLduJS7PzOZ448xLpkvuUTIhu8BKQefZo9YXer3ULTU44FfVpVAeNhv+OXRp2LkD
 kCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQWVokfQZgVGHdyHPg/yFmcebJpq41KrWGaOdOQKipI=;
 b=mLtxpWYBPcD3i7lvE9rohmbCPie/IkCiz4f1tr5kmUIadRQ1TCbUWsmRUMe1FcE+Uo
 KOSE6F9JhnijZgbRkte1hDA53g9XqZ1hoLscIeNkJHNiNfsfyOHR/MZ3ipht22x+5kHq
 x9eIUkdw5BCIlQSCeBd3TePvfX6RLBqrTnSxG5UxP72FoYpbtZ3rglO/ztnZ3TxQUHaO
 pu8VRyZycuYsqtKJAvumQUM9ZmgnlC9WZ5wE0xRoHESnffCWzNLyTcZlO6zs1Pz0/SR3
 VfnPijxY+lSr1vNWdCDfLrI7myI2776JSQKXO3aYU6ay+iqUNmhDAA2dr4mpgjQao7Y/
 nIdQ==
X-Gm-Message-State: AOAM533V9RBC5SWZZE1c1vxv0ZEU65fx4SGtVLEkJgJC/Bnztxx3apXm
 cTG3iQU2oPQMEfIGQI4GhBsQPUsaDmuo8+GM9jdm6Q==
X-Google-Smtp-Source: ABdhPJzxWPvgV7p6eSpQF1eWW888O48hzZKsx5O5oRnUA6LyT2IOxPBYEipMULn1541CTP+g3/b9As5YqpuN8cY58j0=
X-Received: by 2002:a05:651c:1501:: with SMTP id
 e1mr3610433ljf.74.1623832272136; 
 Wed, 16 Jun 2021 01:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210615174911.973-1-info@metux.net>
In-Reply-To: <20210615174911.973-1-info@metux.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Jun 2021 10:31:00 +0200
Message-ID: <CACRpkdbwLOOT6nuhpkT5x-AZVipsD2qG8Qu4xoiRotHQNknwzw@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Kees Cook <keescook@chromium.org>, 
 Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>,
 Tony Luck <tony.luck@intel.com>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_013114_486582_C5B8B990 
X-CRM114-Status: GOOD (  12.89  )
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

Hi Enrico,

On Tue, Jun 15, 2021 at 7:49 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> Introduce new GPIO driver for virtual GPIO devices via virtio.
>
> The driver implements the virtio-gpio protocol (ID 41), which can be
> used by either VM guests (e.g. bridging virtual gpios from the guest
> to real gpios in the host or attaching simulators for automatic
> application testing), as well as virtio-gpio hardware devices.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

So now there are two contesting patches for this and that creates a
social problem for us as maintainers. I am not too happy about that.

This situation activates the kernel management style document so
I advise involved parties to familiarize themselves with it:
https://www.kernel.org/doc/html/latest/process/management-style.html

Can we get the discussion down to actual technical points?
We really need a virtio GPIO driver, no doubt, so if everyone could
just work toward that goal and compromise with their specific pet
peeves that would be great.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
