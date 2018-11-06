Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3ECC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 22:17:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59CA820830
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 22:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N4FCRLtD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="HXkIzmGE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59CA820830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mL06FWSzv40zPsVKIphRdZyWRz2evc6XEEJmkio1G10=; b=N4FCRLtDWnEWVz
	dTxSNwIPNq7daSNnvxL3yHkzHTVWUxBFrTCLohquQvdCrJFhv/7Yut3F3X5IpIbL85u/waW2eyiaO
	3RmKSm9ThJHS0PtIR1vcwM0SAdDrS/pXfpZw1qOMaxtEupMyzlS1eeCWI//OiBYp7rP6gFxyQOtUI
	lLjFOPWslO8OOmebC8ML5CO89Ayy0rBHVosWxGxHLLQCRYbWCBIYYW2jcM80qGKfzshBitVvCnknV
	A9M8rjA6tmsq4eDD61ioRFCc9+ByhZUE0N0S0W7+MzDvA3twftJ+FFmIsdYRGZayAm2494f5XYcQW
	+piXELDk/DaEtUFwtlrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gK9eh-0005hE-0p; Tue, 06 Nov 2018 22:17:03 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK9ec-0005VA-HL
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 22:17:00 +0000
Received: by mail-lj1-x242.google.com with SMTP id v15-v6so4316378ljh.13
 for <linux-riscv@lists.infradead.org>; Tue, 06 Nov 2018 14:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=VdxuFMwGQV0m9VpNMFr1KgrEwQF0djPcDMtrmuA0Szc=;
 b=HXkIzmGEetC4n9jBkg77nxoNEvp6EcIIK03YhDs3X0Zr6EgNaEk4tLkrAbt5ORFFtD
 dcQu8n5M+Lvia5mzhyGvbsVqOOFQaNf/bPhoWbzesXm0XC+B5jDpeo94CfktdiWjd72X
 1sp1+Lh6HsloHkercDT5TbiG1gAXcXLsZ2XREIvglbqhPbu9mz6YaOTmktt734qHaW/J
 Q2EDTslVp1s/Kx4pm3HPhuQo99tpl97xK6hCkQpEsyewzmNX7KI61ycfXSFRGUNsgJ/H
 ccHjigw+7P9JBvxZ3cbyQUMEbXBPdDkBYwCnTLoGKDbcu4UbYic+K7ll8fWj2otPGDCg
 +xEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=VdxuFMwGQV0m9VpNMFr1KgrEwQF0djPcDMtrmuA0Szc=;
 b=g8rgJQ4TdjNoMAEjoyKZi2bX6quYUnwkfw55dcLZiyAKtdrF3qc2fK2moSR2t6Vvf7
 ZJjneHS+poilbtDgHtx+5o/Zg25um8L+I49VN6J1P+Ih6UDwJtIisVXc4g3FfzgemCwG
 AmuEQTJrTUUnUrwjsBUOCd5kp3nLXVOcH5G5jBcrs49WkCRakgHmaDJ+qi2qlnmt+MQg
 h4IaAI2KQW4FbtqIyZMalkITc/Xwgl2sbaQ39XKmkl/nP6cAOQGnugMd44QyjSCFnGEs
 Ml5evMnrEZPFWMjGKjVNLtgPe8U+C00E63bF3ph//Qa4e0Deu/haDlYqbLCin/nB3Ika
 4z4g==
X-Gm-Message-State: AGRZ1gJIe83HN6pfj169klwALcIRcBJvuLJmaSxibrx2Bmm50yVDHMlF
 SBeqcZdKjQMBRSRLtakgTa1ssxDqqBZSfeE6rfqqfQ==
X-Google-Smtp-Source: AJdET5fDa1wlE3AfHgkylqlc3zOjo6Bci/xyk1VqRmYzKYtpgdviBBZC6ecErwbKtE1SIMABJB0Z1ff7sPwnKl82S6k=
X-Received: by 2002:a2e:91d1:: with SMTP id
 u17-v6mr2050048ljg.160.1541542603077; 
 Tue, 06 Nov 2018 14:16:43 -0800 (PST)
MIME-Version: 1.0
From: Olof Johansson <olof@lixom.net>
Date: Tue, 6 Nov 2018 14:16:27 -0800
Message-ID:
 <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
