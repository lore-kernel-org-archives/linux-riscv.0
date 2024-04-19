Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57365C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TU20SWNImduPs60Kv6JKU/BCPWw87XMrfkuxCpFujqo=; b=kZPMP57VYGLOor
	H9VGb6Hx5edjE2U7N26HnPQEcDpJWfy8AFY8e7w+rLhilzW/J/7M1Oo/5V8CqFFHPMUVowopsvZ5H
	IAvuv4L6515N1VPcK4jbVbxDO7AsInrfWnkRXAjWFTIVGs4X352Lk8kYZIBqJItzzSRqAdALnGDb+
	SAS5VN14s3HMuzLE/buujk9sligoi+x7m3MLcFFrRwSiHyHz7GEsTIAiJUHISSHq3LJd1cXoGKU4B
	qKgXflKEGXJY/tybhezBUhxdRUMYUIgYS+riT8TiQ3WMqD94gPyRIfAmU7lqCZ7vZmAW/KfmnZNkF
	tT89aIXuho89x2CUd7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxogD-00000005pD3-3LYe;
	Fri, 19 Apr 2024 13:53:29 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxogA-00000005pB8-2mO2
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 13:53:28 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-51967f75729so2401719e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 06:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713534803; x=1714139603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vygojg6kK2t93LE6Jccui0sWTwt0Dla9UnPOwn3MABA=;
        b=EqpVD4341UgPm8HoXDFa6bk+/nohjOIe8tGzMQRXH7zL47NHFv4w+ZrzlHWfRZST48
         g01Cl7Gq24zv4/u4H+S5bENTQZJ4Pgl9SMwZ0Yyq0gxdFHuBTXrBS8JNbst3Ule/E7ls
         VA2cv8CvECwnAOLlEXB6JWNgGkja59+T88UCcfgcSwnmK1cUZUCm9T5LAQbUIsySWrPm
         pyE2WZD8kD8QH+Tnvc5sHnvroIt9CY8iS+Mg/fV8miOipt82yzVQICuPwtgqfunNggPh
         VvmuQrkGU7OFuduRUZBw4BfUa3j1vyBX4u380yGrJYUEUPkEGt0h7v+yxY2Y/ymFrhaD
         Dujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713534803; x=1714139603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vygojg6kK2t93LE6Jccui0sWTwt0Dla9UnPOwn3MABA=;
        b=jCFdYjq8epa0vbm/7fuR1XAU9Jb4d1dTUhbxY33A89NHkAIP3Ki/6g8C5CuSp/lUnP
         Qv+k35KPoPn3/xSHaN/HILPCXIgqGnlxjvxXFhncwBPTbFa02cwBNTN2g40ZdewCRNug
         60S0RXENICXQnVINgZm7rMtH8KYJx853z5r2ZgUY1rr/g8BHX/dUBBRGH9v41VH+k6DF
         kjqLOP2vrsASKjYpxtIIvjCy/xI3pbBWAeVFo9cplDdsrD5tmj1yluDh+BJVLcr8Xy+1
         PV0sCtyLJ+rVY1FkPuO2NyMbhHL0MMvHONuH0P7Kf2wr9a0rQ5RECJwMbhFQT6ir6n65
         JJ3w==
X-Gm-Message-State: AOJu0Ywo8b9uZQi7blNnygBPDJoJ7cqfNctLho5+nLb+7E5Qp2Foin1B
	h11HH3OKl6hiT0U5AjyBFwDDzF32y9xIIq/1ZAE8i7jJ0CsgABZuaXYCnmD4FiI0tdiolpHBRrK
	FTDk=
X-Google-Smtp-Source: AGHT+IFFzEV9Mdl8G4cryaHfYH+SN86dJZ7B9fY5aMYsjcaqBCQ0YnmeqoSttiNY9Cm5AgowfnUBMg==
X-Received: by 2002:ac2:5388:0:b0:519:14a2:72da with SMTP id g8-20020ac25388000000b0051914a272damr1453236lfh.67.1713534803347;
        Fri, 19 Apr 2024 06:53:23 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id lj26-20020a170906f9da00b00a5254ec731esm2242648ejb.176.2024.04.19.06.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 06:53:22 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM,
	parri.andrea@gmail.com,
	luxu.kernel@bytedance.com
