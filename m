Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887B0CA1016
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 03:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=See5NJy0e8/sKa/PyG4+EqIVNL9JjXk1TXJiBnpnhHw=; b=jLNqzTKsaTE6UC
	iUh8000bi/S65AiG47javq/1sR4EaQIxFS+lEezvqoMNzexvdgczkmGmZFptEHo/BwOSAZ5ZX5W4J
	HPETBjIiGkH/4bspcDK/BRBW/XZEnMGoAiikP0eqEmaIJp4oeeWsefqV0V26Gcyv5RZDgYcvayMek
	x+DAZSje9kuhfV8pQtkg7qoO5VvDWlhiB+bGhS3hoHGE894aaeAqBs5XGCdx7VY7cVTTmOleqk4YH
	cAODrF14aXqfsX4r8MteoEkpC6dsZ5pz06bIDJaD2bCJI+DtqaJdQIPCThCxnTcFyUhANnjJYuTef
	ENRArwEfU/PAnGC58PlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvSuT-0000000ELSq-0ReA;
	Mon, 08 Sep 2025 03:51:17 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvSuQ-0000000ELQq-1R2z
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 03:51:15 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-408929699eeso2407935ab.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 Sep 2025 20:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757303473; x=1757908273; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hq2toZ1MStoLsAaQpze6/oEBhlqrv8NRJsOlpJj3oRE=;
        b=yS0ngoT4/0Ov3BlEImNyjxajUdEj9cyV+VFyDyNyzn/LxYy15gMHJ+IIMwtVCBmbMT
         QILlKRETWNO5Xjlq+OEad8kgxDz3HmXNh/HxE3G5uGk2FzO+Klr2bXXR7fc4Arotsw7h
         w85A5HOZIZPIKmisqthD3iajLPGJNzP8BeXcskTxzv5P3JGRWPf6olbAjNyzyL3OIh/3
         VkQ93JVCykl67KGvTMlr+08zvk3k0p5kFMC2aY0//gh1742pvY0wBJagM+7Vz+lryxxG
         JMP0jGgZIFe5FqemU68QLOE1j3sSwZbb8HQJ787bNn4886rdB1xHEcKOnP/Fg1x1A9IV
         eV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757303473; x=1757908273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hq2toZ1MStoLsAaQpze6/oEBhlqrv8NRJsOlpJj3oRE=;
        b=IzvFwr0AEzXiSwL8RgNNg1dGnavThTEKpT2t/G73U091GrggwlOHfImuu+aTsXZ/ti
         7Qc/gJ/ZRzDrouorQTfTV6zZ7L16hF56224uQPIuij2pLS8GpvLfPg8I8wn5ArjCJ0Cv
         J4znH8O6JooADsawS6+jUG8P7OqrNG589b4a0Nhy7t4NlXUviglf/oMMoHthH4ZE6ps2
         Dm88/3BEaT7sI0oghzofvHxWmXn7CiuUNYaUVSqGkeBkrJXnHFmXlzQre3NGNul2z1Tc
         WHGYHsxk9f3DBbZHeLuHpA3Wa9o685IITVwHuCLmjeuqMvZMj37U/bHy7xvgwiYQZW1X
         iqow==
X-Forwarded-Encrypted: i=1; AJvYcCUmoNaoVpE4XZtq9igeTv2cxeITSiks3deRiPokt/Yha0L/mxdXfph7vlsrRvNgRN87D2ULjTo1t7mzFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzDCLunL7Xbd/zOYN861QtNN3ePJ5KhCEz8ji4OpVBqSWANbyI
	PlfYJaMtGxOhno/e/TPrLly3WPPfZ9qXCgccRhCEnSqfhqxzTEpwdunZ9G9v/gRzbi6Ot/N2qPE
	suqWJGvpfAzoPjgS0TSttp2HTiicxAcalP9Or6wRYNQ==
X-Gm-Gg: ASbGncuDS2PBpeeN2gXAtil1Ff1gm/CBgBFMUrfzSFqwkfOpilJ2MYn33eYP10NJTy0
	5rNrxRu1mdtP/Mvas/xqiETQ8OjYs3T7NYNt3a9U5b1vPFC2S7fZ32Uh29X6fXbCVclFwqELkZb
	zPCveAttq6MF+Xx0x7D08kSS5cgMBR1unokBmy+4blvkyGc2rw2sDwSJC8OdRRiYOUF0vZqrmgh
	Y4Ly7Ft/9PYyrrG1xH8xTUgneF2LQtyEwwkJyRfana1o4H2s9A=
X-Google-Smtp-Source: AGHT+IH4WAwWrAnnu4Rq1LOrwKuZ6PLy8v3SBH2WLczbYxVUoFRkmc/aL1MGlRWWeIeFxAJfFISceCNUeP2fr23Ivao=
X-Received: by 2002:a05:6e02:1d9d:b0:3f6:80ec:bae with SMTP id
 e9e14a558f8ab-3fd853158bamr95133955ab.21.1757303473045; Sun, 07 Sep 2025
 20:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250823155947.1354229-1-apatel@ventanamicro.com>
