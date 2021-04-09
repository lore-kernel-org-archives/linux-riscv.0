Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2364AC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 10:03:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A67F061177
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 10:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A67F061177
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lF4384Rwd28tjVcOYYUP43GAEgEmM1QQhCQrKZOs5qQ=; b=LAP+Dw+BTT5C0uHmNGauN+00N
	DIL2yT6wwcmavdSsGp9ggU9Wucg2/eGy+qRodWpniHBJ9koh7IriPPnRZBJklYPfhTmmqTey69nnO
	l5EQJ882Haoed03H3YIgc4RtMocXJdeo6VDobcHTtPi3jQPYNGg9zOTZdlAIJK0R3W3JnXsVe1sWu
	zuVNlQbJaoh3Vf99S82MDSS7M6BcpOz/0hOG6TpreFYYv+rdMSZzp3w21IMoQPYWxRPQ2t6PJN6sx
	adDyXLE1AkTu9jxtGsj9cRwTik6rSDxeI8QQU78Ox3qGFeE8j3n0Jz+JZDxAoMt390R87wnOlNY1Q
	ZnCf0Wp0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUnyk-000M1D-GA; Fri, 09 Apr 2021 10:03:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUnyh-000M0j-4t
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 10:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=uDnQJG/yO04oB5gfQ9DPSH+Kgk0i1SOwBoZhHUlMEbE=; b=WRylNnz/e2ijO/KcF3+VusTguQ
 xCFpLs5lWOliJQQr6UF/FKYDhnGKRLN0yVjZmOIUf7rpHX1dT9NMYuGyMMgVAcLxW+ulfVqKG6rmw
 j7UaFhPQ5jVC4BfexLJNd4sDnT8uGjg/SeR7nx23K6vH1X1G2f2rWY8nF3ZWIoveqeFvhu+c+9TcS
 OkwNZ9Kvzkvmp/cKncPhxoHMQ1wiZXtD83bnB+2OlO8KwdaYnQo5N9AtIZWh1cSdZi1kYTYV5YIQx
 8lHwuCEx1Lr+REZmUodSxKHyryn4c0q6NSMrD2vhNvp4nzGEOulgsGFP3kIoqaXBRaEk+u/HTPcuB
 3Zmk53qA==;
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUnyd-0049Qn-M7
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 10:03:01 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 139A2lQb021800
 for <linux-riscv@lists.infradead.org>; Fri, 9 Apr 2021 13:02:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1617962562; x=1620554562;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WXa9Zk1u14pWpGyUOTh6z8lc5xIgB/2jhhzZywlsrbM=;
 b=I/wJR2e5YPg1JE7lEuQQJ+/4z9fwYqjufaAljkovZx1oi064jQch+zU5hVsdLmCY
 z0t3Dh7MuyZOQSMeDdhHMn/IiG0GYTHRTGFz6VjX4PvaUcWlDbcEsg9ESNPkL5ny
 tQCVm+ppmctYFNdIMJbhJXrzo88oRG2mpXMuEUgZC5z5scur25/N34Up1tsjl04Y
 O3Aq/aToMsA6+2AD/5TJrG9Fi+F+LmW4axno2mAoedlMn8TwdzIh99LtBpiYTvqw
 reZzmhs4wyZbG8ao3pc1nxOqDiEyJWoEUD5ruHbUhVCHtNZWDhM6uZGyiLHlw4LA
 BnEuPxTNMAtDqorkLkF0SQ==;
X-AuditID: 8b5b014d-a4c337000000209f-8e-6070264291d6
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 F5.00.08351.24620706; Fri,  9 Apr 2021 13:02:42 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 09 Apr 2021 13:02:41 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Rob Herring <robh@kernel.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] RISC-V: Add kexec/kdump support
Organization: FORTH
In-Reply-To: <20210407162927.GA3836121@robh.at.kernel.org>
References: <20210405085712.1953848-1-mick@ics.forth.gr>
 <20210407162927.GA3836121@robh.at.kernel.org>
