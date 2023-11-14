Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0368C4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M69hmiwYG58JWUmmSQDnf6UnxITF/Gjb8jLI/BJ3KDs=; b=xYQupn/lWo31YO
	GH6TazCXzGXEBe7G/t50aJPEK7G0xlFcvp3xykN+OtO1zdxpik419fdMgcDo67j5eV0bP88iCTUNc
	/2VS6oSpdnHir8lvRDeO1xi9hZDq2/P4CAAuq44sMXZN8VnFXGidSKE8ITWasxKXbzd1A/fQqr5Br
	GwXq1Yi9UoDGnVdY4C/jWaX2Hokn2RRCV++eX4S+awMxNd/MU8aGKWvrg94sc8virT45RYGFQcZHY
	oktG1bs7WzjVdD3m85R6V6mGIKjAB6nq4Ii2EQu+VbAM6L7cjmAEgF1NJKRnt8r0/EqjniLwP0xCG
	BX124KwgJXQHqdq2/Jkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAt-00G96p-0w;
	Tue, 14 Nov 2023 14:13:55 +0000
Received: from mail-qk1-f174.google.com ([209.85.222.174])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAl-00G8wZ-12
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:51 +0000
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-778a25cad6dso14501085a.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971224; x=1700576024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1n1l7La6nGZIqWqCT5nqMrjtDpsd0w2BPU1/F2EaPQ=;
        b=dVDDPvkUWvj3erPvcBnwEjWRaGhW35WSssh/aDYxFY+bxtYJTlPjdXkfPV53UkLwZS
         zGhE1i43vo2/2OphP7QXYmrw8XHNV4CjHqhngbiImCp9jwuhXcBMXrwM9aQhcWaEroS0
         tDXWrAzioeVr4B5p3p7Xnc2ga51zt4LT3eXpRwE2CmAueiTvM9wDdNlodZyUsEMkmKEx
         piAIj7kX63Ze/O6mQKpaJl9ErrNViPbnfF7EuCLyZHWJReWs/8drsqT6pwNSbR8Vy0Bc
         3yNgvXxrfEyybOZaAji9ptlY5PEFWfeiWlqDThsBb2iWJME7SHAD5HM495ykaSoidoww
         Ni0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971224; x=1700576024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1n1l7La6nGZIqWqCT5nqMrjtDpsd0w2BPU1/F2EaPQ=;
        b=J4p4JBMALQA7ksf7rx/ie1PYEN+wZYjYP2Twg/sHpYtku9jubMj7jtegPAGl22F2Lu
         i+Uf9tUw1yUJL0uB5aW3GYnqOzXIf3SCO94kh431tbjLh2mq6D2rpmDdh+ad0KtUbJFV
         YH9QNOMD4GRjgBZvHgt4w53Lry6RB4Et8J/JrzL6G8nlZxRAszynaBUWp6rrhrEZE8Iq
         lXkrsDZMp3yyMfQ1Rir/9/7dyxRp+TLzEWcuC18aNXG05jcKP4uNaZc/PrLyhQ1yYdfC
         oOLCucl7YtvSc85JKRNCVVtAl504TqFrRMDXAWiA+pyB8AgGoesz0+K1pT81uLrbEw+B
         YkZw==
X-Gm-Message-State: AOJu0YwznIOQEc8lAaM1KwuJ28EbGBNhlu0q88l8rKaF9j3f+RSkQsxX
	2cpXttf2eeThaVw9BOaa1nuOG6BTGGa0dXmAtRrKTA==
X-Google-Smtp-Source: AGHT+IGdVmknHr9YfYcSME+isGh9g75eDYraT29RTc8VoNjDP7MZEDOfcBgxO+xlzZuc8oVMqtvnkQ==
X-Received: by 2002:a05:620a:1a03:b0:76f:1614:577d with SMTP id bk3-20020a05620a1a0300b0076f1614577dmr2495334qkb.4.1699971224044;
        Tue, 14 Nov 2023 06:13:44 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:43 -0800 (PST)
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
Subject: [PATCH v4 09/20] riscv: add ISA extension parsing for Zfh/Zfh[min]
Date: Tue, 14 Nov 2023 09:12:45 -0500
Message-ID: <20231114141256.126749-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061347_391387_DB324130 
X-CRM114-Status: UNSURE (   8.58  )
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

QWRkIHBhcnNpbmcgZm9yIFpmaFttaW5dIElTQSBleHRlbnNpb25zWzFdLgoKTGluazogaHR0cHM6
Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xejN0UVFMbTVBTHNBRDc3UE0wbDBDSG5hcHhXQ2VW
elAvdmlldyBbMV0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Ci0tLQog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgMiArKwogYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXggNDc3MjU0NjY4ZDgyLi42YTZlZTkzYTNjOWEgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAorKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTc4LDYgKzc4LDggQEAKICNkZWZpbmUgUklTQ1ZfSVNBX0VY
VF9aVktTRUQJCTYzCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLU0gJCTY0CiAjZGVmaW5lIFJJ
U0NWX0lTQV9FWFRfWlZLVAkJNjUKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkgJCTY2CisjZGVm
aW5lIFJJU0NWX0lTQV9FWFRfWkZITUlOCQk2NwogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFY
CQkxMjgKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9JTlZBTElECQlVMzJfTUFYCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMKaW5kZXggYzRkMGYxNmMyOWI5Li43MTgyY2YyNzhiMWMgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMKQEAgLTI1OCw2ICsyNTgsOCBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9k
YXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWZlbmNlaSwg
UklTQ1ZfSVNBX0VYVF9aSUZFTkNFSSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50cGF1
c2UsIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpp
aHBtLCBSSVNDVl9JU0FfRVhUX1pJSFBNKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmgsIFJJ
U0NWX0lTQV9FWFRfWkZIKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmhtaW4sIFJJU0NWX0lT
QV9FWFRfWkZITUlOKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmEsIFJJU0NWX0lTQV9FWFRf
WkJBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwKIAlf
X1JJU0NWX0lTQV9FWFRfREFUQSh6YmMsIFJJU0NWX0lTQV9FWFRfWkJDKSwKLS0gCjIuNDIuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
