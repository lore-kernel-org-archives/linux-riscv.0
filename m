Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C36FCD343B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 14:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cM7vRAnCT6HzCZ8XZss642wyW0MFFjrHSAizJsIpecU=; b=qX1CAtXOEl9pMP
	JwRWhZyWiBJ0ADYgx/1n9caumwzm5BRxseFETKp7kdq4PavMiG1j5ZRANE3Yx+5DmM8SF/nSvWErY
	PSLHEyQ87jDcQpE/vBuFsg18zIgHDUiuhE76SnrLf2iEbyjojo3I0/gTbLqK+jN/vsddFadncCAxN
	8eCldUvPcG+OEmRYWJ7oHQL5FAS2mV6kM7o7L/Ue9w64kx4cOSkH2b6Vve1FhRjpbnR1FrV+txFrd
	prvOWaLd6XkBwYHxDEIWjr8k4K71GdwHELf8MfKRrOj+gyJjUCYj54nKkA96yO2m3Bv3t7FGOz3uw
	bcBKqEfxu/KmDYwyqzkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdIt-000000016Q0-0sD3;
	Wed, 06 May 2026 14:32:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdIr-000000016PY-3mNK
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 14:32:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F03A860103;
	Wed,  6 May 2026 14:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD95C2BCC7;
	Wed,  6 May 2026 14:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778077964;
	bh=M4Op3MU8U7qnFirwJEpwL6TP+LDf5NNBUxWnDHHh+ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XeMZZyp8ExfOaWggSUq1pd6kDO03pFpo+gCgb8xbicGas9fdGsFXtK325XqXKS0cb
	 TCfRe2GdYDmnGvdmJbSo1SEv0UbHebmojCXfG9pEFLDrxF2OHzWJvhA/ioc12ZUQMu
	 s0KHBIWMjBsLHzrr5Q+SCQKSX075RA0TOC0WoGj4bMs3QjgZmi50cnEbe33lQaqnm2
	 GU5QVVFNdOJW7qFwpJ1nTGAy2BX5C3lYp9lt/EKdzv70lagu1KDG3U2YWp/cJUH/tQ
	 D4GUMexjSTCRQ8n1A63coMyxFXXvkekHcBAKl2LVI+m7DI1IUzpKj45SsL3I8Te8D6
	 eznSX3yLHKyrw==
Date: Wed, 6 May 2026 07:32:41 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Subject: Re: [External] [PATCH RFC v3 00/11] RISC-V: QoS: add CBQRI resctrl
 interface
Message-ID: <aftRCQhRc585Jski@x1>
References: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
 <CAEEQ3wn3F-Wg-Wi+d5znpcgt5pfJVuRQCPvi4W7q4an+SLrOdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wn3F-Wg-Wi+d5znpcgt5pfJVuRQCPvi4W7q4an+SLrOdQ@mail.gmail.com>
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
Cc: x86@kernel.org, Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-kernel@vger.kernel.org, Gong Shuai <gong.shuai@sanechips.com.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J. Wysocki" <rafael@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Gong Shuai <gsh517@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Peter Newman <peternewman@google.com>, Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMDUsIDIwMjYgYXQgMTI6NDY6MTRQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFdlZCwgQXByIDE1LCAyMDI2IGF0IDk6NTfigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBDaGFuZ2Vsb2cKPiA+IC0t
LS0tLS0tLQo+ID4gQ2hhbmdlcyBpbiB2MzoKPiAKPiBUaGFua3MgZm9yIHBvc3RpbmcgdGhlIHNl
cmllcy4gT25jZSB0aGUgcmVtYWluaW5nIGlzc3VlcyBhcmUKPiBhZGRyZXNzZWQsIGFyZSB5b3Ug
Y29uc2lkZXJpbmcgbW92aW5nIHRoaXMgb3V0IG9mIFJGQyBpbiB0aGUgbmV4dAo+IHJldmlzaW9u
PwoKSSBkbyBpbnRlbmQgdG8gcG9zdCBhcyBhIHJlYWwgbm9uLVJGQyBwYXRjaCBzZXJpZXMgZXZl
bnR1YWxseSBidXQgdGhlCnR3byBtYWluIG9wZW4gaXNzdWVzIGFyZToKCiAgLSByZWZhY3RvciBz
dXBwb3J0IGZvciBiYW5kd2l0aGQgcmVzZXJ2YXRpb24gYW5kIGJhbmR3aWR0aCB3ZWlnaHQgb24K
ICAgIFJlaW5ldHRlJ3MgcHJvb2Ytb2YtY29uY2VwdCBvbmNlIHRoYXQgaXMgcG9zdGVkLgoKICAt
IEFDUEkgUlFTQyBoZWFkZXJzIGFkZGVkIHRvIExpbnV4IHRocm91Z2ggdGhlIHN0YW5kYXJkIEFD
UElDQSBwcm9jZXNzCiAgICBvbmNlIHRoZSBSUVNDIHNwZWMgaXMgcmF0aWZpZWQuCgpUaGFua3Ms
CkRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
