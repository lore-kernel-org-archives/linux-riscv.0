Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8A7C001B0
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 01:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CNh6Ouwlox9DohQf/wxMp0KOS5UqsUIVRGFuMKQBtEo=; b=Kv15grFPvbmu0V
	4l59jBzKTDMdVAt0fbXiu2bFJ/Vn9s9n6+QNCAxlNgEQCLjaln0iKIHMryIFAezzokiKh0A4zG6uN
	Hq22e24jg1N5XRwhRmNdTNmV3fdg2kXqsX+np+qp5T2+dC/jtl9veCa3L20mc9Ldr8vyIbTc7HkBR
	oii/g29bqPohM2QQXx5UxLJIoJjt4S3kLj91WeSLdnhrbuY2D6w+0W64rDqq7459RUubql5B4yWEz
	ZbPXwhels12GuFG/wNlCN+9T/OxDOR6nXxwBb19Uss2AeNKXpi/RyJ2wv/Mmx3XbWfeGUfdEKcx0N
	7qSccAa6phuXPIKyANNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYPS-003qQG-2z;
	Wed, 09 Aug 2023 01:54:50 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYPQ-003qOz-0k
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 01:54:49 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-40fcc91258fso41520591cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 18:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691546085; x=1692150885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPdHd3dHPLZ4M3JoFcie+26YcC9WO5uy2oLMLgktoeI=;
        b=OU3PSnnA00wAD10NZkfWd21vL8EzaIUAZtK+Qg7OMsNa9tJ/PkC4Et4gk6V+RsacaT
         QeYfVgRon03GTnp/cj88633IUJcgit8913i2Cw/86xL5dNLWc2Kt+e91+rTFBlFuVl5s
         tgEGB4vqxxiEqwsgIxq/FU8BRCr0yG0s67BkYJrLc1jNnOIIciBj32xh4Wd6WwhcXIq7
         RYd6+XFIM0zT8y2yxtidAoH4bmIFdVhIVDz7F5YbPhgJtS9IzrslMBinuvqfP15LVlJB
         6Sbkw8ZdCxShv1ceZeHFJqe9hrzKyOOuIyJeVS2dsmQ4VDHcQhD3pSwnHVScn+Wxo9Yb
         fDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691546085; x=1692150885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPdHd3dHPLZ4M3JoFcie+26YcC9WO5uy2oLMLgktoeI=;
        b=Zyvl1sn8dlXIHV/T38yNoHwXpdfwhpYGnBW9DBp8VjqKlf60VDLEYkrMLEoHs5EcnF
         qbDq+PNWL1UXxmMZKWMoek2bvjVGt5DmesV/MGbUEasS9SGTyQaFFY2B6RhvHAtUfi+Y
         tm/xC1XtwdStR5WBeqk4gmcuGGLRSgdl58+sDsTQDpDZW1YebB5SJ49/LkdaDiq+WchV
         j1cOEWE1v6FgkY6cEHsmOH/uX3HVVW2Guwke0IFNCE3iELGEP+vUfiIZmY9HtUM5reNB
         mWBgMUEOKj77Vth2PuDC2yIGEcYYu8xJ3NX3R1holp/tX8nngc64Ff4axKCgcTG6nTTG
         6CRA==
X-Gm-Message-State: AOJu0YwhY9+3tozt1v4PV70+C8BRHD0NBONTdKOhA10clQwMxuAsJ1fs
	8iCX87zCWq+nEu7URrCqxwZMX7nzSrtXQRjc8WJOfg==
X-Google-Smtp-Source: AGHT+IEYGschKJ5T3qO7w+VCCOczmPOzdCdurely6UZuaq78UNQd+9aB6v5d7ZiOrZpB79QILDgfYlosNVDERg0QFRc=
X-Received: by 2002:a05:622a:1309:b0:40f:f860:f047 with SMTP id
 v9-20020a05622a130900b0040ff860f047mr1903567qtk.56.1691546084960; Tue, 08 Aug
 2023 18:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230808072625.2109564-1-nick.hu@sifive.com> <20230808-pristine-celibate-60957ea523c0@spud>
In-Reply-To: <20230808-pristine-celibate-60957ea523c0@spud>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 9 Aug 2023 09:54:34 +0800
Message-ID: <CAKddAkA3giaG6kjcxsaA9c4TpemKThPyAzb6+Sv4ug7S7kUm=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] serial: sifive: Add suspend and resume operations
To: Conor Dooley <conor@kernel.org>
Cc: zong.li@sifive.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Ben Dooks <ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_185448_282641_B89068B3 
X-CRM114-Status: GOOD (  10.06  )
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

SGkgQ29ub3IKCgpPbiBUdWUsIEF1ZyA4LCAyMDIzIGF0IDQ6NDTigK9QTSBDb25vciBEb29sZXkg
PGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgMDgsIDIwMjMgYXQgMDM6
MjY6MjVQTSArMDgwMCwgTmljayBIdSB3cm90ZToKPiA+IElmIHRoZSBTaWZpdmUgVWFydCBpcyBu
b3QgdXNlZCBhcyB0aGUgd2FrZSB1cCBzb3VyY2UsIHN1c3BlbmQgdGhlIHVhcnQKPiA+IGJlZm9y
ZSB0aGUgc3lzdGVtIGVudGVyIHRoZSBzdXNwZW5kIHN0YXRlIHRvIHByZXZlbnQgaXQgd29rZW4g
dXAgYnkKPiA+IHVuZXhwZWN0ZWQgdWFydCBpbnRlcnJ1cHQuIFJlc3VtZSB0aGUgdWFydCBvbmNl
IHRoZSBzeXN0ZW0gd29rZW4gdXAuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTmljayBIdSA8bmlj
ay5odUBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NA
Y29kZXRoaW5rLmNvLnVrPgo+Cj4gV2hlcmUgaXMgcGF0Y2ggMi8yPwpUaGlzIHdhcyBteSBiYWQu
IFRoZXJlIGlzIG5vIHBhdGNoIDIvMi4gSSdsbCBjb3JyZWN0IGl0IGluIFYyLgoKTmljawoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
