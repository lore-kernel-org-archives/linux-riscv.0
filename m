Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EE4C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 13:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kb4fZ2OD7n7zYXy5w5FmPHOxqQOAUQbu7Bf/VvbgNhU=; b=CRTVxxsYR/T6lK
	7DaVrmmFpG728p+6WSnSY5kcPemn4NmXAgTQOwCjY2dg+O0Oddqmw/SBA6p6vrC4UPlqOkUz6L4Qk
	lIJ1C8kGDsVcb12KGcodWvsjKJsRfOFG4joBkFHYxHcYcIkiyZpQFDQhc8fU507nwUrSGORDGX7Ag
	0TuHEptXWVGdG8KL5NlsgxPzdoGEg/goHiSFncAbyt0R8KLVJhhvpIIowK7GekmeplXX5XdvYapMm
	+/7yZ3kErSysftA7Q5ExmDGqg9m4zDwdl2fpmmImHBwUIXO38Int5jF3iosoXDPGgeV+Dk3n9uFSg
	yu1NKC47oZr5Gpv30nMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc3AG-00000008MqJ-11ae;
	Thu, 08 Aug 2024 13:26:48 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc3AD-00000008MpN-2bJv
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 13:26:47 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-39b0826298cso3712685ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 06:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1723123604; x=1723728404; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6f2sZw67FeYh4UfyoUHhTyMBouhrB7u7E2dwkiUnDOU=;
        b=K92GyKL2LZsCEoN17y7mxyVUo9+udj5rulAWKDafOZ5+bjt8krdghOybv8WGklYxJm
         HuieuUEJwHs3h4DmlnUi+PXt7JDyE1lLRW0fKi2rfRlDDGuuBss4x7spTPLzgVgCM3P4
         lnV7UALAJo8Qs/LtT/IDm0OxeGDtQnrgwcyAJlRL3Yhq6Z1WFKsSpxvqMEI5hlfap6ZY
         e1uyaURTbEc0gKv27VTctsqREbRKBvGkODufNdOri/JFu3cK9FK5hCTjqcu8CrqBJvOP
         F0iByWHKwxjmIFGavLQ5yln7KJPHw8D1xMwG06ixd3SnE3ChP9b5ZkejDVHVBRF6l2IY
         CtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723123604; x=1723728404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6f2sZw67FeYh4UfyoUHhTyMBouhrB7u7E2dwkiUnDOU=;
        b=w6NNjF7vrhP1jzf6yVARA3NeGK73RUC+Wbkoq0b+Nn7XXIMImEFveR7c+BEs0NTrYt
         0FGTeGWbN+bXQbwfYSv9DcR15bq73+XrIeYAb9aMa6Csx+Se61iBDmvmsFqPWeEuURpB
         GDE8CkGoyYhXFnbsfFQ2n0qK4gJN18y5h5HcQSW00hC/44+/2F1S1Nf0CfK7yIsMQhRB
         /jix1Ak3BItqr3U6TtVIInAhfDdK+jmp7qlAWWMLOAaTmv6YUL/aF+IQpnv1lrXD1g2S
         RMSred4vtU5yDU7k4luMmtqoDnJYYBRBA7MY2QW2kIjXHcwz9ylt98SSAzbT9bV/iwEX
         Wymw==
X-Forwarded-Encrypted: i=1; AJvYcCVfGRLy8N5bDGl0lq8WzHWY3WO17mZiEPM5g7YEzq/ImIp4zTEcRlh1F3MobjpHOQwMCLoVxz6M9IwfYFV5iiLk/63RLNfwgae4cPBiirHi
X-Gm-Message-State: AOJu0YztpbfZ1ia6xzYqfe+z/JdbcVUlu63L2ljnRHIURzR+BQzuD5fJ
	bz+6xu3sYpR1/HOKHxdxeYuSbpJHW0RMA44TuzqpZUYAn9+6SSCbBNkcJb5vqNRnEAR8WJdAa34
	LlvFZ74mrLZoG6cHFmS8RzPwz7+oDp2bGg34rvw==
X-Google-Smtp-Source: AGHT+IFD+JDzsihlY7CNjwkDlNPlTjFUlD2Es2LqoFt6m6hUbUcrYxfIFji963rPVGVGY5GOkjlWXhWWMSIo9rIX6AE=
X-Received: by 2002:a05:6e02:1a64:b0:39b:2daf:1b82 with SMTP id
 e9e14a558f8ab-39b5ecca1a6mr20393155ab.16.1723123604393; Thu, 08 Aug 2024
 06:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240808081412.24553-1-yongxuan.wang@sifive.com>
