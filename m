Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2600EC25B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uitfSKrwAyM4GqfiQ1wNGG6HYoPffQQPr0sT4wZ5Css=; b=VywGLvpTJU3X/P
	9pTXEBqHXjqdNyhN/2KpuL5v2OFGyFbIUU/oNXPxTsdyUr4/NdSF81WpykKxBWqTnHzqJ30sBPAa4
	eWauJtwiUHBXObWnJgI7OlXnVPiOmp5QrdhQISgOToUn2lc/B/FaAjQIU2xDSl0DbKIMQ0sXAtN1d
	wZLas53LvkRGEtQ6kzL4DW4ibOMRUBLTavbkkCvq7YfYQXcd8EB6SxZZ99xB/wX38TBdg0QhBYo+R
	QhclqwfrJCFi17+gzvDlchtCAGQDFMLr7A31iHMbuSp8sW1Sc/P0J6CYTOO7014KjJrlDCBQ81RnX
	h6dz4Lro0mg7w7mibYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETaQ-00000002Mc4-49h0;
	Tue, 04 Jun 2024 12:48:23 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETaM-00000002MYF-2xSI
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:48:21 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-6c2d04b0833so485623a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505296; x=1718110096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pl7e/Uw2TsjVm5w2UCcg19dOQoVq7golKlAiO1RXFLo=;
        b=ED85k72XdLEuPCWucamhD0inreZ+l7nuWXb9mGA3E3T8jT0yPItR9P3+U6cyxqdTqn
         RfWpCMAY7Y+Vr0PHV3zvjilKzVD0P4YnLPPAdxu5Dxd5LP55+YjljECdw72m4yaf41SE
         L3/c6c+wWGIuinDpHP1IRul5Lbvo16MM5GnMEm6dH5x+zBPTIUx80B4sXQYF6rHKf1Nc
         Z+gpNcIPjOyX9rAidavK+2EvlVUipEj82hmVSGknhMjoHvfx1cgj2c+wVH/eQLAkgMjk
         C+AJNfA4v4y/OBZJxttQreJu6odelQXpu8GNQ8t+TQIRUr81Ppskvznm+d2juKwOxpyo
         eN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505296; x=1718110096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pl7e/Uw2TsjVm5w2UCcg19dOQoVq7golKlAiO1RXFLo=;
        b=hAT6xipcqS4SxSaahlNzXLVZ02kIRVIkSdCvYSR7s48Q34DYRewAtXhxz1DnwNCt1q
         yY0LLNaxZCtclYllOWya7N6TkbB5x/7gvH70zZnRBnRE+INLFh3LFvIcSh5qK1sA6Bpu
         H0mR5PDO0lFhprE27fwa93hY9zSvKVCd5fSkk1NGDZMtU7hXKGF8FGB2yBKh53aNa+oW
         pUIcavA5EHAyN0GOKMXkftlUjoFm/iCv8OjFge51nYy3Li68HP8dErb1wKXw8jenoxoC
         YRf6WCowS/94MxDwHkmg22Y4e84Jd1y4mEZX6AMV/RiLS9Rb9v/HG9103mr/f9q6a9Bk
         7mNg==
X-Forwarded-Encrypted: i=1; AJvYcCXUTQZK9kfazOxsKid/Fo7iOhQaSru15JV2JXnnfw467D1nnpdhnzKDdYjHoK34TOrKuJvcRjLEe3ZFnrg0YdQEXrjudSRqG0LM7Zzf/rbc
X-Gm-Message-State: AOJu0YyREiDqkI3wwigTb14kq5JMA5piP5bB9kCSOjdwO+Acxsv0a5XU
	kaJWpLWGpzxDy/HnFaK6PJ6ifwtEiuiJ7mqSQ1rS9OnXECs2SCAMaDgsJK1SyqY=
X-Google-Smtp-Source: AGHT+IHDavkX6lYzEzmyDr28AhE3WeR2xg+16B5HaBHrs9r6naCfkGg0GyGTT03skFYsojMtzKntzA==
X-Received: by 2002:a17:902:6541:b0:1f6:226f:cc50 with SMTP id d9443c01a7336-1f69425b1e5mr23526605ad.6.1717505296634;
        Tue, 04 Jun 2024 05:48:16 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:48:16 -0700 (PDT)
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
Subject: [PATCH v6 11/16] KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
Date: Tue,  4 Jun 2024 14:45:43 +0200
Message-ID: <20240604124550.3214710-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054818_863839_B6C34150 
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBleHRlbnNpb25zIGZv
ciBHdWVzdC9WTSBzbwphZGQgdGhlc2UgZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxpc3QgdGVzdC4K
ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CkFja2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCmluZGV4IDhjOGIxMDljZTNjYS4uODY0YTcwMWVmNmMz
IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1s
aXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlz
dC5jCkBAIC01Niw2ICs1NiwxMCBAQCBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQogCWNhc2Ug
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
VF9aRkhNSU46CkBAIC00MjMsNiArNDI3LDEwIEBAIHN0YXRpYyBjb25zdCBjaGFyICppc2FfZXh0
X3NpbmdsZV9pZF90b19zdHIoX191NjQgcmVnX29mZikKIAkJS1ZNX0lTQV9FWFRfQVJSKFpCS0Mp
LAogCQlLVk1fSVNBX0VYVF9BUlIoWkJLWCksCiAJCUtWTV9JU0FfRVhUX0FSUihaQlMpLAorCQlL
Vk1fSVNBX0VYVF9BUlIoWkNBKSwKKwkJS1ZNX0lTQV9FWFRfQVJSKFpDQiksCisJCUtWTV9JU0Ff
RVhUX0FSUihaQ0QpLAorCQlLVk1fSVNBX0VYVF9BUlIoWkNGKSwKIAkJS1ZNX0lTQV9FWFRfQVJS
KFpGQSksCiAJCUtWTV9JU0FfRVhUX0FSUihaRkgpLAogCQlLVk1fSVNBX0VYVF9BUlIoWkZITUlO
KSwKQEAgLTk0OCw2ICs5NTYsMTAgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YmtiLCBa
QktCKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemJrYywgWkJLQyk7CiBLVk1fSVNBX0VY
VF9TSU1QTEVfQ09ORklHKHpia3gsIFpCS1gpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
YnMsIFpCUyk7CitLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjYSwgWkNBKSwKK0tWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemNiLCBaQ0IpLAorS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
Y2QsIFpDRCksCitLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjZiwgWkNGKSwKIEtWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemZhLCBaRkEpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6
ZmgsIFpGSCk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpmaG1pbiwgWkZITUlOKTsKQEAg
LTEwMDUsNiArMTAxNywxMCBAQCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10g
PSB7CiAJJmNvbmZpZ196YmtjLAogCSZjb25maWdfemJreCwKIAkmY29uZmlnX3picywKKwkmY29u
ZmlnX3pjYSwKKwkmY29uZmlnX3pjYiwKKwkmY29uZmlnX3pjZCwKKwkmY29uZmlnX3pjZiwKIAkm
Y29uZmlnX3pmYSwKIAkmY29uZmlnX3pmaCwKIAkmY29uZmlnX3pmaG1pbiwKLS0gCjIuNDUuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
