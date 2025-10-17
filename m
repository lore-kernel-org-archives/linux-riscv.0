Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B42FCCD19A
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 11:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXgMoOvxR1os4xau8B3QW+mOPDkdS/DBayxSaVivVZ4=; b=iUoutX1R2QnE9m
	7KT1pQunkBFos0rvHvrkJEtQjgKpcWFy57CU9D/RDJWUmmaBMI5XG7PXTTksCVCfhpXlp+BZmRUbt
	v+FuOGQctHzYvxPifWcNMXVKiGPqvW1E5p/1M9A8er3UUnJ5gxhsZZ60UWPvWHBs8FAriKkUjb24e
	JygHntiQMsJ1MExa2mXenj4XfNA8S3tV8TQX7u4GIGw6FtMayhlM7WSTxVqUfsyXDHtKe7coA34YN
	01zZm+zmQolxCXMe1PJ4anHWsmnMMvlVcyezutjNkALnS+jO7rv5Ltde43MqKKE2/cHQiCeDW8e+5
	E+/yNbT1RURYRMLVfFdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9j19-00000007jjZ-1tVj;
	Fri, 17 Oct 2025 11:53:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9j16-00000007jj4-3nMj
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 11:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760701982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WxfvbcLLu67MIwlxOvZ0TKOWYqHJfoFEyrjda7z1bsQ=;
	b=ML3YeOoZU3J9lEjDbUryHfLAW1qv3Gifh+qMCHFaLyMyduByb4sxp0VXOUoPEiAO+Njqdr
	eJ9ue/NkwTGHwrEzUMbuipqIYzvade7+1JcTiyuEFmDUTCvYQbW8pIkeWSHH3MOsByR39i
	q1QZB6SNRFZJJDHvcS5tc+YqPHNM5k0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-OJXKRZC2PJq3CZm0DPVtZw-1; Fri, 17 Oct 2025 07:53:00 -0400
X-MC-Unique: OJXKRZC2PJq3CZm0DPVtZw-1
X-Mimecast-MFC-AGG-ID: OJXKRZC2PJq3CZm0DPVtZw_1760701980
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46fb328a60eso10685115e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 04:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760701979; x=1761306779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxfvbcLLu67MIwlxOvZ0TKOWYqHJfoFEyrjda7z1bsQ=;
        b=YC0NWC/ggw5s+3x6R7dwrgeKNBKHnaljFpV+cx1HVPpTq/wLvLZu89YBmmzAkv/PAt
         xVRBCCSD9Tduef5teqPs+/nkUAqLbRvw8aK88z7doaYshCOSf56zMzfr0Dw3sZC9yinm
         lAQLpEVv6JxI+qax5d4v9fpfh6f+318+eGAEiNQiffrLnTDLP+ELQDafT1bUDxgWeqBZ
         K+NKvayXVwN0BhMgT5C+lYr5l2/TCD/KeF9qwh15mU7IsyfYhz9iU4qz6vk63/ta6GjU
         vggb7J+7/aurvEst9N2S/F42mAi/LuHVHah1zWZ36vhVKWNhN1RRkm69XRDYdlCz69oQ
         P96w==
X-Forwarded-Encrypted: i=1; AJvYcCXLqu0/A8CuiwqtXvFPle1GolQXHQAwQSOe0Uk8BwCsNzRczA3ER1U3MMWDlJ4CT/bXCV2W2KlMNWiRbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5r5RDo4e+u39cA0t+DbVh2Shw0ctn7cJTBtBX7jziaXJJNmWH
	HbWIXGlaz0FPDFro7tRe9GzlmlaQRv1aj5f9iedZh4AHxJoUhhazpyQ3bbhLwgAx6HRtvLQVSco
	klxezft054epMunmms2zj2gwU5nzd9M/O5ZVasi8sZmFcRnckTDLRuOwrwZVj0bsn+OAV5e225w
	ojbce/vIQj+IXOm0PR+WozhaQuTAggMMRz4HtHprbhMBsP
X-Gm-Gg: ASbGncub0neCxmxOVaCpW58HHGEWK1FlaOSZkU3hwpEtPuBhO/mcxuhk6WZM4Ap858M
	XGzmDmdzc+29hmPvyc1KFqpQUpiNiY1vd1vyPBichTVfZ2ad9TzJKW1SG0r3m44EPMNPg+j8z9p
	yTsNLgEp4h8AV9D3HZTSEyZatDHsjezookTluAscMn69KamviOiwqKaMZiYugf4w9ev6j9CdNop
	5CXfAG4+1aGIH3x8w==
X-Received: by 2002:a05:600c:529b:b0:471:350:f7a4 with SMTP id 5b1f17b1804b1-471178a400cmr23491335e9.17.1760701979571;
        Fri, 17 Oct 2025 04:52:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEywczK+EIpYFNZr6LFF+2TgMnXQ228HOGM0S1gJjRCt05BeFqbOEfG8iq+xaitGHL34pj0bRg3/qZRX9c/GpI=
