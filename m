Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57833C46CD3
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Dec 2023 23:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSc/c4izW+UiPhF1gQw1fz2ieveuuaFkyjpECW6J+gI=; b=KyKReF2Q6ztC/P
	PWQ1dUMLrQWEBJnFyOWzUX0Zzf936gyQSjylOCrOogFLLNfOwSmOnZKjSIM7WMlV1UwMjAhoN59oM
	Eluu4I4iOzTWfnP5+7HlNa6U7EulDLtiodi2avRK9nKJvfMW5xjlNEJquIIsFoyYTrflR+rsjD41u
	QH/g4ve6Mz+DZnliSg7vHLWT+M4LBOYIYhfn9AQCMAgJcoDKLo/Flb5rPVGT/v6nmOAneVQ/HSZK1
	K+8S9Vh/4J44Y4lThjgrK4+nCTOTAq+Y4XZFg1GEqvi2IlWeaU+OidOtXGXRFOTOjvjDrKn2iQBI+
	96yD8gOaqK9c4CYsRCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEeUG-006rsl-06;
	Sat, 16 Dec 2023 23:54:28 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEeUD-006rrc-0L
	for linux-riscv@lists.infradead.org;
	Sat, 16 Dec 2023 23:54:26 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50e3213cce0so232207e87.0
        for <linux-riscv@lists.infradead.org>; Sat, 16 Dec 2023 15:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702770863; x=1703375663; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WntJQyn9d0EfCk0SDSkeTZwQkNZHb3LF+mvl4Xb0xIU=;
        b=wmjYpv+VyFMZiViAjZXck7psLRwvJHkjN87WRfYH4jynM1krp2lwx/6X8dkJ83Y7EC
         G6sL0Cm0SGcJCfmmLZIGM1IQA0oYpgwoEUEmdxk9gBqz9PCIg15cXZyvNwuOLyKeeVf/
         FLD7zlApRCzB/6KjZ3JJ+JUV9zTxt3Dl2dbuoYEEqzLOZ8w6Bzy1sg3dscFy4SNbzKVE
         pvhgrJ44/6G8o0cprf8hlZd8hMlF4Hvzh8fQhryneoe/oWbzlyTbXgZnrCnFydKuJJsh
         r717iN2w57/a6HqMD6djSb6F65iGzj5snTOQPll1NscvYf5kzmWfVc71W5vmGZ2KlyyW
         qGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702770863; x=1703375663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WntJQyn9d0EfCk0SDSkeTZwQkNZHb3LF+mvl4Xb0xIU=;
        b=RFshQXPRdjGlAfHU0kp1T3jtiuMXEeKk1htb+UyHOtQZ4Js6JtZfin5Sa+EQM2pJAx
         4cS6cKGtERu8vZaxAf0eaydI6iK6sYaf3jMND78BpGvYN0ZCVh/8FTk3x28fl04Rdc4o
         7GcmezbJOJXxSh/yiuJZXLc1+9eR+eyKwPGutyXdJBEKQ2SLi5db0g8GztZPkAFHYgJV
         sF9E7jUe1nzBDofaDCFLAApHv843O59bEYRtqk7MPyxGhABQiggmrSGBhbvlCjgf+zvL
         tLbwx71FSNUegKoSRFXhivtHcw67U8L7/F1F0JI/Qs8BkNko7w+cldycuU7x5KhDq7IM
         KnxA==
X-Gm-Message-State: AOJu0Yx5tg0mAdLIHRyF6rmT65qeGwUWz0wVyQMTLIggaHUDCsBPC5Dq
	0PjV3oTPauS9dcLVAlh0fLxwYrsAAgDdm933HgKp9A==
X-Google-Smtp-Source: AGHT+IE1/jRA2wUT3JVq0cBsvdnJ3jWI+itVMLElTEFYL5LSRsq0y7RSLiNPanS6wpM7Qe6VZVATfsJEmkHB+pXeq3Q=
X-Received: by 2002:a05:6512:b9c:b0:50c:180:2162 with SMTP id
 b28-20020a0565120b9c00b0050c01802162mr7539695lfv.99.1702770862548; Sat, 16
 Dec 2023 15:54:22 -0800 (PST)
MIME-Version: 1.0
References: <20231205024310.1593100-1-atishp@rivosinc.com> <20231205024310.1593100-3-atishp@rivosinc.com>
 <20231207-professed-component-84128c06befa@wendy> <CAAhSdy1vqGHeEMStu8Ft2Cz-_c=9e8ciwo9nBh=CDnEejEvp9w@mail.gmail.com>
