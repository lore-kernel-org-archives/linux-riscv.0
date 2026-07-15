Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B0FC44507
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 11:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQOFu+abAmZPWf8lAU8mrZx1DxwscgRcHM08tkU0qTQ=; b=THsAFC5U/o5ia/
	dxzCTCU9LHLziYC1f+l4dHYWRJQl+ge+3A7Y6WICnqiMigd/peqt3wNnrxaLyW9rIDxEihzkXgJ7J
	cCQLjq6g/wwHullVYIH+bHC6QYNdS0hK9imtmHOQF5hMCkGVqCRu6Dnn6OdFuGg/XEWVQMgbRKZrO
	EIl/I72r29Gysfp4F9jl9m+Tm/i6yqq4Pmx2Bv7PqtmkjQirVpDuqZrcxLHEMAheD9vTz1rCd1d6R
	2lr0hM7sxJR81tispiIjytc/AYqkuXDwOVJ8c9lkg8vmKxHGA7JVweXiwWe521xfrWEwoGkbP8994
	59oMOzOG4ctr56J1stbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxul-0000000EbFA-2V2E;
	Wed, 15 Jul 2026 11:36:35 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjxui-0000000EbCt-3lyb
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 11:36:35 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7ea9c6ea7deso3672543a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 04:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784115389; cv=none;
        d=google.com; s=arc-20260327;
        b=cOA1QvcUdyGWwwkTpu825B4ifpfZIk/2hHEgGSEFcWqkG8DvFjcvocDEo5DzJ5ILL7
         pJpfrjM4pgW0heG/U6ziggX6kRNxhxbLCVO6LfJUlZE7RxFKbaeittweR4wkHEqplt+7
         9IyEqVpOFFY4XZnwlahj6a81Rxug5j8XnYGv42KVZlIkKJCMasQMukioyigmq4uvSUlw
         vKQw/gkp1lX/+1LKIXuxPt4/ZNcEDYcxX/DjMo93astV8075jo6NbRLEQ3CXNoVllTwR
         9r4OGWdn6pFmsJFsuv8IXlWCX+zPdpcAsbkoPfIlZG1PA0u5XiIUN3rCZwLs0IqKk5A1
         2GcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZEtkZBQmdX0etetnBFbvuoc6k7xP4dTkloxYVpfa9w=;
        fh=I+dhQi1hxQujbnqBBE18VumpdWv1VpheGDphd4SokBM=;
        b=PiwILuOA63mtLktGeSAMiXHVAEdq1JNKiXZESn+q9tt3qPTDNsX7w5+90EFb2QzKbH
         jfBD6e4/NVZ15xD0NOYarFM1V66pupGJLhM3vqT6EDePK3yZbb8bKIaCJCsVWzwfp0lZ
         SegGf1Yvn3ZvgtBVmbTxG4GSqrYJTL/k46EKYOxTeMbZ3+x6wJd9wRJaEkRV3BP+QWat
         2tjdXOuNrKNHIqtINWFEC9Qr10/B3QHq3jzcc+4eEvc7xdzzT70KiL7bbBXWZQyGg8Aq
         ZyqPC+jRBJwyw4wtt8wDfJLAP4GjZTYiJfb3UwWhVHhzmHB9KT/CeM6euD08TnN1sMUo
         /P/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784115389; x=1784720189; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ZEtkZBQmdX0etetnBFbvuoc6k7xP4dTkloxYVpfa9w=;
        b=UEL4LNUE8TvQWQVMenh8PwINNiVhJB47rXfZPbBk5cMW/pqLemW3Q9/7GQLyjuBmHq
         SJFBXP5SH9uf1kfwVAOlMSL9i0KmWAbb+QzJzz8Jdjy4j934OwFehEkP75Q20c55E/Rm
         ZbZ/cgW6OiCjCNXzJDKD89QNr6hVwp/Rrm/azzItK4ONKsXijTGz80IjuMYWsL4FKu87
         YtELAknEowvRG6Y4cGoEqvVZT/vHwweZ/TxeoVMBvuGXuaSDWxISGrTs9ETxtR8m0f/Q
         /tme0tlIU7RRAOyLx/ZQN/l1kf0VfWILq7LvucZtn121tWbKtD2AdUpp+XwRtz3KVQ5Y
         HvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115389; x=1784720189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZEtkZBQmdX0etetnBFbvuoc6k7xP4dTkloxYVpfa9w=;
        b=qxpiiReeKzyW/F9pcfkbnJM7wPT+w5q5U+MAAD9aCcTdeyff+c8S0XnOBYfwqL+rzh
         0fBXsQ+8OGLrF81aIHzPZkR7ylN3nITbjpRJTPyCVn0jS8YmE4u2yayEFQs1zxrymb4a
         qdchwuYzo4a0ZoDG9JMiHPgYH7EA4X4iAjQxF4yaRv5hm8SuwjiSnLa6KwmjeXZ+FSN2
         5pm+QyZWd3LdWoa3V+W+I7Xj40oBVN9I+wOmdXLjAo7SLDQ46wh3xx/7XPyZYN/3qful
         wAutX8+XKIZ5re90cxhiwBIpUAFQzQ2xIQEUIWEAQ4OybtBo6vCaun4G84ksQRhEN31M
         i4ow==
