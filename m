Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC344ECAAD5
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 22:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WuD4qQsmosbdDHObhNFn7G5ag+oDUvgNeur8zNN0ma0=; b=WpROGW5+EqrRvk
	EEUozNsyC3Ia8ITxL2vOvAnTo59EtqGVnmDRRBZ/oiC8dYvZCc9WGSrQbwZ3hMBNGn/4GVOyQAZfz
	Kup1P0E/ALPBrQexaHSvXPicBCLrwFc30Dgga0a5JsGhsDetYKVeyjBIO/J2Nq8ZUcFWmoJPBZmA/
	rXvOxajOfJsL3UNbZPj2A1elsJ/oa38YtdGqXMZfHSs+pFm/f25l9ONeLZWtA3NVaSo1MsmdfmyDg
	HriYejGz40jA4RxUwxC66GnmDUiA212Xv+Slk5eImKJ7sh7zeeCxfAxS1upxbBTYHMYcemEmj6OqL
	2wG2lvdPJQFYT1gaSaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUxpf-00DcS1-CY; Sun, 04 Sep 2022 22:11:11 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUxQm-00CajS-6n
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 21:45:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id t14so1747919wrx.8
        for <linux-riscv@lists.infradead.org>; Sun, 04 Sep 2022 14:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=87Me0qXRlC4mDmY4jonV8W1fOSQITeb0ij4GwdZhmvw=;
        b=l94O0HQ6NzjN+NULQSM+r8Mm9NF3gqJFm3MCVsaj3eG21jEe6fKeP58Z5C3kzj9ldP
         zPq6LbEIsbP4t3+S0yO4DHtCvuip3yDFmoemdt01WCxSJCFxlaLEkEBInJBv4bTqSPZI
         9km2EBNmFxR31G+VBkgO6hAwqP0/95TP0q2hZQVySU59c87SNb3Zi8ag7mc3rmB++gU4
         x8yJJ3SeXSGFrFR7jvkg2xDXVWub2+drncIg63o/kVKmljIvLgj6sZ4CL3zKyQ6M+KI/
         kjQP93iMNHOjrcWBIHFqZqRzQr39zj6MHxsLZEDEF7XZKUeFIsr6AgJZfc/llSPgwiJb
         WrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=87Me0qXRlC4mDmY4jonV8W1fOSQITeb0ij4GwdZhmvw=;
        b=lJt/njVd4YTeHeKzshqsoH46OTvUAh8chqi9SoCpk3paMwJLgoInfXd0sFivQRRZv7
         27/8k1W4XVzX8p4ACkvYS3dK16lYtwr8Im3iUQ6t2MSBmRb1fk57H7b5TlYdPDZPqdok
         ajm0MWdjF3gW5NJMOzGJklCas81Y5MEbt7kdP55qt2KxHSkB+V+BNb9KWegmZze3gyYI
         bM+VlIz6K4ACaKUOOPriYMTa1dqlGP+XGuyeloA94NbZKblbbdtTxap6wxbR3V5O3muF
         DDxbS0O+mg2C+lCWg7gOb0AbI/PEJIWf9S2rpnwNhY1XMd9DBcn5l/WYSgDVBygYknmX
         zPsQ==
X-Gm-Message-State: ACgBeo03qCCFlz+RXKCLcg/BHOBMIAgPrmuLbMMlT1U1ZVfFItmb9UmH
	lJrM5WmkV0XiK2zpUL/XAL8qAA==