Message-ID: <77c532ea311ef731b3e6f9389b3d408c@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsXSHT1dWddJrSDBoO8Fl8XlXXPYLLZ9bmGz
 aH53jt3i5eUeZou2WfwW//fsYHdg83jz8iWLx8NNl5g8Nq3qZPPYvKTe41LzdXaPz5vkAtii
 uGxSUnMyy1KL9O0SuDI+zXjNVvBXueLr/geMDYxPZboYOTkkBEwkFtx7wdLFyMUhJHCUUWLz
 uhWsEAlTidl7OxlBbF4BQYmTM5+wgNjMAhYSU6/sZ4Sw5SWat85m7mLk4GARUJU49qwSJMwm
 oCkx/9JBsHIRAUWJ323TWEHmMwssY5TYeHwFM0hCWMBa4uPaQ2BF/ALCEp/uXgTbyylgJbHj
 4E9WkJlCAhkS09vEIU5wkejtv80CcZqKxIffD9hBSkSB7M1zlSYwCs5CcugsJIfOQnLoAkbm
 VYwCiWXGepnJxXpp+UUlGXrpRZsYwaHO6LuD8fbmt3qHGJk4GA8xSnAwK4nwNjfnJwjxpiRW
 VqUW5ccXleakFh9ilOZgURLn5dWbEC8kkJ5YkpqdmlqQWgSTZeLglGpgiuFZ9ObILuPb+T3V
 m3yTDy7vOnrF2kzoI0PLSuMMz7MLOHflPdl50W2Zadqsl8l79QrLL83bde3UxUcrdb8lnnTI
 Oe389sSny+lGDDMkYq4wRB6skbmVd7j2+g7BgxN+8bx9tV3Q8reMQEHhqw9p2/6+0rrDP/vq
 xdX3LP4l/a2/vUPUxHvNr9CFyUqRF27umyPPft3EbK7/j7b2LvXe1RtX3GXSbj6jqpygJuvv
 prK0bEbQpeqQTQ2J/6485o2T50hwuWX+sqw91bm7o3HS9xrWm10eR+4m3NMxLfI/2K9h8f19
 /MaU5CI+n6l5///tPiNxWmZJDBNb5N30j13f+9/5b9OJ+7dw3sf0CJN9kkosxRmJhlrMRcWJ
 AHTvokHkAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_030300_122302_E31B49BD 
X-CRM114-Status: GOOD (  31.67  )
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

