Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1998C433EA
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 07:44:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8522420890
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 07:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A5kMLgBg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sV9A8Wyw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8522420890
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z49CznGmIS6N+ObyBuaXtwEih/lh9Es3c+mujEDvt8k=; b=A5kMLgBgYhXUG3/g25FhYdfXGE
	PRDyMw7nM/LVwQ2ktSrJO6XSrYNNAzKx68fR+mcpKs+2jVHlqUpYqQJddhp4ktwfJnIdH2dLkEG97
	fgehSlvJEM15mL3jL2tPmDGrpOTWttS/AM81mbJe7FUjio8lJCtUTVySHV3QZFnOv8N0Omac8QET/
	/uJ0sMuznKnHukbjVBKadnQTYaenKn0FSmIwOcD87UeLiyTra6oBIuTCsc5Z4haJs8isu+8kUyg1g
	Wlo/IYSwX+eFvCxif7MMfWR8OfKw2ML3cl99kPA7q9hTYPuegTfqYlPhFQ+aFcs+vZlkUpEQIfq9k
	w9NdujPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvFbh-0007WM-BI; Tue, 14 Jul 2020 07:44:05 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvFbf-0007V5-2T
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 07:44:04 +0000
Received: by mail-wm1-x341.google.com with SMTP id 17so3822586wmo.1
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 00:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ggXdkn23ixk1Eve60r7XsjTKStmlo12q+Yq1AjF/zbA=;
 b=sV9A8Wyw30q66lBJw75cNAYblVVxR1Ju0crsh9peDxz10t/CMyrWUzW6lfU9EvJe+q
 2jE815KHbIiAMgITgukjEU3bUFXUZ+MJiz8dBjCT4RPfyeTrUCUzZ7T77BASyy3lfVyt
 wxI/2DgTfW7E3AoviAOzGx7njKtYrfm6Cn49beXITRrgDvi6NX3FJodC6GeW1G/laOyl
 oQf6FAbTCGr4RMI23L+42PAwIdxSQkKB91wLs8SwHNYxkCK8MFRzviiWc0IbrJCweUoh
 5MvLjdtjGbyOWdT8isHBEUWM9HDA7x/HJafsBOVo/3hOvnh33KA2YC6g/k0Uwn0ffBzD
 KQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ggXdkn23ixk1Eve60r7XsjTKStmlo12q+Yq1AjF/zbA=;
 b=CcCQqlGcldImFpHtB+Kmwa7RCrBhcjEDxv99XVTL1/8r6AT4zJ0fx9y4Gs2aa9DAy3
 3obkBGzTwPHy8r9nDMmMdU76l3x9xRaCYgxjbMjSu3xHy7kr2Y0M7BM1dXFYgEtJuqW3
 9VuPhIT3ZTkVjv/cu5ccj3KH3/7vlJjpAjuGGK7W5HPiis9I/z/jjFySY02bjQpFXj42
 WSlqcuBqrn33+p3wBtN/wNKsv23TFhmEMunBjc3k38Zyy3xE8KcW5/cp7NsWEvDPclAH
 1/DyzPG2FMdXrciEUQZByZ7IRLeao8CgrQhIZ7z2xwF30BBKhUGz+dh8ueTvz+LwZh3p
 6G7w==
X-Gm-Message-State: AOAM531vYeXPMshF6YAVIihYH9OtPURYfuxm3IxTUA1BrslsAmBEeye0
 BkmH1uTdHnJ5nZipqZ7rzPE3ZHp632I=
X-Google-Smtp-Source: ABdhPJwgLr6/ik4l/zvr0ggsE8Od1DP35wwSRZ5i7xL33XAbT6BgrVkW4V/iAqZEsGT5XXC881P39w==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr2982303wmj.136.1594712640353; 
 Tue, 14 Jul 2020 00:44:00 -0700 (PDT)
Received: from localhost.localdomain ([80.71.140.73])
 by smtp.gmail.com with ESMTPSA id l132sm3226956wmf.6.2020.07.14.00.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 00:43:59 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/2] riscv: Support R_RISCV_ADD64 and R_RISCV_SUB64 relocs
