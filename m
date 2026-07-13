Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2B5C44501
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:Mime-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MNhKuiU8jYytn6To4I8vEeQA7HK8PWw5T4nU74VHpsg=; b=YAZki6gEUzdXb34ojLUBeiYq9n
	LsbmyLKUrdtZk7Nj2G8T8URxUhiN3fneUWktEkKXJtTFtYLd4NhZ36o/p1gxJqiB48qEC7QW3vtXn
	5vgiPRceyNNUW0F/5J7SDJ7m39cr/ripLjSfw21FNwa/FUgj7KW3jdHJKmGI3Omv8IvuSNed44Mrk
	Xv39GVvJJkY5lUYoXSdnb7gIxIa3DJyrLvTipHNKHyXa+TtRRaGlY9LgK8fAkVohBTvTyDOmYdQuB
	/LQcUdxxPqGUgHsH6FgrE9EES71frGHD38+2qGHRBNwWS3OPx9RGvDlJyv6pG+aynyxZ1jxQzI9b4
	xP5zjpPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBxy-00000008ZXu-1Esi;
	Mon, 13 Jul 2026 08:24:42 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBxw-00000008ZXD-1JGc
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 08:24:41 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-39d560a1dd4so11967081fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 01:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783931077; cv=none;
        d=google.com; s=arc-20260327;
        b=owtvBNkOgADFF5BZttRQtdLc/VCDHp8mKLwSDM+VP5o7uVjENKjAfzzgR3oQuZa9Ss
         in3gG3uHYWwrnRUA66PJPhKWuGhBzcG95wopDpHGF5YWlvN/e0sk26J6m79/QlCSmMr7
         36Nb4+RjqyPvVGnR3gvLprpvYy+sEk1rF4TZ3XP97O0JXI2VRHVbaafeZ1r+0i26I9tL
         zDF4bjZhm7GU7Dttc3zofiMADLPrbO+q2RLBgV7mw7U27abOv+YPi8jdSBbjf5IRwRsd
         4nYXdQVDh/+LmTnQCpXWaaodujrOzvuU3sBnLVrAkz+2i0rlqRjo7wijG8mbj58AypiE
         84fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :references:mime-version:in-reply-to:from:dkim-signature;
        bh=rw64d6fpmrwwgrKtd9NfBoVHViSe69VHc1+TSY5ZOZA=;
        fh=wPT4RR66q19++ABrO1rITsdyMqehquvaWfkwAKKlApI=;
        b=MF3dwBCWUJWV+aeQGmUfGbQUx4zPhxTYGjmELFX8huwNoXP6vX2xnxw8+QfPuxtx4k
         WrAwPu4hriz13MJSzs6otFmL6Ih6HyZDS3bAk+s+TdA8s2/YjXxK7IBcUOeZZd5CvJlC
         p4nQSIFPDWtp/f98dDDS5UU9qTLRj4qNFGpfFB5BCXtuss9BzNO69r04IUqDdCXcUApi
         gqGqceNBV/tt5IiG9M3SWz8453cDMyGeASThOgq9ML6kgy/S+KmUlueZrI7RySNypZ4U
         3PtMKhXSEDQO/1ug4P4PNnrvRyVJEd3pQrKpbJzhiZdvacQNLvIFfYR03tZ3Lf0Pg+b8
         jMEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783931077; x=1784535877; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:user-agent:references:mime-version:in-reply-to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rw64d6fpmrwwgrKtd9NfBoVHViSe69VHc1+TSY5ZOZA=;
        b=QP9xjPjpH2AI5UiW3hUY7XVCOUrxyVqc4oChP9Mlb8VjWXBxVT/J6pCOM0flZHpAVI
         IsoI7vAroj4RzHZpU4Nb9TwELDuk6zU1d+Dv+0YDFQEcDSRscbxSAg+dY0JC8zziM/xK
         4RCaAWnMzq4lEQLSsVGnQTvicnQFwX+SHL9pOFheVbeMwA9n746o5DxZKarQJQr/VeGM
         YRpfh5aGfVHNM6Rdu2stwtOtn3i50Xaaahv6TV3UPTKxE1r1QL3S/PP2/+19R5S/j0q+
         rM/tl0urNdPQKt0lvmhU80XtqqgWZS7Q9vYctCfVeX8jQ0FC5Mjx0YSsmErlaW0saaVn
         NY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931077; x=1784535877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:user-agent:references:mime-version:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rw64d6fpmrwwgrKtd9NfBoVHViSe69VHc1+TSY5ZOZA=;
        b=iuieYrF5EPXCRbY4FMnVun33OkL0SUCG8Bria595dAwovHZWHfE+ctDBzDpi5i5LuB
         o02/VQ/jb2K9JCO8UPloBflt1SZy1QfIR/dF5zZQmxtybudxb8/JuUvbsSZECvdJLKaa
         NMdTOuz7WaPCxZXOEGJtJS7yYX+NNVvbQObfQMJXhgA+dhlc2PceLRm/dX0Ccujim9hx
         TDQe0HXqqpT/09kbt7kj/Qn7m6oU0widemx+rnasznO0E/3TlKpY7wh3RjlfHhz6GMA0
         cxjirhvfmwkw4n8nDpL6A27dZMvNS1VMQZx+xiPSc++Lh8yAqUlEdwUiZBHbr8dzqXnl
         Qf6w==
