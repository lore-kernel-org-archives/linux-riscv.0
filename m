Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C13C624A4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 13:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peIXRQlp7uBn//GifIg567UxoeO4u1R9l0aFyFGxpF8=; b=hPiDKSkCsZR+IH
	RYnLQfhKpWFv74XKlV82SGhHECK2E+E4yvkjDzsXmNUR3mpov5F7zJSUmcKFSud5yW36bqklKl5pK
	VUYKyRY8WsNC0SWVKqWQhtZT7FHVroVUbei0nAUTU6aSWpZVt2JfVaLXiBBc/fHKGFGoAbTxgcTPn
	iaNRbgHAef17mjeA8Tdb9rz1VOaAfT5EmYXXB4XAxPu9Nwd6mjHKLKlpZVCxlKuzEzZv4am8j3YWX
	Uek46I16/hlzQEdz1tMt6HOZo9N+qaUcWTYat56qOUPAKr+m37xrseGi10iUlUfvpw0Bu3v4Ud+YB
	OYDsW2udd4B8w1rq9QJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27XS-0000000HPac-0IsC;
	Thu, 03 Sep 2026 13:31:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27XN-0000000HPZ6-2jeJ
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 13:31:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788442286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+0Di3qj5r5ZLKVg7VMQtnJsK/2I+OQNTE5J5ZZ279A=;
	b=K5D6eHMzqyEtN80YbdXHxEhDx2VrMUahjSH0u1JPRwuluilgANg4L0boXQOqISPcYtTCsK
	pQcIeBVaErVUFLyO3SmtX7nBoM5QElynjD2f78s/bD7clXTTUvYrgbdQHI/rwwtXSt8bbU
	/+D4REkl1de+bWs5+P17Twe/5rRJzhE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-M-CQ0pz2PpqTzlvnT3kL7w-1; Thu, 03 Sep 2026 09:31:22 -0400
X-MC-Unique: M-CQ0pz2PpqTzlvnT3kL7w-1
X-Mimecast-MFC-AGG-ID: M-CQ0pz2PpqTzlvnT3kL7w_1788442281
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso2924223a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Sep 2026 06:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442281; x=1789047081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+0Di3qj5r5ZLKVg7VMQtnJsK/2I+OQNTE5J5ZZ279A=;
        b=bWq9ZsatQLsWbw6laRF5Xeqaf2dTNguhu5uCZ5STJ8ndiqkoF1p8W8YNDd5FCjVXMA
         604Jlgw4CRReeOyXbaGgnJocHxZY2mGB1+kG15WH2tii6/xdjXv0ohiwCdVVZVv8xupQ
         QeTK0Oqm5YxRUogDPowMCar+XEk4pLhZL8rhAnshzGIVEd+Qcws0okX+i+X6zD6Ym0D2
         7lvl7xequfWTMXVjpfm2kaH97x4vtnr3lZrI4wZ7wZlefC8MKlQwd5cEUqMoIPIdcmdH
         LwyK094dtmxR3NejMNSljiUv1ZovulMFH5PaOQu3AhllwVK17V3xpIkcXGk0MDr+AgaZ
         hGDg==
X-Forwarded-Encrypted: i=1; AKwUvBztD4Ut5G1iD/ory7Har3JPFKX6ZaNZ0MQQZCvbTRZKcFfPx5FZ+KvBvam+TSqFXdhRGiPYz5jC1FGygw==@lists.infradead.org
X-Gm-Message-State: AFuF++lZvFoi023EYk0v8st6N97UclSj2RtWERJdtcLelPfs6kVx5g7L
	v9dxVw/at0TvwxyHnZj6BH77OsTiiVVzO7ULWicnr6vqHRxoihoxASq6Pad77kUx0+ZrXvL9Dtq
	T+WBO8EpPUTXK8o1AeokWxVkEzuJxUv2wuAHF1X/T4gZ1F2JQcdqp5r9nhLDnNRF2sp4esw==
