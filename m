Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1C2CFD65F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAf8iynXUxx/4BT4k2aP5l59IdBEa+iJK8VAAmWUwwg=; b=GQr7Qu+TqvgDhm
	s/uAXWpDcdQ9+WMEsxymH3+7GMiI44VWeMPX8mtQYt3earjYDZXYeiGysL7Vo4QMAQsj/lo2DrQAq
	e2m0rClCF47JganVaNhLi042zeLXzfMlx/Y5eOPw3vZJXYbRyeuNRhqet2RimD0aGbnwtrrdzxKcG
	Fl6QdhI8HxRPr1CJo3+2xU+hsahL8ANRCApXRtUenp8LiykSVY0OxcmahT/Hdt0AXyGhFeldy3Jae
	nGu5a4467amyeTJ+van3Vi8ac6XDZm/ML4uywBZExBeYbpA/bbuBw2XviXJmkOe5osplugxm8LrSP
	z2oSS1ZQJhoj8XCDvC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPl-0000000FHqp-0nIm;
	Wed, 07 Jan 2026 16:29:42 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWPi-0000000FHoR-1vZc
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 16:29:40 +0000
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-42fbc305882so1182223f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jan 2026 08:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803377; x=1768408177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NUMimnmdXF+2lmQCSaKYy80Xx8SLq3LRSYV8Quqc2EA=;
        b=nKts4xyrAqjCvWGVBS+egymxoDmKq+tgRzbDZc4fLYuXv25XruUhPaN2PHuRAN+Feq
         zRw/M9gQnYTe2b8ChmRu1gmruZmSRpwnwBNzzBQF0MxKSNXFuvu046y+LIHZvHue4L8F
         TSY1b25mjf0nNRZWGJxvB9GeNEBIiXOr8y2x+lQq3ZDQI/Y9dCM2Um3b4amTlWwBlBvO
         csww/hZowc+xlfGpGDbvayIhBDjei+zVCd84zfq/7Pwx3Co5epx/mArLPOCNPnXFkEgC
         aFoEdNTEHXKUY7ggM2smw2ecpmFJspH9mVzYgcpPIn3yEUofbiPz+Z4ERoRTl7hyMyQJ
         ruUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803377; x=1768408177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NUMimnmdXF+2lmQCSaKYy80Xx8SLq3LRSYV8Quqc2EA=;
        b=tnnMmzAC/EJ3o3I3ZheR4GoE/1H8c5U/7l8D4YaW3Q/DWJadRuaAqKYRlZhGwaOx41
         gfCOrN1lrNLZnnmMLmLqF035AgZdjSiOpjFPpZKt/mRZ/y0dcIdGIJhNJFzg1qBdr05f
         5bVoeggYOyt+xyNJjSGI3ZW8a0wEcb54ZKRhfG4iVwZRtOUYg9pTA8QAZ1XR0oedUenu
         UjqsxHuTM5q9AIbSJa+z7oPzGhSGc7yu/d/YyB36LGfpUke+dCZx5I7b6HTk7Tx/TjdP
         feWuwVwOgnaD6QP+jfMtJ+Ld+dSSml91xbVqq5NH/iiohlQG4CJoTAD9HoEtybIgchWU
         eV6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNInpiw764M7O6+HfNE6pgxW6GS8cJZd0VTdmME0qbnt/+JTHi3kbcjnYvlLVeLz+P/s+4dltmmGWhhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YybXiAygWmyAQxC8zpG4Gu9hkGoW+sOymgyOMv3Ah6pcrOmjkjB
	Ky+SINy+KkIWZpxqJiFawgtAqHrPyBAzV5JRUpt+T2VnV8Noa8dWbCcScL0rn9XGVPKQ
X-Gm-Gg: AY/fxX7xMs9uEWMBSF9bHwcUtIBhKApfyuibnBAz7Or90gd4tyJurIHvxQ+vprBEO8Q
	jaxhMRz6jWXzwdgV4hhTh1QS60J0YBNPMV4vfMD9TAEAS0xdntA9b2JYrmLhPUswQjrSGpkiiY5
	AdYyOn7SQHpMKlynjuIjnpenE/xsI3Pwt9jac2tf50z67mxfnFuRc33gKnAF8+ABshjTk5BXgqY
	gW04/vxJpBPxZc3P78xxcSHeUwXF8IrMyhRzhn7ehGNa5QwKHH4Ra0uZHd2tuEv18mRP+Wo46TB
	WYLXC+SDfS+t9H3XycyCEShSKNNdcLsO9cGmbHXiMQJrCpqd/+Naw9LfyXhpBd9IhshakpiHBo4
	YgW0GMUxxpk5lyoQhiwdbJY/XU7UgLd66bxEx2aLF2ByxoLRdujz/0HYEFj6lcNEw8oO0yWFx0e
	dITk3mkjd1Qt9gzxWGfw==
