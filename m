Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B9DCCF2DE
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 14:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=up4cet5dG2RzxVgxozX8S20A2q+1GPYUJjChGs3xx/U=; b=VNFbOUFtDTo2WL
	T0y6czNTfwagzFVmTuaciaGO8eHQNBAnt11rGJ3Qk5EeVZPLYu/myonQDfRSMq7dM/cKdDG0q+HfV
	UFtWguH8Ae3NaXyOZ6Cti4CKwjw6jwyussRgdIBdY7gImYdw38DGeP2L3fiX0OqLjkk3v8VgJbN5l
	vYamgHTFXhRzoNp5V5tvL6vT7YsN2k2wdwXs3atLRhLzFth7Wz3vsYWrTnbhBrwSHmatzYW1NJDB+
	feSvRGK9+VmuXJ6CNvi94f22IbStipLo88zExP7e98wtAU9XZ8I8ApatbNsLjgs2KEwWgXyfcrYBl
	BVzaDYVbPBD/qGYF7hNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoBd-00000007ivj-2Dud;
	Mon, 19 Oct 2026 14:18:01 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoBa-00000007iuU-2ivb
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 14:18:00 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so622822b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2026 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419478; x=1793024278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEkTb6R44VHT7GxETUcQDEgxO+rMUGdHk6yjf37a7BQ=;
        b=qneihJuWudJsjN4xGmeOg9KWYRU8ZZnTrTfanaRtazcqLeVBsrAofNYX/4Qx2XA0Ux
         N7uVLREp8xN2ao8JIQUqpkxSaZAnF9GuoeruEpdXPoihPwPQFQw0IDyZL4sCenp2Pods
         Ud3P71dTzAjvQopYl+FCmFRfA+/Xn+HnKKe6CTt/07sbtqUyspVGjzdkuQ72JEA91xq9
         WXVz3cIpMvcrbwEFyOtLTitnvAN+3qAd6md/oBNU6JeuXFy5Eg9LkfpLSIXcm6Jb6h2H
         OCToI5iB+MFL1dC8udK5TeNuX4tYgQOiP1KwlsTmMTvqDjI2YPVj97aSBXx1qGsT4TDm
         /e6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419478; x=1793024278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gEkTb6R44VHT7GxETUcQDEgxO+rMUGdHk6yjf37a7BQ=;
        b=ohpkqIJRqW8+DpLzegqy01EQcwQlpFpcIEEddn25eXlx0rR+e6S4HmVPZx5cZzoLNb
         7u7LexuWJ51vgZcply0j9riQX7nx0SdFRbOQVRPHEQouPtgDLF7MLs/hP6fVwlImHADz
         TxtkKiz3BTiDOCm0bo19/yjOVcHYETm7tIREWtWAZR86MeiMDjElZRv+tQPHrJBXVkkv
         RPDVNZOjsoAHneI4WGdcawZvg6nal0Xh9IjekYlD+KJsunxOmcZ6cDZyFHWFCAFHspzu
         xTXFpbcG+951QzzFJ82iqsXMNMcS10Wpqn0zurtm5P8rLvTvkZDz4nm655uln4ijN1ia
         lCyg==
X-Forwarded-Encrypted: i=1; AKwUvByRpHi7ZcurHQKyUmel+l6iCjXqMxBazB5xDucQQaFGBKu4IxIzh0slHSRU0APPHn1NJw5b0885k9YqPw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKkh8ugiacvpbr3IAuYD8kQ06KBUxjHkk7L5WdcBp8aUhLKdeo1
	Q7IeXWAG/bb0Qdx43Xyj4o3HxxuF4j+N8jrXcAueUh1fB4K49ukjm99g
X-Gm-Gg: AYBFou2QOD8Fuyerqb3yn+3s3jL8JZcySA2OzAEHgg/B7g7cMTA3WpPFd08c2Jz3Tfl
	6uB5WCSOYPEiqPEDblTdjDY+9oZBiOjNkaUgczdMA6XDj028L96ytbbIfqqwBYD5/aM5374QZ2l
	IK9rqehaijjcJops1KPa/iwc7B9cuBZCyyd3CeruCINmkrPrgfbZEkO7w0p4s8pgC3RRjcgH4Zy
	N5OubzXU4oqd4k/fMYWzvbacEfsgZzYUJ4FLg3Ntwu/ui47SOQPfNzzCYskjqJTcXXt2fRTriCX
	BKWCD1ym0Y8R2jj7XMAPRTTiHI29Odq7W6a0JWU9wh67WTtse5x1G8anyshOqoKtaqz17NwvNs6
	91LKVgRAHj2N096lAztZ90MaraDIhaYW/9nVeGOWzFfDHkLa6XJ9ONvAX6rfDq2d0fALdXtepCX
	CjNdR9vK8CYQSeAg95adAXVo834j6a44ixl0bsbTYNOrFOuZrZO/0EQIWsESk67u9p/AopSL5cf
	PZewRit6/XdrMhI6T7XoKTJkqGaBDHD+XbWvckC4IGbXbqEe0GqfksSMbGvOfthaRsCnLsfI58s
	g2L1rAz/SA4XeVainK2F+26HuIypWtltLgY++kgg5YhZsN3HHDL/NQ==
X-Received: by 2002:a05:6a00:a8f:b0:89d:af47:905e with SMTP id d2e1a72fcca58-8a04cb096b0mr5594670b3a.25.1792419477810;
        Mon, 19 Oct 2026 07:17:57 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f8aa31341sm3825523b3a.51.2026.10.19.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:17:57 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Mon, 19 Oct 2026 22:17:48 +0800
Message-ID: <20261019141752.2077207-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
References: <20261017180141.3477743-3-alan.tseng.cs@gmail.com> <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_071758_956817_8127F9E1 
X-CRM114-Status: UNSURE (   8.29  )
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

Hi E,

E Shattow wrote:
> Does BootROM configure the EEPROM peripheral for access? If not, I
> think the justification is weak here to include this.

As far as I know it does not. The EEPROM is only read to tell the
boards apart, so I will drop the i2c2 and EEPROM tags in v3 and keep
the PMIC, whose rails are set before DRAM can be brought up, and the
SPI NOR flash, which the BootROM can boot from.

Yixun, is there a public description of the BootROM boot flows, or of
which peripherals it sets up in each? That would give a clear basis
for which nodes to tag.

Thanks,
Hung-Chun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
