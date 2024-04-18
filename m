Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4132CC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FcydCKnI95qi4XTlWt3FCotUVu5EhO9XHhvsYfwA1yc=; b=JbIQY8d33oMhqY
	j5nxHF2g1d9zI18GkFQbNZcvrayDuUHYUv2Z4tfvozTAoPFHLBi7h81B9SQlHxiGPdMU8OwKxV0cU
	ilMdme/s2xc5YzwVJDpwJUvKR634cT0AMkY60tH9jMrH+7EsnuN3+/+i73ixqtMUBHJ/cKbw7Mezv
	o30CKeljdBI1n6HPCE9fUrR1UwfC3rkUGUwOeup6NN9BbALL9eRkSCunCdtnKvU13yKIRd+VfdSqe
	KPRz7PdNQcx2858E2phLbdsSy5uQLec4Y87vAdNrFWrEakhu/VWQ3UWKVZWOCiPPotltA6+WJZTXj
	c5hXU3hrbSkJ19yb29dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR87-00000002D5e-3kc0;
	Thu, 18 Apr 2024 12:44:43 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7W-00000002CVC-0F9Y
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:10 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51a70f6b3e3so42489e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444242; x=1714049042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Bj6qFEBTQkW22oNb4zguAXGn3Gn0KYF9aSmL0IcZwU=;
        b=PKMkWbhNlkp0Is1dF3CbmcQA0W40WBvo6Ne9t71v6C4PIKrIMM0PJ6X2g+UFggUu2M
         XJe4IDIzXkxKMlnpWTyJ+uyXWRH5H9EorEtsqTFoPWsQ/1tQZaAK8nCfiull6DI5FdGO
         Gpa2OArKQu66hUdtsNvwP6srfLaHgr29bT2AKPMei15PqkkXM3hKxu1RGMhXfqgZnGrz
         4sBVMaSZNtvlBCx9yXFplHeCBb9wWFPCJyOyUdlpCE90u/O8KQ49sFe6AQCPbzFhYdNH
         Wjhv1GRyS2KtzEOYZVN5SwDtgInns864Wix1npMEyZ/wVmbU1KZa2/7J/udc8PMomXIo
         /a6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444242; x=1714049042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Bj6qFEBTQkW22oNb4zguAXGn3Gn0KYF9aSmL0IcZwU=;
        b=rbZQUrd3FsK7o/TC/Pwq4DloXgiYDJNmyQNcCZBuY1AVaYYoywKbdY3YcEW5Z25aRJ
         M49gtxDE/tOjPoKhVu4higQk2C9FQecLvW5LI1E6YEeuFmEzDvtr7wdTvBxGse3Wypkj
         NPNzWwJ4pYk4QHY9gVetsD8o4KqBFAVC7sqVV7btSzmYYzX/tZbxwU3ZhFBboBZYn99Y
         CJFSKWNzhaiM5CxoVQ9RWXYp9+9AkRgQuE0qYF59abGoyCVz2Vg8ZtAkkGfj6/Wq9FGs
         H9I1vtecmbsVDeL5/R145NLGU/n9RFIFuZloaBLfjQyLoQKCbztEhjeQ7R1u3r9LMWf5
         8aRg==
X-Forwarded-Encrypted: i=1; AJvYcCU0TV0bniLhOo9+Uu0mVp5rUAt/mcbilgl8BQxcpGTtGUo4+7ZlixrHryt64qBFweuzGxfOrvZvVlXk1d3fGmTqu9sWhEHTmC3Mv/r7i3Y0
X-Gm-Message-State: AOJu0YyozNAa7pRcbeM3B5mfLPd1rX5rFUiozQAUuvLVjSLHavUVoypE
	bGqT6LR7vQYorHEppNcG/RvB+sonnAlXgDc4RGsMGQGVOFi6WMw1ZRQ7rKBQZFs=
