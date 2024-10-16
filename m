Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11298D20686
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 00:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P5IOqN58S80MU1kIrSGLY4pXyKMB0Pm2h1JQkBBP9Ik=; b=5Bds38ccVfJoGj
	JstuB0FNPItWHu0A2ZZ+dVJPZvbzxyBZYWZyyo4pWY+Zz/EvsIuA0hht0lFh2wEA9qN4FcsZmRFQ5
	bgXeVOASE5V+3r14R15zjKZ7Z1t4w6P7A9EumZqPQgBi21JNvzv2uN8RrsGRKwFe0i3tlsMpqWMi6
	4Hp7YQOdS+v8w2xRRw55F3LihKJsjBUz5HwcWhc+fRbJlg/Q9NO5Z/EwmqhBZG1YqoaaaZVlvv921
	IO4MWC1skvfSANwF8IJrcgYVdN8kKGfVtdqgNzhSebaAXe0wXw5ycQPtysosYUVkHSyDmy9u93t1t
	6HDPWlbHF8dlPGu5mbGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0rkz-00000009zeX-3A3I;
	Wed, 16 Oct 2024 00:19:17 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0rkx-00000009zeC-085A
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 00:19:16 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-27beb2496f4so1594578fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 17:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729037953; x=1729642753; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=05Y/2FGPgyvbyYFbGsJUnsosQK0HSJiBFrb2Qq6aVrA=;
        b=ZSenheQGm49sg18HEQ31HureBdhS7YYLi//mAzYR4EI2O9F2PtxThS5fEhotzmt0Ye
         rImoXT9bT4j0i8ubvMcq+CnyaaiZkuPkwctJlyhBlz7dU6RlK868PhggY3tzSQ+ZRHGc
         Irllz/3ADdEqiAQrNe3OcXzurVC0OBd2gnH81F9lRZi3hRofnmcazjwQzvJYm4jUzmgq
         LdhS1JYpSa+mHTIgk94vLzpjDlwQFwGBRXsm4b9hfPzfelUVIykUMUB6JE9pB18DRQu+
         P74ri3aoubK7McpI27Vni/08+52ImrkkWAEcDNRBVLMKHUqb7apR8F+12fn9lBSNEqyc
         sD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729037953; x=1729642753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05Y/2FGPgyvbyYFbGsJUnsosQK0HSJiBFrb2Qq6aVrA=;
        b=mLHgJ9v0s850/OQl/wv4XvsUBB/QE3XO9cnReLGc3l5KISUlp1sjNF8KdVHvdLwYiU
         Af5M99k10D3aVLx0Pllr4KSpmNKkJb6seq6E5+uk+UzecDsfyJFCIz+6Ck0sVtXUzbrW
         WqJmp1FHXS6jSlF5V1pyYcvJSzo7vw5qIO30BejzRMNONgAp3VleEzYd+nWaGkVB8gar
         8bz6Fg5z3WhqSJpSaByH/rXsZAPQFYITjg6e34MBizbySOUYzhgxtQ9XwxMP3i36iqkZ
         GM+3eZF32fO55mnqVVVl/FSwH1HENxUYg1NbRQGIUZzBV1K1OTQD0a5vSKEP9wxnIXFK
         GHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhnhEi90vyD1jAYjnQ33UKbH0iNxj15h3dLWpQtGkFwtO4oGbS8lqac6sNF643Is+o1s0cj89GewLURA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKn8TgjSOxrcu+xvb73OAi8KmSS07RTjtZm+FC/xmrZZ+1/U4w
	klTDuSnS8ct+OzQk+cy7GEHap4xcxQL0FNrj0s3De5IeAvgEcPCB
