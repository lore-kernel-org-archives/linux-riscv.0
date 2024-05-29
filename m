Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB63C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 15:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6y0M1dBwLUTDrlZIsFewc9FdwZbLwgYyPIuLGmF2McQ=; b=vkJ4eVrfrZSlcU
	C/vu6uxPMsakc4NZbmsf2hyQHhC+QMRKnC/M3nhzcXwj9vTfuECudtLt6xPRyTB+NcN5eeL6CGsPS
	xL9gh2w9oMWtIoaMYAEi0vnoZJxLGVvvZeFvoF7dkN+A66D3VhtZ4lSBDBhvakK05MZ0knJVUWv7N
	KrFmNddQO5K5uGBsdXhQ1qjhu56jpGs+ysgiEpyDJ9ElH+ouSAMuSo1xzUuhhhEr389wn1Oi1m7dk
	OoOleMivTuv6+FafcGOvkJMVJOXDVMWInFTQkRDss3cMX46IlA2iUjGpJ6vf69rVJPs0MxFSp/vhE
	hE/DjVqqu+U/7/En17dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCLQy-00000004k0d-1mVT;
	Wed, 29 May 2024 15:41:48 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCLQv-00000004jzg-3E41
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 15:41:47 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5b9706c84e5so1436229eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 08:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716997304; x=1717602104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9TiXKsknYHXf5QsRGRKcyOIZejMBzFG3PPVnqh0wNM=;
        b=JUUwn3kWeyeYLdRAJ0gKsEXmfayzNlOlpN6XZyqH+Db3n06ggWtljHtaF1VV4SGy34
         hZPvA5eSHnQH3Dz20e3HGpQvR+yU/cOiwWQ65hho517OabSfJoAyvins0PkxWpjqVuuO
         Zl05cSmAsX8wbBGXDai8V8GwEq1lncMOKEMbTpTptQZ89AIzixHG2ipPpTH3PzrCnCXJ
         UkmG3neb+99ZAPQfcJb4xL8Jt/2vzlsnJZmzojwc7hq+jHblp7RUnecfKz+43FbycJcR
         yWJTIoeUjNX3SogCR+oM6K3/69Z1eLmViQaZSt/BAEONo0Dr+9Ss6KD9MmN6WSQlT1W6
         VA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716997304; x=1717602104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9TiXKsknYHXf5QsRGRKcyOIZejMBzFG3PPVnqh0wNM=;
        b=O1QL3thy7ZgAGVPVEbFJoOlmJ+hPV/rVQ38U+99C5Ft3IDSEARZCAYoN8QP8LlS4bi
         Jn0dbGpMM7lFq+t77TwoUPr+uBrYrr886Tr/e+ppNI44AuJMlefboxRRu6+EWWV+5M8k
         ukgf69TR6cHH6dtYRusKr9Ctf9yidEavKYcVbjB9+F32BJ1aJ9qTtNUYMBlxTl8IQUCE
         nNno2Nct4sFGwUr6rvx21fg6kIz0BS77S5xUFYsjF26+23nSAhedHg8c6Z2niLBPZ6rs
         VZg8iPnBiBn7PKOspZCPGCcSbz0b6q2doRTvuGTxCr5fCf7S26FMNmdLFBxEiDZvSdeh
         nBaA==
X-Gm-Message-State: AOJu0Yyh49H9ViXbjfWmxPcvgta4vnAMUZdXY/+S9oHb/jvlKK2EeAQx
	p29t2qxJkHf9/mH09P+RBymo7WTC7iRtUtAoKH2GEWp/ZojE7oj5ku3AkB7YZoSearPa2i7oHqO
	p8512rgl7tsTZQqBPzMC3l9ePg+nXjVvC1q/rBg==
X-Google-Smtp-Source: AGHT+IGIANn+TkqLuc9AZKYmSOXX1IsRDiTVw2d6PHKuIShROX1VzVJ0uz1t5blLZNTI3MD26TOTbaEYujG54jREvoo=
X-Received: by 2002:a05:6820:515:b0:5b5:3d56:287b with SMTP id
 006d021491bc7-5b96196061amr16857245eaf.4.1716997303721; Wed, 29 May 2024
 08:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-5-yongxuan.wang@sifive.com> <40da6797-faab-41f3-b4bd-766e6a117468@rivosinc.com>