Subject: [PATCH v2 0/6] riscv: Apply Zawrs when available
Date: Fri, 19 Apr 2024 15:53:22 +0200
Message-ID: <20240419135321.70781-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_065326_899309_697A6313 
X-CRM114-Status: GOOD (  22.39  )
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

WmF3cnMgcHJvdmlkZXMgdHdvIGluc3RydWN0aW9ucyAod3JzLm50byBhbmQgd3JzLnN0byksIHdo
ZXJlIGJvdGggYXJlCm1lYW50IHRvIGFsbG93IHRoZSBoYXJ0IHRvIGVudGVyIGEgbG93LXBvd2Vy
IHN0YXRlIHdoaWxlIHdhaXRpbmcgb24gYQpzdG9yZSB0byBhIG1lbW9yeSBsb2NhdGlvbi4gVGhl
IGluc3RydWN0aW9ucyBhbHNvIGJvdGggd2FpdCBhbgppbXBsZW1lbnRhdGlvbi1kZWZpbmVkICJz
aG9ydCIgZHVyYXRpb24gKHVubGVzcyB0aGUgaW1wbGVtZW50YXRpb24KdGVybWluYXRlcyB0aGUg
c3RhbGwgZm9yIGFub3RoZXIgcmVhc29uKS4gVGhlIGRpZmZlcmVuY2UgaXMgdGhhdCB3aGlsZQp3
cnMuc3RvIHdpbGwgdGVybWluYXRlIHdoZW4gdGhlIGR1cmF0aW9uIGVsYXBzZXMsIHdycy5udG8s
IGRlcGVuZGluZyBvbgpjb25maWd1cmF0aW9uLCB3aWxsIGVpdGhlciBqdXN0IGtlZXAgd2FpdGlu
ZyBvciBhbiBJTEwgZXhjZXB0aW9uIHdpbGwgYmUKcmFpc2VkLiBMaW51eCB3aWxsIHVzZSB3cnMu
bnRvLCBzbyBpZiBwbGF0Zm9ybXMgaGF2ZSBhbiBpbXBsZW1lbnRhdGlvbgp3aGljaCBmYWxscyBp
biB0aGUgImp1c3Qga2VlcCB3YWl0aW5nIiBjYXRlZ29yeSwgdGhlbiBpdCBzaG91bGQgX25vdF8K
YWR2ZXJ0aXNlIFphd3JzIGluIHRoZSBoYXJkd2FyZSBkZXNjcmlwdGlvbi4gVGV4dCB0byB0aGF0
IGVmZmVjdCBoYXMKYmVlbiBhZGRlZCB0byB0aGUgWmF3cnMgRFQgZGVmaW5pdGlvbi4KCkxpa2Ug
d2ZpIChhbmQgd2l0aCB0aGUgc2FtZSB7bSxofXN0YXR1cyBiaXRzIHRvIGNvbmZpZ3VyZSBpdCks
IHdoZW4Kd3JzLm50byBpcyBjb25maWd1cmVkIHRvIHJhaXNlIGV4Y2VwdGlvbnMgaXQncyBleHBl
Y3RlZCB0aGF0IHRoZSBoaWdoZXIKcHJpdmlsZWdlIGxldmVsIHdpbGwgc2VlIHRoZSBpbnN0cnVj
dGlvbiB3YXMgYSB3YWl0IGluc3RydWN0aW9uLCBkbwpzb21ldGhpbmcsIGFuZCB0aGVuIHJlc3Vt
ZSBleGVjdXRpb24gZm9sbG93aW5nIHRoZSBpbnN0cnVjdGlvbi4gRm9yCmV4YW1wbGUsIEtWTSBk
b2VzIGNvbmZpZ3VyZSBleGNlcHRpb25zIGZvciB3ZmkgKGhzdGF0dXMuVlRXPTEpIGFuZAp0aGVy
ZWZvcmUgYWxzbyBmb3Igd3JzLm50by4gS1ZNIGRvZXMgdGhpcyBmb3Igd2ZpIHNpbmNlIGl0J3Mg
YmV0dGVyIHRvCmFsbG93IG90aGVyIHRhc2tzIHRvIGJlIHNjaGVkdWxlZCB3aGlsZSBhIFZDUFUg
d2FpdHMgZm9yIGFuIGludGVycnVwdC4KRm9yIHdhaXRzIHN1Y2ggYXMgdGhvc2Ugd2hlcmUgd3Jz
Lm50by9zdG8gd291bGQgYmUgdXNlZCwgd2hpY2ggYXJlCnR5cGljYWxseSBsb2NrcywgaXQgaXMg
YWxzbyBhIGdvb2QgaWRlYSBmb3IgS1ZNIHRvIGJlIGludm9sdmVkLCBhcyBpdApjYW4gYXR0ZW1w
dCB0byBzY2hlZHVsZSB0aGUgbG9jayBob2xkaW5nIFZDUFUuCgpUaGlzIHNlcmllcyBzdGFydHMg
d2l0aCBDaHJpc3RvcGgncyBhZGRpdGlvbiBvZiByaXNjdiBzbXBfY29uZF9sb2FkKgpmdW5jdGlv
bnMgd2hpY2ggYXBwbHkgd3JzLnN0byB3aGVuIGF2YWlsYWJsZS4gVGhhdCBwYXRjaCBoYXMgYmVl
bgpyZXdvcmtlZCB0byB1c2Ugd3JzLm50byBhbmQgdG8gdXNlIHRoZSBzYW1lIGFwcHJvYWNoIGFz
IEFybSBmb3IgdGhlCndhaXQgbG9vcCwgc2luY2Ugd2UgY2FuJ3QgaGF2ZSBhcmJpdHJhcnkgQyBj
b2RlIGJldHdlZW4gdGhlIGxvYWQtCnJlc2VydmVkIGFuZCB0aGUgd3JzLiBUaGVuLCBod3Byb2Jl
IHN1cHBvcnQgaXMgYWRkZWQgKHNpbmNlIHRoZQppbnN0cnVjdGlvbnMgYXJlIGFsc28gdXNhYmxl
IGZyb20gdXNlcm1vZGUpLCBhbmQgZmluYWxseSBLVk0gaXMKdGF1Z2h0IGFib3V0IHdycy5udG8s
IGFsbG93aW5nIGd1ZXN0cyB0byBzZWUgYW5kIHVzZSB0aGUgWmF3cnMKZXh0ZW5zaW9uLgoKV2Ug
c3RpbGwgZG9uJ3QgaGF2ZSB0ZXN0IHJlc3VsdHMgZnJvbSBoYXJkd2FyZSwgYW5kIGl0J3Mgbm90
IHBvc3NpYmxlIHRvCnByb3ZlIHRoYXQgdXNpbmcgWmF3cnMgaXMgYSB3aW4gd2hlbiB0ZXN0aW5n
IG9uIFFFTVUsIG5vdCBldmVuIHdoZW4Kb3ZlcnN1YnNjcmliaW5nIFZDUFVzIHRvIGd1ZXN0cy4g
SG93ZXZlciwgaXQgaXMgcG9zc2libGUgdG8gdXNlIEtWTQpzZWxmdGVzdHMgdG8gZm9yY2UgYSBz
Y2VuYXJpbyB3aGVyZSB3ZSBjYW4gcHJvdmUgWmF3cnMgZG9lcyBpdHMgam9iIGFuZApkb2VzIGl0
IHdlbGwuIFs0XSBpcyBhIHRlc3Qgd2hpY2ggZG9lcyB0aGlzIGFuZCwgb24gbXkgbWFjaGluZSwg
d2l0aG91dApaYXdycyBpdCB0YWtlcyAxNiBzZWNvbmRzIHRvIGNvbXBsZXRlIGFuZCB3aXRoIFph
d3JzIGl0IHRha2VzIDAuMjUKc2Vjb25kcy4KClRoaXMgc2VyaWVzIGlzIGFsc28gYXZhaWxhYmxl
IGhlcmUgWzFdLiBJbiBvcmRlciB0byB1c2UgUUVNVSBmb3IgdGVzdGluZwphIGJ1aWxkIHdpdGgg
WzJdIGlzIG5lZWRlZC4gSW4gb3JkZXIgdG8gZW5hYmxlIGd1ZXN0cyB0byB1c2UgWmF3cnMgd2l0
aApLVk0gdXNpbmcga3ZtdG9vbCwgdGhlIGJyYW5jaCBhdCBbM10gbWF5IGJlIHVzZWQuCgpbMV0g
aHR0cHM6Ly9naXRodWIuY29tL2pvbmVzLWRyZXcvbGludXgvY29tbWl0cy9yaXNjdi96YXdycy12
Mi8KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDMxMjE1MjkwMS41MTIwMDEt
Mi1ham9uZXNAdmVudGFuYW1pY3JvLmNvbS8KWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9qb25lcy1k
cmV3L2t2bXRvb2wvY29tbWl0cy9yaXNjdi96YXdycy8KWzRdIGh0dHBzOi8vZ2l0aHViLmNvbS9q
b25lcy1kcmV3L2xpbnV4L2NvbW1pdC85MzExNzAyYmNkMTE4YmRiZmE4YjliZTRhOGVjMzU1YzQw
NTU5NDk5CgpUaGFua3MsCmRyZXcKCnYyOgogLSBBZGRlZCBEVCBiaW5kaW5ncyBwYXRjaCB3aXRo
IGFkZGl0aW9uYWwgTGludXggc3BlY2lmaWNhdGlvbnMgZHVlCiAgIHRvIHdycy5udG8gcG90ZW50
aWFsbHkgbmV2ZXIgdGVybWluYXRpbmcsIGFzIHN1Z2dlc3RlZCBieSBQYWxtZXIKIC0gQWRkZWQg
cGF0Y2ggdG8gc2hhcmUgcGF1c2UgaW5zbiBkZWZpbml0aW9uCiAtIFJld29yayBtYWluIFphd3Jz
IHN1cHBvcnQgcGF0Y2ggdG8gdXNlIEFybSBhcHByb2FjaCAod2hpY2ggaXMKICAgYWxzbyB0aGUg
YXBwcm9hY2ggdGhhdCBBbmRyZWEgUGFycmkgc3VnZ2VzdGVkKQogLSBEcm9wcGVkIHRoZSByaXNj
diBpbXBsZW1lbnRhdGlvbiBvZiBzbXBfY29uZF9sb2FkX2FjcXVpcmUoKS4KICAgYWZhaWN0LCB0
aGUgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiwgd2hpY2ggd2lsbCB1c2UgdGhlIHJpc2N2CiAgIGlt
cGxlbWVudGF0aW9uIG9mIHNtcF9jb25kX2xvYWRfcmVsYXhlZCgpIGlzIHN1ZmZpY2llbnQgZm9y
IHJpc2N2LgogLSBUaGUgcmV3b3JrIHdhcyBsYXJnZSBlbm91Z2ggKElNTykgdG8gZHJvcCBIZWlr
bydzIHMtby1iIGFuZCB0bwogICBhZGQgbXlzZWxmIGFzIGEgY28tZGV2ZWxvcGVyCgoKQW5kcmV3
IEpvbmVzICg1KToKICByaXNjdjogUHJvdmlkZSBhIGRlZmluaXRpb24gZm9yICdwYXVzZScKICBk
dC1iaW5kaW5nczogcmlzY3Y6IEFkZCBaYXdycyBJU0EgZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCiAg
cmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBaYXdycyBJU0EgZXh0ZW5zaW9uCiAgS1ZNOiByaXNjdjog
U3VwcG9ydCBndWVzdCB3cnMubnRvCiAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgWmF3cnMg
ZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0CgpDaHJpc3RvcGggTcO8bGxuZXIgKDEpOgog
IHJpc2N2OiBBZGQgWmF3cnMgc3VwcG9ydCBmb3Igc3BpbmxvY2tzCgogRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0ICAgICAgICAgIHwgIDQgKysKIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDEyICsrKysrCiBhcmNoL3Jpc2N2L0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyMCArKysrKy0tLQogYXJjaC9yaXNjdi9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgLS0KIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vYmFycmllci5oICAgICAgICAgICAgICB8IDQ1ICsrKysrKysrKystLS0tLS0KIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oICAgICAgICAgICAgICB8IDUxICsrKysrKysr
KysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgICAgICAgICAg
ICB8ICAxICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi1kZWYuaCAgICAgICAgICAgICB8
ICA0ICsrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggICAgICAgICAgICAgfCAg
MSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmggICAgICAgfCAgOCAr
LS0KIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAgICAgICB8ICAxICsK
IGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICAgICB8ICAxICsKIGFy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gv
cmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHVfaW5zbi5jICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKwogYXJjaC9yaXNj
di9rdm0vdmNwdV9vbmVyZWcuYyAgICAgICAgICAgICAgICAgIHwgIDIgKwogLi4uL3NlbGZ0ZXN0
cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgICAgICAgIHwgIDQgKysKIDE4IGZpbGVzIGNoYW5n
ZWQsIDE0NCBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKCi0tIAoyLjQ0LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