X-Google-Smtp-Source: AGHT+IE9HgCJhRnWQptiUjrKLZ5T1fYrbMbRfHuh8vb+zUtRxBOmbU+I5UJ/VxKiwNcLxD7n/D+MFA==
X-Received: by 2002:a05:687c:2c0f:b0:25e:940:e934 with SMTP id 586e51a60fabf-288874e3a90mr6210798fac.47.1729037953127;
        Tue, 15 Oct 2024 17:19:13 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-288daddf03csm621459fac.36.2024.10.15.17.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 17:19:11 -0700 (PDT)
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
Subject: [PATCH v4 0/3] pwm: Add pwm driver for Sophgo SG2042
Date: Wed, 16 Oct 2024 08:19:03 +0800
Message-Id: <cover.1729037302.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_171915_098632_BBC92E9A 
X-CRM114-Status: GOOD (  12.34  )
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
CgpDaGFuZ2VzIGluIHY0OgogIFRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdjYuMTItcmMx
LgoKICBVcGRhdGVkIGRyaXZlciB0byBzZXQgcHJvcGVydHkgYXRvbWljIG9mIHB3bV9jaGlwIHRv
IHRydWUgYXMgcGVyIHN1Z2dlc3Rpb24KICBmcm9tIFNlYW4uCgpDaGFuZ2VzIGluIHYzOgogIFRo
ZSBwYXRjaCBzZXJpZXMgaXMgY2F0Y2hlZCB1cCB3aXRoIHY2LjEyLXJjMS4gWW91IGNhbiBzaW1w
bHkgcmV2aWV3IG9yIHRlc3QKICB0aGUgcGF0Y2hlcyBhdCB0aGUgbGluayBbM10uCgogIEFkZCBw
YXRjaCAjMyBmb3IgZHRzIHBhcnQgY2hhbmdlLgoKQ2hhbmdlcyBpbiB2MjoKICBUaGUgcGF0Y2gg
c2VyaWVzIGlzIGJhc2VkIG9uIHY2LjExLXJjNi4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9yIHRl
c3QgdGhlCiAgcGF0Y2hlcyBhdCB0aGUgbGluayBbMl0uCgogIEZpeGVkIGZvbGxvd2luZyBpc3N1
ZXMgYXMgcGVyIGNvbW1lbnRzIGZyb20gWWl4dW4gTGFuLCBLcnp5c3p0b2YgS296bG93c2tpCiAg
YW5kIFV3ZSBLbGVpbmUtS8O2bmlnLCB0aGFua3MuCgogIC0gU29tZSBtaW5vciBpc3N1ZXMgaW4g
ZHQtYmluZGluZ3MuCiAgLSBkcml2ZXIgaXNzdWVzLCB1c2UgbWFjcm9zIHdpdGggbmFtZSBwcmVm
aXggZm9yIHJlZ2lzdGVycyBhY2Nlc3M7IGFkZAogICAgbGltaXRhdGlvbnMgY29tbWVudHM7IGZp
eGVkIHBvdGVudGlhbCBjYWxjdWxhdGlvbiBvdmVyZmxvdyBwcm9ibGVtOwogICAgYWRkIC5nZXRf
c3RhdGUoKSBjYWxsYmFjayBhbmQgb3RoZXIgbWlzY2VsbGFuZW91cyBjb2RlIGltcHJvdmVtZW50
cy4KCkNoYW5nZXMgaW4gdjE6CiAgVGhlIHBhdGNoIHNlcmllcyBpcyBiYXNlZCBvbiB2Ni4xMS1y
YzYuIFlvdSBjYW4gc2ltcGx5IHJldmlldyBvciB0ZXN0IHRoZQogIHBhdGNoZXMgYXQgdGhlIGxp
bmsgWzFdLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvY292ZXIu
MTcyNTUzNjg3MC5naXQudW5pY29ybl93YW5nQG91dGxvb2suY29tLyBbMV0KTGluazogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvY292ZXIuMTcyNTkzMTc5Ni5naXQudW5pY29y
bl93YW5nQG91dGxvb2suY29tLyBbMl0KTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcmlzY3YvY292ZXIuMTcyODM1NTk3NC5naXQudW5pY29ybl93YW5nQG91dGxvb2suY29tLyBb
M10KLS0tCgpDaGVuIFdhbmcgKDMpOgogIGR0LWJpbmRpbmdzOiBwd206IHNvcGhnbzogYWRkIFBX
TSBjb250cm9sbGVyIGZvciBTRzIwNDIKICBwd206IHNvcGhnbzogYWRkIGRyaXZlciBmb3IgU29w
aGdvIFNHMjA0MiBQV00KICByaXNjdjogc29waGdvOiBkdHM6IGFkZCBwd20gY29udHJvbGxlciBm
b3IgU0cyMDQyIFNvQwoKIC4uLi9iaW5kaW5ncy9wd20vc29waGdvLHNnMjA0Mi1wd20ueWFtbCAg
ICAgICB8ICA1MSArKysrKwogYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kg
ICAgICAgIHwgICA4ICsKIGRyaXZlcnMvcHdtL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAxMCArCiBkcml2ZXJzL3B3bS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKwogZHJpdmVycy9wd20vcHdtLXNvcGhnby1zZzIwNDIuYyAgICAgICAgICAgICAg
IHwgMTgxICsrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAyNTEgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9wd20vc29waGdvLHNnMjA0Mi1wd20ueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
cHdtL3B3bS1zb3BoZ28tc2cyMDQyLmMKCgpiYXNlLWNvbW1pdDogOTg1MmQ4NWVjOWQ0OTJlYmVm
NTZkYzVmMjI5NDE2YzkyNTc1OGVkYwotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
