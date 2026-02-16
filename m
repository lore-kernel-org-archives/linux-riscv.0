Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD1AE8383F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 22:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQR8d6DEvQezgcW2TAeqnqc+3xXI4OUlja1pQUqkygc=; b=dKhucuccAHWMng
	MHzHGSnX4g/lv9PiodO/HVp6I9c20IqLqrJD127kIlv77ddtB/4X6mM2ThUjir6SSsh4qHhz3JUHh
	zvP8bmW4NfuVCA3irqBxphmX7AEc6vo7d2rkSwZqzcKWemCFPKPGHyrG17YBO06Tc1Tcekq73wPTW
	4KR2RkDbDkQMbEJZhFmak7+grp4tV0LKq3FteF5jfpT1LvXUD7sNWefBOXXhOK4hnc7PwZMFlz7sq
	O0RYCIJEgjZNwQlWYkCKv1LrKTjnwds+BBZttEDGioAx2iHbfpOBpYI0VrztNv1ET0Z9l3taDVmR0
	+DtQk/154goQAPJ/R7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6pw-00000007KR2-3SCQ;
	Mon, 16 Feb 2026 22:13:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6pu-00000007KQN-3Yfu
	for linux-riscv@lists.infradead.org;
	Mon, 16 Feb 2026 22:13:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48371104ffdso5543915e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Feb 2026 14:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771279977; x=1771884777; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=15IPpReMOhWnQxE4O6qiiwyShkxCXyUxYB3ay6FehAg=;
        b=M+iE1hZ9T9EQApGTxQg1orZxYaauY6vpf0cEYGv7oa1H2JdBWMdoAftwMHqJ3BqRUf
         dHWQeoqh+0MGLYT0mHNdnO3Q7PJwU44Po3sr9XbiRTHU25RGzmCy/55v60CBIO7gRl7O
         N+yvcV3PaPLsjBz5qmMROK/m/Ng7vY3Gtc6MZtVXPadZBCOKyGHeZep9Lonjw+c/5o2+
         MQ+zMN4xa3BmKr1Dj8YtgAmyc0pVWyF8O6bP84nLhlgSWRZGsPo5o3ZCI9Ry3WZT/OO7
         MhZ+hwc039YPaPOTePn/JpD2VUNjQn/RAkz9B3HDfLzwRiQkS1FJPtfYFlh/7MMOZphh
         Iw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771279977; x=1771884777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15IPpReMOhWnQxE4O6qiiwyShkxCXyUxYB3ay6FehAg=;
        b=Tj0q0NwZGPQeGUbdUIrePhPSA0PLIE+2kHdy4cMix2bwxQpbRO5xwLi2tgkMAANRE+
         An2WoHuSalwSAUuFHZIruVe/f+h+i94hVceT2KRhHy410ftJAbf/+HHkmo6obaXtVhNL
         8pG43IvyWmHWD1QjQdukDx3n7+74ZY1tkJEaEMDi55t+Sn1Y1vhYUmHNBPGB7rbrGRKO
         wnARJ9m33j6QxB5PQ5JzF3JWGriOaMzCyK1OlHGA2nViycfaAX3sHsuL+4S0Qrwmn7PN
         l3oiAeWbBNNn+tYUO8zWsXpWfceZo98l21flhGBVeVLISBSokaQN9OgLbG3r5NQe7g/G
         +MSg==
X-Forwarded-Encrypted: i=1; AJvYcCUAVNlw1B1zbt6RkLeuYpw7xPhde2aAzFsIQ+DO4DymIB28dVxC7R0xWrHljcRbDW9KRpMENX45Bp7Cjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUNazfW++K4ZkNPtwlS/sSO4bMaHwfGK1UKHEyAtMzwHY7cKxF
	hM+U69uSZxsQpKEvNvxoMzpoFBgsuXYa4rxLGD6n4l/r4DMGNaLiYKpJ
X-Gm-Gg: AZuq6aJbfxxkXvZV3d2SQhqJUEYCo0A/jN9Y3zsNa80rSFEiFdtJw0VKzlGkR+5IU2a
	74pTfI0iMrlkXcoJeL/je+/ox2co2VigFUezwqQMusRHbpWj90ywzsVT9jDVa+RDEuJ/MyNgsAM
	jEvssAcmQD9/tExLWJ6cMnsuV4gj50/NYgrXPVkDbJpVpd3q4Wzjqcg5qHdbd4GzU+SrwwMz9je
	YM+ApA/szIeZUOljGu4woCp6McAoxoEBFN+erhtpt4tMJjuPeObg1spAmry1dwA0k5EL/ROZ+yY
	vd+HfZqLPAzR6TY6qw3JAl5F58CR5ZOa68ihWp03P+YCUpwszAOwOugBc4mGNUdNl9T4xvmy7Ip
	YlvdVOWsKHLMB6g17KwgAqigOl6HXBkCez1Ozh541g/qgSRh1pLMTO9Uavjasy7CPjXznZ2Hl0B
	fV2iqmpnhdiNHv9ko=
X-Received: by 2002:a05:600d:3:b0:483:8f10:4bc5 with SMTP id 5b1f17b1804b1-4838f104bfbmr11005335e9.4.1771279976748;
        Mon, 16 Feb 2026 14:12:56 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:ac3e:d4d0:5059:7047])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e327sm460068605e9.14.2026.02.16.14.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 14:12:56 -0800 (PST)
Date: Tue, 17 Feb 2026 00:12:54 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ze Huang <huang.ze@linux.dev>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	spacemit@lists.linux.dev, linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: k1-usb: add disconnect function support
Message-ID: <20260216221254.vmd6jtpl7r4rtob5@skbuf>
References: <20260216152653.25244-1-dlan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260216152653.25244-1-dlan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_141258_919973_F87EA731 
X-CRM114-Status: UNSURE (   9.38  )
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

On Mon, Feb 16, 2026 at 11:26:53PM +0800, Yixun Lan wrote:
> A disconnect status BIT of USB2 PHY need to be cleared, otherwise
> it will fail to work properly during next connection when devices
> connect to roothub directly.
> 
> Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Ze Huang <huang.ze@linux.dev>
> Cc: Vladimir Oltean <olteanv@gmail.com>
> Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>
> Cc: spacemit@lists.linux.dev
> Cc: linux-phy@lists.infradead.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> Change in v3:
>  - split from v2 as bug fix
>  - fix alignment to open parenthesis
>  - http://lore.kernel.org/r/20260216090112.n5jjpui3luqsybb5@skbuf
>  - Link to v2: https://lore.kernel.org/r/20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
