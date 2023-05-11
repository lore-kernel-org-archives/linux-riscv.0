Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79E3C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zv7r10bBF+2eXLuxUJpYSD7xiJJ+SnGyTATYgdKmSX0=; b=Ynpa8uXtCOzE/o
	LGDuiVDfH8yegYLikib++DgI3DfLI3jD0n3IayGyUkQScTXvljEGF6NpNT8XYEii4zr0ZA3LTLQiP
	5+lR1FDqG68q+qEWk4CEAZSEs51wEPmyGwv+VblNGzKWGrZD9BubYnZHSb70NwqFsMHSJh6l4Y+Zt
	b02/8PjtDUO3VwNuDhco3Tu0YuhiOiq+4B24kHxeN+KIHrlC5tMnmgA2MG4+Yg/IPeAjHOojKzJBO
	vgNUgJ/+wknopbQLjfwtwt9osQVaU7DRo4rDId2B2AoJ0IrSX2wQId97sRcKn3mf5EDTtPjpqYd18
	ZhP6EIuOYfOK+BF5hPog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px6hF-008vw1-11;
	Thu, 11 May 2023 13:51:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px6h9-008vuq-1a
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 13:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683813059; x=1715349059;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=goBFUJ7UZs0dYyuEV5My6BVRqae6i6p1vfypGMQ2jEg=;
  b=VTaKkRBFSDuYoQ6yziM4HbSsPIVUxrb1J9rl7vwAsQmSKvXQLfeJFJQo
   DYjNlXOByWOdILEAbXgC7GHUi+4w0+GkvCjfbYZ5TBk+LJAdE872r83wF
   9+sLLb7ck6CiQIAYY9u04vCeeYtWc6NLvmLkb54A3sLH2NcQ1TtRIIjhQ
   xQqIbPXTLuw/j4UBPOvZpWOaNqYt5UAv9X2wfwGkvXbv2yN05ENEgzDKb
   23AkQTsJoK5ef4C6wGyArMTsDsnH9s5potSDbp5yUknAWgN2mrVYZqP7f
   y6j/ag18V11X+TJXSVMjFkRZFye6deEOSUdjb4GQCwmyzU8HVKdwFwglt
   A==;
X-IronPort-AV: E=Sophos;i="5.99,266,1677567600"; 
   d="scan'208";a="151547033"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 May 2023 06:50:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 11 May 2023 06:50:52 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 11 May 2023 06:50:51 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Jonathan Corbet <corbet@lwn.net>,
	<linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v1] Documentation: RISC-V: patch-acceptance: mention patchwork's role
Date: Thu, 11 May 2023 14:50:21 +0100
Message-ID: <20230511-equation-decline-56b638ff9440@wendy>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=goBFUJ7UZs0dYyuEV5My6BVRqae6i6p1vfypGMQ2jEg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkxn2ZL294VUZ839dbabiem9S92znz4odok1f3B9rgJ0Sp+ m6486ShlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEjpcx/OHP3WfpIuaastb38V+77Q 3dvBseZSupJUmvEJl18++imnxGhgtv4zYVl7t08M+9u+dPUveCSQsPJHDErKhwes+0zmbdBGYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_065059_703738_3BBDC884 
X-CRM114-Status: GOOD (  16.98  )
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

