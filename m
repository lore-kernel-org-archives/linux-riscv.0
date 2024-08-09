Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E86C52D71
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 07:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nM9cuSb3mp5xP8V+NYuGf+F7ES5uKAQ7w4v39RN/oU=; b=Cid2RJNH+JrfT+
	yBAYeLe+ug5okZLQufjrP1+rYdgFcOrci0eC3eN0ANphVQWI1211ZlIklspUXxKeUaWeIY8Y8Dufl
	b97As4x8NNL9ZJl/aX91zs/8J0B8xTW0mQY3C9hl4YAJM7v9Wrue5JaQh65XTMaVr6mPzEhAEfnqP
	u6R2wBizSi85Uljuq2VFplgPLYXNvRRcEP+XA8xyIyl5afaRIzXshbV9C8QuCMr/1/Guq3WBKR5l7
	UiAUX4KWAqQlIo5DYCvB7FgpQp3fxrk81g369S2Mva5w+7C99jWEymrkFUlPbiKCySBZXk5JGJHjs
	fwZfwTdx97TXoSwYQ5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scKF7-0000000AaKc-1Lji;
	Fri, 09 Aug 2024 07:40:57 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scKF4-0000000AaK3-2NAg
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 07:40:56 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-39b3c36d3adso5848755ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 00:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1723189253; x=1723794053; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvTxew8Byqy7FH0+Ero8MHq7Yfmx3knxdchtS7o3ERE=;
        b=2uGUjvSu7nb/zegRk8h0NK5qg+nv4J7Y7CKXyA4irXwOwj110TfTtYFUgPggno3ONS
         asOGPN6KkfH6FvQDBc7//4yWwW1xA2Qkh8RBEFo18OkmY8utexQWBGw33EL5/uTsAjd/
         vXuxFSOqp+sAo4oqLL3CuwplV1FLEKMjTiEM3quxZboVxxCaVaUphee8FRjtQ2QFb9Mf
         Bc5iNRFvzQJPyQIsiks/F6v3GxlSat9JP25VcKvZfWYVbntq+sHOatOtm8Jk7dt7pJxu
         DVBek5oIUeTVaGuJvY5w/rGjLdp2ZqVlcw0vpoAI6bdlfa2YvRzMFMT8xnTK5C3rgwGL
         fXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723189253; x=1723794053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvTxew8Byqy7FH0+Ero8MHq7Yfmx3knxdchtS7o3ERE=;
        b=XKj37eKrJ4z9xq9L/B11JJzdtRHLYywdBEJJrU309SfsvEv2FmODuh71XpXmxcJSkL
         aMJIbmLz/GludZtfcXYJvjqy5ap/Yt4OBhGoScm18mOnOh/XUgHBwTLc/xZJaVtZvtKU
         S5AOpndBfIgThaSjPjmWVoaHE6QYWrf8HV0z6AntEbobINpltxYFGx/q/tBmv5WlxCDc
         tqunecQKA3vO0wYUaSyl7Nwh1nGVCTSPBomGkjDBDEkeuZamUedH/YK+bEIG5dYmb2q1
         mpKYcwKP93Tbaem5OCFk/PHyiah+Ci+MN5OLlrEW3mhJmnl9NAkuTv2RHTLyHXIRcCdC
         u5gw==
X-Forwarded-Encrypted: i=1; AJvYcCX5D+ZI4gZr1PV5PjOcj2kGZ/5Tz7kSkM0HSNJFRIR1GwE7Gs0KPRw+Au7aG54fQ+dSuvIUn0FM1hx2ghxRdlPPqtfcBUHbtdcQsRRM1QpE
X-Gm-Message-State: AOJu0YzKkn/ZAsaVtYK7jDL/BA9oM+fHMYnp+hSM85BwsqM46PQIuc4H
	3HKkwApvCvpVoNz6c6kZS5c0m0dilErPMi2AsdLZ/QeVXWEcCWSlEyqzBj/NiXdJ0nGbHY0YxmE
	ncjei+SOeb+iq+hQb95lVABbFDTa+LIxRyTJ7vg==
X-Google-Smtp-Source: AGHT+IHbrJ4hZMchlSmfMj4NgTssVC/F92aVTWn6kOpDdbl79LGZuF4ig3Ca6JpaYJsw6t7esH5uMdUL+zK69nqPc50=
X-Received: by 2002:a05:6e02:1aa6:b0:397:75a:39b9 with SMTP id
 e9e14a558f8ab-39b7a423e94mr12506315ab.16.1723189252955; Fri, 09 Aug 2024
 00:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240809071049.2454-1-yongxuan.wang@sifive.com>
In-Reply-To: <20240809071049.2454-1-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Aug 2024 13:10:41 +0530
Message-ID: <CAAhSdy0R7qAFA6DLrEoy5u+5mhQttvyfnrkjcUpvFsxwJeBiVQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] irqchip/riscv-aplic: Retrigger MSI interrupt on
 source configuration
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_004054_792340_C3A200DA 
X-CRM114-Status: GOOD (  26.23  )
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

