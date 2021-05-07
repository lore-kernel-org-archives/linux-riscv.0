Return-Path: <SRS0=6bm6=KC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03BBC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  7 May 2021 07:36:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FCE16141B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 May 2021 07:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FCE16141B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tgTVQQafPxXX2qZQtJ4nsrCdEbG3PQbKH8QGsJzGs2M=; b=ObZqSfiLwAnIeqYts46Y01ynz
	MCmvVuxOb1qyLDE45mX0YHVxWuHIK/h/wXIymdK7xNeVoxS53TgOmwGRfraECbNL24Of/X84qRPOu
	J4SZXec1Y1o0nvNW/oMgVn6RAwcPmCZ5Yo6DiCuME7kB2WhRJAxBWTuFQWEMGY0I+SWdoXVN2+SXF
	/FZZlYlKp/0CBKTTF6BruX8um3sCgzqyXu2xNnPZhrZlLz5DCPJrplucAWCicqEMxY+8VggMb5nYw
	m0OM7b/u4pBZKaEAKeorO9J/xgygparekojKD/1HQ0jehedmhskxSRXsUTJvM3ZpT8YrO32YxU3yD
	acOg9C0zA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lev1k-006OKT-Fc; Fri, 07 May 2021 07:36:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lev1h-006OJg-2C
 for linux-riscv@desiato.infradead.org; Fri, 07 May 2021 07:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=YRLhFcul/s0bAb0h6pwheuix10YVXJYp5em6Jk4RpTY=; b=VG5nbpFXTtPrnzYapgdeKNietC
 MpXiZOIFUH2xxaDoLe/i4bT2yCAx08pFYhEdP2Kwx0OAHUW0OuS2k99C/PIyqcKnVhwNx2rmMysrS
 WWsgM2e44y3T6jyzFrKx855nDMrBXfzolmAr0J90akF6L6NWRgPTkWoJ9W2cOu7wWJyQiGyaPff/k
 iUOOIfbohmvG/vfAaAqIYpxJvfLufqFd3O7pp09IH1U2q3QGCKf9zFPidgxSFpjd/vamVdPCbQXzP
 PT7neXMcceBHdXI2TaUsm1JfycVj3+Yufr1HY8plSj5ZwEz6xDwXZqqkAIMM/hAx1+LugWnc3A3Ry
 UFgM2QRg==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lev1c-006eiw-J3
 for linux-riscv@lists.infradead.org; Fri, 07 May 2021 07:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620372951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YRLhFcul/s0bAb0h6pwheuix10YVXJYp5em6Jk4RpTY=;
 b=LKQ8IWaBht40hQ37zGhiXWlx+x+Dj6an1dgqmq+UDQ3Msuggv1C2b3TezDAWLG/j28CUxx
 SYtxDjtmTeLa6lateTlt99a9Vpwn/iZBxnYdboXBfMzDsZa4lqARUwn76xIegra1nQR16K
 nHeDtHsZAN4JgiRXzfUjQ3eqptexoS4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-kX00adAYN4iptmZK_Kv2dQ-1; Fri, 07 May 2021 03:35:49 -0400
X-MC-Unique: kX00adAYN4iptmZK_Kv2dQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 bx15-20020a170906a1cfb029037415131f28so2671852ejb.18
 for <linux-riscv@lists.infradead.org>; Fri, 07 May 2021 00:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YRLhFcul/s0bAb0h6pwheuix10YVXJYp5em6Jk4RpTY=;
 b=M+dftLRUEiEv3h/zhTjgJH83bceSR3Vz/0iDLklY3i/k70ttLm+wUkcipEvHMz7Hbv
 9p9tKfJ3DouyFMxWzquXJn2WJf8lQVKpXXOtV/w8y76PqiHO2pxCgYT6iAtJHWhQeWrB
 +4MYkOERtkTNXksFwBAcK9WacCybft723OVTE5/nkp9JmeWlQvLleL3slezXIBXjXyhS
 TeIxaksrtb7cly0YQK5zmt7fb22WmhcrBOgNYclttJDzd8WwG45kGsjB+RCdtXrp3S5B
 Bgtr0MUAGtaoEAj7OcEXkXzvg1VnGI+u0yd2lNte7FfD/KrmXAO+a3k7bqDrIzbnVUZJ
 +y1g==
