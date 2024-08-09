Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E6AC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ccvs8ynB5I42qk8Gb6oIYcnwnhvQimFCVlMveZWVjyg=; b=QZVkH5hXIDzRsz
	Ie9CxoLb+FkS6yMb3fFxGHOnM7htyn6e3lACOcTp3OFrHIv2O0bUezcd9Z1cau+2cW0b2ZIugKoDM
	mGcLoqjb7+4vlPa7a/47WyrcmO7yym4lK6bRjlzp6y6vLOIcnxB7rI2M4ecEDtRHJ4WnQVZk2bDgf
	mPAS6QAJ24x51nke9LZ2aZN+XO5qI6VDqWru+iE+KkbNvdTLDgTtal29/pnAV6xAsOJMhr17nuVNU
	Z+cWEd0JwzkQL+DvrDUEmQYUbmAnNB8/hWqd3VdmsoFLf89awQs8TDOni029WQ3h3/LmWcW2YICVI
	f6GlVzATHj+UK7oPes9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scPga-0000000BLKr-1FZo;
	Fri, 09 Aug 2024 13:29:40 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scPgX-0000000BLIq-30ec
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 13:29:39 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52efd8807aaso2558090e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723210175; x=1723814975; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuzwnBVQwfnD4VRTU1K9TpVmgTpZ9T24iNeNAWvAywI=;
        b=VIe+YEVk25Zt9zC7OmnITCTyMT8RBs59bGfxuEmEsMVTbGP96+ThVKiD7nQXzcFMiV
         nSd5ly+ZUVm/speNoMUYsg2AVv+pd1CwmCIqAOxc+uF8/yoD6BOQLYJFkGa4HRbbsJD9
         CWtFSms0YzrFWbWiNze+O0uaHRruBxt9FMF13zSvsYJ/o0OGB4hkxh3xUvr5+akIuewn
         XUi1DQvwKm6tDAMxxkd6gKUyQtu+q5nbpUDlylbsBYXiCTELkjejGuyEhdX3kP9w2fai
         yRh9wbCLauHwf8bBWcij40jthr8YA3N9ELrHeQfN3Tzyll5nfdz2kkGlNXGt6S3nPHZr
         vplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723210175; x=1723814975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuzwnBVQwfnD4VRTU1K9TpVmgTpZ9T24iNeNAWvAywI=;
        b=Mwye8kd70eCMTBg1Lq+EMahGRQ4iOhWMinYwjb6/4o/YDMJGh0JVshbxPuHckeNnDp
         ZO6V9CxDXIF76sjgCdd64roTdKDXBLpBgXAnEgIJ23ZCC3efCZBYuKUPR+wx+pEQc2hL
         S9R/P802paefcEzksGatR1JUnC9w00oBDBMljt1kLlM1rqdEwRmzYzEyrFKdRX/UwJGX
         pDOq1fyPJoE6dqootxlVX10FGorMMGNoLsivSujidtW5XSpy+yTQDhb290aBJfNN27HK
         eipcF2sdOPIkPAgj3x/IHiwcWLYT1+apLRIMVvN2Tmd9GbJZbclMiiHE7fMa+fTXjce2
         5BSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFXU90NMLpSo1RdvFsSmRetYXQOW0ltNvSpfiEmzzyWYhOuixZv0ezOueh93fQinPH2hJrGq1N1A85di5VkEh8iJTZpnV5p4/sgFGUbZAR
X-Gm-Message-State: AOJu0YwYnzYaEpt5CsnumA1n+L1Zjrs31I1kvuFEA1j6G3dfdoT/JXUo
	us1PAOJsdO025ZCeW1vjy2Uu8epd60eBF6sxz3p5qnHm1uCCtQI5wdhcNZgah9LQ1835AuQ0g6f
	g15rXV3FjZaN3UMfJenJOq3xhuGejsg3SnvOn9Q==
X-Google-Smtp-Source: AGHT+IGclZY00rkf851HYZJyFJ2+DYuLetQhuut/JN+KciMvpwBJfqStH8Gc3aNdvraTu436hwns7qMiWhWECweOpAw=
X-Received: by 2002:a05:6512:b03:b0:52c:8a39:83d7 with SMTP id
 2adb3069b0e04-530ee9f549dmr1187453e87.52.1723210174761; Fri, 09 Aug 2024
 06:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240807154943.150540-2-ajones@ventanamicro.com>
