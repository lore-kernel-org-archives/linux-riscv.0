Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B2CC5B567
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 03:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/5+5noyLdvQg6jiYHWpKnURLS+CDhjqPL7c+J+/ASY=; b=FZR0yvxhY4h7AD
	8wh6kcOGyR6hTUuuBI+KLziu1bE952O4ifaZj2GuiD7A/joZdZg3hNLkL8OHtk+7NYjwColnOmSUK
	/hkoXv6J2EJ4+cCErG2apCpoOH8WQpFK22C9+uO8/9ypUV9Lc6O8VZ+oxSXAjKo3tWR++qsPhUd81
	Yk+iL/KCnKaa10caBDVn+j/AKUKr9oNVzXIwz1rFrLJUlIp+8UHThnx6r4DVVi+WmU9U7kJJ808ZM
	xNghRFVDaIiwzerf1War1v8UACdsnri5K/gmkz+sRIV3WzFXPZwnC4DI+CbKkNc3uEr9xqSeupEiS
	1TW3LNnfPBo0d/uYU2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtzhh-0000000FMJU-0ycd;
	Wed, 12 Aug 2026 03:32:34 +0000
Received: from 220-128-198-181.hinet-ip.hinet.net ([220.128.198.181] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtzhc-0000000FMHP-36H7
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 03:32:31 +0000
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 67C3VclI039026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 11:31:38 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.43; Wed, 12 Aug
 2026 11:31:38 +0800
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Aug
 2026 11:31:38 +0800
Date: Wed, 12 Aug 2026 11:31:37 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "Albert
 Ou" <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v5 2/4] i2c: add Andes I2C driver support
Message-ID: <anvpGTqOnwlbERgR@swlinux02>
References: <20260811-atciic100-v5-0-1d306c21dba3@andestech.com>
 <20260811-atciic100-v5-2-1d306c21dba3@andestech.com>
 <361b7fa5-0e4c-429a-ad66-c81fbee86c45@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <361b7fa5-0e4c-429a-ad66-c81fbee86c45@wanadoo.fr>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 67C3VclI039026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_203229_192134_AF079E89 
X-CRM114-Status: GOOD (  12.56  )
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

T24gVHVlLCBBdWcgMTEsIDIwMjYgYXQgMDk6Mzc6MTJBTSArMDIwMCwgQ2hyaXN0b3BoZSBKQUlM
TEVUIHdyb3RlOgo+Cj4gTGUgMTEvMDgvMjAyNiDDoCAwODoyOSwgQmVuIFpvbmctWW91IFhpZSB2
aWEgQjQgUmVsYXkgYSDDqWNyaXQgOgo+ID4gRnJvbTogQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3
QGFuZGVzdGVjaC5jb20+Cj4gPgo+ID4gQWRkIHN1cHBvcnQgZm9yIEFuZGVzIEkyQyBkcml2ZXIu
IEFuZGVzIEkyQyBjYW4gYWN0IGFzIGVpdGhlciBhCj4gPiBjb250cm9sbGVyIG9yIGEgdGFyZ2V0
LCBkZXBlbmRpbmcgb24gdGhlIGNvbnRyb2wgcmVnaXN0ZXIgc2V0dGluZ3MuIE5vdywKPiA+IHdl
IG9ubHkgc3VwcG9ydCBjb250cm9sbGVyIG1vZGUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmVu
IFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+Cj4KCkhpIENKLAoKPiAuLi4KPgo+
ID4gK3N0YXRpYyBzdHJ1Y3QgaTJjX2FsZ29yaXRobSBhbmRlc19pMmNfYWxnbyA9IHsKPgo+IENv
dWxkIHRoaXMgYmUgY29uc3Q/CgpZZXMsIEkgd2lsbCBhZGQgY29uc3QgaW4gdjYuCgo+ID4gKyAg
ICAgLnhmZXIgPSBhbmRlc19pMmNfeGZlciwKPiA+ICsgICAgIC5mdW5jdGlvbmFsaXR5ID0gYW5k
ZXNfaTJjX2Z1bmMsCj4gPiArfTsKPiBDSgoKVGhhbmtzLApCZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
