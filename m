Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9494C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 08:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gqrQqTn51siZd4guRoZupRYtqwLM8TmWQmNuuPp+4M=; b=KEwhXz651uCjy9
	iBXWiH1hLuzuRQA3iofxbKqcQcku99rXf/wlBd9nYQOGgnTM9pOiVaLhW6jGpS59CGZ4P71jEKJqJ
	hYj3vKfRmR9e1m+3zYByHJBBKdrtx5RbPwnQBeSx5gmehCQM7ob0l57OOtZYFugf27DDUI78HNIMT
	Vua5X7ZqgeYhfIFytDb94G/5wWb4h0p5ADluP3TUw3ixX3jII3/d6huk+yCpzzAR7hKA1/C7HjvR6
	J3W8doHvVt52fmIcoefumb/EWF2+ChphUsTvbVLV9CEb/GbYDEsNhUhlU5PooSfkVtd/3Umo5XV+n
	m5KqSG7iMLiGjGCdL6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSuN-00F2qq-Or; Wed, 28 Sep 2022 08:59:11 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSuL-00F2ot-5x
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 08:59:10 +0000
Received: by mail-ed1-x52e.google.com with SMTP id f20so16378184edf.6
        for <linux-riscv@lists.infradead.org>; Wed, 28 Sep 2022 01:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=Dvm1OHUyvtNMccO4EYWDtOLwnX0BggQjZbpuDfXSwLQ=;
        b=H4upBA4TbdlYng2HIEwyN4dUdyfJ3byoHqFv8e/nvWuV1u73cW5WMgv1yJNr8mIh55
         cOOzTE4WmSWD6ebsPd2krFb+lPApU5+BXfb1iX5IZkXuony3vSppBmn1a/ILJO2lvbXZ
         bJzNkRS0V092NKWaUw3hlya2Ya6jISSLjPS5ZmIBXPBKdlVnwuw4gDwV4rvPZZgJuTLw
         Rr8Uk5Rtei7gYL0Nw3jcGL9V6E9Ba+jwJGkQVei1uHyoJ5g0ulLf4PEEGz8zQihCOFtf
         Bsfnc1oTdycUNXAteguT72oDhOr1QQCTF3o2gmuUW8CE+mi5AgfOs3pY/lWyWEljjQBZ
         NWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Dvm1OHUyvtNMccO4EYWDtOLwnX0BggQjZbpuDfXSwLQ=;
        b=yYZWS7krOz17UQJqo1RrKdGpzIKzE29JwLXWQKaLe+Xb0eESBCkV8LUFiUv/V7vnqz
         J59M8iC06O7BTGmWdrIdfoCzy2gfSEe5zHtA71EDl+qQ/ckZV88PhHQDp5GGfj7/u4VT
         grrB1Sh43TqCKxKhx8Y8cLlSj5+UhqwBdVNUVSWnMshZSPwok2xc6WeaDj3rsibHpMZF
         CTiYlOm3cBp3NUpbvajFOTdthbZ7fwI8RBDJwdGl4fE+zAyZxDPXAJ9wD0jH+IP2QxTN
         Akn3Utstlr3SVGFH2ozIo+Z6nluSi+rXx8vRdBxsZ/l3YuwVvpxZnZYEXEV6BSYTP7Lu
         FPgQ==
X-Gm-Message-State: ACrzQf1NrAxPkk4rtkhcntDcucqQDYVJJF5YmXx0u4kLaeDav0tF5rIu
	P1/+Onq8p6us1mlrwpzOi69hxQ==
X-Google-Smtp-Source: AMsMyM4F4SUSAfCZg/KibEKnM65DCX3woMJ3ZIr6zz0iQ0nmqMHSzyyvKQDEmHAh2EmE/MLd+e09XQ==
X-Received: by 2002:a05:6402:329:b0:457:34d5:cc13 with SMTP id q9-20020a056402032900b0045734d5cc13mr5290756edw.141.1664355545010;
        Wed, 28 Sep 2022 01:59:05 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id n15-20020aa7db4f000000b00457d3bec44csm1748921edt.0.2022.09.28.01.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 01:59:04 -0700 (PDT)
Date: Wed, 28 Sep 2022 10:59:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] RISC-V: KVM: Record number of signal exits as a
 vCPU stat
Message-ID: <20220928085903.3b6nyyuphpeggsju@kamzik>
References: <20220925162400.1606-1-jszhang@kernel.org>
 <20220925162400.1606-2-jszhang@kernel.org>
 <CAJF2gTRSb4f9rF_sTZ2hr9iOnvLYcQYu3CN7q8PCZQg4HvC_Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRSb4f9rF_sTZ2hr9iOnvLYcQYu3CN7q8PCZQg4HvC_Gg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_015909_252947_20B4BB48 
X-CRM114-Status: GOOD (  20.16  )
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

