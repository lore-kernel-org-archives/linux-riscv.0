Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304FDC25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WVSgQamvP5fO7tUNtHy0M6A5RkygjYKOWvpo8WT5Ow=; b=erlhDZIGN17bv1
	YInF8WVKKe0xIGxc/WfrR+Nbdds55XdgaQLkn4cdFkAvqUvYGqQ9Vt0U+38vEeT6zhjsq0pL3nr5X
	ybexbvQLoY23LISYuldkJE7SyMmX3CRNPzUgxcHjoSlNo9BMEQkkybBWEJqH2txz9thcJxL8xIU1e
	ANC4OH3NsIr77LaxswmkDR1mlAtdeZMfZHgGyuUeLp25pZQSXVDQRzfdsraMXL1uJKvGi0KAQgmbf
	NtmDqHanyiz5rEJLSQHKEYMOfYC58EuyRRH5dgpXIXd3k/Dj7MPlPfz10SLqGlZMjts2pMRbm1sdM
	yQ5PkXiQMkM+mSM6a1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxg-000000088DL-2vw0;
	Fri, 17 May 2024 14:53:32 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxU-0000000881N-3xLs
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:22 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2e56372d5e2so390741fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957598; x=1716562398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYWkj0uQleaCMPiVc0IX1xdL2m6WhFkCEPxGzctu0Mc=;
        b=0kyLSdk/ECDoM4/Z4UxST5vlzDxY3/3efj5Nrzfb/P23tEITZ2EkdHt1Ilq2pVAjWC
         bw9QqOlXvzaJFLLTEUz6k2C16ziidpiG8vjSAIomc7GVUGBt/2ntAi11m24TPNhxwLXa
         svvkeafHwWX1rzlwFRUZlNrNNXcBFyC8mC8HqMKRxptU0LCrXzHp3mCKHb0PU92Pjx6D
         VGHeArscFQhI80/DUK3ptKQTBSMOv9Ax7Vrt+gGui4bkRB54Lckjg2MOh9zVesa+FdG6
         T03MRUMb5AXV8Var5Wdok7Ko7Aldya5l1YRKYlfDXjPMAPIF/DHyZZ7r3JV5Tv46SVKJ
         CQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957598; x=1716562398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYWkj0uQleaCMPiVc0IX1xdL2m6WhFkCEPxGzctu0Mc=;
        b=mUiNRS3RstcBJlmQ5Pt4M8s/E5M6a0vLw3qmzSxHgCbMAavRL7eV7XxLPLLnnr7yoG
         lEzcaXdW/Y9zu8T6wueAsY8PZCXbR1XfIhk+T4M3csysdp4lQkRkE0TUxIl95UsJKl9j
         aB5VAD+THM2phT7D3Gze5fnfYY3dZucYP5ze8KPISBhxuS/UpB5D84lhI78JYzMglno7
         AcHfHZtkFRwN5vU163UgCS20by3gxM1AcVqvYdsC3KP3pk33d7zf0uFafaOScXFIlbXO
         Jz5FRJIAeME6RpqjA/DDG4tbc/AbEeg6Jsr9hGvIgDt7nWJ+8idVfNkL/1dgZKyaSRdX
         pVnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiEg63n6UqTzYod8Wc9ihoJ1C+FLff/g1TZ2aQOQNAVzqQ1jZCT0W0s0pNpjXq3yQgiG7/87hGdqDpC3fugFswWyJbkKEqi2CxEWj7lycw
X-Gm-Message-State: AOJu0YzgaER0yk721nIe34rncO2lp3YNZU5+OHuodW/Oen1qThF5gXAu
	1KfX4xOa2NPu3e2JfOtECHmLYf6njSuR0mhtXzZpS8UxwJka0P6TSsNMJGo5L5M=
X-Google-Smtp-Source: AGHT+IFFIQ8bCYBTkej73vjqEl/30GkvcNdlZ/nAYriy2LKRNANi0QgdpIuaZdQ1x21X/bcvyrz8/Q==
X-Received: by 2002:a2e:9094:0:b0:2df:4bad:cb7f with SMTP id 38308e7fff4ca-2e51fd4b333mr138901491fa.2.1715957598226;
        Fri, 17 May 2024 07:53:18 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:17 -0700 (PDT)
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
Subject: [PATCH v5 02/16] riscv: add ISA extension parsing for Zimop
Date: Fri, 17 May 2024 16:52:42 +0200
Message-ID: <20240517145302.971019-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075321_168943_FFFAFF92 
X-CRM114-Status: UNSURE (   9.38  )
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

QWRkIHBhcnNpbmcgZm9yIFppbW9wIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGlu
IGNvbW1pdAo1ODIyMDYxNGE1ZiBvZiB0aGUgcmlzY3YtaXNhLW1hbnVhbC4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YyB8IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
Y2FwLmgKaW5kZXggMWYyZDI1OTljNjU1Li5iMTg5NmRhZGU3NGMgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
Y2FwLmgKQEAgLTgwLDYgKzgwLDcgQEAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkEJCTcxCiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlRTTwkJNzIKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQUNB
UwkJNzMKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSU1PUAkJNzQKIAogI2RlZmluZSBSSVNDVl9J
U0FfRVhUX1hMSU5VWEVOVkNGRwkxMjcKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4IDI5OTMz
MThiOGVhMi4uNDFmOGFlMjJlN2EwIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0yNDEsNiAr
MjQxLDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10g
PSB7CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50bnRsLCBSSVNDVl9JU0FfRVhUX1pJSElO
VE5UTCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50cGF1c2UsIFJJU0NWX0lTQV9FWFRf
WklISU5UUEFVU0UpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaHBtLCBSSVNDVl9JU0FfRVhU
X1pJSFBNKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aW1vcCwgUklTQ1ZfSVNBX0VYVF9aSU1P
UCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemFjYXMsIFJJU0NWX0lTQV9FWFRfWkFDQVMpLAog
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmYSwgUklTQ1ZfSVNBX0VYVF9aRkEpLAogCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHpmaCwgUklTQ1ZfSVNBX0VYVF9aRkgpLAotLSAKMi40My4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
