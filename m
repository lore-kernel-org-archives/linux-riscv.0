Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5876E606A31D
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 19:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p9CQtUJn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QVhyc+Ut
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=peulz5RGETGcAKGdqwRqkVzUqAtO3/FXsLdzP545olg=; b=p9CQtUJnfNdxqqduCjvbMRK5Wp
	QH9jJPCEUhmyGKKeUMcbK1nw0UWp5RRBTxGGgzlb7QnWKtnd2pcD96Vw1FFQoud0IJRk7Xf6WX0VU
	K/t3RJBCbQE+b8YirEHZKMMjY2zgXTPGV9LREmHpOyY74kuySbEKgxrLf8xK/KBkXCKqTvMh2gP/b
	0jfSJTfKWL4E4adQ2+J1wjp1l50F3bopLbtYXVozhJGoIWhR6AC8xb789z8xEzGsMTc+eHA49umz8
	IULD6MskRd0tB+yrPm078u11efOo+aKLR9q/RDDUscrW1UEzg6RUKjhV1OGrOBSvyjVafu5hNmOAE
	SU17gM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD5Z-00000001cKg-3Nvz;
	Sun, 22 Nov 2026 19:19:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD5X-00000001cJH-1oGu
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 19:19:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so20866945e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 11:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795375137; x=1795979937; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=QVhyc+UtGSuKkgRobkfqibARkavgEZ+6cRcByT8ZZzn6/00fvkqm9qDGjtBEy19Q4L
         UEJR8YCrzjmvqIUVfxWaKpmYs24+2ifbbs9uo0ADM7FfZjmsWr0lXN0Ei5G/pEH95ord
         stX+g10+3r8uih3PYkE0ve7G6/jOzW/dDp1yIYCmDi+N9618e1H55xDU8h7Rm+/TlvHc
         eDPkotYv2/H8wVhgA5iGwIrK4p2fuUhcHPX4PGK66V/eznzpD3E0ZZA5AzUHunKsdnM7
         Lo380iuEpbo4TLhI5nDu20DiNixh8RofuBHG2zfr/+nSSnxcOGRM1eayqVWvm+Ie0xBz
         nJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375137; x=1795979937;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgVB/O5hBKCdOeqZ2JLGG3q/f4KIK1fx085LNchkx34=;
        b=VBCAd/ByNI0WNhGhahK3wjcn9KbfnF/DaNUhPRjxeaVvcwrGQR1qMa1tiYRO+sqXFX
         4k8mqi9txXNNL/Le4oB55FjRegHQeBHnIsDW+mwuH5Nc7UaOEvec3yCbPzDhXM+nCsr0
         K9bLtE5ufa5TIjajKzUJtxLE0wpI4+fevgH40B+AgZsJvGos7J3AxFdXTVJQJfdQPsvR
         Pf6lqba2gGhSLONSI4e/PqfTdciFj8gG1oGy22Oo4mf1HCl0XGrT3KpL6hEL6JIlx0+J
         7wrVi1QK3+BbKiEjZlygI0Di3mGw0xlAYOaF7u/w26ONTvltW9DOe9Z8F3ZMgjMqxUYF
         DU+A==
X-Forwarded-Encrypted: i=1; AL+hErFtrROCJpL4UEGYW3wivaJqktDrKYCHgZcmTrePcMl9Cm5k8Agis7jDQyAQbd/8w49XuBYa0AoGGu0MZg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8nDBBzBN/dO/8ltcG6YwmBxJrKXd50oyTC35vMM70gDvtH1LGm
	+QkGAFhlocxeMfNFN2dO8ZRP/qyZPWI+NrXb6ePD2YNDUepZrGgXvMDV
X-Gm-Gg: AZFdTZcLJCjRdDnWX5WMzoD3iSdKb1GragsVIt6WSjOgWxUvvH48HlrxSuSuI9N1+nn
	aOvvIU7Jij0L4MM5cEJZm6mxVUaeR+14fBmd/8I6+Wl6DsWJAEjDW8L4kQl1mrsjez6SQha3OVD
	hT+K+DKL51HLHxLwXxiqsIOkd0Xww3eTWWt7qx+ESnCsf5A5ce9LZuCepIPHKbHdlr5t5kuSutv
	ZaFOyuIDxwHQtyQaRIt/DkrB/6+YVMiN/5yqxW4qTDasAekqQw45q176CJdiHREa4ggLfunkCtL
	qyP4zHCsbpKwb7jRjOA01bYh5Z83oJm/iig+iFzdo2NjLTegx5SlFRPOtBD4TtJ2SZokHgnOWlh
	1655y70tBlSJ7YfSD/rPUsLo0hHV0C/LruuQ035Ge8aWiJq8yUF1v37AaL+47cbDBtngznBqkAR
	hkka8Pvz8NoNu7wZJbXzNFRQC3w2Fr440ULtnAJsCOLZP/zH3xN/Zn0uhW/OjACyzChwEYr2n2s
	6t89tZ8mhUlPM54ZXOrU5b0/5ZywpUscNEFvDVODmvex5PHxC0kFDoWQLEMwfBHWxTrCg+ui5dk
	EbYHpPH0Qn9Vn4J3hkN00YNfEbmVKnkK2N+5rXo4RxZZfyIkAnPleBWcodU4caWbPw==
X-Received: by 2002:a05:600c:1549:b0:4bb:6f45:2a77 with SMTP id 5b1f17b1804b1-4bb8880abf7mr193493515e9.11.1795375137482;
        Sun, 22 Nov 2026 11:18:57 -0800 (PST)
Received: from cachyos-x8664.aetlocal ([2001:bb6:e78e:9100:cdb3:c7ee:74a4:5189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm199176045e9.2.2026.11.22.11.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:18:57 -0800 (PST)
From: Mervyn Pretorius <mervynpretorius.oss@gmail.com>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v5 1/7] riscv: dts: eswin: add reset generator for EIC7700 SoC
Date: Sun, 22 Nov 2026 19:18:55 +0000
Message-ID: <20261122191855.2183827-1-mervynpretorius.oss@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261015125454.1381941-2-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com> <20261015125454.1381941-2-pinkesh.vaghela@einfochips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_111859_648233_115BB9C2 
X-CRM114-Status: UNSURE (   3.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on a DeepComputing FML13V03 (EIC7702X), on top of v7.4-rc3;
details in my reply to the cover letter.

Tested-by: Mervyn Pretorius <mervynpretorius.oss@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