X-Google-Smtp-Source: AGHT+IHbte2Z9gfsJb68imADTi55zsYUmZZE1DMqWC4ozVwMek+FiE+B/1QJjWhTUxGd71ZKE6jVRA==
X-Received: by 2002:a05:6000:310b:b0:432:5bac:3914 with SMTP id ffacd0b85a97d-432c374f46cmr3857592f8f.40.1767803376686;
        Wed, 07 Jan 2026 08:29:36 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:36 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 3/6] dt-bindings: Add Bao I/O dispatcher driver binding
Date: Wed,  7 Jan 2026 16:28:26 +0000
Message-ID: <20260107162829.416885-4-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_082938_738592_8DEDFC18 
X-CRM114-Status: GOOD (  14.86  )
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

RnJvbTogSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgoKVGhpcyBwYXRjaCBp
bnRyb2R1Y2VzIGEgZGV2aWNlIHRyZWUgYmluZGluZyBmb3IgdGhlIEJhbyBJL08gRGlzcGF0Y2hl
ciwKYSBkZXZpY2UgdXNlZCBpbiBiYWNrZW5kIFZNcyBydW5uaW5nIHZpcnR1YWxpemVkIGRldmlj
ZXMgKGUuZy4sIFZpcnRJTykuCgpTaWduZWQtb2ZmLWJ5OiBKb8OjbyBQZWl4b3RvIDxqb2FvcGVp
eG90b0Bvc3l4LnRlY2g+Ci0tLQogLi4uL2JpbmRpbmdzL2Jhby9iYW8saW8tZGlzcGF0Y2hlci55
YW1sICAgICAgIHwgNzUgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDc1IGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYmFvL2Jhbyxpby1kaXNwYXRjaGVyLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2Jhbyxpby1kaXNwYXRjaGVyLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2Jhbyxpby1kaXNwYXRjaGVyLnlh
bWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi44Y2E0NTBlNGI5ZDUK
LS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFv
L2Jhbyxpby1kaXNwYXRjaGVyLnlhbWwKQEAgLTAsMCArMSw3NSBAQAorIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQorJVlBTUwgMS4yCistLS0K
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvYmFvL2Jhbyxpby1kaXNwYXRjaGVy
LnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUu
eWFtbCMKKwordGl0bGU6IEJhbyBJL08gRGlzcGF0Y2hlciBEZXZpY2UKKworbWFpbnRhaW5lcnM6
CisgIC0gSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgorICAtIEpvc8OpIE1h
cnRpbnMgPGpvc2VAb3N5eC50ZWNoPgorICAtIERhdmlkIENlcmRlaXJhIDxkYXZpZG1jZXJkZWly
YUBvc3l4LnRlY2g+CisKK2Rlc2NyaXB0aW9uOiB8CisgIEkvTyBEaXNwYXRjaGVyIGRldmljZSBm
b3IgQmFvIGh5cGVydmlzb3IgZ3Vlc3RzIHRoYXQgcnVuIHZpcnR1YWxpemVkCisgIGRldmljZXMg
KGUuZy4sIFZpcnRJTykuCisKKyAgVGhpcyBkZXZpY2UgaXMgb25seSByZXF1aXJlZCBpbiBiYWNr
ZW5kIFZNcywgd2hpY2ggYXJlIHJlc3BvbnNpYmxlIGZvcgorICBwZXJmb3JtaW5nIHRoZSBhY3R1
YWwgSS9PIG9wZXJhdGlvbnMgb24gcGh5c2ljYWwgaGFyZHdhcmUuIEZyb250ZW5kCisgIFZNcywg
d2hpY2ggb25seSBjb25zdW1lIEkvTyBzZXJ2aWNlcywgZG8gbm90IHJlcXVpcmUgdGhpcyBkZXZp
Y2UuCisKKyAgVGhlIEkvTyBEaXNwYXRjaGVyIHByb3ZpZGVzIGFjY2VzcyB0byBvbmUgb3IgbW9y
ZSBiYWNrZW5kIGRldmljZXMuCisgIEVhY2ggYmFja2VuZCBkZXZpY2UgaXMgYXNzb2NpYXRlZCB3
aXRoIGEgY29udGlndW91cyBzaGFyZWQtbWVtb3J5CisgIHJlZ2lvbiB1c2VkIHRvIGV4Y2hhbmdl
IEkvTyBidWZmZXJzIHdpdGggdGhlIHJlc3BlY3RpdmUgZnJvbnRlbmQKKyAgZHJpdmVyLCBhbmQg
YW4gaW50ZXJydXB0IHVzZWQgYnkgdGhlIEJhbyBoeXBlcnZpc29yIHRvIG5vdGlmeSB0aGUKKyAg
YmFja2VuZCBWTSBvZiBwZW5kaW5nIEkvTyByZXF1ZXN0cy4KKworcHJvcGVydGllczoKKyAgY29t
cGF0aWJsZToKKyAgICBjb25zdDogYmFvLGlvLWRpc3BhdGNoZXIKKworICByZWc6CisgICAgZGVz
Y3JpcHRpb246IHwKKyAgICAgIENvbnRpZ3VvdXMgbWVtb3J5LW1hcHBlZCByZWdpb25zIGZvciBl
YWNoIFZpcnRJTyBiYWNrZW5kIGRldmljZQorICAgICAgbWFuYWdlZCBieSB0aGUgSS9PIERpc3Bh
dGNoZXIuCisKKyAgICAgIEVhY2ggcmVnaW9uIGlzIHVzZWQgdG8gZXhjaGFuZ2UgSS9PIGJ1ZmZl
cnMgYmV0d2VlbiB0aGUgYmFja2VuZAorICAgICAgYW5kIGZyb250ZW5kIGRldmljZXMuIEEgc2lu
Z2xlIHJlZ2lvbiBjb3JyZXNwb25kcyB0byBvbmUKKyAgICAgIGJhY2tlbmQgZGV2aWNlLgorICAg
IG1pbkl0ZW1zOiAxCisgICAgbWF4SXRlbXM6IDY0CisKKyAgaW50ZXJydXB0czoKKyAgICBkZXNj
cmlwdGlvbjogfAorICAgICAgSW50ZXJydXB0cyBhc3NvY2lhdGVkIHdpdGggdGhlIFZpcnRJTyBi
YWNrZW5kIGRldmljZXMuCisKKyAgICAgIEVhY2ggaW50ZXJydXB0IGNvcnJlc3BvbmRzIHRvIGEg
YmFja2VuZCBkZXZpY2UgYW5kIGlzIHVzZWQKKyAgICAgIGJ5IHRoZSBCYW8gaHlwZXJ2aXNvciB0
byBub3RpZnkgdGhlIGJhY2tlbmQgVk0gb2YgcGVuZGluZworICAgICAgSS9PIHJlcXVlc3RzIGZy
b20gdGhlIGFzc29jaWF0ZWQgZnJvbnRlbmQgZHJpdmVyLgorICAgIG1pbkl0ZW1zOiAxCisgICAg
bWF4SXRlbXM6IDY0CisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBp
bnRlcnJ1cHRzCisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAg
LSB8CisgICAgYmFvLWlvLWRpc3BhdGNoZXJANTAwMDAwMDAgeworICAgICAgICBjb21wYXRpYmxl
ID0gImJhbyxpby1kaXNwYXRjaGVyIjsKKyAgICAgICAgcmVnID0gPDB4MCAweDUwMDAwMDAwIDB4
MCAweDAxMDAwMDAwCisgICAgICAgICAgICAgICAweDAgMHg1MTAwMDAwMCAweDAgMHgwMTAwMDAw
MAorICAgICAgICAgICAgICAgMHgwIDB4NTIwMDAwMDAgMHgwIDB4MDEwMDAwMDAKKyAgICAgICAg
ICAgICAgIDB4MCAweDUzMDAwMDAwIDB4MCAweDAxMDAwMDAwCisgICAgICAgICAgICAgICAweDAg
MHg1NDAwMDAwMCAweDAgMHgwMTAwMDAwMD47CisgICAgICAgIGludGVycnVwdHMgPSA8MHgwIDB4
MDggMHgxCisgICAgICAgICAgICAgICAgICAgICAgMHgwIDB4MDkgMHgxCisgICAgICAgICAgICAg
ICAgICAgICAgMHgwIDB4MGEgMHgxCisgICAgICAgICAgICAgICAgICAgICAgMHgwIDB4MGIgMHgx
CisgICAgICAgICAgICAgICAgICAgICAgMHgwIDB4MGMgMHgxPjsKKyAgICAgICAgaW50ZXJydXB0
LXBhcmVudCA9IDwmZ2ljPjsKKyAgICB9OwotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
