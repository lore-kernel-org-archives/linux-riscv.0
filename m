Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F759C001B1
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jun 2023 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHFyMDqIFfMpEhX0jRdhThq+/KF5BFM/fywmQQQrIHY=; b=lK7ihrfPmUQgvx
	dvXICZOcMBalB/cC3w3l0Dic2GK69CvgRSsFaRCkCjEqTp9SUUTNFHdUBDEisw3PFrjUoXy5GEcC4
	S3ln6sbr41ZqsarHl4mf1vQhxvO2j/ttanFDQAuV/h52X+/gUXyi6N8BGwE4epKZMlXs1Vt+bpBdR
	mWS8a8Zf6VH4caR6YyTV3Z+0/yADSFtAsJLmHfMZg1UDz2Rg0vnaZR0mYKJOVv52m+EDxke9EgnIQ
	3BZtUxzNVCrrXjcQU2ijOIPxb0k4A30vTQ5xj3V9GRue7RgMkWMUyWYiIlv7SsoOMmag06g20sviz
	EWTb1N1cYZyXoiUReNLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD2GE-005wnl-2D;
	Sat, 24 Jun 2023 12:21:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD2GB-005wkS-06
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jun 2023 12:21:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fa86011753so602225e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jun 2023 05:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687609257; x=1690201257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQDAxN5g1vMcAJWLoIEgGtbs3vH3NsC3JS3eiLLd1tc=;
        b=VAuIn5wmrft6ouJxQrKuyMshqzgPOFFMp3cLYRFjWEUWrbZGQ8XF6H1vCQtgoU+hFS
         DET3mgt3Dg75nvp7UHdGyH9gK5rjRBBGEONXmIvNkoPxYNXpmfrrOEsKaCJl/VpxOS7y
         SRGO0kk8bcyZmm6CxiZeHT4I71gLxrXew6U2gDxOWngaFRQ39qoiOy/yJT+VCs+FkeBv
         TFBEBwlMTFvc7CtPyasehlUTiDNnv3sikuzPp3WmAq8F26uQLaJ9JNhdBJ4STrX8ycVJ
         oIkybPrQT52yhyJk6Qg2XMUNCBbalV8KdxJrm3tB4UUeLKmPAZ0h62NFyQMs+PF7U0Ng
         QPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687609257; x=1690201257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQDAxN5g1vMcAJWLoIEgGtbs3vH3NsC3JS3eiLLd1tc=;
        b=eLqYjrXTQbsXDDYv1ZbLc7siZln97k3zF1W5x6mVlsPeAksZ1n3JlhxueG4KowjXHq
         ZUoR/WDrcy9S/t8MX9exRfH/D8SocfvWpVMChPxsnKkaAMHp6ir5WW08Da6Ii7bsNWL7
         gCpU2dJooCZg0XHgI/KbLaNhn1OeIqOEvHuBwfGn1MKsqywX9VHa6ecgM4wdyY41QoMD
         f9adKUe+JwQ/DnIAr03/ntYiRYDaIfKhNt+d4RN6MwTQIU6burrm3T8BqDWENtIGuYSm
         xGB/ZrLzNkam7V1PkY2FuiFhHKlJJUnTn8us4GEiu1Tw/bfaoVR+hmasf/XN2XKgQFXv
         R90A==
X-Gm-Message-State: AC+VfDym51wqm4i2ZGY67+1/gawqaXCd3UXmMfJ2Zi85duHl76CZCXFW
	6n0Il0IHt6wiYO6OXIAn6AgB4w==
X-Google-Smtp-Source: ACHHUZ40aNXF8GUQdKojrSBWRvtDelAZZelDb3OI5i9UIVBbqRPN27EP9AAhdB6gqYMhg9yBAApZVw==
X-Received: by 2002:a1c:ed17:0:b0:3f5:f543:d81f with SMTP id l23-20020a1ced17000000b003f5f543d81fmr25057066wmh.3.1687609256330;
        Sat, 24 Jun 2023 05:20:56 -0700 (PDT)
Received: from carbon-x1.home ([2a01:cb15:81c2:f100:94c1:d2b1:7300:5620])
        by smtp.gmail.com with ESMTPSA id y15-20020a7bcd8f000000b003f8f9ab6f30sm2058823wmj.20.2023.06.24.05.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 05:20:55 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Stafford Horne <shorne@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Michael Ellerman <mpe@ellerman.id.au>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/6] riscv: remove unused functions in traps_misaligned.c
Date: Sat, 24 Jun 2023 14:20:44 +0200
Message-Id: <20230624122049.7886-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230624122049.7886-1-cleger@rivosinc.com>
References: <20230624122049.7886-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_052059_072242_7B5D3939 
X-CRM114-Status: GOOD (  10.04  )
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

