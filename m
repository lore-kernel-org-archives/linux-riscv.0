Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C38C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 15:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Abz7UAFqiN67ddQZR5wsOJSM/BeJeVsqyZKOjwE2fX8=; b=KOMOzXtVLKlvYO
	pMR3wpKBeVEot84LYXoTS1YUEn/q08TLAaJm7tVrOJ8wDfOrVoej/gyT6z2TicVm9o4pJkzSGTV8i
	ogbYfc4FGb3KuW+ksrUMpuEf3k1cfFiUpemHdyLm308gdb8TIjhP6pmrSIavxL866/p5kVLUutiqs
	R0BAYd310pGsUK9p+vO1996WBTOBxxZPRM3lQ0xd4BKc6dNupY1IOLvAVWrDx7E2ImOoyxrontaRY
	9YSj2y+XkRineuxLgf8//bYsnrEERPuW2xCgMp1nnefoqGn4Bk6STJlhfsGKC8jFVhApZIocNQTcu
	6bIvzJ4NP+f7Ax+GIBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxRH-00000001qjg-2FgT;
	Wed, 19 Jun 2024 15:41:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxR0-00000001qWp-26OL
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 15:41:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42181803bf2so4909285e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718811676; x=1719416476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhmrjq4H2Oq8xJPevOPzXZFQ+Nl3u1sJLUiSeD49DFE=;
        b=RGE9CB2EQzeCSocRK1YporQkp08YmIMYUU4SYQEHPSagkPYC3iTPw4z/DV21HEXBmM
         5k5FD7OK9734pO6YmcdJaakKeCK8oVxWV45xs3FQVkLs6+dKmwBuJp2z9KNSu6bSj2uK
         CgqKiWs9fRjYjYCl6h1A4nVhE7Gm4pSj8r1N4/ApxP2SOJW7mnqGaVLw7Vtx8WXDLRPF
         oFOguyJ5fmQD8CnJhjHFK+iES8t5ZiOjDuKL/P6oMCQLA1jzGSClygTmsGwqRXTILo83
         r4dF16DdcmQFDnVTfvz8S6yRQY8MrhEXrPDL/WOxk9aQTRLgtpAOg/WIyiEibXn1fXym
         lB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718811676; x=1719416476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhmrjq4H2Oq8xJPevOPzXZFQ+Nl3u1sJLUiSeD49DFE=;
        b=XglyrMygj+OSK7R2yCFrB9KI7iWxlmwMTmKsd9L/V3SFYiXUREhPSWqeyXO4nQ2M6p
         xod0K0optoO2pXKGX7LK2enfOgd5rRJbsJMOrfmk+AgEhxICSXi2uQg2LHytuB8LOKxu
         k1t29rcP8sPzyb6ZyjXtiJPsxQDOGR9udl4wdIE0X+GwdQD602w8+HW/o7gpBmEpdoK+
         2o8FPZKeeUar/HiN53CViNc89/r6S72EUO3YVG9zzo6AOdh4mSOodE9XqfLEFoisrG70
         Kozn6PXzb1MmJBmwKOeWMGOjnwahrYKKeO3bKJClL9PmLU/gV3OV+wQlILwss3RXsP1E
         UUgw==
X-Forwarded-Encrypted: i=1; AJvYcCUI5IRMFSXPO3zn/06d4/YgZODzaS4Zb7yk5VE+zpA1y45t6+kapxdLR0yMEu/YYBrBVwjsGPDvKwtuPV0yvL1VV1vMBd0Fgq2/vmoTTj+q
X-Gm-Message-State: AOJu0YwEsuucm0y0hrSCKcFy2XjysdZiRjAmzlRx5vd4QlKJcXBK91Z3
	w58SWkiLNdQoarbXRj9uZHU8rnWh+FCSUYXpDD3Yxbk4LkscY+XlJBqSTmwVOOA=
X-Google-Smtp-Source: AGHT+IGjwtUZf3kMWB9g1O1qJeQzBRQZ0qEbWnfWNveuCVuurscQ/RMRjo/RFMkwbrEud2Tb1Hd71w==
X-Received: by 2002:a05:600c:1d09:b0:422:2f06:92d1 with SMTP id 5b1f17b1804b1-42475296800mr18928745e9.2.1718811675796;
        Wed, 19 Jun 2024 08:41:15 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:819d:b9d2:9c2:3b7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c785sm17392292f8f.34.2024.06.19.08.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:41:15 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 5/5] KVM: riscv: selftests: Add Zaamo/Zalrsc extensions to get-reg-list test