In-Reply-To: <CAAhSdy1vqGHeEMStu8Ft2Cz-_c=9e8ciwo9nBh=CDnEejEvp9w@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Sat, 16 Dec 2023 15:54:11 -0800
Message-ID: <CAHBxVyFZvXo8pDLz_6jbowQt49N377WaRif55ZdQoq_WB5NTgg@mail.gmail.com>
Subject: Re: [RFC 2/9] drivers/perf: riscv: Add a flag to indicate SBI v2.0 support
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_155425_142925_8E1E8163 
X-CRM114-Status: GOOD (  21.60  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgNDoxNuKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBEZWMgNywgMjAyMyBhdCA1OjM54oCvUE0gQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
TW9uLCBEZWMgMDQsIDIwMjMgYXQgMDY6NDM6MDNQTSAtMDgwMCwgQXRpc2ggUGF0cmEgd3JvdGU6
Cj4gPiA+IFNCSSB2Mi4wIGFkZGVkIGZldyBmdW5jdGlvbnMgdG8gaW1wcm92ZSBTQkkgUE1VIGV4
dGVuc2lvbi4gSW4gb3JkZXIKPiA+ID4gdG8gYmUgYmFja3dhcmQgY29tcGF0aWJsZSwgdGhlIGRy
aXZlciBtdXN0IHVzZSB0aGVzZSBmdW5jdGlvbnMgb25seQo+ID4gPiBpZiBTQkkgdjIuMCBpcyBh
dmFpbGFibGUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBA
cml2b3NpbmMuY29tPgo+ID4KPiA+IElNTyB0aGlzIGRvZXMgbm90IG1ha2Ugc2Vuc2UgaW4gYSBw
YXRjaCBvZiBpdHMgb3duIGFuZCBzaG91bGQgcHJvYmFibHkKPiA+IGJlIHNxdWFzaGVkIHdpdGgg
dGhlIGZpcnN0IHVzZXIgZm9yIGl0Lgo+Cj4gSSBhZ3JlZS4gVGhpcyBwYXRjaCBzaG91bGQgYmUg
c3F1YXNoZWQgaW50byBwYXRjaDQgd2hlcmUgdGhlCj4gZmxhZyBpcyBmaXJzdCB1c2VkLgo+CgpE
b25lLiBUaGFua3MuCgoKPiBSZWdhcmRzLAo+IEFudXAKPgo+ID4KPiA+ID4gLS0tCj4gPiA+ICBk
cml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwgNSArKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJm
L3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+ID4gaW5k
ZXggMTZhY2Q0ZGNkYjk2Li40MGEzMzUzNTBkMDggMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMv
cGVyZi9yaXNjdl9wbXVfc2JpLmMKPiA+ID4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYwo+ID4gPiBAQCAtMzUsNiArMzUsOCBAQAo+ID4gPiAgUE1VX0ZPUk1BVF9BVFRSKGV2ZW50
LCAiY29uZmlnOjAtNDciKTsKPiA+ID4gIFBNVV9GT1JNQVRfQVRUUihmaXJtd2FyZSwgImNvbmZp
Zzo2MyIpOwo+ID4gPgo+ID4gPiArc3RhdGljIGJvb2wgc2JpX3YyX2F2YWlsYWJsZTsKPiA+ID4g
Kwo+ID4gPiAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKnJpc2N2X2FyY2hfZm9ybWF0c19hdHRy
W10gPSB7Cj4gPiA+ICAgICAgICZmb3JtYXRfYXR0cl9ldmVudC5hdHRyLAo+ID4gPiAgICAgICAm
Zm9ybWF0X2F0dHJfZmlybXdhcmUuYXR0ciwKPiA+ID4gQEAgLTExMDgsNiArMTExMCw5IEBAIHN0
YXRpYyBpbnQgX19pbml0IHBtdV9zYmlfZGV2aW5pdCh2b2lkKQo+ID4gPiAgICAgICAgICAgICAg
IHJldHVybiAwOwo+ID4gPiAgICAgICB9Cj4gPiA+Cj4gPiA+ICsgICAgIGlmIChzYmlfc3BlY192
ZXJzaW9uID49IHNiaV9ta192ZXJzaW9uKDIsIDApKQo+ID4gPiArICAgICAgICAgICAgIHNiaV92
Ml9hdmFpbGFibGUgPSB0cnVlOwo+ID4gPiArCj4gPiA+ICAgICAgIHJldCA9IGNwdWhwX3NldHVw
X3N0YXRlX211bHRpKENQVUhQX0FQX1BFUkZfUklTQ1ZfU1RBUlRJTkcsCj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJwZXJmL3Jpc2N2L3BtdTpzdGFydGluZyIsCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBtdV9zYmlfc3RhcnRpbmdf
Y3B1LCBwbXVfc2JpX2R5aW5nX2NwdSk7Cj4gPiA+IC0tCj4gPiA+IDIuMzQuMQo+ID4gPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
