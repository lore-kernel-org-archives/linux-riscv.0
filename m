Return-Path: <SRS0=+hEn=HQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE86C433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Feb 2021 09:59:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B81E464DD1
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Feb 2021 09:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B81E464DD1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:Date:Subject:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w35idJjGTJ3A2zz6VQpL4Ueqy7Qb9EFKCkBLOidyR+Y=; b=kbiRll1Fl6ShI6Y+J2KKGEZqh
	TVqlL7uHv0y2mLhf4FtS34xFF5qSjdQsmX506GnYhY/JhjzN6ueaHb+W0XtsWdnmpkHdJX6byDd6D
	7n1cQHCYwPo9N8BC/9DWaPuhmx2yZ82mmcclr8Hx2WQ17ihPTsx1Q18D771te/15Yv0YFGPD+jDry
	FD2w3vSgvgFkqNMNr12JbhdAjzYDUo3gZUIz4VNm0ylCbdwtrasWOhA7euY14xSLqaS93v0U7wx8R
	5LBXgTW07Wi36I7ucld/r7N0ZsV/BLTmqUUiCr/+XG85+lRl/5eDMqvEGRBEv9teziDmYlYsl+PJp
	BYqPnqHbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBEBE-0001KO-QM; Sun, 14 Feb 2021 09:59:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBEBA-0001IF-MJ
 for linux-riscv@lists.infradead.org; Sun, 14 Feb 2021 09:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613296736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zp3fh8bmhevQAw8R7MoL8KMwwdmbqk0SnEL9PkDxXR0=;
 b=YSIBezDK2zFd6aXrHkl2BKQ9oL+lXtrvH28kCCGo7jswGOA//wASm7dNYrgOW3kJw+qlVh
 Onne/f/5p/pyrRDlJwRVPc6vNtcnGQEvVPxHqDLS15ya5oxd/TPlIBXdIlgKt0bprHZ/7t
 1yG239P8HKSVpyEHw0qpKn+HBt7jKho=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-gzpwXApaMd2iru7M-EjGNQ-1; Sun, 14 Feb 2021 04:58:54 -0500
X-MC-Unique: gzpwXApaMd2iru7M-EjGNQ-1
Received: by mail-wr1-f69.google.com with SMTP id y6so5993607wrl.9
 for <linux-riscv@lists.infradead.org>; Sun, 14 Feb 2021 01:58:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=FB1Zi7Y2SkOv/JvlFfpIv8DdC9H5NuowZUsuUzsgYnw=;
 b=cE3Wy5fzZtGi5myPqOam79XcWMj6yIFi37ml0jCuEmZp9OZWobW27cUvynif0X0JsW
 neoMSue3T35Avx0rLwcFxi/zFU9jbYDRTKqKreeJmcA3RcEnztDtDPTBbwa4jE3ytnr+
 u7aWay8clnqyCZRMFRGgy0QAzdcC3IC+K9DaSzFhITEwuQsssSIvXELP8HBjaYE23omI
 1oldV7981kpxlWMZTDJSv++e8gp01RmpF3qZF2jkoKk0vi7hSAsl4vzEiKHNuFXRUZxH
 u5EV0cWhIn6T3ruLhwmLrA1MnZyMTzDD6ORD1LFqkIbS2ZH5LKWCYRED3QEFcOZSIOmb
 eEgA==
X-Gm-Message-State: AOAM533U79Zjg3aDBbznVFsF5FTc6rBtZenTsaXwUke3Vzt1sCq4aeyM
 fM+jEsr/W7owTqs4Ej7vi8pJ02oxeTOWcpQiX+pWiIFFJHGyG0G+jE8QHuf68A9FcjR4+v4vcyv
 OSXZKVZkvjjo+16O+4aQVpMhGqTA1
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr9687100wmk.163.1613296732911; 
 Sun, 14 Feb 2021 01:58:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6AiGKsLxdVOEv3lcfmH3b0B76nApmRsRYcgYL0hyAbXvIT8wdTN/HlT3/mJBi3lug6LzkMg==
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr9687058wmk.163.1613296732697; 
 Sun, 14 Feb 2021 01:58:52 -0800 (PST)
Received: from [192.168.3.108] (p4ff23363.dip0.t-ipconnect.de. [79.242.51.99])
 by smtp.gmail.com with ESMTPSA id
 x15sm18554557wro.66.2021.02.14.01.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 01:58:52 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Date: Sun, 14 Feb 2021 10:58:44 +0100