T24gRnJpLCBBdWcgOSwgMjAyNCBhdCAxMjo0MOKAr1BNIFlvbmctWHVhbiBXYW5nIDx5b25neHVh
bi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gVGhlIHNlY3Rpb24gNC41LjIgb2YgdGhlIFJJ
U0MtViBBSUEgc3BlY2lmaWNhdGlvbiBzYXlzIHRoYXQgImFueSB3cml0ZQo+IHRvIGEgc291cmNl
Y2ZnIHJlZ2lzdGVyIG9mIGFuIEFQTElDIG1pZ2h0IChvciBtaWdodCBub3QpIGNhdXNlIHRoZQo+
IGNvcnJlc3BvbmRpbmcgaW50ZXJydXB0LXBlbmRpbmcgYml0IHRvIGJlIHNldCB0byBvbmUgaWYg
dGhlIHJlY3RpZmllZAo+IGlucHV0IHZhbHVlIGlzIGhpZ2ggKD0gMSkgdW5kZXIgdGhlIG5ldyBz
b3VyY2UgbW9kZS4iCj4KPiBXaGVuIHRoZSBpbnRlcnJ1cHQgdHlwZSBpcyBjaGFuZ2VkIGluIHNv
dXJjZWNmZyByZWdpc3RlciwgdGhlIEFQTElDCj4gZGV2aWNlIG1pZ2h0IG5vdCBzZXQgdGhlIGNv
cnJlc3BvbmRpbmcgcGVuZGluZyBiaXQsIHNvIHRoZSBpbnRlcnJ1cHQKPiBtaWdodCBuZXZlciBi
ZWNvbWUgcGVuZGluZy4KPgo+IFRvIGhhbmRsZSBzb3VyY2VjZmcgcmVnaXN0ZXIgY2hhbmdlcyBm
b3IgbGV2ZWwtdHJpZ2dlcmVkIGludGVycnVwdHMgaW4KPiBNU0kgbW9kZSwgbWFudWFsbHkgc2V0
IHRoZSBwZW5kaW5nIGJpdCBmb3IgcmV0cmlnZ2VyaW5nIGludGVycnVwdCBpZiBpdAo+IHdhcyBh
bHJlYWR5IGFzc2VydGVkLgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4
dWFuLndhbmdAc2lmaXZlLmNvbT4KPiBSZXZpZXdlZC1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50
LmNoZW5Ac2lmaXZlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBi
cmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gdjI6Cj4gLSB1cGRhdGUgY29t
bWl0IG1lc3NhZ2UgKEFudXAsIFRob21hcykKPiAtIHJlbmFtZSBhcGxpY19yZXRyaWdnZXJfYXNz
ZXJ0aW5nX2lycSgpIHRvIGFwbGljX21zaV9pcnFfcmV0cmlnZ2VyX2xldmVsKCkKPiAgIGFuZCBt
YWtlIGl0IGFzIGEgc3RhdGljIGZ1bmN0aW9uIHNpbmNlIG9ubHkgQVBMSUMgTVNJIG1vZGUgcmVx
dWlyZSBpdC4KPiAgIChBbnVwLCBUaG9tYXMpCj4KPiAtLS0KPiAgZHJpdmVycy9pcnFjaGlwL2ly
cS1yaXNjdi1hcGxpYy1tc2kuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jIGIvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tc2kuYwo+IGluZGV4IDAyODQ0NGFmNDhiZC4uOWQ2M2Rj
MzdkZWE1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbXNp
LmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWFwbGljLW1zaS5jCj4gQEAgLTMy
LDE1ICszMiwxMCBAQCBzdGF0aWMgdm9pZCBhcGxpY19tc2lfaXJxX3VubWFzayhzdHJ1Y3QgaXJx
X2RhdGEgKmQpCj4gICAgICAgICBhcGxpY19pcnFfdW5tYXNrKGQpOwo+ICB9Cj4KPiAtc3RhdGlj
IHZvaWQgYXBsaWNfbXNpX2lycV9lb2koc3RydWN0IGlycV9kYXRhICpkKQo+ICtzdGF0aWMgdm9p
ZCBhcGxpY19tc2lfaXJxX3JldHJpZ2dlcl9sZXZlbChzdHJ1Y3QgaXJxX2RhdGEgKmQpCj4gIHsK
PiAgICAgICAgIHN0cnVjdCBhcGxpY19wcml2ICpwcml2ID0gaXJxX2RhdGFfZ2V0X2lycV9jaGlw
X2RhdGEoZCk7Cj4KPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBFT0kgaGFuZGxpbmcgaXMgcmVx
dWlyZWQgb25seSBmb3IgbGV2ZWwtdHJpZ2dlcmVkIGludGVycnVwdHMKPiAtICAgICAgICAqIHdo
ZW4gQVBMSUMgaXMgaW4gTVNJIG1vZGUuCj4gLSAgICAgICAgKi8KPiAtCj4gICAgICAgICBzd2l0
Y2ggKGlycWRfZ2V0X3RyaWdnZXJfdHlwZShkKSkgewo+ICAgICAgICAgY2FzZSBJUlFfVFlQRV9M
RVZFTF9MT1c6Cj4gICAgICAgICBjYXNlIElSUV9UWVBFX0xFVkVMX0hJR0g6Cj4gQEAgLTU5LDYg
KzU0LDMyIEBAIHN0YXRpYyB2b2lkIGFwbGljX21zaV9pcnFfZW9pKHN0cnVjdCBpcnFfZGF0YSAq
ZCkKPiAgICAgICAgIH0KPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIGFwbGljX21zaV9pcnFfZW9pKHN0
cnVjdCBpcnFfZGF0YSAqZCkKPiArewo+ICsgICAgICAgLyoKPiArICAgICAgICAqIEVPSSBoYW5k
bGluZyBpcyByZXF1aXJlZCBvbmx5IGZvciBsZXZlbC10cmlnZ2VyZWQgaW50ZXJydXB0cwo+ICsg
ICAgICAgICogd2hlbiBBUExJQyBpcyBpbiBNU0kgbW9kZS4KPiArICAgICAgICAqLwo+ICsKPiAr
ICAgICAgIGFwbGljX21zaV9pcnFfcmV0cmlnZ2VyX2xldmVsKGQpOwo+ICt9Cj4gKwo+ICtzdGF0
aWMgaW50IGFwbGljX21zaV9pcnFfc2V0X3R5cGUoc3RydWN0IGlycV9kYXRhICpkLCB1bnNpZ25l
ZCBpbnQgdHlwZSkKPiArewo+ICsgICAgICAgaW50IHJjOwo+ICsKPiArICAgICAgIHJjID0gYXBs
aWNfaXJxX3NldF90eXBlKGQsIHR5cGUpOwo+ICsgICAgICAgaWYgKHJjKQo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFVwZGF0aW5nIHNv
dXJjZWNmZyByZWdpc3RlciBmb3IgbGV2ZWwtdHJpZ2dlcmVkIGludGVycnVwdHMKPiArICAgICAg
ICAqIHJlcXVpcmVzIGludGVycnVwdCByZXRyaWdnZXJpbmcgd2hlbiBBUExJQyBpcyBpbiBNU0kg
bW9kZS4KPiArICAgICAgICAqLwo+ICsgICAgICAgYXBsaWNfbXNpX2lycV9yZXRyaWdnZXJfbGV2
ZWwoZCk7Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RhdGljIHZvaWQgYXBsaWNf
bXNpX3dyaXRlX21zZyhzdHJ1Y3QgaXJxX2RhdGEgKmQsIHN0cnVjdCBtc2lfbXNnICptc2cpCj4g
IHsKPiAgICAgICAgIHVuc2lnbmVkIGludCBncm91cF9pbmRleCwgaGFydF9pbmRleCwgZ3Vlc3Rf
aW5kZXgsIHZhbDsKPiBAQCAtMTMwLDcgKzE1MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXNp
X2RvbWFpbl90ZW1wbGF0ZSBhcGxpY19tc2lfdGVtcGxhdGUgPSB7Cj4gICAgICAgICAgICAgICAg
IC5uYW1lICAgICAgICAgICAgICAgICAgID0gIkFQTElDLU1TSSIsCj4gICAgICAgICAgICAgICAg
IC5pcnFfbWFzayAgICAgICAgICAgICAgID0gYXBsaWNfbXNpX2lycV9tYXNrLAo+ICAgICAgICAg
ICAgICAgICAuaXJxX3VubWFzayAgICAgICAgICAgICA9IGFwbGljX21zaV9pcnFfdW5tYXNrLAo+
IC0gICAgICAgICAgICAgICAuaXJxX3NldF90eXBlICAgICAgICAgICA9IGFwbGljX2lycV9zZXRf
dHlwZSwKPiArICAgICAgICAgICAgICAgLmlycV9zZXRfdHlwZSAgICAgICAgICAgPSBhcGxpY19t
c2lfaXJxX3NldF90eXBlLAo+ICAgICAgICAgICAgICAgICAuaXJxX2VvaSAgICAgICAgICAgICAg
ICA9IGFwbGljX21zaV9pcnFfZW9pLAo+ICAjaWZkZWYgQ09ORklHX1NNUAo+ICAgICAgICAgICAg
ICAgICAuaXJxX3NldF9hZmZpbml0eSAgICAgICA9IGlycV9jaGlwX3NldF9hZmZpbml0eV9wYXJl
bnQsCj4gLS0KPiAyLjE3LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
