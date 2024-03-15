Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7530C54E67
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 13:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XhTyE+OkjqbC8YPkcuI9cdaLCBO9nzFQR718HDulCEk=; b=DdkRKg3SSO2Szx
	k/+tJr4g73UxYiXYtJqvdIQw1KBLTakw5EPHIVVsEKtQKPYtxhQmRzhWHZkwUf8yRFfK8es0UrIRM
	fJUW+fancw+SQ+myLf/kCWd49x2cfnI2kbUS0FJ6cUZXdkEvzRrHWfxXfX+imrf4/836vyqpeMju9
	6Zx8K/g5iVX5ZFolPJgWXlEvlQD9IwopGdfvWnrTL+XesUW+bp1iIME9wV5BqGyRNdRPXl86GwvO9
	jBQNgkrJcjCJXsADsLpXxlmW41tGisfPcXS/uekA6iRxh/yED3CU0pk8nAJKCxRixnT7oArYvN9t8
	t4Wn1ccTjS3C+cLQSFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7nD-00000000M2B-2b06;
	Fri, 15 Mar 2024 13:40:15 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl7nA-00000000M0u-3vmp
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 13:40:14 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-568b7350397so417963a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 06:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710510011; x=1711114811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8GpF70CfX6/ZYz42S7wUpo7NgF/Xw34C1Kcm5Nkkfys=;
        b=Yx1kfUNXvlHOSfMMvM2rX11iYu1ljiEFqdjySRU8wA2JGvWpbqK3SajLBIl9vYkmMA
         I4p2+Yt2oY9WXI2z/MSjsImX+TkvXfzFUGR12JWEkGXKt/0YKQLjJdKZj32/NuizDC79
         Wih/tSIy8NzeZl2ogRhO/EjACZDCjCVXqwUJk6lFc0RR3aIOfdVUArlBvsJEbL8IoaGo
         4qCPuROdeJQddllaFmYmBJqYb2zzWVkixTwG3hBNZGC7X1diQgOKh++c0M2eqStEtOOR
         DPW+DfWht7VMxJnpVvQiYZyf8eZs6efJwE1d6rn3shSX/tW7vX0+RnClerIrB9zwYX/Z
         dTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710510011; x=1711114811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8GpF70CfX6/ZYz42S7wUpo7NgF/Xw34C1Kcm5Nkkfys=;
        b=dTsxW170QqVEbhmF57HM7G2b/5ETfzolpIlGw8MV9oWyHYnndCYIgxxw8BFPt5/pBY
         lqKk7c0Skak2g84NLMR+2IunGV7lABxW3JDQMyYxSj6n8MdEVPTSsgwT6Qp4s+POM1WF
         pvXz1DsV0ngf6r9HYN8DVqG8vKq0zNQ0ZWRcwEuJ2UA5t1Ixkd+dYBUPX0qrUPiOB8tS
         yz4dj2tpSJdWKShnK4wWzM8ve5m1DnIyFH0xtQGq1fh7+kjSO0AWz19gN/qaiomHc7X6
         UpOKNbnjJhpE+3naDpu4Y2G5GDfCYRjpovwMrKBDy+NCBH4BqzgtlXAiAfKIZglDzELF
         VUvA==
X-Gm-Message-State: AOJu0Yz5Yty+77Qa2IWM8yO8QRwNcj1zarHmXsVoQLusJX8YxroCxEeG
	0i8cPIG2PVuvQXJpTt36LYjQeaDIPP4TCGCVi5MtjxpD92LgVdUH1v/jLMVuHfOu+teokp7ozTk
	w
X-Google-Smtp-Source: AGHT+IEJ+GZq0aCYW5AFPWYR3CFedcyBB47DOlC8RkupvQ/yhTekijeSH8H6wrfvFKiGlJBuhDSdUw==
X-Received: by 2002:a17:906:7c88:b0:a46:6d16:14e with SMTP id w8-20020a1709067c8800b00a466d16014emr1970461ejo.50.1710510011274;
        Fri, 15 Mar 2024 06:40:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id hg25-20020a1709072cd900b00a469be48551sm40805ejc.45.2024.03.15.06.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 06:40:10 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@ACULAB.COM
