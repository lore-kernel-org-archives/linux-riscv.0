Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A96EEAA5C
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 17:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTKXon+LcNoovRP7nfdCviIqhcFm9Ye/0h1Lwe491jY=; b=dj7tVIhVZwD5yB
	kd6ediIXzjQCJQ8l9/HnjWtYFLoG5tc61CBR1tid9jCbsKVPnrRK49Qfdfdt6es+nTCwNnz4SfJXA
	N4cewx+DdunTtJDzocuhmsV8Al9iylvuxh0UNrGLcZb/my/A8/HlwfE9eRf50k+w27lbhsf4/cx0P
	+qaF9lBXpqjatL00APkZ3qcJh7VQL2o0wWSwAS6kdn6kmFNapTLVmP/KyMSzvouRG+PZtt1gG7wT5
	hNOZRXthAOpQbnu8Nsp+9eALEkG3NJf5PY6XeHtyzkzNSbPY8FnbvcZ2a7KZ1WDd/Mw1N3PL+O7Cq
	j0hP2Qbp+ESslmPyIgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgq4W-008zIi-08;
	Thu, 14 Sep 2023 17:24:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgq4S-008zHf-2p
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 17:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694712243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0ikbkJVQghcPjJgsQrA+sUTUrPSvE6Jh+YB8KXgR/g=;
	b=K5qusLIIZLZWsuv9t5WhgEYusKpD1NDoIrdxcFy5WmRpfSxoxJdGGKTjkIf5hyxTM74dsD
	AwKkz/Hi9zw4H3hvrNkA6MIdKcEIssuVoabJwadQ1UKr6z3yMBMlIdNplyOy/X2hCqTTyV
	i51eImcsH86bQIhhB9oeYfsnHj6AFSs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-mt1uKXGTNm6m770irEEv9Q-1; Thu, 14 Sep 2023 13:24:02 -0400
X-MC-Unique: mt1uKXGTNm6m770irEEv9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1F4684ACAA;
	Thu, 14 Sep 2023 17:24:00 +0000 (UTC)
Received: from [10.22.34.133] (unknown [10.22.34.133])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5003640C2070;
	Thu, 14 Sep 2023 17:23:57 +0000 (UTC)
Message-ID: <fb7d6e67-f396-dfe7-1461-8790bdeaad01@redhat.com>
Date: Thu, 14 Sep 2023 13:23:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V11 07/17] riscv: qspinlock: Introduce qspinlock param for
 command line
Content-Language: en-US
To: Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
 boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org,
 rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com,
 conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
 alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com,
 ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com,
 wuwei2016@iscas.ac.cn, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-8-guoren@kernel.org>
 <5ba0b8f3-f8f5-3a25-e9b7-f29a1abe654a@redhat.com>
 <CAJF2gTT2hRxgnQt+WJ9P0YBWnUaZJ1-9g3ZE9tOz_MiLSsUjwQ@mail.gmail.com>
 <ZQK2-CIL9U_QdMjh@redhat.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZQK2-CIL9U_QdMjh@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_102404_985009_7B420554 
X-CRM114-Status: GOOD (  21.93  )
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

