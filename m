Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294B1C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZiQO3lpuhbO4o2bbXcHyqtijVwa4qh7hLOHtmBZaA0=; b=nSSfQxdXU7CtXz
	2ZDw3BeT7GBUafuaGj2m2Sbwku06Xa6EqFaqSpnX1e9F9yLGp8I9wSHTsw//eVHjqGY9fmSSU9YbY
	UnyvIwcol1xuTa+1AoQLuQYmdcJlkWLp5BKlk+6Wq+8S8+bGOwbTu6hBjhfq4OOWAUZAWPA2RcqJa
	P/d+/nE7wHmixZqafrwWiehDqbQwIYcOTisAcnM3MyLHrBntDelHYbiY405EdlwMZY8Pq7h4LAUgY
	pZ8zOFw85HB9HvtLJIzrmKAXaRQT6Bi/DcOFcYP2iWLmo6ojHbckAmh4xpak16PvDYlN4a7saRjy6
	jgGg9fwRHen6UC/NeDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6u-000smW-0F;
	Wed, 29 Mar 2023 15:53:16 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6h-000sY0-05;
	Wed, 29 Mar 2023 15:53:04 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-17aceccdcf6so16645948fac.9;
        Wed, 29 Mar 2023 08:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGkcT5R0a8JeH9pr+tvR6Dp+SnQFVzxwMvRKP+oraeM=;
        b=k/5fluJIyIpHe1VclyS3RKlwbSXuXHxP8M5A1ILLdtRqSABlJS4CdGt+PeR6O1TVPR
         xzvsHO/xjbYCPDfuAQnz3Ipib5hgZE+fNsjJ9+OwGxtu9oLwO0e4rQvWjD5lh7nxOVBK
         AQa6FYsqLw01NxUowCDKz9EVRUoCvYFtsH/AZjoY0tXpmOJQQwwUwehKYxnrxXNZOqUA
         D2OiiSCGZHDtukCgJZq1pgZNjvwhZL7JDGltVotEIWBlSXGf1QFMeh8azd2jMOX4O64B
         07LY55FjN3uLk1KVrEzF8UPuXUg4wtqD0D+xm/mk8QRSt5q26lbKf0tp9ckubd3Rker3
         lzbQ==
X-Gm-Message-State: AAQBX9f+mvgcFQBy7IV7vfp1beSdRovHCs9x7DA7OMqKAej2d2yPykKA
	gUItbaEHH6DyWORzvSFpdQ==
X-Google-Smtp-Source: AKy350Zzh18IDSS9PRm/nm4uzfWROBk4i8K8e/GnmjZJixonIc4wyA8Ejs1S5hYlKdIJ6vpTCTaGZw==
X-Received: by 2002:a05:6870:1fcd:b0:172:5de5:785 with SMTP id gp13-20020a0568701fcd00b001725de50785mr13981327oac.6.1680105180656;
        Wed, 29 Mar 2023 08:53:00 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b4-20020a056871030400b001762ce27f9asm11853490oag.23.2023.03.29.08.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:00 -0700 (PDT)
Received: (nullmailer pid 3198091 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:12 -0500
Subject: [PATCH 15/19] cpufreq: sun50i: Add explicit include for cpu.h
MIME-Version: 1.0
Message-Id: <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Amit Daniel Kachhap <amit.kachhap@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_085303_077636_83C5A2C0 
X-CRM114-Status: GOOD (  13.54  )
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

UmVtb3ZpbmcgdGhlIGluY2x1ZGUgb2YgY3B1LmggZnJvbSBvZl9kZXZpY2UuaCBjYXVzZXMgYW4g
ZXJyb3I6Cgpkcml2ZXJzL2NwdWZyZXEvc3VuNTBpLWNwdWZyZXEtbnZtZW0uYzo0MjoxOTogZXJy
b3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGdldF9jcHVfZGV2aWNl4oCZ
OyBkaWQgeW91IG1lYW4g4oCYZ2V0X2RldmljZeKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rp
b24tZGVjbGFyYXRpb25dCgpBcyBvZl9kZXZpY2UuaCBpcyBub3Qgb3RoZXJ3aXNlIG5lZWRlZCwg
aXQgY2FuIGJlIHJlcGxhY2VkIHdpdGggb2YuaAooYWxzbyBpbXBsaWNpdGx5IGluY2x1ZGVkKS4K
ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQpQbGVhc2Ug
YWNrIGFuZCBJIHdpbGwgdGFrZSB0aGUgc2VyaWVzIHZpYSB0aGUgRFQgdHJlZS4KLS0tCiBkcml2
ZXJzL2NwdWZyZXEvc3VuNTBpLWNwdWZyZXEtbnZtZW0uYyB8IDMgKystCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9j
cHVmcmVxL3N1bjUwaS1jcHVmcmVxLW52bWVtLmMgYi9kcml2ZXJzL2NwdWZyZXEvc3VuNTBpLWNw
dWZyZXEtbnZtZW0uYwppbmRleCAxNTgzYTM3MGRhMzkuLjQzMjFkN2JiZTc2OSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9jcHVmcmVxL3N1bjUwaS1jcHVmcmVxLW52bWVtLmMKKysrIGIvZHJpdmVycy9j
cHVmcmVxL3N1bjUwaS1jcHVmcmVxLW52bWVtLmMKQEAgLTEwLDkgKzEwLDEwIEBACiAKICNkZWZp
bmUgcHJfZm10KGZtdCkgS0JVSUxEX01PRE5BTUUgIjogIiBmbXQKIAorI2luY2x1ZGUgPGxpbnV4
L2NwdS5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L252bWVt
LWNvbnN1bWVyLmg+Ci0jaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+CisjaW5jbHVkZSA8bGlu
dXgvb2YuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxs
aW51eC9wbV9vcHAuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CgotLSAKMi4zOS4yCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