In-Reply-To: <20240808081412.24553-1-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 Aug 2024 18:56:32 +0530
Message-ID: <CAAhSdy3VKMngwHxOg5+z6pK3QgZnLv=3+hpZBeUm87L_e62aUQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] riscv-aplic: manually set pending for the
 pre-existing interrupts
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_062645_827756_7B33B7C7 
X-CRM114-Status: GOOD (  31.46  )
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

TW9yZSBhcHByb3ByaWF0ZSBwYXRjaCBzdWJqZWN0IHNob3VsZCBiZToKCmlycWNoaXA6IHJpc2N2
LWFwbGljOiByZXRyaWdnZXIgaW50ZXJydXB0IGluIE1TSSBtb2RlIHVwb24gd3JpdGUgdG8Kc291
cmNlY2ZnIHJlZ2lzdGVyCgpPbiBUaHUsIEF1ZyA4LCAyMDI0IGF0IDE6NDTigK9QTSBZb25nLVh1
YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoZSBzZWN0aW9u
IDQuNS4yIG9mIHRoZSBSSVNDLVYgQUlBIHNwZWNpZmljYXRpb24gc2F5cyB0aGF0IGFueSB3cml0
ZQo+IHRvIGEgc291cmNlY2ZnIHJlZ2lzdGVyIG9mIGFuIEFQTElDIG1pZ2h0IChvciBtaWdodCBu
b3QpIGNhdXNlIHRoZQo+IGNvcnJlc3BvbmRpbmcgaW50ZXJydXB0LXBlbmRpbmcgYml0IHRvIGJl
IHNldCB0byBvbmUgaWYgdGhlIHJlY3RpZmllZAo+IGlucHV0IHZhbHVlIGlzIGhpZ2ggKD0gMSkg
dW5kZXIgdGhlIG5ldyBzb3VyY2UgbW9kZS4KCkFkZCBxdW90ZXMgYXJvdW5kIHRoZSB0ZXh0IGZy
b20gUklTQy1WIEFJQSBzcGVjaWZpY2F0aW9uLgoKPgo+IElmIGFuIGludGVycnVwdCBpcyBhc3Nl
cnRlZCBiZWZvcmUgdGhlIGRyaXZlciBjb25maWdzIGl0cyBpbnRlcnJ1cHQKPiB0eXBlIHRvIEFQ
TElDLCBpdCdzIHBlbmRpbmcgYml0IHdpbGwgbm90IGJlIHNldCBleGNlcHQgYSByZWxldmFudAo+
IHdyaXRlIHRvIGEgc2V0aXAgb3Igc2V0aXBudW0gcmVnaXN0ZXIuIFdoZW4gd2Ugd3JpdGUgdGhl
IGludGVycnVwdAo+IHR5cGUgdG8gc291cmNlY2ZnIHJlZ2lzdGVyLCBpZiB0aGUgQVBMSUMgZGV2
aWNlIGRvZXNuJ3QgY2hlY2sgYW5kCj4gdXBkYXRlIHRoZSBwZW5kaW5nIGJpdCwgdGhlIGludGVy
cnVwdCBtaWdodCBuZXZlciBiZWNvbWVzIHBlbmRpbmcuCgpUaGUgc2Vjb25kIHNlbnRlbmNlIGFi
b3ZlIGNhbiBiZSByZS13cml0dGVuIGFzIGZvbGxvd3M6CgpXaGVuIGludGVycnVwdCB0eXBlIGlz
IGNoYW5nZWQgaW4gc291cmNlY2ZnIHJlZ2lzdGVyLCB0aGUgQVBMSUMKZGV2aWNlIG1pZ2h0IG5v
dCBzZXQgdGhlIGNvcnJlc3BvbmRpbmcgcGVuZGluZyBiaXQsIHRoZSBpbnRlcnJ1cHQKbWlnaHQg
bmV2ZXIgYmVjb21lIHBlbmRpbmcuCgo+Cj4gRm9yIHRoZSBsZXZlbCBpbnRlcnJ1cHRzIGZvcndh
cmRlZCBieSBNU0ksIHdlIGNhbiBtYW51YWxseSBzZXQgdGhlCj4gcGVuZGluZyBiaXQgaWYgdGhl
IGludGVycnVwdHMgaGF2ZSBiZWVuIGFzc2VydGVkIGJlZm9yZSB0aGUgaW50ZXJydXB0Cj4gdHlw
ZSBjb25maWd1cmF0aW9uLgoKVGhlIGFib3ZlIHNlbnRlbmNlIGNhbiBiZSByZS13cml0dGVybiBh
cyBmb2xsb3dzOgoKVG8gaGFuZGxlIHNvdXJjZWNmZyByZWdpc3RlciBjaGFuZ2VzIGZvciBsZXZl
bC10cmlnZ2VyZWQgaW50ZXJydXB0cyBpbgpNU0kgbW9kZSwgbWFudWFsbHkgc2V0IHRoZSBwZW5k
aW5nIGJpdCBmb3IgcmV0cmlnZ2VyaW5nIGludGVycnVwdCBpZiBpdAp3YXMgYWxyZWFkeSBhc3Nl
cnRlZC4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0Bz
aWZpdmUuY29tPgo+IFJldmlld2VkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZp
dmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYyB8
ICA0ICsrKysKPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmggfCAgMSAr
Cj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbXNpLmMgIHwgMTcgKysrKysrKysr
KystLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFp
bi5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMKPiBpbmRleCAyOGRk
MTc1YjU3NjQuLjQ2YzQ0ZDk2MTIzYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWFwbGljLW1haW4uYwo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBs
aWMtbWFpbi5jCj4gQEAgLTU4LDYgKzU4LDEwIEBAIGludCBhcGxpY19pcnFfc2V0X3R5cGUoc3Ry
dWN0IGlycV9kYXRhICpkLCB1bnNpZ25lZCBpbnQgdHlwZSkKPiAgICAgICAgIHNvdXJjZWNmZyAr
PSAoZC0+aHdpcnEgLSAxKSAqIHNpemVvZih1MzIpOwo+ICAgICAgICAgd3JpdGVsKHZhbCwgc291
cmNlY2ZnKTsKPgo+ICsgICAgICAgLyogbWFudWFsbHkgc2V0IHBlbmRpbmcgZm9yIHRoZSBhc3Nl
cnRpbmcgaW50ZXJydXB0cyAqLwo+ICsgICAgICAgaWYgKCFwcml2LT5ucl9pZGNzKQo+ICsgICAg
ICAgICAgICAgICBhcGxpY19yZXRyaWdnZXJfYXNzZXJ0aW5nX2lycShkKTsKPiArCgpUaGlzIGlz
IG5vdCB0aGUgcmlnaHQgcGxhY2UuIFNlZSBiZWxvdy4KCj4gICAgICAgICByZXR1cm4gMDsKPiAg
fQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5o
IGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmgKPiBpbmRleCA0MzkzOTI3
ZDhjODAuLmMyYmU2NmYzNzliMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJp
c2N2LWFwbGljLW1haW4uaAo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMt
bWFpbi5oCj4gQEAgLTM0LDYgKzM0LDcgQEAgc3RydWN0IGFwbGljX3ByaXYgewo+Cj4gIHZvaWQg
YXBsaWNfaXJxX3VubWFzayhzdHJ1Y3QgaXJxX2RhdGEgKmQpOwo+ICB2b2lkIGFwbGljX2lycV9t
YXNrKHN0cnVjdCBpcnFfZGF0YSAqZCk7Cj4gK3ZvaWQgYXBsaWNfcmV0cmlnZ2VyX2Fzc2VydGlu
Z19pcnEoc3RydWN0IGlycV9kYXRhICpkKTsKPiAgaW50IGFwbGljX2lycV9zZXRfdHlwZShzdHJ1
Y3QgaXJxX2RhdGEgKmQsIHVuc2lnbmVkIGludCB0eXBlKTsKPiAgaW50IGFwbGljX2lycWRvbWFp
bl90cmFuc2xhdGUoc3RydWN0IGlycV9md3NwZWMgKmZ3c3BlYywgdTMyIGdzaV9iYXNlLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKmh3aXJxLCB1bnNpZ25l
ZCBpbnQgKnR5cGUpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFw
bGljLW1zaS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tc2kuYwo+IGluZGV4
IDAyODQ0NGFmNDhiZC4uZWFmNGQ3MzBhNDlhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtYXBsaWMtbXNpLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWFwbGljLW1zaS5jCj4gQEAgLTMyLDE1ICszMiwxMCBAQCBzdGF0aWMgdm9pZCBhcGxpY19tc2lf
aXJxX3VubWFzayhzdHJ1Y3QgaXJxX2RhdGEgKmQpCj4gICAgICAgICBhcGxpY19pcnFfdW5tYXNr
KGQpOwo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgYXBsaWNfbXNpX2lycV9lb2koc3RydWN0IGlycV9k
YXRhICpkKQo+ICt2b2lkIGFwbGljX3JldHJpZ2dlcl9hc3NlcnRpbmdfaXJxKHN0cnVjdCBpcnFf
ZGF0YSAqZCkKClRoaXMgbmVlZHMgdG8gYmUgYSBzdGF0aWMgZnVuY3Rpb24gYmVjYXVzZSB3ZSBk
b24ndCByZXF1aXJlCnRoaXMgZm9yIEFQTElDIGluIGRpcmVjdCBtb2RlLgoKQWxzbywgcmVuYW1l
IGl0IHRvIGFwbGljX21zaV9pcnFfcmV0cmlnZ2VyX2xldmVsKCkuCgo+ICB7Cj4gICAgICAgICBz
dHJ1Y3QgYXBsaWNfcHJpdiAqcHJpdiA9IGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRhKGQpOwo+
Cj4gLSAgICAgICAvKgo+IC0gICAgICAgICogRU9JIGhhbmRsaW5nIGlzIHJlcXVpcmVkIG9ubHkg
Zm9yIGxldmVsLXRyaWdnZXJlZCBpbnRlcnJ1cHRzCj4gLSAgICAgICAgKiB3aGVuIEFQTElDIGlz
IGluIE1TSSBtb2RlLgo+IC0gICAgICAgICovCj4gLQo+ICAgICAgICAgc3dpdGNoIChpcnFkX2dl
dF90cmlnZ2VyX3R5cGUoZCkpIHsKPiAgICAgICAgIGNhc2UgSVJRX1RZUEVfTEVWRUxfTE9XOgo+
ICAgICAgICAgY2FzZSBJUlFfVFlQRV9MRVZFTF9ISUdIOgo+IEBAIC01OSw2ICs1NCwxNiBAQCBz
dGF0aWMgdm9pZCBhcGxpY19tc2lfaXJxX2VvaShzdHJ1Y3QgaXJxX2RhdGEgKmQpCj4gICAgICAg
ICB9Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCBhcGxpY19tc2lfaXJxX2VvaShzdHJ1Y3QgaXJxX2Rh
dGEgKmQpCj4gK3sKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBFT0kgaGFuZGxpbmcgaXMgcmVx
dWlyZWQgb25seSBmb3IgbGV2ZWwtdHJpZ2dlcmVkIGludGVycnVwdHMKPiArICAgICAgICAqIHdo
ZW4gQVBMSUMgaXMgaW4gTVNJIG1vZGUuCj4gKyAgICAgICAgKi8KPiArCj4gKyAgICAgICBhcGxp
Y19yZXRyaWdnZXJfYXNzZXJ0aW5nX2lycShkKTsKPiArfQo+ICsKCkRlZmluZSBBUExJQyBNU0kg
bW9kZSBzcGVjaWZpYyBpcnFfc2V0X3R5cGUoKSBsaWtlIGJlbG93OgoKaW50IGFwbGljX21zaV9p
cnFfc2V0X3R5cGUoc3RydWN0IGlycV9kYXRhICpkLCB1bnNpZ25lZCBpbnQgdHlwZSkKewogICAg
ICAgaW50IHJjOwoKICAgICAgIHJjID0gYXBsaWNfaXJxX3NldF90eXBlKGQsIHR5cGUpOwogICAg
ICAgaWYgKHJjKQogICAgICAgICAgICAgIHJldHVybiByYzsKCiAgICAgICAvKgogICAgICAgICog
VXBkYXRpbmcgc291cmNlY2ZnIHJlZ2lzdGVyIGZvciBsZXZlbC10cmlnZ2VyZWQgaW50ZXJydXB0
cwogICAgICAgICogcmVxdWlyZXMgaW50ZXJydXB0IHJldHJpZ2dlcmluZyB3aGVuIEFQTElDIGlu
IE1TSSBtb2RlLgogICAgICAgICovCiAgICAgICBhcGxpY19tc2lfaXJxX3JldHJpZ2dlcl9sZXZl
bChkKTsKICAgICAgIHJldHVybiAwOwp9Cgo+ICBzdGF0aWMgdm9pZCBhcGxpY19tc2lfd3JpdGVf
bXNnKHN0cnVjdCBpcnFfZGF0YSAqZCwgc3RydWN0IG1zaV9tc2cgKm1zZykKPiAgewo+ICAgICAg
ICAgdW5zaWduZWQgaW50IGdyb3VwX2luZGV4LCBoYXJ0X2luZGV4LCBndWVzdF9pbmRleCwgdmFs
Owo+IC0tCj4gMi4xNy4xCj4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
