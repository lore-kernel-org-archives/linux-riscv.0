Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E417C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 22:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m8ULWAabZIJD5xwSnTljYYyIcbOa/iRZmROq9Z96NaQ=; b=3pNezyE9TXRzbu
	9Q/N6HbGDFCBvV1CUhiVc91ygJgIK/78P51LirbFd9flrrOKGiXTE1Tcmn1fd7gnHfv0ZKlMLstJC
	9l5AQjeTuNTnvAa73e30OHYgwXt5azMbNToYMRsyWu12BODrJCE3DVbjohTBbRMXscngVltrzjl8V
	hU8rlDgfp3AnulT9pI7Q21z5fOFuKt5X/RUex5Ug/48cj8BZOqoNNmWOSegcno0p3h3YGgiN0DNq5
	T02N4nJ6B4Se7F6wFNCORU3NeQ95enQlFnF58SYt8pRD2OySjnHZKC0UccjtNm4JlOhtYz4DL0DaL
	UKoYl+1ncJMcf+trPRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQc8x-007owf-GO; Fri, 10 Feb 2023 22:45:23 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQc8s-007ov9-P9
	for linux-riscv@lists.infradead.org; Fri, 10 Feb 2023 22:45:22 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-52ee632329dso13696737b3.6
        for <linux-riscv@lists.infradead.org>; Fri, 10 Feb 2023 14:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C8zbQ5UeRyMGBzBZKt+eKJGEp6xhDoMWS6ByqtAI+qQ=;
        b=jQ66+heze0J6Ozux4oG4WwoV+2CsrGPIRzg+v+qWUt4V83/YkynKLfwyVpYb+1LWaP
         dPW+6PSP90qh1UZoiGZy855Nf6gP2UwsCAio30PTEy4a8ujL7chBJ9yn0b++wrXuI0c+
         O1zVLv78LwEp/tzHG+hVFbN+DyHr4mAcv0zuwNizBDOhrrkE7Ed9hCnPLTZ9QDOGgvpp
         PNQ51xkGp2cOp041e2sIipfx6dTL41Jbck530hz0dmBsuaiwp/P6QznD6xUh2QbsTp1x
         kxiHqPlVnGJ0PF4Wy3GubcS5OpPTubUhMTtkjwfjsnrRnHKlCzvUFnpCs3YDG0/xXD7/
         zssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8zbQ5UeRyMGBzBZKt+eKJGEp6xhDoMWS6ByqtAI+qQ=;
        b=8Fy26P1cOKFEu0icLDePTn1n/H3dQ/65oogggA36T/0IHnAOpslw8OMRJdS8FkMjA0
         NRQNVK/+RpNOGK5ahd/M+aSvAsWGdXDmtqz1F6+FZ0m0dmJqDZ3VVyfYoc/3n+OpueBA
         NGcikjpSdYzgnYysRSQ5dtrcKQMTct0h8QvZyCatMDr9UIYijM7THDnfnD2ZidRW37mW
         T43JUfFljali73VVfH5YlYF3WTO0E0bBWGYnpY+1I/UHkh7gVKgTUGgdunHIx6edS7X8
         zT3HZXmJNv1z0KBo3aZTWETzsux9uGWqa1PxGpXUmFFzaF93jLsRqbVe7xxWDHjaSiaE
         noWg==
X-Gm-Message-State: AO0yUKXUs5Wlhl8w7dbnWfug5ffz8iYyRFeIlGoiKPAGjqtLmTvNo6SL
	aLHtsNqk0fRXkATsDldQJAhgCQIkXJy2r1v8lfYQ3Gv5zDaNKg==
X-Google-Smtp-Source: AK7set/6Xvi8CzuNgX79rZvneMkeXDi2US6l2P8G1w1iVzuJBaisym39eN4L1EuUt3tZClsyw0XAtI+QRSxWibIX0QQ=
X-Received: by 2002:a0d:ff45:0:b0:52e:e6ed:308c with SMTP id
 p66-20020a0dff45000000b0052ee6ed308cmr61064ywf.524.1676069117008; Fri, 10 Feb
 2023 14:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20230209143702.44408-1-hal.feng@starfivetech.com>
In-Reply-To: <20230209143702.44408-1-hal.feng@starfivetech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Feb 2023 23:45:05 +0100
Message-ID: <CACRpkdbao9M5dMHFO_QE8z4_E6DZLZsMUW1OnUNjKSfQc59=ew@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Basic pinctrl support for StarFive JH7110 RISC-V SoC
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Andreas Schwab <schwab@suse.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_144518_847785_11F8DE1C 
X-CRM114-Status: UNSURE (   7.84  )
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

On Thu, Feb 9, 2023 at 3:37 PM Hal Feng <hal.feng@starfivetech.com> wrote:

> This patch series adds basic pinctrl support for StarFive JH7110 SoC.

This v4 version applied, the driver is in good shape and all bindings ACKed,
nice work on this driver!

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
