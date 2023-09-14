Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BC5EDE98C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 07:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wyz1pIAO4ysYw/uGRSWjpQKnISPOZbj7X+hYZ5OQbtw=; b=gJ+lvT36U7jd59
	zFuUyA/Tl6sbD7WCO4rH6FyZPsVZvbmmEnP0tPWCpFIML1TUrFdaunWHUrj3FJruwnsKox2FScWFe
	2vRKTI7s1dOEOAlNa4etQ5x6AndTcRzh4vJP6CBR/rcUR1Snwu7uBuHbUsvfwzTNqPh8vHr0basvT
	eOXKC51LGIUGgeblHYQaJc//pLOn4Z1gRmkvDvUoHZBBup3WUxRO6lx5AFQr4mMGq6ncu2y3uIFMR
	K6eNDlzByLrlHFFyObGeoXt3Sp9LKxM7fewAEoTDmExQ8QZzG4a+QoUC298JQL1AM5uPj4fcZwFrp
	uSDAOQzUjGWpU9RsvXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qggpv-007baT-0c;
	Thu, 14 Sep 2023 07:32:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qggpr-007bZF-32
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 07:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694676742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zeXUZmzA2R78d6Tnnb+ykDeaJ41fYcPMQRTIom5IJuI=;
	b=cFb6vDL+ApN7noAzsa7WIFLy2qbIRvBWUfrDzh1FmYQrfOVDDpjedAII5vV6Lm5w1gxgCP
	qVm1Lwv2/hr4rBW3lPSuxcARMgOaSgJGEsunwBClS+zkkjrOicWjfxHzTtkC+PShKHo9pq
	zCkTvHDuxfueKey00mnDfP9gU3Pfq+s=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-G9SFMFwSOLujNRx3O380FQ-1; Thu, 14 Sep 2023 03:32:20 -0400
X-MC-Unique: G9SFMFwSOLujNRx3O380FQ-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6bdcdde1df9so916579a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 00:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694676740; x=1695281540;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zeXUZmzA2R78d6Tnnb+ykDeaJ41fYcPMQRTIom5IJuI=;
        b=I3X9Tv+e9fUmCyaxYuqSXYRMlncqRs0DUlOTmRmFrwBYWIPAJIqX1Eb/sAnQQQwGRZ
         LgakxvRH1mo9QjWGtUossDmcBYe0GVfvFRwOB2DFvTS9+rqcJwHqXXcDf5dx0VZroPGb
         RMhhh/rPQcn/GqR1hzOz3GWB15Kvv43ky1e0194PihjrNfe55cgbcu6I41Vw0uTJmPsC
         AwJSVG933qLmvz8TUWAF3+jw3SPpiRLbHqrpun4csA7rWEabEacXiAzS4pOKJldGSBoE
         R5seKslPxjg+U6by1nmRp4KFTZch9NG6+yDpSatBIOLo3jAOPXvJ+R0PG2RlTBgbJkbK
         /w+Q==
X-Gm-Message-State: AOJu0YyuciL/xGq088L+iGoBxsAOPqxYq2pjst6DrEZ1Xy6LNHVfiFql
	QvRVYedCtLqPUPFCvhI6KEkD4q1h3a01EKvc+otweLxoH408qtiP3OFLiQClI2dAoMmJYZfT7IH
	9IAKRWQLZQoWp3bG0oDTjVYwCApeh
X-Received: by 2002:a9d:7748:0:b0:6b7:6e07:4951 with SMTP id t8-20020a9d7748000000b006b76e074951mr5156982otl.25.1694676740038;
        Thu, 14 Sep 2023 00:32:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr6lIrxX3lHcIWXsLn8H+SAhlSeGClLIiE+FDMDpEhnhKKTf67DlStq8kfOI9KIS1JIF/G5A==
X-Received: by 2002:a9d:7748:0:b0:6b7:6e07:4951 with SMTP id t8-20020a9d7748000000b006b76e074951mr5156960otl.25.1694676739790;
        Thu, 14 Sep 2023 00:32:19 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id v25-20020a9d69d9000000b006b83a36c08bsm421777oto.53.2023.09.14.00.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 00:32:19 -0700 (PDT)
Date: Thu, 14 Sep 2023 04:32:08 -0300
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: Waiman Long <longman@redhat.com>, paul.walmsley@sifive.com,
	anup@brainfault.org, peterz@infradead.org, mingo@redhat.com,
	will@kernel.org, palmer@rivosinc.com, boqun.feng@gmail.com,
	tglx@linutronix.de, paulmck@kernel.org, rostedt@goodmis.org,
	rdunlap@infradead.org, catalin.marinas@arm.com,
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com, alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 07/17] riscv: qspinlock: Introduce qspinlock param
 for command line
Message-ID: <ZQK2-CIL9U_QdMjh@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-8-guoren@kernel.org>
 <5ba0b8f3-f8f5-3a25-e9b7-f29a1abe654a@redhat.com>
 <CAJF2gTT2hRxgnQt+WJ9P0YBWnUaZJ1-9g3ZE9tOz_MiLSsUjwQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTT2hRxgnQt+WJ9P0YBWnUaZJ1-9g3ZE9tOz_MiLSsUjwQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_003224_049557_C3BFDB76 
X-CRM114-Status: GOOD (  24.57  )
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