Date: Tue, 14 Jul 2020 09:40:43 +0200
Message-Id: <20200714074044.10031-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_034403_154267_68232E84 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlc2UgYXJlIG5lZWRlZCBmb3IgdGhlIF9fanVtcF90YWJsZSBpbiBtb2R1bGVzIHVzaW5nCnN0
YXRpYyBrZXlzL2p1bXAtbGFiZWxzIHdpdGggdGhlIGxheW91dCBmcm9tCkhBVkVfQVJDSF9KVU1Q
X0xBQkVMX1JFTEFUSVZFIG9uIDY0Yml0IGtlcm5lbHMuCgpTaWduZWQtb2ZmLWJ5OiBFbWlsIFJl
bm5lciBCZXJ0aGluZyA8a2VybmVsQGVzbWlsLmRrPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBl
bCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgpUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
LnRvcGVsQGdtYWlsLmNvbT4KLS0tClRlc3RlZCBvbiB0aGUgSGlGaXZlIFVubGVhc2hlZCBib2Fy
ZC4KCk5vIGNoYW5nZXMgc2luY2UgdjIuCgpUaGlzIHBhdGNoIGlzIG5ldyBpbiB2Mi4gSXQgZml4
ZXMgYW4gZXJyb3IgbG9hZGluZyBtb2R1bGVzCmNvbnRhaW5pbmcgc3RhdGljIGtleXMgZm91bmQg
YnkgQmrDtnJuIFTDtnBlbC4KCiBhcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYyB8IDE2ICsrKysr
KysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUu
YwppbmRleCA3MTkxMzQyYzU0ZGEuLjEwNGZiYTg4OWNmNyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvbW9kdWxlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMKQEAgLTI2
Myw2ICsyNjMsMTMgQEAgc3RhdGljIGludCBhcHBseV9yX3Jpc2N2X2FkZDMyX3JlbGEoc3RydWN0
IG1vZHVsZSAqbWUsIHUzMiAqbG9jYXRpb24sCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQg
YXBwbHlfcl9yaXNjdl9hZGQ2NF9yZWxhKHN0cnVjdCBtb2R1bGUgKm1lLCB1MzIgKmxvY2F0aW9u
LAorCQkJCSAgICBFbGZfQWRkciB2KQoreworCSoodTY0ICopbG9jYXRpb24gKz0gKHU2NCl2Owor
CXJldHVybiAwOworfQorCiBzdGF0aWMgaW50IGFwcGx5X3JfcmlzY3Zfc3ViMzJfcmVsYShzdHJ1
Y3QgbW9kdWxlICptZSwgdTMyICpsb2NhdGlvbiwKIAkJCQkgICAgRWxmX0FkZHIgdikKIHsKQEAg
LTI3MCw2ICsyNzcsMTMgQEAgc3RhdGljIGludCBhcHBseV9yX3Jpc2N2X3N1YjMyX3JlbGEoc3Ry
dWN0IG1vZHVsZSAqbWUsIHUzMiAqbG9jYXRpb24sCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBp
bnQgYXBwbHlfcl9yaXNjdl9zdWI2NF9yZWxhKHN0cnVjdCBtb2R1bGUgKm1lLCB1MzIgKmxvY2F0
aW9uLAorCQkJCSAgICBFbGZfQWRkciB2KQoreworCSoodTY0ICopbG9jYXRpb24gLT0gKHU2NCl2
OworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50ICgqcmVsb2NfaGFuZGxlcnNfcmVsYVtdKSAo
c3RydWN0IG1vZHVsZSAqbWUsIHUzMiAqbG9jYXRpb24sCiAJCQkJRWxmX0FkZHIgdikgPSB7CiAJ
W1JfUklTQ1ZfMzJdCQkJPSBhcHBseV9yX3Jpc2N2XzMyX3JlbGEsCkBAIC0yOTAsNyArMzA0LDkg
QEAgc3RhdGljIGludCAoKnJlbG9jX2hhbmRsZXJzX3JlbGFbXSkgKHN0cnVjdCBtb2R1bGUgKm1l
LCB1MzIgKmxvY2F0aW9uLAogCVtSX1JJU0NWX1JFTEFYXQkJCT0gYXBwbHlfcl9yaXNjdl9yZWxh
eF9yZWxhLAogCVtSX1JJU0NWX0FMSUdOXQkJCT0gYXBwbHlfcl9yaXNjdl9hbGlnbl9yZWxhLAog
CVtSX1JJU0NWX0FERDMyXQkJCT0gYXBwbHlfcl9yaXNjdl9hZGQzMl9yZWxhLAorCVtSX1JJU0NW
X0FERDY0XQkJCT0gYXBwbHlfcl9yaXNjdl9hZGQ2NF9yZWxhLAogCVtSX1JJU0NWX1NVQjMyXQkJ
CT0gYXBwbHlfcl9yaXNjdl9zdWIzMl9yZWxhLAorCVtSX1JJU0NWX1NVQjY0XQkJCT0gYXBwbHlf
cl9yaXNjdl9zdWI2NF9yZWxhLAogfTsKIAogaW50IGFwcGx5X3JlbG9jYXRlX2FkZChFbGZfU2hk
ciAqc2VjaGRycywgY29uc3QgY2hhciAqc3RydGFiLAotLSAKMi4yNy4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
