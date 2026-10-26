Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C9D606A31D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 05:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jIW9XH8O;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AK7G+DJI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bpdplALW8gu6qB19jYQ2plriYsZuTyGY59QHqE9MGhg=; b=jIW9XH8ObZwsbnpGh5gqtBVKmh
	0TBdIObEllFBxtdy8CbUcG1B12wBMyOqHntriD6FvhDNDpTKcQKzCO6Co0MpLrqwuDz/4/ulrMkOM
	UaOE6ma6iVtvxqVrNZaAgHwVLh+WS6VWqIfxepHtX/jSljWraNsJijbnl9XP0ePCa8jbB904qHpvK
	tN2fRz92nOfD0Qw1utE4dfF1ZFxjwwzhG3A0HMvhgKOp/+wL1KLSCCmFU8fNz7QoGUO3EZyequOxd
	VIoMHuufeaOeRptjLRjp/HnnLPh0/+IKHckWDgQPYPe0RUUE+7TtxP4tZJUtwaz1ck1cVecHJ7H4n
	7YfMMf0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDVe-00000001kR0-26gn;
	Mon, 26 Oct 2026 05:44:38 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDVb-00000001kQf-37RL
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 05:44:36 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1220112a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 Oct 2026 22:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993475; x=1793598275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pb4KDmZUh437ZZnXb7B8ESYwa24YJGu0HgUrWTWCI2k=;
        b=AK7G+DJIqPUHAQv1pJXBHPPYPKmAFxbW9K8Hq1cjgHBaQUkRs9p3BFgvfzkdo6NQMW
         oOdQrhdThNDlGA93jtUtOlHPxCEeSjx7CVrBKNWIhS4po3xgI0qyPnojyS/eQ3l9NGq2
         +TY9S93cgJWiHlI65pjV+aJJA9zZgFqSibJShyLtu49LUO5tvol9RQQVn4jeDA4mYMOq
         EiajiejHi6Fb9CvAK3g5/gmdWDix2AlIKzUVfavB9fyxNw9W24BsyoJY1m/iIYppOUxJ
         SKtMHtmB4upRcx1Hav9PFZll10fskwiDXomeSHnNVsPpWwkwaUjHVbqbR1y/iErDaXTM
         h0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993475; x=1793598275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pb4KDmZUh437ZZnXb7B8ESYwa24YJGu0HgUrWTWCI2k=;
        b=QUHVwbwHUg0YVBZUYkgKMPuICUAZ6y7iRYaElfRqxkxKLbfSi7wmpM1vTnNsGz5iuc
         KBxXyMR4kWAeeqh+PBOnWj4ZtJJcqdUw1hpU/fP2Lyv0L+t4oxbWhxG11XIWrAvai9kU
         PmSrOOAsclIOjkyvds62n/BgznsOyzgHtPCbzqGkj84f0qjDpu5+ZRmNAh9u5rFnvZGo
         6xUkWXZxsWolu6LtyDyRqRfbO0V9UVw80urBOBRBri7qYEqe/uNKuZq4dYXDh5WMNz+H
         M3qAb3y2oPDfA64KsTGMYnupBElKg344msKZto5rZxKORPH/ICIOqaatSnc2Ofsz/ZfR
         NsxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXrosfW0SKCxzlafpjhB6USv9nOGXQjuj05nJ141kQCk6ZfyjAO4gDY6qnR7GdnFRsBb0WoLybDAj0cQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJY4WknIuvhWUo+iV6icKNYziQmjVpZM5542uoQR2cfVN0mH5FY
	T+ZgXxdXhgC9qrXozJmDHlLWeSxOw7qvGiJFjMgJ27VgPsmrWWPtXF2m
