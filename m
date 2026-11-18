Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581460A381A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 21:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t9mM7B04;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ftBNg38y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SwkoCG2Y/+5ZxwskwRXlSSQmzhR6nBkeHCH/MRlpGJ0=; b=t9mM7B04JV4H55B3U5oMP87A7P
	xfdKUQxhTLlScCt3Xe7nHs61qbawOfiASc6xJnCaQLFZaSP0keJ/da61QgNxXzVKkgmluf1yJrtBK
	rrKvF1hmgo1GzUU/vsayLzefV4XC8HhRVQU9O2Hwh7Ew0MfE87Wh3J2NzypT1nTxwpOQ07ni7/vaH
	pp8ieYe+9fzZeQEJLAhO89pbZjQUn5hrdH6jXgdf8MLgt/oQcY+hNfAGLx+UfHTGw7qmnJFRuqS2h
	KsGpxH1zc6GB6bGxkTHJGFVc5FbtcMhS13Yo+Pg4muB8V706bpREh/fD++7aMvY7Q8S0upGk4noFB
	J0WSGZbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmok-0000000AGzq-3QwH;
	Wed, 18 Nov 2026 21:03:46 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmoh-0000000AGys-3sqY
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 21:03:45 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so285041a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035823; x=1795640623; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
        b=ftBNg38y6a/EtPGsyMENJlwKArws1HZJR1DsckUjvbRJH9T8ncQUZOv4XRGsGBwxRk
         dmcwqu1DbjO6jaIuJQz7S5t1w0pyG410lvrwGybqUbU/4QVuQqAPmmylRCF4VkB7Jmfl
         nKLsxo1mgV+NA8mnTM9bvZe9Mes92G0v/+6Fdu3wlqdESJiEg+TxnNUU4XmFaIuEcDUJ
         KvAUZcUg01oPUGJLjpN0gjN2HKW99JutI7wHAptgVbo8yph344MF0l5Ozi1qwoC6baQy
         LyLWJsqe4ZdHSz1NZQGA1BN7VQF9hARud5z+/mRwTHnZk+JvAKBP2yGy8o5eu+qa4+ua
         5+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035823; x=1795640623;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOYoHqd+TEhq9YYSZd05JTs9KMcPqQTIbqKvDzsDrNA=;
        b=OJDSmwX7LsuamOFzgDA8cE9uiF9eiCOWV2BESi9sXz9rkqTQnj0TSihdEwuSVarVhI
         mcnCyHeKKXWqQhQXcW/+4fMTXz+F577B9dqUC1eg8gVfIMEKO/e963vlFkrOJGSSRKrk
         yqYsMAz9jM923o+ta/MyHWfYVk7xLg8Gd9/iitRjvnT3U2Zv7PrNO0Wi0oySe2EuZd6a
         9n9QOr/3pD+fu0h7DkgFfi/Fn2AKzXkfVxbilr9qQNKwtwFap6o0PcjsVjiddCP0k0zZ
         fyUadlPDwkKEpklZisUWQdpmTGZa3JWWx7Edja90Fr4/HX9FZfgcYnGXyq2q8y38WW7G
         EIvg==
X-Forwarded-Encrypted: i=1; AL+hErHT/czZ2VWu9rQ8l8kDxcYvfWWvfVPLZy/tSxNgotmw+AH+5vn+bVDUyMBUI0gwC1f5H1jzjQ8JcOUr5g==@lists.infradead.org
X-Gm-Message-State: APuU4Z8uWvedri+ElGIcf4I3/fcp1AURzKqoenEmgRy1nlnef+PIdmxH
	zEVbkzveZcitLs8uM/g/iHjFgBFCQCh1SNuj4CbXUtCbkn5RLl8yoYz7
X-Gm-Gg: AZFdTZcyBKowtFJkFJbBtOhaQKt6vDTOfigKvDc5LzwymRBzrHQYDaVOa3L84R6wdTQ
	ps5G3cGh/licfiT5Okj7mvm8oKkCko5H8SaMjk+iSUqOUMsA8pt8sWprMbJISs7gNQjyxgSGEJZ
	hZddt/z2wjOeKXb/j+FL/Zx2FitlSA8zSjZVZMw903FC2JhnBclW9/Oz3ZJAh8RhVAQIWlh93SX
	Mky4/tjdesyCsjh9SGU3vmiy/3xJ1yqK9XSpsc+D+5JjqqTrI/O+L1/KJR9CrMdA1Tkgk5996xv
	QWz9VEsuf+ID+doEf2DZBeBqTuqT89nYBnmsXfmm8UYo72r+Z5Rl0YeM5YEyyOA9N1dFsgJRaQO
	Sug+vzHg36IPku+ZKlSDKsvihuEuNTWxfLyns83XaVqHQ/N6ujMltCFJTficuJVkB26Wj0gWF7y
	n/niNMGaIhNPQyMiddqNBpMt6TtPo185WnVXfnTWQUuFW9/MqlRv4x8ST7lTch5O8MdGmjARNos
	sBxaoGtw9n8LpmIUwHtfr0AAoRrPlRNWB5Dz1X1ODwGLihYJHASesYOnnbpxOlefWtN5DFPgzY5
	DBA=
X-Received: by 2002:a17:90b:3c81:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b3d07aa355mr3694363a91.25.1795035822845;
        Wed, 18 Nov 2026 13:03:42 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f7066ef3sm865257a91.11.2026.11.18.13.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:03:42 -0800 (PST)
Date: Thu, 19 Nov 2026 05:03:36 +0800
Message-ID: <5167ad548a578a23ed8d5172196b36f0.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 08/17] drm/spacemit: add Saturn DPU core types, cmdlist
 and display MMU
In-Reply-To: <0dc12950-68e7-4c30-9138-23539e676e1a@suse.de>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-8-327d7910bf71@gmail.com>
 <0dc12950-68e7-4c30-9138-23539e676e1a@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_130343_974041_407B7C36 
X-CRM114-Status: GOOD (  12.74  )
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

Hi Thomas,

On Mon, 14 Sep 2026 16:10:25 +0200, Thomas Zimmermann wrote:
> Hi
>
> Am 09.08.26 um 15:14 schrieb Cody Kang via B4 Relay:
> > From: Cody Kang <codykang.hk@gmail.com>
> >
> > Register programming of the Saturn DPU is batched: the driver builds
> > per-module register lists in memory and the hardware command-list
> > engine replays them at frame boundaries, while scanout buffers are
> > mapped through the DPU's private address translation unit (DMMU)
> > rather than scanned out by physical address.
>
> I've looked through the code in patch 10. How does a plane interact with 
> the hardware? It apparently has its own command list, but there's mostly 
> code for the CRTC update.

Thanks for the review. A plane programs the hardware through a
command list. Its atomic_update fills the list with the registers of
the plane's read channel, the driver points the command-list engine
at it, and the hardware replays it once the driver raises
config-ready.

In v2 the plane only fills its list; sorting the lists and handing
them to the engine is done in the CRTC update, which is why most of
the code is there. v3 will move that into the plane: each plane
builds and submits its own list in atomic_update, and the CRTC flush
only submits its own list, for the composer, and raises config-ready.

Cody

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
