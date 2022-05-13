Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6A7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 13 May 2022 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dS0D4rGSYJi3I3ZNSU67j2WFiu1zSPJvFbgP6Xf4+8=; b=XsQtEe6X3nJn2i
	rkWk2GUasT0tfdG6NNYjR0jvI84+FQAQM6oD2w5SkXZiGam1MiZbkhSQDd7NHP2OSLIP8L+SNkSiI
	PQ6tQ4H26z1nz2LEffM94Q3mVgwvGRUfuMwNb8c2PRX2/QveE4O+nkdUnacnJK6JdeZzPV0Iy8phB
	DomlW9LIsRpI3A1v840R0oSg2jFTfnbONuYQc9VZiR5wXQPiIECYntaF0pLl09cAWXrhYHfwbD+wu
	yYA8fUEyH3bfLYIvETNwrZz5UsDLPzqs50xcTH729dW1bd9PWK3GLKSchMHHc0hZXZBmLhTetpfAB
	MAIY3ZvR+zvojLEjDkxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npSX9-00FYGG-DG; Fri, 13 May 2022 10:28:31 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npSX5-00FYCr-DV
 for linux-riscv@lists.infradead.org; Fri, 13 May 2022 10:28:29 +0000
Received: by mail-vs1-f42.google.com with SMTP id e19so7907471vsu.12
 for <linux-riscv@lists.infradead.org>; Fri, 13 May 2022 03:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TCFzo+ZD7qnkAFD88dWZtIU33M2yQsfHtS7BKLVGmW0=;
 b=bNsWLW7bJoxJp4SP4UleN0/YLIkzghJGNUEwSYbEMH/y3CgTPS/IvSIyuuBkmwongX
 tC9xypwSwb1qUkkYka/6xZNOro9hzejFA0L3TZHzRiEnkuGfOOsPFV/0dlxES1BTNgcY
 i4b+zHFDW8sgRYFqEjVuxhKyE2ctNkyvbucffIgdb7Irb+WmeroYam/Zixoz2phGTrWb
 SYWROl0UIRx3cVnWeFGejAJVD/w5KmmTzoQS1W659sCBXXomSJ3QCMLOImdd+wWSoV28
 55oHW5Di3sRW2oquMB11OLZ88OJx22SNgdhq9BqK/4y1G3CYz+i1LZ9KLqYxxPoWvFfd
 Iytw==
X-Gm-Message-State: AOAM531qDJmWtFHvU1J0qzQ/1+Byn0zkDFYZcr1ZpgSiS3BinUKpmipb
 T9VLBW8rwp2AxczZq3coJIV3XMRrgUXL79h9
X-Google-Smtp-Source: ABdhPJyqZM+8N9c183WmP3wiXcK5MFA1fABUMkyALQ9L3CdrwW5aOtklpwTtO+Nju2bo/r9jTfmEbw==
X-Received: by 2002:a05:6102:370a:b0:333:c0e7:77e8 with SMTP id
 s10-20020a056102370a00b00333c0e777e8mr2059343vst.54.1652437705320; 
 Fri, 13 May 2022 03:28:25 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42]) by smtp.gmail.com with ESMTPSA id
 t3-20020a1f4603000000b0034350d68fd9sm320544vka.0.2022.05.13.03.28.24
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 03:28:24 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id i16so3041069uat.5
 for <linux-riscv@lists.infradead.org>; Fri, 13 May 2022 03:28:24 -0700 (PDT)
X-Received: by 2002:ab0:6f8f:0:b0:35d:5045:46c4 with SMTP id
 f15-20020ab06f8f000000b0035d504546c4mr1886627uav.116.1652437703966; Fri, 13
 May 2022 03:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220511214132.2281431-1-heiko@sntech.de>
 <20220511214132.2281431-2-heiko@sntech.de>
 <CAAhSdy2PN8knGzyLadq-aoXVZqN3YASVVu7HxiO3YEb6XyqRxA@mail.gmail.com>
In-Reply-To: <CAAhSdy2PN8knGzyLadq-aoXVZqN3YASVVu7HxiO3YEb6XyqRxA@mail.gmail.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <cmuellner@linux.com>
Date: Fri, 13 May 2022 12:28:12 +0200
X-Gmail-Original-Message-ID: <CAHB2gtTLF7GHsAf=vY6zcGgFzAi7igO0XRRDM0f_Hy7Ubs8piQ@mail.gmail.com>
Message-ID: <CAHB2gtTLF7GHsAf=vY6zcGgFzAi7igO0XRRDM0f_Hy7Ubs8piQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: document cbom-block-size
To: Anup Patel <anup@brainfault.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 Guo Ren <guoren@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
 Nick Kossifidis <mick@ics.forth.gr>, Samuel Holland <samuel@sholland.org>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Rob Herring <robh+dt@kernel.org>,
 krzk+dt@kernel.org, DTML <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_032827_475664_7DBC86F2 