X-Gm-Message-State: AOAM532+5wbS0Lwh4+fNAWdk44Ozo6ql4GPk16HzBw14FNgeRk66U6BO
 6/rd1Bzmqs9qKXQDdevx3Xc65DmnKRd1f+sMntVOFXHdnpG0/l8p3q60OjcbxhimFup5+0jXBUv
 tc8eDYuVj8ga9MggeHNwhjApYOrD6
X-Received: by 2002:a17:907:174a:: with SMTP id
 lf10mr8861611ejc.433.1620372948261; 
 Fri, 07 May 2021 00:35:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5XI2zKUbsKazvcW2Vr5jvMDeiB+dtOEKTtfzbIqz37aYae3i7ugq6B0OmfMhiabycSZroRA==
X-Received: by 2002:a17:907:174a:: with SMTP id
 lf10mr8861569ejc.433.1620372947917; 
 Fri, 07 May 2021 00:35:47 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c63c0.dip0.t-ipconnect.de. [91.12.99.192])
 by smtp.gmail.com with ESMTPSA id
 l17sm2925176ejk.22.2021.05.07.00.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 00:35:47 -0700 (PDT)
To: Nick Kossifidis <mick@ics.forth.gr>, jejb@linux.ibm.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Michael Kerrisk
 <mtk.manpages@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
References: <20210303162209.8609-1-rppt@kernel.org>
 <20210505120806.abfd4ee657ccabf2f221a0eb@linux-foundation.org>
 <de27bfae0f4fdcbb0bb4ad17ec5aeffcd774c44b.camel@linux.ibm.com>
 <996dbc29-e79c-9c31-1e47-cbf20db2937d@redhat.com>
 <8eb933f921c9dfe4c9b1b304e8f8fa4fbc249d84.camel@linux.ibm.com>
 <77fe28bd940b2c1afd69d65b6d349352@mailhost.ics.forth.gr>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v18 0/9] mm: introduce memfd_secret system call to create
 "secret" memory areas
