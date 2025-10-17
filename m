Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266E1CCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOydWOmYxB5myckgVabqQvAMHGNX2PFepwMT+79OK6Q=; b=rvF25C8kD0TSrW
	HWeSOBhS/vGFSUKbC7MNrm0fx8Br7RXRwq3SkAxIa5MBCkR8jM3SdRz7ug4BOEC38piWynn+pxAp1
	C2emrmQWtTSzq4H7B5sDc4Sk//ITBdIc0Wyk2siTx67bJg1k24+Bm9yIXqXR6oG14g1qWD+A1jyZi
	W9aQA1CRUv19U8BCSo3Sq2qRZj6mSv0kJrErSd2MOR3pwh3qDKgyD0edR5NWZvvnmpTKR97R1Mld4
	VLZkAlVs48oWlpfuKp2URf+cCuYM77TqClR83h4xwVasLBkSmLIBtKdsPZJJrY5OLRGv2uWHB9bXe
	a8al+Qp3hVqEc9BENXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mSf-00000008HuJ-0vLT;
	Fri, 17 Oct 2025 15:33:45 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mSc-00000008HtW-3i2Y
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 15:33:43 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-783fa3aa582so4221357b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760715221; x=1761320021; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AYDyBoqSGxp3sLQaIrRnQxkp9h8SmM+W9ExXpNQDIpQ=;
        b=jJpIuE3wlmS2YxTWe/cug7wmg/RYlErms2WDm48S9uetkT8ikd5LHbzfcr8ACJe7ZR
         NBmj7SB/Uo1iDwUI2wGbGfP/AQgddVSgLhOO0QzcLcy/Pd5vDbkyLZQOXvgcp0/mhFu3
         ZUxRqPq/BkGAr9uQ+S2ddE4BN6LiwR+4F1ty2TS0nwgLyIaVsmNiZNnqzwdSNknLA92i
         OT4QIrpEu0K2havadorP6MG1EpVZC0QFzRLE1RAEtHwpJ8oSKHDS8ihhJcTG84WQoX/b
         tPXREdnhiB9UnUSzJTgfEw+A8gO/ULvQiCgTPfVSmyRO+Zy7eSUWWUQAHN2dmLRJSXBr
         AOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760715221; x=1761320021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYDyBoqSGxp3sLQaIrRnQxkp9h8SmM+W9ExXpNQDIpQ=;
        b=XXnx2Ya7uEl8mAMsfiHnUv7au43N+u3VwFH/LGevGD+p1XHQS2KyczusVJDcERMSNM
         Xqv455Zzi72c/eEk7MYInQB5WUaCcHDTsDJgJwkk5T2qebWl+NAKLDigscQBeV3lqESi
         Lf1/evvUuv7bpj1MfN9fUOaRp14KPSD0On6bYJEdPfTJ2VCaT+mP+mqV8wN9LvN4+6KF
         zwN4lw1ovVOay8pWf8huK1cqA81UIz8pEV6SzdxoxHjmNIHRMu4V9IedARfxttZyBHQG
         TumY6TxNSXZe2xe9t9KTYeHuOjgXvx+aKlQanQlfrpH4JVD5yFMNzayhSfVMsj60V4e+
         oC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUS4ah5pitSpyXYrazSWWoKku/jnTgml5D3LnwdFtTVyt3YBIXtO30v51FQ/1eDKQhHrmanquKlfWL9fQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiMmKe5wTneppLaol7PMQVRkjtUQ4qQUBQjdK/ITAnXodZWVmn
	YOktPM4oVBttswFHaQ0pDNy5mw6HXo+f5p+75PYCvK6JrxZ+7zhgYQG2Y52moAMZkG2KbSp5w0a
	MTu1AWT9yImQH5+sbAoy7BkDNDJqXPNU=
X-Gm-Gg: ASbGncsoMCN02u4e3zair/rVavtkyuVkkbetP4TgKFVdAFfY3fK3oePJYNsmhdvlHQn
	c1PLb/IEQeyh+OclxNQSyzUa5g1YnS5802sOL0f7HAog53hTR0RQDI3LB4qU5Wu9psjuQU5drMQ
	7NYA6jkp67YJmlLDYH7NyMU4AisUnTT1tiqz4NhXSunaI/ELQynGEv9JtjIk/VnEVjZ3HEoSQom
	Y5bvMEuAx1QRgkUgKUwd7s7DWuZJ8nr/2ZhSQkhZXm3eJiSWvxmwkD7/iU=
X-Google-Smtp-Source: AGHT+IEO4gGGrFgVxNj0joSKzwqK7reU4snr2LDuZWleqTcw0PJZE1dEBv7ao9Zj2BRol9e9zJSHmaElOFROlCzKKb4=
X-Received: by 2002:a05:690e:408e:b0:63e:17d8:d97f with SMTP id
 956f58d0204a3-63e17d8dbbamr2676488d50.34.1760715221313; Fri, 17 Oct 2025
 08:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com> <20251017100106.3180482-3-michael.opdenacker@rootcommit.com>
In-Reply-To: <20251017100106.3180482-3-michael.opdenacker@rootcommit.com>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Fri, 17 Oct 2025 17:33:29 +0200
X-Gm-Features: AS18NWBsu3k9OEM7-rP5g6-76bcKbcZ1KDEc8v6XA3KbUIJDEMiQsuWyEbUxtbo
Message-ID: <CANBLGcykz77U_V4CqE7PHvtgmeXiKFo0FXy-sHHiAoZ11HnCjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] net: spacemit: compile k1_emac driver as built-in by default
To: michael.opdenacker@rootcommit.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_083342_923409_3030FB93 
X-CRM114-Status: UNSURE (   7.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 17 Oct 2025 at 12:03, <michael.opdenacker@rootcommit.com> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> Supports booting boards on NFS filesystems, without going
> through an initramfs.

Please don't do this. If we build in every ethernet driver that might
be used to boot from NFS we'll end up with almost every driver
built-in and huge kernels. If you need this there is nothing
preventing you from building the driver in, but please don't bloat
defconfig kernels for everyone else.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
