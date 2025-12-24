Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4B2E75458
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0NfKVmlvMwmKnFn6OyXXyS1PqR9DFcuLINwcQ82oOg=; b=lZDeEFzYQmvQng
	y/YiGMP11HjPuouDAkUF1lvBrII8E4GwtXv+c+UBE7GV48INRFakyQP4fmBat7g5wMr7na+s4YeUm
	qZWD5LFID+vtRTtvmPKsPXZkrVBZsl6bTbB9DkapX3mrpEA2pDjhd1zx2gdOZPv6CKn7H5An+mX8U
	JEcyYT8eD8/ULIBLsvyOTc8HNFlWK9Z+F7bjz5DzfWWGfsifRk9efD2Zloz8IzUk1gcJJjejSMOHF
	nJ1zbMUP2QmLgeXUZT0xTmVHhfWvuPSPsN/t3E3kuQy8lK4Jzkkng54jfFlpyeWpwG1h1aB8xfZi/
	R1L1lRB9Q6OvZOPdp9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPIl-0000000Gvd1-3CtI;
	Wed, 24 Dec 2025 13:53:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYPIg-0000000Gva6-2pMR
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 13:53:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42fbc544b09so4517389f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Dec 2025 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766584393; x=1767189193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6BJX3RO6Fa9KANLRZsl2DTswgSgqWJfE5bB/nVGOxI=;
        b=R/gRJzqxDkYtq8Kmt93ubHWxyY5yrxPS6S3r6Waa+LcFJpDdWTR04cLyQ/TxMxeE8H
         K6YstXTx2nlDGvEARj3p/2KNY7dSNxPr3c4ZV1kJel2uksV+C7aEZqh2O9z2k8X1gGzj
         lguPLT8AiG54M3v/vmzXMpwrN3j/zlsxb/AnpW/MtL1fx3N973h0fbKGvmYfmqC2M6eg
         IjAPhbSNNsZpgVSHeuzn7HNayHkDtipUjoZadpxZCHaTrTaqFPPGJ8T+tGsTD/ZNik8c
         5zoCvbs+FdNJqAeNwgCV4vKdXRo8CuDSwaDG48YZwKrK3ro/d0loqiBOHH7Cq6J6VFyh
         kmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766584393; x=1767189193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6BJX3RO6Fa9KANLRZsl2DTswgSgqWJfE5bB/nVGOxI=;
        b=MIdyCMzUhg4WJuDUP3JO9Ffp4KT1DmN6+QisJQ1zw/FnvGIpjRcVS2qul9RC3/pylW
         F0OfL3fiI+uIGUzt0IeucqCIv2aE7Ykpn6y8OOP3IeqasV1QDZNrGEmdtbVIKJ8A5GjL
         AZ/2kLT8HAbdxTkZzB6dttTbIvCnnNkbhJLYQYBFfPyB8qkEsQNC7L/PotZKG/GZnpOU
         KV/iIOd0JfNU6svq/tI+CIqeNoItxKTEYw2nQrSH4AlWx32PMcQjSCq43XKIOy39nne8
         av/a4cq23Y7jHlfjjImdJwm4noq5Oy232BSzdfTvaaUL9yAY3SDeDW57iVOZprkgAx0t
         jqEA==
X-Forwarded-Encrypted: i=1; AJvYcCVTeCUGnmJ9TRJahkk4rp98SdPBMXQFso6UbMmTscuZiRzcN/W9/Nna1p1YPWTMJle9kkpmaAXFYq+6Cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK/VGGvejADkA9ixLY7rHsk6Y1JOQNhIWjVq1LuPRMskWDeb4j
	/KuQvkAJ8wD6Y21JDOgACLWxmNlRyFzvUWLcxJhw4W0bdcZp8V8uVMboWDFh8662jttW
X-Gm-Gg: AY/fxX5c0z6A1yjKd2ssX3wR5UCdvr7UgUP4m0jvbqfNMhkRa2EynfsgEsN8Rn2Htix
	n55GhLueBXm4PvmdX5o6jG43ZXvBDpp5gzeS1oI7VDuqLOdhhZ2dCMENYRstsAnpRXld6//ZOCg
	Qys1gdb4HW3Q5Iz8hLGutgd9aUDLZcTH9FVYbw+xjLvF5RLKAa7HDJfk6tJc1rm1bZxlXxJ/FjO
	BO/NcBjpEYv0PSpflLLNsJ+1FAqZsQR0I9l+/HPlR9XHXB7hxixUgl49zxLea3bfC57jPZxaZcj
	3ya0H7z57gJvCpxSxCdBP/bv9/EJxRTMp51tvTRuvOyU7cvBo/2Zxtf2/MYV8HaJ+WvF9CXpmIn
	l+Fxu1uL5olBbFKm2PhP+CSASOdWccFcxOLqo7YG/k0VTuToVz1OZIGSmqtoSjkP+tIjlejIsa2
	sd2jRCQkQz8uWekpEr5zguonsPgUy+