Subject: [PATCH 0/5] riscv: Apply Zawrs when available
Date: Fri, 15 Mar 2024 14:40:10 +0100
Message-ID: <20240315134009.580167-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_064013_006276_9BAF7635 
X-CRM114-Status: GOOD (  19.63  )
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
ZyBvciBhbiBJTEwgZXhjZXB0aW9uIHdpbGwgYmUKcmFpc2VkLgoKTGlrZSB3ZmkgKGFuZCB3aXRo
IHRoZSBzYW1lIHttLGh9c3RhdHVzIGJpdHMgdG8gY29uZmlndXJlIGl0KSwgd2hlbgp3cnMubnRv
IGlzIGNvbmZpZ3VyZWQgdG8gcmFpc2UgZXhjZXB0aW9ucyBpdCdzIGV4cGVjdGVkIHRoYXQgdGhl
IGhpZ2hlcgpwcml2aWxlZ2UgbGV2ZWwgd2lsbCBzZWUgdGhlIGluc3RydWN0aW9uIHdhcyBhIHdh
aXQgaW5zdHJ1Y3Rpb24sIGRvCnNvbWV0aGluZywgYW5kIHRoZW4gcmVzdW1lIGV4ZWN1dGlvbiBm
b2xsb3dpbmcgdGhlIGluc3RydWN0aW9uLgpDdXJyZW50bHksIGl0J3Mgbm90IGV4cGVjdGVkIHRo
YXQgTS1tb2RlIHdpbGwgY29uZmlndXJlIGFuZCBoYW5kbGUKZXhjZXB0aW9ucyBmb3IgdGltZW91
dHMgKHNvIGl0J3MgZXhwZWN0ZWQgdGhhdCBtc3RhdHVzLlRXPTApLCBidXQgS1ZNIGRvZXMKY29u
ZmlndXJlIGV4Y2VwdGlvbnMgZm9yIHdmaSAoaHN0YXR1cy5WVFc9MSkgYW5kIHRoZXJlZm9yZSBh
bHNvIGZvcgp3cnMubnRvLiBLVk0gZG9lcyB0aGlzIGZvciB3Zmkgc2luY2UgaXQncyBiZXR0ZXIg
dG8gYWxsb3cgb3RoZXIgdGFza3MgdG8KYmUgc2NoZWR1bGVkIHdoaWxlIGEgVkNQVSB3YWl0cyBm
b3IgYW4gaW50ZXJydXB0LiBGb3Igd2FpdHMgc3VjaCBhcyB0aG9zZQp3aGVyZSB3cnMubnRvL3N0
byB3b3VsZCBiZSB1c2VkLCB3aGljaCBhcmUgdHlwaWNhbGx5IGxvY2tzLCBpdCBpcyBhbHNvIGEK
Z29vZCBpZGVhIGZvciBLVk0gdG8gYmUgaW52b2x2ZWQsIGFzIGl0IGNhbiBhdHRlbXB0IHRvIHNj
aGVkdWxlIHRoZSBsb2NrCmhvbGRpbmcgVkNQVS4KClRoaXMgc2VyaWVzIHN0YXJ0cyB3aXRoIENo
cmlzdG9waCdzIGFkZGl0aW9uIG9mIHJpc2N2IHNtcF9jb25kX2xvYWQqCmZ1bmN0aW9ucyB3aGlj
aCBhcHBseSB3cnMuc3RvIHdoZW4gYXZhaWxhYmxlLiBXZSB0aGVuIHN3aXRjaCBmcm9tCndycy5z
dG8gdG8gd3JzLm50bywgYWRkIGh3cHJvYmUgc3VwcG9ydCAoc2luY2UgdGhlIGluc3RydWN0aW9u
cyBhcmUgYWxzbwp1c2FibGUgZnJvbSB1c2VybW9kZSksIGFuZCBmaW5hbGx5IHRlYWNoIEtWTSBh
Ym91dCB3cnMubnRvLCBhbGxvd2luZwpndWVzdHMgdG8gc2VlIGFuZCB1c2UgdGhlIFphd3JzIGV4
dGVuc2lvbi4KCldlIHN0aWxsIGRvbid0IGhhdmUgdGVzdCByZXN1bHRzIGZyb20gaGFyZHdhcmUs
IGFuZCBpdCdzIG5vdCBwb3NzaWJsZSB0bwpwcm92ZSB0aGF0IHVzaW5nIFphd3JzIGlzIGEgd2lu
IHdoZW4gdGVzdGluZyBvbiBRRU1VLCBub3QgZXZlbiB3aGVuCm92ZXJzdWJzY3JpYmluZyBWQ1BV
cyB0byBndWVzdHMuIEhvd2V2ZXIsIGl0IGlzIHBvc3NpYmxlIHRvIHVzZSBLVk0Kc2VsZnRlc3Rz
IHRvIGZvcmNlIGEgc2NlbmFyaW8gd2hlcmUgd2UgY2FuIHByb3ZlIFphd3JzIGRvZXMgaXRzIGpv
YiBhbmQKZG9lcyBpdCB3ZWxsLiBbNF0gaXMgYSB0ZXN0IHdoaWNoIGRvZXMgdGhpcyBhbmQsIG9u
IG15IG1hY2hpbmUsIHdpdGhvdXQKWmF3cnMgaXQgdGFrZXMgMTYgc2Vjb25kcyB0byBjb21wbGV0
ZSBhbmQgd2l0aCBaYXdycyBpdCB0YWtlcyAwLjI1CnNlY29uZHMuCgpUaGlzIHNlcmllcyBpcyBi
YXNlZCBvbiBrdm0vcXVldWUgYW5kIGFsc28gYXZhaWxhYmxlIGhlcmUgWzFdLiBJbiBvcmRlcgp0
byB1c2UgUUVNVSBmb3IgdGVzdGluZyBhIGJ1aWxkIHdpdGggWzJdIGlzIG5lZWRlZC4gSW4gb3Jk
ZXIgdG8gZW5hYmxlCmd1ZXN0cyB0byB1c2UgWmF3cnMgd2l0aCBLVk0gdXNpbmcga3ZtdG9vbCwg
dGhlIGJyYW5jaCBhdCBbM10gbWF5IGJlIHVzZWQuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2pv
bmVzLWRyZXcvbGludXgvY29tbWl0cy9yaXNjdi96YXdycy12MS8KWzJdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDI0MDMxMjE1MjkwMS41MTIwMDEtMi1ham9uZXNAdmVudGFuYW1pY3Jv
LmNvbS8KWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9qb25lcy1kcmV3L2t2bXRvb2wvY29tbWl0cy9y
aXNjdi96YXdycy8KWzRdIGh0dHBzOi8vZ2l0aHViLmNvbS9qb25lcy1kcmV3L2xpbnV4L2NvbW1p
dC8yZTcxMmIxOWI3YmI3ODYzNDE5OWJmMjYyZTZhNzVlMDllMWM4N2QyCgpUaGFua3MsCmRyZXcK
CgpBbmRyZXcgSm9uZXMgKDQpOgogIHJpc2N2OiBQcmVmZXIgd3JzLm50byBvdmVyIHdycy5zdG8K
ICByaXNjdjogaHdwcm9iZTogZXhwb3J0IFphd3JzIElTQSBleHRlbnNpb24KICBLVk06IHJpc2N2
OiBTdXBwb3J0IGd1ZXN0IHdycy5udG8KICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBaYXdy
cyBleHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0IHRlc3QKCkNocmlzdG9waCBNw7xsbG5lciAoMSk6
CiAgcmlzY3Y6IEFkZCBaYXdycyBzdXBwb3J0IGZvciBzcGlubG9ja3MKCiBEb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgICAgfCAgNCArCiBhcmNoL3Jpc2N2L0tjb25m
aWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysKIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vYmFycmllci5oICAgICAgICAgICAgICB8IDg3ICsrKysrKysrKysrKysrKysrKysKIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYyAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva2VybmVs
L3N5c19od3Byb2JlLmMgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva3ZtL3ZjcHUu
YyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5z
bi5jICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25l
cmVnLmMgICAgICAgICAgICAgICAgICB8ICAyICsKIC4uLi9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dl
dC1yZWctbGlzdC5jICAgICAgICB8ICA0ICsKIDEzIGZpbGVzIGNoYW5nZWQsIDEzMiBpbnNlcnRp
b25zKCspCgotLSAKMi40NC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
