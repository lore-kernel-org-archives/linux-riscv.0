Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B14E9B36F
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHQDuovmJyRKIxBgXUgdxyVhU1iv3SRAI0oIWdRjyig=; b=ihHAo0OzcHXXI2
	wzyzFR3jy8/WTMLNvM/oHTC4rIOf6Y3eBGqC7X8eDaRUmiksuoRZAqe88PqOwKRn17rdy9BpvF4jR
	7cemNMt8B/fSwYRcxf2VHb24wIqFP0Rjj46llQ+Q5dXL/Od4AUWruroM7MfyagOvzHFpBXsf35T/I
	Qd17/STG3UoTGp5dFW/PZwhEB3T11+0e9a6Bei67m8ZBDuaXPDTnDkfuDDS+JkX6iczChCXVNr/y5
	QwQBtJT3tcNE3yVZiHX+9G3ZkjjnNVIkb/WoVveBF4fHUMvUcbsFqXQiD9iB1cxigpzz1R0EfatZr
	3wJL4qXjm7UbLoHpKogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2b9-0000000D0vU-2QxX;
	Mon, 02 Mar 2026 12:42:07 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2b7-0000000D0v1-1YJS
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 12:42:06 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-662f91bba0fso4426296eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 04:42:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772455324; cv=none;
        d=google.com; s=arc-20240605;
        b=UjC5xWjaON2z63r7NrzNJ1NJLa0m/n0UvJckyhsDwXMOVufIsjjUJ7T75qGfqC6x4f
         VjUqDNPkMAC2W64px0n0ysaeUJxX2NP+G+9p5X3wlCU+GeY4ap/jFKLrgRLrKVu+Hm2v
         6aeqixwbPRa5AfeCM91R/vpnES/jBw15pnc8RkaCsTUXNGrCd2Jnr8natpYkXGS15sND
         JzOZJFt4ZnepYr56YQiRZXFUs9y2X3t7jejJOFuMqPyRYc69aDrzP0XLSNhBxlSY0USQ
         1ZQkE/1ryvMWGIU1qBV7n81NsSG9q2MP1TYWgu02kN+bcUpMeLEkxz7E7wo8g+0Pi9i9
         rMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TqH8bjVKYuJk4mYqZYpIrfX37amSQklOJO7cCy6+3yA=;
        fh=JvHElQw8bK2QuFpwo4JqoE7iLaI1wKwjgZi8ES1wbCk=;
        b=KjN6kAFqCXhdJZTbbpejvj3Z0ls/YSr3BRrudwkWTcbdjD9YPVvVDIpLkq91ncCBrm
         ryT+152u6GduqOAWWuLD4sCnA0X3JkqXExWDKkL7EHg2BNac065rQ8RxnDNy9J3MIoE0
         CXNX/7873wMa9tVrNIAISMjPlX1NdgDuRaMfddjT2QKNRSNZ+kgaNAW/4bh5R3pWOZs1
         ODyBXhaWEGgbM9wbdFohXlfqxiOq2+iflhAk8Xe4CVdXuFm1feVED+pkkoJOpnw8ef8u
         gu4zd9dVS4XE6T/J1JmgHq2SvlKmvEG9UrvvjR08lnIVdugIJU7XCQPD9tUL50endgAq
         KGTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772455324; x=1773060124; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqH8bjVKYuJk4mYqZYpIrfX37amSQklOJO7cCy6+3yA=;
        b=Mw25Hh8gx+wNBAkIbL07H5dl5FMViOtVMjTpqWaIJXElULXvq31ciaFKFIqWxhbc8J
         MK3ZtHfhaqVudwEnbjad/nU0ZDlirk1RsnggfjhjYH0ndkkqVwL98QEARzSRegReBY+b
         G82/7cqYqTUoROlJP2DFCjoDrXsuR1c8u0Mn1GTUveWXHHj68vgh7JKiqJmimJVQJsUp
         oDAbqzeV4Bv4hc03MpVjd20CYWS4DMcJT+cSxDVDtQDNzbG8HnkuXIF46V7yCzjniKrp
         /2Dxn/kfC0/+XLKfare97QvgT8lmNZqyadT3pjMGrxXCSQvtjEr9ULRacaXtl+nMwDuO
         ZUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455324; x=1773060124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TqH8bjVKYuJk4mYqZYpIrfX37amSQklOJO7cCy6+3yA=;
        b=HHnfrmqfeglqQ1WeUTVIYoD72k+7TCe3GmcOQ3d2Q7SzyN5eokuuTHntZd+TO53ZjD
         ZW1xZHgYD4XpcX2cJShWEGgY8uKcHo2sI53GMv9tvOBNq0m/GfZRHN6LV3uzEvO+M7oI
         4M9DEDq87iefvBJxk3psIM9aysrycIJe9OuEr8yZ0LokIn2TBdYARI6Gu4DmqLd8Q4AV
         DKw4l/f6+yDOgOqgWbSPBCnjZk5FNihFMl9QbSTymrl8TtOC7RysF+MKb3xmhDyhvvTV
         +JI1GknKIAtFGWjrcmWE+UmUyXSYhcAtsUaR3x/LDPg1/y/v4Aq/bcEeGw+AffyyS2Ov
         7POw==
