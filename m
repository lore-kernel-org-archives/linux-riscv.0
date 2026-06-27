Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C50C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 21:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5gqniPy5IMdiuXl2rKo3BQpyhYcSkL0TdPsQpjKqB4=; b=HezNylZUDpd8nU
	vX6bbqoWETwKJ5UWTSYG3AACoF6RZNZSVtGg+WEMw9C2hpv+H9Rp0O/jSbUMDGoeyfikepYsXSpKX
	gWVu6sZZgjjp4nCLzGXOO1PFpt+NwKeutceFsger/wKBMC0XhfKI+QTAecH3vfJCmxW9OpaE2ojJ8
	7IhvbH1BvKQLiAEqE0I+BYy9gw3gB7BYpVb1pHwqlRwGKZQBjZrJoNJlNtjlNEBcbhar/ceMa7iF/
	9OxSf95FcBCbBPQrjzTI5S8MtZMG//G094NJlyuk0OSuoslMK7H8gQ4+m1BU4ChuuaLdsmDunUbaZ
	uGI8bTK5DkjueTXpNVJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdb2f-0000000Cmgb-0P1z;
	Sat, 27 Jun 2026 21:58:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdb2d-0000000CmgV-2lIZ
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 21:58:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02FC06001A;
	Sat, 27 Jun 2026 21:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF02E1F000E9;
	Sat, 27 Jun 2026 21:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782597500;
	bh=uZXwtqYNMN/pWvO18BeaeKY5yndoYWWKV6GT+91H/4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JogHNs31si+WmhGKyhRfRw5b8Ct3uNp1lUblX4mn+NmJtK1bG+yhQKUhi2s9s3Xmy
	 nbvCiGtp9TaRpTk1dTHxXIbbBZH3xSlkI6t4G2IesjVQ6NIxWYhgNMmJojWNsHI7Ak
	 v1nY5Lmx9/9XfNJ23VWXgHqk6wGv4+NNryShajW7Rj7ZKS0XkbrE3dRxI/zjHcmXZv
	 DH+KPnZsy3qb8YgLSzNvlAwc8imXXK6KDbXE+Nyvhc6QxHHxvP61EwbHyoRa5mIY6B
	 hWIAwzVvVNrXVuod5mYgr+cvglnWNGgNOey3UfvyFHPSbQQ6TsxYNJ5aClN8PTwV+u
	 OiJcE3U3WiL2w==
Date: Sat, 27 Jun 2026 14:58:18 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [External] [PATCH v2 3/8] riscv: Add support for srmcfg CSR from
 Ssqosid extension
Message-ID: <akBHesvINKE+nCXF@x1>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
 <20260624-dfustini-atl-sc-cbqri-dt-v2-3-2f8049fd902b@kernel.org>
 <CAEEQ3wkhiE=TdFTzEn39GVWSgGnaN0raBpmd=6sYaoh304LNBg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wkhiE=TdFTzEn39GVWSgGnaN0raBpmd=6sYaoh304LNBg@mail.gmail.com>
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

T24gU2F0LCBKdW4gMjcsIDIwMjYgYXQgMDU6Mzg6MjhQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFRodSwgSnVuIDI1LCAyMDI2IGF0IDk6NDDigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6ClsuLl0KPiA+ICtjb25maWcgUklT
Q1ZfSVNBX1NTUU9TSUQKPiA+ICsgICAgICAgYm9vbCAiU3Nxb3NpZCBleHRlbnNpb24gc3VwcG9y
dCBmb3Igc3VwZXJ2aXNvciBtb2RlIFF1YWxpdHkgb2YgU2VydmljZSBJRCIKPiA+ICsgICAgICAg
ZGVwZW5kcyBvbiA2NEJJVAo+IAo+IFdoeSBpcyA2NEJJVCByZXF1aXJlZCBoZXJlPwoKU2FzaGlr
byByYWlzZWQgbWFueSBwb3RlbnRpYWwgaXNzdWVzIHJlbGF0ZWQgdG8gUlYzMiBpbiByZXZpZXdz
IG9mIG15ClJGQyBzZXJpZXM6IAoKdjM6IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8y
MDI2MDQxNC1zc3Fvc2lkLWNicXJpLXJxc2MtdjctMC12My0wLWIzYjJlN2U5ODQ3YSU0MGtlcm5l
bC5vcmcKdjQ6IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUxMC1zc3Fvc2lk
LWNicXJpLXJxc2MtdjctMC12NC0wLWViNTM4MzFlZjY4MyU0MGtlcm5lbC5vcmcKdjU6IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUyNC1zc3Fvc2lkLWNicXJpLXJxc2Mtdjct
MC12NS0wLTc4ZDNhN2JhOWRiZSU0MGtlcm5lbC5vcmcKdjY6IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC8yMDI2MDYwMS1zc3Fvc2lkLWNicXJpLXJxc2MtdjctMC12Ni0wLWJhZjAwZjUw
MDI4YSU0MGtlcm5lbC5vcmcKClJWMzIgc3lzdGVtcyB3aXRoIENCUVJJIGRpZG4ndCBzZWVtIGxp
a2VseSB0byBtZSBzbyBJIGRlY2lkZWQgcmVxdWlyaW5nCjY0QklUIHdvdWxkIGVsaW1pbmF0ZSB0
aGUgcG90ZW50aWFsIGlzc3VlcyB0aGF0IFNhc2hpa28gcmFpc2VkLiBJZiB0aGVyZQppcyBhY3R1
YWxseSBhIDMyLWJpdCBpbXBsZW1lbnRhdGlvbiB0aGF0IHNvbWVvbmUga25vd3Mgb2YsIHRoZW4g
SSB3b3VsZApiZSBoYXBweSB0byByZS1ldmFsdWF0ZSBSVjMyIHN1cHBvcnQuCgpUaGFua3MsCkRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
