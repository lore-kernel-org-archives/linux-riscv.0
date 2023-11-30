Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F11C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 12:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMLvIEUmcBmLJ6qyXnmyAvoNCGwwSYU7fAODeU96x6w=; b=senYa7g66kD+R5
	UFtc+rkxGuHhuasdUJ97Qc4TkWGbSYCWv05upRc3cBTH63EKgqUf7JiLJ+MWd+h3HX0KY4L1jxo51
	4pU9vGeEprn4T1k0+mRbiy0ciVZopOlr9pZZTJoPrU8YJs+XmrsuDpSIPh4YBx1I6JLkdUaCN3kXe
	Ed/YyeQ9IwjWPFTKdo//dC48/bjgtg5QzHmd49DOWXq17ti0JcvNVfb50FRBWEiUMWR+WE+9WSsrb
	CiY3R4ceDoWv3pFXhoJ14UxMd6Z8HLbR69Gb+wLvmNvvwlE/tpLL6JRWR2s+6EfWMTSmfjTpLMQze
	MS4KXccD9tT5CrYMbD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8g6J-00AqaX-1r;
	Thu, 30 Nov 2023 12:25:03 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8g6G-00AqYn-2X
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 12:25:02 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-46449c963deso314069137.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 04:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701347098; x=1701951898; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPS3xxiuZWf1VxJtT0YO9mlspTNHuYgCnulWUTvdTUA=;
        b=DhYSY2HCjBL5GKFUww0gGzO33FBc/smnejLMZrAWh5vDDyS404Kz+iLijiLeYyXaBV
         b1x3ALUX1v4om0a7i/Le9irTXFGHcioW6EWODqRvshSej+Qaka9GJ2GVBziHFZCEOwUE
         HOj0Mmfsmx9BbgpfSjivwmyWQ9E1I+8yAZ5PvUZ7QkRxhFjcLAsUb/0oT/YYjgReR2t6
         f4WEqJuKPIYe7D3H+3OsxesrIr+faXsYv0HUdSO0IaiVkafJbnuzcpsFlnbkXolDiLYL
         x7TfzhHr9M+FFMMKqTCTu4cD+MRnrlvBdtRT7G+ZxP01sKEzZkeAOvYFZvNRne+TT5Sp
         lrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701347098; x=1701951898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPS3xxiuZWf1VxJtT0YO9mlspTNHuYgCnulWUTvdTUA=;
        b=VBEQtY5uw+Eh7bA2CV5AzZg+gpA4GpJi9V1C6xVHw7/F/aMPVHeapMWGLbqeL5dEG+
         BFg1yvWaZepaB7DKxjjlMX3IJHeRB6KpFPTrC1KsQAUDlUPSTEm9Q5dw9LGOPGNIY64p
         8+5ziKQvk/hMlIWMDIrxpgRpfydBBxAN1YCyja0BvkdXEgoIyrwa8R6nVJMNIBO7zQkc
         YhaTf+M115Vbnq8LlmYr15Y7dzYLUdUSzNvLD8TV1Ss7qw7eNgLpUrYGXOsOoTRd33DF
         BLk/5xaFg5JQ9Yc1LlTWix3l+pypVOqmaz5/aCQFwPRrmgFtqPN1KivKl6Fdv7PbzYwv
         +Qhg==
X-Gm-Message-State: AOJu0YyQXMvnFvb2hxdpICKuAvmIuVZAJPHHuslCS30LVdusOBwky0M1
	eenNzAkubcU2N9caZARnGXOx1i3BFukGGv7rD0MrTQ==
X-Google-Smtp-Source: AGHT+IF3j3HcT1aCoqg1svzx44lwtkXhHBGyT4I2UYvHSkERVae33zMG4SIUDxax/bcsvwuJzqZtRwm3Sbusnpboi2w=
X-Received: by 2002:a05:6102:317:b0:464:38fa:5ba6 with SMTP id
 23-20020a056102031700b0046438fa5ba6mr8074289vsa.7.1701347097820; Thu, 30 Nov
 2023 04:24:57 -0800 (PST)
