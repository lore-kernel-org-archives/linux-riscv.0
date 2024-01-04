Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920D4C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 14:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oQ7rnTDaildGGdjflycXo9fV+HWiUbhIjX7yKzo7Fg=; b=QJ/BESud3u+BgL
	w+MdnyN6E6gT1W4/Ce4GiwXxBrqfuFFnxO0AesufBA+HMVRHjOOsMnFdXRkHqb3wEtEufAvoddBET
	nKekPSeSWcvPxrIFbGniZNFyWqszkvgIhJdsLiE6Fd5yvSbuo4Mfvr7gP/rT4jkjIV1NffeeKWBOV
	I5AQW90E4lx4K8SbN4k+QTI74+eG75XIEnYJhQDnvK+zggahdC5xdqXKPsng2ddrg+2a8bYZcttVF
	0VjsvLBkHFhA2jHKDx7+B6zJ0DIQK7v8EcNSaGweh5VlYd/IkNC5KhU1dBhLXWOTf3G8h5x4FiVMV
	8OPcVH3q3Q2QBYrFY41w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLOXR-00EIw1-0R;
	Thu, 04 Jan 2024 14:17:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLOXN-00EItB-03
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 14:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704377849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V1UIyHlxDpmjDXM7x4EJy2xqSUJiPyiytLAbTr6bgp0=;
	b=VJtyqJQxLKtxBS2SVfYiCgfhjEJ9Cznaia0sPjN93ddnhV7uEtH54pnWuOv1d0lHGTNGxI
	uLRe/iqojPwEHSXEYYlHm5qtRPAzOgPVEMeMST7gmW9wKDiMpfsyCzwbgPnWaRlVUsx28H
	dZFHI1FD8G4NIjliEdw1YSPXN+PQkIk=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-TRCqfJlwPF2G7QQK5bn3dA-1; Thu, 04 Jan 2024 09:17:27 -0500
X-MC-Unique: TRCqfJlwPF2G7QQK5bn3dA-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-28bd843b040so402783a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 06:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704377846; x=1704982646;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1UIyHlxDpmjDXM7x4EJy2xqSUJiPyiytLAbTr6bgp0=;
        b=bnumuMSWI2XxP/Jc4RhFNQDBpIIPYGUIqgwbyhsAHT7o+pZ+sas3ZlcFUYuADMFarE
         hfIeDd2aw0Vtv2L/gdQ4kfiF2a6+Ppskw/rYQ+mmwnb0h1f9BCa5DXO0Cf+dX4KoJJ+2
         9SrT6NQwrTjSBSvJlFJiHRNjT+PTB4oOtX7g20NBGQN3TIcquaA6ycFgMt+MrgocPbze
         sNDOQCbMEXjvuLC9N40+yMqVu3KX2oEXHgUZHqfABeOSmNv1KfhsMetJa8U+lfZxS8XJ
         whoKkMoAwuctEc8yDYlT/NuDerjqbYVv6tD/3dDd/YAU4EUXKS9wugYNHMCw/QhB6ehb
         L0AQ==
X-Gm-Message-State: AOJu0YzISyr4WpLXChaEMBzvob/4ehw6NXeIdc4oyxngZC3G2LMDOb7/
	FqxhyiAb9K/dtZnYxrOM2OM+mSSzOeMQs4rLIOgVwmaTMVLYcVNusDcZU2HqH/SrlloIQ9bBnIX
	DxymzJuO64gqKaCa45s/pbotyw6mmGwLq5yWY
X-Received: by 2002:a17:90b:1281:b0:28c:137e:7a42 with SMTP id fw1-20020a17090b128100b0028c137e7a42mr506129pjb.2.1704377846121;
        Thu, 04 Jan 2024 06:17:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFhAuWGZ4F60Z7Iykwt9+suh/7YYZ8D8SvbeW+ZOfVpM5xAsWh6B+BCTKPnsJn6HjrKW5gQA==
X-Received: by 2002:a17:90b:1281:b0:28c:137e:7a42 with SMTP id fw1-20020a17090b128100b0028c137e7a42mr506116pjb.2.1704377845743;
        Thu, 04 Jan 2024 06:17:25 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:3b60:7b8a:588b:5256:ce57])
        by smtp.gmail.com with ESMTPSA id er14-20020a17090af6ce00b0028be4e9b0a5sm3728103pjb.28.2024.01.04.06.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 06:17:25 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH V2 3/3] riscv: xchg: Prefetch the destination word for sc.w
