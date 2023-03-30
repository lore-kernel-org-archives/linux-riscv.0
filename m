Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02AAC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 03:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoHx5ShDoZrirez5TZQ8N7ZxuR1KKvCd53ZW5c1S+pA=; b=TxUnWzRWs0eK9B
	V7ipO99T2kV5Sn++/zCeERObMCqMNztcFsMUfhp4bhUG6FP0Su83ZegO5at3R2RddCnUMBKcQ5xK4
	ZIPd3BH8E67n3B3bVK0OqUIKLuiOdy+qFbdxMOWqM3uHzcfhqI81JtWwQ8oJecDgz5676CgxRNHWv
	14CSnZydd9dc+z0dxqVyGCfvbjUzLPHLFn+erOCjE1Ivtd6FLDXY3BZRcYZ/0ldwBP8H9qWmZANad
	3psIkKRa8gP/GKXQ0cmLSjYELEFD799QYmjE/wdWfucAk1Wg2eZrnngbFN7AeUg4UnV7XRsUxty8s
	mqDZWbhyNvOS68YF/CeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phjND-002T2R-1p;
	Thu, 30 Mar 2023 03:54:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phjNA-002T0R-1z
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 03:54:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id ja10so16910748plb.5
        for <linux-riscv@lists.infradead.org>; Wed, 29 Mar 2023 20:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680148485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mwmSNDnybMqBEh0Z+gPmCfYtw9bkrJ0PR1su4QL+8ng=;
        b=GfolM2geRXzvdw+ehZXpU8LIxL1xjz8Gj7iUHWYn0dQe/xK6gKP+jAnnfACd9dNas/
         V++Sm0TyABcLhhIGfP5TWHGwoCe9wculMPYuWNh8MX5dslq4eZGiHhMbH8QnfrjFjyDi
         1R02/q4m606IhgQClA65oAaxUmLy9Tlpoo3VU7hbegQucmzXRckhRFIw+Bte6EBu90qm
         Eybgi+WtfZP6vwZHlApEpFbN2Q1QBxtwJODT8JmI2ozap/CAX0ZDAlAhOh4ro/TsRICH
         q6vFusF7IDZ1ivkOyQ2u6hFyH7XuM27wai0R73hAJNlIGTC/gbz4+yD+DIAgG5FzF0WR
         8Nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680148485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mwmSNDnybMqBEh0Z+gPmCfYtw9bkrJ0PR1su4QL+8ng=;
        b=Jz5wzRd5hkgnbyJ9EIA2LXObHn7w0A8vVEyW1BUHcbIr5h1kh+djBUnKXhXFTTwROO
         gd4ZmdKQia87lyI7+DMvI9v1K5oT18UgSBbBB/0kB43lXrdtqf2byxo0vsDrtodKWIu3
         AUJEJl9hcV+QsdRgBp5W7n3VXZBPuktu/RiaIAcK8hxIf22WWYCXHmFMss+itOede001
         VTsZAlEc6LatjEeQUnRmG8IlvIErqyDzy7YL/NYHPm/Ta4DeSn2FYIygDadIvr0yMfW7
         wDJCoMXMLJrtl9LwkQEkagUwkjY8AFfs5wLF0UVc//3/njSOowbYslrYszXcGrGwFj/m
         djNw==
X-Gm-Message-State: AAQBX9dncSFtOFNWBQBmrMgnbuzu01WKiJQsVpKIk26dcVOGe1JtI1iU
	0C2emK5L74g1KQTN91vbU/wOKw==
X-Google-Smtp-Source: AKy350ZtoosHc1UXvyJfiqR7/4WaAgxoUcypk7oVcM2Qe5NgerUZWsBCiwEUDE9iUeMBrzKflkrmgQ==
X-Received: by 2002:a05:6a20:b71f:b0:e0:316a:d62c with SMTP id fg31-20020a056a20b71f00b000e0316ad62cmr11170953pzb.60.1680148485691;
        Wed, 29 Mar 2023 20:54:45 -0700 (PDT)
Received: from localhost ([122.172.85.168])
        by smtp.gmail.com with ESMTPSA id q17-20020a62ae11000000b0062607d604b2sm23791281pff.53.2023.03.29.20.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 20:54:45 -0700 (PDT)
Date: Thu, 30 Mar 2023 09:24:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Amit Daniel Kachhap <amit.kachhap@gmail.com>,
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 15/19] cpufreq: sun50i: Add explicit include for cpu.h
Message-ID: <20230330035443.kowj26o4z22yg5f7@vireshk-i7>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_205448_652214_11051284 
X-CRM114-Status: GOOD (  17.97  )
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

T24gMjktMDMtMjMsIDEwOjUyLCBSb2IgSGVycmluZyB3cm90ZToKPiBSZW1vdmluZyB0aGUgaW5j
bHVkZSBvZiBjcHUuaCBmcm9tIG9mX2RldmljZS5oIGNhdXNlcyBhbiBlcnJvcjoKPiAKPiBkcml2
ZXJzL2NwdWZyZXEvc3VuNTBpLWNwdWZyZXEtbnZtZW0uYzo0MjoxOTogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGdldF9jcHVfZGV2aWNl4oCZOyBkaWQgeW91IG1l
YW4g4oCYZ2V0X2RldmljZeKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dCj4gCj4gQXMgb2ZfZGV2aWNlLmggaXMgbm90IG90aGVyd2lzZSBuZWVkZWQsIGl0IGNhbiBi
ZSByZXBsYWNlZCB3aXRoIG9mLmgKPiAoYWxzbyBpbXBsaWNpdGx5IGluY2x1ZGVkKS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+IFBsZWFz
ZSBhY2sgYW5kIEkgd2lsbCB0YWtlIHRoZSBzZXJpZXMgdmlhIHRoZSBEVCB0cmVlLgo+IC0tLQo+
ICBkcml2ZXJzL2NwdWZyZXEvc3VuNTBpLWNwdWZyZXEtbnZtZW0uYyB8IDMgKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jcHVmcmVxL3N1bjUwaS1jcHVmcmVxLW52bWVtLmMgYi9kcml2ZXJzL2NwdWZy
ZXEvc3VuNTBpLWNwdWZyZXEtbnZtZW0uYwo+IGluZGV4IDE1ODNhMzcwZGEzOS4uNDMyMWQ3YmJl
NzY5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY3B1ZnJlcS9zdW41MGktY3B1ZnJlcS1udm1lbS5j
Cj4gKysrIGIvZHJpdmVycy9jcHVmcmVxL3N1bjUwaS1jcHVmcmVxLW52bWVtLmMKPiBAQCAtMTAs
OSArMTAsMTAgQEAKPiAgCj4gICNkZWZpbmUgcHJfZm10KGZtdCkgS0JVSUxEX01PRE5BTUUgIjog
IiBmbXQKPiAgCj4gKyNpbmNsdWRlIDxsaW51eC9jcHUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21v
ZHVsZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvbnZtZW0tY29uc3VtZXIuaD4KPiAtI2luY2x1ZGUg
PGxpbnV4L29mX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcG1fb3BwLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CgpBY2tlZC1ieTogVmlyZXNoIEt1bWFyIDx2aXJlc2gu
a3VtYXJAbGluYXJvLm9yZz4KCi0tIAp2aXJlc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
