Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB64C83F1A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+t6IzkdOIEoxEyhmKkyM0vHtYBS2DuwNdNhnhUZTDaI=; b=bkF899S+s1lzlk
	lBxlfgqwj3M7a00DnlDjuYC6fZMeuupmfFSZ3Zt5KY8whyw0jylkY2Up/xv1CcsZqCbsc23f465fo
	nz8gbRngGLjgjt9C1e9Khhia3q9KLO2BY2esZQSX7GnpXUTqbzRE60/U45sHoj38mVnKxKAKJ8CT/
	6p7gvdQWKnQrBsMX3fJHt+l9P03Jm35V96vX4KcuNwfjUaGO7pLj42Q/KDB9y1iAWgRNV0+lC1YND
	zME0GPBU+Nc6oAROSgjp/NrLxjxGaalCZLphAM7WTs4iPUJFrdUposAiWJHXLVpF6U86yxekWp1hU
	tgunUNExm2NTFUuiKclQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3FS-000000017n3-1EHg;
	Tue, 22 Jul 2025 03:00:58 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3FO-000000017mR-13hu
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:00:56 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-40aef72f252so1098050b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1753153249; x=1753758049; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiIyK1lXVxB+2da1SDpcrPM0fJEv+NQOIcTd+CRshKQ=;
        b=et7+8WqLp6uF91uPG0AGRQJt5sIgjaAmUKt6JFT7r08vFOIAgXBdMTv59WQJvKcv3D
         rHWoxprmh5i7WzBoWU+slRvN71SYq5BPxwffKL7hXtiDjKE0+JLIx3e/6BC+eLIfJ1EJ
         VNPK33FlkVibjRWj5oYf2SsKyiPlt5KujoXH0nxOBODrSsjShETY4V1AldrjZjf4oN/0
         zlUEcyABXg8JFxtidc8PIr7UBRbGufQUD8JptYj9isuWRpFK6QTbFDgK+FpIsKZSjWeJ
         kg+cYaEo5EIKOw344wm6LzP+TqINuQnFfHQk0kAD92aUshRTmENzyWCAaEHO5fUEg9rq
         omQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753153249; x=1753758049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiIyK1lXVxB+2da1SDpcrPM0fJEv+NQOIcTd+CRshKQ=;
        b=vjzygX8dWkAAOem7cHkJyoWSYdBov7HtzFq/S3L0Qjyy1kGf/8r7C3RemnpnJ+j8t9
         jhEEFz/KNFPHiv5jPlg6UQVyOTIwDDjJpzgJ+aXsOXiPUOYyRP6ssQbZGbH1AEiQGA4F
         /xqfhB/yPWS/ZQVj5Ie4YxYeQRAyynbl5r1LqkBBDa4ZkfeePoaX7kEabZbn6hh/pyF7
         xWChfIjNWScXXbuqFRX4B3uBpe/j0LsQaEjeOFU1MyyGrdgjA/wkRXwPvBrZG1JBy7Sl
         DJb/x4EDVDOz7ZvDsgDXOM/UBZbsOnpKUoR0B0hLLQ1jT2SChi3Wn2Pdw8Pmsi8J8n7N
         zNzg==
X-Forwarded-Encrypted: i=1; AJvYcCUMrJT6oLn57XfKZERlmRPo1TpTQBFnB9SSJIACN6AFU6tCu3SVGPWNJEh8pEoMgE6bHlslmtknfhyqfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk9Zg5bCp1WDUTiTi0yNjLErFO+bX/rSLicydrxfEtpvH+iTx+
	jwSrpdnHt+wCThJQ9P0dYuJRr5z+lBQU/hzHkNmk1hgKPJktJMy768loJ9S7DwhEdzNvCc4UZ2C
	pJ/+xelu3a+Ovb4y91unnZ1dF9b6v/X19RLrBRs50dg==
X-Gm-Gg: ASbGncvNFYs2Dzkst1TbsBgdch3QGvmKN3LxGggp+FqUDnDlJXknW1DPSctAu3NyXjv
	guAjN9u6MxyjP5MGnn/pwmgYY99eQCd4N4R8BSBxgy5OL3AiDmnRX/oseY1TC1NyB3LDrDVZYeA
	cEyScJi1qqf1seEpvyTKuy8OLCWzKIQ0vU9eTf6dIXJ/UKnxrdUYsi1cQEi4++a88313qBah9xv
	nHRdOhaCEmLANNxtvby
X-Google-Smtp-Source: AGHT+IGwnGLm4PpIYwzH75awhbsJSf+lZtNwfbv2zSoW+8E6F/LfS+KA1nTDmKZunTm81WX+23amzXEHi5dUF84vl9o=
X-Received: by 2002:a05:6808:23cb:b0:406:6e86:683e with SMTP id
 5614622812f47-41cee083b49mr14516648b6e.14.1753153248624; Mon, 21 Jul 2025
 20:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240531100407.282-1-dqfext@gmail.com> <CAEEQ3wkKxt-p1339EbXt-1nF_GvMmgYMio3OBHZSNke1kJc5sQ@mail.gmail.com>