Date: Thu,  4 Jan 2024 11:17:12 -0300
Message-ID: <ZZa96DEQhYnnGi51@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTTT8QBEKtKOpriF=c8Y3g5MmM23MZxN7JCa65MbKeKNOQ@mail.gmail.com>
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-4-guoren@kernel.org> <20240102-81391283df04c430d76c0eb0@orel> <CAJF2gTQ7Oo8UKdPRs0GAAUsh9mDCgGucS8g8kuPzByaWVOtigw@mail.gmail.com> <ZZW5Y85OdibCu58h@LeoBras> <CAJF2gTTpi5A+9KP5EyH9qhD_fwuZrWpx6zdCJyG+iv0Ez5q-gw@mail.gmail.com> <ZZYsdyKx8kmoDBGB@LeoBras> <CAJF2gTTT8QBEKtKOpriF=c8Y3g5MmM23MZxN7JCa65MbKeKNOQ@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_061733_125840_73E0D6D2 
X-CRM114-Status: GOOD (  45.38  )
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

T24gVGh1LCBKYW4gMDQsIDIwMjQgYXQgMDQ6MTQ6MjdQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBUaHUsIEphbiA0LCAyMDI0IGF0IDExOjU24oCvQU0gTGVvbmFyZG8gQnJhcyA8bGVvYnJh
c0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEphbiAwNCwgMjAyNCBhdCAwOToy
NDo0MEFNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gPiBPbiBUaHUsIEphbiA0LCAyMDI0IGF0
IDM6NDXigK9BTSBMZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4g
PiA+Cj4gPiA+ID4gT24gV2VkLCBKYW4gMDMsIDIwMjQgYXQgMDI6MTU6NDVQTSArMDgwMCwgR3Vv
IFJlbiB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgSmFuIDIsIDIwMjQgYXQgNzoxOeKAr1BNIEFu
ZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBPbiBTdW4sIERlYyAzMSwgMjAyMyBhdCAwMzoyOTo1M0FNIC0wNTAwLCBndW9y
ZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+ID4gPiA+ID4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBUaGUgY29zdCBv
ZiBjaGFuZ2luZyBhIGNhY2hlbGluZSBmcm9tIHNoYXJlZCB0byBleGNsdXNpdmUgc3RhdGUgY2Fu
IGJlCj4gPiA+ID4gPiA+ID4gc2lnbmlmaWNhbnQsIGVzcGVjaWFsbHkgd2hlbiB0aGlzIGlzIHRy
aWdnZXJlZCBieSBhbiBleGNsdXNpdmUgc3RvcmUsCj4gPiA+ID4gPiA+ID4gc2luY2UgaXQgbWF5
IHJlc3VsdCBpbiBoYXZpbmcgdG8gcmV0cnkgdGhlIHRyYW5zYWN0aW9uLgo+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCBtYWtlcyB1c2Ugb2YgcHJlZmV0Y2gudyB0byBwcmVm
ZXRjaCBjYWNoZWxpbmVzIGZvciB3cml0ZQo+ID4gPiA+ID4gPiA+IHByaW9yIHRvIGxyL3NjIGxv
b3BzIHdoZW4gdXNpbmcgdGhlIHhjaGdfc21hbGwgYXRvbWljIHJvdXRpbmUuCj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGlzIGluc3BpcmVkIGJ5IGNvbW1pdDogMGVhMzY2
ZjVlMWI2ICgiYXJtNjQ6IGF0b21pY3M6Cj4gPiA+ID4gPiA+ID4gcHJlZmV0Y2ggdGhlIGRlc3Rp
bmF0aW9uIHdvcmQgZm9yIHdyaXRlIHByaW9yIHRvIHN0eHIiKS4KPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNv
bT4KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9y
Zz4KPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jbXB4Y2hnLmggfCA0ICsrKy0KPiA+ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiA+ID4gPiA+ID4gPiBpbmRleCAyNmNlYTIzOTVhYWUuLmQ3
YjlkNzk1MWYwOCAxMDA2NDQKPiA+ID4gPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2NtcHhjaGcuaAo+ID4gPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y21weGNoZy5oCj4gPiA+ID4gPiA+ID4gQEAgLTEwLDYgKzEwLDcgQEAKPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8YXNtL2JhcnJpZXIuaD4KPiA+ID4gPiA+ID4gPiAgI2lu
Y2x1ZGUgPGFzbS9mZW5jZS5oPgo+ID4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nv
ci5oPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gICNkZWZpbmUgX19hcmNoX3hjaGdfbWFz
a2VkKHByZXBlbmQsIGFwcGVuZCwgciwgcCwgbikgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gQXJlIHlvdSBzdXJlIHRoaXMgaXMgYmFzZWQgb24gdjYuNy1yYzc/IEJl
Y2F1c2UgSSBkb24ndCBzZWUgdGhpcyBtYWNyby4KPiA+ID4gPiA+IE9oLCBpdCBpcyBiYXNlZCBv
biBMZW9icmFzJyBwYXRjaGVzLiBJIHdvdWxkIHJlbW92ZSBpdCBpbiB0aGUgbmV4dCBvZiB2ZXJz
aW9uLgo+ID4gPiA+Cj4gPiA+ID4gSSB3b3VsZCBzYXkgdGhpcyBuZXh0IDopCj4gPiA+IFRoeCBm
b3IgdGhlIGdyYW1tYXIgY29ycmVjdGlvbi4KPiA+Cj4gPiBPaCwgSSB3YXMgbm90IGludGVuZGlu
ZyB0byBjb3JyZWN0IGdyYW1tYXIuCj4gPiBJIGp1c3QgbWVhbnQgdGhlIG5leHQgdGhpbmcgSSB3
b3VsZCBtZW50aW9uIGlzIHRoYXQgaXQgd2FzIGJhc2VkIG9uIHRvcCBvZgo+ID4gbXkgcGF0Y2hz
ZXQgaW5zdGVhZCBvZiB2Ni43LXJjNzoKPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4gPiBAQCAtMjMs
NiArMjQsNyBAQAo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiA+ID4gICAg
ICAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgcHJlcGVuZCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICBQUkVGRVRDSFdfQVNNKCU1KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICIwOiAgICAgIGxyLncgJTAs
ICUyXG4iICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4gPiAg
ICAgICAgICAgICAgIiAgICAgICAgYW5kICAlMSwgJTAsICV6NFxuIiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAiICAgICAgICBvciAgICUx
LCAlMSwgJXozXG4iICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiA+ID4g
QEAgLTMwLDcgKzMyLDcgQEAKPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgIiAgICAgICAgYm5l
eiAlMSwgMGJcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4g
PiA+ICAgICAgICAgICAgICBhcHBlbmQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgIDogIj0mciIgKF9f
cmV0eCksICI9JnIiIChfX3JjKSwgIitBIiAoKihfX3B0cjMyYikpICAgICAgIFwKPiA+ID4gPiA+
ID4gPiAtICAgICAgICAgICAgOiAickoiIChfX25ld3gpLCAickoiICh+X19tYXNrKSAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICA6ICJySiIgKF9f
bmV3eCksICJySiIgKH5fX21hc2spLCAickoiIChfX3B0cjMyYikgICAgICAgICBcCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IEknbSBwcmV0dHkgc3VyZSB3ZSBkb24ndCB3YW50IHRvIGFsbG93IHRo
ZSBKIGNvbnN0cmFpbnQgZm9yIF9fcHRyMzJiLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ICAg
ICAgICAgICAgICA6ICJtZW1vcnkiKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4gPiAg
ICAgICByID0gKF9fdHlwZW9mX18oKihwKSkpKChfX3JldHggJiBfX21hc2spID4+IF9fcyk7ICAg
ICAgICAgICAgICAgXAo+ID4gPiA+ID4gPiA+IC0tCj4gPiA+ID4gPiA+ID4gMi40MC4xCj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+ID4gPiBkcmV3
Cj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gQmVz
dCBSZWdhcmRzCj4gPiA+ID4gPiAgR3VvIFJlbgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IE5p
Y2UgcGF0Y2ggOikKPiA+ID4gPiBBbnkgcmVhc29uIGl0J3Mgbm90IG5lZWRlZCBpbiBfX2FyY2hf
Y21weGNoZ19tYXNrZWQoKSwgYW5kIF9fYXJjaF9jbXB4Y2hnKCkgPwo+ID4gPiBDQVMgaXMgYSBj
b25kaXRpb25hbCBBTU8sIHVubGlrZSB4Y2hnIChTdGFuZCBBTU8pLiBBcm02NCBpcyB3cm9uZywg
b3IKPiA+ID4gdGhleSBoYXZlIGEgcHJvYmxlbSB3aXRoIHRoZSBoYXJkd2FyZS4KPiA+Cj4gPiBT
b3JyeSwgSSB3YXMgdW5hYmxlIHRvIGZ1bGx5IHVuZGVyc3RhbmQgdGhlIHJlYXNvbiBoZXJlLgo+
ID4KPiA+IFlvdSBzdWdnZXN0IHRoYXQgdGhlIFBSRUZFVENILlcgd2FzIGluc2VydGVkIG9uIHhj
aGdfbWFza2VkIGJlY2F1c2UgaXQgd2lsbAo+ID4gYWx3YXlzIHN3aXRjaCB0aGUgdmFyaWFibGUg
KG5vIGNvbXBhcmUsIGJsaW5kIENBUyksIGJ1dCBub3Qgb24gY21weGNoZy4KPiA+Cj4gPiBJcyB0
aGlzIGJlY2F1c2UgY21weGNoZyB3aWxsIGRlcGVuZCBvbiBhIGNvbXBhcmUsIGFuZCB0aHVzIGl0
IGRvZXMgbm90Cj4gPiBnYXJhbnRlZSBhIHdyaXRlPyBzbyBpdCB3b3VsZCBiZSB1bndpc2UgdG8g
YWx3YXlzIHByZWZldGNoIGNhY2hlbGluZQo+IFllcywgaXQgaGFzIGEgY29tcGFyaXNvbiwgc28g
YSBzdG9yZSBtYXkgbm90IGV4aXN0IHRoZXJlLgo+IAo+ID4gZXhjbHVzaXZlbmVzcyBmb3IgdGhp
cyBjcHUsIHdoZXJlIHNoYXJlZCBzdGF0ZSB3b3VsZCBiZSBlbm91Z2guCj4gPiBJcyB0aGF0IGNv
cnJlY3Q/Cj4gWWVzLCBleGNsdXNpdmVuZXNzIHdvdWxkIGludmFsaWRhdGUgb3RoZXIgaGFydHMn
IGNhY2hlIGxpbmVzLgoKSSBzZWUuCgpJIHJlY2FsbCBhIHByZXZpb3VzIGRpc2N1c3Npb24gb24g
Y29tcHV0ZXIgYXJjaCB3aGljaCBzdGF0ZWQgdGhhdCBhbnkgTFIgCndvdWxkIHJlcXVpcmUgdG8g
Z2V0IGEgY2FjaGVsaW5lIGluIGV4Y2x1c2l2ZSBzdGF0ZSBmb3IgbHIvc2MgdG8gd29yaywgYnV0
Ckkgd2VudCB0aHJvdWdoIHRoZSBSSVNDLVYgbHIvc2MgZG9jdW1lbnRhdGlvbiBhbmQgY291bGQg
bm90IGZpbmQgYW55IGluZm8gCmFib3V0IGl0cyBjYWNoZWxpbmUgYmVoYXZpb3IuIAoKSWYgdGhp
cyBzdGFuZHMgY29ycmVjdCwgdGhlIFBSRUZFVENILlcgY291bGQgYmUgdXNlZnVsIGJlZm9yZSBl
dmVyeSBsciwgCnJpZ2h0PyAKKG1heWJlIHRoYXQncyB0aGUgY2FzZSBmb3IgYXJtNjQgdGhhdCB5
b3UgbWVudGlvbmVkIGJlZm9yZSkKClRoYW5rcyEKTGVvCgo+IAo+ID4KPiA+IFRoYW5rcyEKPiA+
IExlbwo+ID4KPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGFua3MhCj4gPiA+ID4gTGVvCj4g
PiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gLS0KPiA+ID4gQmVzdCBSZWdhcmRzCj4gPiA+ICBHdW8g
UmVuCj4gPiA+Cj4gPgo+IAo+IAo+IC0tIAo+IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVuCj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
