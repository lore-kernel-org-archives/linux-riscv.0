Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56971C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ht8J48sFZwUwjp6RKdfF0/O6LTbBO+RU1M1DTddgh7M=; b=IZGcuphoxPyGIK
	uvG6krpuEJtwZlTH7oZ2FxLMR1a0arOs36FbkS0Ax7Gu3PQdONoWX/p9/pworgdgIDZzO6ENgihCe
	/R7Y3rQ4I0+gCbUzZoE1UlzcxDcCGOUW9zGkUP1Iz+c74N68/bHuX8C2mfDtEbSR+MGW7eW1bnzBq
	zY8xtpIUMDaSW+F4BPkAkHTavY78Q5w227MxI2KU95RK8lJBDPrtpdhJ406ltEapAB9Lv4vctGHVu
	XFseY3UjIpRTPAKA+w4OB/wcl3JZd9t65pKsto6sNx1JLtncpIkTPPPAJdcbjXRf59IKxQUrdVYc2
	FXATUV4B/kHhv2HGt6Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR8D-00000002DA6-19xL;
	Thu, 18 Apr 2024 12:44:49 +0000
Received: from mail-lj1-f177.google.com ([209.85.208.177])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7Y-00000002CXX-1Jxl
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:11 +0000
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2dac628f08fso2491291fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444245; x=1714049045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJJluMz+u6UTg8XM641LtNTBq3D7zPplm+46K1BBT3g=;
        b=h3AajMf0R3IqZsLbddCI39mu5GWOuomWIRGSyiZqRHQx5OEqUn9fGhOAgNuMpkD2o/
         k1bzvqb2K4auDpvfTB0ltonfSuEx0pHHKhbnyGrqx+GX3k6CNC9FkT4VNt5Ei6vJNXte
         H9hZeg4zgphQ1T7GfABYu6BrdFZO9lH9UBHcHtWDFCmW7L0QPYlzOvzNAU4D/4Zte2cc
         FIzoA7TspDGbdpcyvzBrNX6amzh6dXymInqAKbrPofOc8q84B+l3TTilGw7WFYK5nblM
         iNfkSssMgzJPIkhywkcenlDcS/0UTEObT3KAJYQVn00AAXuuRL/mHYgMZ8SDVDQi85ye
         ugKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444245; x=1714049045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJJluMz+u6UTg8XM641LtNTBq3D7zPplm+46K1BBT3g=;
        b=Q/6883TcxG4KWvOEI5U5x5GJj4j0Q36rpxQLWTsZJ2c+caFqQ2YYw+4yCNchpygW+r
         ePESlevo0RoDRmQ3PchknDeTAYldCHV3+UUrDkEdRTXaHBoFAaYvjuBtDjWv63otG7bI
         4I46LbV1d5esr9jMo1V9xB0Rq1XsGCiUINctCJSYNntkG594I5pqpjf+gQRwKjOH029r
         j492nQ2oLzG4M1XDuAJ5gPY+5g/ijDOcaUpqLPMB20BL0L+QsAo1yLJJXmFL7OVgS7Ue
         +329/qmCsNsPfDoLp0ssIMGLbfxdPYoFhJxfwvS/RXJZTS4/tZGprKZ2Cw2f2rmwGzNm
         sHmg==
X-Forwarded-Encrypted: i=1; AJvYcCWcIzehDGA57UU9E+pv+TQ2yM6O1L0rf1Rfj9S+DxBC8l/HnBHFSMb9kbO69ckE/jn5uuO4mBnAsKklz3cB9uA/aRvpU0AXT421vF1R4UXb
X-Gm-Message-State: AOJu0YylsxlGah1RJzPnh6IP4kYJYbPFwHx3DdXNjg12nODqgZ/Mkm2M
	aMdxDjtFAog+/XWKj308Ix0AB7ory2sNr/5MUJj5+hMpU9pecyxlhb5/y5ilsNo=
X-Google-Smtp-Source: AGHT+IEA98F7NhkSpgbqjXTJDAARemLQxPRyTCHu7WNOEPKgiNpZ7WkvoQPUAaqjKtkLyPbtJUVEhQ==
X-Received: by 2002:a2e:9ccf:0:b0:2d9:e54d:8208 with SMTP id g15-20020a2e9ccf000000b002d9e54d8208mr1639216ljj.0.1713444245128;
        Thu, 18 Apr 2024 05:44:05 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:44:04 -0700 (PDT)
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
Subject: [PATCH v2 09/12] riscv: add ISA extension parsing for Zcmop
Date: Thu, 18 Apr 2024 14:42:32 +0200
Message-ID: <20240418124300.1387978-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_054408_509416_105C5312 
X-CRM114-Status: UNSURE (   9.54  )
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

QWRkIHBhcnNpbmcgZm9yIFpjbW9wIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGlu
IGNvbW1pdApiODU0YTcwOWMwMCAoIlpjbW9wIGlzIHJhdGlmaWVkLzEuMCIpIG9mIHRoZSByaXNj
di1pc2EtbWFudWFsLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2
b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwogYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCBiNzU1MWJhZDM0MWIuLmNmZjc2
NjBkZTI2OCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtODYsNiArODYsNyBAQAogI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX1pDQgkJNzcKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0QJCTc4CiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNGCQk3OQorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pDTU9Q
CQk4MAogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHCTEyNwogCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKaW5kZXggMDlkZWUwNzEyNzRkLi5mMTQ1MGNkNzIzMWUgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKQEAgLTI2NSw2ICsyNjUsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2IsIFJJ
U0NWX0lTQV9FWFRfWkNCKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2QsIFJJU0NWX0lTQV9F
WFRfWkNEKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2YsIFJJU0NWX0lTQV9FWFRfWkNGKSwK
KwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y21vcCwgUklTQ1ZfSVNBX0VYVF9aQ01PUCksCiAJX19S
SVNDVl9JU0FfRVhUX0RBVEEoemJhLCBSSVNDVl9JU0FfRVhUX1pCQSksCiAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoemJiLCBSSVNDVl9JU0FfRVhUX1pCQiksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEo
emJjLCBSSVNDVl9JU0FfRVhUX1pCQyksCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
