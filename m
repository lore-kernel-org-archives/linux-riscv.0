Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE689E7716C
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 03:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zXLE0G9/gA7tYCG1W4uX3dKJPCdH9f2KyrUHLs4Clgk=; b=49GyDMnzHQr8RT
	uyC5WZOnvzuYzo2WF9207nZeqQo1vF87JPJrWF9LXjbvVdOg/e4l1Cmuh8dw95Eo3z7VQSVZrjX2W
	W/y2J5hCTNVTqxQu/eRBQrwzQfv5KGsTdVj3AXPIlDI4NTqeezBegfQKQSomhBCgRIFt9BaHA23Ib
	PVlZ7UAM+RjvWOLp2FDjGE+KmiwbJRPcUTB+NShquVxl5NArgX6zHocwii+yuIGHCdlUL4zbtY+18
	XIhpR6zdMfHVIDtwB4xDWCtbvgbqAT/bIQVJdtGvRRWbh/PSK/7LGUq+VaTVmlZYmKyAwPZ3ipHSu
	B2lAH21WjUJ7fX4sGZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfs2-0000000BMOs-2C6y;
	Wed, 04 Dec 2024 03:16:10 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIfrz-0000000BMOO-1VYH
	for linux-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 03:16:09 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-71d51a9a42bso2913424a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Dec 2024 19:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733282166; x=1733886966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GOyvms7hCiUGAh/zJ3IBHgfljifBo6gdOG9XI1OMWo4=;
        b=OOq6g4g1LnvkKQv8nQxJQEe/tmrAzDhlO/1H43hZf1OdzaybmZ2I/b9xpezjR2z0Ia
         wLWzfMUUDhtbjoYVzFIsx7WHMJu3qzsFGW0mCjCqcpvpWiVReQBXB147VLlXGyqMBlge
         CmVwGCdddIpQHI5eucGgfuYboUDbgLxaD/4jnpWvUXpKQ5n8xiwS8M0gpcvkpGSILs2M
         kkUXZqdCxGiY0nNLeuAFh8SPEQDxc5dFoK5y0Q9IetJXcG0271n9DIbIMDZZks0tZuzi
         gTGSpwkEpKMlgVQeKow1oXBCVSWZ9wcZmykRhz7pN0vox+CPcUEpQao/aRFDtX3ENzcu
         +AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733282166; x=1733886966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GOyvms7hCiUGAh/zJ3IBHgfljifBo6gdOG9XI1OMWo4=;
        b=W3LiCWtYbe8PGBQPVMZboPj1ptm4BzTJtVrf92fBMCLOr96OqgYMqKzK59QFnRrL4Q
         IEkhcjYLIkLN6bTj7CrXU3sATDtjjrYYEXExeXlZ/tvR/zM6BeJEU/KMkvRhyey1h3Vq
         qggII2t3VmllEQev3vwOEEIJHVMlXMU1zVYBZHjIZaz0/u/IYz4MTMuPwH1zzLhNMDtt
         xZArX/yfyEmeEzfe6tNHk1rOtQoH2pE4GGOhfKPc95jAI+I8St3LOtC4zo/d24hPx2Mq
         RWLE0RKn5c3eIPihVFDiwWDZKAtOTPgnMmdnMLEV1k/fR5ridoCrmeYUxzaiKz6Rg6O4
         AQvg==
X-Forwarded-Encrypted: i=1; AJvYcCWnwE8todrGjmgGAqlxH30IS6NWZFw9rgjlelfp0yOrrs+jbsbn+WCbNeFqh5/KWDFKJeWXJZhtS3f5cA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ3Gocco/EHoZggxbwAx9RDS5yttDTdLFa1EEKubYzB8sePCKC
	S5eLnrDapy9ITUw1+r9QMt5kk+Nmjsjv0d5tai4HlNuSACaCAH2i