X-Google-Smtp-Source: AA6agR5ywNDBMTZ5Uf4WAvvAi0cTjuxeGFYSLL5RgLZb3PlGsYof1QSK08Yqs7JUgpsSp2g3XhQ90g==
X-Received: by 2002:a5d:4e4f:0:b0:228:855d:84f6 with SMTP id r15-20020a5d4e4f000000b00228855d84f6mr1321895wrt.370.1662327924965;
        Sun, 04 Sep 2022 14:45:24 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id e18-20020a5d5012000000b00226dedf1ab7sm1846442wrt.76.2022.09.04.14.45.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Sep 2022 14:45:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v9 1/7] RISC-V: Clear SIP bit only when using SBI IPI
 operations
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAK9=C2U5MjF+qv9z=_cSS4iN66dCY_goF0D_-ujcPPG9VrReDw@mail.gmail.com>
Date: Sun, 4 Sep 2022 22:45:23 +0100
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bin Meng <bmeng.cn@gmail.com>
Message-Id: <E4342C74-F530-4F7F-B5EE-B86F3682D7A8@jrtc27.com>
References: <20220903161309.32848-1-apatel@ventanamicro.com>
 <20220903161309.32848-2-apatel@ventanamicro.com>
 <6ABE254E-C7DA-468B-9A6B-D10FF32E0E89@jrtc27.com>
 <CAK9=C2U5MjF+qv9z=_cSS4iN66dCY_goF0D_-ujcPPG9VrReDw@mail.gmail.com>
To: Anup Patel <apatel@ventanamicro.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_144528_856727_2B695F45 
X-CRM114-Status: GOOD (  37.28  )
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