zqPPhM65z4IgMjAyMS0wNC0wNyAxOToyOSwgUm9iIEhlcnJpbmcgzq3Os8+BzrHPiM61Ogo+IE9u
IE1vbiwgQXByIDA1LCAyMDIxIGF0IDExOjU3OjA3QU0gKzAzMDAsIE5pY2sgS29zc2lmaWRpcyB3
cm90ZToKPj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBrZXhlYy9rZHVtcCBhbmQgY3Jhc2gga2Vy
bmVsCj4+IHN1cHBvcnQgb24gUklTQy1WLiBGb3IgdGVzdGluZyB0aGUgcGF0Y2hlcyBhIHBhdGNo
ZWQKPj4gdmVyc2lvbiBvZiBrZXhlYy10b29scyBpcyBuZWVkZWQgKHN0aWxsIGEgd29yayBpbgo+
PiBwcm9ncmVzcykgd2hpY2ggY2FuIGJlIGZvdW5kIGF0Ogo+PiAKPj4gaHR0cHM6Ly9yaXNjdi5p
Y3MuZm9ydGguZ3Iva2V4ZWMtdG9vbHMtcGF0Y2hlZC50YXIueHoKPj4gCj4+IHYzOgo+PiAgKiBS
ZWJhc2Ugb24gbmV3ZXIga2VybmVsIHRyZWUKPj4gICogTWlub3IgY2xlYW51cHMKPj4gICogU3Bs
aXQgVUFQSSBjaGFuZ2VzIHRvIGEgc2VwYXJhdGUgcGF0Y2gKPj4gICogSW1wcm92ZSAvIGNsZWFu
dXAgaW5pdF9yZXNvdXJjZXMKPj4gICogUmVzb2x2ZSBQYWxtZXIncyBjb21tZW50cwo+PiAKPj4g
djI6Cj4+ICAqIFJlYmFzZSBvbiBuZXdlciBrZXJuZWwgdHJlZQo+PiAgKiBNaW5vciBjbGVhbnVw
cwo+PiAgKiBQcm9wZXJseSBwb3B1bGF0ZSB0aGUgaW9yZXNvdXJjZXMgdHJlLCBzbyB0aGF0IGl0
Cj4+ICAgIGNhbiBiZSB1c2VkIGxhdGVyIG9uIGZvciBpbXBsZW1lbnRpbmcgc3RyaWN0IC9kZXYv
bWVtCj4+ICAqIFVzZSBsaW51eCx1c2FibGUtbWVtb3J5IG9uIC9tZW1vcnkgaW5zdGVhZCBvZiBh
IG5ldyBiaW5kaW5nCj4gCj4gV2hlcmU/IEluIGFueSBjYXNlLCB0aGF0J3Mgbm90IGdvaW5nIHRv
IHdvcmsgd2VsbCB3aXRoIEVGSSBzdXBwb3J0Cj4gYXNzdW1pbmcgbGlrZSBhcm02NCwgJ21lbW9y
eScgaXMgcGFzc2VkIGluIFVFRkkgc3RydWN0dXJlcyBpbnN0ZWFkIG9mCj4gRFQuIFRoYXQncyB3
aHkgdGhlcmUncyBub3cgYSAvY2hvc2VuIGxpbnV4LHVzYWJsZS1tZW1vcnktcmFuZ2VzCj4gcHJv
cGVydHkuCj4gCgpIZXJlOgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xMi1y
YzUvc291cmNlL2RyaXZlcnMvb2YvZmR0LmMjTDEwMDEKClRoZSAibGludXgsdXNhYmxlLW1lbW9y
eSIgYmluZGluZyBpcyBhbHJlYWR5IGRlZmluZWQgYW5kIGlzIHBhcnQgb2YKZWFybHlfaW5pdF9k
dF9zY2FuX21lbW9yeSgpIHdoaWNoIHdlIGNhbGwgb24gbW0vaW5pdC5jIHRvIGRldGVybWluZQpz
eXN0ZW0ncyBtZW1vcnkgbGF5b3V0LiBJdCdzIHNpbXBsZSwgY2xlYW4gYW5kIEkgZG9uJ3Qgc2Vl
IGEgcmVhc29uCnRvIHVzZSBhbm90aGVyIGJpbmRpbmcgb24gL2Nob3NlbiBhbmQgYWRkIGV4dHJh
IGNvZGUgZm9yIHRoaXMsIHdoZW4Kd2UgYWxyZWFkeSBoYW5kbGUgaXQgb24gZWFybHlfaW5pdF9k
dF9zY2FuX21lbW9yeSgpIGFueXdheS4gQXMgZm9yCkVGSSwgZXZlbiB3aGVuIGVuYWJsZWQsIHdl
IHN0aWxsIHVzZSBEVCB0byBkZXRlcm1pbmUgc3lzdGVtIG1lbW9yeQpsYXlvdXQsIG5vdCBFRkkg
c3RydWN0dXJlcywgcGx1cyBJIGRvbid0IHNlZSBob3cgRUZJIGlzIHJlbGV2YW50CmhlcmUsIHRo
ZSBib290bG9hZGVyIGluIGtleGVjJ3MgY2FzZSBpcyBMaW51eCwgbm90IEVGSS4gQlRXIHRoZSAv
bWVtb3J5Cm5vZGUgaXMgbWFuZGF0b3J5IGluIGFueSBjYXNlLCBpdCBzaG91bGQgZXhpc3Qgb24g
RFQgcmVnYXJkbGVzcyBvZiBFRkksCi9jaG9zZW4gbm9kZSBvbiB0aGUgb3RoZXIgaGFuZCBpcyAt
aW4gZ2VuZXJhbC0gb3B0aW9uYWwsIGFuZCB3ZSBjYW4gCnN0aWxsCmJvb3QgYSByaXNjdiBzeXN0
ZW0gd2l0aG91dCAvY2hvc2VuIG5vZGUgcHJlc2VudCAod2Ugb25seSByZXF1aXJlIGl0IGZvcgp0
aGUgYnVpbHQtaW4gY21kbGluZSB0byB3b3JrKS4KCkFsc28gYSBzaW1wbGUgZ3JlcCBmb3IgImxp
bnV4LHVzYWJsZS1tZW1vcnktcmFuZ2VzIiBvbiB0aGUgbGF0ZXN0IGtlcm5lbApzb3VyY2VzIGRp
ZG4ndCByZXR1cm4gYW55dGhpbmcsIHRoZXJlIGlzIGFsc28gbm90aGluZyBvbiBjaG9zZW4udHh0
LCAKd2hlcmUKaXMgdGhhdCBiaW5kaW5nIGRvY3VtZW50ZWQvaW1wbGVtZW50ZWQgPwoKPiBJc24n
dCB0aGUgcHJlZmVycmVkIGtleGVjIGludGVyZmFjZSB0aGUgZmlsZSBiYXNlZCBpbnRlcmZhY2U/
IEknZAo+IGV4cGVjdCBhIG5ldyBhcmNoIHRvIG9ubHkgc3VwcG9ydCB0aGF0LiBBbmQgdGhlcmUn
cyBjb21tb24ga2V4ZWMgRFQKPiBoYW5kbGluZyBmb3IgdGhhdCBwZW5kaW5nIGZvciA1LjEzLgo+
IAoKQm90aCBhcHByb2FjaGVzIGhhdmUgdGhlaXIgcHJvcyBhbiBjb25zLCB0aGF0J3Mgd2h5IGJv
dGggYXJlIGF2YWlsYWJsZSwgCmluIG5vCndheSBDT05GSUdfS0VYRUMgaXMgZGVwcmVjYXRlZCBp
biBmYXZvciBvZiBDT05GSUdfS0VYRUNfRklMRSwgYXQgbGVhc3QgCm5vdCBhcwpmYXIgYXMgSSBr
bm93LiBUaGUgbWFpbiBwb2ludCBmb3IgdGhlIGZpbGUtYmFzZWQgc3lzY2FsbCBpcyB0byBzdXBw
b3J0IApzZWN1cmUKYm9vdCwgc2luY2UgdGhlIGltYWdlIGlzIGxvYWRlZCBieSB0aGUga2VybmVs
IGRpcmVjdGx5IHdpdGhvdXQgYW55IApwcm9jZXNzaW5nCmJ5IHRoZSB1c2Vyc3BhY2UgdG9vbHMs
IHNvIGl0IGNhbiBiZSBwcmUtc2lnbmVkIGJ5IHRoZSBrZXJuZWwncyAKInZlbmRvciIuIE9uCnRo
ZSBvdGhlciBoYW5kLCB0aGUga2VybmVsIHBhcnQgaXMgbW9yZSBjb21wbGljYXRlZCBhbmQgeW91
IGNhbid0IHBhc3MgYSAKbmV3CmRldmljZSB0cmVlLCB0aGUga2VybmVsIG5lZWRzIHRvIHJlLXVz
ZSB0aGUgZXhpc3Rpbmcgb25lIChvciBtb2RpZnkgaXQKaW4ta2VybmVsKSwgeW91IGNhbiBvbmx5
IG92ZXJyaWRlIHRoZSBjbWRsaW5lLgoKVGhpcyBkb2Vzbid0IHdvcmsgZm9yIG91ciB1c2UgY2Fz
ZXMgaW4gRk9SVEgsIHdoZXJlIHdlIHVzZSBrZXhlYyBub3QgCm9ubHkgdG8KcmUtYm9vdCBvdXIg
c3lzdGVtcywgYnV0IGFsc28gdG8gYm9vdCB0byBhIHN5c3RlbSB3aXRoIGRpZmZlcmVudCBodyAK
bGF5b3V0CihlLmcuIEZQR0EgcHJvdG90eXBlcyBvciBzeXN0ZW1zIHdpdGggRlBHQXMgb24gdGhl
IHNpZGUpLCBkZXZpY2UgdHJlZSAKb3ZlcmxheXMKYWxzbyBkb24ndCBjb3ZlciBvdXIgdXNlIGNh
c2VzLiBUbyBnaXZlIHlvdSBhbiBpZGVhIHdlIGNhbiAKYWRkL3JlbW92ZS9tb2RpZnkKZGV2aWNl
cywgbW92ZSB0aGVtIHRvIGFub3RoZXIgcmVnaW9uIGV0YyBhbmQgc3RpbGwgdXNlIGtleGVjIHRv
IGF2b2lkIApnb2luZwp0aHJvdWdoIHRoZSBmdWxsIGJvb3QgY3ljbGUuIFdlIGp1c3QgdW5sb2Fk
IHRoZWlyIGRyaXZlcnMsIHBlcmZvcm0gYSAKZnVsbCBvcgpwYXJ0aWFsIHJlLXByb2dyYW1taW5n
IG9mIHRoZSBGUEdBIGZyb20gd2l0aGluIExpbnV4LCBhbmQga2V4ZWMgdG8gdGhlIApuZXcKc3lz
dGVtIHdpdGggdGhlIG5ldyBkZXZpY2UgdHJlZS4gVGhlIGZpbGUtYmFzZWQgc3lzY2FsbCBjYW4n
dCBjb3ZlciB0aGlzCnNjZW5hcmlvLCBpbiBnZW5lcmFsIGl0J3MgbGVzcyBmbGV4aWJsZSBhbmQg
aXQncyBvbmx5IHRoZXJlIGZvciBzZWN1cmUgCmJvb3QsCm5vdCBmb3IgdXNpbmcgY3VzdG9tLWJ1
aWx0IGtlcm5lbHMsIG5vciBjdXN0b20gZGV2aWNlIHRyZWUgaW1hZ2VzLgoKU2VjdXJpdHktd2lz
ZSB0aGUgZmlsZSBsb2FkIHN5c2NhbGwgcHJvdmlkZXMgZ3VhcmFudGVlcyBmb3IgaW50ZWdyaXR5
IAphbmQKYXV0aGVudGljaXR5LCBidXQgZGVwZW5kaW5nIG9uIHRoZSBrZXJuZWwgInZlbmRvciIn
cyBpbmZyYXN0cnVjdHVyZSBhbmQKc2lnbmluZyBwcm9jZXNzIHRoaXMgbWF5IGFsbG93IGUuZy4g
dG8gbG9hZCBhbiBvbGRlci92dWxuZXJhYmxlIGtlcm5lbCAKdGhyb3VnaAprZXhlYyBhbmQgZ2V0
IGF3YXkgd2l0aCBpdCwgdGhlcmUgaXMgbm8gY2hlY2sgYXMgZmFyIGFzIEkga25vdyAgdG8gbWFr
ZSAKc3VyZQp0aGUgbG9hZGVkIGtlcm5lbCBpcyBhdCBsZWFzdCBhcyBvbGQgYXMgdGhlIHJ1bm5p
bmcga2VybmVsLCB0aGUgCmFzc3VtcHRpb24gaXMKdGhhdCB0aGUgInZlbmRvciIgd2lsbCB1c2Ug
YSBkaWZmZXJlbnQgc2lnbmluZyBrZXkvY2VydCBmb3IgZWFjaCBrZXJuZWwgCmFuZAp0aGF0IHlv
dSdsbCBrZXhlYyB0byBhIGtlcm5lbC9jcmFzaCBrZXJuZWwgdGhhdCdzIHRoZSBzYW1lIHZlcnNp
b24gYXMgCnRoZQpydW5uaW5nIG9uZS4gVW50aWwgd2UgaGF2ZSBjbGVhciBndWlkZWxpbmVzIG9u
IGhvdyB0aGlzIGlzIG1lYW50IHRvIGJlIAp1c2VkCmFuZCBoYXZlIGEgZGlzY3Vzc2lvbiBvbiBz
ZWN1cmUgYm9vdCB3aXRoaW4gUklTQy1WICh3ZSBoYXZlIHNvbWV0aGluZyBvbgp0aGUgVEVFIFRH
IGJ1dCB3ZSdsbCBwcm9iYWJseSBzd2l0Y2ggdG8gYSBTSUcgY29tbWl0dGVlIGZvciB0aGlzKSwg
SSAKZG9uJ3QKc2VlIGhvdyB0aGlzIGZlYXR1cmUgaXMgYSBwcmlvcml0eSBjb21wYXJlZCB0byB0
aGUgbW9yZSBnZW5lcmljIApDT05GSUdfS0VYRUMuCgpSZWdhcmRzLApOaWNrCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
