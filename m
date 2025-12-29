Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CBDD3B7E5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 09:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrEA9QevbPD4VQAYPF9/naDEZjqYCdA1NxkSsxx6sTc=; b=OzgZVWo8EH7c3C
	bLYtJ7SJnHnxxocP6seCMAt2W3yW8w3NXakiPD3XRIZ0HdqqsFS+CsQLrR2/6YAz/IZuBWnTKlKfF
	OkVzmZspRorFIo7BxUv3EO8AxLStpd+eNdY0jzDN58JVxu12+igrpjS6XvUgJW2amZ3qzq9rQvzaq
	hk3nLNODtJPeVCmdDy8RuDURmPdiHoVtQYzQuMB6KYsbCosF9XCY5lTiCJczcZ4Znac1YD4gWjwJY
	CN9cd8B/gNOCSWIzFr+5lMLZU7gbjtmQ3uCYqQAIHRekbF+4gQEebJlMqXeZgyQ/spiLir+3ulQtI
	TMfMDvGJf32MZRtyMOmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va9yv-00000003X8g-1u14;
	Mon, 29 Dec 2025 09:56:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va9yr-00000003X88-43xJ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 09:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767002161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=obH9iYXUH7PcM8LuIvRWvOaIIfnfBietKIkzq92XPAw=;
	b=GIsCw+gypQl/9eJIIO5LwGyFCH/IjImP3FVEUE3E0n4jL27zh0XlJoz42hx4NZRICj5e/p
	uiDzjSW9G1t6r/XlpGX5m69g0bTOvgTM5kcbKlw8tY6OFaS6pWJE+HvN3B6aA95IFzhzcG
	4gtF/aGP/UQrKDJSqoijflNRcQXdn8A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-mXnPcSDTNzCE-79ZDLoSLQ-1; Mon, 29 Dec 2025 04:55:58 -0500
X-MC-Unique: mXnPcSDTNzCE-79ZDLoSLQ-1
X-Mimecast-MFC-AGG-ID: mXnPcSDTNzCE-79ZDLoSLQ_1767002157
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477771366cbso66305675e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 01:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767002157; x=1767606957;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obH9iYXUH7PcM8LuIvRWvOaIIfnfBietKIkzq92XPAw=;
        b=E8MXCcxaqiiG2VyxVrvmmIQTsu0Gq+9h4OPRGcdTq/dMB+oh8Wa5JH7TwL68hOY6Wx
         YxwTl50nX8zaFfvn3ebrc5T3MNknpkZQ1NX6yd0fPO+zAM/29zmt77QBi4NZeHAUvVIN
         p7FMAQgowmpHBP/x1X5cCPvSQAgiNROgscEn8YvKwr1EQxdZMtLMeRtdGvkOJ9g8OhGM
         79e/0Vc9tF58jIM33TRhKvJGxJPEStq/wn16lfcZRqAmaEo+hbOs4tgohuBdHBRJTOEo
         mrhOI4GOZmGlelA1xISrqFnDcXKqxiMDCWNSO/9SETQzdPvCDRWQyhdP1vyFwaF33t2F
         Tpug==
X-Forwarded-Encrypted: i=1; AJvYcCV6UTxVd0d0+/DUpm53ZLd2i8n+pS8eNs+qdQIkxCa6shjbvNIzuqrP+Vym5dM1as1fvGqNtq15JFC1lA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXz5xE34zTxilSMQSMzmpqga0exH+ijclhgrL2aNV8lrj95qHO
	afCwQdD6qDCWVyG1uhBXOrL6MejBOUT70Ga9vhCsJYpjMBpHjLrDDGVCbvkq+xOoquJbdz43s9D
	zi1fQ2lmZjCR7J21j5cE5AOLMDWxGxenMsC6C8lQ5qHGJJfaMoqAvAdccujz0BVnMHEAagA==
X-Gm-Gg: AY/fxX5Mh8WJ84Dp31tsGJl00gh7xK9Njvx6p2VoT7GbEoNLRJ0C7ZKqC1OfIVK29te
	8UQdMvmYlFMBKiA7+9716bLd7ecAb6gwVMsl4XlDekKQLljHfXo6i/vtbUGNX539Ytgxvdtgomc
	5NlMFsD2j3LfKdaBUm7PBwX62j81xn7GgYLvHkw53u5OVddlGwPXPe3dXgopMw1voek+pFjX6CG
	clNh9XlJPVXdk6Y31j6NI4bjuem2NZhh0igXgdRl/XO7ssuB2HuML+BrfwRCSePDiLMneXR0ESh
	wP4Ge4fnmycqak3wUqEuTZDPDWUNC/Zk+XZCetd3HSahDLxTr9IC+SXzT1neL9EY1x1d1QNw1Ki
	l3H/DQTD8V9Aw4qYgs1yQUepX2OD3280CtTXRi4GGiy+v3Mt0T40yFJGsQt1TYHR7w6i3
X-Received: by 2002:a05:600c:1c21:b0:47b:e2a9:2bd9 with SMTP id 5b1f17b1804b1-47d19583142mr410001285e9.31.1767002157326;
        Mon, 29 Dec 2025 01:55:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvt0pHSYFpii6xSHzwFuul+6dVBdHfQqlf/eiF9MlDFn+5XDqtCOM3lJyrho9dCfbqBslcow==
X-Received: by 2002:a05:600c:1c21:b0:47b:e2a9:2bd9 with SMTP id 5b1f17b1804b1-47d19583142mr410001085e9.31.1767002156889;
        Mon, 29 Dec 2025 01:55:56 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a33c1csm252799015e9.1.2025.12.29.01.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 01:55:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@gentoo.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan
 <dlan@gentoo.org>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: sdhci: add reset support
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-3-5b8248cfc522@gentoo.org>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
 <20251223-07-k1-sdhci-reset-v2-3-5b8248cfc522@gentoo.org>
Date: Mon, 29 Dec 2025 10:55:54 +0100
Message-ID: <87344thas5.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XhmyH5hCL1m_-B3V9xQd-5hhwWO2j9Wk2Q-R42q-kKQ_1767002157
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_015603_009782_CA08D0B8 
X-CRM114-Status: UNSURE (   6.79  )
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

Yixun Lan <dlan@gentoo.org> writes:

> Request two reset line explicitly for SDHCI controller.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
