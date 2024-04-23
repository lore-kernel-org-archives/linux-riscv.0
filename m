Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC3FC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 12:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8knsXM53V8Dif6Hy5TTpfWLzfXeHzpRQZwEV1kRbRt4=; b=HzsoDuRCZkGCNa
	ZT67vjFgm7OLHK+ukoVx+pAmMVjqcz4AQnwaoWYrsue4N8cck7zeR+n1NEdnaw6UvciR2zQyEjUu1
	f47yr7vxK95nBz/CVlM/kjXc1MWsoEzuQNnVgHLYBd+kBxu3DnrL+M44I+Gp1qHlMBCal+vgcspMD
	bjrGipPQrpKNdrr5pivE5tq3frI2qOpZXGwlnMqTt4SfbCoVNK8eA9Up8MZyaIrDVaQvo6GemN3sV
	KixqaJ7vS5D86bj2TO7xfpRxXh5cBEfjdDRIIJLizhnLrSGgnBfceY8c6HnTK8zRCPA/aP0BLdGYr
	ZkeqVbX2vU0CW2X1MiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFVn-0000000HT6x-0fBY;
	Tue, 23 Apr 2024 12:44:39 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFV0-0000000HSQm-1xa3
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 12:43:56 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-349a33a9667so872001f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 05:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876228; x=1714481028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HO1pUvU0QFRoXzPxVhmpQLKjzbVC9RycGYDtZgzkuNE=;
        b=ryvBA6uVEJEjR1QnnkFB0d6vS9iMlu1Num80y7/y3wiopQkHgi9RAm7poU27xiTDJ5
         SBJZiSS5/j98onwQ5RDfygpOnQ/w2uFm0xYLBBm6tvvMjpv7iV8QDT7HcX9AGX5ZYNFF
         zfKp3S/3ZE/aW1lOLytzr3N2X+8BSc7ys3cg7kVTRoem4PkFYARKEU1gxEC8QuDgEDYr
         RTTgPlNqJBBQIegf21ld42LT9A5sNz39JXEybh2AkI9qGi0bnpMLXDUYt6FKBJYliVJe
         hq3PKwd9iyWAWZdOwoApKnGcdw/ua48OE+I1LMoWtx+iFqPXAfmlJt1EpYzqPYY11UFO
         zuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876228; x=1714481028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HO1pUvU0QFRoXzPxVhmpQLKjzbVC9RycGYDtZgzkuNE=;
        b=ta1RDn/hHltX+1CICAke8MVHpdWWSyRQlHRDmvn5GG6K7SM1VmOp23oQ1lx2esImTt
         oJcvBLpq6wozLdTl9gEpDbghNJ/Cqq47GYcHtU0z2SXf4Km2jp+9/MNtUM38526K1sXK
         9K1kBobK+SlDMP2SU5ybehYNqeHRJz6l3HkILRqhXaW6hi0EJ31+EGRV/yfDNBJKBxAD
         PXDs927jWxZnPA5EPlVSCeQwftRcS7cPG3c+DMkCZGWLwJPcxDYZDp2RUcFs6Me6H4hM
         OEn718T/wDGFUdP58v7rTXjmwrNfwSOkx0iFJHoJ3caahhqph//xJ9bRF/L5YfGCT50K
         2OMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF4RePqCkkiYtzPJNqg3jEP+GHW48Mq+YQthmZGYxrLeDACuj3m2Ox27puxf3qF/G/2j7TLpBJi4bwJBpLqJTP8AwM9fVEqPssyuCmk1TE
X-Gm-Message-State: AOJu0Yz/pIDqCRnHOJKxxD4gEThJDDf+U2PEwODjBHIgnh1C3WMGffOo
	dguL+8EQi1gLoDOZ3CpIMDYGA2U4T4hjUBvmlgBYwgOgnrLveIxvlTVV8D9tHoo=