X-Gm-Gg: AYBFou1VGzfulgWZplL65RYVXH1qVJlO5FAPWYCHzi0m5RhGWbwYnlFdeJYV08TN/OA
	bW7ElkFnkt193BJhDlmRSVJbiXMywrcqQ1Wpg+zNOeRaSmjv2DdjwHr1aOnEN8OVtcGJSfrJ9Mr
	kb5/kYUA023Pv6H0CEXHzWFiDAIWI4V/7o46PBueWbK8K1InMrcC6CSBHEU6biwDQswIMmQk34k
	cCBIIlFde3Xmz43PS0OsmgY0/lg2nU3rUNca3zqRn//RfTrVOLi483oWbBlYFO/81ypsLAbxhtX
	Qk/mYO97I8s534ZsFArh/n1/nqtbcqOl0bVKSk/4VBNHSUIr6g9ysWcP2XFokOhGRLAmf6w/DUJ
	qeIt9ePXNaSvK9Q1+
X-Received: by 2002:a17:90b:5102:b0:398:9be6:f998 with SMTP id 98e67ed59e1d1-39aee16a180mr19981110a91.23.1788442281220;
        Thu, 03 Sep 2026 06:31:21 -0700 (PDT)
X-Received: by 2002:a17:90b:5102:b0:398:9be6:f998 with SMTP id 98e67ed59e1d1-39aee16a180mr19980948a91.23.1788442280416;
        Thu, 03 Sep 2026 06:31:20 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm5659399a91.13.2026.09.03.06.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:31:19 -0700 (PDT)
Message-ID: <1b845292-1117-458d-ab58-67c3e643ddc8@redhat.com>
Date: Thu, 3 Sep 2026 19:01:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec_file: remove unused arch_kexec_locate_mem_hole hook
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He
 <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Paul Walmsley <pjw@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
References: <20260827144452.508328-1-sourabhjain@linux.ibm.com>
 <d16164ef-7211-4272-bc74-bc38efd8623e@redhat.com>
 <f1c3c554-8500-45ef-953d-b7bcece988c7@linux.ibm.com>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <f1c3c554-8500-45ef-953d-b7bcece988c7@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k-p_xR7b5Vb4Vplfb0Qw9ofMCuflJ1WuAvinMHlXXCk_1788442281
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_063129_764724_B50AD46D 
X-CRM114-Status: GOOD (  26.10  )
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