Message-Id: <052DACE9-986B-424C-AF8E-D6A4277DE635@redhat.com>
References: <20210214091954.GM242749@kernel.org>
In-Reply-To: <20210214091954.GM242749@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: iPhone Mail (18D52)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210214_045900_775546_5880DFAD 
X-CRM114-Status: GOOD (  17.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cj4gQW0gMTQuMDIuMjAyMSB1bSAxMDoyMCBzY2hyaWViIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz46Cj4gCj4g77u/T24gRnJpLCBGZWIgMTIsIDIwMjEgYXQgMTA6MTg6MTlBTSArMDEw
MCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+PiBPbiAxMi4wMi4yMSAwMDowOSwgTWlrZSBS
YXBvcG9ydCB3cm90ZToKPj4+IE9uIFRodSwgRmViIDExLCAyMDIxIGF0IDAxOjA3OjEwUE0gKzAx
MDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4+IE9uIDExLjAyLjIxIDEyOjI3LCBNaWtl
IFJhcG9wb3J0IHdyb3RlOgo+Pj4+PiBPbiBUaHUsIEZlYiAxMSwgMjAyMSBhdCAxMDowMTozMkFN
ICswMTAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+PiAKPj4+PiBTbyBsZXQncyB0YWxr
IGFib3V0IHRoZSBtYWluIHVzZXItdmlzaWJsZSBkaWZmZXJlbmNlcyB0byBvdGhlciBtZW1mZCBm
aWxlcwo+Pj4+IChlc3BlY2lhbGx5LCBvdGhlciBwdXJlbHkgdmlydHVhbCBmaWxlcyBsaWtlIGh1
Z2V0bGJmcykuIFdpdGggc2VjcmV0bWVtOgo+Pj4+IAo+Pj4+IC0gRmlsZSBjb250ZW50IGNhbiBv
bmx5IGJlIHJlYWQvd3JpdHRlbiB2aWEgbWVtb3J5IG1hcHBpbmdzLgo+Pj4+IC0gRmlsZSBjb250
ZW50IGNhbm5vdCBiZSBzd2FwcGVkIG91dC4KPj4+PiAKPj4+PiBJIHRoaW5rIHRoZXJlIGFyZSBz
dGlsbCB2YWxpZCB3YXlzIHRvIG1vZGlmeSBmaWxlIGNvbnRlbnQgdXNpbmcgc3lzY2FsbHM6Cj4+
Pj4gZS5nLiwgZmFsbG9jYXRlKFBVTkNIX0hPTEUpLiBUaGluZ3MgbGlrZSB0cnVuY2F0ZSBhbHNv
IHNlZW1zIHRvIHdvcmsganVzdAo+Pj4+IGZpbmUuCj4+PiBUaGVzZSB3b3JrIHBlcmZlY3RseSB3
aXRoIGFueSBmaWxlLCBzbyBtYXliZSB3ZSBzaG91bGQgaGF2ZSBhZGRlZAo+Pj4gbWVtZmRfY3Jl
YXRlIGFzIGEgZmxhZyB0byBvcGVuKDIpIGJhY2sgdGhlbiBhbmQgbm93IHRoZSBzZWNyZXRtZW0g
ZmlsZQo+Pj4gZGVzY3JpcHRvcnM/Cj4+IAo+PiBJIHRoaW5rIG9wZW4oKSB2cyBtZW1mZF9jcmVh
dGUoKSBtYWtlcyBzZW5zZTogZm9yIG9wZW4sIHRoZSBwYXRoIHNwZWNpZmllcwo+PiBtYWluIHBy
b3BlcnRpZXMgKHRtcGZzLCBodWdldGxiZnMsIGZpbGVzeXN0ZW0pLiBPbiBtZW1mZCwgdGhlcmUg
aXMgbm8gc3VjaAo+PiBwYXRoIGFuZCB0aGUgInR5cGUiIGhhcyB0byBiZSBzcGVjaWZpZWQgZGlm
ZmVyZW50bHkuCj4+IAo+PiBBbHNvLCBvcGVuKCkgbWlnaHQgb3BlbiBleGlzdGluZyBmaWxlcyAt
IG1lbWZkIGFsd2F5cyBjcmVhdGVzIG5ldyBmaWxlcy4KPiAKPiBZZXMsIGJ1dCBzdGlsbCBvcGVu
KCkgcmV0dXJucyBhIGhhbmRsZSB0byBhIGZpbGUgYW5kIG1lbWZkX2NyZWF0ZSgpIHJldHVybnMK
PiBhIGhhbmRsZSB0byBhIGZpbGUuIFRoZSBkaWZmZXJlbmNlcyBtYXkgYmUgd2VsbCBoaWRkZW4g
YnkgZS5nLiBPX01FTU9SWSBhbmQKPiB0aGFuIGZlYXR1cmVzIHVuaXF1ZSB0byBtZW1mZCBmaWxl
cyB3aWxsIGhhdmUgdGhlaXIgc2V0IG9mIE9fU09NRVRISU5HCj4gZmxhZ3MuCj4gCgpMZXTigJhz
IGFncmVlIHRvIGRpc2FncmVlLgoKPiBJdCdzIHRoZSBzYW1lIGxvZ2ljIHRoYXQgc2F5cyAid2Ug
YWxyZWFkeSBoYXZlIGFuIGludGVyZmFjZSB0aGF0J3MgY2xvc2UKPiBlbm91Z2ggYW5kIGl0J3Mg
ZmluZSB0byBhZGQgYSBidW5jaCBvZiBuZXcgZmxhZ3MgdGhlcmUiLgoKTm8sIG5vdCBxdWl0ZS4g
QnV0IGxldOKAmHMgYWdyZWUgdG8gZGlzYWdyZWUuCgo+IAo+IEFuZCBoZXJlIHdlIGNvbWUgdG8g
dGhlIHF1ZXN0aW9uICJ3aGF0IGFyZSB0aGUgZGlmZmVyZW5jZXMgdGhhdCBqdXN0aWZ5IGEKPiBu
ZXcgc3lzdGVtIGNhbGw/IiBhbmQgdGhlIGFuc3dlciB0byB0aGlzIGlzIHZlcnkgc3ViamVjdGl2
ZS4gQW5kIGFzIHN1Y2ggd2UKPiBjYW4gY29udGludWUgYmlrZXNoZWRkaW5nIGZvcmV2ZXIuCgpJ
IHRoaW5rIHRoaXMgZml0cyBpbnRvIHRoZSBleGlzdGluZyBtZW1mZF9jcmVhdGUoKSBzeXNjYWxs
IGp1c3QgZmluZSwgYW5kIEkgaGVhcmQgbm8gY29tcGVsbGluZyBhcmd1bWVudCB3aHkgaXQgc2hv
dWxkbuKAmHQuIFRoYXTigJhzIGFsbCBJIGNhbiBzYXkuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
