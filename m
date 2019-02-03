Return-Path: <SRS0=yhZS=QK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C99C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  3 Feb 2019 11:52:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43A1521773
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  3 Feb 2019 11:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H/WSW1P6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0doAk9b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43A1521773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a4mCDyDCIapR43fM1SaJD01fm9FEqRk0Z+fce0oZ+HU=; b=H/WSW1P6HFL5rN
	KDgzlEA/dhql678to+38FsVdpfZ4DI1ruH0BKoToMjSQmQyspqylM6R1z5ZazyqtgiWZt6A7XZ3+B
	hhKAHZDfQQaiIJPnogM/hD78C/kBNITyQP5hImFrrwswc/fgvYkUGHCvi9mCmUkdeRD4KeJTIvh23
	0Jo+M3QB47GlLuaoYglY37XPGxObA4+yCPYGIQU93l6oNaGO62nfPAzhRzWpQZvg51oEhbxvRngAl
	z+hRHVDBMKI4cdLS/ZkAvNpezWaH4c+TXH9t5Gfl3FqYyg/VtOGG+v9wv8uKxZnnZ34PcEX6YRC9r
	O9JLEd4bP/ZiSOtILGxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqGKJ-0007li-VY; Sun, 03 Feb 2019 11:52:43 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqGKF-0007kz-Or
 for linux-riscv@lists.infradead.org; Sun, 03 Feb 2019 11:52:41 +0000
Received: by mail-ed1-x543.google.com with SMTP id g22so8991937edr.7
 for <linux-riscv@lists.infradead.org>; Sun, 03 Feb 2019 03:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYxMbHIquM6UE8/rcw8KlfN7w2I5ecQu1rL8ri42f8Y=;
 b=k0doAk9bvEXjTy0LU7qd91j6uKmhSastdKyokfRZ3tv6Iht8GG5EgQuMYKNh14Ov/a
 g+kYyQdR4nkQ5ALgGUxW4UmCsu97iujVUtJhUQWH8yXAO9HAG7QOph/BTTcjkiPMVkBd
 fTUl3hUG1HuU+nft2QKKfQyahYqVy9e1lTRHnnmDGBUqwHoT2pyBP2FpOaN5TNTVT7r4
 hr4NY37tejLUuCLZ68gMAAIIrc/kUqGYN+P2PhghVu/E3dRyuQqPAhjTiT0InyjKWrW7
 B7U4y6jj9RlbkdUwTih6iKWorkVkQkmstJWei5cWdgpyRjqawj+8B+4WPsYzOiqRpafz
 5O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYxMbHIquM6UE8/rcw8KlfN7w2I5ecQu1rL8ri42f8Y=;
 b=KyPaz9S3iJ2CiXmh19h51DMlaKal17Teg1+syuO4vRoMcTuC18wGdKDU88cGkV6Snq
 J0j23bPrR7SgRkZWt+MGZb6jdebRpN7Fi/PcFddQv54eQ8lyrEjz7HVMkYBS6Y9Xwb4A
 OQ4SWAqdB84m9+Qx/+/PpGV4gAbUAeD7ejf5qTJFXThHa1GHnkCOWZ1Rp3T84oyXADZ9
 b6AHZEUFSfFJ58eGztGOrBWFtKG/yfLqXBDXdxeDpGLCcldn73lv2b24AAUIFUc/pPld
 oYRGp7lppN9ay359lioZKz9tQ3Fm7ZfJfRY3hTE+0IEjdkU7qj6WDHRk39QTmFNqYtIk
 MZaw==
X-Gm-Message-State: AJcUukdZV9CqHTOYHi7jSjsE77+x99BT/SCAZqoA2WazFx39GzV3MfAE
 SDxYj22bSK5LI5zvVt84HHX/whWjCf4x+g==
X-Google-Smtp-Source: ALg8bN66oNGItKp9jW0Oe61h/frEANmzCUMoNBlSgDXX4pQ8XtEPHIyx8jEdu0KojCYrLnpTqlNFCA==
X-Received: by 2002:a50:a642:: with SMTP id d60mr47296716edc.290.1549194755396; 
 Sun, 03 Feb 2019 03:52:35 -0800 (PST)
Received: from btopel-mobl.ger.intel.com
 ([2001:67c:1810:f055:c82b:bcf5:1add:2ef0])
 by smtp.gmail.com with ESMTPSA id l10sm2120719ejq.55.2019.02.03.03.52.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Feb 2019 03:52:34 -0800 (PST)
