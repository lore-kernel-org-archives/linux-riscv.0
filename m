Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63430CA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 18:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73O3TNIiT6agOAEqWY5THvGRB2L0z6tfE2cUlEOa9HE=; b=KgFzVWqBxKpX3V
	AIKm63bZgYsB3hUD6m3F4r/iqQ+4d+daQAb/OATLUnTkF3xtKi4DO20ipwFBtYJMLNdEEcqyp4OHO
	YQJXSzSDW3n+OazX8n6bF1Tv3B+/yoRI9Hdkm+R3ZQv3Qt2UbNdd1tThDseOqHUlAdnBbC1hnSdZO
	NnqVvNsC2YaoEaIMQT3jVL6Jh+LZZ2yIV8FLp92gfn1Ob541dUOdCxynjxGzBTRdqsGYqmkp6aolz
	+ellPSxkjgQLH51S+BdkH3YGgcDTH4aeax/c1sWwyiEe6k2GX7aoyUJ6TtFFbgsp3RvaZU6rysFub
	aRhDtRMPMOXLMVXxnAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiQq-0000000CJs0-2RlB;
	Fri, 02 Oct 2026 18:56:32 +0000
Received: from mail-yx2-x2b.google.com ([2607:f8b0:4864:41::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiQB-0000000CJmJ-22oZ
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 18:56:30 +0000
Received: by mail-yx2-x2b.google.com with SMTP id 00721157ae682-8ac8e048735so36602037b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 11:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790967350; cv=none;
        d=google.com; s=arc-20260327;
        b=dp8nTO1HLLjOYw9HvWgd8L0zXSwuMXZbdpoxri/Le1XYVQuGrZiqf8SFf+vAFcluVa
         QY1suTNuzSq+B7bbBR+FQdkVf/6YktEJ5Qp04QVa6ALYY95jfCVaos4+2dCmWRmq1/8S
         GYPV6kfG5TYFdRNHYPQ4XCd/ixz/ej72RK+xjgrhq1g2GNzQCR+MSH0fXosoCw0S93yQ
         Fz/RDRzVqI9tvir4WhV48+WpHkDhCgjx5eWkTzxTPHag8RxMvVsYy9mbUdrGVum2wzaJ
         QHZwFDtK3nvbwLZLtr34SAQ4WasuvtZjTko16dVW406twPizstY17qyhr4ot0IdOlss0
         9LBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9S5eAE312pd6HZl9cjvi/BgiTHAVYy5cEZ8AWzWw5xo=;
        fh=wep9G6PIuQKH2WtW5CHSYgfbV4a+Hphx6pxLXT0UE5I=;
        b=lGCyHH7VKs7dIlfgMHuJGxOaIvBC9UUpQV0m8l87fFCxiH+zSm32iwHBqFELF/R0Yk
         F0vb0Q5qZIOgThVs/is6QqwLjW6hxZr8WEizGzrurlfUrcA0vaaWvWCbHgiOyfeqfUrA
         aIwA3Rj3eHIsK71laYyVnAX/tCd7mY73z/gKgQmhJwKl59SaidzkdYxsFK3ydv3HN2HO
         p7qk3heNhbkhzQe5xsRNaXMDuzAZ8CW92aJ/3b2zNuPgMKnOXFASzgRdAWs2146uJW15
         m18eBDqYPIAsnVHhig1YnwgAe0yiZoj8GTH1FDUJ8jk7ysarnzL2QSEovYZ4YQlJR0q8
         FwVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790967350; x=1791572150; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9S5eAE312pd6HZl9cjvi/BgiTHAVYy5cEZ8AWzWw5xo=;
        b=UCTtgnOlD2chxlYvZVcsMK7oirJj/g9iS5KxaFHAfI4tY8OBfxzt8xh1zJur0J2MUu
         nV/oAgL+GLcyundsb7bNd+LjYknp3UTMrj7pxQqIZZV3OW0MRYWNNBs/rpAX84aYSqm5
         V0glwfpMEjEy8hI0vjVSuA2cRGVPE4TRk7UQw6Z4o7sjQhUKqO7J0x/ovcPcHn9KXANc
         OzdcwBxLE0IFSu0wCp/q2xqWY6sq6j2f7jiOcX/rA06DbwzQm3hAowphcCedvy58XFQL
         pxgE5yVmnGlpLwJIVB0TckhWLeAJjXS0nMjFEPRkWyPETdzuiKEI+VMjuCBmf6gK6PIP
         WQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967350; x=1791572150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9S5eAE312pd6HZl9cjvi/BgiTHAVYy5cEZ8AWzWw5xo=;
        b=XNfwofy9RniiefBaP+zgdolnl8OZXd6xo25zAKDSJR85O4mIOXWM2ltDV5c4NF1JCa
         6BvwGL2gkWSKLdntUgoXaLs8UsormIrXkXMY2k/UpzwBBhiuGoujattYtRdlnljnn8jV
         7d/q/cuz6aA1SssmtPMphlsPiS8tAZnIFombcszVyNiSZpCYb4p3g6/v45NgbH/7+dfv
         Y7IdyS6F+I853zKMQkwl1HU/Kd1QsMhtq4gbz1Z+XkyDRa4rcxgisXtt9iRXFzRq89P+
         nBNjFax1h6++zGKv1AqIKwlW90K08RatRoz0THH6VV0eXDCyAtuIdi85uq8mk1xuch3f
         YwMg==
X-Forwarded-Encrypted: i=1; AKwUvBzHNOCe4IXVXafYLAy7Xkazh4voV2A7YqeMEEU24C3j5w5RG4jFl3QS8p35saZxdl0JFolBzOjbtC4zbA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKE5TwWfAaksIawA85tP7Z598DxFsOLqAV7I698LapfY+C9Xngt
	il0N4814l+mD6AOK3bzzYY6RreeC/lz95NrQ5JQn68Jag6rpGgwvvCcBFVxZfFhwkm9r2MOi0uE
	AfRKaXLZ9OPxSRJBCDYdSOJbZzKGeNmFirw+p
X-Gm-Gg: AYBFou00XFttceIfiSgmVpn2PIF2wOIw7Lc8BhVj/eQ4bL4f7aCOHMLr8sHRXef6aLA
	FqEnPfbL3DCE/nIEL1LmK2wYwyorVNU+EQCl2IEZCiNS5JnBFmwUTuWGGMNKoCe9MlvzIR9aafB
	qmwLRflLEUCYCFXBPbXmXDgw5iVj6rgleGm3KaKWCPUNWbMxwDOSXp13XsVLJGvpJctG3wNOcRQ
	G1JAk7K9aa1dK3FZke5vwVovXxsEog6+BcKLHa8kU3MxaRS5XkFKbNfBpz/p4LrDpOZvmlMLR8j
	5XqxwkBXApnoyGbMptXAuN6NJW5aPr1zCDOiCX9GM7vudXp8npPZNjIz
X-Received: by 2002:a05:690e:1243:b0:677:b7e7:f68 with SMTP id
 956f58d0204a3-677b7e71be5mr813923d50.108.1790967349727; Fri, 02 Oct 2026
 11:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org> <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
In-Reply-To: <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 2 Oct 2026 20:54:00 +0200
X-Gm-Features: AclHuK9ruP21ynPDiadHS4oYScZ4A0eIuHPpImnDhttohXSuBO4BfsPMVhy9WRo
Message-ID: <CABdCQ=OUTASG8JDBqnJAPJ5aTDUC-BQzCVcw0r=cxrb8CPUO2A@mail.gmail.com>
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_115551_535889_25E7DA92 
X-CRM114-Status: GOOD (  12.19  )
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

RWwgdmllLCAxOCBzZXB0IDIwMjYgYSBsYXMgNzo0OSwgWWl4dW4gTGFuICg8ZGxhbkBrZXJuZWwu
b3JnPikgZXNjcmliacOzOgo+IFsuLi5dCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcG1kb21haW4v
c3BhY2VtaXQvcG1fZG9tYWlucy5jIGIvZHJpdmVycy9wbWRvbWFpbi9zcGFjZW1pdC9wbV9kb21h
aW5zLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDU2M2U0
ZTRlMjMyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvcG1kb21haW4vc3BhY2VtaXQv
cG1fZG9tYWlucy5jCj4gWy4uLl0KPiArc3RhdGljIHN0cnVjdCBzcGFjZW1pdF9wbXUgKmdwbXU7
CgpXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGVtYmVkIHRoZSAnc3RydWN0IHNwYWNlbWl0X3BtdScg
cG9pbnRlciBkaXJlY3RseSBpbnRvCidzdHJ1Y3Qgc3BhY2VtaXRfcG1fZG9tYWluJz8gT3RoZXIg
Z2VuZXJpYyBQb3dlciBEb21haW4gZHJpdmVycyAoUm9ja2NoaXAsClFDT00sIFJlbmVzYXMpIHVz
ZSB0aGlzIHBhdHRlcm4gdG8ga2VlcCBkb21haW4gY2FsbGJhY2tzIHNlbGYtY29udGFpbmVkIGFu
ZApyZWFkeSBmb3IgbXVsdGktaW5zdGFuY2UgU29DcwoKPiBbLi4uXQo+ICtzdGF0aWMgaW50IHNw
YWNlbWl0X3BkX3Bvd2VyX29uKHN0cnVjdCBnZW5lcmljX3BtX2RvbWFpbiAqZG9tYWluKQo+ICt7
Cj4gWy4uLl0KPiArIHJlZ21hcF9yZWFkKGdwbXUtPnJlZ21hcCwgQVBNVV9QT1dFUl9TVEFUVVNf
UkVHLCAmdmFsKTsKClBsZWFzZSBjaGVjayB0aGUgcmV0dXJuIHZhbHVlIG9mIHJlZ21hcF9yZWFk
KCkKCj4gWy4uLl0KPiArIGlmIChyZXQgPCAwKSB7Cj4gKyBkZXZfZXJyKCZkb21haW4tPmRldiwg
InBvd2VyLW9mZiBkb21haW46ICVkLCBlcnJvclxuIiwgc3BkLT5wbV9pbmRleCk7CgpUeXBvOiBz
aG91bGQgdGhpcyBzYXkgInBvd2VyLW9uIGRvbWFpbiIgc2luY2UgdGhpcyBpcyBpbnNpZGUKc3Bh
Y2VtaXRfcGRfcG93ZXJfb24oKT8KCj4gWy4uLl0KPiArc3RhdGljIGJvb2wgc3BhY2VtaXRfcG1f
Z2V0X3N0YXRlKHN0cnVjdCBzcGFjZW1pdF9wbXUgKnBtdSwKPiArICBzdHJ1Y3Qgc3BhY2VtaXRf
cG1fZG9tYWluICpwZCkKPiArewo+ICsgY29uc3Qgc3RydWN0IHNwYWNlbWl0X3BtX2RvbWFpbl9w
YXJhbSAqcCA9IHBkLT5wYXJhbTsKPiArIHUzMiByZWcsIGJpdDsKPiArCj4gKyByZWdtYXBfcmVh
ZChwbXUtPnJlZ21hcCwgQVBNVV9QT1dFUl9TVEFUVVNfUkVHLCAmcmVnKTsKClBsZWFzZSBjaGVj
ayB0aGUgcmV0dXJuIHZhbHVlIGhlcmUgYXMgd2VsbAoKPiArIGJpdCA9IHAtPnVzZV9odyA/IEJJ
VChwZC0+cGFyYW0tPmJpdF9od19wd3Jfc3RhdCkgOgo+ICsgIEJJVChwZC0+cGFyYW0tPmJpdF9w
d3Jfc3RhdCk7CgpTaW5jZSAncCcgaXMgaW5pdGlhbGl6ZWQgdG8gJ3BkLT5wYXJhbScgYWJvdmUs
IHlvdSBjYW4gdXNlICdwLT5iaXRfaHdfcHdyX3N0YXQnCmFuZCAncC0+Yml0X3B3cl9zdGF0JyBk
aXJlY3RseSBoZXJlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
