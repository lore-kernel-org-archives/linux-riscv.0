Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79937C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUFKX1xZRYTndSA7+glXNW7La+prFyDjOihe9RQ6kxE=; b=Ah0p2yAgEWayBw
	2OIa3i2VFSqeSC9ld9iX6gWNSW3zRoHtPJAYLxAZe/Ce168sv1Oc535J7ehGRAIzzCeeQy8UjU46v
	A+A1fjiLyUxNJ7Hinb6IG5D/MIDSt9zVT4ERhUOyL/V2KJSxKjd+KWY/NHjqdqNbIqmImhRn2Ji4t
	dvX4lBLHL+LpV4FxHFDj/JuTxWEefKN1Zt99p8ERD96dGuetWPkDfIWLhNr5Oryn+d2IZcr1lO4oB
	xcFF+ERdMWdonmygobE+2bEhue5HIox20fZbVNDbXMKWbMLUpl8b8L/3d02BRdPoGzQXdek8VnkXr
	mrhoJkpPGVQeWU6Z0nRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLl1-0000000AGym-1O8b;
	Fri, 25 Jul 2025 16:58:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLjF-0000000AGdM-1jNm
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 16:57:06 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so182071f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753462623; x=1754067423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXthN36Lo7e4SdP3F/xJxtrDA9Mid3323veomLRgOO0=;
        b=MBAJp2sYTBeUQ2xv02Capq4UQc7vyeADRuM75gh+T0e1CScB8t9aT0uKiKd1Jre4XX
         BUyBQHEUN00a4bos942ywQ/gl1V42Ay5j0Bx0Q2rHb4kmxR+wd6/SsP3z5mitEVEtNGB
         UbIBLPwvHuWbLMrcTnbGtfBuVjDgHt+/4NDrUyB4BFf+6G7Bam6qYu/ZJKLcpeOgQJgG
         n5gjz19EiLBW731L+ZG//ZlXfAmIB3jG67eKjGyDFC+fL7NHiI3rQhG/FPfiMazytg5N
         mbqMhQycw3VrZS4a94uHJ85e88JPlzEdTCMl5eJ51ecZMVzd8wKp5QU6aQAM9kTXKoBT
         1hUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462623; x=1754067423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXthN36Lo7e4SdP3F/xJxtrDA9Mid3323veomLRgOO0=;
        b=bkMBf8++T7afQbJG3Ay4JVMcCXcPkmJgL4T2vTEFwNumyvxKhTcDN5wD0dlzUZolne
         I7dYuObE2ndUwRrgA7kwsJLHesEmNpNdqSVrUqeJYZXxFVQu1Jzo3LLJRIs/aMO7OH2f
         X5MEXn7NjwBq8XyNkrmp7FBOzTnHiagpsvCvqI00EIgHj6EOxQ50STt+hzC2m/1AYEyL
         p2CNln4f13JWfoC/TZp+KwHucf69PfIs6Wsqx4uZ7MQPLFe/4g+HP3QR1DQ0oDtCF8D0
         IwPEpzAAE9mMXcs/VTGUGYiRNXgBqDKlQaJNWkGsTM2cXQcfSMYqNaVis6dhIAzD+imz
         Bkpw==
X-Gm-Message-State: AOJu0YwLIrcz/Ay39jOF/GjF+dVQyWhF8QbAwIzI9Kx1f1P9nm4XbbsE
	IaQTwm6Ul/sWn7sMQ3Bu6YGnHd9T1lHyLv/v2CcRLbxB2isAHheFpI3a8R02KAErgFz8MYPPqea
	4fx9g
X-Gm-Gg: ASbGncuSuWSIce50PaCPwGpNOOr0MWY3fUtgixEsnj19XbjKGN8RmIQKJoSBS6+YNAB
	3yUAeFgD3xQMiAMdzuc0YAbYksDAqo9R2ypnFb1WO6EGsgJL0Cu9X5ExjZrZnGB5Y7WfJXb64GO
	Y3kGTPTrha3vWTbDVFQku2SNQaaUvOm0eBKA2/rgKRgFNjUDK8y6d1ndMA523hVwP+0i6P8TDsI
	hma+CSuKTofQdiLshLhSzkLzALOf6OY9khHNbEJNv1rbp0osAmEgdX3RbrtKwoLhv2F65v5a+LI
	3FnMJdkCHs+Qdse6fxboQSeNRYoI42nSMyr/q4jBEuWgbOxQDMVLik43fOIeOzcy/N4i8zJ3/VZ
	Q8JkrKFM8iH7ScDIdO0SLvgG7uOz6ZA==
