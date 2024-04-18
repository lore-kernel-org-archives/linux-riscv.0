Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E467DC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5pBHJ1lBchkAtQHBJAd9vlorc90utg0eQl0H019JnX8=; b=1k6wU53WukbTZo
	6xr3xmEg9yEF6Fyc5Hlc99yhdE2PCL2xDFdmOCUgzTJCP5D1wB9G+Nd9voIrDr+SS/dI8PuCfz2VE
	+nz8lzi/DrsQls+bqgkn6aSExzJMb65aecYa81nQKX5hMqq7aJM5DmFZsTZD93O2i+wei2AhD3qfk
	Bb7DKG1BmKom10+H/Cpgq/Ck3T9kd9nZlp849EZpsnJuxYhbocXqG0lNVQ/m+64eAAPiX6mIPzmU8
	rXgHurnUeb7ofA05foIYExwJSjsyaTqHnRIojvD/pstS0YtsUAvYrpBMGgwwyYvyY3nbLLtTsqqgR
	mqfzl0vRLrc1gQaccuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7X-00000002CXz-0KDs;
	Thu, 18 Apr 2024 12:44:07 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7Q-00000002CRO-04rT
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:02 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2d9f829d398so1957631fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444237; x=1714049037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqinG7vx90NXqlB3cCAWzb6LZzjfwkXKYqGSSxQF2QU=;
        b=ehXSDB06S/Jdq+rbJDNIFRszt7gqHSFCRbGAQ0DD3ppmJMjkDrohLKK5uz2BxZ8H5i
         qd1IkoA0HiOIEpn0iY0Molwf+jGnO4ArgLVVW0NqGigLUhmz0EfZNAS6/6Az53PmRM3t
         vtmp1x1EAroVnUQxMUO//BAEI/CPGtBPM4B9fA91A/jDLpLiTCSybfUJd1LVsEnn2+zO
         zAxGuB1yTlN5YnotjKb3OLJWUllAheEfYHfUcfYpyzho1uCzYt8un/1UDtm02YU5phTJ
         SM7euEgn++ObUbRGLFrvOkPRSBWk/gJR2V9MOzxcpdH2DO6wKoRTGbtNHxUbQNTgWcDm
         K0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444237; x=1714049037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqinG7vx90NXqlB3cCAWzb6LZzjfwkXKYqGSSxQF2QU=;
        b=ht945H/JHISbrpcpTLkkNiTdlDQylq1M8bo/EXqFd66IfiWorbraYJR4fwGyqX1XIs
         PLcohzbemWIquu3JxZ5mrs7Z0N+EYxkVCfPJb2ClTxXrO6zHBsDwnLK8pa6L9nD4Jftg
         CfZ5JrAphnPsX1uKJ+ONaOpc6uVSKLMLGQUECWNDns8bU3zyWkLAjB6kAzqwgPcaqrqy
         exYxBZ1VdEOwZIIzPCSXJycPQ0O8eMWOWBdIMtox+7GpLD3F8qKKCpkqyfWjXV72HaPE
         e59oVeFGpya7xyAU8X1PPU6rWjjlaacZj1eVcr4jRAhdZeLWXZFMzzLwNEu9sVFY+1rn
         TNdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv06IGWuOE74DlUJjrRxBVfPlyaXGCdmi6llplHYQgsbVEBqt3cgcjY3ngNdDiWWmLH37tlxTRxkQ11L+D3uqAG9RKtqOfJa+nWck+wNa5
X-Gm-Message-State: AOJu0YwFBpEBj7Zs9LU52RudvKKtLP1jO3eq6PnnfZAxOaaeUe2AixWO
	UWwZ7THbRtHXkZ/Hf/0wlvq5JlmaelH7V7E+Z/lhJRndbsKlkgrTrT7oM+XqUqQ=
X-Google-Smtp-Source: AGHT+IFXBu2QshCmevcqDNI9qC29EYmJ3ZQBbQK0N8BE6U3hHj6+0OsosVqzAbOLR3+7A5/jwaHB/w==
X-Received: by 2002:a2e:8387:0:b0:2d6:c59e:37c0 with SMTP id x7-20020a2e8387000000b002d6c59e37c0mr1507578ljg.2.1713444237161;
        Thu, 18 Apr 2024 05:43:57 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:43:56 -0700 (PDT)
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
Subject: [PATCH v2 03/12] dt-bindings: riscv: add Zc* extension rules implied by C extension
Date: Thu, 18 Apr 2024 14:42:26 +0200
Message-ID: <20240418124300.1387978-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_054400_092131_ED38A6EB 
X-CRM114-Status: GOOD (  11.22  )
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