T24gV2VkLCBTZXAgMjgsIDIwMjIgYXQgMDE6MTg6MDFQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gCj4g4p6cICBsaW51
eCBnaXQ6KG1hc3RlcikgZ3JlcCBzaWduYWxfZXhpdHMgYXJjaC9hcm02NCAtcgo+IGFyY2gvYXJt
NjQva3ZtL2d1ZXN0LmM6IFNUQVRTX0RFU0NfQ09VTlRFUihWQ1BVLCBzaWduYWxfZXhpdHMpLAo+
IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20va3ZtX2hvc3QuaDogICAgICB1NjQgc2lnbmFsX2V4aXRz
Owo+IAo+IEJ5IHRoZSB3YXksIGRvIHlvdSBrbm93IHdoeSBhcm02NCBpcyBkZWZpbmVkLCBidXQg
bm90IHVzZWQ/CgpJdCBpcy4gYXJtNjQgdXNlcyBnZW5lcmljIHhmZXIgdG8gZ3Vlc3QgbW9kZSB3
b3JrLCBsaWtlIHRoaXMgc2VyaWVzCmludHJvZHVjZXMgZm9yIHJpc2N2LgoKVGhhbmtzLApkcmV3
Cgo+IAo+IAo+IE9uIE1vbiwgU2VwIDI2LCAyMDIyIGF0IDEyOjMzIEFNIEppc2hlbmcgWmhhbmcg
PGpzemhhbmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gUmVjb3JkIGEgc3RhdGlzdGljIGlu
ZGljYXRpbmcgdGhlIG51bWJlciBvZiB0aW1lcyBhIHZDUFUgaGFzIGV4aXRlZAo+ID4gZHVlIHRv
IGEgcGVuZGluZyBzaWduYWwuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8
anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1faG9zdC5oIHwgMSArCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgIHwg
MiArKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20va3ZtX2hvc3QuaAo+ID4gaW5kZXggNjBjNTE3ZTRkNTc2Li5kYmJmNDNkNTI2MjMg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiA+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ID4gQEAgLTY3LDYgKzY3LDcg
QEAgc3RydWN0IGt2bV92Y3B1X3N0YXQgewo+ID4gICAgICAgICB1NjQgbW1pb19leGl0X2tlcm5l
bDsKPiA+ICAgICAgICAgdTY0IGNzcl9leGl0X3VzZXI7Cj4gPiAgICAgICAgIHU2NCBjc3JfZXhp
dF9rZXJuZWw7Cj4gPiArICAgICAgIHU2NCBzaWduYWxfZXhpdHM7Cj4gPiAgICAgICAgIHU2NCBl
eGl0czsKPiA+ICB9Owo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMg
Yi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiA+IGluZGV4IGQwZjA4ZDViNDI4Mi4uM2RhNDU5ZmVk
YzI4IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1LmMKPiA+IEBAIC0yOCw2ICsyOCw3IEBAIGNvbnN0IHN0cnVjdCBfa3Zt
X3N0YXRzX2Rlc2Mga3ZtX3ZjcHVfc3RhdHNfZGVzY1tdID0gewo+ID4gICAgICAgICBTVEFUU19E
RVNDX0NPVU5URVIoVkNQVSwgbW1pb19leGl0X2tlcm5lbCksCj4gPiAgICAgICAgIFNUQVRTX0RF
U0NfQ09VTlRFUihWQ1BVLCBjc3JfZXhpdF91c2VyKSwKPiA+ICAgICAgICAgU1RBVFNfREVTQ19D
T1VOVEVSKFZDUFUsIGNzcl9leGl0X2tlcm5lbCksCj4gPiArICAgICAgIFNUQVRTX0RFU0NfQ09V
TlRFUihWQ1BVLCBzaWduYWxfZXhpdHMpLAo+ID4gICAgICAgICBTVEFUU19ERVNDX0NPVU5URVIo
VkNQVSwgZXhpdHMpCj4gPiAgfTsKPiA+Cj4gPiBAQCAtOTczLDYgKzk3NCw3IEBAIGludCBrdm1f
YXJjaF92Y3B1X2lvY3RsX3J1bihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gPiAgICAgICAgICAg
ICAgICAgaWYgKHNpZ25hbF9wZW5kaW5nKGN1cnJlbnQpKSB7Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICByZXQgPSAtRUlOVFI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBydW4tPmV4
aXRfcmVhc29uID0gS1ZNX0VYSVRfSU5UUjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICsr
dmNwdS0+c3RhdC5zaWduYWxfZXhpdHM7Cj4gPiAgICAgICAgICAgICAgICAgfQo+ID4KPiA+ICAg
ICAgICAgICAgICAgICAvKgo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPiAKPiAKPiAtLQo+IEJlc3Qg
UmVnYXJkcwo+ICBHdW8gUmVuCj4gCj4gLS0gCj4ga3ZtLXJpc2N2IG1haWxpbmcgbGlzdAo+IGt2
bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