T24gOS8xNC8yMyAwMzozMiwgTGVvbmFyZG8gQnJhcyB3cm90ZToKPiBPbiBUdWUsIFNlcCAxMiwg
MjAyMyBhdCAwOTowODozNEFNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+PiBPbiBNb24sIFNlcCAx
MSwgMjAyMyBhdCAxMTozNOKAr1BNIFdhaW1hbiBMb25nIDxsb25nbWFuQHJlZGhhdC5jb20+IHdy
b3RlOgo+Pj4gT24gOS8xMC8yMyAwNDoyOSwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4+Pj4g
RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4+Cj4+Pj4gQWxsb3cg
Y21kbGluZSB0byBmb3JjZSB0aGUga2VybmVsIHRvIHVzZSBxdWV1ZWRfc3BpbmxvY2sgd2hlbgo+
Pj4+IENPTkZJR19SSVNDVl9DT01CT19TUElOTE9DS1M9eS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPj4+PiAtLS0KPj4+PiAgICBEb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCB8ICAyICsrCj4+Pj4gICAgYXJj
aC9yaXNjdi9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgICAgICAgICAgICAgfCAxNiArKysrKysr
KysrKysrKystCj4+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlk
ZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5l
bC1wYXJhbWV0ZXJzLnR4dAo+Pj4+IGluZGV4IDdkZmI1NDBjNGY2Yy4uNjFjYWNiOGRmZDBlIDEw
MDY0NAo+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRl
cnMudHh0Cj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1l
dGVycy50eHQKPj4+PiBAQCAtNDY5Myw2ICs0NjkzLDggQEAKPj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgIFtLTkxdIE51bWJlciBvZiBsZWdhY3kgcHR5J3MuIE92ZXJ3cml0ZXMgY29tcGlsZWQt
aW4KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgIGRlZmF1bHQgbnVtYmVyLgo+Pj4+Cj4+Pj4g
KyAgICAgcXNwaW5sb2NrICAgICAgIFtSSVNDVl0gRm9yY2UgdG8gdXNlIHFzcGlubG9jayBvciBh
dXRvLWRldGVjdCBzcGlubG9jay4KPj4+PiArCj4+Pj4gICAgICAgIHFzcGlubG9jay5udW1hX3Nw
aW5sb2NrX3RocmVzaG9sZF9ucz0gICBbTlVNQSwgUFZfT1BTXQo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgU2V0IHRoZSB0aW1lIHRocmVzaG9sZCBpbiBuYW5vc2Vjb25kcyBmb3IgdGhlCj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICBudW1iZXIgb2YgaW50cmEtbm9kZSBsb2NrIGhhbmQt
b2ZmcyBiZWZvcmUgdGhlCj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVw
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+Pj4gaW5kZXggYTQ0N2NmMzYwYTE4Li4w
ZjA4NGYwMzc2NTEgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+
Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPj4+PiBAQCAtMjcwLDYgKzI3MCwx
NSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcGFyc2VfZHRiKHZvaWQpCj4+Pj4gICAgfQo+Pj4+Cj4+
Pj4gICAgI2lmZGVmIENPTkZJR19SSVNDVl9DT01CT19TUElOTE9DS1MKPj4+PiArYm9vbCBlbmFi
bGVfcXNwaW5sb2NrX2tleSA9IGZhbHNlOwo+Pj4gWW91IGNhbiB1c2UgX19yb19hZnRlcl9pbml0
IHF1YWxpZmllciBmb3IgZW5hYmxlX3FzcGlubG9ja19rZXkuIEJUVywKPj4+IHRoaXMgaXMgbm90
IGEgc3RhdGljIGtleSwganVzdCBhIHNpbXBsZSBmbGFnLiBTbyB3aGF0IGlzIHRoZSBwb2ludCBv
Zgo+Pj4gdGhlIF9rZXkgc3VmZml4Pwo+PiBPa2F5LCBJIHdvdWxkIGNoYW5nZSBpdCB0bzoKPj4g
Ym9vbCBlbmFibGVfcXNwaW5sb2NrX2ZsYWcgX19yb19hZnRlcl9pbml0ID0gZmFsc2U7Cj4gSUlV
QywgdGhpcyBib29sIC8gZmxhZyBpcyB1c2VkIGluIGEgc2luZ2xlIGZpbGUsIHNvIGl0IG1ha2Vz
IHNlbnNlIGZvciBpdAo+IHRvIGJlIHN0YXRpYy4gQmVpbmcgc3RhdGljIG1lYW5zIGl0IGRvZXMg
bm90IG5lZWQgdG8gYmUgaW5pdGlhbGl6ZWQgdG8KPiBmYWxzZSwgYXMgaXQncyBzdGFuZGFyZCB0
byB6ZXJvLWZpbGwgdGhpcyBhcmVhcy4KPgo+IEFsc28sIHNpbmNlIGl0J3MgYSBib29sLCBpdCBk
b2VzIG5vdCBuZWVkIHRvIGJlIGNhbGxlZCBfZmxhZy4KPgo+IEkgd291bGQgZ28gd2l0aDoKPgo+
IHN0YXRpYyBib29sIGVuYWJsZV9xc3BpbmxvY2sgX19yb19hZnRlcl9pbml0OwoKSSBhY3R1YWxs
eSB3YXMgdGhpbmtpbmcgYWJvdXQgdGhlIHNhbWUgc3VnZ2VzdGlvbiB0byBhZGQgc3RhdGljLiBU
aGVuIEkgCnJlYWxpemVkIHRoYXQgdGhlIGZsYWcgd2FzIGFsc28gdXNlZCBpbiBhbm90aGVyIGZp
bGUgaW4gYSBsYXRlciBwYXRjaC4gCk9mIGNvdXJzZSwgaWYgaXQgdHVybnMgb3V0IHRoYXQgdGhp
cyBmbGFnIGlzIG5vIGxvbmdlciBuZWVkZWQgb3V0c2lkZSBvZiAKdGhpcyBmaWxlLCBpdCBzaG91
bGQgYmUgc3RhdGljLgoKQ2hlZXJzLApMb25nbWFuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
