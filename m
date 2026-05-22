Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9476ECD4F3D
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 07:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIV0aZjn4Rx+m3AzsC0OjQMJtWjcfS2GHxqYIBlzP+0=; b=ZnO/HczRx9oG0b
	eFJUATtSWHTAbwb0jWnKsTEQJ4/aFT3+tcv2iWc0+I3XU391b2G0hii+wrNpCwGR4selbCEcKZoaG
	dAikoRz3mmG5kYY9fS24wMDeQOiImqBBEGVQTXENNfqZAFda92wEFxuQ17geq3ofSbix+3qF1+bQO
	L5z3YSga5+gHyTyA0OoyHqWxHMqhsAWId9ZWbrjst83Vl1FdrNOP5nSCQxLbkBI8Tu+U8z7uBaI9o
	UFnQBii7xeg5NRpxJqfQEnrKmF1juN8gIgD019bk4cVrPtlIXvF4OdMowDL6zh/kCiQnKC6UG/qPA
	YHBxwC0ICzhgjff8zQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKPW-0000000A6Tj-11DO;
	Fri, 22 May 2026 07:35:10 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKPS-0000000A6SW-3Tae
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 07:35:08 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-69d77ed05bcso910554eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 00:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779435305; cv=none;
        d=google.com; s=arc-20240605;
        b=JvdBnxbU34U6BrkYHnqD5ToACpLJMttakWqS52Dva2i9aHX+n1N8wRrTU48fZCA29m
         JcOO9NZHiiuOg0PnQ5bHdCZwG+Q+HTD0A6AWYuJnUypvHq5m/cQTl9wgFyBEF/6g37KO
         oYgygn10wYwJpKsZq9t8F5zNCyW6IrQHkJpyrOvcv5AZE5AbPW5GKgn+auuCLxlJthVW
         fH9qF++cWYpAIbudHePqjHo8esYhzMs3IW3qQrnjweJ3eGoGNde1o3XihPwR+x+VPnqs
         pNu+P01ixrF6Qjj6CaA6U56ATNZOBRHP3ZyaLgC0MiS4ntWnSeW7Wp//34E/cZsKXEnq
         Y4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2J3wJFoJHOMKHD1j8O1ONhE6swOBwU1oMuQv/MHWXDE=;
        fh=reTytpb7+gQuLreXXvRjFVJUXhtb1LtIM3EKsswO/aw=;
        b=FuLTY/ooqDbcBlKd0o417CTNmUL2NQmqLd6/MVWjfa3GM0LTvf9GXbiHYXwIn0gmnh
         mWzYcCmsPOaMjqh4SDaGUcPhP7z+E0eEusxBUfG9mdlEyeKwvoZhbX5S0ejZbeKPmoU+
         ZTQXjxCK38pLybdFKoHQNGFIvSReMJ6xa3sIUMpGloDDTgGH5ltj7E+/xZkQZ2jhHBSj
         IyxTMBDd03+9SZ9eWsTSjxa8dBVqapE+mWlzdHnLmxL/8Rum+wX7unj/hl93+Uz7ylru
         xN/MW8L3amZAzftnoOEI85ZjmI7QJp3M2ADD3wO1uy7hUB1CGIfAkNIKHpPQa7yxneL/
         4o/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1779435305; x=1780040105; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2J3wJFoJHOMKHD1j8O1ONhE6swOBwU1oMuQv/MHWXDE=;
        b=H/fDw2MzDicZyeV/V7jIfUaXGmIMgEvpshPQHnee7dqDO0omMBxNjRmm5Rxh3FUxVx
         zARdt5xeWwz50AWZ+NRKpTLHOloxvDo5kNZVA6A2/aaW3cQIMcenEAS2m3Pa3Yj2PUWI
         b3aZKz/VMuXSIXphTtZU8ms403/XHmNUjknrWckbYq7zaDyVUp9PPhTaGmv39YhRN9DZ
         LQ7vqS2p1YIGVV5XliRr10WZi8Ty/uimGFOfE1pqcH6NxsvPwuYM6ffO/uV8VtuetESd
         5rjDQP/2uG/448Ag172XeZtKTUc+MGyZTdV+bZf19nMLxKWBdnLf0Vsh/N8gW75HvgM8
         LdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779435305; x=1780040105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2J3wJFoJHOMKHD1j8O1ONhE6swOBwU1oMuQv/MHWXDE=;
        b=l9XqFgpvSK5UW4YEzfrz5xQh7B7rRQwgO/EgPJICPH0TitG7VoQgaWDnRNt4zfpEZx
         D7ZaEmlUziNMgwfdxnGV3U4oky1v7feZAqoKTwrGpSV6D5VNi0yAEDkU/ZfGd0hVfDEQ
         O4DNbmArNg5Y9CYocIf2vqBQarbPNVei6s3P4J7xcN2RZeTercApl4vxL2jGLYLYA/89
         1TRSwoZhbc5/y+YzO2haqH4uD0b0kgwYEo3iCDIYSuysWqbJIKZOqrjmILxkrGbs2UmB
         ZO+gel8ZoA9FJZ3D8xzUXUc3oBO+Ro68sVljvMkTcGbp2MAMkze++3lniygjK+KNKpa4
         KtVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RwgYr9jQmP/pQJ+8IQuO9GtG2K9ERbN1WsNiwYkn+4eoIDHafupQrGNMdLTm6/EZOOikD6ioRHQyzbw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwC+z2KiOeduGckmL9a3c2cBvEnWDa2nIZ4KehDfVxxGF4f4ZpI
	Iw4++4peoSVjEA23KGFPYhGn69gNU1m1rRT9VDoXaZxGAvcQEecK4c7EnpfFP+sc3812yqsY+/j
	pWFxRVY7kED9RyJxZObgLwMXiqL+v/LhFUwIW9kfHDQ==
