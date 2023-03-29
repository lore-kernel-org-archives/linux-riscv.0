Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D1EC74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 15:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZNiDp9LFwTimg5gmXldY+tiYv73Olw3Grcy/vKcuSEU=; b=ieShhi8EqU4yqv
	ZJERNNEtGpU3HujVKT2EDXRep6sVLWHjCjNybXNx2mj0Lgjgo2TH9JvMQdDB4TTt0MdhkIPWEeZj1
	mKO2n9IgHgeFSC3I8ryz3Izy9bcT0KgjG6tvOU5euK2NzVRlIIuZTyW/a1y7ss4lAW2sq819XM53H
	fJp3vKLe3P/pX39l+JoJgP7c5n8g61ZlRE2iO0O8u/NSw6Rn1CRjuyp0JbwcGYS7iMFJdMSeekj/O
	qM08LIwomnbnx2hzUdW43i06qi0HvJ+jBCPJVO2XCGL2O3BAaVlhbqO3/zL8v6BUepQMYfaKxIvyI
	0ODMTJWytaFQALiu+oGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6y-000sql-1H;
	Wed, 29 Mar 2023 15:53:20 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phY6j-000sZT-11;
	Wed, 29 Mar 2023 15:53:06 +0000
Received: by mail-oi1-f178.google.com with SMTP id w13so543657oik.2;
        Wed, 29 Mar 2023 08:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxkTC00mmtvkJ/ocm+Trr4LHDuiGbRgef51Eh65eFno=;
        b=nWZMt7/igFhDhifOmQIervoF2is8rxPLrN1paMETwARgswPmDG0DAdHF720PLXp8Jz
         tRaaKphER1whufjn3yBK7A6YJ7BZgxkzYO7KMznVM8a4W/LV3fIyknjyNyFnplhZ1jKS
         lC6CwfbPhKtO6GJNyHy3WB3aI6KYBI9PmTz37e4Wzm5ADDR/R2bkJkcaOtehV1U7JIyB
         4BwjwPn3aAEvGsuW7S4ofJj52xOYaHJRgX+Qpyk73bHxbwmP9vejTwAosM2TJrnxEa5V
         /fYbXoEHGnwEbqx8JQfY8eksMzk3iKkfSoH1g0zsnFo2uZlIUDUUSR3So8b8wIWtsxhv
         YVzQ==
X-Gm-Message-State: AO0yUKU/EoBlfre6be/gxu1Jf9Tb+xen/O6T4ph9CHDv/vQSj58GlukZ
	/0qmyxmn5BiII0YFLTOFYw==
X-Google-Smtp-Source: AK7set/XHs0DeHUv3FR5klH7bLctWLDiPHbV4Bgynq9MiBxHYJ127vn5iRHwUkAWb6rjGdajk82w8Q==
X-Received: by 2002:a05:6808:1445:b0:387:715e:56b8 with SMTP id x5-20020a056808144500b00387715e56b8mr10764982oiv.56.1680105182676;
        Wed, 29 Mar 2023 08:53:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p184-20020acad8c1000000b003896e31867esm228723oig.49.2023.03.29.08.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:02 -0700 (PDT)
Received: (nullmailer pid 3198083 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:52:08 -0500
Subject: [PATCH 11/19] clocksource: ingenic: Add explicit include for
 cpuhotplug.h
MIME-Version: 1.0
Message-Id: <20230329-dt-cpu-header-cleanups-v1-11-581e2605fe47@kernel.org>
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
X-CRM114-CacheID: sfid-20230329_085305_377396_6B5BFFCB 
X-CRM114-Status: GOOD (  13.00  )
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

UmVtb3ZpbmcgaW5jbHVkZSBvZiBjcHUuaCBmcm9tIG9mX2RldmljZS5oIChpbmNsdWRlZCBieSBv
Zl9wbGF0Zm9ybS5oKQpjYXVzZXMgYW4gZXJyb3IgaW4gaW5nZW5pYy10aW1lcjoKCmRyaXZlcnMv
Y2xvY2tzb3VyY2UvaW5nZW5pYy10aW1lci5jOiBJbiBmdW5jdGlvbiDigJhpbmdlbmljX3RjdV9p
bml04oCZOgpkcml2ZXJzL2Nsb2Nrc291cmNlL2luZ2VuaWMtdGltZXIuYzozMzg6MTU6IGVycm9y
OiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhjcHVocF9zZXR1cF9zdGF0ZeKA
mQoKVGhlIG9mX3BsYXRmb3JtLmggaGVhZGVyIGlzIG5vdCBuZWNlc3NhcnkgZWl0aGVyLCBzbyBp
dCBhbmQgb2ZfYWRkcmVzcy5oCmNhbiBiZSBkcm9wcGVkLgoKU2lnbmVkLW9mZi1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tClBsZWFzZSBhY2sgYW5kIEkgd2lsbCB0YWtlIHRo
ZSBzZXJpZXMgdmlhIHRoZSBEVCB0cmVlLgotLS0KIGRyaXZlcnMvY2xvY2tzb3VyY2UvaW5nZW5p
Yy10aW1lci5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL2luZ2VuaWMtdGltZXIu
YyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvaW5nZW5pYy10aW1lci5jCmluZGV4IDI0ZWQwZjFmMDg5
Yi4uMDg5Y2U2NGIxYzNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsb2Nrc291cmNlL2luZ2VuaWMt
dGltZXIuYworKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL2luZ2VuaWMtdGltZXIuYwpAQCAtOSwx
MyArOSwxMiBAQAogI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgogI2luY2x1ZGUgPGxpbnV4L2Nsb2Nr
Y2hpcHMuaD4KICNpbmNsdWRlIDxsaW51eC9jbG9ja3NvdXJjZS5oPgorI2luY2x1ZGUgPGxpbnV4
L2NwdWhvdHBsdWcuaD4KICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KICNpbmNsdWRlIDxs
aW51eC9tZmQvaW5nZW5pYy10Y3UuaD4KICNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+CiAj
aW5jbHVkZSA8bGludXgvb2YuaD4KLSNpbmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+CiAjaW5j
bHVkZSA8bGludXgvb2ZfaXJxLmg+Ci0jaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4KICNp
bmNsdWRlIDxsaW51eC9vdmVyZmxvdy5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rldmlj
ZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgoKLS0gCjIuMzkuMgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
