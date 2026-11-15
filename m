Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550AB606A31E
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 08:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=am2cQOFf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=leoJihDx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dYha04MGGVkltI6Q8A+Go4W7sZDJO4HiZABaFmNhPNo=; b=am2cQOFfcg9OGZX1YfAaY3jMxu
	8WGySmUpDCZL3P0y4MezQyHDZjgBNbYwVySSTnBDxVBYty0jZHa0A8xDOybHdbqrWzOkrjlaJlpeX
	CWi2DB99cSug9Ek5XMPyxd5ap+Dj1t9MdR9fYX3YryAPqgeg1Hp5FpeSnBIC3qnRuCFAYK8eJOr8b
	hp2e+dkxIDS2V4yZUbCAQsuKouxhEUlWuDSdOy9eLEd5grZmOgrLJBJHyzP0zntvRXTPqQ2/Obxtc
	xVhUKwDYOGstjftk1gRkn9frDeaFOBBpWcFhbPfQmsm2dXjAXTsWpvdwPkG0DED2TqDXxmmtDszp1
	lsYCGg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVaI-0000000HEeJ-1ER1;
	Sun, 15 Nov 2026 08:27:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVaG-0000000HEdC-38fI
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 08:27:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12849835e9.1
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 00:27:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794731251; cv=none;
        d=google.com; s=arc-20260327;
        b=bfIdJTKCQUvxaYJpAM1jiV9SVZDmWPZiGzKfY9ji98TSL0t9icdrZS59VtI+h4xnEs
         gCyZM/N00Bkx9yxVFGCbmcitxWpWwkTuufe5T2Zpd2A3Bb9uWIUL4UnB61/A45pbWmIt
         33clckwuZs3xblZhZZ6C7cm2LkNgDN/WZLdmm7HrHpG54PaPI7XJf30yDxmTELTbpQ3j
         7gC22Kj+7ar+WU2aITwdPIO30BBteUBV7y7q4usS9CUr2uis0ooNjNuPoSAgPXZFmcsx
         bk38L0nVH4GDtydPIjonPkjqDfm/wRQbSFxoq0jAlRfJxkw5N/xRywrQKAt1EeRm1VLp
         sanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aiSvnartFRsxRkzyDYAtms10TvAxc9fqqCfE0o7gA2A=;
        fh=4gp7N2CtRd12uX1R7p+wJ1QzLgBDYfMRRDrgQtCjqFw=;
        b=LD3GvAQreU8Xah6RFKBMFFhUeBTRRwkdFbAHIk0jzdbBMdLmjzA43I8hyexpnVZ/6H
         2FkjUGwcxuY228S5n9ziQbaFzTWBA7KXNJdzY924P1vC0yVSPVcqUO2NYjoahUGRme4l
         WerKNwjSAn0ffm+F+/LKVeQHD9prLEEHZHiRNMxIae30Snp+7RHXvp8H+ap0zTOJQHDz
         3DQuEeJGxnU/USj91BYW5rBViIc2r6fw/YaTPLVxdTgU2XWc12VTb+NJQgWDWCypEs2u
         m0BVrdxBq9svMgsKVZaWFoUSeBx49DgPkS01TPSd+2qfNT0AhMbWVKM5a79DyZ4bL8Br
         ISKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794731251; x=1795336051; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aiSvnartFRsxRkzyDYAtms10TvAxc9fqqCfE0o7gA2A=;
        b=leoJihDxI8oZ3M2SsXuB7mwhP7lbstU6W2D/n4qj3jvNtiqYPual2wcYTU5CbX75sS
         YZTZppkgn2sAtjdcnG76wYda6k0CqLDaYxGrpzJ8OIXiKyQwarMnt5BlU0poN6yuD923
         mmY9KNqPCCdKfnjVv3m/hD2uj1kL0ejjZfO93ScOZ+0b52RHqySgfmINhZ7KssL8P8yC
         GUkNdhpGGV5PO9/u2chJBolxq83Nl1raugz4R+hDF9JmurRFIG9B4OYbh2ni1EyYD3Qk
         6wfpf1V3945sFdd99WdThbg+YlghR1pt57chbrfGY1OHy3Lh+B1VFdclBl1iVOxzGZxN
         BhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731251; x=1795336051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aiSvnartFRsxRkzyDYAtms10TvAxc9fqqCfE0o7gA2A=;
        b=TIKoQu/WBMnIYGtdQpqsHlHOwJtgIlEmfV9mUQb99ifgCJFPV686OI8f8LfRpcrPph
         kC5ENy1xBu6KUhAvz7pJC6QQY0Dq22c1uTKufdCcL8wPJWt26JRoMXhXg9eTHPKIAVWO
         F0k+COwe9Cw63aS3Vhnt5eRnSujfD58eOwvmlORtRkUJDGuRkBoP5ZgD2KUrz57gODVa
         2LSTvNWQloKVehWh68AJWxCd75BYUL35efzQdN+WYpShcQloJCCM25twDFODKN1Dnfey
         4Ocl3cgSyeUpQR9osaL7hEhJMNARbE/Sed2BK5Mbek8aD75eHk8Qz4npImZ+S8VMmkJ9
         hGBw==
