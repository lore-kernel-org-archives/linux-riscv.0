Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFFECD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 10:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkDiRO1m9Dg/5oNh0MAxzA/4U1aj+apjrw3bRLVutVw=; b=SVq08pTGTP7ovE
	YtL3J/EY6ScYiNf8p/yyLPf8WQFfG6ET5jQ/nFMDd689Hdc2R2KCmAowGDrzrD3jcn7OS2bTyEdwH
	gBRT49dlrW50DUmadII8KCiJRqB/32M8K+/vWub6GlrkjwYA/AeiM54998XykZj2HhExFEiSuyr0w
	UEwrQaM3nDZAWlCTm8sAVhO34T+kvgEzC54U98/vWNNxSl7O5oOpZa3Npr4JCEhrY9n0cDubLwUs/
	Sv6vXof0Y3RsW2OcM0vkmbs97sEJ58/q6fcKiTpUIt6RepvcZ6HcLidQThbzjfeGEt0JaG6t0ZhyA
	uAW6NSLT+vIVJ4nX8bOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKQR-00000002BwI-3AGC;
	Thu, 04 Apr 2024 10:34:31 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKQN-00000002BsO-24Ty
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 10:34:29 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-516ced2f94cso84520e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 03:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712226865; x=1712831665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iku5aBhZQx5P/6uMfa9dqXU93ym6YmGWtDxr/u9bzFk=;
        b=G2MaPON6RaJTVP7hn2rpSpsmHOVQknVcbKC5EhVnznERvf6NLlyvtldsb3JiYxUbmh
         /SBUp30I2SSfzSJUJM3nCMc4WIY9CYkJzubC5aQPSZtbmrGOHIyUs7vgNSnPsLXlhhL0
         T8gHsZuUbOH8y0m7a7HGdSLiCPtYhwkDjTylfQufPgzWRcVQDflLTJyTELAUic+jTwbp
         zR0WdMNQ/UruFs/YFGd6+i1GO4B9vBnswdK6Ca1qj5lwSCWLVnT1kBgCXap7U7VB9u9q
         9GVLI0m3RFzYI8qIH8Va7jqbMTgMU9zIydPoljiPjIINL7iRfx30+mYpTPktM9h7fzm8
         mn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712226865; x=1712831665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iku5aBhZQx5P/6uMfa9dqXU93ym6YmGWtDxr/u9bzFk=;
        b=jDwNGqYg0W98veHtQ7ImSvR9YhvzfmUiF+MP2aeoGa41/uxMHpDripe8o9iJeL3aWL
         nHRHj9NGDK1e++EbRohqrRoq7OYna8LVTe5ev2RR0nD+ppxYcq+wny+/8bTuihiEyxcA
         fEu9Y3z1bhFugqc4sDSBW0pm1hXhSbqJ24A5nlc0Bs3+/dZ0ajuWMbiQpWLJ6fdgMvxb
         mXRTfkhW7XkKK1HtWJnID5icY6CH1oXCmGrx7xm6mlle+x4x2DPHazc40DYLMvLBEB0C
         /klZ7krZQ1Tox4jy5ERd75sQorysDLXNmv4rOPVRmNQo/9mSAo9EKB4ICVBASsO3/wxK
         wMsg==
X-Forwarded-Encrypted: i=1; AJvYcCU8/ECEtoaT8uo3g1v441w/loh/vp3+cpgTMv8OjWJUcTrF6SAyYdM+duxn49KhCcxdrSCYja9HjyC0D96/8AWonTjtzb+xy5dxpqM4aSSW
X-Gm-Message-State: AOJu0Yz+EGS5vjp4qzdOH0rqytR2dfBshi2HYe5xC9pJG3zHN4nlkPqJ
	fVBAzyrnZV6DNVRNzQu8G8Bs+IS22gS6XIDOA+brgW9KbqpTJLMcyUoC8g30nyw=
X-Google-Smtp-Source: AGHT+IGQHApayxznh8OMT1KuiXEDgxLxBt0Y/yh7QCrxC+TBhRlVv057wTPfke1UlSRTEFSNP9rucg==
X-Received: by 2002:a05:6512:55b:b0:513:cfb8:8cb3 with SMTP id h27-20020a056512055b00b00513cfb88cb3mr1321593lfl.1.1712226864728;
        Thu, 04 Apr 2024 03:34:24 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:555b:1d2e:132d:dd32])
        by smtp.gmail.com with ESMTPSA id ju8-20020a05600c56c800b00416253a0dbdsm2171340wmb.36.2024.04.04.03.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 03:34:24 -0700 (PDT)
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
Subject: [PATCH 2/5] riscv: add ISA extension parsing for Zimop
Date: Thu,  4 Apr 2024 12:32:48 +0200
Message-ID: <20240404103254.1752834-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404103254.1752834-1-cleger@rivosinc.com>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_033427_571665_E02FEA62 
X-CRM114-Status: UNSURE (   9.67  )
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
Y2FwLmgKaW5kZXggZTE3ZDAwNzhhNjUxLi41NDNlM2VhMmRhMGUgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
Y2FwLmgKQEAgLTgxLDYgKzgxLDcgQEAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVFNPCQk3Mgog
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pBQ0FTCQk3MwogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hB
TkRFU1BNVQkJNzQKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSU1PUAkJNzUKIAogI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1hMSU5VWEVOVkNGRwkxMjcKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4
IDNlZDIzNTllYWUzNS4uMTE1YmEwMDFmMWJjIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0y
NTYsNiArMjU2LDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2Ff
ZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50bnRsLCBSSVNDVl9JU0FfRVhU
X1pJSElOVE5UTCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50cGF1c2UsIFJJU0NWX0lT
QV9FWFRfWklISU5UUEFVU0UpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppaHBtLCBSSVNDVl9J
U0FfRVhUX1pJSFBNKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aW1vcCwgUklTQ1ZfSVNBX0VY
VF9aSU1PUCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemFjYXMsIFJJU0NWX0lTQV9FWFRfWkFD
QVMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmYSwgUklTQ1ZfSVNBX0VYVF9aRkEpLAogCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHpmaCwgUklTQ1ZfSVNBX0VYVF9aRkgpLAotLSAKMi40My4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