T24gNCBTZXB0IDIwMjIsIGF0IDA1OjM5LCBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3Jv
LmNvbT4gd3JvdGU6Cj4gCj4gT24gU3VuLCBTZXAgNCwgMjAyMiBhdCAxOjQ2IEFNIEplc3NpY2Eg
Q2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4+IAo+PiBdT24gMyBTZXB0IDIwMjIs
IGF0IDE3OjEzLCBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+
PiAKPj4+IFRoZSBzb2Z0d2FyZSBpbnRlcnJ1cHQgcGVuZGluZyAoaS5lLiBbTXxTXVNJUCkgYml0
IGlzIHdyaXRlYWJsZSBmb3IKPj4+IFMtbW9kZSBidXQgcmVhZC1vbmx5IGZvciBNLW1vZGUgc28g
d2UgY2xlYXIgdGhpcyBiaXQgb25seSB3aGVuIHVzaW5nCj4+PiBTQkkgSVBJIG9wZXJhdGlvbnMu
Cj4+IAo+PiBVaCwgd2hlcmUgaXMgdGhpcyBzcGVjaWZpZWQ/IEkgZG9u4oCZdCBzZWUgdGhhdCwg
YW5kIHRoYXQgd291bGQgYmUgb2RkLgo+PiBUaGUgc3BlYyBjbGVhcmx5IHNheXMgdGhhdCBpZiBz
dXBlcnZpc29yIHNvZnR3YXJlIGludGVycnVwdHMgYXJlCj4+IGltcGxlbWVudGVkIHRoZW4gdGhl
IGJpdCBpcyB3cml0ZWFibGUsIHdpdGggbm8gY2F2ZWF0cyBvbiB3aGVuIChiZXlvbmQKPj4gdGhl
IHBlcm1pc3Npb25zIHJlcXVpcmVkIHRvIGFjY2VzcyB0aGUgQ1NSIGluIGdlbmVyYWwpLgo+IAo+
IEZvciBtaXAuTVNJUCwgcmVmZXIgdGhlIGJlbG93IHRleHQgZnJvbSBzZWN0aW9uIDMuMS45IG9m
IHRoZSBSSVNDLVYgcHJpdmlsZWdlZAo+IHNwZWNpZmljYXRpb246Cj4gCj4gIk1TSVAgaXMgcmVh
ZC1vbmx5IGluIG1pcCwgYW5kIGlzIHdyaXR0ZW4gYnkgYWNjZXNzZXMgdG8gbWVtb3J5LW1hcHBl
ZAo+IGNvbnRyb2wgcmVnaXN0ZXJzLCB3aGljaCBhcmUgdXNlZCBieSByZW1vdGUgaGFydHMgdG8g
cHJvdmlkZSBtYWNoaW5lLWxldmVsCj4gaW50ZXJwcm9jZXNzb3IgaW50ZXJydXB0cy4iCj4gCj4g
Rm9yIHNpcC5TU0lQLCByZWZlciB0aGUgYmVsb3cgdGV4dCBmcm9tIHNlY3Rpb24gNC4xLjMgb2Yg
dGhlIFJJU0MtViBwcml2aWxlZ2VkCj4gc3BlY2lmaWNhdGlvbjoKPiAKPiAiSWYgaW1wbGVtZW50
ZWQsIFNTSVAgaXMgd3JpdGFibGUgaW4gc2lwIGFuZCBtYXkgYWxzbyBiZSBzZXQgdG8gMSBieSBh
Cj4gcGxhdGZvcm0tc3BlY2lmaWMgaW50ZXJydXB0IGNvbnRyb2xsZXIuIgoKSSBtaXNpbnRlcnBy
ZXRlZCB5b3U7IEkgdGhvdWdodCB5b3Ugd2VyZSBzYXlpbmcgU1NJUCBjb3VsZCBiZSBzZXQgZnJv
bQpTLW1vZGUgYnV0IG5vdCBNLW1vZGUsIG5vdCB0aGF0IHlvdSB3ZXJlIHRhbGtpbmcgYWJvdXQg
dGhlIGJpdApjb3JyZXNwb25kaW5nIHRvIHRoZSBtb2RlLiBJIGFncmVlIE1TSVAgaXMgZGlmZmVy
ZW50IHRvIFNTSVAKKHVuZm9ydHVuYXRlbHkpLgoKPj4gVGhpcyBwYXRjaCBkb2VzIG1ha2Ugc2Vu
c2UgZm9yIGEgZGlmZmVyZW50IHJlYXNvbiB0aG91Z2g6IHRoYXQgSVBJcyBtYXkKPj4gbm90IGJl
IHVzaW5nIHNvZnR3YXJlIGludGVycnVwdHMgYXQgYWxsIChpbiB0aGUgSU1TSUMgY2FzZSkuCj4g
Cj4gU3VyZSwgbGV0IG1lIGhlbHAgeW91IHVuZGVyc3RhbmQgdGhpcyBiZXR0ZXIuCj4gCj4gVGhl
IElQSSBzdXBwb3J0IGluIExpbnV4IFJJU0MtViBkb2VzIG5vdCBhc3N1bWUgYW55IHBhcnRpY3Vs
YXIgSVBJCj4gbWVjaGFuaXNtLiBJbiBmYWN0LCB3ZSB3aWxsIGJlIHN1cHBvcnRpbmcgbXVsdGlw
bGUgSVBJIG1lY2hhbmlzbSBpbgo+IExpbnV4IFJJU0MtViBhbmQgb25lIG9mIHRoZXNlIHdpbGwg
YmUgc2VsZWN0ZWQgYXQgYm9vdC10aW1lIGJhc2VkCj4gb24gcGxhdGZvcm0gY2FwYWJpbGl0aWVz
Ogo+IAo+IDEpIExpbnV4IFJJU0MtViBOb01NVSAoTS1tb2RlKSBrZXJuZWwgd2lsbCB1c2UgSVBJ
cyBwcm92aWRlZCBieQo+IHRoZSBDTElOVCB0aW1lciBkcml2ZXIgKHJlZmVyLCBkcml2ZXJzL2Ns
b2Nrc291cmNlL3RpbWVyLWNsaW50LmMpLiBUaGlzCj4gbWVjaGFuaXNtIHVzZXMgdGhlIENMSU5U
IE1NSU8gcmVnaXN0ZXJzIHRvIHVwZGF0ZSB0aGUgc3RhdGUgb2YKPiBtaXAuTVNJUCBiaXQuIFRo
ZSBNLW1vZGUga2VybmVsIGNhbm5vdCBkaXJlY3RseSBtb2RpZnkgdGhlIG1pcC5NU0lQCj4gYml0
IHdpdGhvdXQgZ29pbmcgdGhyb3VnaCB0aGUgQ0xJTlQgTU1JTyByZWdpc3RlcnMuCj4gCj4gMikg
TGludXggUklTQy1WIE1NVSAoUy1tb2RlKSBrZXJuZWwgd2l0aG91dCBJTVNJQyB3aWxsIHVzZSBJ
UElzCj4gcHJvdmlkZWQgYnkgdGhlIFNCSSBJUEkgY2FsbHMgKHJlZmVyLCBhcmNoL3Jpc2N2L2tl
cm5lbC9zYmkuYykuIFRoaXMKPiBtZWNoYW5pc20gdXNlcyB0aGUgU0JJIFNFTkRfSVBJIGNhbGwg
d2hpY2ggc2V0cyB0aGUgc2lwLlNTSVAKPiBiaXQgZnJvbSBNLW1vZGUgZmlybXdhcmUgYW5kIGtl
cm5lbCBpdHNlbGYgd2lsbCBjbGVhciBzaXAuU1NJUCBiaXQKPiBhZnRlciBoYW5kbGluZyBJUEkg
b24gdGFyZ2V0IEhBUlQuCj4gCj4gMykgTGludXggUklTQy1WIE1NVSAoUy1tb2RlKSBrZXJuZWwg
d2l0aCBJTVNJQyB3aWxsIHVzZSBJUElzCj4gYXMgc29mdHdhcmUgaW5qZWN0ZWQgTVNJcyAocmVm
ZXIsCj4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXgvYmxvYi9yaXNjdl9haWFfdjEv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy5jKS4KPiBUaGlzIG1lY2hhbmlzbSBkb2Vz
IG5vdCB1c2UgIlNvZnR3YXJlIEludGVycnVwdCIgYml0cyBkZWZpbmVkIGluCj4gdGhlIG1pcC9z
aXAgQ1NSLiBJbnN0ZWFkIElQSXMgYXJlIHJlZ3VsYXIgZXh0ZXJuYWwgaW50ZXJydXB0cyBpbmpl
Y3RlZAo+IHZpYSBJTVNJQyBhbmQgaW1zaWNfaGFuZGxlX2lycSgpIG9mIHRoZSBJTVNJQyBkcml2
ZXIgY2xlYXJzIHRoZQo+IElQSSBwZW5kaW5nIHRocm91Z2ggc3RvcGVpIENTUi4KPiAKPiBDdXJy
ZW50bHksIHdlIHdlcmUgYmxpbmRseSBjbGVhcmluZyBtaXAuW018U11TSVAgYml0IGluIHJpc2N2
X2NsZWFyX2lwaSgpCj4gd2hpY2ggaXMgYSBjb21tb24gZnVuY3Rpb24gZm9yIGFsbCB0aHJlZSBt
ZWNoYW5pc21zIGFib3ZlIHdoaWNoCj4gaXMgbm90IHJpZ2h0IGNvbnNpZGVyaW5nIHRoZSBkaXZl
cnNpdHkgaW4gSVBJIG1lY2hhbmlzbXMgc3VwcG9ydGVkCj4gYnkgTGludXggUklTQy1WLgo+IAo+
IFRoaXMgcGF0Y2ggbW92ZXMgdGhlIGNsZWFyaW5nIG9mIFNTSVAgYml0IHRvIFNCSSBJUEkgY29k
ZSBzbyB0aGF0IGl0IGlzCj4gb25seSBkb25lIGZvciBtZWNoYW5pc20gIzIgKGRlc2NyaWJlZCBh
Ym92ZSkgYW5kIG5vdCBkb25lIGZvcgo+IG1lY2hhbmlzbXMgIzEgJiAjMyAoZGVzY3JpYmVkIGFi
b3ZlKS4KClllcywgdGhhdOKAmXMgd2hhdCBJIHdhcyB0cnlpbmcgdG8gY29tbXVuaWNhdGUgYXMg
dG8gd2hhdCB0aGUgbW90aXZhdGlvbgpvZiB0aGUgcGF0Y2ggc2hvdWxkIGJlICh0aG91Z2ggb21p
dHRlZCB0aGUgTS1tb2RlIGNhc2UgYmVjYXVzZSBJCnNvbWV0aW1lcyBmb3JnZXQgdGhhdCBMaW51
eCB0cmllcyB0byBzdXBwb3J0IHRoaXMgb2RkLWJhbGwKY29uZmlndXJhdGlvbikuIEkgYWx3YXlz
IGFncmVlZCB3aXRoIHRoZSBjb250ZW50IG9mIHRoZSBwYXRjaCwganVzdApkaXNhZ3JlZWQgd2l0
aCB0aGUgbWVzc2FnZS4gTm93IHlvdeKAmXZlIGV4cGxhaW5lZCB3aGF0IHlvdSBtZWFudCBJIGRv
buKAmXQKdGhpbmsgaXTigJlzIHdyb25nLCBidXQgSSBkbyB0aGluayBpdCBjb3VsZCBiZSBjbGVh
cmVyLCBlc3BlY2lhbGx5IHNpbmNlCnRoZSBJTVNJQyBjYXNlIChhbmQgSSBndWVzcyBBQ0xJTlQg
U1NXSSB0b28sIHdoaWNoIGlzIHlldCBhbm90aGVyCm9wdGlvbikgc2hvdWxkIGJlIHN0YXRlZCB0
byBqdXN0aWZ5IHdoeSBpdOKAmXMgdGllZCB0byB0aGUgU0JJIElQSQppbXBsZW1lbnRhdGlvbiBh
bmQgbm90IHVuZGVyICFJU19FTkFCTEVEKENPTkZJR19SSVNDVl9NX01PREUpLgoKSmVzcwoKPiBS
ZWdhcmRzLAo+IEFudXAKPiAKPj4gCj4+IEplc3MKPj4gCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbnVw
IFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBCaW4gTWVu
ZyA8Ym1lbmcuY25AZ21haWwuY29tPgo+Pj4gLS0tCj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC9zYmku
YyB8IDggKysrKysrKy0KPj4+IGFyY2gvcmlzY3Yva2VybmVsL3NtcC5jIHwgMiAtLQo+Pj4gMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+PiAKPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Ni
aS5jCj4+PiBpbmRleCA3NzVkMzMyMmI0MjIuLmZjNjE0NjUwYTJlMyAxMDA2NDQKPj4+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmku
Ywo+Pj4gQEAgLTY0Myw4ICs2NDMsMTQgQEAgc3RhdGljIHZvaWQgc2JpX3NlbmRfY3B1bWFza19p
cGkoY29uc3Qgc3RydWN0IGNwdW1hc2sgKnRhcmdldCkKPj4+ICAgICAgc2JpX3NlbmRfaXBpKHRh
cmdldCk7Cj4+PiB9Cj4+PiAKPj4+ICtzdGF0aWMgdm9pZCBzYmlfaXBpX2NsZWFyKHZvaWQpCj4+
PiArewo+Pj4gKyAgICAgY3NyX2NsZWFyKENTUl9JUCwgSUVfU0lFKTsKPj4+ICt9Cj4+PiArCj4+
PiBzdGF0aWMgY29uc3Qgc3RydWN0IHJpc2N2X2lwaV9vcHMgc2JpX2lwaV9vcHMgPSB7Cj4+PiAt
ICAgICAuaXBpX2luamVjdCA9IHNiaV9zZW5kX2NwdW1hc2tfaXBpCj4+PiArICAgICAuaXBpX2lu
amVjdCA9IHNiaV9zZW5kX2NwdW1hc2tfaXBpLAo+Pj4gKyAgICAgLmlwaV9jbGVhciA9IHNiaV9p
cGlfY2xlYXIKPj4+IH07Cj4+PiAKPj4+IHZvaWQgX19pbml0IHNiaV9pbml0KHZvaWQpCj4+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
bXAuYwo+Pj4gaW5kZXggNzYwYTY0NTE4YzU4Li5jNTZkNjdmNTNlYTkgMTAwNjQ0Cj4+PiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc21w
LmMKPj4+IEBAIC04Myw4ICs4Myw2IEBAIHZvaWQgcmlzY3ZfY2xlYXJfaXBpKHZvaWQpCj4+PiB7
Cj4+PiAgICAgIGlmIChpcGlfb3BzICYmIGlwaV9vcHMtPmlwaV9jbGVhcikKPj4+ICAgICAgICAg
ICAgICBpcGlfb3BzLT5pcGlfY2xlYXIoKTsKPj4+IC0KPj4+IC0gICAgIGNzcl9jbGVhcihDU1Jf
SVAsIElFX1NJRSk7Cj4+PiB9Cj4+PiBFWFBPUlRfU1lNQk9MX0dQTChyaXNjdl9jbGVhcl9pcGkp
Owo+Pj4gCj4+PiAtLQo+Pj4gMi4zNC4xCj4+PiAKPj4+IAo+Pj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+PiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
