Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DDCCFB43F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2024 22:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEXfa59IV5WDonKGrzjlhWYiJ0SA6LQLGio9bQYr5K4=; b=G7cYHuDtl8f1Gn
	8XWYbUjNSKtJeDAfUGN/swl6hk084zqGhHBMn8fSHXSp+Pz3ycrJnuYbBAUJ8mLjjgnIzddr3WHKf
	r6nku00IwrdI5veMKlSXn9mX4whFn779drgtDUVxhICyKPmd09/oT0IBuo0R3pakY+XNSryz3KOWa
	RekUrCmM8/BtC8bv8Vc4gA1I8T+fMrWdaILwiT81UBrWCOD1mVUWz/dGL95Lr1azyzA3YyTFhe5rr
	w0O8zPWAWeWtaBJT0IMqmWDiyYv2ly5T8X203VF/8FfVotdWaUZWr9GVV7FwssIJ51VP8jxrCt8dS
	V/VLfbWCKbvfPP1L6UIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxaCl-00000000l3P-0LPh;
	Sun, 06 Oct 2024 22:58:23 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxaCi-00000000l31-0S3i
	for linux-riscv@lists.infradead.org;
	Sun, 06 Oct 2024 22:58:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20b5affde14so28667295ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 06 Oct 2024 15:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728255498; x=1728860298; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=shZDyWvvJS1+vbJKipKl7TBJestfbUJaPNb4A0EOoas=;
        b=ZZVQ+mA0Ybgbmk3gawcAQ948JOlmrfmorhm483fp44BCxl6ZcBwY3c6yecH+NFxF1X
         7Fu+TjPhtbKY2nXi/W2PcKDLykPb5xnhvCfBe+eM+D+dywwXqadOiQFc7FmD5c5Z0Kar
         g/5LAUTmV8R5gjtZVpaXVA0jJOOvmQIurDEdoI9Ndnkox0+mAXhXqgbIg0hF3d5YkKtr
         UCy7Dw8zpU4cG+3/6ctC9br87nR9Qk0umbKt9zzHwKGq/P2eGeEEovhnrNQwWlgdaVJ2
         TS2kebNSd57yf1xtagHw8BgutVW7o2exvaIx5QXpt3Nq4dP9/rM1qrvnyinXhej1kbGY
         9igQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728255498; x=1728860298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shZDyWvvJS1+vbJKipKl7TBJestfbUJaPNb4A0EOoas=;
        b=tpDOjcftvSR7Ork3Q3GIUVedQ4QkOuJzwKkzK7o9Fx9g8jW/TE/EkPWhnGV65U2AOc
         SX9ZXCfKnrcB0cmYnRUu03pdki4RAAnDqJTI232mlTAnSaPa8aik9A37Ka9inREVz1RP
         3KY3X2xO6EXnmCSBoNidLYfWNOKbrnXQN5DkraDpHQ3Juof+C3oTWu3hQU6CVmmOcG3Y
         JAMhdpZ5uoUN9vzqhEC/JM7+FRFMvdliD+zUDR5HLfEHSSn4Py5yVZEsVKvWTQ4vqc+8
         QavwU0bVSB3zvpPC/+oe+ZEGHMEqMBk32MrA420vzAGP/gC59oBw/ZXoWzTc6VyfjfR7
         G59w==
X-Forwarded-Encrypted: i=1; AJvYcCWqp2wNQpcpNftxNeElr7MF4We3rx3ck7dZUBA6VOuRSrfVaQYGbyqjwpzIhAQlKbu52iMGznSOcp6G2w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5U6TdPbP3pLdbGX9dyK79j9y8nCZKQ/5ePUBIU6HOkJA+KyJA
	tGfaUb0xgBPEK8XNWGZdFFrn0h+pC17gO/oJDSeQkoWSn9dkubEo24dELDHEkw8=
X-Google-Smtp-Source: AGHT+IFPMCwXglsgE0YefVyYhHWUFUL20s0BZFZ9Wmp5tfe5UAbc/+G9dWvwujGP9G02so7NPzQewQ==
X-Received: by 2002:a17:902:ecca:b0:205:753e:b496 with SMTP id d9443c01a7336-20bfdf80029mr116924685ad.3.1728255498269;
        Sun, 06 Oct 2024 15:58:18 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aeba043sm3981434a91.13.2024.10.06.15.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 15:58:17 -0700 (PDT)
Date: Sun, 6 Oct 2024 15:58:16 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH v1] riscv: make ZONE_DMA32 optional
Message-ID: <ZwMWCNYUwrW0oWVn@x1>
References: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
 <e8f6ed93-d47c-4c07-963c-8f16f498abed@ghiti.fr>
 <VI1PR09MB2333FEC324AA0B3E5F1D7F98947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
 <VI1PR09MB233370D7BD8553E7891EF46F947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR09MB233370D7BD8553E7891EF46F947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_155820_179237_3503A511 
X-CRM114-Status: UNSURE (   7.56  )
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

On Sun, Oct 06, 2024 at 10:55:39AM +0000, Vladimir Kondratiev wrote:
> It is not necessary any RISCV platform has ZONE_DMA32.
> Platforms that not support ZONE_DMA32 should set
> CONFIG_NONPORTABLE because lack of ZONE_DMA32
> makes such platform non-portable indeed

I think requiring CONFIG_NONPORTABLE is a good idea. However, it seems
this patch was sent as a reply to the existing discussion thread.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