X-Gm-Gg: Acq92OELW5uTWvAF8PHWcOTjylh3ibijuzJQHaydOx6gowJmKMrMeSRe1KENTOQojnN
	9MTpCk1sDAuik3Cue5jA3UfjlGOtMaW9VNC5CRwZzKYaOJ3HL9v5a69kNrbu+32ZSNh/4zd9n7A
	SUCNigs8mIevK9fHUYZzKNgsh8SDSATVMvF83J5CeO92RHHUWjAcD4kqchl5EB0j9LMb/Urm0Cb
	uohLTthnMTV0KGWmCauvroLxiWiahAx93L2/svyuxD2jCLCulJMGaw6po0Md2LJg97oDuoY4S4e
	02kjNLoQpQbTprUbOgldGCXC/PZsh/KXkr4=
X-Received: by 2002:a05:6820:f006:b0:696:70f0:7ada with SMTP id
 006d021491bc7-69d7eafaa52mr1449567eaf.11.1779435305333; Fri, 22 May 2026
 00:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260519031927.70683-1-cuiyunhui@bytedance.com> <59bf4f1e-8d7f-44ff-836b-76b771542e92@sifive.com>
In-Reply-To: <59bf4f1e-8d7f-44ff-836b-76b771542e92@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 22 May 2026 15:34:54 +0800
X-Gm-Features: AVHnY4LMaCWH1JCJew4v3Eb0SV_7GSMeKGYrYP6cVi7e3j3nLtA0-zUeXlMKEXg
Message-ID: <CAEEQ3w=EbmdxUjB0irJo1_euwQhjfnPhzsBjAwHAbeqWutZVWw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] riscv: track effective hardware PTE
 A/D updates
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Qingwei Hu <qingwei.hu@bytedance.com>, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, akpm@linux-foundation.org, 
	pasha.tatashin@soleen.com, andrew+kernel@donnellan.id.au, 
	rmclure@linux.ibm.com, debug@rivosinc.com, baolin.wang@linux.alibaba.com, 
	zhangchunyan@iscas.ac.cn, apopple@nvidia.com, namcao@linutronix.de, 
	wangruikang@iscas.ac.cn, apatel@ventanamicro.com, liu.xuemei1@zte.com.cn, 
	ajones@ventanamicro.com, cleger@rivosinc.com, charlie@rivosinc.com, 
	hui.wang@canonical.com, guodong@riscstar.com, pincheng.plct@isrc.iscas.ac.cn, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_003506_889757_008A3B26 
X-CRM114-Status: GOOD (  28.44  )
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

