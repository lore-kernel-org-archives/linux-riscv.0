Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32B3C25B79
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 03:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CjwF37Lxgu56JfH9LNncpavgyMb8SoHVtRxKulAogBE=; b=iXGLRzz40Nn4bd
	6M336a79uLJWXH3us1/ZbjZT25bL2yL6/jGeEq0ScWpj0tG88dESf0fAfbC6WtuTmOTZGJBErBUPN
	GrSNw2lvZelUGjQnXx+M0+iOlKHuslDRdbK/Ps0URsiTzW/owebjK+GnDpINMyUU5H2sHXYtx/UUo
	lXRrnB3Ffj50T7+TlmQ9YaRqsQtS23ivfCW74XFeaRoTwdKRWt7ga5w3/ct+VTAUA9W2g/v/nma0x
	z0bvwg77bIIPK/DNRrW2U/z4c6uIf4v2PYvzXoZmxxE/Fj6LCw58kbApmugnOjWBKUWXBWGPEh3nx
	BA22zRO7R4c32cK43Elg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9yjx-00000004qV6-0Hf3;
	Thu, 23 May 2024 03:03:37 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9yjs-00000004qUf-17jg
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 03:03:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f05b669b6cso16400885ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 20:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716433410; x=1717038210; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nwUquAnhRk8ji3d7tZogBxnB1fXB0se2TAZQfiqE/wg=;
        b=UqjutHKdc7qsy9ovlIb858Krqo2u3KACyn/vGAiwaNqV2xTksXZ79IOH4u07oim6zf
         WUFywMD0C9bs3A/zg26exBOCoORyQhy4QxTUOOhUQIyARUiFu4nXlrBbKDH1eCpr71gG
         IiceW0shQ+VjTEVRPKxPLAgeVJt7kHLzqOkiUzbpsZ5gMnqwSIR7j1BDCDeBmD4Grou7
         3vnsHX2CAtpKd0qVSQ57jzXioj1X66Bo/sGBtuaoS6QsO0QjeipXYAXVTexfP55HbiA1
         zlmRz2V92IHZtjaSMk22hPaUuzJ1pTqxjkm2t/yoolu0oWygWY6r3Y+FNyU1ioVH4nvb
         G4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716433410; x=1717038210;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwUquAnhRk8ji3d7tZogBxnB1fXB0se2TAZQfiqE/wg=;
        b=Bk/PsFURzEvnOOgFZx60cdEfGFfzP+qWq8cur9sEgszv2xaqKAiOY2E5lsV8bjFagu
         dz/3jL1UpbJzPhLhrubR2qgKASxpAldpkeS+THrZXBc5PyhVwPFjJDHZB30CCIfee4Me
         LdrwJU1963eX0/ZD8qxGCVvd7lz9Tq215dJ4oRTOSYiHZhBDdc+ayVTLj6M4qYzuY5lv
         QMZp0Gx2JpcrVzLqYp0P+L0NHdmLGdDnl+Aiq+sawOMPFrlKw6pDwcF24vwYHHPMd9Rb
         GXhw4SN2hLrN2bA13/qAbPhPpY+BQWE65bXaMzAmnyFJljnN62tEvsfVBbPBSF3/MeVr
         z2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTEIlN7DrWyqWsBW4EgafidowaG3h2V871a0AlcqQ+nO0azw4gUdeYXWJZBlDB7wwYBaNu9UqEHDVPnExq6rSQh2nDH2TuGxEdlZ9Ob3O3
X-Gm-Message-State: AOJu0Yw03FaML82CieIypRJTeIwXFcOYK3P75/5Cn4AZyUI36RMHDCdw
	QwV0rwnYj7Vg8UzITVS/nN6Il/zlto3L1okzxdkUShCzL+L58NO6Wx/m3BgXLbU=
X-Google-Smtp-Source: AGHT+IG8gFAJ37vNZkt/pFRbjWbnr7scBCXxw0nfWJ9qohe6/zfobei3QKSBGLGIn9UXOF1QoB+eew==
X-Received: by 2002:a17:902:d543:b0:1e4:3c7f:c060 with SMTP id d9443c01a7336-1f31c9e2a09mr43905155ad.66.1716433409867;
        Wed, 22 May 2024 20:03:29 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f302b31e74sm59195715ad.142.2024.05.22.20.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 20:03:29 -0700 (PDT)
