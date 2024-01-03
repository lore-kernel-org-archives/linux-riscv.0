Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1971BC47073
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 19:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CTZeKBR1WYNqG6HxSNqmzEFPErSnOH79LLIcSQ4t+c=; b=ztrWP6iKcm0Aa5
	dvIYTx4M903/BMh7MgetPni83e0fYRnyMV7n4WkAXTtkH62f52g8SjQCub9KGHTd+ijtdjczXRTpf
	onDBY/Psk5910kaTqT2isn5jVPekBIscign3VrQA/PTutyCwNkHUUBOzqIHfbp+ksO7R7SUlU7Dfq
	EDqBSM+6E6Y57zeorcryBFILeYPYUN6Y+h5PbgRKiBK6s27tEHP9sWtzkbE8nLOrJBqBOVN7N+CrG
	LOcHF76Jx4+/36wnoy1Y11qbh9lLdaHmEcwJFxOrmHiT644B10/LxWitHK4dSxUDLMFTaLEQZ41xZ
	0nggDqat5yHkaFluwBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7Bp-00BwQC-1K;
	Wed, 03 Jan 2024 19:46:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL7Bj-00BwDM-18
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 19:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704311156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MN23VlrrOb22VS37aOVQIQ8RkupXeUp9J0UVd6x/4lk=;
	b=cWDNfOW2TBczlMX9CW2JZU1FjcujdQdK77v7pIOyFNOsGi0Oj+d8nDbpQlNkAgwbDkGQ+A
	yYhaMSNK2W0VBs7W8sRiQrUDWbq2YkfK/JWKueGn3V2vOENFB6kXAQyOXbOWpQKfVyupax
	ya+V5K/qaIshTJlO+A/jcUmbJhZj+e0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-MGxVhOI5NDOX0K3MIRK1vg-1; Wed, 03 Jan 2024 14:45:55 -0500
X-MC-Unique: MGxVhOI5NDOX0K3MIRK1vg-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1d4c36e9507so13348175ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 11:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704311154; x=1704915954;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MN23VlrrOb22VS37aOVQIQ8RkupXeUp9J0UVd6x/4lk=;
        b=CcCQvy+QlBQcLP5gvyujnt3QMA4lrjxHIC0YNPQ0REBQInuGk2jl94S6csbw521Qsu
         PzrFC1H6ESOXEiojJ2J+xk7jutQntXDKH4w23NW0qWu8udSAp09H1AcNjoMrmG7AJXOP
         eCVWvG+EIh133NNOg54z9/n49/qDbkjGv0LcCXtsiW/Cj4chP1861eWQH6HZar9Hw5p+
         Nhe8z/VU22Upl5xZr7ir62EeKVgWvwG6Rqgc6Rx/WA5QGCsDpHSsk05y+ym8mkS30xQk
         ly0ujHcG5OO5rj1jby0+K9MO0/31MPCL/VZTVb6SpJB5M98m47WiOskSedm5/fbXa13t
         DWRQ==
X-Gm-Message-State: AOJu0Yws7WJtwz4rMWpOKpX2CUMSO9Ti7VasJTtDQ7NPDZr/eIYUHP6J
	N83Hm5moaeX+CUdzvg1VxGVaVMdhdHitcakizQyToErsYHPOcZ6pK+9TV51wcLzPocVisKUoroG
	4ZnbyirGWkASwk41zT/Ela1gDHZNwjyq9F7Pi
X-Received: by 2002:a17:903:192:b0:1d4:2d8d:3537 with SMTP id z18-20020a170903019200b001d42d8d3537mr9435122plg.44.1704311154363;
        Wed, 03 Jan 2024 11:45:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVTkymOGkrkQkIBnXFJiY9sblp/xEmSwfRK0FgAp5VgnmrgNU5MGI6Jk37yHZKnSKxsdslrA==
X-Received: by 2002:a17:903:192:b0:1d4:2d8d:3537 with SMTP id z18-20020a170903019200b001d42d8d3537mr9435106plg.44.1704311154076;
        Wed, 03 Jan 2024 11:45:54 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id ju13-20020a170903428d00b001d4301325a6sm20735475plb.247.2024.01.03.11.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 11:45:53 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH V2 3/3] riscv: xchg: Prefetch the destination word for sc.w
