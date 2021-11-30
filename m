Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F55C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 23:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZP1gUIdqOT3AxL6PBEvk45Xgr10xANeA07JxLuY3iM=; b=hQAF8P2tgCRHfD
	Of1PB+aif7Yf3MOnhLImtHkIItPazhINDbrt92YdsaDtQdJXDBH00Ui+uOTxm3Y7v09+sXK1CAvXQ
	0dGz54AKQLqYxlw6kfEXSRz+LovsorFXW1/ELzceItMrNKqj/x2MnNN/b4QWzVK3kDwaHH4eWE/cU
	2cI94vsMrk8YvCCyN1AHgbPhzv2gM1A+mzLSjaa2vKjL1uW8fRWj6AUB2gHwtCYU1ZDLItqBClNxP
	Lgjbwt0dKmNP383sh9LCZVvNT+NVYr04drgzDBT/XtrkxqLj//JaN7fe0lMIGy974fsh600XST+uu
	2Bw4Dj1ZUX/ZKfgchHOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msC7u-00787y-Np; Tue, 30 Nov 2021 23:01:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msC7q-007869-Of
 for linux-riscv@lists.infradead.org; Tue, 30 Nov 2021 23:01:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8EA98CE1D20
 for <linux-riscv@lists.infradead.org>; Tue, 30 Nov 2021 23:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7D9C53FD1
 for <linux-riscv@lists.infradead.org>; Tue, 30 Nov 2021 23:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638313280;
 bh=/XtvKBKIAZgBZpHU5l7FFP9bobAXH0K3MiMhbZFKhcQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NCEJwq1PwtA2WtEEXgXy7oE5yCR4XLm7KyNx9pdJSkaA98LBgnAteKPHhmwFa9nmv
 cyrskbRaNNTZWwwYZ3Q8dQ/V+5AwGCU8/vq3OeFNB9Xxa1MrqYdEpPR7krzwt6bPNk
 /7v1wtzVQNkB6axchbw/auOcQAq1fiqIUfxg1Z3JHc71VFN4b36QXS/CZSmx+xmLJl
 4u7gDAm8yFXEzZYgoT10Xltlnl5AeHxChLM+XE5JZRnKSLsL4c+zXX8vG82KO8xixC
 jiAcWEFc7gWX3LeZefMuQoTOT/Tyf6O02kul3zbFVaeTFbPqHtBmZXgO/O9p9DJsY6
 zpUMRQSg2bmlw==
Received: by mail-ed1-f54.google.com with SMTP id y13so93367548edd.13
 for <linux-riscv@lists.infradead.org>; Tue, 30 Nov 2021 15:01:20 -0800 (PST)
X-Gm-Message-State: AOAM531X8rUvZIN9bPpQnOHk2wiplKP5ErkgAlGKlN0jCA2nKfl3rbli
 5AHBj2tG6goAMoe6hg1O5skfdr71GTIhQfhAMw==
X-Google-Smtp-Source: ABdhPJwGYPJE956LksSZBLju/I83pfHQ4ZXNie2up3wXJY0kmFL+GyQypPQQpG6PQ2wQLmlwFlJGQwnP8sUWSYsJU9s=
X-Received: by 2002:a05:6402:440f:: with SMTP id
 y15mr3055651eda.22.1638313278675; 
 Tue, 30 Nov 2021 15:01:18 -0800 (PST)
MIME-Version: 1.0
References: <20211125152233.162868-1-geert@linux-m68k.org>
 <161F972E-7972-4001-BE19-C88F81EF8047@jrtc27.com>
 <CAMuHMdXpmnmAy7cvA4b9LZe1skzjyOmYgUMgY7KiLRPznSj+2Q@mail.gmail.com>
In-Reply-To: <CAMuHMdXpmnmAy7cvA4b9LZe1skzjyOmYgUMgY7KiLRPznSj+2Q@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 30 Nov 2021 17:01:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLr53hm2ai6EwxGg=nMoYqJnOkPGHXmjA1Yh31ReE_hUA@mail.gmail.com>
Message-ID: <CAL_JsqLr53hm2ai6EwxGg=nMoYqJnOkPGHXmjA1Yh31ReE_hUA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: sifive, plic: Fix
 number of interrupts
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Sagar Kadam <sagar.kadam@sifive.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Michael Zhu <michael.zhu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_150127_226132_E7B5C819 
X-CRM114-Status: GOOD (  25.93  )
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