X-Google-Smtp-Source: AGHT+IGoEJirx8QYl35KZRbnOCp6E4ECh/eV01i5gqpOP16EPi53DTG8J8VmfYXqp0RVfgjQ4vBKMw==
X-Received: by 2002:a05:6000:2285:b0:431:1d4:3a82 with SMTP id ffacd0b85a97d-4324e4c6405mr20996373f8f.11.1766584392195;
        Wed, 24 Dec 2025 05:53:12 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:53:11 -0800 (PST)
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
Subject: [PATCH 5/5] MAINTAINERS: Add entries for Bao hypervisor drivers, headers, and DT bindings
Date: Wed, 24 Dec 2025 13:52:17 +0000
Message-ID: <20251224135217.25350-6-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224135217.25350-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_055314_756073_4F58D5F1 
X-CRM114-Status: UNSURE (   9.26  )
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

RnJvbTogSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgoKQWRkIE1BSU5UQUlO
RVJTIGVudHJpZXMgZm9yIHRoZSBCYW8gaHlwZXJ2aXNvciBjb21wb25lbnRzIGluY2x1ZGluZzoK
LSBCYW8gSVBDIHNoYXJlZCBtZW1vcnkgZHJpdmVyIGFuZCBpdHMgZGV2aWNlIHRyZWUgYmluZGlu
Z3MKLSBCYW8gSS9PIGRpc3BhdGNoZXIgZHJpdmVyIGFuZCBpdHMgZGV2aWNlIHRyZWUgYmluZGlu
Z3MKLSBLZXJuZWwgaGVhZGVycyBmb3IgQmFvIChBUk0sIEFSTTY0LCBhbmQgUklTQy1WKQotIFVB
UEkgaGVhZGVyCgpUaGlzIGVuc3VyZXMgdGhhdCB0aGUga2VybmVsIHJldmlldyBhbmQgbm90aWZp
Y2F0aW9uIHN5c3RlbSBjb3JyZWN0bHkKaWRlbnRpZmllcyB0aGUgbWFpbnRhaW5lcnMgZm9yIGFs
bCBCYW8gaHlwZXJ2aXNvciBjb21wb25lbnRzIGluIHRoZQprZXJuZWwgdHJlZS4KClNpZ25lZC1v
ZmYtYnk6IEpvw6NvIFBlaXhvdG8gPGpvYW9wZWl4b3RvQG9zeXgudGVjaD4KLS0tCiBNQUlOVEFJ
TkVSUyB8IDEyICsrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGRjNzMxZDM3Yzhm
ZS4uZTUwYWQ2YTFiYzRhIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVS
UwpAQCAtNDMyMSw2ICs0MzIxLDE4IEBAIEY6CWRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0LwogRjoJ
aW5jbHVkZS9saW51eC9iYWNrbGlnaHQuaAogRjoJaW5jbHVkZS9saW51eC9wd21fYmFja2xpZ2h0
LmgKIAorQkFPIEhZUEVSVklTT1IKK006CUpvc8OpIE1hcnRpbnMgPGpvc2VAb3N5eC50ZWNoPgor
TToJRGF2aWQgQ2VyZGVpcmEgPGRhdmlkbWNlcmRlaXJhQG9zeXgudGVjaD4KK006CUpvw6NvIFBl
aXhvdG8gPGpvYW9wZWl4b3RvQG9zeXgudGVjaD4KK1M6CU1haW50YWluZWQKK0Y6CURvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8vCitGOglhcmNoL2FybS9pbmNsdWRlL2FzbS9i
YW8uaAorRjoJYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9iYW8uaAorRjoJYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9iYW8uaAorRjoJZHJpdmVycy92aXJ0L2JhbworRjoJaW5jbHVkZS91YXBpL2xpbnV4
L2Jhby5oCisKIEJBUkNPIFA1MCBHUElPIERSSVZFUgogTToJU2FudG9zaCBLdW1hciBZYWRhdiA8
c2FudG9zaGt1bWFyLnlhZGF2QGJhcmNvLmNvbT4KIE06CVBldGVyIEtvcnNnYWFyZCA8cGV0ZXIu
a29yc2dhYXJkQGJhcmNvLmNvbT4KLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