Message-ID: <5232c8a7-8a05-9d0f-69ff-3dba2b04e784@redhat.com>
Date: Fri, 7 May 2021 09:35:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <77fe28bd940b2c1afd69d65b6d349352@mailhost.ics.forth.gr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_003552_841639_25493462 
X-CRM114-Status: GOOD (  36.12  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDcuMDUuMjEgMDE6MTYsIE5pY2sgS29zc2lmaWRpcyB3cm90ZToKPiDOo8+EzrnPgiAyMDIx
LTA1LTA2IDIwOjA1LCBKYW1lcyBCb3R0b21sZXkgzq3Os8+BzrHPiM61Ogo+PiBPbiBUaHUsIDIw
MjEtMDUtMDYgYXQgMTg6NDUgKzAyMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4KPj4+
IEFsc28sIHRoZXJlIGlzIGEgd2F5IHRvIHN0aWxsIHJlYWQgdGhhdCBtZW1vcnkgd2hlbiByb290
IGJ5Cj4+Pgo+Pj4gMS4gSGF2aW5nIGtkdW1wIGFjdGl2ZSAod2hpY2ggd291bGQgb2Z0ZW4gYmUg
dGhlIGNhc2UsIGJ1dCBtYXliZSBub3QKPj4+IHRvIGR1bXAgdXNlciBwYWdlcyApCj4+PiAyLiBU
cmlnZ2VyaW5nIGEga2VybmVsIGNyYXNoIChlYXN5IHZpYSBwcm9jIGFzIHJvb3QpCj4+PiAzLiBX
YWl0aW5nIGZvciB0aGUgcmVib290IGFmdGVyIGt1bXAoKSBjcmVhdGVkIHRoZSBkdW1wIGFuZCB0
aGVuCj4+PiByZWFkaW5nIHRoZSBjb250ZW50IGZyb20gZGlzay4KPj4KPj4gQW55dGhpbmcgdGhh
dCBjYW4gbGVhdmUgcGh5c2ljYWwgbWVtb3J5IGludGFjdCBidXQgYm9vdCB0byBhIGtlcm5lbAo+
PiB3aGVyZSB0aGUgbWlzc2luZyBkaXJlY3QgbWFwIGVudHJ5IGlzIHJlc3RvcmVkIGNvdWxkIHRo
ZW9yZXRpY2FsbHkKPj4gZXh0cmFjdCB0aGUgc2VjcmV0LiAgSG93ZXZlciwgaXQncyBub3QgZXhh
Y3RseSBnb2luZyB0byBiZSBhIHN0ZWFsdGh5Cj4+IGV4dHJhY3Rpb24gLi4uCj4+Cj4+PiBPciwg
YXMgYW4gYXR0YWNrZXIsIGxvYWQgYSBjdXN0b20ga2V4ZWMoKSBrZXJuZWwgYW5kIHJlYWQgbWVt
b3J5Cj4+PiBmcm9tIHRoZSBuZXcgZW52aXJvbm1lbnQuIE9mIGNvdXJzZSwgdGhlIGxhdHRlciB0
d28gYXJlIGFkdmFuY2VkCj4+PiBtZWNoYW5pc21zLCBidXQgdGhleSBhcmUgcG9zc2libGUgd2hl
biByb290LiBXZSBtaWdodCBiZSBhYmxlIHRvCj4+PiBtaXRpZ2F0ZSwgZm9yIGV4YW1wbGUsIGJ5
IHplcm9pbmcgb3V0IHNlY3JldG1lbSBwYWdlcyBiZWZvcmUgYm9vdGluZwo+Pj4gaW50byB0aGUg
a2V4ZWMga2VybmVsLCBpZiB3ZSBjYXJlIDopCj4+Cj4+IEkgdGhpbmsgd2UgY291bGQgaGFuZGxl
IGl0IGJ5IG1hcmtpbmcgdGhlIHJlZ2lvbiwgeWVzLCBhbmQgYSB6ZXJvIG9uCj4+IHNodXRkb3du
IG1pZ2h0IGJlIHVzZWZ1bCAuLi4gaXQgd291bGQgcHJldmVudCBhbGwgd2FybSByZWJvb3QgdHlw
ZQo+PiBhdHRhY2tzLgo+Pgo+IAo+IEkgaGFkIHNpbWlsYXIgY29uY2VybnMgYWJvdXQgcmVjb3Zl
cmluZyBzZWNyZXRzIHdpdGgga2R1bXAsIGFuZAo+IGNvbnNpZGVyZWQgY2xlYW5pbmcgdXAga2V5
cmluZ3MgYmVmb3JlIGp1bXBpbmcgdG8gdGhlIG5ldyBrZXJuZWwuIFRoZQo+IHByb2JsZW0gaXMg
d2UgY2FuJ3QgcHJvdmlkZSBndWFyYW50ZWVzIGluIHRoYXQgY2FzZSwgb25jZSB0aGUga2VybmVs
IGhhcwo+IGNyYXNoZWQgYW5kIHdlIGFyZSBvbiBvdXIgd2F5IHRvIHJ1biBjcmFzaGtlcm5lbCwg
d2UgY2FuJ3QgYmUgc3VyZSB3ZQo+IGNhbiByZWxpYWJseSB6ZXJvLW91dCBhbnl0aGluZywgdGhl
IG1vcmUgY29kZSB3ZSBhZGQgdG8gdGhhdCBwYXRoIHRoZQoKV2VsbCwgSSB0aGluayBpdCBkZXBl
bmRzLiBBc3N1bWUgd2UgZG8gdGhlIGZvbGxvd2luZwoKMSkgWmVybyBvdXQgYW55IHNlY3JldG1l
bSBwYWdlcyB3aGVuIGhhbmRpbmcgdGhlbSBiYWNrIHRvIHRoZSBidWRkeS4gCihhbHRlcm5hdGl2
ZTogaW5pdF9vbl9mcmVlPTEpIC0tIGlmIG5vdCBhbHJlYWR5IGRvbmUsIEkgZGlkbid0IGNoZWNr
IHRoZSAKY29kZS4KCjIpIE9uIGtkdW1wKCksIHplcm8gb3V0IGFsbCBhbGxvY2F0ZWQgc2VjcmV0
bWVtLiBJdCdkIGJlIGVhc2llciBpZiB3ZSdkIApqdXN0IGFsbG9jYXRlZCBmcm9tIGEgZml4ZWQg
cGh5c2ljYWwgbWVtb3J5IGFyZWE7IG90aGVyd2lzZSB3ZSBoYXZlIHRvIAp3YWxrIHByb2Nlc3Mg
cGFnZSB0YWJsZXMgb3IgdXNlIGEgUEZOIHdhbGtlci4gQW5kIHplcm9pbmcgb3V0IHNlY3JldG1l
bSAKcGFnZXMgd2l0aG91dCBhIGRpcmVjdCBtYXBwaW5nIGlzIGEgZGlmZmVyZW50IGNoYWxsZW5n
ZS4KCk5vdywgZHVyaW5nIDIpIGl0IGNhbiBoYXBwZW4gdGhhdAoKYSkgV2UgY3Jhc2ggaW4gb3Vy
IGNsZWFyaW5nIGNvZGUgKGUuZy4sIHNvbWV0aGluZyBpcyBzZXJpb3VzbHkgbWVzc2VkIAp1cCkg
YW5kIGZhaWwgdG8gc3RhcnQgdGhlIGtkdW1wIGtlcm5lbC4gVGhhdCdzIGFjdHVhbGx5IGdvb2Qs
IGluc3RlYWQgb2YgCmxlYWtpbmcgZGF0YSB3ZSBmYWlsIGhhcmQuCgpiKSBXZSBkb24ndCBmaW5k
IGFsbCBzZWNyZXRtZW0gcGFnZXMsIGZvciBleGFtcGxlLCBiZWNhdXNlIHByb2Nlc3MgcGFnZSAK
dGFibGVzIGFyZSBtZXNzZWQgdXAgb3Igc29tZXRoaW5nIG1lc3NlZCB1cCBvdXIgbWVtbWFwIChp
ZiB3ZSdkIHVzZSB0aGF0IAp0byBpZGVudGlmeSBzZWNyZXRtZW0gcGFnZXMgdmlhIGEgUEZOIHdh
bGtlciBzb21laG93KQoKCkJ1dCBmb3IgdGhlIHNpbXBsZSBjYXNlcyAoZS5nLiwgbWFsaWNpb3Vz
IHJvb3QgdHJpZXMgdG8gY3Jhc2ggdGhlIGtlcm5lbCAKdmlhIC9wcm9jL3N5c3JxLXRyaWdnZXIp
IGJvdGggYSkgYW5kIGIpIHdvdWxkbid0IGFwcGx5LgoKT2J2aW91c2x5LCBpZiBhbiBhZG1pbiB3
b3VsZCB3YW50IHRvIG1pdGlnYXRlIHJpZ2h0IG5vdywgaGUgd291bGQgd2FudCAKdG8gZGlzYWJs
ZSBrZHVtcCBjb21wbGV0ZWx5LCBtZWFuaW5nIGFueSBhdHRlbXB0IHRvIGxvYWQgYSBjcmFzaGtl
cm5lbCAKd291bGQgZmFpbCBhbmQgY2Fubm90IGJlIGVuYWJsZWQgYWdhaW4gZm9yIHRoYXQga2Vy
bmVsIChhbHNvIG5vdCB2aWEgCmNtZGxpbmUgYW4gYXR0YWNrZXIgY291bGQgbW9kaWZ5IHRvIHJl
Ym9vdCBpbnRvIGEgc3lzdGVtIHdpdGggdGhlIG9wdGlvbiAKZm9yIGEgY3Jhc2hrZXJuZWwpLiBE
aXNhYmxpbmcga2R1bXAgaW4gdGhlIGtlcm5lbCB3aGVuIHNlY3JldG1lbSBwYWdlcyAKYXJlIGFs
bG9jYXRlZCBpcyBvbmUgYXBwcm9hY2gsIGFsdGhvdWdoIHN1Yi1vcHRpbWFsLgoKPiBtb3JlIHJp
c2t5IGl0IGdldHMuIEhvd2V2ZXIgZHVyaW5nIHJlYm9vdC9ub3JtYWwga2V4ZWMoKSB3ZSBzaG91
bGQgZG8KPiBzb21lIGNsZWFudXAsIGl0IG1ha2VzIHNlbnNlIGFuZCBzZWNyZXRtZW0gY2FuIGlu
ZGVlZCBiZSB1c2VmdWwgaW4gdGhhdAo+IGNhc2UuIFJlZ2FyZGluZyBsb2FkaW5nIGN1c3RvbSBr
ZXhlYygpIGtlcm5lbHMsIHdlIG1pdGlnYXRlIHRoaXMgd2l0aAo+IHRoZSBrZXhlYyBmaWxlLWJh
c2VkIEFQSSB3aGVyZSB3ZSBjYW4gdmVyaWZ5IHRoZSBzaWduYXR1cmUgb2YgdGhlIGxvYWRlZAo+
IGtpbWFnZSAoYXNzdW1pbmcgdGhlIHN5c3RlbSBydW5zIGEga2VybmVsIHByb3ZpZGVkIGJ5IGEg
dHJ1c3RlZCAzcmQKPiBwYXJ0eSBhbmQgd2UgJ3ZlIG1haW50YWluZWQgYSBjaGFpbiBvZiB0cnVz
dCBzaW5jZSBib290aW5nKS4KCkZvciBleGFtcGxlIGluIFZNcyAobGlrZSBRRU1VKSwgd2Ugb2Z0
ZW4gZG9uJ3QgY2xlYXIgcGh5c2ljYWwgbWVtb3J5IApkdXJpbmcgYSByZWJvb3QuIFNvIGlmIGFu
IGF0dGFja2VyIG1hbmFnZXMgdG8gbG9hZCBhIGtlcm5lbCB0aGF0IHlvdSBjYW4gCnRyaWNrIGlu
dG8gcmVhZGluZyByYW5kb20gcGh5c2ljYWwgbWVtb3J5IGFyZWFzLCB3ZSBjYW4gbGVhayBzZWNy
ZXRtZW0gCmRhdGEgSSB0aGluay4KCkFuZCB0aGVyZSBtaWdodCBiZSB3YXlzIHRvIGFjaGlldmUg
dGhhdCBqdXN0IHVzaW5nIHRoZSBjbWRsaW5lLCBub3QgCm5lY2Vzc2FyaWx5IGxvYWRpbmcgYSBk
aWZmZXJlbnQga2VybmVsLiBGb3IgZXhhbXBsZSBpZiB5b3UgbGltaXQgdGhlIAprZXJuZWwgZm9v
dHByaW50ICgibWVtPTI1Nk0iKSBhbmQgZGlzYWJsZSBzdHJpY3RfaW9tZW1fY2hlY2tzIAooInN0
cmljdF9pb21lbV9jaGVja3M9cmVsYXhlZCIpIHlvdSBjYW4ganVzdCBleHRyYWN0IHRoYXQgbWVt
b3J5IHZpYSAKL2Rldi9tZW0gaWYgSSBhbSBub3Qgd3JvbmcuCgpTbyBhcyBhbiBhdHRhY2tlciwg
bW9kaWZ5IHRoZSAoZ3J1YikgY21kbGluZSB0byAibWVtPTI1Nk0gCnN0cmljdF9pb21lbV9jaGVj
a3M9cmVsYXhlZCIsIHJlYm9vdCwgYW5kIHJlYWQgYWxsIG1lbW9yeSB2aWEgL2Rldi9tZW0uIApP
ciBsb2FkIGEgc2lnbmVkIGtleGVjIGtlcm5lbCB3aXRoIHRoYXQgY21kbGluZSBhbmQgYm9vdCBp
bnRvIGl0LgoKSW50ZXJlc3RpbmcgcHJvYmxlbSA6KQoKLS0gClRoYW5rcywKCkRhdmlkIC8gZGhp
bGRlbmIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
