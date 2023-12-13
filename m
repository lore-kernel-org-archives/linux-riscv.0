Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3540C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lklKtXjkWrUzdWCa5tq4q6/lv1UeV0FEkynTuizJNUY=; b=JUi9aaAExbrlIc
	OOe0om0fHLesmpznyJbLpvi3owoVhv7GCICoFltGNFeeIZVUSBoQTFxWOaVB9ueHv8ZYJZdNYFYzr
	mNmwqznUY/oB7ElKZW3muUZFsgs86xr8zshc08mpxUU/LCVgCf7UuI6G/htszdGrkP7BGqp8eMy5a
	jzZRFDFwl5LQFsakrNLdJ67y0luD5lmy/+WUBMPUStkuSqwv4DY5gi05i0wUIh/2rb8sn4CSDaxGY
	r0k4yL+AIKzq9g1wycm4xPdImiBIhF17sgxF4WkyQRsxnbIJRQDKkx3Dho5nzPCw09Q3qKb/BrpnW
	lwDA20dryK8BgZB9xclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUV-00ETAu-2V;
	Wed, 13 Dec 2023 11:33:27 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUQ-00ET3y-11
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 11:33:24 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c9f575d4b2so16198131fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 03:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467199; x=1703071999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWX/zjp+iAoc0sTO0EE360u/fHh1vFE2puPVRvnlJSg=;
        b=Eo7tsbnyG8cwqx9hA4uDQ+RwMBwrcWe8O/jyiSkYmzRuNRU/C4MakAhd9CsoE0A0Wl
         fDQsVugh8i6zBuLWUscsmno19wKnFwAVkJLHdrJ1nBhOkLWTlXXQjw7zuI2Zmc8g9YPd
         4rwLEOd8AHQ5A2YkHiwa3ttRfAnABeRiIyh9RGr5F/F729+I1iwzR4u1lWfXnY/C2dh5
         TZ/EWmdxfeVc0EeUu4TZHXLt+3vSQXq2B6Jrdk+ctxEVFnF/Lo8GR93KRi6RKPNBs4xo
         PLzX6GkkgCydPqm+PWtfW3xnOQ5hxHflXQUj9peJVm6DQQs7bG2qUXe4TceyvTlQ8Ptu
         dlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467199; x=1703071999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWX/zjp+iAoc0sTO0EE360u/fHh1vFE2puPVRvnlJSg=;
        b=Y3sB+hqwTHPrV0URs75v8Sv2mGFsKIKrvpX4q+ieAj2tTCuVjQPQCcas4JhOgfoGGs
         xHSwj+eyQ6Y/gXNIaAlk36NNmuoZvhtNmL0XUAfdAxSxdZbevkHaWHOfErM6HIcaQVmt
         0f+SfiykcbGpUD1F7Oj7GzENej+taQK2RJ7K+PCgpEBQz/MtJ2uCfjRyLHnCgnjN5hUi
         h1LrB0Y+KTQZnPhs3jOf9jCWF4pmIDnJijBHapJzZ8euGq6SGiQGtuQjOdlqmB4h+fPv
         3PvnTRlK+4G2FhPyB8uj9XZKiYQqPaaMty45k0cpUMVejzR+cn4LNmfUgxbscbYHkd4M
         LhNg==
X-Gm-Message-State: AOJu0YwfxUAZB/SAEPCxAQ0/8KtomfnEOscIsOG8apugurfS1xVUjOc4
	lTgsXRgncuxGY+DvNaBOCZcCrw==
X-Google-Smtp-Source: AGHT+IEuXYkwYCdXUnQRj5u26PSyylqZ1NgdfvKlwWU8/MoItLq0cyd9mcOkAanUk5MDzRp5gaQUuA==
X-Received: by 2002:a2e:918b:0:b0:2cb:2d8a:a28a with SMTP id f11-20020a2e918b000000b002cb2d8aa28amr5882241ljg.5.1702467199112;
        Wed, 13 Dec 2023 03:33:19 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:18 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH 6/9] dt-bindings: riscv: add Zacas ISA extension description
Date: Wed, 13 Dec 2023 12:33:02 +0100
Message-ID: <20231213113308.133176-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213113308.133176-1-cleger@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_033322_383093_0F5ABCFB 
X-CRM114-Status: UNSURE (   8.46  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmFjYXMgSVNBIGV4dGVuc2lvbiB3aGljaCB3YXMgcmF0
aWZpZWQgcmVjZW50bHkuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbCB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9leHRlbnNpb25zLnlhbWwKaW5kZXggOTEyY2M2YTQyZWI0Li4yNjQxMTRmYTk0M2UgMTAwNjQ0
Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25z
LnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbApAQCAtMTcxLDYgKzE3MSwxMiBAQCBwcm9wZXJ0aWVzOgogICAgICAgICAgICAg
bWVtb3J5IHR5cGVzIGFzIHJhdGlmaWVkIGluIHRoZSAyMDE5MTIxMyB2ZXJzaW9uIG9mIHRoZSBw
cml2aWxlZ2VkCiAgICAgICAgICAgICBJU0Egc3BlY2lmaWNhdGlvbi4KIAorICAgICAgICAtIGNv
bnN0OiB6YWNhcworICAgICAgICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICAgICAgICBUaGUgWmFj
YXMgZXh0ZW5zaW9uIGZvciBBdG9taWMgQ29tcGFyZS1hbmQtU3dhcCAoQ0FTKSBpbnN0cnVjdGlv
bnMKKyAgICAgICAgICAgIGlzIHN1cHBvcnRlZCBhcyByYXRpZmllZCBhdCBjb21taXQgNTA1OWUw
Y2E2NDFjICgidXBkYXRlIHRvCisgICAgICAgICAgICByYXRpZmllZCIpIG9mIHRoZSByaXNjdi16
YWNhcy4KKwogICAgICAgICAtIGNvbnN0OiB6YW0KICAgICAgICAgICBkZXNjcmlwdGlvbjogfAog
ICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFphbSBleHRlbnNpb24gZm9yIG1pc2FsaWduZWQgYXRv
bWljcyBpcyBzdXBwb3J0ZWQgYXMKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