Date: Wed, 19 Jun 2024 17:39:12 +0200
Message-ID: <20240619153913.867263-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619153913.867263-1-cleger@rivosinc.com>
References: <20240619153913.867263-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_084118_556547_178C7F56 
X-CRM114-Status: UNSURE (   9.44  )
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFphYW1vL1phbHJzYyBleHRlbnNpb25zIGZvciBHdWVzdC9W
TSBzbyBhZGQgdGhlc2UKZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxpc3QgdGVzdC4KClNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCA4ICsrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCmluZGV4IDFhNTYzN2E2ZWExZS4uNzAyMTZh
MTc2MGMzIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0
LXJlZy1saXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1y
ZWctbGlzdC5jCkBAIC00OCw3ICs0OCw5IEBAIGJvb2wgZmlsdGVyX3JlZyhfX3U2NCByZWcpCiAJ
Y2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBL
Vk1fUklTQ1ZfSVNBX0VYVF9TVklOVkFMOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwg
S1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZOQVBPVDoKIAlj
YXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtW
TV9SSVNDVl9JU0FfRVhUX1NWUEJNVDoKKwljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtW
TV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pBQU1POgogCWNhc2Ug
S1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJ
U0NWX0lTQV9FWFRfWkFDQVM6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVH
X1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQUxSU0M6CiAJY2FzZSBLVk1f
UkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1Zf
SVNBX0VYVF9aQkE6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NW
X0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQkI6CiAJY2FzZSBLVk1fUkVHX1JJU0NW
X0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9a
QkM6CkBAIC00MjAsNyArNDIyLDkgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmlzYV9leHRfc2luZ2xl
X2lkX3RvX3N0cihfX3U2NCByZWdfb2ZmKQogCQlLVk1fSVNBX0VYVF9BUlIoU1ZJTlZBTCksCiAJ
CUtWTV9JU0FfRVhUX0FSUihTVk5BUE9UKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFNWUEJNVCksCisJ
CUtWTV9JU0FfRVhUX0FSUihaQUFNTyksCiAJCUtWTV9JU0FfRVhUX0FSUihaQUNBUyksCisJCUtW
TV9JU0FfRVhUX0FSUihaQUxSU0MpLAogCQlLVk1fSVNBX0VYVF9BUlIoWkJBKSwKIAkJS1ZNX0lT
QV9FWFRfQVJSKFpCQiksCiAJCUtWTV9JU0FfRVhUX0FSUihaQkMpLApAQCAtOTUwLDcgKzk1NCw5
IEBAIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoc3N0YywgU1NUQyk7CiBLVk1fSVNBX0VYVF9T
SU1QTEVfQ09ORklHKHN2aW52YWwsIFNWSU5WQUwpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJ
Ryhzdm5hcG90LCBTVk5BUE9UKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoc3ZwYm10LCBT
VlBCTVQpOworS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YWFtbywgWkFBTU8pOwogS1ZNX0lT
QV9FWFRfU0lNUExFX0NPTkZJRyh6YWNhcywgWkFDQVMpOworS1ZNX0lTQV9FWFRfU0lNUExFX0NP
TkZJRyh6YWxyc2MsIFpBTFJTQyk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpiYSwgWkJB
KTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemJiLCBaQkIpOwogS1ZNX0lTQV9FWFRfU0lN
UExFX0NPTkZJRyh6YmMsIFpCQyk7CkBAIC0xMDEyLDcgKzEwMTgsOSBAQCBzdHJ1Y3QgdmNwdV9y
ZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7CiAJJmNvbmZpZ19zdmludmFsLAogCSZjb25maWdf
c3ZuYXBvdCwKIAkmY29uZmlnX3N2cGJtdCwKKwkmY29uZmlnX3phYW1vLAogCSZjb25maWdfemFj
YXMsCisJJmNvbmZpZ196YWxyc2MsCiAJJmNvbmZpZ196YmEsCiAJJmNvbmZpZ196YmIsCiAJJmNv
bmZpZ196YmMsCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
