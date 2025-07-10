Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2F4C83F1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vF2cwJkq1ATEPVYj0mBU/Si6Rs9fYitKemH9wDhQ3aU=; b=f9WvfgtLsZLFWB
	s34Zi6mjY971sGJCXIQ6zLIoBJbsTgmzHtyq++TUjTxwjo6T0GXY9k/PyBaTszPV+LSMnR2wYtSHv
	oDX633gDUifhCHUixzSiVrKfreTtT7mPOdAqHUrdZXQCp8Z5itC16kZ+DgL33MePI5dA5LwuLQdfm
	5425uktowLMYI3EKUsg63nisuGpnhTr8mHGIvDZHf7UR2toMMhLjcLSH81RFgravELvuA/Rqp8jY2
	33ZqATqPwaWC2jFaLHFvSLEnBS5TFm3uLEzntwYaK34whN+FAXKV065k0xM0mV9ZvR9X35unyYPtI
	qTGFDO5jMMxL00dFcHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpGB-0000000Bbit-45ZH;
	Thu, 10 Jul 2025 11:16:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZncz-0000000BM1K-2IO9
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 09:31:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC36343D47;
	Thu, 10 Jul 2025 09:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574A2C4CEE3;
	Thu, 10 Jul 2025 09:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752139900;
	bh=K8hqorRx8RHxWxh+27NmExO7IYTxx5BVjkb0dKupVi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlkHEVn4rQlewMGM94eJQB8J2VR48tnfHqRAPrYW+UpusGYMGhw7hs9ewCfgpYZLa
	 4D/fEZ5VA4mQrQUgPVyQ0er3BM/VNhBoy9F2WBFnVZE1kycbFBIoDPkCzdG+RZ+r3f
	 5hqpd9D8oc1YH7rKDG66IEsOShdPZf2/mSQJrVrvwSYhVVyLEBCk0Y8Duw3tRpmKa5
	 pkZAXItVKeWEaeVKYq7+TkAwk0sCtHNrmDQGaE5LK52PdjredG/5auKJiK3yEzQUxZ
	 HXaFSyA+AIW7Z2kzGY2PosktYEN8Mdh7phTKf4ua4Pz3eDPz85JY0YQPD2l7RLWTUN
	 M8P3SBFzyRDsg==
Date: Thu, 10 Jul 2025 10:31:34 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/8] mfd: simple-mfd-i2c: add SpacemiT P1 support
Message-ID: <20250710093134.GC1431498@google.com>
References: <20250702213658.545163-1-elder@riscstar.com>
 <20250702213658.545163-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702213658.545163-4-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_023141_604490_DFBD75E7 
X-CRM114-Status: GOOD (  10.13  )
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

T24gV2VkLCAwMiBKdWwgMjAyNSwgQWxleCBFbGRlciB3cm90ZToKCj4gRW5hYmxlIHN1cHBvcnQg
Zm9yIHRoZSBSVEMgYW5kIHJlZ3VsYXRvcnMgZm91bmQgaW4gdGhlIFNwYWNlbWlUIFAxCj4gUE1J
Qy4gIFN1cHBvcnQgaXMgaW1wbGVtZW50ZWQgYnkgdGhlIHNpbXBsZSBJMkMgTUZEIGRyaXZlci4K
PiAKPiBUaGUgUDEgUE1JQyBpcyBub3JtYWxseSBpbXBsZW1lbnRlZCB3aXRoIHRoZSBTcGFjZW1p
VCBLMSBTb0MuICBUaGlzCj4gUE1JQyBwcm92aWRlcyA2IGJ1Y2sgY29udmVydGVycyBhbmQgMTIg
TERPIHJlZ3VsYXRvcnMuICBJdCBhbHNvCj4gaW1wbGVtZW50cyBhIHN3aXRjaCwgd2F0Y2hkb2cg
dGltZXIsIHJlYWwtdGltZSBjbG9jaywgYW5kIG1vcmUuCj4gSW5pdGlhbGx5IGl0cyBSVEMgYW5k
IHJlZ3VsYXRvcnMgYXJlIHN1cHBvcnRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEVsZGVy
IDxlbGRlckByaXNjc3Rhci5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAg
ICAgfCAxMSArKysrKysrKysrKwo+ICBkcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jIHwgMTIg
KysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKTG9va3Mg
Z29vZC4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