X-Forwarded-Encrypted: i=1; AJvYcCX1KS8hXN1KVF0XYz+nfbgTS/ruhK4ME/k2hvhBSOTykl2HnMcpOyzXLcOF1jNOdHdZQii9k4JsjKmncQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrs4E0PRLszRJKYGbLfihHOQNaBctC2rKZgGNTovFLUMbwENz+
	NOYPaXDOC9FmW+38uBsbwv0+BbNdju9GqJMqLSd70KcfEs5QgnJ8AEEFAwFFIrHkDADIXD8KD0d
	+QEgofUatBY7ZLkJvbkQupgkjyyDYXbV3sNFEkebGVQ==
X-Gm-Gg: ATEYQzzevscknBZEnZl7PEwNaw/r/N1JsBqx9UuJdY/WvMPzTx4A+eYVHeKwdiT8bqD
	R4Kh1yJ3Tky1ryndBwA0s11HDKNxESfxfiAan0lUhEjp52/pxDfjICokCAOBog0jSrTWNPdGA25
	bUo1r9ajGhGq9YIR8RD1sO7Gzdr17ZOnf+FhMRVLJkXdSFyUA0v/iuSO2QkIt7S/Uh+KzQR4e2n
	69gCFB5va/+H2N1mKCli7/pZgxsyuAdlfKX5Za+7yeKFE5hVb3+ycaTtobOpZj++h3tF5K0HXfd
	otQIsFp5FYv5hBMrIhNJ2h6DsaNfdNYYFTl2m2SrLKcauvAFVVbyaEVO9X4LIYxAFUPHBR7GeZ5
	WSumiOfM6VeMuFEfwV6+oFhjX5g==
X-Received: by 2002:a05:6820:1620:b0:676:da17:64d9 with SMTP id
 006d021491bc7-679f22e84f4mr8372171eaf.23.1772455323813; Mon, 02 Mar 2026
 04:42:03 -0800 (PST)
MIME-Version: 1.0
References: <20260302085312.1649738-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260302085312.1649738-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Mar 2026 18:11:50 +0530
X-Gm-Features: AaiRm509bQrteogflTnAc3RIlej5HAafhwmATthLgoCfptB4BOs28sm4hELHMqM
Message-ID: <CAAhSdy1sRgjRxfjpe7hRNwywUSZmsiErfwz6PoPRzPuTVkxTOQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix use-after-free in kvm_riscv_aia_aplic_has_attr()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atish.patra@linux.dev>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_044205_702148_C1A9E7E9 
X-CRM114-Status: GOOD (  18.09  )
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