X-Gm-Gg: ASbGncv5VMJQXxv0ZBYmIoU0fslW1gp+nP20Yb027gUH2TBnp7khKyCJHiuPYub8NxJ
	qf4x1fCigF0NEQS6YkPVgtt7NKOhLuylQGsNu5IOc68hFx5DCpB70RStZLgtfQlmzhA9CR0tfAi
	jN1ZJr3/uo9VU3cz7jCwXW8wFqY6TDm9RzqNS7d5UeqLXnXDhQ8r/vjKOcShaQfZqAvWRa4KdXM
	eN6W71by48SvElrJulOaGVlwwzeoj4xUjJB5/kFZ2qT95OuVZxlX46QBJG3
X-Google-Smtp-Source: AGHT+IGruAdiQPp09SpGfoGobfJWtTNsSSBjp4bjL5mMGSCMPas6X73eLs63ILdcIFlTnNfvmn+huw==
X-Received: by 2002:a05:6830:490a:b0:71d:4624:3f55 with SMTP id 46e09a7af769-71dad606dd5mr4547915a34.6.1733282165754;
        Tue, 03 Dec 2024 19:16:05 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71d7c820850sm2799340a34.73.2024.12.03.19.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 19:16:04 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH v6 0/3] pwm: Add pwm driver for Sophgo SG2042
Date: Wed,  4 Dec 2024 11:15:55 +0800
Message-Id: <cover.1733281657.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_191607_397257_9E657C6A 
X-CRM114-Status: GOOD (  12.30  )
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

RnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+CgpBZGQgZHJpdmVyIGZv
ciBwd20gY29udHJvbGxlciBvZiBTb3BoZ28gU0cyMDQyIFNvQy4KClRoYW5rcywKQ2hlbgoKLS0t
CgpDaGFuZ2VzIGluIHY2OgogIE5vdGhpbmcgbWFqb3IgY2hhbmdlcyBqdXN0IHJlYmFzZWQgb250
byB2Ni4xMy1yYzEgYW5kIHJldGVzdGVkLgoKQ2hhbmdlcyBpbiB2NToKICBUaGUgcGF0Y2ggc2Vy
aWVzIGlzIGJhc2VkIG9uIHY2LjEyLXJjMS4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9yIHRlc3QK
ICB0aGUgcGF0Y2hlcyBhdCB0aGUgbGluayBbNV0uCgogIFVwZGF0ZWQgZHJpdmVyIHRvIGFkZCBy
ZXNldHMgcHJvcGVydHkgZm9yIHB3bSBjb250cm9sbGVyIG5vZGUgYXMgcGVyCiAgc3VnZ2VzdGlv
biBmcm9tIElub2NoaS4KCkNoYW5nZXMgaW4gdjQ6CiAgVGhlIHBhdGNoIHNlcmllcyBpcyBiYXNl
ZCBvbiB2Ni4xMi1yYzEuIFlvdSBjYW4gc2ltcGx5IHJldmlldyBvciB0ZXN0CiAgdGhlIHBhdGNo
ZXMgYXQgdGhlIGxpbmsgWzRdLgoKICBVcGRhdGVkIGRyaXZlciB0byBzZXQgcHJvcGVydHkgYXRv
bWljIG9mIHB3bV9jaGlwIHRvIHRydWUgYXMgcGVyIHN1Z2dlc3Rpb24KICBmcm9tIFNlYW4uCgpD
aGFuZ2VzIGluIHYzOgogIFRoZSBwYXRjaCBzZXJpZXMgaXMgY2F0Y2hlZCB1cCB3aXRoIHY2LjEy
LXJjMS4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9yIHRlc3QKICB0aGUgcGF0Y2hlcyBhdCB0aGUg
bGluayBbM10uCgogIEFkZCBwYXRjaCAjMyBmb3IgZHRzIHBhcnQgY2hhbmdlLgoKQ2hhbmdlcyBp
biB2MjoKICBUaGUgcGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjExLXJjNi4gWW91IGNhbiBz
aW1wbHkgcmV2aWV3IG9yIHRlc3QgdGhlCiAgcGF0Y2hlcyBhdCB0aGUgbGluayBbMl0uCgogIEZp
eGVkIGZvbGxvd2luZyBpc3N1ZXMgYXMgcGVyIGNvbW1lbnRzIGZyb20gWWl4dW4gTGFuLCBLcnp5
c3p0b2YgS296bG93c2tpCiAgYW5kIFV3ZSBLbGVpbmUtS8O2bmlnLCB0aGFua3MuCgogIC0gU29t
ZSBtaW5vciBpc3N1ZXMgaW4gZHQtYmluZGluZ3MuCiAgLSBkcml2ZXIgaXNzdWVzLCB1c2UgbWFj
cm9zIHdpdGggbmFtZSBwcmVmaXggZm9yIHJlZ2lzdGVycyBhY2Nlc3M7IGFkZAogICAgbGltaXRh
dGlvbnMgY29tbWVudHM7IGZpeGVkIHBvdGVudGlhbCBjYWxjdWxhdGlvbiBvdmVyZmxvdyBwcm9i
bGVtOwogICAgYWRkIC5nZXRfc3RhdGUoKSBjYWxsYmFjayBhbmQgb3RoZXIgbWlzY2VsbGFuZW91
cyBjb2RlIGltcHJvdmVtZW50cy4KCkNoYW5nZXMgaW4gdjE6CiAgVGhlIHBhdGNoIHNlcmllcyBp
cyBiYXNlZCBvbiB2Ni4xMS1yYzYuIFlvdSBjYW4gc2ltcGx5IHJldmlldyBvciB0ZXN0IHRoZQog
IHBhdGNoZXMgYXQgdGhlIGxpbmsgWzFdLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvY292ZXIuMTcyNTUzNjg3MC5naXQudW5pY29ybl93YW5nQG91dGxvb2suY29t
LyBbMV0KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvY292ZXIuMTcy
NTkzMTc5Ni5naXQudW5pY29ybl93YW5nQG91dGxvb2suY29tLyBbMl0KTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvY292ZXIuMTcyODM1NTk3NC5naXQudW5pY29ybl93
YW5nQG91dGxvb2suY29tLyBbM10KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvY292ZXIuMTcyOTAzNzMwMi5naXQudW5pY29ybl93YW5nQG91dGxvb2suY29tLyBbNF0K
TGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvY292ZXIuMTcyOTg0MzA4
Ny5naXQudW5pY29ybl93YW5nQG91dGxvb2suY29tLyBbNV0KLS0tCgpDaGVuIFdhbmcgKDMpOgog
IGR0LWJpbmRpbmdzOiBwd206IHNvcGhnbzogYWRkIFBXTSBjb250cm9sbGVyIGZvciBTRzIwNDIK
ICBwd206IHNvcGhnbzogYWRkIGRyaXZlciBmb3IgU29waGdvIFNHMjA0MiBQV00KICByaXNjdjog
c29waGdvOiBkdHM6IGFkZCBwd20gY29udHJvbGxlciBmb3IgU0cyMDQyIFNvQwoKIC4uLi9iaW5k
aW5ncy9wd20vc29waGdvLHNnMjA0Mi1wd20ueWFtbCAgICAgICB8ICA1OCArKysrKysKIGFyY2gv
cmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpICAgICAgICB8ICAgOSArCiBkcml2ZXJz
L3B3bS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgKwogZHJpdmVycy9w
d20vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvcHdt
L3B3bS1zb3BoZ28tc2cyMDQyLmMgICAgICAgICAgICAgICB8IDE5NCArKysrKysrKysrKysrKysr
KysKIDUgZmlsZXMgY2hhbmdlZCwgMjcyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3NvcGhnbyxzZzIwNDItcHdt
LnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3B3bS9wd20tc29waGdvLXNnMjA0Mi5j
CgoKYmFzZS1jb21taXQ6IDQwMzg0Yzg0MGVhMTk0NGQ3YzVhMzkyZTg5NzVlZDA4OGVjZjBiMzcK
LS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