SGkgU2FtdWVsLAoKT24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMTozMeKAr0FNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIFl1bmh1aSwKPgo+
IE9uIDIwMjYtMDUtMTggMTA6MTkgUE0sIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBTZXBhcmF0ZSBT
dmFkdSBjYXBhYmlsaXR5IGRpc2NvdmVyeSBmcm9tIHRoZSBob3N0J3MgZWZmZWN0aXZlIEFEVUUK
PiA+IHN0YXRlLiBFbmFibGUgU0JJIEZXRlQgUFRFIEEvRCBoYXJkd2FyZSB1cGRhdGluZyBvbiBl
YWNoIG9ubGluZSBDUFUKPiA+IHRocm91Z2ggQ1BVSFAgd2hlbiBib3RoIFN2YWRlIGFuZCBTdmFk
dSBhcmUgcHJlc2VudCwgdXNlIHRoZSByZXN1bHRpbmcKPiA+IHJ1bnRpbWUgc3RhdGUgZm9yIGFy
Y2hfaGFzX2h3X3B0ZV95b3VuZygpLCBhbmQgZmFsbCBiYWNrIHRvCj4gPiBzb2Z0d2FyZS1tYW5h
Z2VkIEEvRCB1cGRhdGVzIHdoZW4gZW5hYmxpbmcgdGhlIGZlYXR1cmUgZmFpbHMuCj4gPgo+ID4g
UGxhdGZvcm1zIHdpdGggU3ZhZHUgYnV0IHdpdGhvdXQgU3ZhZGUgYXJlIHRyZWF0ZWQgYXMgYWx3
YXlzIHVzaW5nCj4gPiBoYXJkd2FyZSBQVEUgQS9EIHVwZGF0ZXMuIEV4cG9zZSB0aGUgcnVudGlt
ZSBzdGF0ZSB0aHJvdWdoIGFuIGlubGluZQo+ID4gZ2V0dGVyIHNvIGhvdCBNTSBwYXRocyBhdm9p
ZCBhbiBvdXQtb2YtbGluZSBmdW5jdGlvbiBjYWxsLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1
bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFFpbmd3
ZWkgSHUgPHFpbmd3ZWkuaHVAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIHwgIDYgKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmggICAgfCAgOCArKy0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jICAgICAgfCA3MyArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ID4gIDMgZmls
ZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiA+IGluZGV4IDczOWZjYzg0YmY3YjIuLjg3N2Q3
MWExZWE3NTUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1
cmUuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiA+IEBA
IC0xMjgsNiArMTI4LDEyIEBAIHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgewo+ID4gIGV4dGVy
biBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXTsKPiA+ICBl
eHRlcm4gY29uc3Qgc2l6ZV90IHJpc2N2X2lzYV9leHRfY291bnQ7Cj4gPiAgZXh0ZXJuIGJvb2wg
cmlzY3ZfaXNhX2ZhbGxiYWNrOwo+ID4gK2V4dGVybiBib29sIHJpc2N2X2h3X3B0ZV9hZF91cGRh
dGluZ19lbmFibGVkOwo+ID4gKwo+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNj
dl9oYXNfaHdfcHRlX2FkX3VwZGF0aW5nKHZvaWQpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIFJF
QURfT05DRShyaXNjdl9od19wdGVfYWRfdXBkYXRpbmdfZW5hYmxlZCk7Cj4gPiArfQo+Cj4gU2hv
dWxkIHRoaXMgdXNlIGEgc3RhdGljIGtleSwgc2luY2UgaXQncyBvbmx5IHVwZGF0ZWQgYXQgYm9v
dCwgYW5kIHlvdSBtZW50aW9uCj4gaXQgaXMgdXNlZCBpbiBNTSBob3QgcGF0aHM/CgpPa2F5LCBJ
IHdpbGwgdXBkYXRlIGluIHRoZSBuZXh0IHBhdGNoIHZlcnNpb24uCgo+Cj4gPgo+ID4gIHVuc2ln
bmVkIGxvbmcgcmlzY3ZfaXNhX2V4dGVuc2lvbl9iYXNlKGNvbnN0IHVuc2lnbmVkIGxvbmcgKmlz
YV9iaXRtYXApOwo+ID4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCByaXNjdl9jcHVfaGFz
X2V4dGVuc2lvbl9saWtlbHkoaW50IGNwdSwgY29uc3QgdW5zaWduZWQgbG9uZyBleHQpCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gaW5kZXggYTFhN2M2NTIwYTA5NS4uMjA2NjNhNDY2
Y2Y2YyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4g
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gQEAgLTczMiwxNCAr
NzMyLDE0IEBAIHN0YXRpYyBpbmxpbmUgcGdwcm90X3QgcGdwcm90X3dyaXRlY29tYmluZShwZ3By
b3RfdCBfcHJvdCkKPiA+ICAjZGVmaW5lIHBncHJvdF9kbWFjb2hlcmVudCBwZ3Byb3Rfd3JpdGVj
b21iaW5lCj4gPgo+ID4gIC8qCj4gPiAtICogQm90aCBTdmFkZSBhbmQgU3ZhZHUgY29udHJvbCB0
aGUgaGFyZHdhcmUgYmVoYXZpb3Igd2hlbiB0aGUgUFRFIEEvRCBiaXRzIG5lZWQgdG8gYmUgc2V0
LiBCeQo+ID4gLSAqIGRlZmF1bHQgdGhlIE0tbW9kZSBmaXJtd2FyZSBlbmFibGVzIHRoZSBoYXJk
d2FyZSB1cGRhdGluZyBzY2hlbWUgd2hlbiBvbmx5IFN2YWR1IGlzIHByZXNlbnQgaW4KPiA+IC0g
KiBEVC4KPiA+ICsgKiBCb3RoIFN2YWRlIGFuZCBTdmFkdSBjb250cm9sIHRoZSBoYXJkd2FyZSBi
ZWhhdmlvciB3aGVuIHRoZSBQVEUgQS9EIGJpdHMKPiA+ICsgKiBuZWVkIHRvIGJlIHNldC4gVGhl
IGNvcmUgTU0gY29kZSBvbmx5IGNhcmVzIHdoZXRoZXIgaGFyZHdhcmUgdXBkYXRpbmcgb2YKPiA+
ICsgKiB0aGUgYWNjZXNzZWQvZGlydHkgc3RhdGUgaXMgY3VycmVudGx5IGFjdGl2ZS4KPiA+ICAg
Ki8KPiA+ICAjZGVmaW5lIGFyY2hfaGFzX2h3X3B0ZV95b3VuZyBhcmNoX2hhc19od19wdGVfeW91
bmcKPiA+ICBzdGF0aWMgaW5saW5lIGJvb2wgYXJjaF9oYXNfaHdfcHRlX3lvdW5nKHZvaWQpCj4g
PiAgewo+ID4gLSAgICAgcmV0dXJuIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1Zf
SVNBX0VYVF9TVkFEVSk7Cj4gPiArICAgICByZXR1cm4gcmlzY3ZfaGFzX2h3X3B0ZV9hZF91cGRh
dGluZygpOwo+ID4gIH0KPiA+Cj4gPiAgLyoKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IGlu
ZGV4IGY0NmFhNTYwMmQ3NGQuLmU0NmIyZDJiNDllZWQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYwo+ID4gQEAgLTM1LDYgKzM1LDggQEAKPiA+ICBzdGF0aWMgYm9vbCBhbnlfY3B1X2hh
c196aWNib3o7Cj4gPiAgc3RhdGljIGJvb2wgYW55X2NwdV9oYXNfemljYm9wOwo+ID4gIHN0YXRp
YyBib29sIGFueV9jcHVfaGFzX3ppY2JvbTsKPiA+ICtib29sIHJpc2N2X2h3X3B0ZV9hZF91cGRh
dGluZ19lbmFibGVkIF9fcmVhZF9tb3N0bHk7Cj4gPiArRVhQT1JUX1NZTUJPTF9HUEwocmlzY3Zf
aHdfcHRlX2FkX3VwZGF0aW5nX2VuYWJsZWQpOwo+ID4KPiA+ICB1bnNpZ25lZCBsb25nIGVsZl9o
d2NhcCBfX3JlYWRfbW9zdGx5Owo+ID4KPiA+IEBAIC0yODcsMTUgKzI4OSw3NCBAQCBzdGF0aWMg
aW50IHJpc2N2X2V4dF96dmZiZndtYV92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhICpkYXRhLAo+ID4gICAgICAgcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4gPiAgfQo+ID4K
PiA+IC1zdGF0aWMgaW50IHJpc2N2X2V4dF9zdmFkdV92YWxpZGF0ZShjb25zdCBzdHJ1Y3Qgcmlz
Y3ZfaXNhX2V4dF9kYXRhICpkYXRhLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCj4gPiArc3RhdGljIHZvaWQgcmlz
Y3Zfc2V0X2h3X3B0ZV9hZF91cGRhdGluZyhib29sIGVuYWJsZWQpCj4gPiArewo+ID4gKyAgICAg
V1JJVEVfT05DRShyaXNjdl9od19wdGVfYWRfdXBkYXRpbmdfZW5hYmxlZCwgZW5hYmxlZCk7Cj4g
PiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgcmlzY3ZfaHdfcHRlX2FkX3VwZGF0aW5nX3N0YXJ0
aW5nKHVuc2lnbmVkIGludCBjcHUpCj4gPiArewo+ID4gKyAgICAgaW50IHJldDsKPiA+ICsKPiA+
ICsgICAgIHJldCA9IHNiaV9md2Z0X3NldChTQklfRldGVF9QVEVfQURfSFdfVVBEQVRJTkcsIDEs
IDApOwo+ID4gKyAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICBpZiAocmV0ICE9IC1F
T1BOT1RTVVBQKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHByX2VycigiQ1BVJXUgZmFpbGVk
IHRvIGVuYWJsZSBoYXJkd2FyZSBQVEUgQS9EIHVwZGF0aW5nOiAlZFxuIiwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY3B1LCByZXQpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4g
cmV0Owo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+
ID4gK3N0YXRpYyBpbnQgcmlzY3ZfaHdfcHRlX2FkX3VwZGF0aW5nX2R5aW5nKHVuc2lnbmVkIGlu
dCBjcHUpCj4gPiAgewo+ID4gLSAgICAgLyogU1ZBREUgaGFzIGFscmVhZHkgYmVlbiBkZXRlY3Rl
ZCwgdXNlIFNWQURFIG9ubHkgKi8KPiA+IC0gICAgIGlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25f
YXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfU1ZBREUpKQo+ID4gLSAgICAgICAg
ICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiArICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAg
ICAgcmV0ID0gc2JpX2Z3ZnRfc2V0KFNCSV9GV0ZUX1BURV9BRF9IV19VUERBVElORywgMCwgMCk7
Cj4gPiArICAgICBpZiAocmV0KQo+ID4gKyAgICAgICAgICAgICBwcl93YXJuKCJDUFUldSBmYWls
ZWQgdG8gZGlzYWJsZSBoYXJkd2FyZSBQVEUgQS9EIHVwZGF0aW5nOiAlZFxuIiwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBjcHUsIHJldCk7Cj4KPiBXaHkgYm90aGVyIGRpc2FibGluZyB0aGUg
ZmVhdHVyZSB3aGVuIHRha2luZyBhIENQVSBvZmZsaW5lPyBJdCBkb2Vzbid0IGNyZWF0ZQo+IGFu
eSBwcm9ibGVtcyB0byBsZWF2ZSBpdCBlbmFibGVkLgoKT2theSwgSSB3aWxsIHVwZGF0ZSBpbiB0
aGUgbmV4dCBwYXRjaCB2ZXJzaW9uLgoKPgo+IFJlZ2FyZHMsCj4gU2FtdWVsCj4KPiA+ICsKPiA+
ICsgICAgIHJldHVybiAwOwo+ID4gK30KPiA+Cj4gPiArc3RhdGljIGludCBfX2luaXQgcmlzY3Zf
aHdfcHRlX2FkX3VwZGF0aW5nX2luaXQodm9pZCkKPiA+ICt7Cj4gPiArICAgICBib29sIGhhc19z
dmFkZSwgaGFzX3N2YWR1Owo+ID4gKyAgICAgaW50IHN0YXRlOwo+ID4gKwo+ID4gKyAgICAgaGFz
X3N2YWRlID0gcmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NWQURF
KTsKPiA+ICsgICAgIGhhc19zdmFkdSA9IHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklT
Q1ZfSVNBX0VYVF9TVkFEVSk7Cj4gPiArCj4gPiArICAgICBpZiAoIWhhc19zdmFkdSkKPiA+ICsg
ICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArCj4gPiArICAgICBpZiAoIWhhc19zdmFkZSkgewo+
ID4gKyAgICAgICAgICAgICByaXNjdl9zZXRfaHdfcHRlX2FkX3VwZGF0aW5nKHRydWUpOwo+ID4g
KyAgICAgICAgICAgICBwcl9pbmZvKCJyaXNjdjogaGFyZHdhcmUgUFRFIEEvRCB1cGRhdGluZyBl
bmFibGVkXG4iKTsKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArICAgICB9Cj4gPiAr
Cj4gPiArICAgICBzdGF0ZSA9IGNwdWhwX3NldHVwX3N0YXRlKENQVUhQX0FQX09OTElORV9EWU4s
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJyaXNjdi9wdGUtYWQ6c3RhcnRp
bmciLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByaXNjdl9od19wdGVfYWRf
dXBkYXRpbmdfc3RhcnRpbmcsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJp
c2N2X2h3X3B0ZV9hZF91cGRhdGluZ19keWluZyk7Cj4gPiArICAgICBpZiAoc3RhdGUgPCAwKSB7
Cj4gPiArICAgICAgICAgICAgIHByX2luZm8oInJpc2N2OiBsZWF2ZSBQVEUgQS9EIHVwZGF0ZXMg
c29mdHdhcmUtbWFuYWdlZCAoJWQpXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHN0YXRl
KTsKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAg
ICAvKgo+ID4gKyAgICAgICogQSBzdWNjZXNzZnVsIENQVUhQX0FQX09OTElORV9EWU4gcmVnaXN0
cmF0aW9uIG1lYW5zIHRoZSBzdGFydHVwCj4gPiArICAgICAgKiBjYWxsYmFjayBoYXMgYWxyZWFk
eSBzdWNjZWVkZWQgb24gYWxsIG9ubGluZSBDUFVzLgo+ID4gKyAgICAgICovCj4gPiArICAgICBy
aXNjdl9zZXRfaHdfcHRlX2FkX3VwZGF0aW5nKHRydWUpOwo+ID4gKyAgICAgcHJfaW5mbygicmlz
Y3Y6IGhhcmR3YXJlIFBURSBBL0QgdXBkYXRpbmcgZW5hYmxlZFxuIik7Cj4gPiAgICAgICByZXR1
cm4gMDsKPiA+ICB9Cj4gPiArYXJjaF9pbml0Y2FsbChyaXNjdl9od19wdGVfYWRfdXBkYXRpbmdf
aW5pdCk7Cj4gPgo+ID4gIHN0YXRpYyBpbnQgcmlzY3ZfY2ZpbHBfdmFsaWRhdGUoY29uc3Qgc3Ry
dWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCj4gPiBAQCAtNTg0LDcgKzY0
NSw3IEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0g
ewo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHNzbnBtLCBSSVNDVl9JU0FfRVhU
X1NTTlBNLCByaXNjdl94bGludXhlbnZjZmdfZXh0cyksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9F
WFRfREFUQShzc3RjLCBSSVNDVl9JU0FfRVhUX1NTVEMpLAo+ID4gICAgICAgX19SSVNDVl9JU0Ff
RVhUX0RBVEEoc3ZhZGUsIFJJU0NWX0lTQV9FWFRfU1ZBREUpLAo+ID4gLSAgICAgX19SSVNDVl9J
U0FfRVhUX0RBVEFfVkFMSURBVEUoc3ZhZHUsIFJJU0NWX0lTQV9FWFRfU1ZBRFUsIHJpc2N2X2V4
dF9zdmFkdV92YWxpZGF0ZSksCj4gPiArICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdmFkdSwg
UklTQ1ZfSVNBX0VYVF9TVkFEVSksCj4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdmlu
dmFsLCBSSVNDVl9JU0FfRVhUX1NWSU5WQUwpLAo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RB
VEEoc3ZuYXBvdCwgUklTQ1ZfSVNBX0VYVF9TVk5BUE9UKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHN2cGJtdCwgUklTQ1ZfSVNBX0VYVF9TVlBCTVQpLAo+CgpUaGFua3MsCll1bmh1
aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