From: bjorn.topel@gmail.com
To: linux-riscv@lists.infradead.org, daniel@iogearbox.net, ast@kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH bpf-next 0/3] Add RISC-V (RV64G) BPF JIT
Date: Sun,  3 Feb 2019 12:51:28 +0100
Message-Id: <20190203115132.8766-1-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_035239_903784_6D4B569F 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: hch@infradead.org,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>, palmer@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgoKSGkhCgpUaGlzIHNl
cmllcyBhZGRzIGFuIFJWNjRHIEJQRiBKSVQgdG8gdGhlIGtlcm5lbC4gSSd2ZSBzZW50IG91dCBh
IFJGQwpmb3IgYSBjb3VwbGUgb2Ygd2Vla3MgYWdvLCBhbmQgdGhpbmsgdGhpcyBjb2RlIGlzCmZl
YXR1cmUtY29tcGxldGUvc3RhYmxlIGVub3VnaCAoZmFtb3VzIGxhc3Qgd29yZHMpIGZvciBhIHBy
b3BlciBwYXRjaC4KClVuZm9ydHVuYXRlbHksIGtwcm9iZXMgaXNuJ3Qgc3VwcG9ydGVkIGJ5IFJJ
U0MtViB5ZXQgKFBhdHJpY2sgU3TDpGhsaW4Kc2VudCBvdXQgYW4gUkZDIGxhc3QgeWVhciksIHdo
aWNoIG1lYW5zIHRoYXQgYWxsIHRlc3RzIGludm9sdmluZwpCUEZfUFJPR19UWVBFX1RSQUNFUE9J
TlQsIEJQRl9QUk9HX1RZUEVfUEVSRl9FVkVOVCwKQlBGX1BST0dfVFlQRV9LUFJPQkUgYW5kIEJQ
Rl9QUk9HX1RZUEVfUkFXX1RSQUNFUE9JTlQgd2lsbCBmYWlsLgoKRnVydGhlciwgdGhlIGltcGxl
bWVudGF0aW9uIGRvZXMgbm90IHN1cHBvcnQgImZhciBicmFuY2hpbmciICg+NEtpQikuCiAgICAK
VGhlIGltcGxlbWVudGF0aW9uIHBhc3NlcyBhbGwgdGhlIHRlc3RfYnBmLmtvIHRlc3RzOiB0ZXN0
X2JwZjoKICAgIFN1bW1hcnk6IDM3OCBQQVNTRUQsIDAgRkFJTEVELCBbMzY2LzM2NiBKSVQnZWRd
CiAgICAKQWxsIHRoZSB0YWlsX2NhbGwgdGVzdHMgaW4gdGhlIHNlbGZ0ZXN0L2JwZi90ZXN0X3Zl
cmlmaWVyIHByb2dyYW0KcGFzc2VzLgogICAgCkFsbCB0ZXN0cyB3aGVyZSBkb25lIG9uIFFFTVUg
ZW11bGF0b3IgdmVyc2lvbiAzLjEuNTAKKHYzLjEuMC02ODgtZzhhZTk1MWZiYzEwNikuIEknbGwg
dGVzdCBpdCBvbiByZWFsIGhhcmR3YXJlLCB3aGVuIEkgZ2V0CmFjY2VzcyB0byBpdC4KCkknbSBy
b3V0aW5nIHRoaXMgcGF0Y2ggdmlhIGJwZi1uZXh0L25ldGRldiBtYWlsaW5nIGxpc3QgKGFmdGVy
IGEKY29udmVyc2F0aW9uIHdpdGggUGFsbWVyIGF0IEZPU0RFTSksIG1haW5seSBiZWNhdXNlIHRo
ZSBvdGhlciBKSVRzCndlbnQgdGhhdCBwYXRoLgoKVGhhbmtzIGZvciBhbGwgdGhlIGNvbW1lbnRz
IQoKQ2hlZXJzLApCasO2cm4KClJGQ3YxIC0+IHYxOgoqIENsZWFuZWQgdXAgdGhlIEtjb25maWcg
YW5kIG5ldC9NYWtlZmlsZS4gKENocmlzdG9waCkKKiBSZW1vdmVkIHRoZSBlbnRyeS1zdHViIGFu
ZCBzcXVhc2hlZCB0aGUgYnVpbGQvY29uZmlnIGNoYW5nZXMgdG8gYmUKICBwYXJ0IG9mIHRoZSBK
SVQgaW1wbGVtZW50YXRpb24uIChDaHJpc3RvcGgpCiogU2ltcGxpZmllZCB0aGUgcmVnaXN0ZXIg
dHJhY2tpbmcgY29kZS4gKERhbmllbCkKKiBSZW1vdmVkIHVudXNlZCBtYWNyb3MuIChEYW5pZWwp
CiogQWRkZWQgbXlzZWxmIGFzIG1haW50YWluZXIgYW5kIHVwZGF0ZWQgZG9jdW1lbnRhdGlvbi4g
KERhbmllbCkKKiBSZW1vdmVkIEhBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MuIChDaHJp
c3RvcGgsIFBhbG1lcikKKiBBZGRlZCB0YWlsLWNhbGxzIGFuZCBjbGVhbmVkIHVwIHRoZSBjb2Rl
LgoKCgpCasO2cm4gVMO2cGVsICgzKToKICBicGYsIHJpc2N2OiBhZGQgQlBGIEpJVCBmb3IgUlY2
NEcKICBNQUlOVEFJTkVSUzogYWRkIFJJU0MtViBCUEYgSklUIG1haW50YWluZXIKICBicGYsIGRv
YzogYWRkIFJJU0MtViB0byBmaWx0ZXIudHh0CgogRG9jdW1lbnRhdGlvbi9uZXR3b3JraW5nL2Zp
bHRlci50eHQgfCAgIDE2ICstCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgIDYgKwogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgICAxICsKIGFy
Y2gvcmlzY3YvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAgMiArLQogYXJjaC9yaXNjdi9u
ZXQvTWFrZWZpbGUgICAgICAgICAgICAgfCAgICAxICsKIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29tcC5jICAgICAgIHwgMTUwMiArKysrKysrKysrKysrKysrKysrKysrKysrKysKIDYgZmlsZXMg
Y2hhbmdlZCwgMTUyMCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvcmlzY3YvbmV0L01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9y
aXNjdi9uZXQvYnBmX2ppdF9jb21wLmMKCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