X-Google-Smtp-Source: AGHT+IFRgUnk0vEtF+hGJCYsgJqApSFxTJfbdXsIxf1B/11WOBNdkte1X7YViXtLgl4+JyLNVfZS7w==
X-Received: by 2002:a05:600c:468f:b0:418:9941:ca28 with SMTP id p15-20020a05600c468f00b004189941ca28mr9046696wmo.2.1713876227919;
        Tue, 23 Apr 2024 05:43:47 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:47 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v3 06/11] KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
Date: Tue, 23 Apr 2024 14:43:20 +0200
Message-ID: <20240423124326.2532796-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_054350_632460_A4111047 
X-CRM114-Status: UNSURE (   8.86  )
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBleHRlbnNpb25zIGZv
ciBHdWVzdC9WTSBzbwphZGQgdGhlc2UgZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxpc3QgdGVzdC4K
ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CkFja2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCmluZGV4IDQwMTA3YmI2MTk3NS4uNjFjYWQ0NTE0MTk3
IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1s
aXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlz
dC5jCkBAIC01NSw2ICs1NSwxMCBAQCBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQogCWNhc2Ug
S1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJ
U0NWX0lTQV9FWFRfWkJLQzoKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdf
UklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pCS1g6CiAJY2FzZSBLVk1fUkVH
X1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNB
X0VYVF9aQlM6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lT
QV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0E6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lT
QV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0I6
CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUg
fCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Q6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBL
Vk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Y6CiAJY2FzZSBL
Vk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklT
Q1ZfSVNBX0VYVF9aRkE6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aRkg6CiAJY2FzZSBLVk1fUkVHX1JJ
U0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VY
VF9aRkhNSU46CkBAIC00MjEsNiArNDI1LDEwIEBAIHN0YXRpYyBjb25zdCBjaGFyICppc2FfZXh0
X3NpbmdsZV9pZF90b19zdHIoX191NjQgcmVnX29mZikKIAkJS1ZNX0lTQV9FWFRfQVJSKFpCS0Mp
LAogCQlLVk1fSVNBX0VYVF9BUlIoWkJLWCksCiAJCUtWTV9JU0FfRVhUX0FSUihaQlMpLAorCQlL
Vk1fSVNBX0VYVF9BUlIoWkNBKSwKKwkJS1ZNX0lTQV9FWFRfQVJSKFpDQiksCisJCUtWTV9JU0Ff
RVhUX0FSUihaQ0QpLAorCQlLVk1fSVNBX0VYVF9BUlIoWkNGKSwKIAkJS1ZNX0lTQV9FWFRfQVJS
KFpGQSksCiAJCUtWTV9JU0FfRVhUX0FSUihaRkgpLAogCQlLVk1fSVNBX0VYVF9BUlIoWkZITUlO
KSwKQEAgLTk0NSw2ICs5NTMsMTAgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YmtiLCBa
QktCKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemJrYywgWkJLQyk7CiBLVk1fSVNBX0VY
VF9TSU1QTEVfQ09ORklHKHpia3gsIFpCS1gpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
YnMsIFpCUyk7CitLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjYSwgWkNBKSwKK0tWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemNiLCBaQ0IpLAorS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
Y2QsIFpDRCksCitLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjZiwgWkNGKSwKIEtWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemZhLCBaRkEpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
ZmgsIFpGSCk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpmaG1pbiwgWkZITUlOKTsKQEAg
LTEwMDEsNiArMTAxMywxMCBAQCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10g
PSB7CiAJJmNvbmZpZ196YmtjLAogCSZjb25maWdfemJreCwKIAkmY29uZmlnX3picywKKwkmY29u
ZmlnX3pjYSwKKwkmY29uZmlnX3pjYiwKKwkmY29uZmlnX3pjZCwKKwkmY29uZmlnX3pjZiwKIAkm
Y29uZmlnX3pmYSwKIAkmY29uZmlnX3pmaCwKIAkmY29uZmlnX3pmaG1pbiwKLS0gCjIuNDMuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