SGkgU291cmFiaCwKCk9uIDI5LzA4LzI2IDEwOjI4IGFtLCBTb3VyYWJoIEphaW4gd3JvdGU6Cj4g
SGVsbG8gTXVrZXNoLAo+IAo+IE9uIDI4LzA4LzI2IDE4OjUwLCBNdWtlc2ggUGlsYW5peWEgd3Jv
dGU6Cj4+IEhpIFNvdXJhYmgsCj4+Cj4+IFRoZSBwYXRjaCB0b3VjaGVzIHRocmVlIGZpbGVzIGFj
cm9zcyB0aHJlZSBzdWJzeXN0ZW1zIHNvIGtleGVjOiB3b3VsZCBiZQo+PiBhIG1vcmUgYWNjdXJh
dGUgcHJlZml4IHRoYW4ga2V4ZWNfZmlsZSwgZm9yIGUuZy46Cj4+Cj4+IGtleGVjOiByZW1vdmUg
dW51c2VkIGFyY2hfa2V4ZWNfbG9jYXRlX21lbV9ob2xlIGhvb2sKPiAKPiBBcyBJIHVuZGVyc3Rh
bmQgaXQsIHRoZSBrZXhlYzogcHJlZml4IGlzIGdlbmVyYWxseSB1c2VkIHdoZW4gdGhlIGNoYW5n
ZXMKPiBhcHBseSB0byBib3RoCj4gdGhlIGtleGVjX2xvYWQgYW5kIGtleGVjX2ZpbGVfbG9hZCBz
eXNjYWxscy4KPiAKPiBTaW5jZSB0aGVzZSBjaGFuZ2VzIGFyZSBzcGVjaWZpYyB0byBrZXhlY19m
aWxlX2xvYWQsIEkgdXNlZCB0aGUKPiBrZXhlY19maWxlOiBwcmVmaXggZm9yIHRoZSBwYXRjaCB0
aXRsZS4KPiAKPiBUaGF0IHNhaWQsIEnigJltIGhhcHB5IHRvIGZvbGxvdyB0aGUgY29udmVudGlv
biBpZiB5b3UgYW5kIG90aGVycyBmZWVsIHRoZQo+IHBhdGNoIHNob3VsZCB1c2UgdGhlCj4ga2V4
ZWM6IHByZWZpeC4gT3RoZXJ3aXNlLCBJIHdvdWxkIHByZWZlciB0byBrZWVwIHRoZSBrZXhlY19m
aWxlOiBwcmVmaXguCj4KCllvdSdyZSByaWdodCwgSSBoYWRuJ3Qgbm90aWNlZCB0aGF0IHRoZSBo
b29rIGlzIGVudGlyZWx5IHdpdGhpbiB0aGUKQ09ORklHX0tFWEVDX0ZJTEUgYmxvY2sgYW5kIGJv
dGggY2FsbGVycyBhcmUgaW4gdGhlIGtleGVjX2ZpbGVfbG9hZApwYXRoLiBrZXhlY19maWxlOiBp
cyB0aGUgY29ycmVjdCBwcmVmaXggaGVyZS4gVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4K
Cj4gCj4+Cj4+IE9uIDI3LzA4LzI2IDg6MTQgcG0sIFNvdXJhYmggSmFpbiB3cm90ZToKPj4+IE5v
IGFyY2hpdGVjdHVyZSBwcm92aWRlcyBhbiBpbXBsZW1lbnRhdGlvbiBvZgo+Pj4gYXJjaF9rZXhl
Y19sb2NhdGVfbWVtX2hvbGUoKS4gVXNlIGtleGVjX2xvY2F0ZV9tZW1faG9sZSgpIGRpcmVjdGx5
Cj4+PiBhbmQgcmVtb3ZlIHRoZSB1bnVzZWQgZmFsbGJhY2sgd3JhcHBlciBmcm9tIHRoZSBrZXhl
YyBoZWFkZXIuCj4+Pgo+Pj4gVGhpcyBzaW1wbGlmaWVzIHRoZSBrZXhlYyBtZW1vcnkgYWxsb2Nh
dGlvbiBwYXRoIHdpdGhvdXQgY2hhbmdpbmcKPj4+IGl0cyBiZWhhdmlvci4KPj4+Cj4+IEFsc28s
IGl0IG1pZ2h0IGJlIHdvcnRoIG1lbnRpb25pbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHRoYXQg
dGhpcyBob29rCj4+IHdhcyBvcmlnaW5hbGx5IGludHJvZHVjZWQgYnkgY29tbWl0IGY4OTFmMTk3
MzZiZCBhbmQgdGhhdCB0aGUgbGFzdCBhcmNoCj4+IG92ZXJyaWRlIHdhcyByZW1vdmVkIGluIGNv
bW1pdCA2ZTUyNTBlYWE2NjU7IG1ha2luZyBpdCBzYWZlIHRvIHJlbW92ZQo+PiBub3cuCj4gCj4g
U3VyZSwgSSBkb27igJl0IG1pbmQgaW5jbHVkaW5nIHRoaXMgaW4gdjIuCj4gCj4gCj4+Cj4+IE90
aGVyd2lzZSwgdGhlIGNoYW5nZSBsb29rcyBnb29kIHRvIG1lLiBGZWVsIGZyZWUgdG8gYWRkOgo+
PiBSZXZpZXdlZC1ieTogTXVrZXNoIFBpbGFuaXlhIDxtcGlsYW5peUByZWRoYXQuY29tPgo+IAo+
IFRoYW5rcyBmb3IgdGhlIHJldmlldy4KPiAKPiAtIFNvdXJhYmggSmFpbgo+IAo+Pgo+Pj4gQ2M6
IEFsYmVydCBPdSA8YW91QGVlY3MuYmVya2VsZXkuZWR1Pgo+Pj4gQ2M6IEFuZHJldyBNb3J0b24g
PGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4+PiBDYzogQmFvcXVhbiBIZSA8YmFvcXVhbi5o
ZUBsaW51eC5kZXY+Cj4+PiBDYzogTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPgo+Pj4g
Q2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4+PiBDYzogUGFzaGEgVGF0
YXNoaW4gPHBhc2hhLnRhdGFzaGluQHNvbGVlbi5jb20+Cj4+PiBDYzogUGF1bCBXYWxtc2xleSA8
cGp3QGtlcm5lbC5vcmc+Cj4+PiBDYzogUHJhdHl1c2ggWWFkYXYgPHByYXR5dXNoQGtlcm5lbC5v
cmc+Cj4+PiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gQ2M6IGtleGVj
QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IFNpZ25lZC1vZmYtYnk6IFNvdXJhYmggSmFpbiA8c291
cmFiaGphaW5AbGludXguaWJtLmNvbT4KPj4+IC0tLQo+Pj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwv
a2V4ZWNfZWxmLmMgfMKgIDIgKy0KPj4+IMKgIGluY2x1ZGUvbGludXgva2V4ZWMuaMKgwqDCoMKg
wqDCoMKgwqAgfCAxNSAtLS0tLS0tLS0tLS0tLS0KPj4+IMKgIGtlcm5lbC9rZXhlY19maWxlLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+Pj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9rZXhlY19lbGYuYyBiL2FyY2gvcmlzY3Yva2VybmVsLwo+Pj4ga2V4ZWNfZWxm
LmMKPj4+IGluZGV4IDNlOWEzMmFjYjhmMi4uY2E1YWJiYWQ1OWU1IDEwMDY0NAo+Pj4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwva2V4ZWNfZWxmLmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L2tleGVjX2VsZi5jCj4+PiBAQCAtOTEsNyArOTEsNyBAQCBzdGF0aWMgaW50IGVsZl9maW5kX3Bi
YXNlKHN0cnVjdCBraW1hZ2UgKmltYWdlLAo+Pj4gdW5zaWduZWQgbG9uZyBrZXJuZWxfbGVuLAo+
Pj4gwqDCoMKgwqDCoCBrYnVmLm1lbXN6ID0gQUxJR04oa2VybmVsX2xlbiwgUEFHRV9TSVpFKTsK
Pj4+IMKgwqDCoMKgwqAga2J1Zi5jbWEgPSBOVUxMOwo+Pj4gwqDCoMKgwqDCoCBrYnVmLnRvcF9k
b3duID0gZmFsc2U7Cj4+PiAtwqDCoMKgIHJldCA9IGFyY2hfa2V4ZWNfbG9jYXRlX21lbV9ob2xl
KCZrYnVmKTsKPj4+ICvCoMKgwqAgcmV0ID0ga2V4ZWNfbG9jYXRlX21lbV9ob2xlKCZrYnVmKTsK
Pj4+IMKgwqDCoMKgwqAgaWYgKCFyZXQpIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqb2xkX3Bi
YXNlID0gbG93ZXN0X3BhZGRyOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICpuZXdfcGJhc2UgPSBr
YnVmLm1lbTsKPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2tleGVjLmggYi9pbmNsdWRl
L2xpbnV4L2tleGVjLmgKPj4+IGluZGV4IDBhZjhhZTRmZGQwOC4uZTVmMWNmYzExZmVmIDEwMDY0
NAo+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9rZXhlYy5oCj4+PiArKysgYi9pbmNsdWRlL2xpbnV4
L2tleGVjLmgKPj4+IEBAIC0yNTksMjEgKzI1OSw2IEBAIGludCBrZXhlY19rZXJuZWxfdmVyaWZ5
X3BlX3NpZyhjb25zdCBjaGFyCj4+PiAqa2VybmVsLCB1bnNpZ25lZCBsb25nIGtlcm5lbF9sZW4p
Owo+Pj4gwqAgZXh0ZXJuIGludCBrZXhlY19hZGRfYnVmZmVyKHN0cnVjdCBrZXhlY19idWYgKmti
dWYpOwo+Pj4gwqAgaW50IGtleGVjX2xvY2F0ZV9tZW1faG9sZShzdHJ1Y3Qga2V4ZWNfYnVmICpr
YnVmKTsKPj4+IMKgIC0jaWZuZGVmIGFyY2hfa2V4ZWNfbG9jYXRlX21lbV9ob2xlCj4+PiAtLyoq
Cj4+PiAtICogYXJjaF9rZXhlY19sb2NhdGVfbWVtX2hvbGUgLSBGaW5kIGZyZWUgbWVtb3J5IHRv
IHBsYWNlIHRoZSBzZWdtZW50cy4KPj4+IC0gKiBAa2J1ZjrCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQYXJhbWV0ZXJzIGZvciB0aGUgbWVtb3J5IHNlYXJjaC4K
Pj4+IC0gKgo+Pj4gLSAqIE9uIHN1Y2Nlc3MsIGtidWYtPm1lbSB3aWxsIGhhdmUgdGhlIHN0YXJ0
IGFkZHJlc3Mgb2YgdGhlIG1lbW9yeQo+Pj4gcmVnaW9uIGZvdW5kLgo+Pj4gLSAqCj4+PiAtICog
UmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIG5lZ2F0aXZlIGVycm5vIG9uIGVycm9yLgo+Pj4gLSAqLwo+
Pj4gLXN0YXRpYyBpbmxpbmUgaW50IGFyY2hfa2V4ZWNfbG9jYXRlX21lbV9ob2xlKHN0cnVjdCBr
ZXhlY19idWYgKmtidWYpCj4+PiAtewo+Pj4gLcKgwqDCoCByZXR1cm4ga2V4ZWNfbG9jYXRlX21l
bV9ob2xlKGtidWYpOwo+Pj4gLX0KPj4+IC0jZW5kaWYKPj4+IC0KPj4+IMKgICNpZm5kZWYgYXJj
aF9rZXhlY19hcHBseV9yZWxvY2F0aW9uc19hZGQKPj4+IMKgIC8qCj4+PiDCoMKgICogYXJjaF9r
ZXhlY19hcHBseV9yZWxvY2F0aW9uc19hZGQgLSBhcHBseSByZWxvY2F0aW9ucyBvZiB0eXBlIFJF
TEEKPj4+IGRpZmYgLS1naXQgYS9rZXJuZWwva2V4ZWNfZmlsZS5jIGIva2VybmVsL2tleGVjX2Zp
bGUuYwo+Pj4gaW5kZXggNTlmYjlkNzFlOWQ4Li45YTk4MTM1OWFkZGQgMTAwNjQ0Cj4+PiAtLS0g
YS9rZXJuZWwva2V4ZWNfZmlsZS5jCj4+PiArKysgYi9rZXJuZWwva2V4ZWNfZmlsZS5jCj4+PiBA
QCAtNzg0LDcgKzc4NCw3IEBAIGludCBrZXhlY19hZGRfYnVmZmVyKHN0cnVjdCBrZXhlY19idWYg
KmtidWYpCj4+PiDCoMKgwqDCoMKgIGtidWYtPmNtYSA9IE5VTEw7Cj4+PiDCoCDCoMKgwqDCoMKg
IC8qIFdhbGsgdGhlIFJBTSByYW5nZXMgYW5kIGFsbG9jYXRlIGEgc3VpdGFibGUgcmFuZ2UgZm9y
IHRoZQo+Pj4gYnVmZmVyICovCj4+PiAtwqDCoMKgIHJldCA9IGFyY2hfa2V4ZWNfbG9jYXRlX21l
bV9ob2xlKGtidWYpOwo+Pj4gK8KgwqDCoCByZXQgPSBrZXhlY19sb2NhdGVfbWVtX2hvbGUoa2J1
Zik7Cj4+PiDCoMKgwqDCoMKgIGlmIChyZXQpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IHJldDsKPj4+IMKgIAo+IAoKLS0gClJlZ2FyZHMsCk11a2VzaCBQaWxhbml5YQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
