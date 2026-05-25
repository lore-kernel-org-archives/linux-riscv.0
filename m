Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC7FCD5BBF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgJD7B9sWGxe0DZJsKaUqzx4MwoSNACLCnReTzvo8QQ=; b=oiAMYwYnMqg/1J
	PPtkUxTPGGalEBJgcf8D3BIN7BlmVVoSqeAv4O+P3x3/J5AjTPZYFJtmWQp/3EkwumgatuG3E/+11
	Y75baN64X/ts8DZBXwfTPglxNMmONPTrKYqMuH3E96ylEzHXuGFG/sYKdBhAQot/Xq5jpcuPHQedU
	k37BGT6vjwfcszzX4Pso6+NRGgAA7ci7dvGc67inzE/R94CojXP/9b1WM3zF6TpRkNZ3dNEtunUqX
	4bO5oglJ02N3AO1bhSqMbdOhBm3lo7RWZ72e7oaRP2x6raeBNwv9Cf4MD1IYPp0PZ7LTrUIBrLl9d
	08d3KJ+kUBauIUGxJbmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRX5-0000000GnCp-1XEg;
	Mon, 25 May 2026 09:23:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRX2-0000000GnBp-0eVa
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 09:23:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DDDB4454E
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 09:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B001F01560
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779701011;
	bh=HSqMR1BUhZmAPoEEsJ7CSGo/YWAmtsvZVxjNmWMnpv8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bY5RO9zeN2x3Sx/sqgo2aknq4O6QBadaN73qg/yfFYfFj1VFzTuYX5o/YDTtIhE+q
	 7hwNQawZXELa/v/bcY6sAvMO325Vy2GJlc6YqVhrDmKUvK+ZmgeeM0lCDSeWqxoLQb
	 f8ujT09CuayXKFW5Hyn8wj1rStcaKQVPaflf4SQcVG126wstv1ufwwz+4u2gsLIiXE
	 pR1oxgNT6N6o3yltF1VFTK1j9+F1Bm39BZAhUiJbcuE3/5LErESwI8KrtcZ6Msp90G
	 fg3pRmNg2jbV91FjV4Jf+sICABFNtU/EFI6OTLAeaHXycKuCOQDKKnkza89bylr8jw
	 zxFHO5pXuTVlw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8738c178dso8260341e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 02:23:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9zvG5nQkU4USKrOY1r+F/4JPR2GIBqWCCKEVCZwLPCaNKLOlhXairHl1zvkCkoyIRE9jPmzl9QhVyCqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfp1Ifu3mvlhgWtPidkuszDaJSXnkGteunpAJBxmoBAgqLnove
	VypjvoYQOBgajyOeShzkbZCksEREDjJ3CWx2nnkMw03tu2lHASWsIn29Cxc9cCuawpCoZVA3rGP
	5NIf3IaFTNfCXDYRiHVPtibkwkwmc4aE=
X-Received: by 2002:a19:f614:0:b0:5a8:d1f3:501 with SMTP id
 2adb3069b0e04-5aa323d4911mr3163269e87.22.1779701009859; Mon, 25 May 2026
 02:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com> <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 11:23:17 +0200
X-Gmail-Original-Message-ID: <CAD++jLmjm=Zgs+jNGTVdasy+9O1GvqM6EP=rVRR5mP=L9V13Mw@mail.gmail.com>
X-Gm-Features: AVHnY4KZDPHsMnDjXhSnKvV5S7ZKJ_9tMzfEYPdLup3zNAoK-EI-0JPPNTFt604
Message-ID: <CAD++jLmjm=Zgs+jNGTVdasy+9O1GvqM6EP=rVRR5mP=L9V13Mw@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl bindings
To: wangjia@ultrarisc.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_022332_216107_126219BC 
X-CRM114-Status: UNSURE (   6.77  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgMzoxOOKAr0FNIEppYSBXYW5nIHZpYSBCNCBSZWxheQo8
ZGV2bnVsbCt3YW5namlhLnVsdHJhcmlzYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cgo+ICsrKyBi
L2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC91bHRyYXJpc2MsZHAxMDAwLXBpbmN0cmwuaAoK
TW92ZSB0aGlzIHRvIHNvbWV0aGluZyBsaWtlIGFyY2gvKi9kdHMvdmVuZG9yL2RwMTAwMC1waW5j
dHJsLmR0c2kKCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
