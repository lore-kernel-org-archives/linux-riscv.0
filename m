Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBEBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yg6lkq4sD0lfmWFtDfzHOTGlMs06dOAPyv63xMr3GKs=; b=QyBFKQ3rMvSUTh
	6VqKOdLb/6/uVZnyN4AnneTw+HYsGXwIf8w5ND/YYXuAUKYtrwXiYnYUtpxc/OhS/g/gkhw1sGPj+
	rIXDvJPom8N5NkAXfv7S7+CMsjuX5QnO5aXv71hsGVd63N+CwuBSB7edpmswgc8DeU2aOH/CFphZt
	Lif0Wr8CHLw3QvsAJFqoE9rorFhu5eHsiNcJIsu/DORCHWU1qP5+S/6FW0HyKbg+NL6A8LrEhveXL
	4I06m+z07J9Ku9yMCnEB8xfmloXMPEvXyyvYcmsdMCZnh1+LM4oPQC+GjzapWYOAHPN2HDRAL6c7j
	J2icWirRdaBqLJcroW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uB0-00G9GG-0Q;
	Tue, 14 Nov 2023 14:14:02 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAp-00G91n-3A
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:56 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-77891670417so55612185a.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971228; x=1700576028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CepaQtX/sdwhUbmZetc41QOoUE9LfFVWHL973vxJ7UQ=;
        b=xzC6Q3vEcCKGEYmijeX5piZuYXOA0rGO0TqqwJYEqAd7DxtSstR/T5qUKIMV024W/6
         cXr1epYDd86n7D0goeJsvE4w4kaFNafdeH4gMonwGuF4tqR70d1KZ2ngrOLSap6dA7Vf
         qqW7oodzJK5ykbJlKeFcH+PZZlYzZ8KMndb8HKCjziacTxJQ8dPls6/CgG75gn2N3QZZ
         HEka4mZZR61SboU25Xv8gNCFBPwStR4PZV43TdyCuLZ/qMEI/bVCljB+sF6RT7jOCdZ9
         fgQL91/V9P9YVkgU9hGp0PPcQfgCY/y8y2O2PkXyC/b+OY+y4jPeiigsKxKJmkgfNyNR
         1l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971228; x=1700576028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CepaQtX/sdwhUbmZetc41QOoUE9LfFVWHL973vxJ7UQ=;
        b=tKMJrKDhf1wEpdIibsbE4zhZmyzC2E1492aIpHUs+owyKhwELOE6X7oz3Rsg4/hBGE
         Qdr7rkfyIqHdXjtvVfprERdmwTxcp4Q0gNNMkobUPdpBvfLyuK59ERK6UNZXlLB4AyPR
         Fs3bS4pol3iYl+Ups1+rhYavMggGz/FYPqjBP99CW5XO3MX/M4tjo6yPQXC8eN+W7CXC
         HFAsJmWzPR+tTLQiezx23Nvnq8DM3gzcDSX9Xdea2ZmOfDt/3YUvVTF7yHYRx4yaNi1Y
         nJ9HOgp7Zaca2lWINRsJEkaqZoGGDnLcPaN8oPUgsFsItNuK4oMJmnGgKjo12/vbNgS1
         wdWg==
X-Gm-Message-State: AOJu0Yza0IB2c13PGi41X+guKWm7DBNI9/tQ8qFcJZihvbYyf9WETqkp
	HlDsRn6pQy+j3ylRXpa5qqjtJIFKTSArUU8S2iI02Q==
X-Google-Smtp-Source: AGHT+IF7WevyrXd//n4lH0ZEXB0TDnFlHM3i203ryiy76OKa7Bcf589Sc/lKHJHt3RYWXfpjbdBHtw==
X-Received: by 2002:a05:620a:31a8:b0:77a:69a1:b6a3 with SMTP id bi40-20020a05620a31a800b0077a69a1b6a3mr3097387qkb.1.1699971228077;
        Tue, 14 Nov 2023 06:13:48 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:47 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 12/20] riscv: add ISA extension parsing for Zihintntl
Date: Tue, 14 Nov 2023 09:12:48 -0500
Message-ID: <20231114141256.126749-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061352_060079_C1BA0D14 
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

QWRkIHBhcnNpbmcgZm9yIFppaGludG50bCBJU0EgZXh0ZW5zaW9uWzFdIHRoYXQgd2FzIHJhdGlm
aWVkIGluIGNvbW1pdAowZGM5MWY1ICgiWmloaW50bnRsIGlzIHJhdGlmaWVkIikgb2YgcmlzY3Yt
aXNhLW1hbnVhbFsyXS4KCkxpbms6IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMTNf
d3NOOFltUmZIOFlXeXNGeVRYLURqVGtDbkJkOWhqL3ZpZXcgWzFdCkxpbms6IGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsL2NvbW1pdC8wZGM5MWY1MDVlNmQgWzJdClNp
Z25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3
ZWQtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAu
aAppbmRleCA2YTZlZTkzYTNjOWEuLjk3ZDEwNmZhMGY1NCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAu
aApAQCAtODAsNiArODAsNyBAQAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS1QJCTY1CiAjZGVm
aW5lIFJJU0NWX0lTQV9FWFRfWkZICQk2NgogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pGSE1JTgkJ
NjcKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUhJTlROVEwJCTY4CiAKICNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9NQVgJCTEyOAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX0lOVkFMSUQJCVUzMl9NQVgK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCA3MTgyY2YyNzhiMWMuLmU3M2VlNGNmZDg0YSAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMjU2LDYgKzI1Niw3IEBAIGNvbnN0IHN0cnVjdCByaXNj
dl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewogCV9fUklTQ1ZfSVNBX0VYVF9EQVRB
KHppY29uZCwgUklTQ1ZfSVNBX0VYVF9aSUNPTkQpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpp
Y3NyLCBSSVNDVl9JU0FfRVhUX1pJQ1NSKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWZlbmNl
aSwgUklTQ1ZfSVNBX0VYVF9aSUZFTkNFSSksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50
bnRsLCBSSVNDVl9JU0FfRVhUX1pJSElOVE5UTCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemlo
aW50cGF1c2UsIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UpLAogCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHppaHBtLCBSSVNDVl9JU0FfRVhUX1pJSFBNKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6
ZmgsIFJJU0NWX0lTQV9FWFRfWkZIKSwKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
