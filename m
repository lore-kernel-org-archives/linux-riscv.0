Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DC3C35FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lErUFwJA6jnsST3RUrOrk2GA9GkEYnSrm/AHP4jyqRM=; b=BaMBy+tTR05d64
	E3rO17uhY6kpIrH3lEi1YSmiN5nKImKtPL+kOtvKBUqGYk3Ck2sDS6ftNZebzx91Qc5baVqTEvaUr
	NUfnRYhNgXxZpKVGQww6KMdlfqG/3YlA65lfsWDmvPYfFwBfYHJo5g9Hz7J+rSGguuoGU85z+T0As
	ISmd/VjpcOosVogguRz5Rq30T+1zoD3vHeyFV9Ox3CQxQ4RlDQyUIpmFWsy762bUbPE2ttfpL7XbT
	RSMLDaoQVnAaYg6ARjSmyItmJmO+dZu8X4d0ieQ0MLJFHUPHcMHgfUWab8KcqI4m+J+So51XPE8n2
	BSpClsGinDIICDEZ+fDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1d-00000003VK0-2lTI;
	Mon, 17 Mar 2025 17:13:17 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDws-00000003TXl-3Jpc
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3154344f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231301; x=1742836101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pNqCCOYMsZxxXyyqHIS5snuORKLAQN1trvRZ+awEuI=;
        b=dJbyaJ0StGWPHArbgDm2H2SY9xQOJGwEMjU9rhZ29UiEJzCxmhDsyxcrPAIKcO7SRO
         xRhl2OtPo19D1Iopm+pQgIfrVFsf8zVEP48y2ttZ1bNp778DzOP9ijbEKC0CH862k/7e
         IzuolLpODyFeLnWqQLt/85yBkk6wgUVv6Ahd4rTDGdYsbXSTMmE6F1CWLWIf1dNKIbf5
         gp3zyfUhhdvdW+NaofFScPC8YIAJuvsGPc1TV6K86qZm6le7rKUWX6oThQ3LMYWmPJPP
         lI1crCbIjDB+5hImHhwNKU4pwwcbJ1q1c0ZH4Mtpz0Y7lmKPxaMYqGgceL+cu0VeMlzF
         LSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231301; x=1742836101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pNqCCOYMsZxxXyyqHIS5snuORKLAQN1trvRZ+awEuI=;
        b=J3NgMMu1AdTXIxyxT7bDPG45geQcOzL5geVASA/bJeDRgFPDRq4DcmS0WK1/9YUV7E
         r+Ky2aMLsvvn0oVecgWQbH3poqSGo1SqWmi6cUx1fEbME/lhRe0REuoABpGI5cCOIhcs
         erlzkOmmkApxtmOJveg90nX5Ay310wCIAlv3q9OiFVO7Jo4e1Dz5f42YQHl3qZZUlXci
         DbvInD5VuDBOvHhYesUIXZ2WbTAo01a0rFjdjD/0Nnh5cGR2DK0bZgX7qvA19PVXevfM
         B8lJATFgawjPZUuwnxsaRTzJkmloV9XZCEzW5BvzY14/shspxi1eZyeaftBEGRCa/Nzi
         Y3Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXoqQXIbG0nzUtFlPNLyuIytuNbvRdKznt/EGS95qTWd0WoqGBEM1VPm6oER1MGg5h/yimNVOTdAUx32w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMSIMlHVsiJuJwqOOpy5JG1CaMwKkHloXkTrcK38izIBuOAVwv
	uWWdc42AsnpmXAPjs5l2Uj3nxg70kXswZbSj/SwE0op9QBiF/ONgcErF9TD7o/8=
X-Gm-Gg: ASbGncu7X8fruU0eKa67cigN0mfLbWe34fsodlO56OnUcCIE6vA3EYNNFQ7KfmKHBsC
	JmtmiF9SlhNZ+lursQe0/Ud0BA0EvdLfhINiHJVmmQ6Dp1q3/0o9vqkAnL3H8bGaRRBofTb1grY
	az7KIpXN7pYRTP6pMVoUz3/2JThFTDCF8fJYBz74SnBsXwG1VPojQdB+tssxZfuwvB4UogrLUF6
	ikaoq6uNpVyAEjnu6shyP9ae/58gQJ+gfbs2obCkMOGnFkw3GCo0k+j3eJONb6KGl/fDd5j3jLr
	BsjjJS6fxTzP3hnSM+0d1JfJlhS82vU0oiqGZkU7uU1/jQ==
X-Google-Smtp-Source: AGHT+IE6X4Zl2SvCnLBWCWxVkBGrawQ8DSM4qV1sZG6LsJ3FF5B07Zi+O2FlbpqV8a0E2j6PRS6VBQ==
X-Received: by 2002:adf:b183:0:b0:390:f88c:a6a2 with SMTP id ffacd0b85a97d-3971f12cd8emr13396928f8f.39.1742231301480;
        Mon, 17 Mar 2025 10:08:21 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 13/18] Documentation/sysctl: add riscv to unaligned-trap supported archs
Date: Mon, 17 Mar 2025 18:06:19 +0100
Message-ID: <20250317170625.1142870-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100822_831718_41AFB4CB 
X-CRM114-Status: UNSURE (   9.37  )
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

cmlzY3Ygc3VwcG9ydHMgdGhlICJ1bmFsaWduZWQtdHJhcCIgc3lzY3RsIHZhcmlhYmxlLCBhZGQg
aXQgdG8gdGhlIGxpc3QKb2Ygc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMuCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1n
dWlkZS9zeXNjdGwva2VybmVsLnJzdAppbmRleCBkZDQ5YTg5YTYyZDMuLmEzOGU5MWM0ZDkyYyAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0CkBAIC0xNTk1
LDggKzE1OTUsOCBAQCB1bmFsaWduZWQtdHJhcAogCiBPbiBhcmNoaXRlY3R1cmVzIHdoZXJlIHVu
YWxpZ25lZCBhY2Nlc3NlcyBjYXVzZSB0cmFwcywgYW5kIHdoZXJlIHRoaXMKIGZlYXR1cmUgaXMg
c3VwcG9ydGVkIChgYENPTkZJR19TWVNDVExfQVJDSF9VTkFMSUdOX0FMTE9XYGA7IGN1cnJlbnRs
eSwKLWBgYXJjYGAsIGBgcGFyaXNjYGAgYW5kIGBgbG9vbmdhcmNoYGApLCBjb250cm9scyB3aGV0
aGVyIHVuYWxpZ25lZCB0cmFwcwotYXJlIGNhdWdodCBhbmQgZW11bGF0ZWQgKGluc3RlYWQgb2Yg
ZmFpbGluZykuCitgYGFyY2BgLCBgYHBhcmlzY2BgLCBgYGxvb25nYXJjaGBgIGFuZCBgYHJpc2N2
YGApLCBjb250cm9scyB3aGV0aGVyIHVuYWxpZ25lZAordHJhcHMgYXJlIGNhdWdodCBhbmQgZW11
bGF0ZWQgKGluc3RlYWQgb2YgZmFpbGluZykuCiAKID0gPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIDAgRG8gbm90IGVtdWxhdGUgdW5hbGln
bmVkIGFjY2Vzc2VzLgotLSAKMi40Ny4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