T24gRnJpLCBOb3YgMjYsIDIwMjEgYXQgMjo1OCBBTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IEhpIEplc3NpY2EsCj4KPiBPbiBUaHUsIE5vdiAy
NSwgMjAyMSBhdCA1OjA4IFBNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3Jv
dGU6Cj4gPiBPbiAyNSBOb3YgMjAyMSwgYXQgMTU6MjIsIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+ID4gPiBUbyBpbXByb3ZlIGh1bWFuIHJlYWRhYmls
aXR5IGFuZCBlbmFibGUgYXV0b21hdGljIHZhbGlkYXRpb24sIHRoZSB0dXBsZXMKPiA+ID4gaW4g
ImludGVycnVwdHMtZXh0ZW5kZWQiIHByb3BlcnRpZXMgc2hvdWxkIGJlIGdyb3VwZWQgdXNpbmcg
YW5nbGUKPiA+ID4gYnJhY2tldHMuICBBcyB0aGUgRFQgYmluZGluZ3MgbGFjayBhbiB1cHBlciBi
b3VuZCBvbiB0aGUgbnVtYmVyIG9mCj4gPiA+IGludGVycnVwdHMsIHRodXMgYXNzdW1pbmcgb25l
LCBwcm9wZXIgZ3JvdXBpbmcgaXMgY3VycmVudGx5IGZsYWdnZWQgYXMKPiA+ID4gYW4gZXJyb3Iu
Cj4KPiBSb2I6IElzIHRoaXMgYSBidWcgaW4gdGhlIHRvb2xpbmcgdGhhdCBzaG91bGQgYmUgZml4
ZWQ/CgpUaGUgZ3JvdXBpbmcgb3IgdXBwZXIgYm91bmQ/IFRoZSB0b29scyBkZWZhdWx0IHRvIG1p
bkl0ZW1zID09Cm1heEl0ZW1zLCBzbyB5b3UgYmUgZ2V0dGluZyAnbWF4SXRlbXM6IDEnIGhlcmUu
CgpGb3IgZ3JvdXBpbmcsIEkgcGxhbiB0byBtYWtlIHRoaXMgbm90IG1hdHRlciBmb3IgdmFsaWRh
dGlvbi4gSSdtCndvcmtpbmcgb24gbWFraW5nIHRoZSB2YWxpZGF0aW9uIG9wZXJhdGUgb24gZHRi
cyBhbmQgd2UgbG9zZSBhbnkKc291cmNlIGdyb3VwaW5nIHdpdGggdGhhdC4gSSdsbCBwcm9iYWJs
eSBzd2l0Y2ggdGhlIGtlcm5lbCB0byB1c2UgZHRicwphcyB3ZWxsIGJlY2F1c2UgSSBkb24ndCB3
YW50IHRvIG1haW50YWluIGJvdGguIFN0aWxsLCBJIHRoaW5rIHRoZQpncm91cGluZyBpcyBnb29k
IGZyb20gYSBzb3VyY2UgY29uc2lzdGVuY3kgUE9WLgoKPiBSZWdhcmRsZXNzLCBzcGVjaWZ5aW5n
IGEgcmVhbCB1cHBlciBsaW1pdCBpcyBhbHdheXMgYSBnb29kIGlkZWEuCgpZZXMuIEEgJ3Nob3Vs
ZCBiZSBlbm91Z2ggZm9yIG5vdycgbGltaXQgaXMgYmV0dGVyIHRoYW4gbm9uZSBJTU8sIHRvby4K
Cj4KPiA+ID4gRml4IHRoaXMgYnkgYWRkaW5nIHRoZSBtaXNzaW5nICJtYXhJdGVtcyIsIGxpbWl0
aW5nIGl0IHRvIDkgaW50ZXJydXB0cwo+ID4gPiAob25lIGludGVycnVwdCBmb3IgYSBzeXN0ZW0g
bWFuYWdlbWVudCBjb3JlLCBhbmQgdHdvIGludGVycnVwdHMgcGVyIGNvcmUKPiA+ID4gZm9yIG90
aGVyIGNvcmVzKSwgd2hpY2ggc2hvdWxkIGJlIHN1ZmZpY2llbnQgZm9yIG5vdy4KPiA+Cj4gPiBU
aGlzIGlzIFNpRml2ZeKAmXMgSVAsIHNvIGlzIHRoaXMgYWN0dWFsbHkgdHJ1ZT8gSSB3b3VsZCBp
bWFnaW5lIGl04oCZcwo+ID4ganVzdCBwYXJhbWV0ZXJpc2VkIGFuZCBjb3VsZCBiZSBnZW5lcmF0
ZWQgd2l0aCBhcyBtYW55IHRhcmdldHMgYXMgZml0Cj4gPiBpbiB0aGUgTU1JTyBzcGFjZSwgYW5k
IHRoYXQgdGhpcyBpcyB0aHVzIGluYWNjdXJhdGUuIEJlc2lkZXMsIHN1Y2ggYQo+Cj4gWWVzLCB0
aGlzIGlzIGltcGxlbWVudGF0aW9uLWRlZmluZWQuICBJIGp1c3QgdXNlZCB0aGUgbWF4aW11bSB2
YWx1ZQo+IGN1cnJlbnRseSBpbiB1c2UuCj4KPiBkcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1w
bGljLmMgaGFzICNkZWZpbmUgTUFYX0NPTlRFWFRTIDE1ODcyLAo+IHdoaWNoIG1hdGNoZXMgdGhl
IHZhbHVlIG9mIENPTlRFWFRfUEVSX0hBUlQgYW5kIHRoZSBhdmFpbGFibGUgYWRkcmVzcwo+IHNw
YWNlIGluIHRoZSBkcml2ZXIgYW5kIGluIFsxXS4KPiBXb3VsZCB5b3UgYmUgbW9yZSBjb21mb3J0
YWJsZSB3aXRoICJtYXhJdGVtczogMTU4NzIiPwoKQWx3YXlzIGdvb2QgdG8gaGF2ZSBhIHJlYWwg
dmFsdWUgcmF0aGVyIHRoYW4gYW4gdW5rbm93biBpbXBsZW1lbnRhdGlvbiBsaW1pdC4KClJvYgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