T24gTW9uLCBNYXIgMiwgMjAyNiBhdCAyOjIz4oCvUE0gSmlha2FpIFh1IDx4dWppYWthaTIwMjVA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gRnV6emVyIHJlcG9ydHMgYSBLQVNBTiB1c2UtYWZ0ZXIt
ZnJlZSBidWcgdHJpZ2dlcmVkIGJ5IGEgcmFjZQo+IGJldHdlZW4gS1ZNX0hBU19ERVZJQ0VfQVRU
UiBhbmQgS1ZNX1NFVF9ERVZJQ0VfQVRUUiBpb2N0bHMgb24gdGhlIEFJQQo+IGRldmljZS4gVGhl
IHJvb3QgY2F1c2UgaXMgdGhhdCBhaWFfaGFzX2F0dHIoKSBpbnZva2VzCj4ga3ZtX3Jpc2N2X2Fp
YV9hcGxpY19oYXNfYXR0cigpIHdpdGhvdXQgaG9sZGluZyBkZXYtPmt2bS0+bG9jaywgd2hpbGUK
PiBhIGNvbmN1cnJlbnQgYWlhX3NldF9hdHRyKCkgbWF5IGNhbGwgYWlhX2luaXQoKSB1bmRlciB0
aGF0IGxvY2suIFdoZW4KPiBhaWFfaW5pdCgpIGZhaWxzIGFmdGVyIGt2bV9yaXNjdl9haWFfYXBs
aWNfaW5pdCgpIGhhcyBzdWNjZWVkZWQsIGl0Cj4gY2FsbHMga3ZtX3Jpc2N2X2FpYV9hcGxpY19j
bGVhbnVwKCkgaW4gaXRzIGZhaWxfY2xlYW51cF9pbXNpY3MgcGF0aCwKPiB3aGljaCBmcmVlcyBi
b3RoIGFwbGljX3N0YXRlIGFuZCBhcGxpY19zdGF0ZS0+aXJxcy4gVGhlIGNvbmN1cnJlbnQKPiBo
YXNfYXR0ciBwYXRoIGNhbiB0aGVuIGRlcmVmZXJlbmNlIHRoZSBmcmVlZCBhcGxpYy0+aXJxcyBp
bgo+IGFwbGljX3JlYWRfcGVuZGluZygpOgo+ICAgICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1tp
cnFdOyAgIC8qIFVBRiBoZXJlICovCj4KPiBLQVNBTiByZXBvcnQ6Cj4gIEJVRzogS0FTQU46IHNs
YWItdXNlLWFmdGVyLWZyZWUgaW4gYXBsaWNfcmVhZF9wZW5kaW5nCj4gICAgICAgICAgICAgIGFy
Y2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jOjExOSBbaW5saW5lXQo+ICBCVUc6IEtBU0FOOiBzbGFi
LXVzZS1hZnRlci1mcmVlIGluIGFwbGljX3JlYWRfcGVuZGluZ193b3JkCj4gICAgICAgICAgICAg
IGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jOjM1MSBbaW5saW5lXQo+ICBCVUc6IEtBU0FOOiBz
bGFiLXVzZS1hZnRlci1mcmVlIGluIGFwbGljX21taW9fcmVhZF9vZmZzZXQKPiAgICAgICAgICAg
ICAgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmM6NDA2Cj4gIFJlYWQgb2Ygc2l6ZSA4IGF0IGFk
ZHIgZmY2MDAwMDBiYTk2NWQ1OCBieSB0YXNrIDk0OTgKPiAgQ2FsbCBUcmFjZToKPiAgIGFwbGlj
X3JlYWRfcGVuZGluZyBhcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYzoxMTkgW2lubGluZV0KPiAg
IGFwbGljX3JlYWRfcGVuZGluZ193b3JkIGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jOjM1MSBb
aW5saW5lXQo+ICAgYXBsaWNfbW1pb19yZWFkX29mZnNldCBhcmNoL3Jpc2N2L2t2bS9haWFfYXBs
aWMuYzo0MDYKPiAgIGt2bV9yaXNjdl9haWFfYXBsaWNfaGFzX2F0dHIgYXJjaC9yaXNjdi9rdm0v
YWlhX2FwbGljLmM6NTY2Cj4gICBhaWFfaGFzX2F0dHIgYXJjaC9yaXNjdi9rdm0vYWlhX2Rldmlj
ZS5jOjQ2OQo+ICBhbGxvY2F0ZWQgYnkgdGFzayA5NDczOgo+ICAga3ZtX3Jpc2N2X2FpYV9hcGxp
Y19pbml0IGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jOjU4Mwo+ICAgYWlhX2luaXQgYXJjaC9y
aXNjdi9rdm0vYWlhX2RldmljZS5jOjI0OCBbaW5saW5lXQo+ICAgYWlhX3NldF9hdHRyIGFyY2gv
cmlzY3Yva3ZtL2FpYV9kZXZpY2UuYzozMzQKPiAgZnJlZWQgYnkgdGFzayA5NDczOgo+ICAga3Zt
X3Jpc2N2X2FpYV9hcGxpY19jbGVhbnVwIGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jOjY0NAo+
ICAgYWlhX2luaXQgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jOjI5MiBbaW5saW5lXQo+ICAg
YWlhX3NldF9hdHRyIGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYzozMzQKPgo+IEZpeCB0aGlz
IHJhY2UgYnkgYWNxdWlyaW5nIGRldi0+a3ZtLT5sb2NrIGluIGFpYV9oYXNfYXR0cigpIGJlZm9y
ZQo+IGNhbGxpbmcga3ZtX3Jpc2N2X2FpYV9hcGxpY19oYXNfYXR0cigpLCBjb25zaXN0ZW50IHdp
dGggdGhlIGxvY2tpbmcKPiBwYXR0ZXJuIHVzZWQgaW4gYWlhX2dldF9hdHRyKCkgYW5kIGFpYV9z
ZXRfYXR0cigpLgo+Cj4gRml4ZXM6IDI4OWEwMDdiOThiMDZkICgiUklTQy1WOiBLVk06IEV4cG9z
ZSBBUExJQyByZWdpc3RlcnMgYXMgYXR0cmlidXRlcyBvZiBBSUEgaXJxY2hpcCIpCj4gU2lnbmVk
LW9mZi1ieTogSmlha2FpIFh1IDxqaWFrYWlQZWFudXRAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlzY2FzLmFjLmNuPgo+IC0tLQo+IFYxIC0+IFYy
Ogo+IC0gRml4ZWQgdGhlIHJhY2UgYnkgYWRkaW5nIGxvY2tpbmcgaW4gYWlhX2hhc19hdHRyKCkg
aW5zdGVhZCBvZgo+ICAgaW50cm9kdWNpbmcgYSBuZXcgdmFsaWRhdGlvbiBmdW5jdGlvbiwgYXMg
c3VnZ2VzdGVkIGJ5IEFudXAgUGF0ZWwuCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZp
Y2UuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9k
ZXZpY2UuYwo+IGluZGV4IGIxOTVhOTNhZGQxY2UuLmVmOTQ0ZDcwOTdkMjkgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlh
X2RldmljZS5jCj4gQEAgLTQ2Niw3ICs0NjYsOSBAQCBzdGF0aWMgaW50IGFpYV9oYXNfYXR0cihz
dHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCBzdHJ1Y3Qga3ZtX2RldmljZV9hdHRyICphdHRyKQo+ICAg
ICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBL
Vk1fREVWX1JJU0NWX0FJQV9HUlBfQVBMSUM6Cj4gKyAgICAgICAgICAgICAgIG11dGV4X2xvY2so
JmRldi0+a3ZtLT5sb2NrKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIGt2bV9yaXNjdl9haWFf
YXBsaWNfaGFzX2F0dHIoZGV2LT5rdm0sIGF0dHItPmF0dHIpOwo+ICsgICAgICAgICAgICAgICBt
dXRleF91bmxvY2soJmRldi0+a3ZtLT5sb2NrKTsKCk5lZWQgdG8gZG8gdGhlIGZvbGxvd2luZyBo
ZXJlOgoKICAgIG11dGV4X2xvY2soJmRldi0+a3ZtLT5sb2NrKTsKICAgIHJldCA9IGt2bV9yaXNj
dl9haWFfYXBsaWNfaGFzX2F0dHIoZGV2LT5rdm0sIGF0dHItPmF0dHIpOwogICAgbXV0ZXhfdW5s
b2NrKCZkZXYtPmt2bS0+bG9jayk7CiAgICByZXR1cm4gcmV0OwoKUmVnYXJkcywKQW51cAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