X-Forwarded-Encrypted: i=1; AHgh+Ro3wIRwn2l+SQ1Bm/CRrWOiNsSvoRYHLIdhSelJqfFsuxI5RokOwSBkVOTrZ9XwiynZ6aiso2teS3AE7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCz0EhfG5vSDH4WWMCnI0sxw2e2Q0nnhfTvFR7orQnci2QjwN/
	vzR+vQPmxkk79Xhc+ifsHiSrSVS+wdvydzGcRBifyzDMKZER5jdU9NvKxmFtao5Cb5yFFXWRU4f
	uU9u5O5rI6fZsc740LTU5fey6s8F4TT8sCikk1Qa1Lw==
X-Gm-Gg: AfdE7ckPZoJFOoGyQxm3HzNsoHnQTmh+YbCAbbqrJut44yf/0MrM19TSe6qT5BTwoN8
	DoNywzh3kUtzgcZlsFccbj7/ziiEJ0HGQqDJtZCIvMck4AJkE7dU67cpamUFw4d++qwHViXogt4
	fG8gp4HSVdDYDSBdR2W3DjH9RMJrD3BrRYInEuLoBgPhKVj35hHFuBhNRd8IYcmjUv8DdPURwiL
	l8sCUu8eXbsqCqMNdyaKgDHsojz6+UdwJcZXRyDq+UirE3YCyJA/1p1kEO+kRltdEFzxMINlpw=
X-Received: by 2002:a05:6830:6d4f:b0:7e6:e1d2:3bd0 with SMTP id
 46e09a7af769-7ec420f059fmr4345745a34.10.1784115388897; Wed, 15 Jul 2026
 04:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260421092457.37649-1-cuiyunhui@bytedance.com> <62c418bc-082b-4ae2-a889-f63dd2b7f503@kernel.org>
In-Reply-To: <62c418bc-082b-4ae2-a889-f63dd2b7f503@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 15 Jul 2026 19:36:16 +0800
X-Gm-Features: AUfX_my7GduNMyP3_qMrw3wVYCX4eNM5Te_gdOiwtTrcP35i3khqzqzTVVZ3zhc
Message-ID: <CAEEQ3wm72=CKNxXsSszZqiWDSHDZcAUgppxXxEAXyCy=uB+zaw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v1 0/7] riscv: add Svnapot-based contiguous
 PTE support
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, andrew+kernel@donnellan.id.au, 
	andreyknvl@gmail.com, anup@brainfault.org, aou@eecs.berkeley.edu, 
	apopple@nvidia.com, ardb@kernel.org, atish.patra@linux.dev, 
	baolin.wang@linux.alibaba.com, debug@rivosinc.com, 
	djordje.todorovic@htecgroup.com, dvyukov@google.com, elver@google.com, 
	glider@google.com, ilias.apalodimas@linaro.org, junhui.liu@pigmoral.tech, 
	kasan-dev@googlegroups.com, kees@kernel.org, kevin.brodsky@arm.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	liu.xuemei1@zte.com.cn, ljs@kernel.org, namcao@linutronix.de, 
	osalvador@suse.de, palmer@dabbelt.com, pjw@kernel.org, rmclure@linux.ibm.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryabinin.a.a@gmail.com, 
	surenb@google.com, vincenzo.frascino@arm.com, vishal.moola@gmail.com, 
	wangruikang@iscas.ac.cn, zhangchunyan@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_043632_956356_3D948665 
X-CRM114-Status: GOOD (  17.56  )
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