In-Reply-To: <20250823155947.1354229-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Sep 2025 09:21:00 +0530
X-Gm-Features: Ac12FXxdad2U7i621spIzbFw-GpwyPTNC5JI8CApKugYuwHXgesJ9uOvv3sJqD4
Message-ID: <CAAhSdy1jAmCeqWoPi7QpuzW4stH6U-Z0pSHmyC93jBYbSr6_xw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] ONE_REG interface for SBI FWFT extension
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_205114_628551_5F7DA07E 
X-CRM114-Status: GOOD (  13.82  )
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

T24gU2F0LCBBdWcgMjMsIDIwMjUgYXQgOTozMOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgT05FX1JFRyBpbnRlcmZh
Y2UgZm9yIFNCSSBGV0ZUIGV4dGVuc2lvbiBpbXBsZW1lbnRlZAo+IGJ5IEtWTSBSSVNDLVYuIFRo
aXMgd2FzIG1pc3NlZCBvdXQgaW4gYWNjZXB0ZWQgU0JJIEZXRlQgcGF0Y2hlcyBmb3IKPiBLVk0g
UklTQy1WLgo+Cj4gVGhlc2UgcGF0Y2hlcyBjYW4gYWxzbyBiZSBmb3VuZCBpbiB0aGUgcmlzY3Zf
a3ZtX2Z3ZnRfb25lX3JlZ192MyBicmFuY2gKPiBhdDogaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0
ZWwvbGludXguZ2l0Cj4KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAtIFJlLWJhc2VkIG9uIGxhdGVz
dCBLVk0gUklTQy1WIHF1ZXVlCj4gIC0gSW1wcm92ZWQgRldGVCBPTkVfUkVHIGludGVyZmFjZSB0
byBhbGxvdyBlbmFibGluZy9kaXNhYmxpbmcgZWFjaAo+ICAgIEZXRlQgZmVhdHVyZSBmcm9tIEtW
TSB1c2Vyc3BhY2UKPgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gIC0gRHJvcHBlZCBoYXZlX3N0YXRl
IGluIFBBVENINCBhcyBzdWdnZXN0ZWQgYnkgRHJldwo+ICAtIEFkZGVkIERyZXcncyBSZXZpZXdl
ZC1ieSBpbiBhcHByb3ByaWF0ZSBwYXRjaGVzCj4KPiBBbnVwIFBhdGVsICg2KToKPiAgIFJJU0Mt
VjogS1ZNOiBTZXQgaW5pdGlhbCB2YWx1ZSBvZiBoZWRlbGVnIGluIGt2bV9hcmNoX3ZjcHVfY3Jl
YXRlKCkKPiAgIFJJU0MtVjogS1ZNOiBJbnRyb2R1Y2UgZmVhdHVyZSBzcGVjaWZpYyByZXNldCBm
b3IgU0JJIEZXRlQKPiAgIFJJU0MtVjogS1ZNOiBJbnRyb2R1Y2Ugb3B0aW9uYWwgT05FX1JFRyBj
YWxsYmFja3MgZm9yIFNCSSBleHRlbnNpb25zCj4gICBSSVNDLVY6IEtWTTogTW92ZSBjb3B5X3Ni
aV9leHRfcmVnX2luZGljZXMoKSB0byBTQkkgaW1wbGVtZW50YXRpb24KPiAgIFJJU0MtVjogS1ZN
OiBJbXBsZW1lbnQgT05FX1JFRyBpbnRlcmZhY2UgZm9yIFNCSSBGV0ZUIHN0YXRlCj4gICBLVk06
IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBTQkkgRldGVCB0byBnZXQtcmVnLWxpc3QgdGVzdAoKUXVl
dWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC02LjE4CgpSZWdhcmRzLApBbnVwCgo+Cj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggICAgICAgICB8ICAyMiArLQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaV9md2Z0LmggICAgfCAgIDEgKwo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggICAgICAgICAgICAgfCAgMTUgKysKPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICstCj4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICB8ICA2MCArLS0tLQo+
ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgICAgICAgICAgfCAxNzIgKysr
KysrKysrKystLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgICAgICAgICAgICAg
ICAgfCAyMjcgKysrKysrKysrKysrKysrKy0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0
YS5jICAgICAgICAgICAgICAgICB8ICA2MyArKystLQo+ICAuLi4vc2VsZnRlc3RzL2t2bS9yaXNj
di9nZXQtcmVnLWxpc3QuYyAgICAgICAgfCAgMzIgKysrCj4gIDkgZmlsZXMgY2hhbmdlZCwgNDY3
IGluc2VydGlvbnMoKyksIDEyOCBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi40My4wCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
