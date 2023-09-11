Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32133EE7FF4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Sep 2023 13:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R83zD6Di0zbebKL3vMUNhkX2n8PeQhBchEpcCCEkN08=; b=lJzmA7nTi9d/Qi
	YiCgJtOysXpBCyZc9UMDYNBi9X7YgvxPHCc7E5jZ7U7v/T/IgDxl7wAgY+ReMAO3DbL235b14NKkX
	J+uV5Oghnw7QDMYCRVCpxDbIb7aY0oqz7lSFkHqEzcMnxrZKgefFGHJTAh7CCQhIlmG6aif2VSDO+
	MPhbjfBQRgoK39UP8bm02AWtxHZ95mldP50vIwrPBhHfM5q9D7XiNAPrkBN30UA/ChEK/iWFbzKlf
	jLQJ9ZrNDvNn5xzU+JHL64fK1IYor1HutZ61AfDmlRrzs1q2pBpanr6iNFVRfRzOgvZjqP2ezzyXy
	Tf1K9MJJIDoObpBld0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgZe-000Ym8-1C;
	Mon, 11 Sep 2023 13:03:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfgZb-000YlH-1d
	for linux-riscv@lists.infradead.org;
	Mon, 11 Sep 2023 13:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694437406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VSJPoGx10J6x6+0exgf8zlMMy8M925rAu1G76vFf9bs=;
	b=ddtpiiMpoYS6qXRmCWVNVsI78uGqlrmMRsOA/+vBKG/cmXcWyLO3HJjkXWh4jWG3aJwEj2
	uqDsFViJNTHvVP7kZ3MWo8kv7YbLRlDh/WgR8n/iNcPZiBuB22hTbYZNCC/5aqkWOauMS4
	hkiqAVHe+91tYlVuMQISzN8jg6GRSO0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-HRl8HX2aMzS5sXQtod1MAA-1; Mon, 11 Sep 2023 09:03:23 -0400
X-MC-Unique: HRl8HX2aMzS5sXQtod1MAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E90643C1DC25;
	Mon, 11 Sep 2023 13:03:21 +0000 (UTC)
Received: from [10.22.32.237] (unknown [10.22.32.237])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 460CC40C6EA8;
	Mon, 11 Sep 2023 13:03:20 +0000 (UTC)
Message-ID: <06714da1-d566-766f-7a13-a3c93b5953c4@redhat.com>
Date: Mon, 11 Sep 2023 09:03:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V11 04/17] locking/qspinlock: Improve xchg_tail for number
 of cpus >= 16k
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
 boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org,
 rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com,
 conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
 alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com,
 ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com,
 wuwei2016@iscas.ac.cn, leobras@redhat.com, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-5-guoren@kernel.org>
 <f091ead0-99b9-b30a-a295-730ce321ac60@redhat.com>
 <CAJF2gTSbUUdLhN8PFdFzQd0M1T2MVOL1cdZn46WKq1S8MuQYHw@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <CAJF2gTSbUUdLhN8PFdFzQd0M1T2MVOL1cdZn46WKq1S8MuQYHw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_060327_657753_A1C6BCF7 
X-CRM114-Status: GOOD (  22.72  )
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