X-Google-Smtp-Source: AGHT+IGITcuSDw2WS3mGZXN4jojt1rCPjmkMuRkOCVtep1jh4UTndIbn3+VqTiq+4Alwt55pwQeogg==
X-Received: by 2002:a05:6000:22c5:b0:3a5:8abe:a265 with SMTP id ffacd0b85a97d-3b77674fd69mr853133f8f.10.1753462623365;
        Fri, 25 Jul 2025 09:57:03 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8c15:2281:5347:b367])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458705bcb61sm58146165e9.20.2025.07.25.09.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:57:02 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 3/4] riscv: use TASK_TI_CPU instead of TASK_TI_CPU_NUM
Date: Fri, 25 Jul 2025 18:54:11 +0200
Message-ID: <20250725165410.2896641-6-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
References: <20250725165410.2896641-3-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_095705_451648_20299A80 
X-CRM114-Status: GOOD (  10.39  )
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

VGhlIG9mZnNldHMgb2YgVEFTS19USV9DUFUgYW5kIFRBU0tfVElfQ1BVX05VTSBhcmUgaWRlbnRp
Y2FsLCBhbmQKVEFTS19USV9DUFUgaXMgYSBiZXR0ZXIgbmFtZSBmb3IgdGhyZWFkX2luZm8uY3B1
LgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4K
U2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+
Ci0tLQp2MjogbW92ZWQgYWZ0ZXIgcGF0Y2hlcyBmb3Igc3RhYmxlIFtBbGV4XQotLS0KIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vYXNtLmggICAgfCAyICstCiBhcmNoL3Jpc2N2L2tlcm5lbC9hc20t
b2Zmc2V0cy5jIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS5oCmluZGV4IDJhMTZlODhlMTNkZS4uOTNiMWU0Y2UzNGQx
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS5oCisrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vYXNtLmgKQEAgLTkxLDcgKzkxLDcgQEAKICNlbmRpZgogCiAubWFjcm8g
YXNtX3Blcl9jcHUgZHN0IHN5bSB0bXAKLQlsdyAgICBcdG1wLCBUQVNLX1RJX0NQVV9OVU0odHAp
CisJbHcgICAgXHRtcCwgVEFTS19USV9DUFUodHApCiAJc2xsaSAgXHRtcCwgXHRtcCwgUEVSX0NQ
VV9PRkZTRVRfU0hJRlQKIAlsYSAgICBcZHN0LCBfX3Blcl9jcHVfb2Zmc2V0CiAJYWRkICAgXGRz
dCwgXGRzdCwgXHRtcApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKaW5kZXggNmU4YzBkNmZlYWU5Li40
OWNmMmMzNDc0ODUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYwpAQCAtNDksNyArNDksNiBAQCB2
b2lkIGFzbV9vZmZzZXRzKHZvaWQpCiAJT0ZGU0VUKFRBU0tfVElfQTIsIHRhc2tfc3RydWN0LCB0
aHJlYWRfaW5mby5hMik7CiAjZW5kaWYKIAotCU9GRlNFVChUQVNLX1RJX0NQVV9OVU0sIHRhc2tf
c3RydWN0LCB0aHJlYWRfaW5mby5jcHUpOwogCU9GRlNFVChUQVNLX1RIUkVBRF9GMCwgIHRhc2tf
c3RydWN0LCB0aHJlYWQuZnN0YXRlLmZbMF0pOwogCU9GRlNFVChUQVNLX1RIUkVBRF9GMSwgIHRh
c2tfc3RydWN0LCB0aHJlYWQuZnN0YXRlLmZbMV0pOwogCU9GRlNFVChUQVNLX1RIUkVBRF9GMiwg
IHRhc2tfc3RydWN0LCB0aHJlYWQuZnN0YXRlLmZbMl0pOwotLSAKMi41MC4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