T24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMDk6MDg6MzRBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBNb24sIFNlcCAxMSwgMjAyMyBhdCAxMTozNOKAr1BNIFdhaW1hbiBMb25nIDxsb25nbWFu
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDkvMTAvMjMgMDQ6MjksIGd1b3JlbkBrZXJu
ZWwub3JnIHdyb3RlOgo+ID4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5j
b20+Cj4gPiA+Cj4gPiA+IEFsbG93IGNtZGxpbmUgdG8gZm9yY2UgdGhlIGtlcm5lbCB0byB1c2Ug
cXVldWVkX3NwaW5sb2NrIHdoZW4KPiA+ID4gQ09ORklHX1JJU0NWX0NPTUJPX1NQSU5MT0NLUz15
Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+
ID4gPiAtLS0KPiA+ID4gICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0
ZXJzLnR4dCB8ICAyICsrCj4gPiA+ICAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyAgICAgICAg
ICAgICAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKystCj4gPiA+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCBiL0Rv
Y3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4gPiA+IGluZGV4
IDdkZmI1NDBjNGY2Yy4uNjFjYWNiOGRmZDBlIDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+ID4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+ID4gPiBAQCAtNDY5Myw2
ICs0NjkzLDggQEAKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIFtLTkxdIE51bWJlciBvZiBs
ZWdhY3kgcHR5J3MuIE92ZXJ3cml0ZXMgY29tcGlsZWQtaW4KPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgIGRlZmF1bHQgbnVtYmVyLgo+ID4gPgo+ID4gPiArICAgICBxc3BpbmxvY2sgICAgICAg
W1JJU0NWXSBGb3JjZSB0byB1c2UgcXNwaW5sb2NrIG9yIGF1dG8tZGV0ZWN0IHNwaW5sb2NrLgo+
ID4gPiArCj4gPiA+ICAgICAgIHFzcGlubG9jay5udW1hX3NwaW5sb2NrX3RocmVzaG9sZF9ucz0g
ICBbTlVNQSwgUFZfT1BTXQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgU2V0IHRoZSB0aW1l
IHRocmVzaG9sZCBpbiBuYW5vc2Vjb25kcyBmb3IgdGhlCj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBudW1iZXIgb2YgaW50cmEtbm9kZSBsb2NrIGhhbmQtb2ZmcyBiZWZvcmUgdGhlCj4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvc2V0dXAuYwo+ID4gPiBpbmRleCBhNDQ3Y2YzNjBhMTguLjBmMDg0ZjAzNzY1MSAxMDA2NDQK
PiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+ID4gPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9zZXR1cC5jCj4gPiA+IEBAIC0yNzAsNiArMjcwLDE1IEBAIHN0YXRpYyB2b2lk
IF9faW5pdCBwYXJzZV9kdGIodm9pZCkKPiA+ID4gICB9Cj4gPiA+Cj4gPiA+ICAgI2lmZGVmIENP
TkZJR19SSVNDVl9DT01CT19TUElOTE9DS1MKPiA+ID4gK2Jvb2wgZW5hYmxlX3FzcGlubG9ja19r
ZXkgPSBmYWxzZTsKPiA+Cj4gPiBZb3UgY2FuIHVzZSBfX3JvX2FmdGVyX2luaXQgcXVhbGlmaWVy
IGZvciBlbmFibGVfcXNwaW5sb2NrX2tleS4gQlRXLAo+ID4gdGhpcyBpcyBub3QgYSBzdGF0aWMg
a2V5LCBqdXN0IGEgc2ltcGxlIGZsYWcuIFNvIHdoYXQgaXMgdGhlIHBvaW50IG9mCj4gPiB0aGUg
X2tleSBzdWZmaXg/Cj4gT2theSwgSSB3b3VsZCBjaGFuZ2UgaXQgdG86Cj4gYm9vbCBlbmFibGVf
cXNwaW5sb2NrX2ZsYWcgX19yb19hZnRlcl9pbml0ID0gZmFsc2U7CgpJSVVDLCB0aGlzIGJvb2wg
LyBmbGFnIGlzIHVzZWQgaW4gYSBzaW5nbGUgZmlsZSwgc28gaXQgbWFrZXMgc2Vuc2UgZm9yIGl0
IAp0byBiZSBzdGF0aWMuIEJlaW5nIHN0YXRpYyBtZWFucyBpdCBkb2VzIG5vdCBuZWVkIHRvIGJl
IGluaXRpYWxpemVkIHRvIApmYWxzZSwgYXMgaXQncyBzdGFuZGFyZCB0byB6ZXJvLWZpbGwgdGhp
cyBhcmVhcy4KCkFsc28sIHNpbmNlIGl0J3MgYSBib29sLCBpdCBkb2VzIG5vdCBuZWVkIHRvIGJl
IGNhbGxlZCBfZmxhZy4KCkkgd291bGQgZ28gd2l0aDoKCnN0YXRpYyBib29sIGVuYWJsZV9xc3Bp
bmxvY2sgX19yb19hZnRlcl9pbml0OwoKCj4gCj4gPgo+ID4gQ2hlZXJzLAo+ID4gTG9uZ21hbgo+
ID4KPiAKPiAKPiAtLSAKPiBCZXN0IFJlZ2FyZHMKPiAgR3VvIFJlbgo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
