Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B3A606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 04:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RGkYaivs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gygBdelJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KofTVPb9uo344/CQ51XVu0qoEBf4tKeCFXZ1tOK1iIg=; b=RGkYaivsGG/FeO8wqxR7RXDt+3
	6LWddJ2GM2As6qLEl1HodHenyroSDdL7V6g4ox7Homd7OpFtRII6BTtfWKK2lPQJvT+TK0x6EFkXl
	7Kn6u3puURinVPpc9TNJl0/TjnS+StKLCjLCMwpFEk9sZm+SyVOgjfa+F38UYOfDRjEJ07yeNzO8O
	jNlagFPoBII8/OwbjSVq2XAMTbcAJ8OiI5ukvbm0SvGBc0RO67XhttyeHtOsTPcnE91tHEmNIEXpL
	ixir2JyzG1CvnEJOrAUo8MTmjRFFOHC673+E5tcYXwIiQlPPH9uRZOPdCJXpjw2hTgDbJv272W2wp
	DQQ/awbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR09t-00000005dFb-3UHy;
	Wed, 11 Nov 2026 04:42:05 +0000
Received: from mail-dy2-x0b.google.com ([2607:f8b0:4864:36::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR09r-00000005dEu-34PT
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 04:42:04 +0000
Received: by mail-dy2-x0b.google.com with SMTP id 5a478bee46e88-377157fde7bso20930eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 20:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794372123; x=1794976923; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
        b=gygBdelJt0YZEtcwZ0ZTsr8ykxuGLa+V5nKduKzq7cys3BPxXzjd8aR23DE/kxwNmD
         A86CpxgXzfZNdBtz7NbMA+9qoptot0Sc6+2WaS2oB5619plYPFyV4MZbx8Mm6MFTdIVK
         8w/mhSHEslzuYIOfRL94uwQJ5TotrSoMlrSQS4WASZgiQxAIWAsWeg1seDSeDDkcee5u
         qUjszygoNc6HSg8ax7wR9lPdv49wgmmKd6GY7kOQjrVKHxIjzlZF/ru7LyIDSweevJ51
         vVHMmdLKXdhGSOyVCl9oWZqBepskMc5Ol/TadGku/DvOAAY66G1/ZZ9mhm1m9k5HhhTD
         Ev6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794372123; x=1794976923;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LBWMkcN1tef9AYjk2Bp3If0hhjn0Q863wdyvj1dL6Dg=;
        b=UAY8oCOsDhXp1XLry7VWAugdHDp5LnxD9zzF6TvxmGW/qpQa485m30OUwgnEGlNk85
         U76ANkEo/Ecldn2pdOys4JvfXdNEHwTAlqE4BRbfmDGA327eYpffJZ0eVf+72SbuUsS/
         e1t0xIUw6E2WIq7paZHfEyuO1YWyWS8MhapasElhiUHfNysQtnI9bGCySmyq6ga+C2o1
         e9B9SvHW8ZDX7KY1udbIKLocUJUzhYa+LRi5KUyKqogWTxMJiIgVBs+108cyQTO4kko8
         QcOrT5115pxIVkqxonMyqzewgacQ/gBZX3nmBMB0xHsiRAfSZd01ixG7flsd6MXD8OIM
         QYIw==
X-Forwarded-Encrypted: i=1; AL+hErH48REbsMQv0+PEEW7024mOrO77nmIx9joZr1oopT5wdNavZuXfKv51x3STJvPVbvANXGJQGQhZocQ4Eg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/7Fo25Cm+1bhXGtNybd+rzdVePjyvWgGBJfuUBFr7cue7/arMG
	e7ISjcEKIhQ4POUdsBngr9en5X92tFTKXn9CP9XjYaFg6nFPFt3okelO
X-Gm-Gg: AYBFou2XyCIGhGAK1eH1zFiKOUv/qX9jx/BkPf366PgfC8lNK9l3KC6ExqILuniIsVu
	zztMswQZc07GE7Hs0Aa21/oCXHoutiWblx+65td+hhvy2X9g3kTy2AfmQ7GB1WNZvir/cfbN6dK
	rDzMWOiY+jEmA/nYF9gcMMNgyx8pz7uo9r2Om+TlWzGtPekbdKSGivrqdkSkzbL7DLcqokFrxSd
	drcNSeWeVdmPe6A7hm+CsDeTljfC7c/h7YspZp+D3BCxJUwD+Z8YdPJzXRTVxbCAKGrxlV1GX7f
	RvuCF1drhuvqVru2u5plC0S92OoiGqjqSOQ6xtfUoiHxh4ZoIZ9auR4OIJV6KQUBL+cgW5Ov+5b
	O1Q23i/519eYwnwM3zgusCBHjqjo/GBxEn9NJxFN5ebLitVNQ15ONkSR8p7qImfG1/VW0QpGk5f
	t1UHUbAYEyHwZfEHAzumbwUpvv7tMFwJfoXTpnryECknlhQfMSJ/D0EVks/YuiF0ewTuWCMOTwx
	L7GLdd2rvzItoyqVeF6I3YTwgI14ST/3vIjku034u7F4olScgpHdmHo6/0z8u4EEnxnvLX28RSV
	hTvtUjypGFVYwP3J9I4UU01y
X-Received: by 2002:a05:7301:4184:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-37685d753c3mr2904495eec.20.1794372122835;
        Tue, 10 Nov 2026 20:42:02 -0800 (PST)
Received: from localhost ([2403:2c80:6::10d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm11023535eec.12.2026.11.10.20.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:42:02 -0800 (PST)
Date: Wed, 11 Nov 2026 12:41:58 +0800
Message-ID: <531e628a379b6733632a25d998337d77.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Sarah Emery <sarah.emery@canonical.com>
Cc: airlied@gmail.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bmasney@redhat.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dlan@kernel.org, docular.xu@gmail.com, dri-devel@lists.freedesktop.org,
 heylenay@4d2.org, krzk+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-riscv@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 me@ziyao.cc, mripard@kernel.org, mturquette@baylibre.com,
 neil.armstrong@linaro.org, p.zabel@pengutronix.de, palmer@dabbelt.com,
 pjw@kernel.org, robh@kernel.org, sboyd@kernel.org, simona@ffwll.ch,
 spacemit@lists.linux.dev, tzimmermann@suse.de, u.kleine-koenig@baylibre.com,
 vkoul@kernel.org
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
In-Reply-To: <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
References: <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
 <546efd00-ddaf-47f4-9387-2635785a1bf5@canonical.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_204203_764724_73805AD3 
X-CRM114-Status: GOOD (  10.02  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sarah,

On Tue, 10 Nov 2026 18:02:42 +0100, Sarah Emery wrote:
[...]
> I'm sending this here in the hope that it will be useful for a future 
> revision.
> Is there a v3 in preparation?

Thank you for the fix, and yes, a v3 is on the way. I am working on it
with a friend, and it may be posted by him rather than by me.

I am glad you brought this up here on the list. I had already noticed
your work: the series, with your two fixes on top, has been running in
the Ubuntu 26.10 release on the SpacemiT K3 boards.

I would be honoured to have your Tested-by once v3 is out. Thanks
again, and thanks to the Canonical team.

Cody

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
