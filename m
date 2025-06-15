Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B606C61CE8
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 15:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLzq7/N+3ctWwh8XNI8cxZkJRcq1FrcGavirID0Rb4w=; b=opWymO6nhfTiE5
	TtJjptQfeE/B2qh4I9UevgJCaoJRb3szAsHcCs0pusFs/qISDfN+bpR3hQHbevmAMI8E47FS1FLNb
	IBNvqpHL44LVRuIQfmOGt9w3+C9kjaeuJrpG9IfPaIQZEFDQsLfNMBu6DflmhYltakD8BYebG7zCp
	cU2UyeIapwnf9XJGCHSTDlHH34Pfo4RfLp+EF/gzJmIMxqn8bRZxETPwkhFcYc1I4FK2KOqsFPAN/
	3IXkc5U56hqwV/6mVD0InhYpt0rmWisY06UuZwg7+PB53wRvBZP+KAy0uIO52ZsqecB3REbSk8nRM
	I/1LYmd90bd49AkqhX5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpRr-00000002byq-40iY;
	Sun, 15 Jun 2025 15:39:07 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpRp-00000002bwg-2Qig
	for linux-riscv@lists.infradead.org;
	Sun, 15 Jun 2025 15:39:06 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a52874d593so3648347f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Jun 2025 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001944; x=1750606744; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wcbVuvRtZ3mAuFzXuF9+M9EX2ls9QRm4Zi5LwXhPPgs=;
        b=KwgqL37C0JbKhHkbC4RKRW+lu0TIxe8zEp/U07KAMhHOpcaNavcW3hPyGVwElM+p2t
         e/1pCyWT1Khjg6xFc1ECFR+dhr5lVHglp4rpoWDl35/VsOjF+RNHcm8ZGF1Ezeg4KFvJ
         eZzGgxNI+AF9rbczFhwM6OyYlon0agEmEwoliqdAUfK3k5/6kx5oCooAqQVrpipsGLjb
         zxx5SWdjdr5Pas6ChjZqKbYrYxqjNkVWtA+9XB+xONCgnbg0dJb4/B1A3Sb1bzfGYoHn
         NSOtNqe4qlHidex96hl1tXzmpNNy3wcdWtRqQHx7fHTmPbtofNt04YTkQ9oaT6bObmkT
         VoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001944; x=1750606744;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wcbVuvRtZ3mAuFzXuF9+M9EX2ls9QRm4Zi5LwXhPPgs=;
        b=Fb/cUnC5KrWeFLrBPT+icCZzEfPKK6gReyGmtsmZnb8tB99p7+1AOPMpVQGuHe2BHT
         DRfjyP4gDNj+kK6ygjkyJjgezFqA18uCDKZpEMwGY/mjNSsH10+f6edYe9Iv3qzvnNgC
         /RvTggTPwS6lTYfF2G2xvaQldMSBtRtHdhwuiRgyGCivxSB0Rb8JxnXAQM8+FZqe5SJ8
         7+c7xaMG5n/NnukqvKQ+lsuLumZnIn7NbrzHxOV9dF2zDfU3sQvMHGpKCpiBv73LLKnJ
         5vWTO2uyF2ZqpSqL0KYoW6EIem82/bJav356VH6AhPg2CkzNU6A9kSR1adulmjxgq7SU
         cHjA==
X-Forwarded-Encrypted: i=1; AJvYcCXm8/Aj6F6l04P3uv5HIFlyM6IL/shlc67H3bXsW1XWBiHdszcSXMPigHdg0+oc8wwlr+0wQqDuuF6xtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc33dHkOH+hihL/JlSdjegOmKid09cAkcFgDK3icNMHRg2iv6A
	asnHjI4A6ji7QlQBfvx2BwfpMyrCd8pSyrPcgQkBedPntfpZ/11cb+Zs
X-Gm-Gg: ASbGncvxMzvkpyG7K9M6QUYvRAaiTkgIx1LFur/tgA4X2ioLW6gXVrc0xY0CPGuqT+w
	bEKYimdEN8PyOL6b6rZLV9h81KYPFjtFsFZJN0uMwH1w9QUQL3ZIUiDySty+inrO+tBHy0Ro3tX
	3VwELPcKdMuktcgJi2SXoad7gxUXiTunnLEKNajere1UzTXle8RCvYLTVN2yDWuEehRwUAGKnAe
	Q3GuGr1OPN8Sca16/TFCLLswNcrUq9fJro9IUyDk7k385N8rjk7fg79SRa93UnPBwivLHbbND60
	R/w89aeUD8DVxxpJebCjcGIjS9s8bddWy2luPxGEYtdGS4/KhhnmRxqcGRh1UlK1QXT2uDZ6y+j
	ilDFj7g==
X-Google-Smtp-Source: AGHT+IHTCj/8xJaYk/rbIb+RSYTHCr6hOLzVXx4YVk5M42GtMekvX58mlmih49xOLygZ2eRiQqolng==
X-Received: by 2002:a05:6000:2408:b0:3a5:2f23:377d with SMTP id ffacd0b85a97d-3a572e4c71emr4704384f8f.50.1750001943816;
        Sun, 15 Jun 2025 08:39:03 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534394c90fsm34711485e9.3.2025.06.15.08.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:39:03 -0700 (PDT)
Message-ID: <ebdba4671998c23e6b0eebee77bf2b3cd439341a.camel@gmail.com>
Subject: Re: [PATCH v3 3/4] riscv: dts: sophgo: add reset generator for
 Sophgo CV1800 series SoC
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti	 <alex@ghiti.fr>, Vinod Koul <vkoul@kernel.org>, Yu Yuan
 <yu.yuan@sjtu.edu.cn>,  Ze Huang <huangze@whut.edu.cn>, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, Yixun Lan
	 <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 17:39:15 +0200
In-Reply-To: <20250611075321.1160973-4-inochiama@gmail.com>
References: <20250611075321.1160973-1-inochiama@gmail.com>
	 <20250611075321.1160973-4-inochiama@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_083905_618907_F2160C81 
X-CRM114-Status: UNSURE (   8.30  )
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

VGhhbmtzIGZvciB0aGUgcGF0Y2gsIElub2NoaSEKCk9uIFdlZCwgMjAyNS0wNi0xMSBhdCAxNTo1
MyArMDgwMCwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBBZGQgcmVzZXQgZ2VuZXJhdG9yIG5vZGUg
Zm9yIGFsbCBDVjE4WFggc2VyaWVzIFNvQy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1h
b3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRs
aW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+CgpTdWNjZXNzZnVsbHkgdGVzdGVkIHdp
dGggVVNCIHNlcmllcyBpbiBob3N0IG1vZGUgb24gTWlsay1WIER1byBNb2R1bGUgMDEgRVZCOgoK
VGVzdGVkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5j
b20+Cgo+IC0tLQo+IMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2nCoMKg
wqAgfMKgIDcgKysKPiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTh4eC1yZXNldC5o
IHwgOTggKysrKysrKysrKysrKysrKysrKysrKysKPiDCoDIgZmlsZXMgY2hhbmdlZCwgMTA1IGlu
c2VydGlvbnMoKykKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9jdjE4eHgtcmVzZXQuaAoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