X-Received: by 2002:a05:600c:529b:b0:471:350:f7a4 with SMTP id
 5b1f17b1804b1-471178a400cmr23491215e9.17.1760701979206; Fri, 17 Oct 2025
 04:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251016084301.27670-1-lzampier@redhat.com> <20251016084301.27670-4-lzampier@redhat.com>
 <87sefj179h.ffs@tglx>
In-Reply-To: <87sefj179h.ffs@tglx>
From: Lucas Zampieri <lzampier@redhat.com>
Date: Fri, 17 Oct 2025 12:52:48 +0100
X-Gm-Features: AS18NWAyr_OiJTgLStN1G7hKO9txtKoLZhRKznNbGHfdcjMfX9CrDwQ5omJQ6-g
Message-ID: <CAOOg__AHpFsxU==JPX_usRnkJSL6agadsGZUxdh0L0DriFwcQg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Charles Mirabile <cmirabil@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <dramforever@live.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Zhang Xincheng <zhangxincheng@ultrarisc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hiGRojcYOm2J4s-vx6iiK_yU0WjnhaRxpvJMcavU5RQ_1760701980
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_045305_034285_C9E7C707 
X-CRM114-Status: GOOD (  13.85  )
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

SGkgVGhvbWFzCgpJJ20gcmVhbGx5IHNvcnJ5IGZvciB0aGF0LgoKT24gVGh1LCBPY3QgMTYsIDIw
MjUgYXQgMTE6MTbigK9BTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3Jv
dGU6Cj4KPiBPbiBUaHUsIE9jdCAxNiAyMDI1IGF0IDA5OjQyLCBMdWNhcyBaYW1waWVyaSB3cm90
ZToKPiA+IEBAIC00MzAsNiArNTE2LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgcGxpY19tYXRjaFtdID0gewo+ICAgICAgIF5eXl5eXl5eXl5eXgo+IEhvdyBvbiBlYXJ0aCBk
aWQgeW91IG1hbmFnZSB0byBzY3JldyB1cCB0aGUgaHVuayBoZWFkZXI/Cj4KSSB3YXMgY29weWlu
ZyBodW5rcyBvdmVyIGZyb20gb25lIGZpbGUgdG8gYW5vdGhlciB0byBhdm9pZApmb3JtYXQtcGF0
Y2ggYXMgaXQgd2FzIHNjcmV3aW5nIHRoZSBlbWFpbCBoZWFkZXJzLCBhZnRlciB0aGF0IEkKbGVh
cm5lZCB0aGF0IHRoZXJlJ3MgLS1bbm8tXWVuY29kZS1lbWFpbC1oZWFkZXJzIGluIGZvcm1hdC1w
YXRjaCBmb3IKdGhhdC4KCj4gQXBwbHlpbmc6IGlycWNoaXAvcGxpYzogQWRkIHN1cHBvcnQgZm9y
IFVsdHJhUklTQyBEUDEwMDAgUExJQwo+IGVycm9yOiBjb3JydXB0IHBhdGNoIGF0IGxpbmUgMTE2
Cj4KPiA+ICAgICAgICAgLmRhdGEgPSAoY29uc3Qgdm9pZCAqKUJJVChQTElDX1FVSVJLX0VER0Vf
SU5URVJSVVBUKSB9LAo+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJ0aGVhZCxjOTAwLXBsaWMi
LAo+ID4gICAgICAgICAuZGF0YSA9IChjb25zdCB2b2lkICopQklUKFBMSUNfUVVJUktfRURHRV9J
TlRFUlJVUFQpIH0sCj4gPiArICAgICB7IC5jb21wYXRpYmxlID0gInVsdHJhcmlzYyxjcDEwMC1w
bGljIiwKPiA+ICsgICAgICAgLmRhdGEgPSAoY29uc3Qgdm9pZCAqKUJJVChQTElDX1FVSVJLX0NQ
MTAwX0NMQUlNX1JFR0lTVEVSX0VSUkFUVU0pIH0sCj4gPiAgICAgICB7fQo+ID4gIH07Cj4gPgo+
ID4gQEAgLTY2NCwxMiArNzUyLDE2IEBAIHN0YXRpYyBpbnQgcGxpY19wcm9iZShzdHJ1Y3QgZndu
b2RlX2hhbmRsZSAqZndub2RlKQo+ICAgICAgXl5eXl5eXl5eXl5eXl5eCj4gRGl0dG8gaGVyZS4K
Pgo+IEkgZml4ZWQgaXQgdXAgbWFudWFsbHkuIFBsZWFzZSBiZSBtb3JlIGNhcmVmdWwgbmV4dCB0
aW1lLgo+CkZvciBzdXJlLCB3b250IGhhcHBlbiBhZ2FpbiwgdGhhbmtzIGZvciB0YWtpbmcgdGhl
IHRpbWUgb2YgbWFudWFsbHkgZml4aW5nIGl0LgoKTHVjYXMgWmFtcGllcmkKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