Subject: [TECH TOPIC] SoC maintainer group
To: ksummit <ksummit-discuss@lists.linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_141658_577516_F31CFD0D 
X-CRM114-Status: GOOD (  13.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: rmk@armlinux.org.uk, Arnd Bergmann <arnd@arndb.de>,
 Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-riscv@lists.infradead.org, linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106221627.o8PIGmVYvSoIK-yMEzbS0Hu-PgLsdK0QLKF5Yz2yw-4@z>

SGkgS1Mgb3JnYW5pemVycyAoYW5kIG90aGVycyksCgpUaGlzIGlzIGEgbGF0ZSB0b3BpYyBwcm9w
b3NhbCwgaG9wZWZ1bGx5IHRoZXJlIGlzIHN0aWxsIHRpbWUgb24gdGhlIGFnZW5kYS4KCldl4oCZ
dmUgcmVjZW50bHkgYmVlbiBkaXNjdXNzaW5nIHNvbWUgbWFpbnRhaW5lciBtb2RlbCBjaGFuZ2Vz
IGFzCmRlc2NyaWJlZCBiZWxvdywgYW5kIHdvdWxkIGxpa2UgYSBzbG90IHRvIGRpc2N1c3MgdGhl
IGlkZWEgYW5kIHNvbGljaXQKZmVlZGJhY2svY29tbWVudHMgZnJvbSB0aGUgb3RoZXJzIHRoZXJl
LgoKClRoaXMgc3RhcnRlZCB3aXRoIEFybmQgYW5kIEkgZmluYWxseSBiZWluZyBpbiBvbmUgcGxh
Y2UgYXQgdGhlIHNhbWUKdGltZSwgYW5kIHRhbGtpbmcgYWJvdXQgaG93IHdlIHdhbnQgdG8gZXZv
bHZlIGFybS1zb2MgbWFpbnRhaW5lcnNoaXAKbW92aW5nIGZvcndhcmQuIFdlJ3ZlIGJlZW4gaW5k
ZXBlbmRlbnRseSB0aGlua2luZyBvZiB3YXlzIHRvIGV4cGFuZAp0aGUgZ3JvdXAgYW5kIG1ha2lu
ZyBpdCBtb3JlIHNlbGYtc2VydmljZSBmb3IgZXZlcnlib2R5LCBidXQgdGhlcmUncyBhCmJ1bmNo
IG9mIHRvb2xpbmcgbmVlZGVkIHRvIG1ha2UgaXQgcnVuIHNtb290aGx5IGJleW9uZCB0aGUgc21h
bGxlcgpncm91cCB3ZSBoYXZlIG5vdy4KCkluIHRoZSBlbmQsIHdlIGVuZGVkIHVwIGxvb2tpbmcg
YXQgaXQgZnJvbSBhIHNsaWdodGx5IGRpZmZlcmVudCBhbmdsZToKUmlnaHQgbm93LCB3aGVuIGNv
bnRyaWJ1dG9ycyBzaG93IHVwIHdpdGggbmV3IHBsYXRmb3JtIHN1cHBvcnQsIHRoZQpmaXJzdCBo
aWxsIHRoZXkgbmVlZCB0byBjbGltYiBpcyBmaWd1cmluZyBvdXQgaG93IHRoZXkgbmVlZCB0byBj
YXJ2ZQp1cCB0aGVpciBwbGF0Zm9ybSBhbW9uZyBhbGwgdGhlIHZhcmlvdXMgbWFpbnRhaW5lcnMs
IGhvdyB0byBtYWtlIHN1cmUKdGhleSdyZSBhbGwgaGFuZHNoYWtpbmcgb24ga2VlcGluZyB0aGlu
Z3Mgc3RhYmxlLCBhbmQgZ2V0IGNvZGUKc3VibWl0dGVkLiBJdCdzIGF3a3dhcmQsIG5vdCB3ZWxs
IGRvY3VtZW50ZWQgYW5kIG9uZSBvZiB0aGUgYmlnZ2VzdApvdmVyaGVhZHMgd2UgaGF2ZSBvbiBv
dXIgc2lkZSBhcyB3ZWxsLgoKV2hlbiB3ZSBzdGFydGVkIHRhbGtpbmcgdG8gb3RoZXIgbWFpbnRh
aW5lcnMsIHdlJ3JlIGFsc28gcmVhbGl6aW5nCnRoYXQgd2UgYXJlIGN1cnJlbnRseSBkdXBsaWNh
dGluZyBhIGxvdCBvZiB3b3JrLiBJbiBwYXJ0aWN1bGFyLCB3ZQpvZnRlbiBhbGwgZ2V0IGNjOmQg
b24gcGF0Y2ggc2VyaWVzLCBzbyB3ZSBhbGwgbmVlZCB0byByZWFkIGFuZCBmaWx0ZXIsCmFuZCBh
c3N1bWUgdGhhdCBvdGhlciBtYWludGFpbmVycyBzcG90IHRoZSByaWdodCBwYXRjaGVzLCBldGMu
CgpXZSBoYXZlIGRpc2N1c3NlZCBhIGZldyBkaWZmZXJlbnQgb3B0aW9ucywgYW5kIGl0IHNlZW1z
IGxpa2UgcG9vbGluZwptb3JlIG9mIHRoZSBjb250cmlidXRpb24gZmxvdyB0byBhIGdyb3VwIG9m
IGNvLW1haW50YWluZXJzIGlzIGEgdXNlZnVsCmFwcHJvYWNoLiBJbml0aWFsbHksIHdlJ3JlIGNv
bnNpZGVyaW5nIHRoZSBhcm0tc29jIHBsYXRmb3JtcywgY2xvY2sKZHJpdmVycyBhbmQgcGluY3Ry
bCBkcml2ZXJzLCB3aGljaCBhbGwgdGVuZCB0byBiZSBhZmZlY3RlZCBieSBuZXcKcGxhdGZvcm0g
Y29udHJpYnV0aW9ucyBpbiB0aGlzIHdheSwgYW5kIG9mdGVuIGVuZCB1cCBjcm9zcy1jYzpkIG9u
CmV2ZXJ5dGhpbmcuIEFkZGl0aW9uYWxseSwgdGhlIGZsb3cgZm9yIHN1Y2Nlc3NmdWxseSBtZXJn
aW5nIGEgbmV3CnBsYXRmb3JtIG9yIFNvQyBuZWVkcyB0byBiZSBkb2N1bWVudGVkIGFuZCBhZHZl
cnRpc2VkLiBUaGlzIGlzIHRydWUKd2hldGhlciBvciBub3Qgd2UgY2hhbmdlIHRoZSB3YXkgdGhh
dCBtYWludGFpbmVycyBjb29yZGluYXRlIGFtb25nc3QKdGhlbXNlbHZlcywgb3Igd2hldGhlciBv
ciBub3Qgd2UgY2hhbmdlIHRoZSBjdXJyZW50IHdvcmtmbG93IHVzZWQgYnkKcGxhdGZvcm0gY29u
dHJpYnV0b3JzIHRvZGF5LgoKU28sIHdlJ3JlIHBsYW5uaW5nIHRvIGNoYW5nZSB0aGluZ3MgdXAg
YSBiaXQuIFdlJ3JlIHN0YXJ0aW5nIGEgbmV3Cmdyb3VwIHRoYXQgcG9vbHMgY3VycmVudCBhcm0t
c29jLCBjbGsgYW5kIHBpbmN0cmwgZHJpdmVycyBhbmQKbWFpbnRhaW5lcnMgaW50byBvbmUgZnVu
bmVsLiBXZSdsbCBzZXQgdXAgYSBuZXcgbWFpbCBhbGlhcyBmb3IgdGhlCm1haW50YWluZXIgZ3Jv
dXAsIGFuZCBvbmUgc2hhcmVkIHBhdGNod29yayB0byBjb2xsZWN0IGNvbnRyaWJ1dGlvbnMuCldl
IHN0aWxsIGV4cGVjdCBkZXZlbG9wZXJzIHRvIHVzZSBleGlzdGluZyBtYWlsaW5nIGxpc3RzLCBh
bmQgd2Ugc3RpbGwKZXhwZWN0IGZvciBleGFtcGxlIEFSTSBwbGF0Zm9ybSBtYWludGFpbmVycyB0
byBrZWVwIHRoZWlyIHdvcmtmbG93IG9mCmNvbGxlY3RpbmcgcGF0Y2hlcyBmb3IgdGhlaXIgcGxh
dGZvcm0gbGlrZSB0aGV5IGRvIHRvZGF5LiBEb3duIHRoZQpyb2FkIGl0IG1pZ2h0IG1ha2Ugc2Vu
c2UgdG8gaW5jb3Jwb3JhdGUgb3RoZXIgZHJpdmVyIHN1YnN5c3RlbXMgYXMKd2VsbC4KCkJleW9u
ZCB0aGlzLCB3ZSdyZSBnb2luZyB0byBrZWVwIGEgY2xvc2UgZXllIG9uIHRoZSBkcm0tbWlzYyB0
cmVlLAp3aGljaCBpcyBleHBsb3JpbmcgYSBtb3ZlIHRvIGdpdGxhYiAoYW5kIHdvcmtpbmcgd2l0
aCBnaXRsYWIgb24gYWRkaW5nCnRoZSBmZWF0dXJlcyB0aGV5IG5lZWQgdG8gbW92ZSBvdmVyKS4g
SWYgdGhleSBnZXQgYSBicm9hZCBtYWludGFpbmVyCm1vZGVsIHdvcmtpbmcgd2VsbCBpbiB0aGF0
IGVudmlyb25tZW50IGl0IGNvdWxkIGJlIHNvbWV0aGluZyB3ZSByZXVzZQpmb3Igb3Vyc2VsdmVz
IHRvby4KClRoaXMgZ3JvdXAgd2lsbCBhbHNvIHRha2Ugb24gdGhlIHJlc3BvbnNpYmlsaXR5IG9m
IHB1dHRpbmcgdG9nZXRoZXIKdGhlIGRvY3VtZW50YXRpb24gYW5kIGV4cGVjdGVkIHBhdGNoIGZs
b3cgZm9yIG5ldyBwbGF0Zm9ybS9Tb0MKY29udHJpYnV0b3JzLiBUaGF0IGRvY3VtZW50YXRpb24g
d2lsbCBuZWVkIHRvIGV2b2x2ZSBhIGJpdCBvdmVyIHRpbWUKYXMgd2UgdHJ5IG91dCB0aGlzIG5l
dyBjb2xsYWJvcmF0aW9uIGJldHdlZW4gbWFpbnRhaW5lcnMuCgpUbyBhdm9pZCBhbiBhcHBlYXJh
bmNlIG9mICJBUk0gaXMgdGFraW5nIG92ZXIgYWxsIGFyY2hpdGVjdHVyZXMiLAp3ZSdsbCByZW5h
bWUgdGhpcyB0byBqdXN0IHRoZSBwbGFpbiAiU29DIHRyZWUvZ3JvdXAiLCBhbmQgZHJvcCBBUk0K
ZnJvbSB0aGUgbmFtZS4gQXMgbWVudGlvbmVkIGFscmVhZHkgaW5pdGlhbGx5IHdlJ3JlIGFudGlj
aXBhdGluZwpjb3ZlcmluZyBBUk0gKDMyLzY0LWJpdCBsaWtlIGJlZm9yZSkgYW5kIFJJU0MtViBw
bGF0Zm9ybSBhcmVhcyBpbiBhCnNpbWlsYXIgd2F5LiBGb3Igb3RoZXIgb2xkZXIvbWlub3IgYXJj
aGl0ZWN0dXJlcyB0aGF0IGFyZQpzZW1pLW9ycGhhbmVkLCB3ZSBtaWdodCBwaWNrIHVwIGNvZGUg
YXMgbmVlZGVkIHdoZW4gaXQgYWZmZWN0cyB1cywKZGVwZW5kaW5nIG9uIG1haW50YWluZXIgc3Rh
dHVzIGF0IHRoZSBvdGhlciBlbmQuCgpXZSdyZSBkb2luZyB0aGUgZ3JvdW5kd29yayBub3csIGFu
ZCB3aWxsIGdldCB0cmVlcy9saXN0cy9wYXRjaHdvcmtzCnNldHVwIGZvciB0aGUgbmV4dCByZWxl
YXNlIGN5Y2xlLgoKClBlb3BsZSBpbnZvbHZlZCBzbyBmYXIgYXJlOgoKT2xvZiBKb2hhbnNzb24g
KGFybS1zb2MpCkFybmQgQmVyZ21hbm4gKGFybS1zb2MpCktldmluIEhpbG1hbiAoYXJtLXNvYykK
TWlrZSBUdXJxdWV0dGUgKGNsaykKU3RlcGhlbiBCb3lkIChjbGspCkxpbnVzIFdhbGxlaWogKHBp
bmN0cmwgKyBtb3JlKQpNaWtlIEJyb3duIChncGlvL3JlZ21hcCArIG1vcmUpCgoKVGhhbmtzIQoK
LU9sb2YgKG9uIGJlaGFsZiBvZiB0aGUgZ3JvdXApCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