X-Forwarded-Encrypted: i=1; AHgh+Rotn9YSJYHiHcRpBlSkkfA3jPPD+HTAFf026V+xyxutnnRilO/3D1wyhXjo8d2BiR8UdpIjXtDq37XzTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPusz9K3GQygqX4k7RvYFps6QX4fWD6rLEw/oRvyoIojVX+rVj
	+/R2+mgtoBSXkQAUqb9ivwbKWyW9q7oyTjdyvsNlkByWZMrezUqZok0Y9Ps0TwZRXR9oSwW9ZCo
	Vp18rFmMNq3y7hpN/untEgeE57njEsOVuN9s9HCCyKw==
X-Gm-Gg: AfdE7cnnYodWIkvgpjDChj0E9Go+GgVEn+LL1oLIy9T6SgSdHhFLWY52pgrjKy6GMBb
	QaTmWWOlP31Nu1BVQvFPXcowr0fmBJ+kO66sz2PN5q8+8lBh8+vA6AjTOoNlOrCdq98ZbGOKSVi
	n/U9D7qWfdlz807BptdsWFb6FZYTl9ZA31py13TfrvH367vVhaRcnSDMWfw+Un9iZJhDNOfLFVV
	I2b0NCL9Z4oaIANzwmzQRARvAHP499NH2QqrdnwxkijyQxMF+qgfrBEFZhH5Ez7xs1NICVRB6z7
	eneMOA==
X-Received: by 2002:ac2:5933:0:b0:5b0:cce:da00 with SMTP id
 2adb3069b0e04-5b023568b5dmr1139987e87.1.1783931077230; Mon, 13 Jul 2026
 01:24:37 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 13 Jul 2026 01:24:36 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 13 Jul 2026 01:24:36 -0700
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <CAJF2gTSFX87LTXbAB=Qzy33xTVuaFQdR3jxh96ZdOhehfy-=AQ@mail.gmail.com>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Mime-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260713060902.15161-1-zhangzhanpeng.jasper@bytedance.com> <CAJF2gTSFX87LTXbAB=Qzy33xTVuaFQdR3jxh96ZdOhehfy-=AQ@mail.gmail.com>
User-Agent: Mozilla Thunderbird
Date: Mon, 13 Jul 2026 01:24:36 -0700
X-Gm-Features: AUfX_mzZvU7oa1oZHbOWG75hXLtmVhHOW5g3WnTef66HzvZC6b2_d2Iu5DRMHDw
Message-ID: <CACnXVncuXtGNqv7NABFRcFQWwK7eyMSz=GQd6joVmskQ-fDLrg@mail.gmail.com>
Subject: Re: Re: [PATCH v2] iommu/riscv: Use 32-bit MMIO accesses for 64-bit registers
To: Guo Ren <guoren@kernel.org>
Cc: Tomasz Jeznach <tomasz.jeznach@linux.dev>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Laight <david.laight.linux@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Zong Li <zong.li@sifive.com>, cuiyunhui@bytedance.com, 
	yuanzhu@bytedance.com, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_012440_401313_2AC6D43C 