In-Reply-To: <CAEEQ3wkKxt-p1339EbXt-1nF_GvMmgYMio3OBHZSNke1kJc5sQ@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 22 Jul 2025 11:00:37 +0800
X-Gm-Features: Ac12FXzVVbpVD0I9lTj6nHEI4BHP_roN7FMin7PG7LAQW3BUKkLep4DpVIUCUxc
Message-ID: <CAEEQ3wmVPrZ6s8msM8RgcyZePGhXM1ikYMc5wW2n8q3Bf90EVw@mail.gmail.com>
Subject: Re: [External] [PATCH] RISC-V: Implement ioremap_wc/wt
To: Qingfang Deng <dqfext@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel.holland@sifive.com>, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>, Eric Chan <ericchancf@google.com>, 
	Andrea Parri <parri.andrea@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_200055_086043_24413B84 
X-CRM114-Status: GOOD (  17.26  )
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

SGkgUWluZ2ZhbmcsCgpPbiBUaHUsIEp1biA2LCAyMDI0IGF0IDI6NDjigK9QTSB5dW5odWkgY3Vp
IDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiAgSGkgUWluZ2ZhbmcsCj4KPgo+
IE9uIEZyaSwgTWF5IDMxLCAyMDI0IGF0IDY6MDTigK9QTSBRaW5nZmFuZyBEZW5nIDxkcWZleHRA
Z21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBRaW5nZmFuZyBEZW5nIDxxaW5nZmFuZy5k
ZW5nQHNpZmxvd2VyLmNvbS5jbj4KPiA+Cj4gPiBDdXJyZW50bHkgb24gUklTQy1WLCBpb3JlbWFw
X3djL3d0IHVzZXMgdGhlIGRlZmF1bHQgaW9yZW1hcAo+ID4gaW1wbGVtZW50YXRpb24sIHdoaWNo
IG1hcHMgdGhlIG1lbW9yeSBhcyBzdHJvbmdseS1vcmRlcmVkIG5vbi1jYWNoZWFibGUKPiA+IElP
IG1lbW9yeSBvbiBzeXN0ZW1zIHdpdGggU3ZwYm10Lgo+ID4KPiA+IFRvIGltcHJvdmUgcGVyZm9y
bWFuY2UsIG1hcCB0aGUgbWVtb3J5IGFzIHdlYWtseS1vcmRlcmVkIG5vbi1jYWNoZWFibGUKPiA+
IG5vcm1hbCBtZW1vcnkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUWluZ2ZhbmcgRGVuZyA8cWlu
Z2ZhbmcuZGVuZ0BzaWZsb3dlci5jb20uY24+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2lvLmggfCA4ICsrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lvLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lvLmgKPiA+IGluZGV4IDFjNWM2NDEwNzVkMi4uNTgyNTAz
ZTBmNTA4IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pby5oCj4gPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lvLmgKPiA+IEBAIC0xMzMsNiArMTMzLDE0IEBA
IF9faW9fd3JpdGVzX291dHMob3V0cywgdTY0LCBxLCBfX2lvX3BicigpLCBfX2lvX3BhdygpKQo+
ID4gICNkZWZpbmUgb3V0c3EoYWRkciwgYnVmZmVyLCBjb3VudCkgX19vdXRzcShQQ0lfSU9CQVNF
ICsgKGFkZHIpLCBidWZmZXIsIGNvdW50KQo+ID4gICNlbmRpZgo+ID4KPiA+ICsjaWZkZWYgQ09O
RklHX01NVQo+ID4gKyNkZWZpbmUgaW9yZW1hcF93YyhhZGRyLCBzaXplKSBcCj4gPiArICAgICAg
IGlvcmVtYXBfcHJvdCgoYWRkciksIChzaXplKSwgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
KF9QQUdFX0tFUk5FTCAmIH5fUEFHRV9NVE1BU0spIHwgX1BBR0VfTk9DQUNIRSkKCkNvbXBhcmVk
IHdpdGggSU8gYXR0cmlidXRlcywgTkMgYXR0cmlidXRlcyBjYW4gaW1wcm92ZSBwZXJmb3JtYW5j
ZSwKc3BlY2lmaWNhbGx5IGluIHRoZXNlIGFzcGVjdHM6IFJlbGF4ZWQgT3JkZXIsIEdhdGhlcmlu
ZywgU3VwcG9ydHMgUmVhZApTcGVjdWxhdGlvbiwgU3VwcG9ydHMgVW5hbGlnbmVkIEFjY2Vzcy4g
VGhlcmVmb3JlLCBpdCBpcyBuZWNlc3NhcnkgdG8KaW1wbGVtZW50IGlvcmVtYXBfd2MoKS4KCj4g
PiArCj4gPiArI2RlZmluZSBpb3JlbWFwX3d0IGlvcmVtYXBfd2MKCkZyb20gdGhlIHBlcnNwZWN0
aXZlIG9mIGFybTY0LCBpb3JlbWFwX3d0IHNob3VsZCBoYXZlIElPIGF0dHJpYnV0ZXMKcmF0aGVy
IHRoYW4gTkMgYXR0cmlidXRlcywgc28gdGhpcyBsaW5lIHNob3VsZCBiZSByZW1vdmVkLgoKPiA+
ICsjZW5kaWYKPiA+ICsKPiA+ICAjaW5jbHVkZSA8YXNtLWdlbmVyaWMvaW8uaD4KPiA+Cj4gPiAg
I2lmZGVmIENPTkZJR19NTVUKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gPgo+Cj4gQ2FuIHlvdSBw
cm92aWRlIHNwZWNpZmljIHRlc3QgZGF0YSBmb3IgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQ/Cj4K
PiBUaGFua3MsCj4gWXVuaHVpCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
