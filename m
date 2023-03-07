Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69FAC678D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 10:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f8IQot3WAgscaBhscKJx3toUGH0wvVkIgof8sWFA4eM=; b=MGjJwvmih+edmh
	aNfZyZasaiArdV+kFhku6eyq9ARfYNiAd9rNm1NrHposcqYE/sAKo1+Rz4dGWZxMIvKGfeIcFescF
	QSacY7rKevizcmLL17c/xgBAoOAASoDt56HndxF8i6NDhue1J/9cY2y9NmvF02MJUC+feiTIN5sqR
	VvQfSCrGefUrG13WgXHWh4RXwVKaGK5xlDKO/VpOMqAxjEAuo6+kCA+UKE+SFttcajthhAr7Xg2tS
	S7N+T17X89A9qD69U9pppOBZpGK+ftIyd8bKu12107Sj8jxrf9inoINqEnrVr13pb4PHzXLyRTOpG
	OdU+r2I3nSs8+H/XsV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUVk-00HFHG-AP; Tue, 07 Mar 2023 10:25:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUVa-00HF9A-SQ
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 10:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678184726; x=1709720726;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OInxuMJtdIyDPn0imEFBCcfPVJWWAD2dQ/VhXFHBFuY=;
  b=uCVlOl3qRvWuHFqu46He0r/1bPvmKGBMKhE/oPTR4twlvWEkigEynwN3
   NE6ZvfopT0UNupr4kkKAOksz2LnDNi2KR3hpGgrJhrDIDOsP40Yc8kOvY
   l3YuZwHQmj3pvqbgc7mjwlY3fIpuM+61NPscOLXofmarBO55GvNP7XuMO
   hh5Hfy9ToeZTdTeoP341SG725ksdoqjLNFKct1OricCspXIkh2uy0j/d0
   7Qxm6QYGuzi7L8QLIixHB+lQavIMO8aG+4CxTDIWZ4Oj4ZAxg8K1ajt/k
   E0Z9X1XcviGOSQCtpvxG46VF1BD4VbLSgP+ZO0/FfOoMdJABtnkrwCwEW
   w==;
X-IronPort-AV: E=Sophos;i="5.98,240,1673938800"; 
   d="scan'208";a="140694248"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Mar 2023 03:25:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 7 Mar 2023 03:25:15 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 7 Mar 2023 03:25:12 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
	<wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=
	<bjorn3_gh@protonmail.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, <rust-for-linux@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
Subject: [PATCH v1 0/2] RISC-V: enable rust
Date: Tue, 7 Mar 2023 10:24:39 +0000
Message-ID: <20230307102441.94417-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2088; i=conor.dooley@microchip.com; h=from:subject; bh=OInxuMJtdIyDPn0imEFBCcfPVJWWAD2dQ/VhXFHBFuY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnsAs8kPwY+WPDTW83kbZ7n9rULE84/3btU3L1pj9Su+gea apKSHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIhAPDP9vQmtgpq6++Ptj9MuPKLd 5J942cmbL2szoy/Ciezv3hViXD//KFmxlmvp0gz2ITs0bPJ+dy7MGQD2/k7rwL1QlWf+3wgRcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_022527_039700_C9BBE550 
X-CRM114-Status: GOOD (  12.93  )
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

