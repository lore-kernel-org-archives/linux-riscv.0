Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16609C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWakTq/Z4T2xZY+9Gx8J2aNQoseJAN+ZMdhmMIUzvIU=; b=dsf/kmOWsjHVYU
	RNOwmi14ns7wnoDMpvQnklXv7EkIaKzVhPsQ0d3LiP0D6pS6zCb0wdN5o0CujSv2Hh5dzo7CD9Hg3
	1vSCdZD+0y+2JZbVxJA3dYyuCASX0m275My48EhKGAbZXIPjmrAuIGWTDc4G5yjzDuPAGWwy609pz
	weoFQej73e1R6mhzCEhY5yXzMblCmi4H1muPCER8QEDmgsnTa7HIyHPMsTvLQTV1mBQGXOI1XoOoD
	XCngF0bjKqfg0vgPPA2rTBqSxL5ENCNsJ48BU42ndQU2hSD/Q/sT37VNfG/gvmg1kHyu+gvlFjTIL
	GgnC6fGPj2RsfA+EVDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHS0-009wrj-1G;
	Tue, 24 Oct 2023 13:28:04 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHRv-009wmV-0J
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 13:28:00 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507a3af69d8so1560440e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 06:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698154077; x=1698758877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJFNx5rx7qhUkqIPLwjnmrfGOQmOs2H4ET4l8FDTOVI=;
        b=YAnxaKKi6pbHchsxtGqeP4D9n6fD2p9Kes5bBKvR7mtsiayuM1Z8iEH6mnIl7GEjXj
         FbdPQFglINuD61SUBeSsGE60afQhzSFPYIaP2ISO7xcXH6NKOF/kbNnSrt6iR/SdzFlu
         tnKsmDy5piXMnkJpOqSrvtIxIbW0PfeXEENYbaXZkQAnfGfq3eI4VsDlL4fBDpMkhXJ0
         JS0sZplE4FgzBY9skzxPS5yljvLlIJFxW6F0zGYHMXGLMonIFPb1PIBDb9epeLaKO5ia
         ehiSHArfXmdCgmKuHFrO1d96+419V9r3s/o+wfKz0CnYC36mr+JLBLw0FkoDEmlO5D5k
         2ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698154077; x=1698758877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJFNx5rx7qhUkqIPLwjnmrfGOQmOs2H4ET4l8FDTOVI=;
        b=e0q3aefcY6TXQnObQuwFljgt4ADe9flA1hoerq6GjzqVHv15AqRsDFq1SXR73e9WyM
         m0Hh1L3y35ltm/1IRca0waFZpwAHNP4TckBoPBeaUvbSXsle+NH//nDgi+qyna1bdg+a
         NZvYmYb/XJkPC+MTmwWekbeDrrFoXvEN6dNMfMeVd2epLCjU8EiHDEpf0S91Xr5ipedE
         SbfOW6Mb6JXqpJCWsOt/o8ujUflBdOUWJldKGEZwkYKKcvaBOcrL8n74OPDsDPYy82bo
         puA+3PsNjxaE5fY6rucunOZdQWueDI3d2iyMWBmNp8mNxwnwd9csoE5cV/9DzymzWtdH
         Te0w==
X-Gm-Message-State: AOJu0YxZHQpYGa1ACK67n2Vq1lO5irGzclDS4WihbjA9R0gHGGtP4jae
	hit18UYxmpMkNVKq6Agc69E2Dg==
X-Google-Smtp-Source: AGHT+IFWdNIkY0t6ET2TzgVKN75LNnZuJm4w1A0MxXp+TA6JlTnULSfRKZHPZd/CGJzYRaN7/ZBuVA==
X-Received: by 2002:a05:6512:ac3:b0:505:7123:21ae with SMTP id n3-20020a0565120ac300b00505712321aemr8618901lfu.6.1698154076939;
        Tue, 24 Oct 2023 06:27:56 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:597d:e2c5:6741:bac9])
        by smtp.gmail.com with ESMTPSA id c17-20020a5d4151000000b0032d87b13240sm10034964wrq.73.2023.10.24.06.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 06:27:56 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 5/5] riscv: kvm: use ".L" local labels in assembly when applicable