In-Reply-To: <40da6797-faab-41f3-b4bd-766e6a117468@rivosinc.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 29 May 2024 23:41:32 +0800
Message-ID: <CAMWQL2g6sjWPghTSqyPj0HS3cS79=uMX1YnCkmwow7gqyVZ1nA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 4/5] RISC-V: KVM: add support for SBI_FWFT_PTE_AD_HW_UPDATING
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	alex@ghiti.fr, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_084145_848300_F388D8C7 
X-CRM114-Status: GOOD (  24.40  )
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

T24gVHVlLCBNYXkgMjgsIDIwMjQgYXQgNjoxNeKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMjQvMDUvMjAyNCAxMjozMywgWW9uZy1Y
dWFuIFdhbmcgd3JvdGU6Cj4gPiBBZGQgc3VwcG9ydCBmb3IgU0JJX0ZXRlRfUFRFX0FEX0hXX1VQ
REFUSU5HIHRvIHNldCB0aGUgUFRFIEEvRCBiaXRzCj4gPiB1cGRhdGluZyBiZWhhdmlvciBmb3Ig
R3Vlc3QvVk0uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFu
LndhbmdAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3Zt
X3ZjcHVfc2JpX2Z3ZnQuaCB8ICAyICstCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndm
dC5jICAgICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysrKysrLQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oCj4gPiBpbmRleCA3YjdiY2M1Yzhm
ZWUuLjM2MTRhNDRlMGE0YSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX3ZjcHVfc2JpX2Z3ZnQuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
dmNwdV9zYmlfZndmdC5oCj4gPiBAQCAtMTEsNyArMTEsNyBAQAo+ID4KPiA+ICAjaW5jbHVkZSA8
YXNtL3NiaS5oPgo+ID4KPiA+IC0jZGVmaW5lIEtWTV9TQklfRldGVF9GRUFUVVJFX0NPVU5UICAg
MQo+ID4gKyNkZWZpbmUgS1ZNX1NCSV9GV0ZUX0ZFQVRVUkVfQ09VTlQgICAyCj4gPgo+ID4gIHN0
cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnOwo+ID4gIHN0cnVjdCBrdm1fdmNwdTsKPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgYi9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaV9md2Z0LmMKPiA+IGluZGV4IDg5ZWMyNjNjMjUwZC4uMTRlZjc0MDIzMzQwIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPiA+IEBAIC03MSw2ICs3MSwzNiBAQCBzdGF0aWMg
aW50IGt2bV9zYmlfZndmdF9nZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwKPiA+ICAgICAgIHJldHVybiBTQklfU1VDQ0VTUzsKPiA+ICB9Cj4gPgo+ID4gK3N0
YXRpYyBpbnQga3ZtX3NiaV9md2Z0X2FkdWVfc3VwcG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSkKPiA+ICt7Cj4gPiArICAgICBpZiAoIXJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKHZj
cHUtPmFyY2guaXNhLCBTVkFEVSkpCj4gPiArICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX05P
VF9TVVBQT1JURUQ7Cj4gPiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiAr
c3RhdGljIGludCBrdm1fc2JpX2Z3ZnRfc2V0X2FkdWUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBz
dHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlKQo+ID4gK3sKPiA+ICsgICAgIGlmICh2YWx1
ZSkKPiA+ICsgICAgICAgICAgICAgdmNwdS0+YXJjaC5jZmcuaGVudmNmZyB8PSBFTlZDRkdfQURV
RTsKPiA+ICsgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgdmNwdS0+YXJjaC5jZmcuaGVudmNm
ZyAmPSB+RU5WQ0ZHX0FEVUU7Cj4gPiArCj4gPiArICAgICByZXR1cm4gU0JJX1NVQ0NFU1M7Cj4g
PiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQga3ZtX3NiaV9md2Z0X2dldF9hZHVlKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAqdmFsdWUpCj4gPiArewo+
ID4gKyAgICAgaWYgKCFyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSh2Y3B1LT5hcmNoLmlz
YSwgU1ZBRFUpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9OT1RfU1VQUE9SVEVE
Owo+ID4gKwo+ID4gKyAgICAgKnZhbHVlID0gISEodmNwdS0+YXJjaC5jZmcuaGVudmNmZyAmIEVO
VkNGR19BRFVFKTsKPiA+ICsKPiA+ICsgICAgIHJldHVybiBTQklfU1VDQ0VTUzsKPiA+ICt9Cj4K
PiBIaSBZb25nLVh1YW4sCj4KPiB2Y3B1LT5hcmNoLmNmZy5oZW52Y2ZnIHNlZW1zIHRvIGJlIHVz
ZWQgdG8gdXBkYXRlIHRoZSBIRU5WQ0ZHIENTUiAgb25seQo+IGR1cmluZyB2Y3B1X2xvYWQoKS92
Y3B1X3B1dCgpLiBTbyBpZiB0aGlzIGV4dGVuc2lvbiB1cGRhdGVzIGl0IHRoZXJlIGFuZAo+IHN0
YXlzIGluIHRoZSBleGVjdXRpb24gbG9vcCAoa3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4oKSkgdGhl
biwgaXQgc2VlbXMKPiBsaWtlIHRoZSBIRU5WQ0ZHIENTUiB3b24ndCBiZSB1cGRhdGVkIGltbWVk
aWF0ZWx5IGJ1dCBvbiB0aGUgbmV4dAo+IHZjcHVfbG9hZCgpLiBJcyB0aGVyZSBzb21ldGhpbmcg
SSdtIG1pc3NpbmcgPwo+Cj4gVGhhbmtzLAo+Cj4gQ2zDqW1lbnQgTMOpZ2VyCj4KCkhpIENsw6lt
ZW50LAoKVGhhdCdzIHJpZ2h0LiBJIHdpbGwgZml4IGl0IGluIHRoZSBuZXh0IHZlcnNpb24uIFRo
YW5rIHlvdSEKClJlZ2FyZHMsCllvbmctWHVhbgoKPiA+ICsKPiA+ICBzdGF0aWMgc3RydWN0IGt2
bV9zYmlfZndmdF9jb25maWcgKgo+ID4gIGt2bV9zYmlfZndmdF9nZXRfY29uZmlnKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgZmVhdHVyZSkKPiA+ICB7Cj4g
PiBAQCAtMTc3LDcgKzIwNywxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGt2bV9zYmlfZndmdF9m
ZWF0dXJlIGZlYXR1cmVzW10gPSB7Cj4gPiAgICAgICAgICAgICAgIC5zdXBwb3J0ZWQgPSBrdm1f
c2JpX2Z3ZnRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZCwKPiA+ICAgICAgICAgICAg
ICAgLnNldCA9IGt2bV9zYmlfZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAo+ID4gICAg
ICAgICAgICAgICAuZ2V0ID0ga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24s
Cj4gPiAtICAgICB9Cj4gPiArICAgICB9LAo+ID4gKyAgICAgewo+ID4gKyAgICAgICAgICAgICAu
aWQgPSBTQklfRldGVF9QVEVfQURfSFdfVVBEQVRJTkcsCj4gPiArICAgICAgICAgICAgIC5zdXBw
b3J0ZWQgPSBrdm1fc2JpX2Z3ZnRfYWR1ZV9zdXBwb3J0ZWQsCj4gPiArICAgICAgICAgICAgIC5z
ZXQgPSBrdm1fc2JpX2Z3ZnRfc2V0X2FkdWUsCj4gPiArICAgICAgICAgICAgIC5nZXQgPSBrdm1f
c2JpX2Z3ZnRfZ2V0X2FkdWUsCj4gPiArICAgICB9LAo+ID4gIH07Cj4gPgo+ID4gIHN0YXRpY19h
c3NlcnQoQVJSQVlfU0laRShmZWF0dXJlcykgPT0gS1ZNX1NCSV9GV0ZUX0ZFQVRVUkVfQ09VTlQp
OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