QWZ0ZXIgdGhlIGF1dGhvcnNoaXAgZGViYWNsZSBvbiB0aGUgUkZDLCBJJ3ZlIHRyaWVkIHRvIGJl
IGV2ZW4gbW9yZQpjYXJlZnVsIHRoaXMgdGltZSBhcm91bmQuIEdhcnkgb3B0ZWQgZm9yIGEgQ28t
ZGV2ZWxvcGVkLWJ5IGluIHRoZSByZXBsaWVzCm9mIHRoZSBSRkMgc3R1ZmYsIHNvIEkgaGF2ZSBn
aXZlbiB0aGVtIG9uZS4KSSBoYXZlIGFkZGVkIFNvQidzIHRvbywgYnV0IGlmIHRoYXQgaXMgbm90
IG9rYXkgR2FyeSwgdGhlbiBwbGVhc2Ugc2NyZWFtCmxvdWRseS4KCkFzIHRoaXMgaXMgbGlmdGVk
IGZyb20gdGhlIHN0YXRlIG9mIHRoZSBSdXN0LWZvci1MaW51eCB0cmVlLCB0aGUgY29tbWl0Cm1l
c3NhZ2VzIGZyb20gdGhlcmUgY2Fubm90IGJlIHByZXNlcnZlZCwgc28gdGhlc2UgcGF0Y2hlcyBo
YXZlIGNvbW1pdAptZXNzYWdlcyB0aGF0IEkgd3JvdGUuCgpJJ3ZlIHRlc3RlZCB0aGlzIG9uIElj
aWNsZSwgYW5kIHRoZSBtb2R1bGVzIHNlZW0gdG8gd29yayBhcyBleHBlY3RlZC4KVW5mb3J0dW5h
dGVseSB0aGVyZSBhcHBlYXIgdG8gYmUgaW1wbGljaXQgMzItYml0IGRpdmlzaW9ucyAob3Igc2lt
aWxhcikKaW4gY29yZSBSdXN0IGNvZGUsIHNvLCBhcyBpbiB0aGUgZG93bnN0cmVhbSBSdXN0LWZv
ci1MaW51eCB0cmVlLCBSdXN0IGlzCm9ubHkgZW5hYmxlZCBmb3IgNjQtYml0LgoKVGhhbmtzLApD
b25vci4KCkNoYW5nZXMgaW4gdjE6Ci0gcmViYXNlIG9uIHY2LjMtcmMxCi0gcmVzb3J0IHRoZSBg
dW1gIGVudHJ5IGluIHRoZSBhcmNoLXN1cHBvcnQgdGFibGUgd2hpbGUgYWRkaW5nIFJJU0MtVgog
IHRvIGl0Ci0gZHJvcCAzMi1iaXQgYml0cwotIGhhdmUgYW5vdGhlciBjcmFjayBhdCBhc3NpZ25p
bmcgYXV0aG9yc2hpcAoKQ2hhbmdlcyBpbiBSRkMtUkVTRU5EOgotIGZpeCB0aGUgYXN5bW1ldHJp
Y2FsIGFkZGl0aW9ucyBpbiB0aGUgTWFrZWZpbGUgYml0cwotIGFkZCBjYy1jb3ZlciB0byBteSBn
aXQgc2VuZC1lbWFpbCBjb21tYW5kLi4uCgpDQzogTWlndWVsIE9qZWRhIDxvamVkYUBrZXJuZWwu
b3JnPgpDQzogQWxleCBHYXlub3IgPGFsZXguZ2F5bm9yQGdtYWlsLmNvbT4KQ0M6IFdlZHNvbiBB
bG1laWRhIEZpbGhvIDx3ZWRzb25hZkBnbWFpbC5jb20+CkNDOiBCb3F1biBGZW5nIDxib3F1bi5m
ZW5nQGdtYWlsLmNvbT4KQ0M6IEdhcnkgR3VvIDxnYXJ5QGdhcnlndW8ubmV0PgpDQzogQmrDtnJu
IFJveSBCYXJvbiA8Ympvcm4zX2doQHByb3Rvbm1haWwuY29tPgpDQzogSm9uYXRoYW4gQ29yYmV0
IDxjb3JiZXRAbHduLm5ldD4KQ0M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZl
LmNvbT4KQ0M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+CkNDOiBOYXRoYW4g
Q2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+CkNDOiBOaWNrIERlc2F1bG5pZXJzIDxuZGVz
YXVsbmllcnNAZ29vZ2xlLmNvbT4KQ0M6IFRvbSBSaXggPHRyaXhAcmVkaGF0LmNvbT4KQ0M6IHJ1
c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZwpDQzogbGludXgtZG9jQHZnZXIua2VybmVsLm9y
ZwpDQzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwpDQzogbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpDQzogbGx2bUBsaXN0cy5saW51eC5kZXYKCk1pZ3VlbCBPamVkYSAoMik6
CiAgc2NyaXB0czogZ2VuZXJhdGVfcnVzdF90YXJnZXQ6IGVuYWJsZSBidWlsZGluZyBvbiBSSVND
LVYKICBSSVNDLVY6IGVuYWJsZSBidWlsZGluZyA2NC1iaXQga2VybmVscyB3aXRoIHJ1c3Qgc3Vw
cG9ydAoKIERvY3VtZW50YXRpb24vcnVzdC9hcmNoLXN1cHBvcnQucnN0IHwgIDMgKystCiBhcmNo
L3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3YvTWFrZWZp
bGUgICAgICAgICAgICAgICAgIHwgIDIgKysKIHNjcmlwdHMvZ2VuZXJhdGVfcnVzdF90YXJnZXQu
cnMgICAgIHwgMTYgKysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