T24gOS8xMC8yMyAyMzowOSwgR3VvIFJlbiB3cm90ZToKPiBPbiBNb24sIFNlcCAxMSwgMjAyMyBh
dCAxMDozNeKAr0FNIFdhaW1hbiBMb25nIDxsb25nbWFuQHJlZGhhdC5jb20+IHdyb3RlOgo+Pgo+
PiBPbiA5LzEwLzIzIDA0OjI4LCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPj4+IEZyb206IEd1
byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPj4+Cj4+PiBUaGUgdGFyZ2V0IG9mIHhj
aGdfdGFpbCBpcyB0byB3cml0ZSB0aGUgdGFpbCB0byB0aGUgbG9jayB2YWx1ZSwgc28KPj4+IGFk
ZGluZyBwcmVmZXRjaHcgY291bGQgaGVscCB0aGUgbmV4dCBjbXB4Y2hnIHN0ZXAsIHdoaWNoIG1h
eQo+Pj4gZGVjcmVhc2UgdGhlIGNtcHhjaGcgcmV0cnkgbG9vcHMgb2YgeGNoZ190YWlsLiBTb21l
IHByb2Nlc3NvcnMgbWF5Cj4+PiB1dGlsaXplIHRoaXMgZmVhdHVyZSB0byBnaXZlIGEgZm9yd2Fy
ZCBndWFyYW50ZWUsIGUuZy4sIFJJU0MtVgo+Pj4gWHVhblRpZSBwcm9jZXNzb3JzIHdvdWxkIGJs
b2NrIHRoZSBzbm9vcCBjaGFubmVsICYgaXJxIGZvciBzZXZlcmFsCj4+PiBjeWNsZXMgd2hlbiBw
cmVmZXRjaC53IGluc3RydWN0aW9uIChmcm9tIFppY2JvcCBleHRlbnNpb24pIHJldGlyZWQsCj4+
PiB3aGljaCBndWFyYW50ZWVzIHRoZSBuZXh0IGNtcHhjaGcgc3VjY2VlZHMuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4gU2lnbmVk
LW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+PiAtLS0KPj4+ICAgIGtlcm5l
bC9sb2NraW5nL3FzcGlubG9jay5jIHwgNSArKysrLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9rZXJuZWwv
bG9ja2luZy9xc3BpbmxvY2suYyBiL2tlcm5lbC9sb2NraW5nL3FzcGlubG9jay5jCj4+PiBpbmRl
eCBkM2Y5OTA2MGI2MGYuLjk2YjU0ZTJhZGU4NiAxMDA2NDQKPj4+IC0tLSBhL2tlcm5lbC9sb2Nr
aW5nL3FzcGlubG9jay5jCj4+PiArKysgYi9rZXJuZWwvbG9ja2luZy9xc3BpbmxvY2suYwo+Pj4g
QEAgLTIyMyw3ICsyMjMsMTAgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGNsZWFyX3Bl
bmRpbmdfc2V0X2xvY2tlZChzdHJ1Y3QgcXNwaW5sb2NrICpsb2NrKQo+Pj4gICAgICovCj4+PiAg
ICBzdGF0aWMgX19hbHdheXNfaW5saW5lIHUzMiB4Y2hnX3RhaWwoc3RydWN0IHFzcGlubG9jayAq
bG9jaywgdTMyIHRhaWwpCj4+PiAgICB7Cj4+PiAtICAgICB1MzIgb2xkLCBuZXcsIHZhbCA9IGF0
b21pY19yZWFkKCZsb2NrLT52YWwpOwo+Pj4gKyAgICAgdTMyIG9sZCwgbmV3LCB2YWw7Cj4+PiAr
Cj4+PiArICAgICBwcmVmZXRjaHcoJmxvY2stPnZhbCk7Cj4+PiArICAgICB2YWwgPSBhdG9taWNf
cmVhZCgmbG9jay0+dmFsKTsKPj4+Cj4+PiAgICAgICAgZm9yICg7Oykgewo+Pj4gICAgICAgICAg
ICAgICAgbmV3ID0gKHZhbCAmIF9RX0xPQ0tFRF9QRU5ESU5HX01BU0spIHwgdGFpbDsKPj4gVGhh
dCBsb29rcyBhIGJpdCB3ZWlyZC4gWW91IHByZS1mZXRjaCBhbmQgdGhlbiBpbW1lZGlhdGVseSBy
ZWFkIGl0LiBIb3cKPj4gbXVjaCBwZXJmb3JtYW5jZSBnYWluIHlvdSBnZXQgYnkgdGhpcyBjaGFu
Z2UgYWxvbmU/Cj4+Cj4+IE1heWJlIHlvdSBjYW4gZGVmaW5lIGFuIGFyY2ggc3BlY2lmaWMgcHJp
bWl0aXZlIHRoYXQgZGVmYXVsdCBiYWNrIHRvCj4+IGF0b21pY19yZWFkKCkgaWYgbm90IGRlZmlu
ZWQuCj4gVGh4IGZvciB0aGUgcmVwbHkuIFRoaXMgaXMgYSBnZW5lcmljIG9wdGltaXphdGlvbiBw
b2ludCBJIHdvdWxkIGxpa2UKPiB0byB0YWxrIGFib3V0IHdpdGggeW91Lgo+Cj4gRmlyc3QsIHBy
ZWZldGNodygpIG1ha2VzIGNhY2hlbGluZSBhbiBleGNsdXNpdmUgc3RhdGUgYW5kIHNlcnZlcyBm
b3IKPiB0aGUgbmV4dCBjbXB4Y2hnIGxvb3Agc2VtYW50aWMsIHdoaWNoIHdyaXRlcyB0aGUgaWR4
X3RhaWwgcGFydCBvZgo+IGFyY2hfc3Bpbl9sb2NrLiBUaGUgYXRvbWljX3JlYWQgb25seSBtYWtl
cyBjYWNoZWxpbmUgaW4gdGhlIHNoYXJlZAo+IHN0YXRlLCB3aGljaCBjb3VsZG4ndCBnaXZlIGFu
eSBndWFyYW50ZWUgZm9yIHRoZSBuZXh0IGNtcHhjaGcgbG9vcAo+IHNlbWFudGljLiBNaWNyby1h
cmNoaXRlY3R1cmUgY291bGQgdXRpbGl6ZSBwcmVmZXRjaHcoKSB0byBwcm92aWRlIGEKPiBzdHJv
bmcgZm9yd2FyZCBwcm9ncmVzcyBndWFyYW50ZWUgZm9yIHRoZSB4Y2hnX3RhaWwsIGUuZy4sIHRo
ZSBULUhFQUQKPiBYdWFuVGllIHByb2Nlc3NvciB3b3VsZCBob2xkIHRoZSBleGNsdXNpdmUgY2Fj
aGVsaW5lIHN0YXRlIHVudGlsIHRoZQo+IG5leHQgY21weGNoZyB3cml0ZSBzdWNjZXNzLgo+Cj4g
SW4gdGhlIGVuZCwgTGV0J3MgZ28gYmFjayB0byB0aGUgcHJpbmNpcGxlOiB0aGUgeGNoZ190YWls
IGlzIGFuIGF0b21pYwo+IHN3YXAgb3BlcmF0aW9uIHRoYXQgY29udGFpbnMgd3JpdGUgZXZlbnR1
YWxseSwgc28gZ2l2aW5nIGEgcHJlZmV0Y2h3KCkKPiBhdCB0aGUgYmVnaW5uaW5nIGlzIGFjY2Vw
dGFibGUgZm9yIGFsbCBhcmNoaXRlY3R1cmVzLi4KPiDigKLigKLigKLigKLigKLigKLigKLigKLi
gKLigKLigKLigKIKCkkgZGlkIHJlYWxpemUgYWZ0ZXJ3YXJkIHRoYXQgcHJlZmV0Y2h3IGdldHMg
dGhlIGNhY2hlbGluZSBpbiBleGNsdXNpdmUgCnN0YXRlLiBJIHdpbGwgc3VnZ2VzdCB5b3UgbWVu
dGlvbiB0aGF0IGluIHlvdXIgY29tbWl0IGxvZyBhcyB3ZWxsIGFzIAphZGRpbmcgYSBjb21tZW50
IGFib3V0IGl0cyBwdXJwb3NlIGluIHRoZSBjb2RlLgoKVGhhbmtzLApMb25nbWFuCgo+PiBDaGVl
cnMsCj4+IExvbmdtYW4KPj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