SGkgRGF2aWQsCgpPbiBUdWUsIEFwciAyMSwgMjAyNiBhdCA3OjI44oCvUE0gRGF2aWQgSGlsZGVu
YnJhbmQgKEFybSkKPGRhdmlkQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gNC8yMS8yNiAxMToy
NCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IEhpLAo+ID4KPiA+IEZpcnN0IG9mIGFsbCwgdGhhbmtz
IHRvIFJ5YW4gUm9iZXJ0cyBmb3IgdGhlIHdvcmsgb24gbVRIUCBhbmQKPiA+IENvbnRpZ3VvdXMg
UFRFIHN1cHBvcnQgb24gYXJtNjQuIFRoYXQgd29yayBwcm92aWRlcyBhIHZlcnkgdXNlZnVsCj4g
PiByZWZlcmVuY2UgZm9yIHJlZHVjaW5nIHBhZ2UgZmF1bHQgb3ZlcmhlYWQgYW5kIFRMQiBwcmVz
c3VyZSBmb3IKPiA+IGxhcmdlIGJ1dCBzdGlsbCBQVEUtbWFwcGVkIG1lbW9yeSByYW5nZXMuCj4g
Pgo+ID4gVGhpcyBzZXJpZXMgYWRkcyBTdm5hcG90LWJhc2VkIGNvbnRpZ3VvdXMgUFRFIHN1cHBv
cnQgZm9yIFJJU0MtVi4KPiA+Cj4gPiBUbyBhY2hpZXZlIHNpbWlsYXIgYmVuZWZpdHMgb24gUklT
Qy1WLCB0aGlzIHNlcmllcyBpbnRyb2R1Y2VzIGEKPiA+IENvbnRpZ3VvdXMtUFRFLWxpa2UgbWVj
aGFuaXNtIGJ1aWx0IG9uIHRvcCBvZiB0aGUgU3ZuYXBvdCBleHRlbnNpb24uCj4gPiBUaGUgaW50
ZW50IGlzIHRvIHByZXNlcnZlIHRoZSBjb3JlLU1NIFBURSBzZW1hbnRpY3Mgd2hpbGUgYWxsb3dp
bmcKPiA+IFJJU0MtViB0byB0cmFuc3BhcmVudGx5IGZvbGQgZWxpZ2libGUgYmFzZS1wYWdlIG1h
cHBpbmdzIGludG8KPiA+IFN2bmFwb3QtZW5jb2RlZCBjb250aWd1b3VzIG1hcHBpbmdzIHdoZW4g
cG9zc2libGUuCj4gPgo+ID4gVGhlIHNlcmllcyBzcGxpdHMgdGhlIGxvdy1sZXZlbCByYXcgUFRF
IGhlbHBlcnMgZnJvbSB0aGUgcHVibGljCj4gPiBjb3JlLU1NLWZhY2luZyBQVEUgaGVscGVycywg
c28gdGhhdDoKPiA+Cj4gPiAtdGhlIF9feHh4IGhlbHBlcnMgZXhwb3NlIHRoZSByYXcgaGFyZHdh
cmUgUFRFIGVuY29kaW5nLAo+ID4gLXRoZSB4eHggaGVscGVycyBwcm92aWRlIHRoZSBzZW1hbnRp
YyB2aWV3IGV4cGVjdGVkIGJ5IGNvcmUgTU0sCj4gPiAtYW5kIFN2bmFwb3QtYXdhcmUgaGFuZGxp
bmcgaXMgY2VudHJhbGl6ZWQgaW4gdGhlIHB1YmxpYyB3cmFwcGVyIGxheWVyLgo+Cj4KPiBKdXN0
IGN1cmlvdXMsIGlzIHRoZXJlIG9wcG9ydHVuaXR5IHRvIHNoYXJlIHNvbWUgb2YgdGhlIGNvZGUg
d2l0aCBhcm02NCwKPiBmYWN0b3Jpbmcgb3V0IGhlbHBlcnMgdGhhdCBoYW5kbGUgc29tZXRoaW5n
IGxpa2UKPiBDT05GSUdfQVJDSF9IQVNfQ09OVElHX1BURVMgPwoKYXJtNjQgY29udHB0ZSBhbmQg
UklTQy1WIFN2bmFwb3QgbG9vayBzaW1pbGFyIGF0IGEgaGlnaCBsZXZlbCwgYnV0IHRoZXkKZG8g
bm90IG1vZGVsIGNvbnRpZ3VvdXMgbWFwcGluZ3MgaW4gdGhlIHNhbWUgd2F5LiBhcm02NCBrZWVw
cyBvcmRpbmFyeQpiYXNlIFBURXMgYW5kIGFkZHMgUFRFX0NPTlQsIHdoaWxlIFN2bmFwb3QgZW5j
b2RlcyBhIG5hdHVyYWxseSBhbGlnbmVkCnJhbmdlIGRpcmVjdGx5IGluIHRoZSBQVEVzLiBCZWNh
dXNlIG9mIHRoYXQsIHRoaXMgc2VyaWVzIGV4cG9zZXMgYQpsb2dpY2FsIHBlci1wYWdlIHN1Yi1Q
VEUgdmlldyB0byBnZW5lcmljIE1NLCB3aGlsZSBrZWVwaW5nIHRoZSByYXcKU3ZuYXBvdCBlbmNv
ZGluZyB1bmRlcm5lYXRoLgoKU28gdGhlIGRpZmZlcmVuY2VzIGFyZSBub3Qgb25seSBpbiB0aGUg
bG93LWxldmVsIGVuY29kaW5nLCBidXQgYWxzbyBpbgp0aGUgcHVibGljIFBURSBzZW1hbnRpY3Mg
YW5kIGluIHNvbWUgb2YgdGhlIGZvbGQvdW5mb2xkIGFuZCBUTEIgcnVsZXMuCgo+Cj4KPiAtLQo+
IENoZWVycywKPgo+IERhdmlkCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
