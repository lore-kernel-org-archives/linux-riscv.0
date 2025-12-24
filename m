Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F8DE7545C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 15:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ifFLJmzr6x8vyVJ533+82+25nmTH7fC/JBGnTb8obc=; b=1QhQajU/6bEjPf
	PZXXec0XPawriVCXjouZCmNtyueDmrDSzym1i5ccYMNJEPnxBxlvYs/N6sgvK8DMxlgV5+RPkToIe
	xHyuQr/mvG+ZRFnDdLMqsauap1dVu40gpZIQyxcl+rV6JgZASGeowV8GIaYEFBSR9/mc/8bCcppAo
	yiKzsGKXCLqpIL6uN0H9JRUw1wd5jRH4Nw+rGi3I1DWTktNjPvGymuuwLzh1uPmhtoD1x9i9S5/l/
	SsT6znhOBK9Ie5Ke3tkVcW7nEfXt+iXwh6xid0iio/8X/rDIRvyS30rS4Vmn1e84gMWhlCDuZmUHx
	EsImrg4uv6n0YteVTHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYR4g-0000000H9FL-09GG;
	Wed, 24 Dec 2025 15:46:54 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYR4P-0000000H9De-17iE
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 15:46:47 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-64b8e5d1611so7312309a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Dec 2025 07:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766591195; x=1767195995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPMvizX4aiSFiPWN4zq9M2mNvcGpcgi2Bqmh2GmQ0o0=;
        b=Cha2R4z9J1bZlVvb47+r+4ljiItwa79TVELOBi3VHFp5kCdOhHZ0G91dfnuU7TkG+n
         OlRt1AtRNkJdljFp3jY6ni6cSJBfBmNL0wbqYH7krcY0CvolRepzHorOl7fNBhpPu9+S
         0DwErak6PDCBucuGPuZUuiH6+dc06fV6vhkY+s8O1sCm8sDLLrVeLOraNlqD3LkZYlAs
         nX8NtNe4coylw9nLu8mkOVYLhNgjlawqtLgCbO2l+/5pKD5kEXHjYMGqzZLQsqbWv50u
         az1q+zODH/DO0Dzq/r4gz/Q/3DubjtYUiM072OwowcU6Q0IZNdb6Mf/gS8ZXKHK+17Kb
         IQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766591195; x=1767195995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IPMvizX4aiSFiPWN4zq9M2mNvcGpcgi2Bqmh2GmQ0o0=;
        b=k+5j+DCm6oCAbkSx0lwqD6IO7E5o5hvndMnXHfKuQYwD+C1sr5IqpGPslehBETvQ+L
         Cbfbm4276HzIU/EGLJ1QM8zfiP6dCkwGrNtZwIKLNECDLSUCQ8b7u/YEUES526O2BYbp
         j6JQ/7mIQYPc4j2gojbDReYCjicmpp9D9ULBPzncrjxVl0WNQfEnf23y7bfUCpdfo9IF
         8HXs2TfHODLrdPdoBLmazmGIodLbf3XjZZpBtt5EV/Km9x25opr/9QUAI9xT5Yy0ybAo
         gJ36un/rJYXfNEE9M+4m5nYwBt0X1VFVxSpZPQTDbcnkvogu8z5BbjhprA89NJjQJ4HD
         ClkA==
X-Forwarded-Encrypted: i=1; AJvYcCWhfvObPItYLcy1A3oHrlHJ2NYQHIpmX098hySYPRt/zqsq4hgsyPzq0MuqikI8ZfwyS/CKWbuJX0d2HQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwevF2Z8CCIThE8sQ4M+1MPPm/ZdcICBDVUbbI9bmrxzOI6jmn8
	aQiR4NQC5jYAf24ggMDvjUa8/nY8sg4ZZZxNHjr0tkE53JPUcuiRxUWm6TNGh3n4YnuB
X-Gm-Gg: AY/fxX50nTqJxGzfg5rmeXovU5Y0aZQuuhL/aRuERQtTCyXbQMBtSqtyoW7/uVq4ONW
	/Xd1+1XBIGP7H+lzSu56BT7AiXZyIjmDX4JWSN7hffhwBr2VwUKd4MY/dhTg2EuzmSqb8+K2sDy
	6GgKe02tRno6yl4/xMkAJOocsqf3jkRmT2Bk0v/MmqSQwfbQtzexTNGY7KinLnGws4VowvHIfBI
	AIDpT0fNAhFbDy/7zuBEuDSj4DdonkpiYNg/zdo6Xo2BZYVCnqIFzt2FYw0BuXqvwhqMbKsoQ6E
	6LzG8c6/pMStv6+abo4Z86C8VzpPLImvkAPbjxBAQkctZg36tT6Vf93sY8giqgvVcj6pk6oWieM
	k0EAOhCaf7XTqEWrS2WURu+uj7N6xQmJJCt9YDcuX9dRjoFg1pcqhKwG35x1kLPbaVhJl0jLZTc
	Eensq2L4G0A3qGrLodnA==
