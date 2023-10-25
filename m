Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BC3C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GniQLVR5XPqcvmCzW4mKFZWSkF17Gfm3cKJyxJ2+SL4=; b=RPXqgBtWc07MV4
	qW+BerBP7UBLvjB9elPuKvXE8nQljk+/WZXShhL5ToYJjMXtGjbl7tBOwXuchtCFroq+p2Hwwlmdm
	qM1dZMzNesMl2vL14K0HOGdcBoQJF8I2+J2MMyd03GUcDmdi8K36NBPMtfvcuxWSH/MaDLKDKNz5x
	ddV5AGNhU2RJ3l1XJxVINmdbqjDNJQu5W/FtWBKk+jVp5C382SK9fjidknLzLgGXu3bG3Q06ruGeM
	OLOe0lexlGGgbnngvU1OMA2LUQhZq9leGP9av/hivHQDFF71biZTzMMvngwxY7oZrTqKalepNqydS
	EcPKtynOJ48Khc+6sttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvfxv-00Cdad-2N;
	Wed, 25 Oct 2023 15:38:39 +0000
Received: from mail-4323.proton.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvfxr-00CdZB-2e
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 15:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1698248310; x=1698507510;
	bh=s3OSHMGsk9AbX3O1+PeWpTjfY8iogU36oS0MMtzUkOM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HEtXXiSuOfPyu+UaMN6/UV6yrkpJKijbGZmGy3nURSVNze4dfy2e3RthAItSDlvwg
	 4h90fPnJKu12fpPltCZKYZfw5bIINOVaXM4qBkH7mwBxzUJ4Ncjlvgfg+EQGBoBUNj
	 GWr1x3gL0K3kZ0qd+jB+GIXt833zMOEnT0aiCVjZkVHUjNvTW2Oo9CHyZT0sjsc1eL
	 637VWZ8aIGINmiLfyCcHYWgDQaupiBrfRLAv0aRQuHpLERitwggQH1WtF5xJC4ndzr
	 KFO4FuWJKWiWC2iFhXN9NyPrQct6vv3sJEOZ76zIxNofGuckAkOk0SmdEcP+cfdY8s
	 9YnsG/jJRnKYg==
Date: Wed, 25 Oct 2023 15:38:10 +0000
To: Keith Zhao <keith.zhao@starfivetech.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Shengyang Chen <shengyang.chen@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Andersson <andersson@kernel.org>, Changhuang Liang <changhuang.liang@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Subject: Re: [PATCH v2 3/6] drm/fourcc: Add drm/vs tiled modifiers
Message-ID: <nPUOGd5_-QuZTUXhGdmJ03Bri58JI0SeYVcBLnJG4aFuqobd5i1RUBVoi4CNP3VGg5oBdz5LAGdwHERxtMwXJyHPyVxJz4UpiBuFiA5NlkA=@emersion.fr>
In-Reply-To: <20231025103957.3776-4-keith.zhao@starfivetech.com>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com> <20231025103957.3776-4-keith.zhao@starfivetech.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_083837_140729_B6FDF5F7 
X-CRM114-Status: UNSURE (   5.44  )
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

Would be good to have an overview comment to explain how bits in the
modifier are used and how everything is tied up together, e.g. what the
type and tile mode mean. Also some docs for DRM_FORMAT_MOD_VERISILICON_TYPE_NORMAL
would be nice. (If there is no other type, this can be removed, the bits
will be left as zero and can be extended later if needed.)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