X-CRM114-Status: GOOD (  16.78  )
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

SGkgR3VvLAoKT24gNy8xMy8yNiAzOjAwIFBNLCBHdW8gUmVuIHdyb3RlOgo+IE9uIE1vbiwgSnVs
IDEzLCAyMDI2IGF0IDI6MDnigK9QTSBaaGFucGVuZyBaaGFuZwo+IDx6aGFuZ3poYW5wZW5nLmph
c3BlckBieXRlZGFuY2UuY29tPiB3cm90ZToKPj4KPj4gVGhlIFJJU0MtViBJT01NVSBzcGVjaWZp
Y2F0aW9uIFsxXSBwZXJtaXRzIDY0LWJpdCByZWdpc3RlcnMgdG8gYmUgYWNjZXNzZWQKPj4gdXNp
bmcgdHdvIDMyLWJpdCB0cmFuc2FjdGlvbnMsIGhpZ2ggaGFsZiBmaXJzdCwgYW5kIGxlYXZlcyB0
aGUgc2luZ2xlLWNvcHkKPj4gYXRvbWljaXR5IG9mIDgtYnl0ZSBJT01NVSByZWdpc3RlciBhY2Nl
c3NlcyB1bnNwZWNpZmllZC4KPj4KPj4gVXNlIHRoZSBnZW5lcmljIGhpX2xvX3JlYWRxX3JlbGF4
ZWQoKSBhbmQgaGlfbG9fd3JpdGVxX3JlbGF4ZWQoKSBoZWxwZXJzCj4+IGZvciBvcmRpbmFyeSA2
NC1iaXQgSU9NTVUgcmVnaXN0ZXJzLiBQb2xsIEREVFAuQlVTWSBpbiB0aGUgbG93IGhhbGYgYmVm
b3JlCj4+IHJlYWRpbmcgdGhlIGZ1bGwgcmVnaXN0ZXIgZnJvbSBoaWdoIHRvIGxvdy4gSFBNIGNv
dW50ZXIgcmVhZHMgcmVxdWlyZSBhCj4+IHJvbGxvdmVyLWF3YXJlIHNlcXVlbmNlIGFuZCByZW1h
aW4gb3V0c2lkZSB0aGVzZSBhY2Nlc3NvcnMuCj4+Cj4+IFRoaXMgZm9sbG93cyB0aGUgMzItYml0
IGFjY2VzcyBkaXJlY3Rpb24gcHJvcG9zZWQgYnkgR3VvIFJlbiBbMl0gYW5kIHVzZXMKPj4gdGhl
IGdlbmVyaWMgbm9uLWF0b21pYyBNTUlPIGhlbHBlcnMgc3VnZ2VzdGVkIGJ5IERhdmlkIExhaWdo
dC4KPj4KPj4gWzFdIGh0dHBzOi8vZG9jcy5yaXNjdi5vcmcvcmVmZXJlbmNlL2lvbW11Lwo+PiBb
Ml0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDkwMzE0NDIxNy44Mzc0NDgtMS1ndW9y
ZW5Aa2VybmVsLm9yZwo+Pgo+PiBTdWdnZXN0ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPgo+PiBTdWdnZXN0ZWQtYnk6IERhdmlkIExhaWdodCA8ZGF2aWQubGFpZ2h0LmxpbnV4QGdt
YWlsLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWmhhbnBlbmcgWmhhbmcgPHpoYW5nemhhbnBlbmcu
amFzcGVyQGJ5dGVkYW5jZS5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIHYyOgo+PiAtIFJld29y
ayB0aGUgcGF0Y2ggYmFzZWQgb24gR3VvIFJlbidzIGVhcmxpZXIgcHJvcG9zYWwgWzFdLgo+PiAt
IERyb3AgdGhlIGJ1aWxkLXRpbWUgb3B0aW9uIGFuZCB1c2UgMzItYml0IGFjY2Vzc2VzIHVuY29u
ZGl0aW9uYWxseS4KPj4gLSBEcm9wIHRoZSBnbG9iYWwgbG9jayBhbmQgdXNlIHRoZSBnZW5lcmlj
IGhpZ2gtbG93IE1NSU8gaGVscGVycywgYXMKPj4gICAgc3VnZ2VzdGVkIGJ5IERhdmlkIExhaWdo
dC4KPj4gLSBQb2xsIEREVFAuQlVTWSB0aHJvdWdoIGl0cyBsb3cgaGFsZiBiZWZvcmUgcmVhZGlu
ZyB0aGUgZnVsbCByZWdpc3Rlci4KPj4KPj4gTGluayB0byB2MTogWzJdCj4+IFNwZWNpZmljYXRp
b24gZGlzY3Vzc2lvbjogWzNdCj4+Cj4+IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI1MDkwMzE0NDIxNy44Mzc0NDgtMS1ndW9yZW5Aa2VybmVsLm9yZwo+PiBbMl06IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNjA2MTUwNjQ4NTUuOTAzMTYtMS16aGFuZ3poYW5wZW5nLmph
c3BlckBieXRlZGFuY2UuY29tCj4+IFszXTogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1p
c2EvcmlzY3YtaW9tbXUvaXNzdWVzLzc2NQo+Pgo+PiAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9t
bXUuYyB8IDE4ICsrKysrKysrKysrLS0tLS0tLQo+PiAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9t
bXUuaCB8ICA5ICsrKy0tLS0tLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KSwgMTMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2
L2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPj4gaW5kZXggY2VjM2RkZDdh
YjEuLjE0YjU3MjA1OGVkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LmMKPj4gKysrIGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4+IEBAIC02NjgsMTIgKzY2
OCwxNiBAQCB2b2lkIHJpc2N2X2lvbW11X2Rpc2FibGUoc3RydWN0IHJpc2N2X2lvbW11X2Rldmlj
ZSAqaW9tbXUpCj4+ICAgICAgICAgIHJpc2N2X2lvbW11X3dyaXRlbChpb21tdSwgUklTQ1ZfSU9N
TVVfUkVHX1BRQ1NSLCAwKTsKPj4gICB9Cj4+Cj4+IC0jZGVmaW5lIHJpc2N2X2lvbW11X3JlYWRf
ZGR0cChpb21tdSkgKHsgXAo+PiAtICAgICAgIHU2NCBkZHRwOyBcCj4+IC0gICAgICAgcmlzY3Zf
aW9tbXVfcmVhZHFfdGltZW91dCgoaW9tbXUpLCBSSVNDVl9JT01NVV9SRUdfRERUUCwgZGR0cCwg
XAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIShkZHRwICYgUklTQ1ZfSU9N
TVVfRERUUF9CVVNZKSwgMTAsIFwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFJJU0NWX0lPTU1VX0REVFBfVElNRU9VVCk7IFwKPj4gLSAgICAgICBkZHRwOyB9KQo+PiArc3Rh
dGljIHU2NCByaXNjdl9pb21tdV9yZWFkX2RkdHAoc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAq
aW9tbXUpCj4+ICt7Cj4+ICsgICAgICAgdTMyIGRkdHBfbG87Cj4+ICsKPj4gKyAgICAgICByaXNj
dl9pb21tdV9yZWFkbF90aW1lb3V0KGlvbW11LCBSSVNDVl9JT01NVV9SRUdfRERUUCwgZGR0cF9s
bywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICEoZGR0cF9sbyAmIFJJU0NW
X0lPTU1VX0REVFBfQlVTWSksIDEwLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgUklTQ1ZfSU9NTVVfRERUUF9USU1FT1VUKTsKPj4gKwo+PiArICAgICAgIHJldHVybiByaXNj
dl9pb21tdV9yZWFkcShpb21tdSwgUklTQ1ZfSU9NTVVfUkVHX0REVFApOwo+IHJlYWRxPyBQbGVh
c2UgcmVmIFsxXToKPgo+ICNkZWZpbmUgcmlzY3ZfaW9tbXVfcmVhZF9kZHRwKGlvbW11KSAoeyBc
Cj4gICAgdTY0IGRkdHA7IFwKPiAtIHJpc2N2X2lvbW11X3JlYWRxX3RpbWVvdXQoKGlvbW11KSwg
UklTQ1ZfSU9NTVVfUkVHX0REVFAsIGRkdHAsIFwKPiAtICAhKGRkdHAgJiBSSVNDVl9JT01NVV9E
RFRQX0JVU1kpLCAxMCwgXAo+ICsgdTMyIGRkdHBfbG8sIGRkdHBfaGk7IFwKPiArIHJpc2N2X2lv
bW11X3JlYWRsX3RpbWVvdXQoKGlvbW11KSwgUklTQ1ZfSU9NTVVfUkVHX0REVFAsIGRkdHBfbG8s
IFwKPiArICAhKGRkdHBfbG8gJiBSSVNDVl9JT01NVV9ERFRQX0JVU1kpLCAxMCwgXAo+ICAgICBS
SVNDVl9JT01NVV9ERFRQX1RJTUVPVVQpOyBcCj4gKyBkZHRwX2hpID0gcmlzY3ZfaW9tbXVfcmVh
ZGwoaW9tbXUsIFJJU0NWX0lPTU1VX1JFR19ERFRQICsgNCk7IFwKPiArIGRkdHAgPSAoKHU2NClk
ZHRwX2hpIDw8IDMyKSB8IGRkdHBfbG87IFwKPiAgICBkZHRwOyB9KQo+Ck9vcHMsIHRoYW5rcyBm
b3IgY2F0Y2hpbmcgdGhhdCwgaXQgd2lsbCByZS1yZWFkIHRoZSBsb3cgMzIgYml0cy4gRERUUApt
dXN0IHJldGFpbiB0aGF0IHBvbGxlZCBsb3ctaGFsZiB2YWx1ZSwgcmVhZCBvbmx5IHRoZSBoaWdo
IGhhbGYsIGFuZAp0aGVuIGNvbXBvc2UgdGhlIHJlc3VsdC4KClRoZSBtYWNybyBvbmUgWzFdIGlz
IGNvcnJlY3QsIEkndmUgZml4ZWQgaXQgaW4gdjMuCgo+Cj4+ICt9Cj4+Cj4+ICAgc3RhdGljIGlu
dCByaXNjdl9pb21tdV9pb2Rpcl9hbGxvYyhzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21t
dSkKPj4gICB7Cj4+IEBAIC0xNTAxLDcgKzE1MDUsNyBAQCBzdGF0aWMgaW50IHJpc2N2X2lvbW11
X2luaXRfY2hlY2soc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUpCj4+ICAgICAgICAg
ICAqIHJlZ3VsYXIgYm9vdCBmbG93IGFuZCBkaXNhYmxlIHRyYW5zbGF0aW9uIHdoZW4gd2UgYm9v
dCBpbnRvIGEga2V4ZWMKPj4gICAgICAgICAgICoga2VybmVsIGFuZCB0aGUgcHJldmlvdXMga2Vy
bmVsIGxlZnQgdGhlbSBlbmFibGVkLgo+PiAgICAgICAgICAgKi8KPj4gLSAgICAgICBkZHRwID0g
cmlzY3ZfaW9tbXVfcmVhZHEoaW9tbXUsIFJJU0NWX0lPTU1VX1JFR19ERFRQKTsKPj4gKyAgICAg
ICBkZHRwID0gcmlzY3ZfaW9tbXVfcmVhZF9kZHRwKGlvbW11KTsKPj4gICAgICAgICAgaWYgKGRk
dHAgJiBSSVNDVl9JT01NVV9ERFRQX0JVU1kpCj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
QlVTWTsKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuaCBiL2Ry
aXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuaAo+PiBpbmRleCA0NmRmNzlkZDU0OS4uMWIwMzc5MGZi
ZTEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuaAo+PiArKysgYi9k
cml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmgKPj4gQEAgLTExLDYgKzExLDcgQEAKPj4gICAjaWZu
ZGVmIF9SSVNDVl9JT01NVV9IXwo+PiAgICNkZWZpbmUgX1JJU0NWX0lPTU1VX0hfCj4+Cj4+ICsj
aW5jbHVkZSA8bGludXgvaW8tNjQtbm9uYXRvbWljLWhpLWxvLmg+Cj4+ICAgI2luY2x1ZGUgPGxp
bnV4L2lvbW11Lmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4+ICAgI2luY2x1ZGUg
PGxpbnV4L2lvcG9sbC5oPgo+PiBAQCAtNzAsMTcgKzcxLDEzIEBAIHZvaWQgcmlzY3ZfaW9tbXVf
ZGlzYWJsZShzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSk7Cj4+ICAgICAgICAgIHJl
YWRsX3JlbGF4ZWQoKGlvbW11KS0+cmVnICsgKGFkZHIpKQo+Pgo+PiAgICNkZWZpbmUgcmlzY3Zf
aW9tbXVfcmVhZHEoaW9tbXUsIGFkZHIpIFwKPj4gLSAgICAgICByZWFkcV9yZWxheGVkKChpb21t
dSktPnJlZyArIChhZGRyKSkKPj4gKyAgICAgICBoaV9sb19yZWFkcV9yZWxheGVkKChpb21tdSkt
PnJlZyArIChhZGRyKSkKPj4KPj4gICAjZGVmaW5lIHJpc2N2X2lvbW11X3dyaXRlbChpb21tdSwg
YWRkciwgdmFsKSBcCj4+ICAgICAgICAgIHdyaXRlbF9yZWxheGVkKCh2YWwpLCAoaW9tbXUpLT5y
ZWcgKyAoYWRkcikpCj4+Cj4+ICAgI2RlZmluZSByaXNjdl9pb21tdV93cml0ZXEoaW9tbXUsIGFk
ZHIsIHZhbCkgXAo+PiAtICAgICAgIHdyaXRlcV9yZWxheGVkKCh2YWwpLCAoaW9tbXUpLT5yZWcg
KyAoYWRkcikpCj4+IC0KPj4gLSNkZWZpbmUgcmlzY3ZfaW9tbXVfcmVhZHFfdGltZW91dChpb21t
dSwgYWRkciwgdmFsLCBjb25kLCBkZWxheV91cywgdGltZW91dF91cykgXAo+PiAtICAgICAgIHJl
YWR4X3BvbGxfdGltZW91dChyZWFkcV9yZWxheGVkLCAoaW9tbXUpLT5yZWcgKyAoYWRkciksIHZh
bCwgY29uZCwgXAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICBkZWxheV91cywgdGltZW91
dF91cykKPj4gKyAgICAgICBoaV9sb193cml0ZXFfcmVsYXhlZCgodmFsKSwgKGlvbW11KS0+cmVn
ICsgKGFkZHIpKQo+Pgo+PiAgICNkZWZpbmUgcmlzY3ZfaW9tbXVfcmVhZGxfdGltZW91dChpb21t
dSwgYWRkciwgdmFsLCBjb25kLCBkZWxheV91cywgdGltZW91dF91cykgXAo+PiAgICAgICAgICBy
ZWFkeF9wb2xsX3RpbWVvdXQocmVhZGxfcmVsYXhlZCwgKGlvbW11KS0+cmVnICsgKGFkZHIpLCB2
YWwsIGNvbmQsIFwKPj4gLS0KPj4gMi41MC4xIChBcHBsZSBHaXQtMTU1KQo+Cj4KPgpUaGFua3Ms
ClpoYW5wZW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
