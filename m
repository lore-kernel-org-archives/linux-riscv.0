Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A224C3ABA9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 10:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zem4srpP/8fHnFLhTUqC7fBphDaFhZYDHQqliGgpONg=; b=cCk+PlDXLp1Mpl
	GUU5XEXdq62gIUtQYyXnx2sfbKM+FqytX1fwi+D0n2oYw21NxFPzuYSmjd6hrCeQEZ6NdNtPMMNS7
	VprBH3+2yMsH7lXsPJTJL+KqZCPwyr+4q7vekTIiJMMLvJyITSoGdfasLayKBtsRipSRRLIl2AYMu
	mtfjTV3j43SRUSzY38COYwFQipVi+H5aMngexxAB4tOY0zvCI/0vCxJHx4bhdJZhd4X0axc5TQlNm
	b4Ms/X4lv2Gyc++db05YXx2wtOP8Xqq1AoWgawXiJiZfZzZKpomGFmSbng/jubnVCvF9IcsvaYUmf
	P9s9a42EA82KettNPrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9i9j-00000009IxE-25JF;
	Tue, 29 Apr 2025 10:25:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9i9h-00000009Iw2-0ZsT
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 10:25:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso3442565e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745922336; x=1746527136; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TusfjoOZJ9Q4uXowiWjYTIz+Nnd7Ky1WuLL0Fm5qU4=;
        b=Mq5uKumXhS9nohDquM91hum+Brko0UHyvL6iVtgBMUl9MavQlJGTXWOv3wB9d8wkSv
         fuslVC7mQgy9eMiSUNcgHHiW5ccgoNcynjH3BsngA0t+24mjVkq7o/6FYKv3DZ4eiWkk
         9PlQbhZfAYnDmSvypZXI/2ObGa2QahD6y/G0QdU7k28XAB7zNNcSOCN8oM/uc57AwY2I
         GXEs25qXL0zBy4om9noanaz6EI8j4OUzFl2054L5RPP/2NdsO+KN2pI9Suas3r/EcPTA
         Lfb8ur2g/43WDmYZUOY7ZxMp59yQV3sVAkjEfVcEm9nIHtHgYHgicIpT+AEGma0QQMvt
         ZUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922336; x=1746527136;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TusfjoOZJ9Q4uXowiWjYTIz+Nnd7Ky1WuLL0Fm5qU4=;
        b=SfFVsgXtyfRFCgGR8/wpS2A89Bn5V6BIuDYUGRg5c73mzdhuKvh9Ge+lTD5fMNIX8+
         K3a50w8XHrxIJGJvSgLray/vHCRDhaY6eKWXQgFw2VopUinTvA9jUvjwN/BTK2QrDHJ9
         EMfP0Ic7wV55qU0ucyhSJMx6X6xw+AW4gjGrhs1qRgxkrwEaanpuwFmL4xwFuFxYMPKm
         c+TaSgPaW4CBo7/L3tOtbpCm9emjbxH+XGnigNVzyEB6t/px3GSueqPYHGN1Z89AwK+/
         DcP0pIGeWgcOoXSQ2dxqPo+0M4E+cZTOq/3g6naWGf2BXvu7axoOU1I+97OX35424vB6
         tg1g==
X-Forwarded-Encrypted: i=1; AJvYcCWLb+hM9o6rVNzsTTvCUhUiUYsRVFUM0ENLothjX1xIZYP3i8h6p7a+1oAF1GxTDz5nKiCJNMD6qOTpvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGyFEkeR+C568Yv2jBQj/8T9ajQzYONrAR2N7a29QyqAFlE4Ha
	XE9y8bQvga3tflfrPGH44Uq5hnVVxLDt7c4UZv0AU7NQiG6NXfH6PM3jGgjjiTM=
X-Gm-Gg: ASbGncvMrfsIElsYO1B0iUZtQFSF1X6gTRwC69ky8gfkptsJh3WI+UrvaVoof05oCQy
	sNfOizeC68vngRlSwehll/36mB+7kZ+XPC3HKMgZmsItUZmctUATG50auIDgK2zkgiXAg97geWw
	wOfO99zesUHYYu3REkCpY8fpQscJyrnJdYn8/kLEs4E3zBOWd/9ecvK34cj4u3DWxjaHpR1uJuG
	IMYMhDSuVs7a/AOqEd55DahXrV2UcDZBvSzDy14L0uE4l619iG1SoVTnNz7NdcNyQ2PO1rFg1UN
	0tX2gnFkBS89FMJL2XiAA83eNU5ehCnjbFKSD9+B+FH65s+s