X-Forwarded-Encrypted: i=1; AL+hErEWzEuWlYXZTX2zfOPAer9dGk1nP5j1s/ETNmR3xZ6J1eXqD169soL+ON2HqZqw3utViuGx8zfztwj2qw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8h7xDXs2V06lZVHfwgcDL8kqULzxo0oj2GYlGprfXPnXnN35rZ
	3xe9VtV33yX+vHrd3ibU3Zr+jfyc4NGUCwp0YeecLM2q+c7IZVAhX7RUhL70lEQfEegJJSkqVc2
	CdV1jZVcAYWvL0jRxOtWza2i8JkGq++oLFzT94A+DeQ==
X-Gm-Gg: AYBFou2koUgg/TJInGYM72FCALNnJtcR3mNUUsO3qGys8/e4Yn46bkXk7HhhvZhvtkC
	1RQKjTZE053BnVXWOKJ6zE4/EG1C2rNt5+DZ+kGi5cW8kRd77gYvbqFRTAL6C04U3SKpeq9Utao
	KmelV605j0X7IuEvWqfC5B7kzjuihl+jUABjz1MOT86S9D7lYUa1e9YbgYpE5zNTbWLKTPxCpgw
	GSym0HzpBd+jKm68u5NIw781Ph4+LOo2pXzDXNSDJtQqGSTFJFx3SgmBU1nuhqO0Yh//RLfXFzH
	AKQF6UR6Q+npf9OPCQRwOEpm8txu56WBfXCfBpcfiw5bXGwOaW8ocGdyTYI77gDHzYX1ag9pry+
	T+fTSYrOl58omAdK7Qxv+GjEW04zWlkxPSqJPJG6HrMnKTcJyuitBW39DaN5pcgo7ExwJREWsvL
	jIM8r4ug6kpHs0JPLJehrLQ9hPcz3xUO4b5oH0AX49DJDf2JHjkvFb
X-Received: by 2002:a05:600c:6208:b0:4a4:fc8c:cfd9 with SMTP id
 5b1f17b1804b1-4bb55a66467mr149044985e9.25.1794731250698; Sun, 15 Nov 2026
 00:27:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104161512.883885-1-anup.patel@oss.qualcomm.com>
 <20261104161512.883885-2-anup.patel@oss.qualcomm.com> <CACnXVnfokcEnSgQS_wLN=LZ=jztisuusft6nC8Z--+o+xCC1tA@mail.gmail.com>
