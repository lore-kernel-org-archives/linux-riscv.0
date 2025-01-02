Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE465E77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 15:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43NDARuqsP3S76QX2DNvf98MGo7+E26us83MZ5sIZ6U=; b=c2T6CuxXNcuzRx
	Bn4NCV1YJayebIsOed8+LZ671ZVK7n5KJVVGv2CFYYNIKTQnSby4eT1A+zPpQRMOsy8NaMh5N3IsM
	jAqIsZPcW/5qLRR4ESk6qMM9JIUfu+PB4Lb4Re3b7nj1IYEym4SRiryp4QBa7NajrsAFFwbZu3yBA
	1GRlVLpKrXF+SOwcBFQX/Op/HkJhGXInv7+UK8LtfrLx3tDrzlrfj/Diuv3pIpnBBM/9ZQin/Ki1V
	SjLJwAYleig0kn+z4xEWiv85n6u0mU1YelSaMtPuGCSHB6mzmFK7TJ53/gK/ErX+fEQ0Yib8nnXH5
	EWmEJcUG1uKtKfXTqrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTN0M-0000000Agk8-2WTl;
	Thu, 02 Jan 2025 15:20:58 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTN0K-0000000AgjS-19JS
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 15:20:57 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3a9c9f2a569so89192795ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jan 2025 07:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1735831255; x=1736436055; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6labcviCncU/1QQKksodi/dK6dgR3UTM/zsZXc96o8=;
        b=n2S2Rpzh7d+WbqdYOLy76jB18kwLq/eHMf0OUNbyOdoYyNbO3U7HXrH1CxBVnp6AxN
         /4VMeeeK8TvuV16yIZHFHMbp5FLbh0a0M0FKm1C2RYlT/osMmhQSfkfjFx/srNleG/N1
         sqIJVScSw7eTGNXISVeeYqelfbwziY3mdsB2RAkgT75H0PwrtV6vJ6MKOgfAAO0H/jVe
         5P297/m0r7ePVzaazeKVET+mW80CngRtYXBuYo/6c68iYnlaJ0spNtIQdtOFD0uzVNRA
         KEGGSnxOxlFffZ3eGVP3DnGVFA722i6sR0RQwJy1TnMexuEYxe8tQruxUuXodfxci9bQ
         eEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735831255; x=1736436055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6labcviCncU/1QQKksodi/dK6dgR3UTM/zsZXc96o8=;
        b=cDZ5afKhiiFERq93/k3hETqPbSsVbnj4IztGV84D7ltFpxJAuvShME8Zq7omVrhSk4
         ogf4tmXzaI1GTxFIQq5saHjmIP4pIDaqtG5ZX28f8UVdcyQ9bdoO4QFeZMqbrn2QHVxu
         IM8HTNSdA3ccpGVRWnGfM4qS/DCsRJRrDL8o6/GBpmPaPzHGCNoRYPOMx7SGccy4D7/J
         Xy90CyQobx3cI9OF1S33RgsQIWL47QSTf6SFVsYmDND0u/MBFWkwC6M3odhUG0+enmmL
         7FIkMA+4fpHZ+2AwBBZ/r0iDgwa3qUphxNU1l0ENisc8jrDuJ/Yu6du/Rip9zCMAiZIj
         TMuA==
X-Forwarded-Encrypted: i=1; AJvYcCWMt47XSuLAwlO1oJOQN0OqTVJg7qM88j7ohJHe1X/WLeeNx6QBAPuDfs55fyYW+/ylyuCT2Q1cVlyZKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFl/UU5SqX8Kl0aqlXevCpF5vpkPAU9u5fK9DAEngq5Q6s2TQO
	fdGlFBMk0hQrelPONWZhe8f01RIpYWiYlQZZO1gv04RZCbErQ3UZivn86RqNJvkOC5z9y9KFFe4
	v1CIUntASz555bf1k4r6m9tdM3DTCHbCTgi0Frw==