X-CRM114-Status: GOOD (  21.32  )
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

SGkgQW51cCBhbmQgSGVpa28sCgpUaGUgQ0JPIHNwZWNpZmljYXRpb24gc2F5czoKIiIiCjIuNy4g
U29mdHdhcmUgRGlzY292ZXJ5ClRoZSBpbml0aWFsIHNldCBvZiBDTU8gZXh0ZW5zaW9ucyByZXF1
aXJlcyB0aGUgZm9sbG93aW5nIGluZm9ybWF0aW9uCnRvIGJlIGRpc2NvdmVyZWQgYnkgc29mdHdh
cmU6CuKAoiBUaGUgc2l6ZSBvZiB0aGUgY2FjaGUgYmxvY2sgZm9yIG1hbmFnZW1lbnQgYW5kIHBy
ZWZldGNoIGluc3RydWN0aW9ucwrigKIgVGhlIHNpemUgb2YgdGhlIGNhY2hlIGJsb2NrIGZvciB6
ZXJvIGluc3RydWN0aW9ucwoiIiIKClRoZXJlZm9yZSB3ZSBzaG91bGQgYWRkIHJpc2N2LGNib3ot
YmxvY2stc2l6ZSBhcyB3ZWxsLCBvcj8KQWRkaXRpb25hbGx5LCBzaG91bGQgd2UgYWRkIHJpc2N2
LGNib3AtYmxvY2stc2l6ZSBhcyB3ZWxsIG9yIHJlbmFtZQpyaXNjdixjYm9tLWJsb2NrLXNpemUg
aW50bwpyaXNjdixjYm9tLWNib3AtYmxvY2stc2l6ZSB0byByZWZsZWN0IHRoYXQgdGhpcyBzaXpl
IGlzIGFsc28gdXNlZCBmb3IKcHJlZmV0Y2ggaW5zdHJ1Y3Rpb25zPwoKQlIKQ2hyaXN0b3BoCgpP
biBUaHUsIE1heSAxMiwgMjAyMiBhdCA2OjE4IEFNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVs
dC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXkgMTIsIDIwMjIgYXQgMzoxMSBBTSBIZWlrbyBT
dHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPiA+Cj4gPiBUaGUgWmljYm9tIG9wZXJh
dGVzIG9uIGEgYmxvY2stc2l6ZSBkZWZpbmVkIGZvciB0aGUgY3B1LWNvcmUsCj4gPiB3aGljaCBk
b2VzIG5vdCBuZWNlc3NhcmlseSBtYXRjaCBvdGhlciBjYWNoZS1zaXplcyB1c2VkLgo+ID4KPiA+
IFNvIGFkZCB0aGUgbmVjZXNzYXJ5IHByb3BlcnR5IGZvciB0aGUgc3lzdGVtIHRvIGtub3cgdGhl
IGNvcmUncwo+ID4gYmxvY2stc2l6ZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVl
Ym5lciA8aGVpa29Ac250ZWNoLmRlPgo+Cj4gTG9va3MgZ29vZCB0byBtZS4KPgo+IFJldmlld2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+Cj4gUmVnYXJkcywKPiBBbnVw
Cj4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9j
cHVzLnlhbWwgfCA3ICsrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9jcHVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
Y3B1cy55YW1sCj4gPiBpbmRleCBkNjMyYWM3NjUzMmUuLmIxNzliZmQxNTVhMyAxMDA2NDQKPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwK
PiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlh
bWwKPiA+IEBAIC02Myw2ICs2MywxMyBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgIC0gcmlzY3Ys
c3Y0OAo+ID4gICAgICAgIC0gcmlzY3Ysbm9uZQo+ID4KPiA+ICsgIHJpc2N2LGNib20tYmxvY2st
c2l6ZToKPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWlu
dDMyCj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIEJsb2Nrc2l6ZSBpbiBieXRlcyBm
b3IgdGhlIFppY2JvbSBjYWNoZSBvcGVyYXRpb25zLiBUaGUgYmxvY2sKPiA+ICsgICAgICBzaXpl
IGlzIGEgcHJvcGVydHkgb2YgdGhlIGNvcmUgaXRzZWxmIGFuZCBkb2VzIG5vdCBuZWNlc3Nhcmls
eQo+ID4gKyAgICAgIG1hdGNoIG90aGVyIHNvZnR3YXJlIGRlZmluZWQgY2FjaGUgc2l6ZXMuCj4g
PiArCj4gPiAgICByaXNjdixpc2E6Cj4gPiAgICAgIGRlc2NyaXB0aW9uOgo+ID4gICAgICAgIElk
ZW50aWZpZXMgdGhlIHNwZWNpZmljIFJJU0MtViBpbnN0cnVjdGlvbiBzZXQgYXJjaGl0ZWN0dXJl
Cj4gPiAtLQo+ID4gMi4zNS4xCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
