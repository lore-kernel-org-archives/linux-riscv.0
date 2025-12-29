Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB25E8FDB1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 09:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAmUuDlF9o3GiL5rEV5MnvkWTlr+lbpPSuioS9iv/pA=; b=kEME6RL/NYvgTF
	/rQEBFZw44zpGfK/LO82jQIyu+ul48buCYNf6U2KH6dhqCNSylls80nxoqvD3kmn0DVR56IjddhRg
	E1HBwIJ42njbt7/YsMenq5eJv0R+gHP0CYkEZNNf6w/UsnkAamSudHNXIbDOotC2LeA0bQk9pFRqR
	eWdoXuTQz60UffiLQezN6+xPxtC8Ew6ShSI3P7yIE4fQnKxQKp6vqKKQLKF5CE4aX0Jox4ttMDjza
	PLIhswrRNMyDBzNz5Zjc4iRquMbrP+VSagY2Idbsu0N2o9oJofvynl3mAiL2pMzgdvzunXNqvgVWF
	WbrVjWfpfA2kOUTW2ChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va9rL-00000003WZG-3AWE;
	Mon, 29 Dec 2025 09:48:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va9rI-00000003WYm-1vIT
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 09:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767001689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RnoxkXU/GI8KdYqeGZPuNP5j74RbxRLg0HQulbL1vDI=;
	b=Diquq6ckUWczmy96UrGzUjSiXDv7oGioq3tHzXEW7sLrP7pIv/wMaa9rrDM2r5351jYqx6
	dnbqv1itvwinXbZWfVwYI8uUUkGhF6AF96OpWvEP6/JXPnftIro2KEDWhSd8NqakUUuZl+
	+J6+jCY4ofTnjE0h7TNYARB/JhskQso=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-Y63iu12-Pg2lZdAZgcsPrg-1; Mon, 29 Dec 2025 04:48:07 -0500
X-MC-Unique: Y63iu12-Pg2lZdAZgcsPrg-1
X-Mimecast-MFC-AGG-ID: Y63iu12-Pg2lZdAZgcsPrg_1767001686
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47d4029340aso35126615e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 01:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767001686; x=1767606486;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnoxkXU/GI8KdYqeGZPuNP5j74RbxRLg0HQulbL1vDI=;
        b=BzVH2qM4ZnzyTNFk7aveTKXYNCgwKKO/azW3e7kwCtFiRaWkSzzCY+5JXoK+Qc3VA3
         G8aIGObFdWBG6XP9DqyysRpUne06zje+QaSVRJ68wXLEG0+EjFXWxqfj3Dw8k1tgKz1i
         2pza+DPJThgPSQWFv+8UV0msmq9Ciu6PBmDwaLHbVVa1LfyZrHu5UqAuW0nGacSHiYQ2
         lmq39J1AS0Pe0zVWbpDwytae1Z8hFDoEcb0Zs5/O3wVg6KtYEs5GgE0+UgTHPZuV7U/T
         iQWSmjDbVjqmVC+MgGLRoG9l20T9zBCObJKB+gklvOq/rfXw+T8fqD/VWJVmSPgCb7V2
         XogQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAdFLnZaNlTXZMLJLyrc+MtbhY0p2Nue02gvf2q8BCidn8Yc6e5UnRDjQC6uzQjzV76dA0UfvAgsNkWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmjIkIhxdUd7QXEhKm4tITn+FD23PSru+ohK5qC42CjKrI2STX
	Y1RKxxj59sv4Wv87UXB7B/F13TcrepVvlVcjI/9pgDO7NemLPCIOprsx1f89Dlml5slYvDKiLxD
	TcIH0pqLc/6rZIj8WZDEzlSJGmsErs/FxcNaHGw/d6Jb8b6kInuUO5egVEwvw0qSjGbDeAA==
X-Gm-Gg: AY/fxX6p9P5o7rl3w4fNo4AOgyP7y+MZaH1nKWlmXz1YEWojyN6XJnfMG5bS/8URu87
	/nEDlaBPkOPH6Xfq6o0JxKdr14iHe/JPrmrypH0Di8FgnZIQSU1ravOU97vte6ZFdeBDzL8GMVD
	x42EpQkqJyFeruQi1hOwmLdTIeZ5eDpSQ/g/iNUZQjV2goxi530DuQpocKdg+yypbPUaZQpbVyE
	OozI/SBePwNcL5HOis82HycMIIDHDP38RFEtC7TrK4z0U1JrjhpFMjp99j43NTOyp9ie+CXeMiY
	K54AWvMPxrMmODJfT9sXdLtQio1Dq4/a3HFoaHxuRwnpVZqFGTa3RtXTIFKT7xpy7pPzKBwXNqQ
	fL5fwp0XE6115r5UqXzZaf8rvaVUkzwcv0saRmagM1C1dnF9Eg0QK2VocJj3McPCppena
X-Received: by 2002:a05:600c:4e49:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-47d195911b8mr306757795e9.30.1767001685806;
        Mon, 29 Dec 2025 01:48:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzfoPDCziY2Ru4fP0I+7aTnAKnoHe3exw4U31W/SkLy53MoLHcz6raQVV4UNwNgdpcefpRiQ==
X-Received: by 2002:a05:600c:4e49:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-47d195911b8mr306757565e9.30.1767001685444;
        Mon, 29 Dec 2025 01:48:05 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19362345sm528501075e9.6.2025.12.29.01.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 01:48:04 -0800 (PST)
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
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: spacemit,sdhci: add reset support
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-1-5b8248cfc522@gentoo.org>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
 <20251223-07-k1-sdhci-reset-v2-1-5b8248cfc522@gentoo.org>
Date: Mon, 29 Dec 2025 10:48:03 +0100
Message-ID: <87bjjhhb58.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OHLMQmHP_Lxw_nPYS8B8ZdKdbVGihwq-E8PRkocqHn8_1767001686
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_014812_570903_D573C618 
X-CRM114-Status: UNSURE (   7.81  )
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

> The SpacemiT SDHCI controller has two reset lines, one connect to AXI bus
> which shared by all controllers, while another one connect to individual
> controller separately.
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