X-Gm-Gg: ASbGncs0k26Fjru8dQQHmYPfiFNtGGZCpy/Lx7QEANkvSsiyG3i2Uisvf8Vyxs/u1CJ
	haBK818VofqGfL3E7+Htzlo1TpETR3XCK+YklbJCN
X-Google-Smtp-Source: AGHT+IEcYsgXwIUJrnSCJN/YDDR3+b8Y+DWCWO3Kbtgsiyq0E+YAMl9z6rm48v3Xhg6+NvZGkyjtnouYucKBr+iEhcs=
X-Received: by 2002:a05:6e02:3891:b0:3a7:dfe4:bd33 with SMTP id
 e9e14a558f8ab-3c2d2561dacmr455146425ab.6.1735831254948; Thu, 02 Jan 2025
 07:20:54 -0800 (PST)
MIME-Version: 1.0
References: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com> <20250102094116.3847894-2-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250102094116.3847894-2-vladimir.kondratiev@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Jan 2025 20:50:44 +0530
X-Gm-Features: AbW1kvZ1ba1qhK8RwYxXFCRR190ycLexX75cAXgHpmR6DpHUtAxyjimo5pfpfqY
Message-ID: <CAAhSdy3B_4cJ_savVPKugPWiowGfg9pUpF_TthK=gPLbaD34Rw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: add risc-v,aplic
 hart indexes
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_072056_317710_F5F1AD05 
X-CRM114-Status: GOOD (  13.42  )
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

T24gVGh1LCBKYW4gMiwgMjAyNSBhdCAzOjEx4oCvUE0gVmxhZGltaXIgS29uZHJhdGlldgo8dmxh
ZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5jb20+IHdyb3RlOgo+Cj4gRG9jdW1lbnQgb3B0aW9u
YWwgcHJvcGVydHkgInJpc2N2LGhhcnQtaW5kZXgiCj4KPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1p
ciBLb25kcmF0aWV2IDx2bGFkaW1pci5rb25kcmF0aWV2QG1vYmlsZXllLmNvbT4KPiAtLS0KPiAg
Li4uL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LGFwbGljLnlhbWwgICAgICAg
IHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL3Jpc2N2LGFwbGljLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3YsYXBsaWMueWFtbAo+IGluZGV4IDE5MGE2NDk5
YzkzMi4uZTE2M2M4ZGUzNTI0IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNjdixhcGxpYy55YW1sCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jp
c2N2LGFwbGljLnlhbWwKPiBAQCAtOTEsNiArOTEsMTQgQEAgcHJvcGVydGllczoKPiAgICAgICAg
RmlybXdhcmUgbXVzdCBjb25maWd1cmUgaW50ZXJydXB0IGRlbGVnYXRpb24gcmVnaXN0ZXJzIGJh
c2VkIG9uCj4gICAgICAgIGludGVycnVwdCBkZWxlZ2F0aW9uIGxpc3QuCj4KPiArICByaXNjdixo
YXJ0LWluZGV4OgoKSSBzdWdnZXN0IG5hbWluZyB0aGlzIHByb3BlcnR5ICJyaXNjdixoYXJ0LWlu
ZGV4ZXMiIChwdXJhbCkKCj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy91aW50MzItYXJyYXkKPiArICAgIG1pbkl0ZW1zOiAxCj4gKyAgICBtYXhJdGVtczogMTYz
ODQKPiArICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICBBIGxpc3Qgb2YgaGFydCBpbmRleGVzIHRo
YXQgQVBMSUMgc2hvdWxkIHVzZSB0byBhZGRyZXNzIGVhY2ggaGFydAo+ICsgICAgICB0aGF0IGlz
IG1lbnRpb25lZCBpbiB0aGUgImludGVycnVwdHMtZXh0ZW5kZWQiCj4gKwo+ICBkZXBlbmRlbmNp
ZXM6Cj4gICAgcmlzY3YsZGVsZWdhdGlvbjogWyAicmlzY3YsY2hpbGRyZW4iIF0KPgo+IC0tCj4g
Mi40My4wCj4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