Date: Tue, 24 Oct 2023 15:26:55 +0200
Message-ID: <20231024132655.730417-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024132655.730417-1-cleger@rivosinc.com>
References: <20231024132655.730417-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_062759_135030_26F1A58B 
X-CRM114-Status: GOOD (  10.12  )
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

Rm9yIHRoZSBzYWtlIG9mIGNvaGVyZW5jeSwgdXNlIGxvY2FsIGxhYmVscyBpbiBhc3NlbWJseSB3
aGVuCmFwcGxpY2FibGUuIFRoaXMgYWxzbyBhdm9pZCBrcHJvYmVzIGJlaW5nIGNvbmZ1c2VkIHdo
ZW4gYXBwbHlpbmcgYQprcHJvYmUgc2luY2UgdGhlIHNpemUgb2YgZnVuY3Rpb24gaXMgY29tcHV0
ZWQgYnkgY2hlY2tpbmcgd2hlcmUgdGhlCm5leHQgdmlzaWJsZSBzeW1ib2wgaXMgbG9jYXRlZC4g
VGhpcyBtaWdodCBlbmQgdXAgaW4gY29tcHV0aW5nIHNvbWUKZnVuY3Rpb24gc2l6ZSB0byBiZSB3
YXkgc2hvcnRlciB0aGFuIGV4cGVjdGVkIGFuZCB0aHVzIGZhaWxpbmcgdG8gYXBwbHkKa3Byb2Jl
cyB0byB0aGUgc3BlY2lmaWVkIG9mZnNldC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdl
ciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVz
QHZlbnRhbmFtaWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUyB8IDQg
KystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5TIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdV9zd2l0Y2guUwppbmRleCA4YjE4NDczNzgwYWMuLjBjMjYxODlhYTAxYyAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3N3aXRjaC5TCkBAIC00NSw3ICs0NSw3IEBAIFNZTV9GVU5DX1NUQVJUKF9fa3ZtX3Jpc2N2X3N3
aXRjaF90bykKIAlSRUdfTAl0MCwgKEtWTV9BUkNIX0dVRVNUX1NTVEFUVVMpKGEwKQogCVJFR19M
CXQxLCAoS1ZNX0FSQ0hfR1VFU1RfSFNUQVRVUykoYTApCiAJUkVHX0wJdDIsIChLVk1fQVJDSF9H
VUVTVF9TQ09VTlRFUkVOKShhMCkKLQlsYQl0NCwgX19rdm1fc3dpdGNoX3JldHVybgorCWxhCXQ0
LCAuTGt2bV9zd2l0Y2hfcmV0dXJuCiAJUkVHX0wJdDUsIChLVk1fQVJDSF9HVUVTVF9TRVBDKShh
MCkKIAogCS8qIFNhdmUgSG9zdCBhbmQgUmVzdG9yZSBHdWVzdCBTU1RBVFVTICovCkBAIC0xMTMs
NyArMTEzLDcgQEAgU1lNX0ZVTkNfU1RBUlQoX19rdm1fcmlzY3Zfc3dpdGNoX3RvKQogCiAJLyog
QmFjayB0byBIb3N0ICovCiAJLmFsaWduIDIKLV9fa3ZtX3N3aXRjaF9yZXR1cm46CisuTGt2bV9z
d2l0Y2hfcmV0dXJuOgogCS8qIFN3YXAgR3Vlc3QgQTAgd2l0aCBTU0NSQVRDSCAqLwogCWNzcnJ3
CWEwLCBDU1JfU1NDUkFUQ0gsIGEwCiAKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
