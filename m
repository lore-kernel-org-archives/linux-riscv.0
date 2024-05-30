Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D156C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXETVT0Hp0P+eVNvV6T4o+Wah4X2hPlT0R9FC1pcuKg=; b=nQthhzcROHV33h
	rFrCnBDlvVZxBitIAMXZPXoGGyQGf9iPUMr+5BOAZypN3r30Z5tC/6ths2uMsP7iKg+fEqMG3xpT1
	yB1Sxpj7s2OJoniRp1h3Ww1bJ9ZcH5dVx32BsnXYyei+rkCGaL5uqmWGafqSC4o6ecrZConzIVJdx
	tuB2zFsqJZjZSdtCChko4spBkLTx1iNm6l1ao6cvqtKFBD7lnfQ0zFlewY/+2f8lMypNNwwm9/Ry8
	NlP4Jw3p4HEOgKAmJS9mVjrS+6MywnvcMc5Dyx4gqLY+qpnJXGKRl/eliVJHg6fGdkZ8B1ViQD9J6
	AFOpHVzil34AlhN/DAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCh90-00000007cC0-0aEV;
	Thu, 30 May 2024 14:52:42 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCh8w-00000007cB5-27Fr
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 14:52:39 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2e95abc7259so10382461fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1717080755; x=1717685555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xju9nW5aEF63Pcv0lMb3cbBthG2ZJ9khtPEmPPr3uI=;
        b=e6hDbUfVLqV94upDU9H+ElaQbcUJv+zt0/Rmw6Or9XaCdWEM4wUogCt0vBhvgWAKqn
         H8/8Ol0FeK8zWSTy5OtWIlc7jA7x90HjKemnSOIfhP2/PXgCGi9GPHq9Ha97Fc/pNoj1
         t/Op2eAkhUMIDj9P7TyJaG6j8UHNGmS+i8bP9EGyrdAq/bQkoXJXjHtaZl12V0yaECZl
         cxm9ZXs3N45Nxd3KDH05QD8s2+DYJfTwIceqS9y3J7Wuzw8ygAc4G/fx+zhK6wI+4Byg
         n/rqE+uBJgXN5e86gSKJomeiVO+2GWJlQuFCpvHEWc6xOgyiMqn234+uPTPB6nwSTPuy
         rfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717080755; x=1717685555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xju9nW5aEF63Pcv0lMb3cbBthG2ZJ9khtPEmPPr3uI=;
        b=oItqyB38hfzt/wJfPxk7TTAxQk7m8yn4gDL3cjoCA1iotaybeVnnfWvFeOd5nwZ0w2
         fMlKBhz0B2PD1WSboWIGXYFA2v5yrhX7kbDu07LxHykw6gd2HOK+4ltPApqyJUZyMfEH
         62kWW4wAuHW7fG76R6Q3k1ygFP/UljBN1pxk5obDl4GO59q7zyruZhVEVbf99yMo+uy1
         kdbMLv1bxrTf+aPH+6qMl8yj+5YbChqd0nOpHk+q+9HSwg/tDK4iU7TDiz9jACHb+xS0
         DAGfZJj2MXeHvEA5v/LVs73ztu6wrdF99DgQDs8AlZHCDO6r87rm2Zcw3XPuwyxPKIQb
         BUcg==
X-Forwarded-Encrypted: i=1; AJvYcCULe8Htun5b9WwddwD1wu6NR9wmvmhL18RGGiQr0iEPVEUNgWQQCjMnYt3kJzLVw6EbXGFJacMk5wS7aQcQFJa11qSkrAY9JwqMeW5gWP5a
X-Gm-Message-State: AOJu0YzexghGBIRlLaK7m1ziumI6K+pC7UvsgL7+XRUY8ALTnHcCFOSw
	jI0cCL+n5+iolLbEUgnvdkZHAjjS/ahpf2PcM4JycbO2kCTKUOs2/SE6XSQeZ6DeY0BXdCXfTL0
	sUuTNsJHnPLXVE+VD+7SykOpLLaH1TdvPdbPIQQ==