Date: Wed,  3 Jan 2024 16:45:39 -0300
Message-ID: <ZZW5Y85OdibCu58h@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTQ7Oo8UKdPRs0GAAUsh9mDCgGucS8g8kuPzByaWVOtigw@mail.gmail.com>
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-4-guoren@kernel.org> <20240102-81391283df04c430d76c0eb0@orel> <CAJF2gTQ7Oo8UKdPRs0GAAUsh9mDCgGucS8g8kuPzByaWVOtigw@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_114603_468089_F67BEA65 
X-CRM114-Status: GOOD (  28.86  )
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
Cc: wefu@redhat.com, keescook@chromium.org, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, Leonardo Bras <leobras@redhat.com>, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Guo Ren <guoren@linux.alibaba.com>, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMDMsIDIwMjQgYXQgMDI6MTU6NDVQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBUdWUsIEphbiAyLCAyMDI0IGF0IDc6MTnigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBTdW4sIERlYyAzMSwgMjAyMyBhdCAw
MzoyOTo1M0FNIC0wNTAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+ID4gRnJvbTogR3Vv
IFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPgo+ID4gPiBUaGUgY29zdCBvZiBj
aGFuZ2luZyBhIGNhY2hlbGluZSBmcm9tIHNoYXJlZCB0byBleGNsdXNpdmUgc3RhdGUgY2FuIGJl
Cj4gPiA+IHNpZ25pZmljYW50LCBlc3BlY2lhbGx5IHdoZW4gdGhpcyBpcyB0cmlnZ2VyZWQgYnkg
YW4gZXhjbHVzaXZlIHN0b3JlLAo+ID4gPiBzaW5jZSBpdCBtYXkgcmVzdWx0IGluIGhhdmluZyB0
byByZXRyeSB0aGUgdHJhbnNhY3Rpb24uCj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggbWFrZXMgdXNl
IG9mIHByZWZldGNoLncgdG8gcHJlZmV0Y2ggY2FjaGVsaW5lcyBmb3Igd3JpdGUKPiA+ID4gcHJp
b3IgdG8gbHIvc2MgbG9vcHMgd2hlbiB1c2luZyB0aGUgeGNoZ19zbWFsbCBhdG9taWMgcm91dGlu
ZS4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaCBpcyBpbnNwaXJlZCBieSBjb21taXQ6IDBlYTM2NmY1
ZTFiNiAoImFybTY0OiBhdG9taWNzOgo+ID4gPiBwcmVmZXRjaCB0aGUgZGVzdGluYXRpb24gd29y
ZCBmb3Igd3JpdGUgcHJpb3IgdG8gc3R4ciIpLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1
byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY21weGNoZy5oIHwgNCArKystCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNo
Zy5oCj4gPiA+IGluZGV4IDI2Y2VhMjM5NWFhZS4uZDdiOWQ3OTUxZjA4IDEwMDY0NAo+ID4gPiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaAo+ID4gPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaAo+ID4gPiBAQCAtMTAsNiArMTAsNyBAQAo+ID4gPgo+
ID4gPiAgI2luY2x1ZGUgPGFzbS9iYXJyaWVyLmg+Cj4gPiA+ICAjaW5jbHVkZSA8YXNtL2ZlbmNl
Lmg+Cj4gPiA+ICsjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+ID4gPgo+ID4gPiAgI2RlZmlu
ZSBfX2FyY2hfeGNoZ19tYXNrZWQocHJlcGVuZCwgYXBwZW5kLCByLCBwLCBuKSAgICAgICAgICAg
ICAgICAgXAo+ID4KPiA+IEFyZSB5b3Ugc3VyZSB0aGlzIGlzIGJhc2VkIG9uIHY2LjctcmM3PyBC
ZWNhdXNlIEkgZG9uJ3Qgc2VlIHRoaXMgbWFjcm8uCj4gT2gsIGl0IGlzIGJhc2VkIG9uIExlb2Jy
YXMnIHBhdGNoZXMuIEkgd291bGQgcmVtb3ZlIGl0IGluIHRoZSBuZXh0IG9mIHZlcnNpb24uCgpJ
IHdvdWxkIHNheSB0aGlzIG5leHQgOikKCj4gCj4gPgo+ID4gPiAgKHsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
PiBAQCAtMjMsNiArMjQsNyBAQAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiAgICAgICBfX2Fz
bV9fIF9fdm9sYXRpbGVfXyAoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gPiAgICAgICAgICAgICAgcHJlcGVuZCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiArICAgICAgICAgICAgUFJFRkVUQ0hXX0FT
TSglNSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiAgICAg
ICAgICAgICAgIjA6ICAgICAgbHIudyAlMCwgJTJcbiIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ID4gPiAgICAgICAgICAgICAgIiAgICAgICAgYW5kICAlMSwgJTAsICV6NFxu
IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiAgICAgICAgICAgICAgIiAgICAg
ICAgb3IgICAlMSwgJTEsICV6M1xuIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
PiBAQCAtMzAsNyArMzIsNyBAQAo+ID4gPiAgICAgICAgICAgICAgIiAgICAgICAgYm5leiAlMSwg
MGJcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiAgICAgICAgICAg
ICAgYXBwZW5kICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gPiAgICAgICAgICAgICAgOiAiPSZyIiAoX19yZXR4KSwgIj0mciIgKF9fcmMpLCAi
K0EiICgqKF9fcHRyMzJiKSkgICAgICAgXAo+ID4gPiAtICAgICAgICAgICAgOiAickoiIChfX25l
d3gpLCAickoiICh+X19tYXNrKSAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiArICAg
ICAgICAgICAgOiAickoiIChfX25ld3gpLCAickoiICh+X19tYXNrKSwgInJKIiAoX19wdHIzMmIp
ICAgICAgICAgXAo+ID4KPiA+IEknbSBwcmV0dHkgc3VyZSB3ZSBkb24ndCB3YW50IHRvIGFsbG93
IHRoZSBKIGNvbnN0cmFpbnQgZm9yIF9fcHRyMzJiLgo+ID4KPiA+ID4gICAgICAgICAgICAgIDog
Im1lbW9yeSIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gICAgICAgciA9IChfX3R5cGVvZl9fKCoocCkpKSgo
X19yZXR4ICYgX19tYXNrKSA+PiBfX3MpOyAgICAgICAgICAgICAgIFwKPiA+ID4gLS0KPiA+ID4g
Mi40MC4xCj4gPiA+Cj4gPgo+ID4gVGhhbmtzLAo+ID4gZHJldwo+IAo+IAo+IAo+IC0tIAo+IEJl
c3QgUmVnYXJkcwo+ICBHdW8gUmVuCj4gCgpOaWNlIHBhdGNoIDopCkFueSByZWFzb24gaXQncyBu
b3QgbmVlZGVkIGluIF9fYXJjaF9jbXB4Y2hnX21hc2tlZCgpLCBhbmQgX19hcmNoX2NtcHhjaGco
KSA/CgpUaGFua3MhCkxlbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
