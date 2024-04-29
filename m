Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227D8C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pLAjDLNSI0dZ5ZKEzLvHxvJ2j4AJMvVjP40qy4xk8NM=; b=OnKt1yDXUORCKg
	OTZjl03xMcECkMHLj2G4Yx5QOQM5x9Ahcu85P+18R68T+9R2qImsBox+2C+bGvL+LpAZuHzjr24RP
	x3sg5Mpl5u3rioaWkhQM0YGjvSC0/842zaX0UFdwlD227WBQv/0dayPjAGhdR/9RM67Y0YStxFKOO
	yNOln+eq8EdaoQuIhmjF+7iaK5TQaWsfJVd/hLpiIDCMJt5Cw3pqnYpc1UsOzia9BSqvSTiHcDXEh
	z5CaXPccuXvO2GlCUEAdITx5ccptRU9pshMVDmBLN0IrV3UfAkXNyIB2BGIqXZpVVQw+FmDqXsNny
	ldCBglCgF7VDMEVLsZmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SdR-00000003IM2-2xmb;
	Mon, 29 Apr 2024 15:09:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SaX-00000003GRb-1gwW
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 15:06:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41bf7889de1so56155e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 08:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714403199; x=1715007999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqUXz3P/ILbAY/obovxuw/ulwPrEeHHfsINnJJgombQ=;
        b=kPJquUaKmzcVmiDonPP5o/1d3nCe1vzK7i3uMO+HXgtraehb9nStSCBRurEEjMMH0S
         Di7bxQKR5D8rNH8TB9YizujOhgTsmA4FLmmya6YDlrRdc2AqhJOvMQQIj8fqu6jo5gyu
         MAfWOfgpfu6Gy9q+ewoBM09U1LOpGhNjZEvak7BzMzqOFtnq0xR3p85lk0ZiM/2jgDUE
         WtqT5YAwe/+KWpDeYLoL6fzu7nT9QGaDq1OXqIvcvgFjsI4yvtHE5HtcNEO4aYJ7r9ZE
         5kOQRH81p09QiY6RXrH9oTHaxuv3jRpXouP+1LJtYn/QtLi+ygki6AnmTc56mO9qIKtc
         N1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403199; x=1715007999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqUXz3P/ILbAY/obovxuw/ulwPrEeHHfsINnJJgombQ=;
        b=l7p0DRdUKPeEN71PisXHvHGVFuDT3MRQLSPoGs+TZ5KpAzeKYCwxKGgNgL9nVivggv
         NqXSqzAM+AcvkbHXKckw7gpXK4DFd9n3LvCgOBvL/eHqpBWlEn1UsnbpZjzAY8KX7JSI
         weqg7DfLors+cQNY6XLGZILBPytYGQCc3PBC+YT2SEJol0HK8npVSGVdhVLOX+cz/SMt
         aK67Z3XwqR/lJRXMigTgcCcHMomQJUfdXk9gP9uTXaL6sL5wmWRqynqD1ARIHIfzKw8v
         VZ/+5K9SZjazDh7a8dw9PB97mOFEr8ub8ldeDLCWTjEKGzCBslDfI31rBVcUMPo+lH/y
         VgBg==
X-Forwarded-Encrypted: i=1; AJvYcCXudFhWlG8vfxarrEEUaq25HUVTuW2qJIbMMBYRCfzo7eBeLWYzhazLsrBb8oFr1zFTDlcYOdWPltKuc6P9uqn5I494+dsJ88Z0QP5dOrbD
X-Gm-Message-State: AOJu0YwrkbfNMAHt8gpBin/PGf+EbvFGPnLuJD4zah2mMnopFijQo31B
	KNM3EVz/fIAEKUzHTozwMrmEla8wB1g5hf936CUF/718v6AXB8fQFrddnv+d2ko=
X-Google-Smtp-Source: AGHT+IFHvS3936PWqb9eOOBo7Us0cNxw774lksEfZ3wjvn8w+VLShJLTz+TShTqKy/ncT5mbVPbyOQ==
X-Received: by 2002:a05:600c:354c:b0:418:f770:ba0 with SMTP id i12-20020a05600c354c00b00418f7700ba0mr8123230wmq.0.1714403199360;
        Mon, 29 Apr 2024 08:06:39 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2fec:d20:2b60:e334])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm39646638wms.32.2024.04.29.08.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:06:38 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 07/11] dt-bindings: riscv: add Zcmop ISA extension description
Date: Mon, 29 Apr 2024 17:05:00 +0200
Message-ID: <20240429150553.625165-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429150553.625165-1-cleger@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080641_873501_3B612ECF 
X-CRM114-Status: UNSURE (   9.16  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmNtb3AgKENvbXByZXNzZWQgTWF5LUJlLU9wZXJhdGlv
bnMpIElTQQpleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGluIGNvbW1pdCBjNzMyYTRmMzlh
NCAoIlpjbW9wIGlzCnJhdGlmaWVkLzEuMCIpIG9mIHRoZSByaXNjdi1pc2EtbWFudWFsLgoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpBY2tlZC1i
eTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KLS0tCiAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgICAgICAgIHwgMTIgKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCmlu
ZGV4IDgxYmNlNGZhMjQyNC4uMTk1MmQyMGI4OTk2IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKQEAgLTI1Miw2
ICsyNTIsMTEgQEAgcHJvcGVydGllczoKICAgICAgICAgICAgIG1lcmdlZCBpbiB0aGUgcmlzY3Yt
aXNhLW1hbnVhbCBieSBjb21taXQgZGJjNzljZjI4YTIgKCJJbml0aWFsIHNlZWQKICAgICAgICAg
ICAgIG9mIHpjLmFkb2MgdG8gc3JjIHRyZWUuIikuCiAKKyAgICAgICAgLSBjb25zdDogemNtb3AK
KyAgICAgICAgICBkZXNjcmlwdGlvbjoKKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaY21vcCBl
eHRlbnNpb24gdmVyc2lvbiAxLjAsIGFzIHJhdGlmaWVkIGluIGNvbW1pdAorICAgICAgICAgICAg
YzczMmE0ZjM5YTQgKCJaY21vcCBpcyByYXRpZmllZC8xLjAiKSBvZiB0aGUgcmlzY3YtaXNhLW1h
bnVhbC4KKwogICAgICAgICAtIGNvbnN0OiB6ZmEKICAgICAgICAgICBkZXNjcmlwdGlvbjoKICAg
ICAgICAgICAgIFRoZSBzdGFuZGFyZCBaZmEgZXh0ZW5zaW9uIGZvciBhZGRpdGlvbmFsIGZsb2F0
aW5nIHBvaW50CkBAIC01NDksNiArNTU0LDEzIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICAg
ICAgY29uc3Q6IHpjYQogICAgICAgICAgICAgLSBjb250YWluczoKICAgICAgICAgICAgICAgICBj
b25zdDogZgorICAgICAgIyBaY21vcCBkZXBlbmRzIG9uIFpjYQorICAgICAgLSBpZjoKKyAgICAg
ICAgICBjb250YWluczoKKyAgICAgICAgICAgIGNvbnN0OiB6Y21vcAorICAgICAgICB0aGVuOgor
ICAgICAgICAgIGNvbnRhaW5zOgorICAgICAgICAgICAgY29uc3Q6IHpjYQogCiBhbGxPZjoKICAg
IyBaY2YgZXh0ZW5zaW9uIGRvZXMgbm90IGV4aXN0IG9uIHJ2NjQKLS0gCjIuNDMuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