In-Reply-To: <CACnXVnfokcEnSgQS_wLN=LZ=jztisuusft6nC8Z--+o+xCC1tA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 15 Nov 2026 13:57:19 +0530
X-Gm-Features: AclHuK_i7RtARhSnEV4JaRu_cVL19f5fuKwJ5a_U31KgZmQUYeTFRxuQRxn9Ppk
Message-ID: <CAAhSdy0+bdkTutXEL-0FKa7meg51wEsJxB9M=kuNLUNEaCVaRA@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_002732_803134_45B14E9F 
X-CRM114-Status: GOOD (  18.20  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, linux-kernel@vger.kernel.org, Sunil V L <sunilvl@oss.qualcomm.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTEsIDIwMjYgYXQgNToxNuKAr1BNIFpoYW5wZW5nIFpoYW5nCjx6aGFuZ3po
YW5wZW5nLmphc3BlckBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAx
MS81LzI2IDEyOjE1IEFNLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gRnJvbTogQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPgo+ID4gSW4gUklTQy1WLCB0aGVyZSBpcyBubyBD
U1IgcmVhZC93cml0ZSBpbnN0cnVjdGlvbiB3aGljaCB0YWtlcyBDU1IKPiA+IG51bWJlciB2aWEg
cmVnaXN0ZXIgc28gYWRkIGNvbW1vbiBjc3JfcmVhZF9udW0oKSBhbmQgY3NyX3dyaXRlX251bSgp
Cj4gPiBmdW5jdGlvbnMgd2hpY2ggYWxsb3cgYWNjZXNzaW5nIGNlcnRhaW4gQ1NScyBieSBwYXNz
aW5nIENTUiBudW1iZXIKPiA+IGFzIHBhcmFtZXRlci4gVGhlc2UgY29tbW9uIGZ1bmN0aW9ucyB3
aWxsIGJlIGZpcnN0IHVzZWQgYnkgdGhlCj4gPiBBQ1BJIENQUEMgZHJpdmVyIGFuZCBSSVNDLVYg
UE1VIGRyaXZlci4KPiA+Cj4gPiBBbHNvLCB0aGUgUklTQy1WIEFDUEkgRkZIIHNwZWNpZmljYXRp
b24gYWxsb3dzIGFyYml0cmFyeSBDU1IgbnVtYmVyCj4gPiBhcyBDUFBDIHJlZ2lzdGVyIGFuZCB0
aGUgUklTQy1WIFNCSSBzcGVjaWZpY2F0aW9uIGFsbG93cyBhcmJpdHJhcnkKPiA+IENTUiBudW1i
ZXIgYXMgUE1VIGhhcmR3YXJlIGNvdW50ZXIuIFRoaXMgbWVhbnMgQUNQSSBDUFBDIGRyaXZlciBh
bmQKPiA+IFJJU0MtViBQTVUgZHJpdmVyIG5vIGxvbmdlciBuZWVkIHRvIGRvIHNhbml0eSBjaGVj
a3Mgb24gQ1NSIG51bWJlcgo+ID4gd2hpY2ggYXJlIG5vdyBkb25lIGJ5IHRoZSBjb21tb24gY3Ny
X3JlYWRfbnVtKCkgYW5kIGNzcl93cml0ZV9udW0oKQo+ID4gZnVuY3Rpb25zLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gUmV2
aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgo+ID4gUmV2aWV3
ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiBSZXZpZXdl
ZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gPiBSZXZpZXdlZC1ieTog
TnV0dHkgTGl1IDxudXR0eS5saXVAaG90bWFpbC5jb20+Cj4gPiAtLS0KPiA+ICAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jc3IuaCB8ICAgMyArCj4gPiAgIGFyY2gvcmlzY3Yva2VybmVsL01ha2Vm
aWxlICAgfCAgIDEgKwo+ID4gICBhcmNoL3Jpc2N2L2tlcm5lbC9jc3IuYyAgICAgIHwgMTY1ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgIGRyaXZlcnMvYWNwaS9yaXNj
di9jcHBjLmMgICAgfCAgMTcgKystLQo+ID4gICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11LmMgICAg
IHwgIDU0ICsrLS0tLS0tLS0tLQo+ID4gICA1IGZpbGVzIGNoYW5nZWQsIDE4NCBpbnNlcnRpb25z
KCspLCA1NiBkZWxldGlvbnMoLSkKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
a2VybmVsL2Nzci5jCj4gPgo+ID4gWy4uLl0KPiA+ICsgICAgIHN3aXRjaCAoY3NyX251bSkgewo+
ID4gKyAgICAgc3dpdGNoY2FzZV9jc3JfcmVhZF8zMihDU1JfQ1lDTEUpOwo+ID4gKyAgICAgc3dp
dGNoY2FzZV9jc3JfcmVhZF8zMihDU1JfQ1lDTEVIKTsKPgo+IENvdWxkIHdlIGd1YXJkIHRoZSBD
WUNMRUggY2FzZXMgd2l0aCBDT05GSUdfMzJCSVQ/IFRoZXkncmUgUlYzMi1vbmx5LgoKT2theSwg
SSB3aWxsIGFkZCAjaWYgZm9yIENPTkZJR18zMkJJVC4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