UmVwbGFjZSBtYWNyb3MgYnkgdGhlIG9ubHkgdHdvIGZ1bmN0aW9uIGNhbGxzIHRoYXQgYXJlIGRv
bmUgZnJvbSB0aGlzCmZpbGUsIHN0b3JlX3U4KCkgYW5kIGxvYWRfdTgoKS4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCA0NiArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKaW5kZXggMzc4ZjViMTUxNDQzLi5lN2JmYjMz
MDg5YzEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwor
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTE1MSw1MSArMTUx
LDE5IEBACiAjZGVmaW5lIFBSRUNJU0lPTl9TIDAKICNkZWZpbmUgUFJFQ0lTSU9OX0QgMQogCi0j
ZGVmaW5lIERFQ0xBUkVfVU5QUklWSUxFR0VEX0xPQURfRlVOQ1RJT04odHlwZSwgaW5zbikJCQlc
Ci1zdGF0aWMgaW5saW5lIHR5cGUgbG9hZF8jI3R5cGUoY29uc3QgdHlwZSAqYWRkcikJCQlcCi17
CQkJCQkJCQkJXAotCXR5cGUgdmFsOwkJCQkJCQlcCi0JYXNtICgjaW5zbiAiICUwLCAlMSIJCQkJ
CQlcCi0JOiAiPSZyIiAodmFsKSA6ICJtIiAoKmFkZHIpKTsJCQkJCVwKLQlyZXR1cm4gdmFsOwkJ
CQkJCQlcCi19CitzdGF0aWMgaW5saW5lIHU4IGxvYWRfdTgoY29uc3QgdTggKmFkZHIpCit7CisJ
dTggdmFsOwogCi0jZGVmaW5lIERFQ0xBUkVfVU5QUklWSUxFR0VEX1NUT1JFX0ZVTkNUSU9OKHR5
cGUsIGluc24pCQkJXAotc3RhdGljIGlubGluZSB2b2lkIHN0b3JlXyMjdHlwZSh0eXBlICphZGRy
LCB0eXBlIHZhbCkJCQlcCi17CQkJCQkJCQkJXAotCWFzbSB2b2xhdGlsZSAoI2luc24gIiAlMCwg
JTFcbiIJCQkJCVwKLQk6IDogInIiICh2YWwpLCAibSIgKCphZGRyKSk7CQkJCQlcCi19CisJYXNt
IHZvbGF0aWxlKCJsYnUgJTAsICUxIiA6ICI9JnIiICh2YWwpIDogIm0iICgqYWRkcikpOwogCi1E
RUNMQVJFX1VOUFJJVklMRUdFRF9MT0FEX0ZVTkNUSU9OKHU4LCBsYnUpCi1ERUNMQVJFX1VOUFJJ
VklMRUdFRF9MT0FEX0ZVTkNUSU9OKHUxNiwgbGh1KQotREVDTEFSRV9VTlBSSVZJTEVHRURfTE9B
RF9GVU5DVElPTihzOCwgbGIpCi1ERUNMQVJFX1VOUFJJVklMRUdFRF9MT0FEX0ZVTkNUSU9OKHMx
NiwgbGgpCi1ERUNMQVJFX1VOUFJJVklMRUdFRF9MT0FEX0ZVTkNUSU9OKHMzMiwgbHcpCi1ERUNM
QVJFX1VOUFJJVklMRUdFRF9TVE9SRV9GVU5DVElPTih1OCwgc2IpCi1ERUNMQVJFX1VOUFJJVklM
RUdFRF9TVE9SRV9GVU5DVElPTih1MTYsIHNoKQotREVDTEFSRV9VTlBSSVZJTEVHRURfU1RPUkVf
RlVOQ1RJT04odTMyLCBzdykKLSNpZiBkZWZpbmVkKENPTkZJR182NEJJVCkKLURFQ0xBUkVfVU5Q
UklWSUxFR0VEX0xPQURfRlVOQ1RJT04odTMyLCBsd3UpCi1ERUNMQVJFX1VOUFJJVklMRUdFRF9M
T0FEX0ZVTkNUSU9OKHU2NCwgbGQpCi1ERUNMQVJFX1VOUFJJVklMRUdFRF9TVE9SRV9GVU5DVElP
Tih1NjQsIHNkKQotREVDTEFSRV9VTlBSSVZJTEVHRURfTE9BRF9GVU5DVElPTih1bG9uZywgbGQp
Ci0jZWxzZQotREVDTEFSRV9VTlBSSVZJTEVHRURfTE9BRF9GVU5DVElPTih1MzIsIGx3KQotREVD
TEFSRV9VTlBSSVZJTEVHRURfTE9BRF9GVU5DVElPTih1bG9uZywgbHcpCi0KLXN0YXRpYyBpbmxp
bmUgdTY0IGxvYWRfdTY0KGNvbnN0IHU2NCAqYWRkcikKLXsKLQlyZXR1cm4gbG9hZF91MzIoKHUz
MiAqKWFkZHIpCi0JCSsgKCh1NjQpbG9hZF91MzIoKHUzMiAqKWFkZHIgKyAxKSA8PCAzMik7CisJ
cmV0dXJuIHZhbDsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIHN0b3JlX3U2NCh1NjQgKmFkZHIs
IHU2NCB2YWwpCitzdGF0aWMgaW5saW5lIHZvaWQgc3RvcmVfdTgodTggKmFkZHIsIHU4IHZhbCkK
IHsKLQlzdG9yZV91MzIoKHUzMiAqKWFkZHIsIHZhbCk7Ci0Jc3RvcmVfdTMyKCh1MzIgKilhZGRy
ICsgMSwgdmFsID4+IDMyKTsKKwlhc20gdm9sYXRpbGUgKCJzYiAlMCwgJTFcbiIgOiA6ICJyIiAo
dmFsKSwgIm0iICgqYWRkcikpOwogfQotI2VuZGlmCiAKIHN0YXRpYyBpbmxpbmUgdWxvbmcgZ2V0
X2luc24odWxvbmcgbWVwYykKIHsKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
