Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C313C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uy+y3aE35yKzct/02UKdKXUOxD4Hb0KrQ1svkPHCGKY=; b=YcQfxgAN8kfLhH
	7nA1of6H8TLzmG/nGnn0I0Ut+Md6v5n7i9Mb2vaEnqwj2J3tmqOxLG4BcW3YnuwxbRgB4uoqCKMru
	+ptnWYRmxaNsc2JXvo7rX+pTd8TcrklU0NqHMIknOwd6K8aKb5MwENoknvxw7T1URPqL29TBM/B1s
	bqBgOuIQZy9l+9g2RH4uW4zhBqhXZUbiVuSCKtTJgzFtWKNY2JTtrc6xoYxxdr8VvBAB6orQDtoqX
	ZNovK+gVByj8019fx1AG8zVHLzhyVvJXnquZqIXMwVzWbnfBeWGHUq+7RKBu4D1ITqniiqa2iYX8O
	i4AjJ9meMQGScZkA4NEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uBA-00G9UB-2v;
	Tue, 14 Nov 2023 14:14:12 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAw-00G98p-1H
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:14:00 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-778a25cad6dso14504685a.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971235; x=1700576035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhcCtOR2GZrdrPK8F2RJJNrJMtAQGPXOJeJBoGOeT7I=;
        b=GD74JNN0oNSwMcblLd4SJszwsxHHktVKWk8UBPAwx9bCpqxW2yrMKwiRoahtvb/S1n
         oF/YEnE9X8Ij5EtSn3E3Yz0I6QIHSLjyAIcLfCnEnr9nE9761XAyW7xLqR+TRheH8k3o
         zZEiP1Z6dH0+p8dSzz/vXwhz1Y9VGwp+o1bwKQqfyuUCbmWSUHN7VKOdOMOTPdEHmv/1
         vaVJWLu5t8KwPbP86SpOlcDJAEsVepQ7W5AMsg22i7FSRQIJW5/uRPaMhf8dqh7YESK4
         LyFO2L+4cZGWQ1KfIXAsMHfi5+hsHaXyNtMc71E3+lGMDqoOtXYxz9/KNuMeyLlsgoVR
         IDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971235; x=1700576035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhcCtOR2GZrdrPK8F2RJJNrJMtAQGPXOJeJBoGOeT7I=;
        b=eDJo7FnKW+gWxLjXbuMFqmmeohdd9c0UOaiPAEiibHq89cWB/LUjYiBftiCOk+FaHU
         mW9mODg4mHtnHwCb+lhJHyzm9lZP5cFeLKVrGr+vsHeR2sBmaB0la4nmruFGDPcHlTQi
         nXQ4n2CNOSS7q3l5xk9g60aoNYXYhI4gXNi6DbmEeRcB6Sa+WFRnslW19xJLqW5doR4s
         AS5XWC5/eXF7YKYmibxW44SsVL9ocGo7IMsvH7WjN31Btf3QRDYVw7WgYpjB1+YBWbuP
         H6ECvS8mr6m7nIj3xcMC3kEfC0cX2bS1EYuXs6IPNqKu6VguDnwazMA8GvSxedPLeqTM
         racA==
X-Gm-Message-State: AOJu0YwCSsifL3F95dB/u0eZeWnicnw569NqFahTHKjaCTJKaXC57Uzl
	5d0qI0Ie8moILZSG+zKR9KCi4FT73c6BheZkuVUZeQ==
X-Google-Smtp-Source: AGHT+IHw6SoyZ+QahmzQ/8JDfKi56le+NNxYvZ8O/S2hYgiLZdXnFM9RxTYP4C4LF3pIviuj3zDP+A==
X-Received: by 2002:a05:620a:f12:b0:77b:d8aa:6755 with SMTP id v18-20020a05620a0f1200b0077bd8aa6755mr2516814qkl.3.1699971235353;
        Tue, 14 Nov 2023 06:13:55 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:54 -0800 (PST)
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
Subject: [PATCH v4 18/20] riscv: add ISA extension parsing for Zfa
Date: Tue, 14 Nov 2023 09:12:54 -0500
Message-ID: <20231114141256.126749-19-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061358_465251_FBA3043A 
X-CRM114-Status: UNSURE (   9.34  )
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

QWRkIHBhcnNpbmcgZm9yIFpmYSBJU0EgZXh0ZW5zaW9uIFsxXSB3aGljaCB3ZXJlIHJhdGlmaWVk
IGluIGNvbW1pdAowNTZiNmZmNDY3YzcgKCJaZmEgaXMgcmF0aWZpZWQiKSBvZiByaXNjdi1pc2Et
bWFudWFsWzJdLgoKTGluazogaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xVlQ2UUln
Z3BiNTktOFFSVjI2NmRFRTRUOEZaVHhHcTQvdmlldyBbMV0KTGluazogaHR0cHM6Ly9naXRodWIu
Y29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvY29tbWl0cy8wNTZiNmZmNDY3YzcgWzJdClNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQt
Ynk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHdjYXAuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSAr
CiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApp
bmRleCAxMDNkNGYwYWFmMTUuLjI0MzhkNDY4NWRhNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApA
QCAtODMsNiArODMsNyBAQAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJSElOVE5UTAkJNjgKICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkZICQk2OQogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRkhN
SU4JCTcwCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkZBCQk3MQogCiAjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfTUFYCQkxMjgKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9JTlZBTElECQlVMzJfTUFYCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggNjIzYTVmYTQ4Y2Y0Li5kYzBhYjNlOTdjZDIgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMKQEAgLTI1OSw2ICsyNTksNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3Zf
aXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6
aWhpbnRudGwsIFJJU0NWX0lTQV9FWFRfWklISU5UTlRMKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFU
QSh6aWhpbnRwYXVzZSwgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSksCiAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoemlocG0sIFJJU0NWX0lTQV9FWFRfWklIUE0pLAorCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHpmYSwgUklTQ1ZfSVNBX0VYVF9aRkEpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmaCwg
UklTQ1ZfSVNBX0VYVF9aRkgpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmaG1pbiwgUklTQ1Zf
SVNBX0VYVF9aRkhNSU4pLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYSwgUklTQ1ZfSVNBX0VY
VF9aQkEpLAotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
