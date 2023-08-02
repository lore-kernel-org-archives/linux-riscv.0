Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEB9C04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 11:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eYyNDV+Jt22MjY2pldAjBfE8mdY6pjQmggQPavN3o7o=; b=Vq/Yzp+WIEb2Qw
	PnRJ7UjRiE3+Dak71Ve4yqe0dVHNZ3kT9dxLMHBnvpeeA1WHvf70Kp7mVOFLrZam2ogLARhm5Tbb+
	aw/Cdv5mM45GZvUw+vycR7oVYNKsQT6A+66uF8Yy+nhxBA04bnqHuV9E9iVc9O4nOSfaxrSixSLnl
	f1IOp5N89qpqc3JHzvrLMKIYIN8k/MLzTRsEAEGl8dy2OP87Z++Pe23W7sVXBwFHqoLZI+GYYj1xD
	QSBZqOOR7CO0waaQDkdc4QAvGkhQIX4sXBc1Ynr5iT4ZkOHitfSQaDcIfhlb83zG6h6g5z+e1p90N
	WeKWpbS8O5nQ91YmuuVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR9nr-004m5R-2f;
	Wed, 02 Aug 2023 11:14:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR9no-004m41-0d
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 11:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690974844; x=1722510844;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qJbAs5HMKRLq8pv1x3gsaXQhtOfOsBxY/cBd1OZrCpA=;
  b=BIPwGChhU5ROM60VnZ86kap/LQyT/0iWof2LLyAM9pQZ18OgmnkT/8jR
   nGvyZZbOCg3LBILMUxBmrdVbhmt+Y8e//JALVEz6f7IcQ3Fpilt9W5C26
   Q0ETeS2HrpOGQI4lwu1ahfD5FCfyUsq84nw69GlvDYaSSi4YM4ub42b/U
   ZQ7oh+y1uxO5iaT38MJuEAqppqhEpTINGEv52xM1W5wjd70yLOQNy28kZ
   WR1WG5unOE3kXlP4lX9hmLi5noFe7LjW4iJkEdO5SCUui8ignG7ArTBmY
   yaZXtr0+iRClXACZDrtZfs8no6nPvRjxR7I0mwHJ/mN5s8/bQlGjYrNrr
   A==;
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="223462614"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Aug 2023 04:13:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 2 Aug 2023 04:13:46 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 2 Aug 2023 04:13:43 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Anup Patel
	<apatel@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Song Shuai
	<suagrfillet@gmail.com>, JeeHeng Sia <jeeheng.sia@starfivetech.com>, "Petr
 Tesarik" <petrtesarik@huaweicloud.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFT 0/2] RISC-V: handle missing "no-map" properties for OpenSBI's PMP protected regions
Date: Wed, 2 Aug 2023 12:12:51 +0100
Message-ID: <20230802-purse-hydrant-6f44f77364b0@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=qJbAs5HMKRLq8pv1x3gsaXQhtOfOsBxY/cBd1OZrCpA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmnrIyUMh3FdPfWh8x8ZyRaH3s8U945pkIuYx5f08e6FpuA Iz86SlkYxDgYZMUUWRJv97VIrf/jssO55y3MHFYmkCEMXJwCMJHcaYwMnxLuyxof779m9+tJD2vJh1 NJOx2WXa011v2xq8jUNPvZJkaGBy+LRfv+zHsVwsGzq/Jo1q+HrFeW2ERVKz/74O1y4LcYJwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_041404_613058_D1FC2025 
X-CRM114-Status: UNSURE (   9.79  )
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

SGV5IGZvbGtzLAoKSSB3YXMga2luZGEgc2l0dGluZyBhcm91bmQgaG9waW5nIHRoYXQgc29tZW9u
ZSB3aG8gY2FyZWQgYWJvdXQKaGliZXJuYXRpb24gd291bGQgZGVjaWRlIHRvIGdvIGFuZCB3b3Jr
IG9uIHNvbWUgcGF0Y2hlcyB0aGF0IHBlcm1pdHRlZAp1c2luZyBpdCB3aXRob3V0IGhhdmluZyB0
byB1c2UgTk9OUE9SVEFCTEUsIGJ1dCB0aGF0IGhhcyBub3QgeWV0CmhhcHBlbmVkIHNvIGhlcmUg
SSBhbS4KCkkndmUgbWFya2VkIHRoaXMgUkZUIGFzIEkgaGF2ZSBub3QgZ290IGEgc2V0dXAgdG8g
dGVzdCBoaWJlcm5hdGlvbiBvbiBhCnN5c3RlbSB0aGF0IHN1ZmZlcnMgZnJvbSB0aGUgT3BlblNC
SSBpc3N1ZSwgbm9yIGhhdmUgSSB1c2VkIGNyYXNoCmtlcm5lbHMgYXQgYWxsLgoKVGhhbmtzLApD
b25vci4KCkNDOiBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkNDOiBQ
YWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgpDQzogQXRpc2ggUGF0cmEgPGF0aXNo
cEByaXZvc2luYy5jb20+CkNDOiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4K
Q0M6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CkNDOiBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CkNDOiBCasO2cm4gVMO2cGVsIDxiam9y
bkByaXZvc2luYy5jb20+CkNDOiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+CkND
OiBKZWVIZW5nIFNpYSA8amVlaGVuZy5zaWFAc3RhcmZpdmV0ZWNoLmNvbT4KQ0M6IFBldHIgVGVz
YXJpayA8cGV0cnRlc2FyaWtAaHVhd2VpY2xvdWQuY29tPgpDQzogbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpDQzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwoKQ29ub3IgRG9v
bGV5ICgyKToKICBSSVNDLVY6IGhhbmRsZSBtaXNzaW5nICJuby1tYXAiIHByb3BlcnRpZXMgZm9y
IE9wZW5TQkkncyBQTVAgcHJvdGVjdGVkCiAgICByZWdpb25zCiAgUmV2ZXJ0ICJSSVNDLVY6IG1h
cmsgaGliZXJuYXRpb24gYXMgbm9ucG9ydGFibGUiCgogYXJjaC9yaXNjdi9LY29uZmlnICAgICAg
ICAgICB8ICA1ICstLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgIDUgKysrKysK
IGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jICAgICAgfCA0MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0KIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgfCAgMyArKysKIDQg
ZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCi0tIAoyLjQw
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
