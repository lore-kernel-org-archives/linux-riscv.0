Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A624A606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 11:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gok+VFJ9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RrTCSaQa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GqGmb/OuIw2GEsOVdH40P7/7WUr8l3fgnGDmcjFz2RI=; b=gok+VFJ9ip/oZInCKReb8+V5/v
	BhL0gGyodaTyOuQqkpBIKJ57SZ6WlQn4+3zwbQxB77jW4/z1OwRha28aaP7VviKnfRhQMqQXuJ/3a
	DJpUO0V1jm2ykEHFDZpVecd7Gc7Bk9+liU+HMrwZnDp9k5efX4JjadZ0XqP0Vw1a0o/fWS0IZz10o
	ogmF57R6KGj+hX5i0PuQPQWP1NUD//0BrQBXaYZQWY5l30tWyg8aSKIFew9+Gf+TiZBI3Io5BYNzF
	XF7LSlnFnvDtB0JpWkYeMjLOQDqZWCyayGQqDVsTXBlVdFSixCSIZfz9PwcpJ3tgyyvTeco7YMEiN
	SotaNCqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSBk-00000003All-3POY;
	Mon, 23 Nov 2026 11:26:24 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSBU-00000003AZ6-4Bph
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 11:26:12 +0000
Received: by mail-pj2-x0a.google.com with SMTP id 98e67ed59e1d1-3ae93a86008so1736496a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 03:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433166; x=1796037966; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
        b=RrTCSaQar6O56fzuxWjeQSklERoAKUhngQD7O1+a8nT3mgEj3FRJjEDfflDlGjh+ym
         M1hV3IclYwnWbz/earbxFj3o11aCBjsRJslhTGGqznI2TQhpQ05YjnLsWLvHFLWoYkU1
         onL9LbUI71g+hJIH04pXS80OVmQf03ujgcAJd8xoZzyM4/RAgXwBKgpbxpnbfKEUi07B
         swTwGZZFByWHf4WMbtiHZu4/Av0rioEN7proTSkp+SPrZFYFQ+4d2URFFHIFLLg6ItG1
         9ddnoWxPgnotv/ixb8te8obtmG6NbEN7DbN7Wp/o51FMNicXZFeh06sKgyMKkk3qMSHq
         crKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433166; x=1796037966;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
        b=gVmI64dL/Crv1ruwOZHb2+FcoRdgH0aXYogwK13HG8ksLZ+0f3iuqijvplVxzNN5MY
         fLJ6m9rMHaxfPuHAdkG2V5ihwABP2SMmt+itTutiUuhk5hVj4iRPnuB2LmbBS2+z5Kg3
         4KXheJNQ7eVZOrc067MLw1WNgWjtwn28sAP45EGep/gp28FHIljiBPhK7krvpLDMxJOV
         1ubi7m0N8AxFktXnJb5tG6ozCgVXzDenWJ0r1dTQpWQPULgnMqtNgy0mEm2YxuJgQ629
         DbOpzFaeHniGFKR0pM5ExwwmWC8ZB3WvNuagPmexgleFycFAN3e2fsXxP3HptJU7G3Xr
         LWcw==
X-Forwarded-Encrypted: i=1; AL+hErHqP8BHkK3y87vWfkEaTp3ZhF7QyzdU9n+Rc74K3KASRAij/ZsI4KNRkFSKRknH72nrj3CTmLHQ68OMxQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+O/49pbOxR4NI83qYtTNxyOnZeVrV3F5ihiR0c4nOlmcThV3aq
	acFyy3SknvPptR51zBLeV/BUHDSLfFKuprYsAdom27TEF82P4rWnNczo
X-Gm-Gg: AZFdTZcoPs+YWU65Ku8CyZTYiqxa1O/nrFJEvrVdbPWSpYQDzmYY4Qy+cOk3+VQMzWv
	NwLS8RQRop9ghfkw0AqcLbn5dJ8ABBnOZ0QmhD8NueF/yTX6vM4PkVmeJzGo3dPJziLcoUOMor4
	fK5LVc4XUXvV2BIdUyxuDVlRxs7lrlhkkig5ps/+auVACyChk1LxjPBDewpdhWWpcT2frwT+SwX
	y8k0YGj5xSTbAXrZREy7/imfYlxKBaaGAxKp8Q1LXoZVJUqZDjfX0cjwz69x/MoPGKjQpB9QrVZ
	qoBG75udlbn3cyb3xFkuUFtlUGlx4AhTO9tHok+rlHphdcwIdEkU0SwGk9fiuttxqMmoLI49/s7
	YtnG8c0vua4v8G6Me58Dw1xvVzJLDWL0PS967fc24LcaTf1/sSvTJPXS+p+4cjTF5Q2dGpkOONI
	QdkRfakv6cv0akK89/gfFYy1B0Euw4IGyoVKGEobR6oSso7ddBpziQoH81mqGqTOv56Ka+56L5d
	3bxOVuAPmxyA87oQOEtMWCLX7Km4wYYuWPgNuYzs0fl+j3GGWVD9FHHnQoFfIImqGu7G+5bGny/
	hA1uGUFClMd2JvySKu8RPQ3nEuW51IGwvVE=
X-Received: by 2002:a17:90b:4c07:b0:3b4:f92:ade7 with SMTP id 98e67ed59e1d1-3b41cb20eb8mr10517519a91.52.1795433165943;
        Mon, 23 Nov 2026 03:26:05 -0800 (PST)
Received: from localhost ([2403:2c80:6::10a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17449770a91.11.2026.11.23.03.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:26:05 -0800 (PST)
Date: Mon, 23 Nov 2026 19:26:02 +0800
Message-ID: <f5c6f44bfb6040289653cdc079b1cb2a.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3 10/17] drm/spacemit: add Saturn DPU KMS pipeline
In-Reply-To: <awPxPHpr4NYxqdmf@houat>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-10-ec419e8e96b8@gmail.com> <awPxPHpr4NYxqdmf@houat>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_032609_126905_81974872 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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
Cc: Guodong Xu <docular.xu@gmail.com>, Yao Zi <me@ziyao.cc>, Michael Turquette <mturquette@baylibre.com>, Sarah Emery <sarah.emery@canonical.com>, dri-devel@lists.freedesktop.org, Ze Huang <ze.huang@oss.qualcomm.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Jerome Brunet <jbrunet+clk@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Thomas Zimmermann <tzimmermann@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Brian Masney <bmasney+clk@redhat.com>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>, Dmitry Baryshkov <lumag@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Maxime,

On Mon, 23 Nov 2026 08:55:40 +0100, Maxime Ripard wrote:
> On Sat, Nov 21, 2026 at 03:40:49PM +0800, Cody Kang via B4 Relay wrote:
> > +static int spacemit_drm_master_bind(struct device *dev)
[...]
> > +	drm_mode_config_reset(drm);
>
> You need to use drm_mode_config_create_initial_state().

Thanks for the review. Will fix in v4.

Cody

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
