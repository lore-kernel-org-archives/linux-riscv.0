Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FBCC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 03:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IesfQD1zN5GFZFHV8aQIQmPv0n2fSHjW6vKEJvCfAA=; b=M2guFdOCUaCXwR
	Uy3oNlxS6UJ0Sr0zTc5sGimUri5zIA/20vwKlnoPaCvtExRix02P0go4YmwR7M13dQ6ZGSuLNdBZU
	HR0s4H+xRzVUjUXOpDZ0o7uGyu5o/tmnoQuw1rMI8PDQj4lOTexwaEd0focIwTzsCKM7Wm9o17HEb
	+TfhY0pVyJbvZTaAEkEbqKviGgMNd5QYzTDJ7cuIblGjtm3laHlbRAOJbjkUtIPxGX9vjKATZEjYQ
	qShzfpq7WjdN6hxgFIuXKyuA6dZmSnrSAYm6eYx9UE9Vx/cJLEIw5sQys27eY2TA1v+crCRz56cqW
	irTSrUZLfGwzol9W5eLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLEqs-00CmtV-0J;
	Thu, 04 Jan 2024 03:57:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLEqo-00Cmsq-13
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 03:56:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704340616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMN+pqeNMI7ZuFW+qE934BKBWaEBG3spDH3M6BLKSMk=;
	b=Ii4xHkKPc9ACJPxTFbgiocsvrRtqLvMBXbh0kb/ZmSHMQF1mTCnBVNSEHqLq5s8TfyZmOv
	J2RBm/lnqUwA0BxKfDfmbRbv/7XeSlGd3IVrQldowUI0dy1H3EK5iFFnpfSsTqmRLBW0WA
	+5OWqCTBCF9WFLF068j136GBlsf0Tfg=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-kXp_qdrvMOqG63tWopti1g-1; Wed, 03 Jan 2024 22:56:54 -0500
X-MC-Unique: kXp_qdrvMOqG63tWopti1g-1
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-59436f69e8cso153443eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 19:56:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704340614; x=1704945414;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YMN+pqeNMI7ZuFW+qE934BKBWaEBG3spDH3M6BLKSMk=;
        b=Vh1pB1j+HHhoBpJRbeuPvOoKrQsscIxsEQdzinjUesBfOJqVvEJWxDMqHhw9r789yG
         zcdV1DZgXRG4U+cdrlQUW6qI239804TmsfEg2BGPiRp6hPtx+0yui92uiJkmbI5PxKI9
         36T4xW+huLxUjICBkumhhDU3cmVmmULyOsaQFqZVC5fRoLvcYHXsx77u/zqV9vZv90P/
         enAidrTzn9cwo3PRXs8zm8qeopd5Fv/fc+rOs8uQ0FKjxrRX6uFjGw26b15iw2rTxCqK
         Mk916keZLEQM4kLr4xehWHnDqOAAZEHezM/84P+3ChBIw9O5elJ1tkpY2tqAvcdWBtGi
         YBpw==
X-Gm-Message-State: AOJu0Yw0VcCJlEvx1bNxrJ6soii4DGTTa6LgV0J6aNmt5Qk2aWEshYG3
	oU5iiixPRRklJ6rkvWgiNhKdm9peDWpZTNJSGlZx+UNU57AWZpd5lCXZ7n8yXhe/RaJK3AI6xUq
	3zSqhH5Jcs0J+Q9UFyHy2znYu40gUh+O9KBmd
X-Received: by 2002:a05:6358:e497:b0:175:524e:440d with SMTP id by23-20020a056358e49700b00175524e440dmr2948372rwb.57.1704340613946;
        Wed, 03 Jan 2024 19:56:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvUY09MTn5GToRw03eTFd2Z42WB1/U704H6N/ybGn6z8OeOBAp6ZdewL30cqW+xtKO4DZEgw==
X-Received: by 2002:a05:6358:e497:b0:175:524e:440d with SMTP id by23-20020a056358e49700b00175524e440dmr2948348rwb.57.1704340613566;
        Wed, 03 Jan 2024 19:56:53 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id nb5-20020a17090b35c500b0028bbf4c0264sm2558789pjb.10.2024.01.03.19.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 19:56:53 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH V2 3/3] riscv: xchg: Prefetch the destination word for sc.w
Date: Thu,  4 Jan 2024 00:56:39 -0300
Message-ID: <ZZYsdyKx8kmoDBGB@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTTpi5A+9KP5EyH9qhD_fwuZrWpx6zdCJyG+iv0Ez5q-gw@mail.gmail.com>
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-4-guoren@kernel.org> <20240102-81391283df04c430d76c0eb0@orel> <CAJF2gTQ7Oo8UKdPRs0GAAUsh9mDCgGucS8g8kuPzByaWVOtigw@mail.gmail.com> <ZZW5Y85OdibCu58h@LeoBras> <CAJF2gTTpi5A+9KP5EyH9qhD_fwuZrWpx6zdCJyG+iv0Ez5q-gw@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_195658_449618_C6AA4EC5 
X-CRM114-Status: GOOD (  37.55  )
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