UGFsbWVyIHN1Z2dlc3RlZCBhdCBzb21lIHBvaW50LCBub3Qgc3VyZSBpZiBpdCB3YXMgaW4gb25l
IG9mIHRoZQp3ZWVrbHkgbGludXgtcmlzY3Ygc3luY3MsIG9yIGEgY29udmVyc2F0aW9uIGF0IEZP
U0RFTSwgdGhhdCB3ZQpzaG91bGQgZG9jdW1lbnQgdGhlIHJvbGUgb2YgdGhlIGF1dG9tYXRpb24g
cnVubmluZyBvbiBvdXIgcGF0Y2h3b3JrCmluc3RhbmNlIHBsYXlzIGluIHBhdGNoIGFjY2VwdGFu
Y2UuCgpBZGQgYSBzaG9ydCBub3RlIHRvIHRoZSBwYXRjaC1hY2NlcHRhbmNlIGRvY3VtZW50IHRv
IHRoYXQgZW5kLgoKU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KLS0tClRoZSBiaXQgYWJvdXQgZml4ZXMgYmVpbmcgYXBwbGllZCB0byByaXNj
di9maXhlcyBpcyBub3QgYWN0dWFsbHkKY29ycmVjdCwgaXQncyBhY3R1YWxseSBsaW51eC1uZXh0
L3BlbmRpbmctZml4ZXMuIFdlJ3ZlIG5vdCBoYWQgaXNzdWVzCndpdGggdGhlIGZpeGVzIGJyYW5j
aCBiZWluZyBicm9rZW4gaW4gYSB3aGlsZSwgYnV0IEkgc3dpdGNoZWQgaXQgb3Zlcgp0byBwZW5k
aW5nLWZpeGVzIGR1ZSB0byB0aGUgS1ZNIGJyZWFrYWdlLiBJJ2xsIHN3YXAgYmFjayB0byBtYXRj
aCB0aGUKZG9jdW1lbnRhdGlvbiBJJ20gYWRkaW5nLgoKSSB3YXMgYWxzbyBub3Qgc3VyZSBpZiB0
aGlzIHdhcyB0aGUgY29ycmVjdCBkb2MgZm9yIHRoaXMsIG9yIHdoZXRoZXIgYQpwcm9jZXNzL21h
aW50YWluZXItcmlzY3YucnN0IGZpbGUgd2FzIGJldHRlciBzdWl0ZWQuIFRoZXJlJ3MgY2xlYXJs
eSBubwpydXNoIG9uIHRoaXMgdGhvdWdoIHNvIMKvXF8o44OEKV8vwq8KCkNDOiBCasO2cm4gVMO2
cGVsIDxiam9ybkBrZXJuZWwub3JnPgpDQzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0
LmNvbT4KQ0M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KQ0M6IEpv
bmF0aGFuIENvcmJldCA8Y29yYmV0QGx3bi5uZXQ+CkNDOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCkNDOiBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnCi0tLQogRG9jdW1lbnRhdGlv
bi9yaXNjdi9wYXRjaC1hY2NlcHRhbmNlLnJzdCB8IDE4ICsrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3Jpc2N2L3BhdGNoLWFjY2VwdGFuY2UucnN0IGIvRG9jdW1lbnRhdGlvbi9yaXNjdi9wYXRjaC1h
Y2NlcHRhbmNlLnJzdAppbmRleCAxZDFmYjg4NTMyNmIuLjc2ZWM1NzYyNjA0MyAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9wYXRjaC1hY2NlcHRhbmNlLnJzdAorKysgYi9Eb2N1bWVu
dGF0aW9uL3Jpc2N2L3BhdGNoLWFjY2VwdGFuY2UucnN0CkBAIC0xNiw2ICsxNiwyNCBAQCB0ZXN0
ZWQgY29kZSBvdmVyIGV4cGVyaW1lbnRhbCBjb2RlLiAgV2Ugd2lzaCB0byBleHRlbmQgdGhlc2Ug
c2FtZQogcHJpbmNpcGxlcyB0byB0aGUgUklTQy1WLXJlbGF0ZWQgY29kZSB0aGF0IHdpbGwgYmUg
YWNjZXB0ZWQgZm9yCiBpbmNsdXNpb24gaW4gdGhlIGtlcm5lbC4KIAorUGF0Y2h3b3JrCistLS0t
LS0tLS0KKworUklTQy1WIGhhcyBhIHBhdGNod29yayBpbnN0YW5jZSwgd2hlcmUgdGhlIHN0YXR1
cyBvZiBwYXRjaGVzIGNhbiBiZSBjaGVja2VkOgorCisgIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9saXN0LworCitJZiB5b3VyIHBhdGNoIGRvZXMgbm90
IGFwcGVhciBpbiB0aGUgZGVmYXVsdCB2aWV3LCB0aGUgUklTQy1WIG1haW50YWluZXJzIGhhdmUK
K2xpa2VseSBlaXRoZXIgcmVxdWVzdGVkIGNoYW5nZXMsIG9yIGV4cGVjdCBpdCB0byBiZSBhcHBs
aWVkIHRvIGFub3RoZXIgdHJlZS4KKworQXV0b21hdGlvbiBydW5zIGFnYWluc3QgdGhpcyBwYXRj
aHdvcmsgaW5zdGFuY2UsIGJ1aWxkaW5nL3Rlc3RpbmcgcGF0Y2hlcyBhcwordGhleSBhcnJpdmUu
IFRoZSBhdXRvbWF0aW9uIGFwcGxpZXMgcGF0Y2hlcyBhZ2FpbnN0IHRoZSBjdXJyZW50IEhFQUQg
b2YgdGhlCitSSVNDLVYgYGZvci1uZXh0YCBhbmQgYGZpeGVzYCBicmFuY2hlcywgZGVwZW5kaW5n
IG9uIHdoZXRoZXIgdGhlIHBhdGNoIGhhcyBiZWVuCitkZXRlY3RlZCBhcyBhIGZpeC4gVGhlIGV4
YWN0IGNvbW1pdCB0byB3aGljaCBhIHNlcmllcyBoYXMgYmVlbiBhcHBsaWVkIHdpbGwgYmUKK25v
dGVkIG9uIHBhdGNod29yay4KK1BhdGNoZXMgZm9yIHdoaWNoIGFueSBvZiB0aGUgY2hlY2tzIGZh
aWwgYXJlIHVubGlrZWx5IHRvIGJlIGFwcGxpZWQgYW5kIGluIG1vc3QKK2Nhc2VzIHdpbGwgbmVl
ZCB0byBiZSByZXN1Ym1pdHRlZC4KKwogU3VibWl0IENoZWNrbGlzdCBBZGRlbmR1bQogLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogV2UnbGwgb25seSBhY2NlcHQgcGF0Y2hlcyBmb3IgbmV3IG1v
ZHVsZXMgb3IgZXh0ZW5zaW9ucyBpZiB0aGUKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