X-Google-Smtp-Source: AGHT+IHf8TmrUvKHY3tZVeP9T/NeHo/+xLt+IhXkdMwRroWcQhly/ewRsUPfk31Cc9BSWLvx0W2D6Ia7qNisp/t3DcU=
X-Received: by 2002:a05:651c:224:b0:2ea:8e94:a2f4 with SMTP id
 38308e7fff4ca-2ea8e94a54emr2778791fa.21.1717080755423; Thu, 30 May 2024
 07:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240529-dt-interrupt-map-fix-v2-0-ef86dc5bcd2a@kernel.org>
In-Reply-To: <20240529-dt-interrupt-map-fix-v2-0-ef86dc5bcd2a@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 30 May 2024 20:22:23 +0530
Message-ID: <CAK9=C2WvmXujHT-PpvhcHgg1Tck3k_K_BmLVp-=1Z71Y385Cbw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] of: Fix interrupt-map for fw_devlink
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_075238_572190_23F6D709 
X-CRM114-Status: GOOD (  14.37  )
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

T24gVGh1LCBNYXkgMzAsIDIwMjQgYXQgMToyOeKAr0FNIFJvYiBIZXJyaW5nIChBcm0pIDxyb2Jo
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIGR1cGxpY2F0ZWQgcGFyc2luZyBjb250aW51ZWQg
dG8gYm90aGVyIG1lLCBzbyBJJ3ZlIHJlZmFjdG9yZWQgdGhpbmdzCj4gdG8gYXZvaWQgdGhhdCBm
b3IgcGFyc2luZyB0aGUgaW50ZXJydXB0IHBhcmVudCBhbmQgYXJncyBpbiB0aGUKPiBpbnRlcnJ1
cHQtbWFwLgo+Cj4gSXQgcGFzc2VzIHRlc3Rpbmcgd2l0aCB1bml0dGVzdHMgb24gUUVNVSB2aXJ0
IHBsYXRmb3JtLCBidXQgSSBkb24ndAo+IHRoaW5rIHRoYXQgY2F0Y2hlcyB0aGUgcHJvYmxlbWF0
aWMgY2FzZXMuIFNvIHBsZWFzZSB0ZXN0Lgo+Cj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI0MDUyODE2NDEzMi4yNDUxNjg1LTEtbWF6QGtlcm5lbC5vcmcvCj4gIC0gUmVmYWN0
b3IgZXhpc3RpbmcgaW50ZXJydXB0LW1hcCBwYXJzaW5nIGNvZGUgYW5kIHVzZSBpdCBmb3IKPiAg
ICBmd19kZXZsaW5rCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBr
ZXJuZWwub3JnPgo+IC0tLQo+IE1hcmMgWnluZ2llciAoMSk6Cj4gICAgICAgb2Y6IHByb3BlcnR5
OiBGaXggZndfZGV2bGluayBoYW5kbGluZyBvZiBpbnRlcnJ1cHQtbWFwCj4KPiBSb2IgSGVycmlu
ZyAoQXJtKSAoMSk6Cj4gICAgICAgb2YvaXJxOiBGYWN0b3Igb3V0IHBhcnNpbmcgb2YgaW50ZXJy
dXB0LW1hcCBwYXJlbnQgcGhhbmRsZSthcmdzIGZyb20gb2ZfaXJxX3BhcnNlX3JhdygpCj4KPiAg
ZHJpdmVycy9vZi9pcnEuYyAgICAgICAgfCAxMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvb2Yvb2ZfcHJpdmF0ZS5oIHwgICAzICsr
Cj4gIGRyaXZlcnMvb2YvcHJvcGVydHkuYyAgIHwgIDMwICsrKystLS0tLS0tLQo+ICAzIGZpbGVz
IGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKyksIDcxIGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2Ut
Y29tbWl0OiAxNjEzZTYwNGRmMGNkMzU5Y2YyYTdmYmQ5YmU3YTBiY2ZhY2ZhYmQwCj4gY2hhbmdl
LWlkOiAyMDI0MDUyOS1kdC1pbnRlcnJ1cHQtbWFwLWZpeC1hMzdiOWFmZjVjYTAKPgo+IEJlc3Qg
cmVnYXJkcywKPiAtLQo+IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+Cj4KCldv
cmtzIHdlbGwgZm9yIFJJU0MtViwgVGhhbmtzIQoKVGVzdGVkLWJ5OiBBbnVwIFBhdGVsIDxhcGF0
ZWxAdmVudGFuYW1pY3JvLmNvbT4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