T24gVGh1LCBKYW4gMDQsIDIwMjQgYXQgMDk6MjQ6NDBBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBUaHUsIEphbiA0LCAyMDI0IGF0IDM6NDXigK9BTSBMZW9uYXJkbyBCcmFzIDxsZW9icmFz
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgSmFuIDAzLCAyMDI0IGF0IDAyOjE1
OjQ1UE0gKzA4MDAsIEd1byBSZW4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSmFuIDIsIDIwMjQgYXQg
NzoxOeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+
ID4gPiA+Cj4gPiA+ID4gT24gU3VuLCBEZWMgMzEsIDIwMjMgYXQgMDM6Mjk6NTNBTSAtMDUwMCwg
Z3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+ID4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIGNvc3Qgb2YgY2hhbmdp
bmcgYSBjYWNoZWxpbmUgZnJvbSBzaGFyZWQgdG8gZXhjbHVzaXZlIHN0YXRlIGNhbiBiZQo+ID4g
PiA+ID4gc2lnbmlmaWNhbnQsIGVzcGVjaWFsbHkgd2hlbiB0aGlzIGlzIHRyaWdnZXJlZCBieSBh
biBleGNsdXNpdmUgc3RvcmUsCj4gPiA+ID4gPiBzaW5jZSBpdCBtYXkgcmVzdWx0IGluIGhhdmlu
ZyB0byByZXRyeSB0aGUgdHJhbnNhY3Rpb24uCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhpcyBwYXRj
aCBtYWtlcyB1c2Ugb2YgcHJlZmV0Y2gudyB0byBwcmVmZXRjaCBjYWNoZWxpbmVzIGZvciB3cml0
ZQo+ID4gPiA+ID4gcHJpb3IgdG8gbHIvc2MgbG9vcHMgd2hlbiB1c2luZyB0aGUgeGNoZ19zbWFs
bCBhdG9taWMgcm91dGluZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIHBhdGNoIGlzIGluc3Bp
cmVkIGJ5IGNvbW1pdDogMGVhMzY2ZjVlMWI2ICgiYXJtNjQ6IGF0b21pY3M6Cj4gPiA+ID4gPiBw
cmVmZXRjaCB0aGUgZGVzdGluYXRpb24gd29yZCBmb3Igd3JpdGUgcHJpb3IgdG8gc3R4ciIpLgo+
ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5h
bGliYWJhLmNvbT4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJu
ZWwub3JnPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
bXB4Y2hnLmggfCA0ICsrKy0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4
Y2hnLmgKPiA+ID4gPiA+IGluZGV4IDI2Y2VhMjM5NWFhZS4uZDdiOWQ3OTUxZjA4IDEwMDY0NAo+
ID4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiA+ID4gPiA+
ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oCj4gPiA+ID4gPiBAQCAtMTAs
NiArMTAsNyBAQAo+ID4gPiA+ID4KPiA+ID4gPiA+ICAjaW5jbHVkZSA8YXNtL2JhcnJpZXIuaD4K
PiA+ID4gPiA+ICAjaW5jbHVkZSA8YXNtL2ZlbmNlLmg+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPGFz
bS9wcm9jZXNzb3IuaD4KPiA+ID4gPiA+Cj4gPiA+ID4gPiAgI2RlZmluZSBfX2FyY2hfeGNoZ19t
YXNrZWQocHJlcGVuZCwgYXBwZW5kLCByLCBwLCBuKSAgICAgICAgICAgICAgICAgXAo+ID4gPiA+
Cj4gPiA+ID4gQXJlIHlvdSBzdXJlIHRoaXMgaXMgYmFzZWQgb24gdjYuNy1yYzc/IEJlY2F1c2Ug
SSBkb24ndCBzZWUgdGhpcyBtYWNyby4KPiA+ID4gT2gsIGl0IGlzIGJhc2VkIG9uIExlb2JyYXMn
IHBhdGNoZXMuIEkgd291bGQgcmVtb3ZlIGl0IGluIHRoZSBuZXh0IG9mIHZlcnNpb24uCj4gPgo+
ID4gSSB3b3VsZCBzYXkgdGhpcyBuZXh0IDopCj4gVGh4IGZvciB0aGUgZ3JhbW1hciBjb3JyZWN0
aW9uLgoKT2gsIEkgd2FzIG5vdCBpbnRlbmRpbmcgdG8gY29ycmVjdCBncmFtbWFyLgpJIGp1c3Qg
bWVhbnQgdGhlIG5leHQgdGhpbmcgSSB3b3VsZCBtZW50aW9uIGlzIHRoYXQgaXQgd2FzIGJhc2Vk
IG9uIHRvcCBvZiAKbXkgcGF0Y2hzZXQgaW5zdGVhZCBvZiB2Ni43LXJjNzoKCj4gCj4gPgo+ID4g
Pgo+ID4gPiA+Cj4gPiA+ID4gPiAgKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gQEAgLTIzLDYgKzI0
LDcgQEAKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiAgICAgICBfX2FzbV9fIF9f
dm9sYXRpbGVfXyAoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gPiA+ID4gICAgICAgICAgICAgIHByZXBlbmQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ICsgICAgICAgICAgICBQUkVGRVRDSFdf
QVNNKCU1KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4g
PiAgICAgICAgICAgICAgIjA6ICAgICAgbHIudyAlMCwgJTJcbiIgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gICAgICAgICAgICAgICIgICAgICAgIGFuZCAgJTEs
ICUwLCAlejRcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ICAgICAg
ICAgICAgICAiICAgICAgICBvciAgICUxLCAlMSwgJXozXG4iICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPiA+ID4gPiBAQCAtMzAsNyArMzIsNyBAQAo+ID4gPiA+ID4gICAgICAgICAg
ICAgICIgICAgICAgIGJuZXogJTEsIDBiXG4iICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+ID4gPiA+ICAgICAgICAgICAgICBhcHBlbmQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiAgICAgICAgICAgICAgOiAi
PSZyIiAoX19yZXR4KSwgIj0mciIgKF9fcmMpLCAiK0EiICgqKF9fcHRyMzJiKSkgICAgICAgXAo+
ID4gPiA+ID4gLSAgICAgICAgICAgIDogInJKIiAoX19uZXd4KSwgInJKIiAofl9fbWFzaykgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ICsgICAgICAgICAgICA6ICJySiIgKF9f
bmV3eCksICJySiIgKH5fX21hc2spLCAickoiIChfX3B0cjMyYikgICAgICAgICBcCj4gPiA+ID4K
PiA+ID4gPiBJJ20gcHJldHR5IHN1cmUgd2UgZG9uJ3Qgd2FudCB0byBhbGxvdyB0aGUgSiBjb25z
dHJhaW50IGZvciBfX3B0cjMyYi4KPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICAgICAgIDogIm1l
bW9yeSIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiAgICAgICByID0gKF9fdHlwZW9mX18oKihw
KSkpKChfX3JldHggJiBfX21hc2spID4+IF9fcyk7ICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4g
LS0KPiA+ID4gPiA+IDIuNDAuMQo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcywKPiA+
ID4gPiBkcmV3Cj4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IEJlc3QgUmVnYXJkcwo+
ID4gPiAgR3VvIFJlbgo+ID4gPgo+ID4KPiA+IE5pY2UgcGF0Y2ggOikKPiA+IEFueSByZWFzb24g
aXQncyBub3QgbmVlZGVkIGluIF9fYXJjaF9jbXB4Y2hnX21hc2tlZCgpLCBhbmQgX19hcmNoX2Nt
cHhjaGcoKSA/Cj4gQ0FTIGlzIGEgY29uZGl0aW9uYWwgQU1PLCB1bmxpa2UgeGNoZyAoU3RhbmQg
QU1PKS4gQXJtNjQgaXMgd3JvbmcsIG9yCj4gdGhleSBoYXZlIGEgcHJvYmxlbSB3aXRoIHRoZSBo
YXJkd2FyZS4KClNvcnJ5LCBJIHdhcyB1bmFibGUgdG8gZnVsbHkgdW5kZXJzdGFuZCB0aGUgcmVh
c29uIGhlcmUuCgpZb3Ugc3VnZ2VzdCB0aGF0IHRoZSBQUkVGRVRDSC5XIHdhcyBpbnNlcnRlZCBv
biB4Y2hnX21hc2tlZCBiZWNhdXNlIGl0IHdpbGwgCmFsd2F5cyBzd2l0Y2ggdGhlIHZhcmlhYmxl
IChubyBjb21wYXJlLCBibGluZCBDQVMpLCBidXQgbm90IG9uIGNtcHhjaGcuCgpJcyB0aGlzIGJl
Y2F1c2UgY21weGNoZyB3aWxsIGRlcGVuZCBvbiBhIGNvbXBhcmUsIGFuZCB0aHVzIGl0IGRvZXMg
bm90IApnYXJhbnRlZSBhIHdyaXRlPyBzbyBpdCB3b3VsZCBiZSB1bndpc2UgdG8gYWx3YXlzIHBy
ZWZldGNoIGNhY2hlbGluZSAKZXhjbHVzaXZlbmVzcyBmb3IgdGhpcyBjcHUsIHdoZXJlIHNoYXJl
ZCBzdGF0ZSB3b3VsZCBiZSBlbm91Z2guCklzIHRoYXQgY29ycmVjdD8gCgpUaGFua3MhCkxlbwoK
Cj4gCj4gPgo+ID4gVGhhbmtzIQo+ID4gTGVvCj4gPgo+IAo+IAo+IC0tIAo+IEJlc3QgUmVnYXJk
cwo+ICBHdW8gUmVuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
