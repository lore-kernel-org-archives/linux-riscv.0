Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8933FCD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 21:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSbRApFKY/mD7LwVX52W0WXmk6c9AKtHBzYPwqh8feU=; b=w0Jc3B0eXgqpmP
	2GtQBYJFp/7lf+uJaIih8Szh4L8pFGGlwH7ydFtrdWJMIscAZ+IKoCSLR+uHfQ30WvqCZDXqT5fFo
	047eIA0OEvJiOrM1ge8V1U6Mxwn+BkHI3tEIr748CVE7GPsAKIN/Pq0htEap4KKV89YyV0GHd0asI
	ZsBmgxRdTNqc4qbFGoY/HgA09jQ+0CvqmYr1E+q+0F5HCVO2rBFSK7IVK2fHbLPd0xPCjPAtscxF0
	M2wnwBsy7c+zmYZ+cDgZ4/SaMsNKJINkHlrH9u0OS/nCjnHqQhnYi0tQFnnz0RwEsxu6M6+mYmPMN
	RQpX8Q5/VMk+tp19lBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rufam-000000092b2-2fqr;
	Wed, 10 Apr 2024 21:34:52 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rufaj-000000092YP-021t
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 21:34:50 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6181b9dc647so35372427b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 14:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712784887; x=1713389687; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCWiTOuyXFMcE85DuFu420bVCS/UPVrh/Hb5YvaLOl8=;
        b=t33HHbc4+VcBDctDyaUbceSyO4l85ez8L0hJpsJZ9SmjXL9inOkwBErbkZSd12VEN+
         eiHMLE5CGlI85pqErL/GgjvefoVP8zIAb96yGq84ha4XmsXnbbVoYyZhnPPd1l5NMt77
         SSPzC+KSwY5jT7FUMvcF5qxKZH7cu7vxhPx4GKMxQSMMOkxw73rtubz+8qjbYphBmyTZ
         2+8Tz/HhT5lMzLEu7Qhz1PrmIx5hhsVH3iHGWJWQpqpO8QYf/hkpgBvk6mf/QuXG+gy/
         MLoyk0LRpxZj5xKGD5p14NFtrRAyaLMxvq/HgvaAFo+TzRn2WLbe/dWti2YccLr3UaZy
         xmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712784887; x=1713389687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCWiTOuyXFMcE85DuFu420bVCS/UPVrh/Hb5YvaLOl8=;
        b=pQmWq8MlnMGVco+2qKQH2IUd1tjta+h7oDELA03eN0PKcf3GuwPSuAxp/eDpsnK/i8
         3EQRbbSLmdsnqkLbFSlfW0t6YQwFekkoqb1DOUqLgNCId0O9sogvHunbdMPjhLDUMakS
         d1nTpLh2djc96LWmbzumEr8Io7nSOjX3gFIfggqFNRmYMPOgWHy04/nA4x4zNUswqnGR
         OTn4I6AubcY4e9wxrNhx62VyIxms6V7lqx3b8jvzaSuscF5duhFPBMYGLUotofdXh6M0
         vLZ7zs2wPti/5cH4P9ClVSmWuJj9no0zkThycVhxO5MPs1UtBcadTuc0OElHSWE1WfM4
         J0IA==
X-Forwarded-Encrypted: i=1; AJvYcCWnFysvS0tTy5UjUoICrBdyHRLkXXRRkYmkdLZv6YcxTw4F0AY4YAk1IiR6uY+4tCOJcsnjfFNF0pFG59CyZtzbiCMd0dmYbHZSs16D9OU9
X-Gm-Message-State: AOJu0Yxxi7MTU9q4P/YIQnuSq33XMvUOsgpMU8F/c9cFJpQxS3x+GqGU
	ml+RVDczHbKahFaIhTLeER6hWfJwRHbYdb0qCaxrbT4kc/bUg7ptU/cPWq5BhQMnDJfWIzIluWO
	rWrDjaCERoYFhPzz/l37M6SmEVfYJFfuimwMbfw==