X-Google-Smtp-Source: AGHT+IFSvfqpgAXd79kfkhiAw4afJN5Oi0WwlrlH7IsWV6fC8ECQn6pF0EjB3PiabWQYmavQwiPMEQ==
X-Received: by 2002:a05:600c:3c86:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-441ac890c15mr8097375e9.4.1745922335484;
        Tue, 29 Apr 2025 03:25:35 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5369cdasm154999805e9.31.2025.04.29.03.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:25:34 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 29 Apr 2025 12:25:33 +0200
Message-Id: <D9J1TBKYC8YH.1OPUI289U0O2C@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming
 runnable
Cc: "Anup Patel" <anup@brainfault.org>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>, "Mayuresh
 Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <apatel@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
 <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
 <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
 <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
In-Reply-To: <CAK9=C2Woc5MtrJeqNtaVkMXWEsGeZPsmUgtFQET=OKLHLwRbPA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_032537_177582_111DCFA9 
X-CRM114-Status: GOOD (  20.68  )
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

MjAyNS0wNC0yOVQxMToyNTozNSswNTozMCwgQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNy
by5jb20+Ogo+IE9uIE1vbiwgQXByIDI4LCAyMDI1IGF0IDExOjE14oCvUE0gUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Pgo+PiAyMDI1LTA0LTI4VDE3
OjUyOjI1KzA1OjMwLCBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPjoKPj4gPiBPbiBU
aHUsIEFwciAzLCAyMDI1IGF0IDU6MDLigK9QTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+ID4+IEZvciBhIGNsZWFuZXIgc29sdXRpb24sIHdlIHNo
b3VsZCBhZGQgaW50ZXJmYWNlcyB0byBwZXJmb3JtIHRoZSBLVk0tU0JJCj4+ID4+IHJlc2V0IHJl
cXVlc3Qgb24gdXNlcnNwYWNlIGRlbWFuZC4gIEkgdGhpbmsgaXQgd291bGQgYWxzbyBiZSBtdWNo
IGJldHRlcgo+PiA+PiBpZiB1c2Vyc3BhY2Ugd2FzIGluIGNvbnRyb2wgb2YgdGhlIHBvc3QtcmVz
ZXQgc3RhdGUuCj4+ID4KPj4gPiBBcGFydCBmcm9tIGJyZWFraW5nIEtWTSB1c2VyLXNwYWNlLCB0
aGlzIHBhdGNoIGlzIGluY29ycmVjdCBhbmQKPj4gPiBkb2VzIG5vdCBhbGlnbiB3aXRoIHRoZToK
Pj4gPiAxKSBTQkkgc3BlYwo+PiA+IDIpIE9TIGJvb3QgcHJvdG9jb2wuCj4+ID4KPj4gPiBUaGUg
U0JJIHNwZWMgb25seSBkZWZpbmVzIHRoZSBlbnRyeSBzdGF0ZSBvZiBjZXJ0YWluIENQVSByZWdp
c3RlcnMKPj4gPiAobmFtZWx5LCBQQywgQTAsIGFuZCBBMSkgd2hlbiBDUFUgZW50ZXJzIFMtbW9k
ZToKPj4gPiAxKSBVcG9uIFNCSSBIU00gc3RhcnQgY2FsbCBmcm9tIHNvbWUgb3RoZXIgQ1BVCj4+
ID4gMikgVXBvbiByZXN1bWluZyBmcm9tIG5vbi1yZXRlbnRpdmUgU0JJIEhTTSBzdXNwZW5kIG9y
Cj4+ID4gICAgIFNCSSBzeXN0ZW0gc3VzcGVuZAo+PiA+Cj4+ID4gVGhlIFMtbW9kZSBlbnRyeSBz
dGF0ZSBvZiB0aGUgYm9vdCBDUFUgaXMgZGVmaW5lZCBieSB0aGUKPj4gPiBPUyBib290IHByb3Rv
Y29sIGFuZCBub3QgYnkgdGhlIFNCSSBzcGVjLiBEdWUgdG8gdGhpcywgcmVhc29uCj4+ID4gS1ZN
IFJJU0MtViBleHBlY3RzIHVzZXItc3BhY2UgdG8gc2V0IHVwIHRoZSBTLW1vZGUgZW50cnkKPj4g
PiBzdGF0ZSBvZiB0aGUgYm9vdCBDUFUgdXBvbiBzeXN0ZW0gcmVzZXQuCj4+Cj4+IFdlIGNhbiBo
YW5kbGUgdGhlIGluaXRpYWwgc3RhdGUgY29uc2lzdGVuY3kgaW4gb3RoZXIgcGF0Y2hlcy4KPj4g
V2hhdCBuZWVkcyBhZGRyZXNzaW5nIGlzIGEgd2F5IHRvIHRyaWdnZXIgdGhlIEtWTSByZXNldCBm
cm9tIHVzZXJzcGFjZSwKPj4gZXZlbiBpZiBvbmx5IHRvIGNsZWFyIHRoZSBpbnRlcm5hbCBLVk0g
c3RhdGUuCj4+Cj4+IEkgdGhpbmsgbXBfc3RhdGUgaXMgY3VycmVudGx5IHRoZSBiZXN0IHNpZ25h
bGl6YXRpb24gdGhhdCBLVk0gc2hvdWxkCj4+IHJlc2V0LCBzbyBJIGFkZGVkIGl0IHRoZXJlLgo+
Pgo+PiBXaGF0IHdvdWxkIGJlIHlvdXIgcHJlZmVycmVkIGludGVyZmFjZSBmb3IgdGhhdD8KPj4K
Pgo+IEluc3RlYWQgb2YgY3JlYXRpbmcgYSBuZXcgaW50ZXJmYWNlLCBJIHdvdWxkIHByZWZlciB0
aGF0IFZDUFUKPiB3aGljaCBpbml0aWF0ZXMgU0JJIFN5c3RlbSBSZXNldCBzaG91bGQgYmUgcmVz
ZXR0ZWQgaW1tZWRpYXRlbHkKPiBpbi1rZXJuZWwgc3BhY2UgYmVmb3JlIGZvcndhcmRpbmcgdGhl
IHN5c3RlbSByZXNldCByZXF1ZXN0IHRvCj4gdXNlciBzcGFjZS4KClRoZSBpbml0aWF0aW5nIFZD
UFUgbWlnaHQgbm90IGJlIHRoZSBib290IFZDUFUuCkl0IHdvdWxkIGJlIHNhZmVyIHRvIHJlc2V0
IGFsbCBvZiB0aGVtLgoKWW91IGFsc28gcHJldmlvdXNseSBtZW50aW9uZWQgdGhhdCB3ZSBuZWVk
IHRvIHByZXNlcnZlIHRoZSBwcmUtcmVzZXQKc3RhdGUgZm9yIHVzZXJzcGFjZSwgd2hpY2ggSSBj
b21wbGV0ZWx5IGFncmVlIHdpdGggYW5kIGl0IGlzIHdoeSB0aGUKcmVzZXQgaGFwcGVucyBsYXRl
ci4KCj4gICAgICAgICAgICAgVGhpcyB3YXkgd2UgYWxzbyBmb3JjZSBLVk0gdXNlci1zcGFjZSB0
byBleHBsaWNpdGx5Cj4gc2V0IHRoZSBQQywgQTAsIGFuZCBBMSBiZWZvcmUgcnVubmluZyB0aGUg
VkNQVSBhZ2FpbiBhZnRlcgo+IHN5c3RlbSByZXNldC4KCldlIGFsc28gd2FudCB0byBjb25zaWRl
ciByZXNldCBmcm9tIGVtdWxhdGlvbiBvdXRzaWRlIG9mIEtWTS4KClRoZXJlIGlzIGEgInNpbXBs
ZSIgc29sdXRpb24gdGhhdCBjb3ZlcnMgZXZlcnl0aGluZyAoZXhjZXB0IHNwZWVkKSAtLQp0aGUg
dXNlcnNwYWNlIGNhbiB0ZWFyIGRvd24gdGhlIHdob2xlIFZNIGFuZCByZS1jcmVhdGUgaXQuCkRv
IHdlIHdhbnQgdG8gZG8gdGhpcyBpbnN0ZWFkIGFuZCBkcm9wIGFsbCByZXNldHMgZnJvbSBLVk0/
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
