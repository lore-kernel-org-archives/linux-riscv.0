Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B61C54756
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6SrK8pqDhUQVRcbJiU1TFYxea705oY4WnH0VNm2egg=; b=ilV1me4UJhdSap
	OihZu4EnwG65ZG3AtacJW4Y+sHj9tdKIVxPv0nwDXUmvbtT8wwIDgmsa8gPKAg9kIx/8LquOcjSpG
	9+ATKE+qbJLb/3CxRAxKbqkjZOUA1aI7yrQyLRiPVhmOHo9B4Ce26YdWCyd1ddDtW27qrWbTClGTR
	YytjH0wU+dWKh6BffOwl59mPCJiqw1ERVTS1S27hNz/D9PoyMa0ZuJz+B42Lb4ncqigVnwuJKqD5U
	3SkiE1SScOnVK/ys2W0b6E9KgV6v42PLOAFut+187b+zBStXo1hmdis8yW046szjDemOR+nnhiM4E
	V8FtbALTpElpPf7wx/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEfW-0000000FgfI-3Q1M;
	Wed, 14 May 2025 16:09:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDsB-0000000FYqr-0sy5
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 May 2025 15:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=e5Jd0rTH8gnYXw6/kC+uxiJyVYaTlWxJa+SnxvsOCx4=; b=MdG797gffdCnMjsAY4DUXUhbwh
	FP9+0tRmszPgH+GBMQcUJHQ7H6tQ4Sv68/X7H3ANIbphmeHAjE82QbOfnsfEZhUwopX5ODeTvVswk
	CdRsvTFMUXwBPNaArv9AWaJhgSOdVZKkqMFq4OZ0uofzsPxXMvZpL/JKGBWVJ8dQD2hLpQ3lp/qZV
	QTa/KMCCJ4ZoxtmrUIyiMp8eiodtUhyEktjnRJ9QRAnNipSPFlk8kemGmSyTZmtM4E6rNYKaZdsR3
	1EOlAlhkAgXmUESOBQgQGeAh56n+bmXXt1cYdXvtxQDurATqigDXD/rkU3fvzxy1Mwas9fJ+rcExC
	Rk3ND3bg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFDs8-0000000HERl-0Rcy
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 15:18:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-442ea95f738so18950505e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747235894; x=1747840694; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e5Jd0rTH8gnYXw6/kC+uxiJyVYaTlWxJa+SnxvsOCx4=;
        b=cMsWc9IiUqCkTgFpy1PS7RQIfItT0T7AdD+75Q5nX4fP29Krl+IwpHoKMV05lRVr/2
         rS7wXKhVcYsWDlAxGxwUNyT3DfTt2qDMAR6zfq5FlrG81bNWpPJpARfcyfXB/da8GzYO
         0OUNH9M1Y0szwTM+56WA/DesIs88HvAV4TgUXP+WwcSqZxwupYIXrPuGb5I7T0toit+n
         o2f3UUSoHBRk2mZ+A16gmbqN/1evxRZMgwxSeYa6E1oHMiZY1lBoapc/SdxAme0hQ2bD
         NREsWnOysS9yKgbQTnAXR1KKjxiysCTUWNQoOHJXk+IBPAiRsf8nC5kHJ4XGLzpPCI1n
         kmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235894; x=1747840694;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5Jd0rTH8gnYXw6/kC+uxiJyVYaTlWxJa+SnxvsOCx4=;
        b=pX09xzfb0YLEuRIn/EmCgd4CTx5sshO4vlGaK0hk1LImoo8TpFYE0se4Eqjj8Io8gm
         0bhrrc0AjiuQDUvDgSRUlzmoaPdZGUZ0Hf6qPEXqKZWLdbY92HP73WmdrS8tpErBqsmz
         aBRSFrkXplrN2t/0V7mj/qXljXvEcp+Kn7fo4oGf5aWTePk8o/kX20zDx2E8TH8JOd7w
         dtMp3uXupB31xF4FonnARBODk15VwdkfjK3HNgn9cCGQS5yhBfn/buTWBSQ9LTZRbeWo
         WNELDojNda0V3JuY0t1sTsaig5S+0kgPDBlKlxaowxDmv7wiSlPWsS4H5TC4cro+JLFW
         P8LA==
X-Forwarded-Encrypted: i=1; AJvYcCVNAo1jf7ckKcqMyoo7l0YcB0EDulB+CjWQLO5oWmcvnxZC4/5UZm/EWI13efXXMHO+k2zSA2lViCnsjg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg2ASthvmwlz3lD4y6Ou+xzbxsCHLm3hKYoWUAbXO1QET0EHjQ
	gsjokd0L2yTbHsg4HmiCU/RLlkw2QKtyLcvPqLd9kRKduQndrx8V4jwy6TMhW1c=
X-Gm-Gg: ASbGnctPGWhX3C8A0mD9wr0uc3lkK6Xb9X6ME6WNE3Nrv+myGSDaAT1fPONUvCZjOB3
	J6USVZfk360gMCmogtqOvoRhB+QPBOymUBNaXmu31cLUBnA5+TNs+2o6GcWoEG08v94gIKk8W9j
	W+7+w9eEmIWz4e+YM87kJuNfNXPtISdyde/fPP74yRToI9hBYpqphnLwsDM2jZjlomqyBLN3Ep2
	o/VBK1zjmmKpArdaU13sdyfCLj7evtg3z9kVqJIFy9WhTnx+Ux07b3L4ViN7n7DE05QF3ppoGA4
	VlIewolB2xsSIxQ4R/cCYJ2JR6u4ELAT5NIJUHO1rg0h2qqSIdE3KPJNpAwncwyDN2cA9tbpCVn
	4K6PFSB8zrj/JkQ==
X-Google-Smtp-Source: AGHT+IGRB2abpUoZIymw7STMdE0tZK4TYpFBtxfd/eNvtOKPon1N5dnBR2moKCQCWe3KVsOdcRBdjg==
X-Received: by 2002:a05:600c:a40a:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-442f4a38df5mr31188215e9.10.1747235893683;
        Wed, 14 May 2025 08:18:13 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380544sm34936385e9.13.2025.05.14.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:18:13 -0700 (PDT)
Date: Wed, 14 May 2025 17:18:11 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/10] dt-bindings: timer: Add ESWIN EIC7700 CLINT
Message-ID: <aCS0M5uczXMr7WSY@mai.linaro.org>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-9-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250410152519.1358964-9-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_161816_307083_73681B4B 
X-CRM114-Status: UNSURE (   7.93  )
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

T24gVGh1LCBBcHIgMTAsIDIwMjUgYXQgMDg6NTU6MTdQTSArMDUzMCwgUGlua2VzaCBWYWdoZWxh
IHdyb3RlOgo+IEZyb206IERhcnNoYW4gUHJhamFwYXRpIDxkYXJzaGFuLnByYWphcGF0aUBlaW5m
b2NoaXBzLmNvbT4KPiAKPiBBZGQgY29tcGF0aWJsZSBzdHJpbmcgZm9yIEVTV0lOIEVJQzc3MDAg
Q0xJTlQuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFyc2hhbiBQcmFqYXBhdGkgPGRhcnNoYW4ucHJh
amFwYXRpQGVpbmZvY2hpcHMuY29tPgo+IFJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2Ft
dWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQaW5rZXNoIFZhZ2hlbGEg
PHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbT4KPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAtLS0KCkFwcGxpZWQsIHRoYW5rcwoKLS0g
CgogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29r
LmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5h
cm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxv
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