In-Reply-To: <20240807154943.150540-2-ajones@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 9 Aug 2024 18:59:23 +0530
Message-ID: <CAK9=C2Wxk8gDq-2jct47OOO4eK634nDUUGE8NdDrd88_s8_W4g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix sbiret init before forwarding to userspace
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org, 
	cade.richard@berkeley.edu, jamestiotio@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_062937_822517_012B29ED 
X-CRM114-Status: GOOD (  18.81  )
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

T24gV2VkLCBBdWcgNywgMjAyNCBhdCA5OjE54oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIGZvcndhcmRpbmcgU0JJIGNhbGxzIHRvIHVz
ZXJzcGFjZSBlbnN1cmUgc2JpcmV0LmVycm9yIGlzCj4gaW5pdGlhbGl6ZWQgdG8gU0JJX0VSUl9O
T1RfU1VQUE9SVEVEIGZpcnN0LCBpbiBjYXNlIHVzZXJzcGFjZQo+IG5lZ2xlY3RzIHRvIHNldCBp
dCB0byBhbnl0aGluZy4gSWYgdXNlcnNwYWNlIG5lZ2xlY3RzIGl0IHRoZW4gd2UKPiBjYW4ndCBi
ZSBzdXJlIGl0IGRpZCBhbnl0aGluZyBlbHNlIGVpdGhlciwgc28gd2UganVzdCByZXBvcnQgaXQK
PiBkaWRuJ3QgZG8gb3IgdHJ5IGFueXRoaW5nLiBKdXN0IGluaXQgc2JpcmV0LnZhbHVlIHRvIHpl
cm8sIHdoaWNoIGlzCj4gdGhlIHByZWZlcnJlZCB2YWx1ZSB0byByZXR1cm4gd2hlbiBub3RoaW5n
IHNwZWNpYWwgaXMgc3BlY2lmaWVkLgo+Cj4gS1ZNIHdhcyBhbHJlYWR5IGluaXRpYWxpemluZyBi
b3RoIHNiaXJldC5lcnJvciBhbmQgc2JpcmV0LnZhbHVlLCBidXQKPiB0aGUgdmFsdWVzIHVzZWQg
YXBwZWFyIHRvIGNvbWUgZnJvbSBhIGNvcHkrcGFzdGUgb2YgdGhlIF9fc2JpX2VjYWxsKCkKPiBp
bXBsZW1lbnRhdGlvbiwgaS5lLiBhMCBhbmQgYTEsIHdoaWNoIGRvbid0IGFwcGx5IHByaW9yIHRv
IHRoZSBjYWxsCj4gYmVpbmcgZXhlY3V0ZWQsIG5vciBhdCBhbGwgd2hlbiBmb3J3YXJkaW5nIHRv
IHVzZXJzcGFjZS4KPgo+IEZpeGVzOiBkZWE4ZWUzMWEwMzkgKCJSSVNDLVY6IEtWTTogQWRkIFNC
SSB2MC4xIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4xMSBmaXhlcy4K
ClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyB8IDQgKyst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaS5jCj4gaW5kZXggNjJmNDA5ZDQxNzZlLi43ZGUxMjhiZThkYjkgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpLmMKPiBAQCAtMTI3LDggKzEyNyw4IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2Zvcndh
cmQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKQo+ICAgICAgICAg
cnVuLT5yaXNjdl9zYmkuYXJnc1szXSA9IGNwLT5hMzsKPiAgICAgICAgIHJ1bi0+cmlzY3Zfc2Jp
LmFyZ3NbNF0gPSBjcC0+YTQ7Cj4gICAgICAgICBydW4tPnJpc2N2X3NiaS5hcmdzWzVdID0gY3At
PmE1Owo+IC0gICAgICAgcnVuLT5yaXNjdl9zYmkucmV0WzBdID0gY3AtPmEwOwo+IC0gICAgICAg
cnVuLT5yaXNjdl9zYmkucmV0WzFdID0gY3AtPmExOwo+ICsgICAgICAgcnVuLT5yaXNjdl9zYmku
cmV0WzBdID0gU0JJX0VSUl9OT1RfU1VQUE9SVEVEOwo+ICsgICAgICAgcnVuLT5yaXNjdl9zYmku
cmV0WzFdID0gMDsKPiAgfQo+Cj4gIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N5c3RlbV9yZXNl
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gLS0KPiAyLjQ1LjIKPgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
