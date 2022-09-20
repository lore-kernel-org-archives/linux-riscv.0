Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DE9ECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 16:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BQRt/H8pDJd5uMKz/oFaCcC+GTTfuIqyVK9iBmSbreQ=; b=mEwC5GGzeEV/Po
	57EQcVulBkcFpgdJVjEOfGgXv6fRuqpckUvF7cuZ0J0gw/hYRFEWDvxCAMHYz7jCRR6SumxWZDHz/
	VP+AwgpR+pLxAT72OJDaZLDRamBVkftf6wB3yDA7EC0ADn4pnvlEz3c2qFhtOM/J7t4iZJyCgvNY5
	XuEFmQX/aPfm7Oge+DLELAc4od1rUhpsmM/Z72QLJ7PTz7BNE8gVIq8slQVb+kNMXUK0Hnl7IJaZr
	a6/5rQXNRZZwNqFRnllTov0WiPeVakvXRaTb++W9H/rp3QcvuUJ+IJHd1OBWvxVXnYc+YFOLXGDJe
	m7pg/3dygo8QRLee7RMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oafgA-0052FM-W5; Tue, 20 Sep 2022 16:00:59 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oafg7-0052Br-98
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 16:00:56 +0000
Received: by mail-pf1-x433.google.com with SMTP id w2so3221575pfb.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=/XA5rkoouGgX9DCK7SjCAV6orQoM99AmvM4Gl/XVcZc=;
        b=UbdCnls33atG4xWvWkmByU/a6tf+VDySm1kndblgUXjNNzsdPPmowbUFA11ocrRWSh
         BDGKgRXo1Tyg27YE89N4hwD27d5JT7U64+hgjWoag4+AgFhsV8J3naLUCmgu8SJ5HTEc
         ZNgYAhlLVTYexBs5rA9it8sXkQvHoKzIjWUWCk+UIDWupY8B6v/xyp95mmGvWHh3IseX
         l8AQ7TDBzS8r0EQfO7RWzP0BLAbLPjoyKs50cCbjv8zaumDgF35xr35MisOarryf1kg3
         Y0RCKoGEmn3ig3ip85mGIeU4uswZ86MQG886MXYoldVfo3qKXUAR6fXVQj71ExGqEptp
         BcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=/XA5rkoouGgX9DCK7SjCAV6orQoM99AmvM4Gl/XVcZc=;
        b=ehosuiOEa4ynt9Ib55ZKnU4fP5gJiu+8fY3Q0sAqFk6eMa/DtbPY4T1vydPQ+5Vwuz
         s5sFhIioZ0vNKQBGZLLBDJ11TCYnTzd0R9PgxErI0pmI+6QBynS4VlfOfixxR94OZ/wI
         afpM4Xhea2Vovj0hG246zdfF6H6+Glu71hx4blxCxQFBdHE9N+LN507lo+YDbbEkofIp
         hSSvl5G8r5PXFRUVT7W4+USWYW2LIaqjIWPecFQKDTFEhWzs09IFkYw7UqQUo3GKMPrH
         vj7kve1jhgn4dluWrBO6H3xERyZ8Kn7cMSoqoGFU7LRPmLJkl1sucWl+/FbetJ+TOj6H
         jksg==
X-Gm-Message-State: ACrzQf1IKVVLW1XbE+C6WM0al1dYAhoWj1/PUX0XZRbXWsO5yX53BgYd
	Si8RyG+eee+4J3wPjzxw4NhwoQ==
X-Google-Smtp-Source: AMsMyM7Bspny5wJ7RTUvQPBMhUFUW4mhUnaRJBnTUiH0bjIFvW70GdXwxuc6WhIqJ42e15MlO4qMzQ==
X-Received: by 2002:a63:b4a:0:b0:438:c97c:994d with SMTP id a10-20020a630b4a000000b00438c97c994dmr21373081pgl.597.1663689650624;
        Tue, 20 Sep 2022 09:00:50 -0700 (PDT)
Received: from lx2k.lixom.net (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id bf10-20020a170902b90a00b0017849a2b56asm89488plb.46.2022.09.20.09.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 09:00:48 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Olof Johansson <olof@lixom.net>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v2] serial: sifive: enable clocks for UART when probed
Date: Tue, 20 Sep 2022 09:00:18 -0700
Message-Id: <20220920160017.7315-1-olof@lixom.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_090055_555486_0C5AAA50 
X-CRM114-Status: GOOD (  13.92  )
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

V2hlbiB0aGUgUFdNIGRyaXZlciB3YXMgY2hhbmdlZCB0byBkaXNhYmxlIGNsb2NrcyBpZiBubyBQ
V01zIGFyZSBlbmFibGVkLAppdCBlbmRlZCB1cCBhbHNvIGRpc2FibGluZyB0aGUgc2hhcmVkIHBh
cmVudCB3aXRoIHRoZSBVQVJULCBzaW5jZSB0aGUKVUFSVCBkb2Vzbid0IGRvIGFueSBjbG9jayBl
bmFibGVtZW50IG9uIGl0cyBvd24uCgpUbyBhdm9pZCB0aGVzZSBzdXJwcmlzZXMsIHN3aXRjaCB0
byBjbGtfZ2V0X2VuYWJsZWQoKS4KCkZpeGVzOiBhY2U0MWQ3NTY0ZTY1NSAoInB3bTogc2lmaXZl
OiBFbnN1cmUgdGhlIGNsayBpcyBlbmFibGVkIGV4YWN0bHkgb25jZSBwZXIgcnVubmluZyBQV00i
KQpDYzogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
Q2M6IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwu
Y29tPgpDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KQ2M6IFBhdWwgV2Fs
bXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KU2lnbmVkLW9mZi1ieTogT2xvZiBKb2hh
bnNzb24gPG9sb2ZAbGl4b20ubmV0PgoKLS0tCgp2MjogU3dpdGNoIHRvIGRldm1fY2xrX2VuYWJs
ZWQoKSBwZXIgVXdlJ3Mgc3VnZ2VzdGlvbi4KCi0tLQogZHJpdmVycy90dHkvc2VyaWFsL3NpZml2
ZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL3NpZml2ZS5jIGIvZHJpdmVycy90dHkv
c2VyaWFsL3NpZml2ZS5jCmluZGV4IDVjM2EwNzU0NmE1OC4uNGIxZDRmZTg0NThlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2lmaXZlLmMKKysrIGIvZHJpdmVycy90dHkvc2VyaWFs
L3NpZml2ZS5jCkBAIC05NDUsNyArOTQ1LDcgQEAgc3RhdGljIGludCBzaWZpdmVfc2VyaWFsX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCXJldHVybiBQVFJfRVJSKGJhc2Up
OwogCX0KIAotCWNsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCBOVUxMKTsKKwljbGsgPSBk
ZXZtX2Nsa19nZXRfZW5hYmxlZCgmcGRldi0+ZGV2LCBOVUxMKTsKIAlpZiAoSVNfRVJSKGNsaykp
IHsKIAkJZGV2X2VycigmcGRldi0+ZGV2LCAidW5hYmxlIHRvIGZpbmQgY29udHJvbGxlciBjbG9j
a1xuIik7CiAJCXJldHVybiBQVFJfRVJSKGNsayk7Ci0tIAoyLjMwLjIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