X-Google-Smtp-Source: AGHT+IEJg6eBXgbrMvBxZrqHkCbyEafHccYY//puWMRuRRJPxivVjKGGtxP4Mzjd2PLpKtGs9YHHsRYFuI2P7eGObSs=
X-Received: by 2002:a81:e946:0:b0:609:fff2:3bbc with SMTP id
 e6-20020a81e946000000b00609fff23bbcmr3613852ywm.49.1712784886891; Wed, 10 Apr
 2024 14:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240410091106.749233-1-cleger@rivosinc.com>
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 10 Apr 2024 14:34:33 -0700
Message-ID: <CAKC1njRJRnxj8XjwJ-Yx6Guu=9kSEdaFnxF1e+gXq9ij_j=atA@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add support for a few Zc* extensions as well as Zcmop
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_143449_076120_86BF5C45 
X-CRM114-Status: GOOD (  13.00  )
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

Rm9yIHRoZSBzZXJpZXM6CgpSZXZpZXdlZC1ieTogRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2lu
Yy5jb20+CgpPbiBXZWQsIEFwciAxMCwgMjAyNCBhdCAyOjEz4oCvQU0gQ2zDqW1lbnQgTMOpZ2Vy
IDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IEFkZCBzdXBwb3J0IGZvciAoeWV0IGFn
YWluKSBtb3JlIFJWQTIzVTY0IG1pc3NpbmcgZXh0ZW5zaW9ucy4gQWRkCj4gc3VwcG9ydCBmb3Ig
WmNtb3AsIFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBleHRlbnNpb25zIGlzYSBzdHJpbmcgcGFyc2lu
ZywKPiBod3Byb2JlIGFuZCBrdm0gc3VwcG9ydC4gWmNlLCBaY210IGFuZCBaY21wIGV4dGVuc2lv
bnMgaGF2ZSBiZWVuIGxlZnQKPiBvdXQgc2luY2UgdGhleSB0YXJnZXQgbWljcm9jb250cm9sbGVy
cy9lbWJlZGRlZCBDUFVzIGFuZCBhcmUgbm90IG5lZWRlZAo+IGJ5IFJWQTIzVTY0Cj4KPiBUaGlz
IHNlcmllcyBpcyBiYXNlZCBvbiB0aGUgWmltb3Agb25lIFsxXS4KPgo+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwNDA0MTAzMjU0LjE3NTI4MzQtMS1jbGVn
ZXJAcml2b3NpbmMuY29tLyBbMV0KPgo+IENsw6ltZW50IEzDqWdlciAoMTApOgo+ICAgZHQtYmlu
ZGluZ3M6IHJpc2N2OiBhZGQgWmNhLCBaY2YsIFpjZCBhbmQgWmNiIElTQSBleHRlbnNpb24KPiAg
ICAgZGVzY3JpcHRpb24KPiAgIHJpc2N2OiBhZGQgSVNBIHBhcnNpbmcgZm9yIFpjYSwgWmNmLCBa
Y2QgYW5kIFpjYgo+ICAgcmlzY3Y6IGh3cHJvYmU6IGV4cG9ydCBaY2EsIFpjZiwgWmNkIGFuZCBa
Y2IgSVNBIGV4dGVuc2lvbnMKPiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBaY2EsIFpjZiwgWmNkIGFu
ZCBaY2IgZXh0ZW5zaW9ucyBmb3IgR3Vlc3QvVk0KPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czog
QWRkIHNvbWUgWmMqIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QKPiAgIGR0LWJpbmRp
bmdzOiByaXNjdjogYWRkIFpjbW9wIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24KPiAgIHJpc2N2
OiBhZGQgSVNBIGV4dGVuc2lvbiBwYXJzaW5nIGZvciBaY21vcAo+ICAgcmlzY3Y6IGh3cHJvYmU6
IGV4cG9ydCBaY21vcCBJU0EgZXh0ZW5zaW9uCj4gICBSSVNDLVY6IEtWTTogQWxsb3cgWmNtb3Ag
ZXh0ZW5zaW9uIGZvciBHdWVzdC9WTQo+ICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgWmNt
b3AgZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0Cj4KPiAgRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2h3cHJvYmUucnN0ICAgICAgICAgIHwgMjQgKysrKysrKysrKysrCj4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDM3ICsrKysrKysrKysrKysr
KysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICAgICAgICAgIHwg
IDUgKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAgICAgICB8
ICA1ICsrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggICAgICAgICAgICAg
fCAgNSArKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAg
IHwgIDUgKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgICAgICAg
ICB8ICA1ICsrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgICAgICAgICAg
ICAgfCAxMCArKysrKwo+ICAuLi4vc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyAg
ICAgICAgfCAyMCArKysrKysrKysrCj4gIDkgZmlsZXMgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMo
KykKPgo+IC0tCj4gMi40My4wCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