MIME-Version: 1.0
References: <IA1PR20MB4953C82499C5D81D2C6A020BBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953F9D77FFC76A9D236922DBBB6A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CAK9=C2WAv5jJBt56xBea268DeyUA+YvbU7i+ahVjueafCi-r6A@mail.gmail.com>
 <20231130-decibel-passenger-6e932b1ce554@spud> <CAK9=C2Vsx8ddpYiqUhvqnJpdb-FKeNhLz3PsVpSeEz4TeQHiEg@mail.gmail.com>
 <20231130-shower-award-3cd5f1bba5db@spud> <CAK9=C2WgN=3BjxS+nF2ibFQoquNwXfxr_UQv8Kbf1+e4Teyfcw@mail.gmail.com>
 <20231130-laborious-dwarf-6913457466ad@spud>
In-Reply-To: <20231130-laborious-dwarf-6913457466ad@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 30 Nov 2023 17:54:43 +0530
Message-ID: <CAK9=C2UWwHVCvgXG0kNLt86JTk7P6p-EdPLS3F8Z5qnSpCPLkg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: timer: thead,c900-aclint-mtimer:
 separate mtime and mtimecmp regs
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen Wang <unicorn_wang@outlook.com>, 
	Anup Patel <anup@brainfault.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_042500_829343_AEDFE952 
X-CRM114-Status: GOOD (  13.21  )
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

T24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgNTo0MOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE5vdiAzMCwgMjAyMyBhdCAwNToxODoxNVBNICsw
NTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gVGh1LCBOb3YgMzAsIDIwMjMgYXQgNToxNeKA
r1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiA+ID4gPiBhbmQg
YWRkIHNlcGFyYXRlICJyaXNjdiIgcHJlZml4ZWQgRFQgYmluZGluZyBmb3IgUklTQy1WIG10aW1l
ci4KPiA+ID4KPiA+ID4gRG8geW91IGtub3cgb2YgYW55IHVzZXJzIGZvciBhICJyaXNjdixtdGlt
ZXIiIGJpbmRpbmcgdGhhdCBhcmUgbm90Cj4gPiA+IGNvdmVyZWQgYnkgZXhpc3RpbmcgYmluZGlu
Z3MgZm9yIHRoZSBjbGludD8KPiA+Cj4gPiBWZW50YW5hIFZleXJvbi12MSBpbXBsZW1lbnRzIGEg
bXRpbWVyIHBlci1jbHVzdGVyIChvciBjaGlwbGV0KQo+ID4gd2hpY2ggaXMgY29tcGF0aWJsZSB0
byAicmlzY3YsbXRpbWVyIiAoaS5lLiB3ZSBoYXZlIGJvdGggbXRpbWUKPiA+IGFuZCBtdGltZWNt
cCBNTUlPIHJlZ2lzdGVycykuCj4KPiBPa2F5LCB0aGFua3MuIEkgZ3Vlc3MgaWZmIHZleXJvbi12
MSBEVCBzdXBwb3J0IHNob3dzIHVwIChvciBvdGhlcgo+IHNpbWlsYXIgZGV2aWNlcykgd2UgY2Fu
IGdvIGFoZWFkIHdpdGggYSAicmlzY3YsbXRpbWVyIiBiaW5kaW5nIHRoZW4uCj4gSSBoYWQgdGhv
dWdodCB0aGF0IHlvdSBndXlzIHdlcmUgZ29pbmcgdG8gYmUgdXNpbmcgQUNQSSB0aG91Z2gsIHNv
Cj4gSSBndWVzcyB0aGUgIm90aGVyIHNpbWlsYXIgZGV2aWNlcyIgYXBwbGllcy4KCldlIHVzZSBB
Q1BJIGZyb20gRURLMiBvbndhcmRzIGluIG91ciBib290LWZsb3cuIFRoZSBib290aW5nCnN0YWdl
cyBwcmlvciB0byBFREsyIChzdWNoIGFzIE9wZW5TQkkpIHVzZSBEVC4gSW4gZmFjdCwgRURLMgph
bHNvIHVzZXMgaW5mb3JtYXRpb24gaW4gRFQgdG8gcG9wdWxhdGUgc3RhdGljIHBhcnRzIG9mIHRo
ZSBBQ1BJCnRhYmxlLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