X-Google-Smtp-Source: AGHT+IHwTgoJWLEso+A946j2blMKEWqz6uE5I08Gnk6feDE3r7jM3E2NW/e7qsJaXZv87W/jfEeMvg==
X-Received: by 2002:a5d:4e46:0:b0:430:fe22:5f1c with SMTP id ffacd0b85a97d-4324e703af5mr14626447f8f.59.1766584386173;
        Wed, 24 Dec 2025 05:53:06 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:53:05 -0800 (PST)
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
	linux@armlinux.org.uk,
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
Subject: [PATCH 3/5] dt-bindings: Add Bao I/O dispatcher driver binding
Date: Wed, 24 Dec 2025 13:52:15 +0000
Message-ID: <20251224135217.25350-4-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224135217.25350-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_074646_715863_8404A133 
X-CRM114-Status: GOOD (  12.95  )
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

RnJvbTogSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgoKVGhpcyBwYXRjaCBh
ZGRzIGEgRGV2aWNlIFRyZWUgYmluZGluZyBmb3IgdGhlIEJhbyBJL08gRGlzcGF0Y2hlciBrZXJu
ZWwKbW9kdWxlLCB3aGljaCBjYW4gYmUgbG9hZGVkIGludG8gYmFja2VuZCBWTXMuIFRoZSBJL08g
RGlzcGF0Y2hlcgpwcm92aWRlcyB0aGUgYnJpZGdlIGJldHdlZW4gdGhlIEJhbyBoeXBlcnZpc29y
IFJlbW90ZSBJL08gc3lzdGVtIGFuZCB0aGUKZnJvbnRlbmQgZGV2aWNlIG1vZGVsIGluIHVzZXJz
cGFjZSwgb2ZmZXJpbmcgYSB1bmlmaWVkIEFQSSB0byBzdXBwb3J0CnZhcmlvdXMgVmlydElPIGJh
Y2tlbmRzLgoKVGhlIGRpc3BhdGNoZXIgaGFuZGxlcyBoeXBlcmNhbGxzIHRvIHRoZSBCYW8gaHlw
ZXJ2aXNvciwgSVJRL2V2ZW50ZmQKZm9yd2FyZGluZywgYW5kIHByb3ZpZGVzIGEgY2hhcmFjdGVy
IGRldmljZSBpbnRlcmZhY2UgZm9yIGZyb250ZW5kCmRldmljZXMsIGVuYWJsaW5nIGVmZmljaWVu
dCBjb21tdW5pY2F0aW9uIGJldHdlZW4gdGhlIGh5cGVydmlzb3IgYW5kCnVzZXJzcGFjZSBkZXZp
Y2UgbW9kZWxzLgoKVGhlIGJpbmRpbmcgZG9jdW1lbnRzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGll
czoKICAtIGNvbXBhdGlibGU6ICJiYW8saW8tZGlzcGF0Y2hlciIKICAtIHJlZzogTWVtb3J5IHJl
Z2lvbnMgZm9yIHRoZSBkaXNwYXRjaGVyIChtdWx0aXBsZSBWaXJ0SU8gZGV2aWNlcykKICAtIGlu
dGVycnVwdHM6IEludGVycnVwdHMgdXNlZCBieSB0aGUgZGV2aWNlcwogIC0gaW50ZXJydXB0LXBh
cmVudDogUGFyZW50IGludGVycnVwdCBjb250cm9sbGVyCgpUaGlzIGVuYWJsZXMga2VybmVsIGRy
aXZlcnMgdG8gY29ycmVjdGx5IGluc3RhbnRpYXRlIGFuZCBjb25maWd1cmUgQmFvCkkvTyBEaXNw
YXRjaGVyIG1vZHVsZXMgYmFzZWQgb24gdGhlIERUIGRlc2NyaXB0aW9uLgoKU2lnbmVkLW9mZi1i
eTogSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgotLS0KIC4uLi9iaW5kaW5n
cy9iYW8vaW8tZGlzcGF0Y2hlci55YW1sICAgICAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Jhby9pby1kaXNwYXRjaGVyLnlhbWwK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2lvLWRp
c3BhdGNoZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8vaW8t
ZGlzcGF0Y2hlci55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4u
Nzc5NWY1NWQzZmY5Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Jhby9pby1kaXNwYXRjaGVyLnlhbWwKQEAgLTAsMCArMSw2NyBAQAorIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQorJVlBTUwg
MS4yCistLS0KKyRpZDogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Jhby9pby1kaXNw
YXRjaGVyLnlhbWwjIgorJHNjaGVtYTogImh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVt
YXMvY29yZS55YW1sIyIKKwordGl0bGU6IEJhbyBJL08gRGlzcGF0Y2hlciBEZXZpY2UKKworbWFp
bnRhaW5lcnM6CisgIC0gSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgorICAt
IEpvc8OpIE1hcnRpbnMgPGpvc2VAb3N5eC50ZWNoPgorICAtIERhdmlkIENlcmRlaXJhIDxkYXZp
ZG1jZXJkZWlyYUBvc3l4LnRlY2g+CisKK2Rlc2NyaXB0aW9uOiB8CisgIEkvTyBEaXNwYXRjaGVy
IGRldmljZSBmb3IgQmFvIGh5cGVydmlzb3IgZ3Vlc3RzLiBIYW5kbGVzIG11bHRpcGxlIFZpcnRJ
TworICBiYWNrZW5kIGRldmljZXMgYW5kIHRoZWlyIGludGVycnVwdHMuCisKK3Byb3BlcnRpZXM6
CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6ICJiYW8saW8tZGlzcGF0Y2hlciIKKyAgICBkZXNj
cmlwdGlvbjogRGV2aWNlIGNvbXBhdGlibGUgc3RyaW5nLgorCisgIHJlZzoKKyAgICBkZXNjcmlw
dGlvbjogfAorICAgICAgTWVtb3J5IHJlZ2lvbnMgZm9yIGVhY2ggVmlydElPIGJhY2tlbmQgZGV2
aWNlLgorICAgIG1heEl0ZW1zOiAyMAorICAgIHR5cGU6IGFycmF5CisgICAgaXRlbXM6CisgICAg
ICB0eXBlOiBpbnRlZ2VyCisKKyAgaW50ZXJydXB0czoKKyAgICBkZXNjcmlwdGlvbjogfAorICAg
ICAgSW50ZXJydXB0IG51bWJlcnMgZm9yIGVhY2ggVmlydElPIGJhY2tlbmQgZGV2aWNlLgorICAg
IHR5cGU6IGFycmF5CisgICAgaXRlbXM6CisgICAgICB0eXBlOiBpbnRlZ2VyCisgICAgbWluSXRl
bXM6IDMKKyAgICBtYXhJdGVtczogMworCisgIGludGVycnVwdC1wYXJlbnQ6CisgICAgZGVzY3Jp
cHRpb246IFBhcmVudCBpbnRlcnJ1cHQgY29udHJvbGxlciBub2RlCisgICAgdHlwZTogc3RyaW5n
CisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSByZWcKKyAgLSBpbnRlcnJ1cHRzCisg
IC0gaW50ZXJydXB0LXBhcmVudAorCithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworZXhh
bXBsZXM6CisgIC0gfAorICAgIGJhb19pb19kaXNwYXRjaGVyOiBiYW8taW8tZGlzcGF0Y2hlciB7
CisgICAgICAgIGNvbXBhdGlibGUgPSAiYmFvLGlvLWRpc3BhdGNoZXIiOworICAgICAgICByZWcg
PSA8MHgwIDB4NTAwMDAwMDAgMHgwIDB4MDEwMDAwMDAKKyAgICAgICAgICAgICAgIDB4MCAweDUx
MDAwMDAwIDB4MCAweDAxMDAwMDAwCisgICAgICAgICAgICAgICAweDAgMHg1MjAwMDAwMCAweDAg
MHgwMTAwMDAwMAorICAgICAgICAgICAgICAgMHgwIDB4NTMwMDAwMDAgMHgwIDB4MDEwMDAwMDAK
KyAgICAgICAgICAgICAgIDB4MCAweDU0MDAwMDAwIDB4MCAweDAxMDAwMDAwPjsKKyAgICAgICAg
aW50ZXJydXB0cyA9IDwweDAgMHgwOCAweDEKKyAgICAgICAgICAgICAgICAgICAgICAweDAgMHgw
OSAweDEKKyAgICAgICAgICAgICAgICAgICAgICAweDAgMHgwYSAweDEKKyAgICAgICAgICAgICAg
ICAgICAgICAweDAgMHgwYiAweDEKKyAgICAgICAgICAgICAgICAgICAgICAweDAgMHgwYyAweDE+
OworICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+OworICAgIH07Ci0tIAoyLjQzLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