QXMgc3RhdGVkIGJ5IFpjKiBzcGVjOgoKIkFzIEMgZGVmaW5lcyB0aGUgc2FtZSBpbnN0cnVjdGlv
bnMgYXMgWmNhLCBaY2YgYW5kIFpjZCwgdGhlIHJ1bGUgaXMgdGhhdDoKIC0gQyBhbHdheXMgaW1w
bGllcyBaY2EKIC0gQytGIGltcGxpZXMgWmNmIChSVjMyIG9ubHkpCiAtIEMrRCBpbXBsaWVzIFpj
ZCIKCkFkZCBhZGRpdGlvbm5hbCB2YWxpZGF0aW9uIHJ1bGVzIHRvIGVuZm9yY2UgdGhpcyBpbiBk
dHMuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sICAgICAgIHwgIDgg
KysrLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDM0
ICsrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3YvY3B1cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jpc2N2L2NwdXMueWFtbAppbmRleCBkODdkZDUwZjFhNGIuLmM0ZTJjNjU0MzdiMSAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCkBA
IC0xNjgsNyArMTY4LDcgQEAgZXhhbXBsZXM6CiAgICAgICAgICAgICAgICAgaS1jYWNoZS1zaXpl
ID0gPDE2Mzg0PjsKICAgICAgICAgICAgICAgICByZWcgPSA8MD47CiAgICAgICAgICAgICAgICAg
cmlzY3YsaXNhLWJhc2UgPSAicnY2NGkiOwotICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1leHRl
bnNpb25zID0gImkiLCAibSIsICJhIiwgImMiOworICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1l
eHRlbnNpb25zID0gImkiLCAibSIsICJhIiwgImMiLCAiemNhIjsKIAogICAgICAgICAgICAgICAg
IGNwdV9pbnRjMDogaW50ZXJydXB0LWNvbnRyb2xsZXIgewogICAgICAgICAgICAgICAgICAgICAg
ICAgI2ludGVycnVwdC1jZWxscyA9IDwxPjsKQEAgLTE5NCw3ICsxOTQsOCBAQCBleGFtcGxlczoK
ICAgICAgICAgICAgICAgICByZWcgPSA8MT47CiAgICAgICAgICAgICAgICAgdGxiLXNwbGl0Owog
ICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKLSAgICAgICAgICAgICAg
ICByaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIsICJmIiwgImQiLCAiYyI7Cisg
ICAgICAgICAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbnMgPSAiaSIsICJtIiwgImEiLCAiZiIs
ICJkIiwgImMiLCAiemNhIiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJ6Y2QiOwogCiAgICAgICAgICAgICAgICAgY3B1X2ludGMxOiBpbnRlcnJ1cHQtY29udHJvbGxl
ciB7CiAgICAgICAgICAgICAgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDE+OwpAQCAt
MjE1LDcgKzIxNiw4IEBAIGV4YW1wbGVzOgogICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
cmlzY3YiOwogICAgICAgICAgICAgICAgIG1tdS10eXBlID0gInJpc2N2LHN2NDgiOwogICAgICAg
ICAgICAgICAgIHJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKLSAgICAgICAgICAgICAgICByaXNj
dixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIsICJmIiwgImQiLCAiYyI7CisgICAgICAg
ICAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbnMgPSAiaSIsICJtIiwgImEiLCAiZiIsICJkIiwg
ImMiLCAiemNhIiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6Y2Qi
OwogCiAgICAgICAgICAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXIgewogICAgICAgICAgICAg
ICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwxPjsKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCmluZGV4IGRi
N2RhZjIyYjg2My4uMDE3MmNiYWExM2NhIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKQEAgLTU0OSw2ICs1NDks
MjMgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgICAgICBjb25zdDogemNhCiAgICAgICAgICAg
ICAtIGNvbnRhaW5zOgogICAgICAgICAgICAgICAgIGNvbnN0OiBmCisgICAgICAjIEMgZXh0ZW5z
aW9uIGltcGxpZXMgWmNhCisgICAgICAtIGlmOgorICAgICAgICAgIGNvbnRhaW5zOgorICAgICAg
ICAgICAgY29uc3Q6IGMKKyAgICAgICAgdGhlbjoKKyAgICAgICAgICBjb250YWluczoKKyAgICAg
ICAgICAgIGNvbnN0OiB6Y2EKKyAgICAgICMgQyBleHRlbnNpb24gaW1wbGllcyBaY2QgaWYgZAor
ICAgICAgLSBpZjoKKyAgICAgICAgICBhbGxPZjoKKyAgICAgICAgICAgIC0gY29udGFpbnM6Cisg
ICAgICAgICAgICAgICAgY29uc3Q6IGMKKyAgICAgICAgICAgIC0gY29udGFpbnM6CisgICAgICAg
ICAgICAgICAgY29uc3Q6IGQKKyAgICAgICAgdGhlbjoKKyAgICAgICAgICBjb250YWluczoKKyAg
ICAgICAgICAgIGNvbnN0OiB6Y2QKIAogYWxsT2Y6CiAgICMgWmNmIGV4dGVuc2lvbiBkb2VzIG5v
dCBleGlzdHMgb24gcnY2NApAQCAtNTY2LDYgKzU4MywyMyBAQCBhbGxPZjoKICAgICAgICAgICBu
b3Q6CiAgICAgICAgICAgICBjb250YWluczoKICAgICAgICAgICAgICAgY29uc3Q6IHpjZgorICAj
IEMgZXh0ZW5zaW9uIGltcGxpZXMgWmNmIGlmIGYgb24gcnYzMiBvbmx5CisgIC0gaWY6CisgICAg
ICBwcm9wZXJ0aWVzOgorICAgICAgICByaXNjdixpc2EtZXh0ZW5zaW9uczoKKyAgICAgICAgICBh
bGxPZjoKKyAgICAgICAgICAgIC0gY29udGFpbnM6CisgICAgICAgICAgICAgICAgY29uc3Q6IGMK
KyAgICAgICAgICAgIC0gY29udGFpbnM6CisgICAgICAgICAgICAgICAgY29uc3Q6IGYKKyAgICAg
ICAgcmlzY3YsaXNhLWJhc2U6CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25z
dDogcnYzMmkKKyAgICB0aGVuOgorICAgICAgcHJvcGVydGllczoKKyAgICAgICAgcmlzY3YsaXNh
LWV4dGVuc2lvbnM6CisgICAgICAgICAgY29udGFpbnM6CisgICAgICAgICAgICBjb25zdDogemNm
CiAKIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCiAuLi4KLS0gCjIuNDMuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