X-Gm-Gg: AYBFou1gp/fe9vbPfbd8E6Nz9VpVUoEEnYwGashWEVKOC0AeNmGlVqKu6A9UswUB4Xv
	DTZrqyEednTXRQNVdeFPI5oRdU/NHfw33dpL61rc9KCtvi/u16AoxCSZcvzOLtQdNk69fBuehWz
	HjF10PZygfvGibssyW/yu3nFZAyAXmoQUTVkN6eO9tjyBpQjs/IdZ7kZgGBFSAyXeI4owsZVF0f
	tyI0p72krJzt6Ml6n7GYf94yW7m7+fkoZ50vN/6mVDB5TBOPwnS+frdeRcyo3vLi0HfJmC3JAhX
	QGbkK0Fjp8UtJs/Ah5lasD7cgNyTf7EJPTjy++Y5PGy1zAkav3iaZ5ij/sDiRhjh9v7k5+Nv6XD
	wWYbYJNUuR50fku9Q6jn0tmL0JpiNGSPX1XsRID1HlS/PDdqHlBVu6wnGibuWQZZLJayuCMJZIA
	+p0u7HTReABRXt2+7OvFYJFInn1oPQV+UWki5uPBDhPdweMXHyjCsTWL+uao+vcdNDFiYDM0ib2
	Zc/sbYuq7+d3e+77JJYgBSPEoM+GhxBMhHC3eDBAMXkZT+UiYl023oMvT901x1kFPCi+fAML6jF
	7f5f7taiN+lFmnhWPGX9NM0C8LRlTfjhoYbDtq/fAo2tVQeqzKTaPMhpCOScxAyMWmhdxYxeSi4
	Jk+3SRymk78PFiMLWl9Hn5LOFwr3/y+7+fJs=
X-Received: by 2002:a17:90b:250:b0:3ae:2969:903f with SMTP id 98e67ed59e1d1-3ae29699194mr612839a91.45.1792993474829;
        Sun, 25 Oct 2026 22:44:34 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa53c3sm6699893a91.13.2026.10.25.22.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:44:34 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: dlan@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	e@freeshell.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Mon, 26 Oct 2026 13:44:27 +0800
Message-ID: <20261026054430.557499-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANAwSgTiSiEfdLD7yUwcbFnXfRpnSNZu_GXLnQnXipc+ansnPQ@mail.gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <20261024092558.143621-2-alan.tseng.cs@gmail.com> <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com> <20261025130206.187282-1-alan.tseng.cs@gmail.com> <CANAwSgTiSiEfdLD7yUwcbFnXfRpnSNZu_GXLnQnXipc+ansnPQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_224435_804823_A79461CE 
X-CRM114-Status: GOOD (  15.56  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anand,

On Mon, 26 Oct 2026 at 13:38, Anand Moon <linux.amoon@gmail.com> wrote:
> The main issue is that SPL_PINCTRL and SPL_GPIO support are required
> for board bring-up,
> but these options are currently missing from the U-Boot configuration.

Thanks for the log. You're right that the SPL can load the next stage
from a different device than the one the BootROM used. In your log the
BootROM boots from SD and the SPL then fails to find the SPI NOR,
maybe because nothing has set up those pins.

So tagging the pin groups of the boot devices makes sense to me, as
jh7110-common.dtsi does for its i2c5 pins. I'd do that once U-Boot
enables SPL_PINCTRL for K1, so that the tags have a user. It would also
go in the add-on patch rather than the BootROM one, following E's
split. PCIe and Ethernet I'd still leave out, as the SPL does not use
them.

> I am following the approach used in configs/starfive_visionfive2_defconfig
> to keep arch/riscv/dts/spacemit-k1-u-boot.dtsi as minimal and generic
> as possible,

I agree with that goal. For the regulators, I think the board files
should use the names from each board's schematic, and the SPL should
find the rails some other way than by a fixed name. Otherwise every
new board has to use the same names.

Would you like to send the U-Boot side (SPL_PINCTRL/SPL_GPIO)? I'm
happy to test it on a Milk-V Jupiter.

Thanks,
Hung-Chun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