Message-ID: <664eb201.170a0220.fce40.187e@mx.google.com>
Date: Wed, 22 May 2024 20:03:29 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: fixes
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.9-11078-g0bfbc914d9433
X-Kernelci-Report-Type: build
Subject: riscv/fixes build: 10 builds: 8 failed, 2 passed,
 8 errors (v6.9-11078-g0bfbc914d9433)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_200332_563980_D5535912 
X-CRM114-Status: UNSURE (   3.99  )
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

cmlzY3YvZml4ZXMgYnVpbGQ6IDEwIGJ1aWxkczogOCBmYWlsZWQsIDIgcGFzc2VkLCA4IGVycm9y
cyAodjYuOS0xMTA3OC1nMGJmYmM5MTRkOTQzMykKClRoaXMgbGVnYWN5IEtlcm5lbENJIHByb3Zp
ZGluZyB0aGlzIHJlcG9ydCB3aWxsIHNodXRkb3duIHNvbWV0aW1lCnNvb24gaW4gZmF2b3Igb2Yg
b3VyIG5ldyBLZXJuZWxDSSBpbmZyYS4gTm90IGFsbCB0ZXN0cyBhcmUgYmVpbmcKbWlncmF0ZWQu
CklmIHlvdSBhcmUgc3RpbGwgdXNpbmcgdGhpcyByZXBvcnQgYW5kIHdhbnQgdXMgdG8gcHJpb3Jp
dGl6ZSB5b3VyCnVzZWNhc2UgaW4gdGhlIG5ldyBzeXN0ZW0sIHBsZWFzZSBsZXQgdXMga25vdyBh
dAprZXJuZWxjaUBsaXN0cy5saW51eC5kZXYKCkZ1bGwgQnVpbGQgU3VtbWFyeTogaHR0cHM6Ly9r
ZXJuZWxjaS5vcmcvYnVpbGQvcmlzY3YvYnJhbmNoL2ZpeGVzL2tlcm5lbC92Ni45LTExMDc4LWcw
YmZiYzkxNGQ5NDMzLwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmaXhlcwpHaXQgRGVzY3JpYmU6IHY2
LjktMTEwNzgtZzBiZmJjOTE0ZDk0MzMKR2l0IENvbW1pdDogMGJmYmM5MTRkOTQzM2Q4YWMyNzYz
YTljZTk5Y2U3NzIxZWU1YzhlMApHaXQgVVJMOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9yaXNjdi9saW51eC5naXQKQnVpbHQ6IDEgdW5pcXVlIGFyY2hp
dGVjdHVyZQoKQnVpbGQgRmFpbHVyZXMgRGV0ZWN0ZWQ6CgpyaXNjdjoKICAgIGRlZmNvbmZpZzog
KGNsYW5nLTE2KSBGQUlMCiAgICBub21tdV9rMjEwX2RlZmNvbmZpZzogKGNsYW5nLTE2KSBGQUlM
CiAgICBub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWc6IChjbGFuZy0xNikgRkFJTAogICAgbm9t
bXVfdmlydF9kZWZjb25maWc6IChjbGFuZy0xNikgRkFJTAogICAgZGVmY29uZmlnOiAoZ2NjLTEw
KSBGQUlMCiAgICBub21tdV9rMjEwX2RlZmNvbmZpZzogKGdjYy0xMCkgRkFJTAogICAgbm9tbXVf
azIxMF9zZGNhcmRfZGVmY29uZmlnOiAoZ2NjLTEwKSBGQUlMCiAgICBub21tdV92aXJ0X2RlZmNv
bmZpZzogKGdjYy0xMCkgRkFJTAoKRXJyb3JzIERldGVjdGVkOgoKcmlzY3Y6CiAgICBkZWZjb25m
aWcgKGdjYy0xMCk6IDEgZXJyb3IKICAgIGRlZmNvbmZpZyAoY2xhbmctMTYpOiAxIGVycm9yCiAg
ICBub21tdV9rMjEwX2RlZmNvbmZpZyAoZ2NjLTEwKTogMSBlcnJvcgogICAgbm9tbXVfazIxMF9k
ZWZjb25maWcgKGNsYW5nLTE2KTogMSBlcnJvcgogICAgbm9tbXVfazIxMF9zZGNhcmRfZGVmY29u
ZmlnIChnY2MtMTApOiAxIGVycm9yCiAgICBub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcgKGNs
YW5nLTE2KTogMSBlcnJvcgogICAgbm9tbXVfdmlydF9kZWZjb25maWcgKGdjYy0xMCk6IDEgZXJy
b3IKICAgIG5vbW11X3ZpcnRfZGVmY29uZmlnIChjbGFuZy0xNik6IDEgZXJyb3IKCkVycm9ycyBz
dW1tYXJ5OgoKICAgIDQgICAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5j
OjUyOjQ3OiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRzIHRvIGZ1bmN0aW9uIGNhbGwsIGV4cGVj
dGVkIDIsIGhhdmUgMwogICAgNCAgICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLWVh
cmx5LmM6NTI6MjogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBmdW5jdGlvbiDigJhyaXNj
dl9pcGlfc2V0X3ZpcnFfcmFuZ2XigJkKCgo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKRGV0YWls
ZWQgcGVyLWRlZmNvbmZpZyBidWlsZCByZXBvcnRzOgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
ZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgRkFJTCwgMSBlcnJvciwgMCB3YXJuaW5ncywg
MCBzZWN0aW9uIG1pc21hdGNoZXMKCkVycm9yczoKICAgIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlz
Y3YtaW1zaWMtZWFybHkuYzo1MjoyOiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRzIHRvIGZ1bmN0
aW9uIOKAmHJpc2N2X2lwaV9zZXRfdmlycV9yYW5nZeKAmQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBGQUlMLCAxIGVycm9yLCAwIHdhcm5p
bmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKRXJyb3JzOgogICAgZHJpdmVycy9pcnFjaGlwL2ly
cS1yaXNjdi1pbXNpYy1lYXJseS5jOjUyOjQ3OiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRzIHRv
IGZ1bmN0aW9uIGNhbGwsIGV4cGVjdGVkIDIsIGhhdmUgMwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KZGVmY29uZmlnK0NPTkZJR19TTVA9biAocmlzY3YsIGdjYy0xMCkg4oCUIFBBU1MsIDAgZXJy
b3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KZGVmY29uZmlnK0NPTkZJR19TTVA9biAocmlzY3YsIGNsYW5nLTE2KSDigJQgUEFTUywg
MCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpub21tdV9rMjEwX2RlZmNvbmZpZyAocmlzY3YsIGdjYy0xMCkg4oCUIEZBSUws
IDEgZXJyb3IsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgpFcnJvcnM6CiAgICBk
cml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5LmM6NTI6MjogZXJyb3I6IHRvbyBt
YW55IGFyZ3VtZW50cyB0byBmdW5jdGlvbiDigJhyaXNjdl9pcGlfc2V0X3ZpcnFfcmFuZ2XigJkK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNjdiwgY2xh
bmctMTYpIOKAlCBGQUlMLCAxIGVycm9yLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hl
cwoKRXJyb3JzOgogICAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jOjUy
OjQ3OiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRzIHRvIGZ1bmN0aW9uIGNhbGwsIGV4cGVjdGVk
IDIsIGhhdmUgMwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVm
Y29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgRkFJTCwgMSBlcnJvciwgMCB3YXJuaW5ncywgMCBz
ZWN0aW9uIG1pc21hdGNoZXMKCkVycm9yczoKICAgIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
aW1zaWMtZWFybHkuYzo1MjoyOiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRzIHRvIGZ1bmN0aW9u
IOKAmHJpc2N2X2lwaV9zZXRfdmlycV9yYW5nZeKAmQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
bm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBGQUlMLCAx
IGVycm9yLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKRXJyb3JzOgogICAgZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jOjUyOjQ3OiBlcnJvcjogdG9vIG1h
bnkgYXJndW1lbnRzIHRvIGZ1bmN0aW9uIGNhbGwsIGV4cGVjdGVkIDIsIGhhdmUgMwoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfdmlydF9kZWZjb25maWcgKHJpc2N2LCBnY2MtMTApIOKA
lCBGQUlMLCAxIGVycm9yLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKRXJyb3Jz
OgogICAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jOjUyOjI6IGVycm9y
OiB0b28gbWFueSBhcmd1bWVudHMgdG8gZnVuY3Rpb24g4oCYcmlzY3ZfaXBpX3NldF92aXJxX3Jh
bmdl4oCZCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV92aXJ0X2RlZmNvbmZpZyAocmlz
Y3YsIGNsYW5nLTE2KSDigJQgRkFJTCwgMSBlcnJvciwgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1p
c21hdGNoZXMKCkVycm9yczoKICAgIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFy
bHkuYzo1Mjo0NzogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBmdW5jdGlvbiBjYWxsLCBl
eHBlY3RlZCAyLCBoYXZlIDMKCi0tLQpGb3IgbW9yZSBpbmZvIHdyaXRlIHRvIDxpbmZvQGtlcm5l
bGNpLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
