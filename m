Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75A4CA0EDC
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 01:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z24BiTVjTzHH8o70b8xjAVWtJhFxHzXE8rxLV5unX1c=; b=ZxG/esrPLJ6O6+
	6FrkYug155xGkrq7QISE//u1yFovnkDDXjbe7LFbWNHKi30MkF5+BbNDidVZwoJJ+joLsXl9ZmywI
	T2b1ZOPamzeVe52J0X8HjaZWUceAMdqByWyKZ+sze6ruKFJm6Pz4CClNbEUum5QK3pryRxGQ1msMh
	wIlt2P5pnvb6tYF5tEkO82QjOM4HMscwUmJnjnfpPckaTqbHNRUxakRSPuFXEsCwQ3p79t/vtzNsk
	ySeL+4QkjLwM+k6/AtoCBA5qY3/j+dQqR15b8qKOGM5gCh3tPOryPpCt26+yY/ZyQG11BBH/x5RZt
	QsVGCaeIEtN1HgYUkaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiuq-000000010Iu-3QeJ;
	Fri, 15 Aug 2025 01:07:32 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiJB-00000000thm-0vX7
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 00:28:38 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e931cdc2e4bso1599628276.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 17:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755217716; x=1755822516; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhYHAOHHcTMvb/JsfZaG+H6/8e/UtvwiyrLLiJuYoaU=;
        b=SinUfbmO1ypOD1pW51/EPYhfyO6OHAuTNJloqFFUetM0ynNTw2ktrOl4iiifJMBNUC
         GGZ4GsaqbnQk42u7Krdz0n6cWAUGMgpU/M8rIhQZODbPbj95ZryhbeqInn8RtL2OB8t2
         F/XebY+aco/M486AAUhNsvkIGx6FE9NiY8rE34WxnPTj5VwbQYeizLBN9yUAUmTbHUAE
         wJhFsrBpYiyFewCrDNqr2rzaQ63DDFMv8BNCdtFYaxsqhbnhPhFCCJemD1febuLzGdTj
         a8DaYYBn4PGoeAkWEmssaENuZWMmjG5PJA3hEk8EhAhCHmQlg+GNpL9B+Akr0HFeECcE
         BJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217716; x=1755822516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhYHAOHHcTMvb/JsfZaG+H6/8e/UtvwiyrLLiJuYoaU=;
        b=U80SvxQCaTn9qFVZYA3ej323TJ4Us18q4l/Bdryk1npY0gUULucRblfOSXO5fIg1+l
         abZLKli0sSa1NY5vafisstn0AoKSgC3MM7aRGdI4M4WKxf1j9Ejb7le80Stomktlyery
         HXjsP1uL9ii8zDomAt+b+IZ8r+gXFXH9xpy6jUSkokeZgLJobmT3hF4Aiy2KSnXr8P9S
         UdlQZ9PBFjQHVf/Or26jLhJxu9uufB9mugowj2i47FlASbthiHTrKag/28xyQ/nvzIB4
         ivKf+ZhGfz7NXpK0Be7SL52adHn4w0yJ0lKW7/l++/Bs6+XnBnbixc8qssoyrDnPhXMu
         PmCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHPvfTFzlVOPZO22jnV+xCDi4adlP2rRVDTlliwSu05vI4u+88OwmPaRWJMzIo5g9ELC+l/Qlg/UTQjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwedBFBmT0ryF6Gi76cC19HeVSfXS6Papdl9+gUc5+UlTn2DYOA
	JD6uufNE5Q1fx65qQdTwnxwdSAJX9oLivk3Wv6KScVCVlGQwNLJeZwHK6aFcusPXpDANgzZHMpG
	aewhzLEMGjeHXeI2RVY5tJQ/unf+vR3390Hqf+s2cig==
X-Gm-Gg: ASbGncso6XMefiAf1E/hE7h3QMLQJtyGgviaN76seEys8TwqEW9DqnyXWRRHGalHBMx
	p1Jm/wTuO1HQDa7CHr54u/wqRI3rfQ5V42lI8AKpt5vsrAcitSmbW0gSsOhP241fRBhaHdGxC5F
	dERAfnTs1A8Gsrkp4TBYl6ijAlDHkmG5B9I7nMf0Q5+jUPGavVx6+XDMc0+y7xO0k9TUVc/OgMq
	WoAb3oi
X-Google-Smtp-Source: AGHT+IEWHgZsAdK4qEvDGvsR02TXcwc61mkjg/mahmDjUByNY1vc8hT9AhSsb4gPaZW5ujgSq5lJQRMSMiPVldUmqB0=
X-Received: by 2002:a05:6902:70f:b0:e93:2f07:3fd2 with SMTP id
 3f1490d57ef6-e93323846bfmr333872276.5.1755217716217; Thu, 14 Aug 2025
 17:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com> <268633D49B18C3E7+aJxMHPhItPq9ioto@LT-Guozexi>
In-Reply-To: <268633D49B18C3E7+aJxMHPhItPq9ioto@LT-Guozexi>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 08:28:24 +0800
X-Gm-Features: Ac12FXxnSnbbKz6jQ95n94znx3YpWdrJ0lK8qAhRBPKv8TxP7rZpNGXhbYfh50Q
Message-ID: <CAH1PCMaMm+aDXG4AfPbZ_iJQW2cuKY=VMU2_C1k6Vi3cBBSthQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support
 with 64-bit addressing
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_172837_256146_CF733599 
X-CRM114-Status: UNSURE (   8.22  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBdWcgMTMsIDIwMjUgYXQgNDoyNuKAr1BNIFRyb3kgTWl0Y2hlbGwKPHRyb3kubWl0
Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+IEhpIEd1b2RvbmcsIHRoYW5rcyBm
b3IgeW91ciBwYXRjaGVzIQo+Cj4gSSBoYXZlIHRlc3RlZCBpdCB1c2luZyBpMnMgYW5kIGRtYS10
ZXRzdC4KPgo+IFRlc3RlZC1ieTogVHJveSBNaXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5z
cGFjZW1pdC5jb20+Cj4KPiAgICAgICAgICAgICAgICAgLSBUcm95Cj4KClRoYW5rcyBUcm95LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
