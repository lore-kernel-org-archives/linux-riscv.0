Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263DCC46CD3
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+2TB3KaVMBNvhWFxwTPVfRtpAIVaxtX8pfXgw7jnaeg=; b=n7IOx9CkVeZpfx
	Wo6wrb9MDmiZ1S4Bgl62nQQG8K/QNEiqX3qLNQOighsKOyNbfIf6bG0GEK5/zVCaNusZWLGvook+q
	fvmtkkEv/LWp9Ty7oSKIO5tAOzZiEJ7LP5oMeUXV/Xq4o7Exlo+9BTQr3F5rG4rdrfFnAvADg0f6Z
	szVf56tfUCvdkO0MppVokncm/xTDPjqHxw0VkhYv8qOHOfe5heCeu56tO9Y7HyBP+r06CLYqJadUx
	0FR79s4AZMtuyT/9uvi7/KGxI4Sv6lX5Oe/rN9sh9/7HCXryfkuH8t0OUQrtWoUPUamzOcvw27Bno
	Vm8ab403y/q0ABw7nNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyx9-000KKY-0C;
	Wed, 20 Dec 2023 15:57:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyx6-000KIr-0R
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 15:57:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c192f488cso10756945e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 07:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703087861; x=1703692661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdmTrlQiysEJ9gRiozTT9JeMo8PxECkQ3IPcbyVimLw=;
        b=SzU6F39f7KLJSh6+PMiQ0RyiPm2+9YdEqDYK0Xjvva2+B7NbQSlNnOMwQZXQIZuaQc
         SiakGNjMtqgE/Pn9QzVkoolQomd4KQO0ybS7sOI7CRyuFyA3eT3fUZuiqU3zTDirb4Sn
         lCn40X76lbcvneVjC2/YjhUJzgBD66dxwOf2AyBVseR+bBrD31Lmko34R6x2ggV13wbk
         ml0I7XIAfH59lpm+T7yKj+A32RfffGQFtg3vTh4OzX++pXSSr9JYYU1SH2Exgnnwq8Ie
         6IAnh0fZAySytimADERh9ghTLy9h8WCrN2fTXHytohcwhbdlN7NNUc7wmYOIt6VPY6HH
         OZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087861; x=1703692661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdmTrlQiysEJ9gRiozTT9JeMo8PxECkQ3IPcbyVimLw=;
        b=WajYwGzNjsWPeiZQ+zCdjYUCmRtrDUnzSiLruxD1p8q+5ytfvCBhJmOsPA60eRksnc
         Oegr1+YBboZKS4NcobYfDHojKQ/H2yQSORe/j6mR0L50SgX9QL/vyJq16vNFfmuO0XIc
         5Epb/0cyh09qR/QY/YfL3+eRHql5UGU7hGX5mdjh+2Ws0G1sGcwQQKJ6rXU3BAPTv/Yw
         0n/3V0Ze7mD4zgnlHSX4DKorcpWnzFHdTzbiK9cq3IZttfT+aAvmxuP5XHHtcJ/JLOlw
         AFFrfLCgmzJHGBshW6cOwoGzAdUP6ByWNlm1mlvItMQjm3aFldWcaoB44D82GwlwrJTs
         p16g==
X-Gm-Message-State: AOJu0Ywis53UkO+y1akwDhRRJbNfoHoNf0dEZXRxDW1mgU/CHJACaZOj
	o/msNypRs7osinBa4C2A+jGIqRLyqN9hrVxcUkrI2g==
X-Google-Smtp-Source: AGHT+IGomYXGZKW9fTAlUtiRU6C8bTb/3tOYsfSXVcqSVYVqyFBHuEtMtuZ51G/bO3fbDc3LJu//dA==
X-Received: by 2002:a05:600c:81b:b0:40d:2cb9:42f6 with SMTP id k27-20020a05600c081b00b0040d2cb942f6mr3120863wmp.2.1703087861074;
        Wed, 20 Dec 2023 07:57:41 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:3eae:b70:f27f:7aa1])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b003366af9d611sm7279693wrs.22.2023.12.20.07.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:57:40 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: [PATCH v2 1/6] riscv: add ISA extension parsing for Ztso
Date: Wed, 20 Dec 2023 16:57:17 +0100
Message-ID: <20231220155723.684081-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220155723.684081-1-cleger@rivosinc.com>
References: <20231220155723.684081-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_075744_391791_07AEDD06 
X-CRM114-Status: UNSURE (   9.66  )
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

QWRkIHN1cHBvcnQgdG8gcGFyc2UgdGhlIFp0c28gc3RyaW5nIGluIHRoZSByaXNjdixpc2Egc3Ry
aW5nLiBUaGUKYmluZGluZ3MgYWxyZWFkeSBzdXBwb3J0cyBpdCBidXQgbm90IHRoZSBJU0EgcGFy
c2luZyBjb2RlLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwogYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCAyNDM4ZDQ2ODVkYTYuLjNiMzFlZmUy
ZjcxNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtODQsNiArODQsNyBAQAogI2RlZmluZSBS
SVNDVl9JU0FfRVhUX1pWRkgJCTY5CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZGSE1JTgkJNzAK
ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkEJCTcxCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlRT
TwkJNzIKIAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX01BWAkJMTI4CiAjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfSU5WQUxJRAkJVTMyX01BWApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4IGRjMGFiM2U5
N2NkMi4uM2ViNDhhMGVlY2IzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0yNzksNiArMjc5
LDcgQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7
CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemt0LCBSSVNDVl9JU0FfRVhUX1pLVCksCiAJX19SSVND
Vl9JU0FfRVhUX0RBVEEoemtzZWQsIFJJU0NWX0lTQV9FWFRfWktTRUQpLAogCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHprc2gsIFJJU0NWX0lTQV9FWFRfWktTSCksCisJX19SSVNDVl9JU0FfRVhUX0RB
VEEoenRzbywgUklTQ1ZfSVNBX0VYVF9aVFNPKSwKIAlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQo
enZiYiwgUklTQ1ZfSVNBX0VYVF9aVkJCLCByaXNjdl96dmJiX2V4dHMpLAogCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHp2YmMsIFJJU0NWX0lTQV9FWFRfWlZCQyksCiAJX19SSVNDVl9JU0FfRVhUX0RB
VEEoenZmaCwgUklTQ1ZfSVNBX0VYVF9aVkZIKSwKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
