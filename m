Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE35CA0EEB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 13:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7QvFgaZTeX8bGV04t9+yC4Vc8g6LoNau4cG6zfVPns=; b=e5WRmbQl8XcS8v
	hziGSvBujKkPNxaLQUmynkTwwqpWstup7qPeDTDq7rL9+c+YlGUMMVIkto5b2jVaynBDL24XAqlow
	g46e2FlZhvBKLaMjuY4klNFJ+t+Boowls3SPPO72SND68BdbSizKAFEHEWP4ePD+mDfEGasIvNTXO
	EXOEl26imhyvePwladPMLq70Fi3z4ZNyzQheaP3QnZBNOK/VD/MJft4NbF27oHtX7p+E86C0/GGgi
	LlFKwe8j3OM6LmkBNd7OFaBpCheOVB+qOm7ujrSWEl2+Mkg4cbOXPyONe+LRNp24xqq2j2Nd9vDoR
	8O0OMCGgc2qbablmVS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo08g-00000007dA2-25D0;
	Mon, 18 Aug 2025 13:43:06 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unyyv-00000007Kgu-0pIh
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 12:28:58 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e933de3880bso1602198276.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755520136; x=1756124936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQlTT8wrBf6/5TXR7NEJIm2qofkpWCiqbqPMT/ijYsM=;
        b=vthB8K/JfUB01ZiWGPJLnTn4No+gCD49652aYAnVx1h+O7Ek5F7NEY3QT4S27Ay12D
         S4pcDFoezTap5aBJFWdWVOJi60lHvF2dsozH+ZbXReO2gaqasNWfpf1zk1mLeEbRB6Gr
         nWjEMDF8cLShl9s9MimNoRr997Oqu8Zfw9rScXJmPlf/L41LnXAM/31ekX1zJzUCdXIc
         wW1/7pK2L0GbdcvHfG5v7u5Yl1gi1wq7TVq06XPzFdQtfZNWnQLFHyoB5kXSiSYiS0SY
         RSOGCp0+yo4ScJpRgd43nX6FPvxP63SMxl4r+gntyPD2gmWXo2fX4bOE3UQRn462ZZTc
         TeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755520136; x=1756124936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQlTT8wrBf6/5TXR7NEJIm2qofkpWCiqbqPMT/ijYsM=;
        b=r2PXgvLdS/Lpp7BXkCOlgPKr1lXdwnXFf2Wl5GJSqNcyRQS2QxaTqd5IvnzcEB/1w0
         mV79N2Y+24FFt512CWi+RHIyDvfeyGwX7XT9LIfQsiEHeuwXuPwFi5VE2j9Gmb4mZcnd
         vNDdwzjVvmUw39LfcJLuts0KV06AzBWvPa9RlqAsZhrpavHGd3Q9Q9bwi4KKN5eNvRCI
         zGUyQmRIjIQoCvvX0sAa/e2c830M1M9AgWH7L9Ags98FA0FondbuYmOAtTVkTTJgppFA
         EHYsfLuwjBQCA3ZTZ/awd51PEkzA+kYS41jKNZImEHc076iib9h42r2tqGYDDm8b84zT
         aAoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtiEWy+uARDwbbT3QIX6SE1O1skWeZCujs4nITbvGijfaC+eAiAdnWWmbpD3ARoi3E+gmjQIIXZJd5pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb2zr3uqpPhQN7qDFyCEddMDL5FKlAANzTUnq51b7fnPzLGxkC
	s1k3yn4ciA5yaVcDiMXqwjswj8EDxspCyqbaHMe5iLrznyqH2GYh8Ge/51pyYB/cmU/xsGysoEk
	qFk/+2/Pt4+oej+hfVdK5QJJmfTKiKbwtE49qBBHMHw==
X-Gm-Gg: ASbGnctzzAGh3m3HLiLC7wuO8DrigyK8kTapsksvw6IZlGDNdJxUxwnmccxClFYXT1G
	RcoIZH+Rgzl79TR/BUHJbE42fCQDuyxSNSYfmmjQDEvink87cWZJNdsUlQa6UlL59qeyFaO1aw8
	3tJOQBw10KQA8CEevT0lh4TG445vyyk3a/QFl2tjkjOXQWxOBXSIu0XFfdcJLh1Lh2GwF2o8qBY
	Maaww==
X-Google-Smtp-Source: AGHT+IFx20xElPVqlagxACjExJ+Sc5Ef/knSr80J9ZkH6gy2bssr57qeuBMFLMu09POyk3VR+IV54ktaJ+qDsdY+z6Q=
X-Received: by 2002:a05:6902:72c:b0:e93:4496:a2b9 with SMTP id
 3f1490d57ef6-e934496a74bmr9054970276.13.1755520135996; Mon, 18 Aug 2025
 05:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
 <20250815-working_dma_0701_v2-v4-6-62145ab6ea30@riscstar.com> <34485B93B03EAD10+aJ7NVbe8aqjWBFd-@LT-Guozexi>
In-Reply-To: <34485B93B03EAD10+aJ7NVbe8aqjWBFd-@LT-Guozexi>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 18 Aug 2025 20:28:45 +0800
X-Gm-Features: Ac12FXzcLxiREAyDvYqUpnp8Sh2Su74nBhalceLEh9KttzUfLjprws3CtQrXJOY
Message-ID: <CAH1PCMahKsCsgmZixartnu6Tq8Oo28bMVNfoAWjnFA2McOOU3Q@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] riscv: dts: spacemit: Add PDMA node for K1 SoC
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_052857_233477_E59815BC 
X-CRM114-Status: UNSURE (   6.90  )
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

T24gRnJpLCBBdWcgMTUsIDIwMjUgYXQgMjowNOKAr1BNIFRyb3kgTWl0Y2hlbGwKPHRyb3kubWl0
Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+IFRoYW5rcy4KPgo+IFJldmlld2Vk
LWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KPgoK
VGhhbmtzIFRyb3kuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