X-Google-Smtp-Source: AGHT+IGuPTx5xyQ5D84Wxe16Njbe8/Zc2rt6PLP6jz46BTrSDooOvgKGDoT7RA33/hfmMjVJRZ9Clg==
X-Received: by 2002:a2e:7314:0:b0:2da:590:db77 with SMTP id o20-20020a2e7314000000b002da0590db77mr1413729ljc.0.1713444242557;
        Thu, 18 Apr 2024 05:44:02 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:44:01 -0700 (PDT)
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
Subject: [PATCH v2 07/12] KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
Date: Thu, 18 Apr 2024 14:42:30 +0200
Message-ID: <20240418124300.1387978-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_054406_275732_3C1B2933 
X-CRM114-Status: UNSURE (   8.94  )
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBleHRlbnNpb25zIGZv
ciBHdWVzdC9WTSBzbwphZGQgdGhlc2UgZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxpc3QgdGVzdC4K
ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0t
CiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCAxNiAr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwppbmRleCA0
MDEwN2JiNjE5NzUuLjYxY2FkNDUxNDE5NyAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwpAQCAtNTUsNiArNTUsMTAgQEAgYm9vbCBmaWx0
ZXJfcmVnKF9fdTY0IHJlZykKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdf
UklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pCS0M6CiAJY2FzZSBLVk1fUkVH
X1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNB
X0VYVF9aQktYOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9J
U0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkJTOgorCWNhc2UgS1ZNX1JFR19SSVNDVl9J
U0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkNB
OgorCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xF
IHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkNCOgorCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwg
S1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkNEOgorCWNhc2Ug
S1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJ
U0NWX0lTQV9FWFRfWkNGOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19S
SVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkZBOgogCWNhc2UgS1ZNX1JFR19S
SVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9F
WFRfWkZIOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0Ff
U0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkZITUlOOgpAQCAtNDIxLDYgKzQyNSwxMCBAQCBz
dGF0aWMgY29uc3QgY2hhciAqaXNhX2V4dF9zaW5nbGVfaWRfdG9fc3RyKF9fdTY0IHJlZ19vZmYp
CiAJCUtWTV9JU0FfRVhUX0FSUihaQktDKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpCS1gpLAogCQlL
Vk1fSVNBX0VYVF9BUlIoWkJTKSwKKwkJS1ZNX0lTQV9FWFRfQVJSKFpDQSksCisJCUtWTV9JU0Ff
RVhUX0FSUihaQ0IpLAorCQlLVk1fSVNBX0VYVF9BUlIoWkNEKSwKKwkJS1ZNX0lTQV9FWFRfQVJS
KFpDRiksCiAJCUtWTV9JU0FfRVhUX0FSUihaRkEpLAogCQlLVk1fSVNBX0VYVF9BUlIoWkZIKSwK
IAkJS1ZNX0lTQV9FWFRfQVJSKFpGSE1JTiksCkBAIC05NDUsNiArOTUzLDEwIEBAIEtWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemJrYiwgWkJLQik7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklH
KHpia2MsIFpCS0MpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Ymt4LCBaQktYKTsKIEtW
TV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemJzLCBaQlMpOworS1ZNX0lTQV9FWFRfU0lNUExFX0NP
TkZJRyh6Y2EsIFpDQSksCitLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjYiwgWkNCKSwKK0tW
TV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemNkLCBaQ0QpLAorS1ZNX0lTQV9FWFRfU0lNUExFX0NP
TkZJRyh6Y2YsIFpDRiksCiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpmYSwgWkZBKTsKIEtW
TV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemZoLCBaRkgpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NP
TkZJRyh6ZmhtaW4sIFpGSE1JTik7CkBAIC0xMDAxLDYgKzEwMTMsMTAgQEAgc3RydWN0IHZjcHVf
cmVnX2xpc3QgKnZjcHVfY29uZmlnc1tdID0gewogCSZjb25maWdfemJrYywKIAkmY29uZmlnX3pi
a3gsCiAJJmNvbmZpZ196YnMsCisJJmNvbmZpZ196Y2EsCisJJmNvbmZpZ196Y2IsCisJJmNvbmZp
Z196Y2QsCisJJmNvbmZpZ196Y2YsCiAJJmNvbmZpZ196ZmEsCiAJJmNvbmZpZ196ZmgsCiAJJmNv
bmZpZ196ZmhtaW4sCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
