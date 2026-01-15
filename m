Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720CED4116C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/q5DUiTELpBMlIqGg6VwpqJbW+ZlVBWnNqe5q8ZtBUE=; b=eOIL5trtAwfZ4O
	bbYVFiZGrKsXhtpwGuPgY0o5KVXkc2vxZ9sq+E9g1qrAwJi46C1LAUXa55JIHDqFESy6VtXIvSy70
	LtyruZy1A2wWaQULzVQIdXKzyAXAQ3Y1ws1QmDSfM1OVUR4qbrOmQeY1RLtNLU54eTAK+uHfzE5Ar
	mt2f9nTxvy/BqcsB3+Ryb/B+KBHXKhJ/THF4P1Lu3Nb/dhGmdA97M1ZuClVMY5xBebjOoHUX2n/7z
	D3uqJa341p59hUja/ubJZGg5+0OhrejYL7lQDed+8sC8qozTIGhsIF7EDm5BbGG6YH92AcU2iFv+R
	34kN7u71AknqscE5tXgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgL9O-0000000CBmu-49wo;
	Thu, 15 Jan 2026 11:04:27 +0000
Received: from fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.72.182.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgL9L-0000000CBlt-0jm2;
	Thu, 15 Jan 2026 11:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1768475063; x=1800011063;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=mJnfQzk/Ndl7hOirTyKcnaRJiF2TZLcunnrc7x/sQ1k=;
  b=iv+xjL+t6ww53tp3Jr1KqAm4GkgCi2A2EDEWhv8Xai/1WVhkIChtJ8P/
   vO0MyQP7EoPxSN92vP/n84u2rGxfbWErvb0540mf0r2khkgGhoJFDfnoY
   cLHEEz3irV11UTXslQFzXRpBgtiA6FLuxMVh5+9Bn2dkXN91jdGW84wbN
   8P/J2/uXkNIyEQ8MIg1b1FaXrONWuRIEjRtrIx5DpjGEZdI3oltP/mQTo
   ALGeJOdKhcs+7WvMp3cnjRXhOx1RIJ0qtY70MemCpWE/Dn6mPI/MNy9kt
   q/V7vsT7Yj1GA8W/cUajUNGgsI7jvMRgtm9SCzkTlMS3XHFsR04U7VC9V
   Q==;
X-CSE-ConnectionGUID: tMK6TlvWQCyiAhzaIHOmmQ==
X-CSE-MsgGUID: 4v5E16YYSDiYhbf89Ug3ZA==
X-IronPort-AV: E=Sophos;i="6.21,228,1763424000"; 
   d="scan'208";a="7947458"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 11:04:01 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.224:31144]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.30.60:2525] with esmtp (Farcaster)
 id 78798bdf-4355-47da-99ae-a3a26432276e; Thu, 15 Jan 2026 11:04:00 +0000 (UTC)
X-Farcaster-Flow-ID: 78798bdf-4355-47da-99ae-a3a26432276e
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 15 Jan 2026 11:04:00 +0000
Received: from [192.168.15.69] (10.106.82.11) by EX19D005EUB003.ant.amazon.com
 (10.252.51.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Thu, 15 Jan 2026
 11:03:57 +0000
Message-ID: <373776f9-fe57-4374-8f8f-c43fdb193f19@amazon.com>
Date: Thu, 15 Jan 2026 11:03:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/13] set_memory: add folio_{zap, restore}_direct_map
 helpers
To: Huacai Chen <chenhuacai@kernel.org>, "Kalyazin, Nikita"
	<kalyazin@amazon.co.uk>
CC: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "ackerleytng@google.com" <ackerleytng@google.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, "jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, "vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev"
 <patrick.roy@linux.dev>, "Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, "Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
References: <20260114134510.1835-1-kalyazin@amazon.com>
 <20260114134510.1835-2-kalyazin@amazon.com>
 <CAAhV-H6S4bVdpwbER84-iwSE+bQrFu_gF=Ww-bCFxThJ7WiUwQ@mail.gmail.com>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
Autocrypt: addr=kalyazin@amazon.com; keydata=
 xjMEY+ZIvRYJKwYBBAHaRw8BAQdA9FwYskD/5BFmiiTgktstviS9svHeszG2JfIkUqjxf+/N
 JU5pa2l0YSBLYWx5YXppbiA8a2FseWF6aW5AYW1hem9uLmNvbT7CjwQTFggANxYhBGhhGDEy
 BjLQwD9FsK+SyiCpmmTzBQJnrNfABQkFps9DAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQr5LK
 IKmaZPOpfgD/exazh4C2Z8fNEz54YLJ6tuFEgQrVQPX6nQ/PfQi2+dwBAMGTpZcj9Z9NvSe1
 CmmKYnYjhzGxzjBs8itSUvWIcMsFzjgEY+ZIvRIKKwYBBAGXVQEFAQEHQCqd7/nb2tb36vZt
 ubg1iBLCSDctMlKHsQTp7wCnEc4RAwEIB8J+BBgWCAAmFiEEaGEYMTIGMtDAP0Wwr5LKIKma
 ZPMFAmes18AFCQWmz0MCGwwACgkQr5LKIKmaZPNTlQEA+q+rGFn7273rOAg+rxPty0M8lJbT
 i2kGo8RmPPLu650A/1kWgz1AnenQUYzTAFnZrKSsXAw5WoHaDLBz9kiO5pAK
In-Reply-To: <CAAhV-H6S4bVdpwbER84-iwSE+bQrFu_gF=Ww-bCFxThJ7WiUwQ@mail.gmail.com>
X-Originating-IP: [10.106.82.11]
X-ClientProxiedBy: EX19D015EUA002.ant.amazon.com (10.252.50.219) To
 EX19D005EUB003.ant.amazon.com (10.252.51.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_030423_696754_45DAFDAC 
X-CRM114-Status: GOOD (  17.60  )
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
Reply-To: kalyazin@amazon.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxNS8wMS8yMDI2IDEwOjU0LCBIdWFjYWkgQ2hlbiB3cm90ZToKPiBIaSwgTmlraXRhLAoK
SGkgSHVhY2FpLAoKPiAKPiBPbiBXZWQsIEphbiAxNCwgMjAyNiBhdCA5OjQ14oCvUE0gS2FseWF6
aW4sIE5pa2l0YSA8a2FseWF6aW5AYW1hem9uLmNvLnVrPiB3cm90ZToKPj4KPj4gRnJvbTogTmlr
aXRhIEthbHlhemluIDxrYWx5YXppbkBhbWF6b24uY29tPgo+Pgo+PiBUaGVzZSBhbGxvdyBndWVz
dF9tZW1mZCB0byByZW1vdmUgaXRzIG1lbW9yeSBmcm9tIHRoZSBkaXJlY3QgbWFwLgo+PiBPbmx5
IGltcGxlbWVudCB0aGVtIGZvciBhcmNoaXRlY3R1cmVzIHRoYXQgaGF2ZSBkaXJlY3QgbWFwLgo+
PiBJbiBmb2xpb196YXBfZGlyZWN0X21hcCgpLCBmbHVzaCBUTEIgb24gYXJjaGl0ZWN0dXJlcyB3
aGVyZQo+PiBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKCkgZG9lcyBub3QgZmx1c2ggaXQg
aW50ZXJuYWxseS4KPj4KPj4gVGhlIG5ldyBoZWxwZXJzIG5lZWQgdG8gYmUgYWNjZXNzaWJsZSB0
byBLVk0gb24gYXJjaGl0ZWN0dXJlcyB0aGF0Cj4+IHN1cHBvcnQgZ3Vlc3RfbWVtZmQgKHg4NiBh
bmQgYXJtNjQpLiAgU2luY2UgYXJtNjQgZG9lcyBub3Qgc3VwcG9ydAo+PiBidWlsZGluZyBLVk0g
YXMgYSBtb2R1bGUsIG9ubHkgZXhwb3J0IHRoZW0gb24geDg2Lgo+Pgo+PiBEaXJlY3QgbWFwIHJl
bW92YWwgZ2l2ZXMgZ3Vlc3RfbWVtZmQgdGhlIHNhbWUgcHJvdGVjdGlvbiB0aGF0Cj4+IG1lbWZk
X3NlY3JldCBkb2VzLCBzdWNoIGFzIGhhcmRlbmluZyBhZ2FpbnN0IFNwZWN0cmUtbGlrZSBhdHRh
Y2tzCj4+IHRocm91Z2ggaW4ta2VybmVsIGdhZGdldHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE5p
a2l0YSBLYWx5YXppbiA8a2FseWF6aW5AYW1hem9uLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS9zZXRfbWVtb3J5LmggICAgIHwgIDIgKysKPj4gICBhcmNoL2FybTY0L21t
L3BhZ2VhdHRyLmMgICAgICAgICAgICAgICAgfCAxMiArKysrKysrKysrKysKPj4gICBhcmNoL2xv
b25nYXJjaC9pbmNsdWRlL2FzbS9zZXRfbWVtb3J5LmggfCAgMiArKwo+PiAgIGFyY2gvbG9vbmdh
cmNoL21tL3BhZ2VhdHRyLmMgICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysKPj4gICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NldF9tZW1vcnkuaCAgICAgfCAgMiArKwo+PiAgIGFyY2gv
cmlzY3YvbW0vcGFnZWF0dHIuYyAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysK
Pj4gICBhcmNoL3MzOTAvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oICAgICAgfCAgMiArKwo+PiAg
IGFyY2gvczM5MC9tbS9wYWdlYXR0ci5jICAgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysr
KysrKysrKwo+PiAgIGFyY2gveDg2L2luY2x1ZGUvYXNtL3NldF9tZW1vcnkuaCAgICAgICB8ICAy
ICsrCj4+ICAgYXJjaC94ODYvbW0vcGF0L3NldF9tZW1vcnkuYyAgICAgICAgICAgIHwgMjAgKysr
KysrKysrKysrKysrKysrKysKPj4gICBpbmNsdWRlL2xpbnV4L3NldF9tZW1vcnkuaCAgICAgICAg
ICAgICAgfCAxMCArKysrKysrKysrCj4+ICAgMTEgZmlsZXMgY2hhbmdlZCwgMTAyIGluc2VydGlv
bnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vc2V0X21lbW9y
eS5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9zZXRfbWVtb3J5LmgKPj4gaW5kZXggOTBmNjFi
MTcyNzVlLi5kOTQ5ZjFkZWI3MDEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9h
c20vc2V0X21lbW9yeS5oCj4+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vc2V0X21lbW9y
eS5oCj4+IEBAIC0xNCw2ICsxNCw4IEBAIGludCBzZXRfbWVtb3J5X3ZhbGlkKHVuc2lnbmVkIGxv
bmcgYWRkciwgaW50IG51bXBhZ2VzLCBpbnQgZW5hYmxlKTsKPj4gICBpbnQgc2V0X2RpcmVjdF9t
YXBfaW52YWxpZF9ub2ZsdXNoKHN0cnVjdCBwYWdlICpwYWdlKTsKPj4gICBpbnQgc2V0X2RpcmVj
dF9tYXBfZGVmYXVsdF9ub2ZsdXNoKHN0cnVjdCBwYWdlICpwYWdlKTsKPj4gICBpbnQgc2V0X2Rp
cmVjdF9tYXBfdmFsaWRfbm9mbHVzaChzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbnIsIGJv
b2wgdmFsaWQpOwo+PiAraW50IGZvbGlvX3phcF9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9s
aW8pOwo+PiAraW50IGZvbGlvX3Jlc3RvcmVfZGlyZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlv
KTsKPj4gICBib29sIGtlcm5lbF9wYWdlX3ByZXNlbnQoc3RydWN0IHBhZ2UgKnBhZ2UpOwo+Pgo+
PiAgIGludCBzZXRfbWVtb3J5X2VuY3J5cHRlZCh1bnNpZ25lZCBsb25nIGFkZHIsIGludCBudW1w
YWdlcyk7Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL3BhZ2VhdHRyLmMgYi9hcmNoL2Fy
bTY0L21tL3BhZ2VhdHRyLmMKPj4gaW5kZXggZjBlNzg0Yjk2M2U2Li5hOTRlZmYzMjRkZGEgMTAw
NjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvbW0vcGFnZWF0dHIuYwo+PiArKysgYi9hcmNoL2FybTY0
L21tL3BhZ2VhdHRyLmMKPj4gQEAgLTM1Nyw2ICszNTcsMTggQEAgaW50IHNldF9kaXJlY3RfbWFw
X3ZhbGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIG5yLCBib29sIHZhbGlk
KQo+PiAgICAgICAgICByZXR1cm4gc2V0X21lbW9yeV92YWxpZChhZGRyLCBuciwgdmFsaWQpOwo+
PiAgIH0KPj4KPj4gK2ludCBmb2xpb196YXBfZGlyZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlv
KQo+PiArewo+PiArICAgICAgIHJldHVybiBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKGZv
bGlvX3BhZ2UoZm9saW8sIDApLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGZvbGlvX25yX3BhZ2VzKGZvbGlvKSwgZmFsc2UpOwo+PiArfQo+PiArCj4+ICtp
bnQgZm9saW9fcmVzdG9yZV9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8pCj4+ICt7Cj4+
ICsgICAgICAgcmV0dXJuIHNldF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goZm9saW9fcGFnZShm
b2xpbywgMCksCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Zm9saW9fbnJfcGFnZXMoZm9saW8pLCB0cnVlKTsKPj4gK30KPj4gKwo+PiAgICNpZmRlZiBDT05G
SUdfREVCVUdfUEFHRUFMTE9DCj4+ICAgLyoKPj4gICAgKiBUaGlzIGlzIC0gYXBhcnQgZnJvbSB0
aGUgcmV0dXJuIHZhbHVlIC0gZG9pbmcgdGhlIHNhbWUKPj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9v
bmdhcmNoL2luY2x1ZGUvYXNtL3NldF9tZW1vcnkuaCBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUv
YXNtL3NldF9tZW1vcnkuaAo+PiBpbmRleCA1NWRmYWVmZDAyYzguLjliYzgwYWM0MjBhOSAxMDA2
NDQKPj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oCj4+ICsr
KyBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3NldF9tZW1vcnkuaAo+PiBAQCAtMTgsNSAr
MTgsNyBAQCBib29sIGtlcm5lbF9wYWdlX3ByZXNlbnQoc3RydWN0IHBhZ2UgKnBhZ2UpOwo+PiAg
IGludCBzZXRfZGlyZWN0X21hcF9kZWZhdWx0X25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UpOwo+
PiAgIGludCBzZXRfZGlyZWN0X21hcF9pbnZhbGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2Up
Owo+PiAgIGludCBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKHN0cnVjdCBwYWdlICpwYWdl
LCB1bnNpZ25lZCBuciwgYm9vbCB2YWxpZCk7Cj4+ICtpbnQgZm9saW9femFwX2RpcmVjdF9tYXAo
c3RydWN0IGZvbGlvICpmb2xpbyk7Cj4+ICtpbnQgZm9saW9fcmVzdG9yZV9kaXJlY3RfbWFwKHN0
cnVjdCBmb2xpbyAqZm9saW8pOwo+Pgo+PiAgICNlbmRpZiAvKiBfQVNNX0xPT05HQVJDSF9TRVRf
TUVNT1JZX0ggKi8KPj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL21tL3BhZ2VhdHRyLmMg
Yi9hcmNoL2xvb25nYXJjaC9tbS9wYWdlYXR0ci5jCj4+IGluZGV4IGY1ZTkxMGI2ODIyOS4uMTRi
ZDMyMmRkMTEyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2xvb25nYXJjaC9tbS9wYWdlYXR0ci5jCj4+
ICsrKyBiL2FyY2gvbG9vbmdhcmNoL21tL3BhZ2VhdHRyLmMKPj4gQEAgLTIzNiwzICsyMzYsMTkg
QEAgaW50IHNldF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UsIHVu
c2lnbmVkIG5yLCBib29sIHZhbGlkKQo+Pgo+PiAgICAgICAgICByZXR1cm4gX19zZXRfbWVtb3J5
KGFkZHIsIDEsIHNldCwgY2xlYXIpOwo+PiAgIH0KPj4gKwo+PiAraW50IGZvbGlvX3phcF9kaXJl
Y3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8pCj4+ICt7Cj4+ICsgICAgICAgaW50IHJldDsKPj4g
Kwo+PiArICAgICAgIHJldCA9IHNldF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goZm9saW9fcGFn
ZShmb2xpbywgMCksCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBmb2xpb19ucl9wYWdlcyhmb2xpbyksIGZhbHNlKTsKPj4gKwo+PiArICAgICAgIHJldHVybiBy
ZXQ7Cj4gV2h5IG5vdCB1c2UgYSBzaW5nbGUgc3RhdGVtZW50IHdoaWNoIGlzIHRoZSBzYW1lIGFz
IHRoZSBBUk02NCB2ZXJzaW9uPwo+IFRoZSBSSVNDViB2ZXJzaW9uIGhhcyB0aGUgc2FtZSBwcm9i
bGVtLgoKTm8gcmVhc29uIGZvciB0aGVtIHRvIGJlIGRpZmZlcmVudC4gIFdpbGwgdXBkYXRlIGlu
IHRoZSBuZXh0IHZlcnNpb24uIApUaGFuayB5b3UhCgo+IAo+IEh1YWNhaQo+IAo+PiArfQo+PiAr
Cj4+ICtpbnQgZm9saW9fcmVzdG9yZV9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8pCj4+
ICt7Cj4+ICsgICAgICAgcmV0dXJuIHNldF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goZm9saW9f
cGFnZShmb2xpbywgMCksCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZm9saW9fbnJfcGFnZXMoZm9saW8pLCB0cnVlKTsKPj4gK30KPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9zZXRfbWVtb3J5LmgKPj4gaW5kZXggODczODllOTMzMjVhLi4xNjU1N2I3MGM4MzAgMTAw
NjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oCj4+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oCj4+IEBAIC00Myw2ICs0Myw4IEBA
IHN0YXRpYyBpbmxpbmUgaW50IHNldF9rZXJuZWxfbWVtb3J5KGNoYXIgKnN0YXJ0cCwgY2hhciAq
ZW5kcCwKPj4gICBpbnQgc2V0X2RpcmVjdF9tYXBfaW52YWxpZF9ub2ZsdXNoKHN0cnVjdCBwYWdl
ICpwYWdlKTsKPj4gICBpbnQgc2V0X2RpcmVjdF9tYXBfZGVmYXVsdF9ub2ZsdXNoKHN0cnVjdCBw
YWdlICpwYWdlKTsKPj4gICBpbnQgc2V0X2RpcmVjdF9tYXBfdmFsaWRfbm9mbHVzaChzdHJ1Y3Qg
cGFnZSAqcGFnZSwgdW5zaWduZWQgbnIsIGJvb2wgdmFsaWQpOwo+PiAraW50IGZvbGlvX3phcF9k
aXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8pOwo+PiAraW50IGZvbGlvX3Jlc3RvcmVfZGly
ZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlvKTsKPj4gICBib29sIGtlcm5lbF9wYWdlX3ByZXNl
bnQoc3RydWN0IHBhZ2UgKnBhZ2UpOwo+Pgo+PiAgICNlbmRpZiAvKiBfX0FTU0VNQkxFUl9fICov
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3BhZ2VhdHRyLmMgYi9hcmNoL3Jpc2N2L21t
L3BhZ2VhdHRyLmMKPj4gaW5kZXggM2Y3NmRiM2QyNzY5Li4yYzIxODg2ODExNGIgMTAwNjQ0Cj4+
IC0tLSBhL2FyY2gvcmlzY3YvbW0vcGFnZWF0dHIuYwo+PiArKysgYi9hcmNoL3Jpc2N2L21tL3Bh
Z2VhdHRyLmMKPj4gQEAgLTQwMSw2ICs0MDEsMjIgQEAgaW50IHNldF9kaXJlY3RfbWFwX3ZhbGlk
X25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIG5yLCBib29sIHZhbGlkKQo+PiAg
ICAgICAgICByZXR1cm4gX19zZXRfbWVtb3J5KCh1bnNpZ25lZCBsb25nKXBhZ2VfYWRkcmVzcyhw
YWdlKSwgbnIsIHNldCwgY2xlYXIpOwo+PiAgIH0KPj4KPj4gK2ludCBmb2xpb196YXBfZGlyZWN0
X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+PiArewo+PiArICAgICAgIGludCByZXQ7Cj4+ICsK
Pj4gKyAgICAgICByZXQgPSBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKGZvbGlvX3BhZ2Uo
Zm9saW8sIDApLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Zm9saW9fbnJfcGFnZXMoZm9saW8pLCBmYWxzZSk7Cj4+ICsKPj4gKyAgICAgICByZXR1cm4gcmV0
Owo+PiArfQo+PiArCj4+ICtpbnQgZm9saW9fcmVzdG9yZV9kaXJlY3RfbWFwKHN0cnVjdCBmb2xp
byAqZm9saW8pCj4+ICt7Cj4+ICsgICAgICAgcmV0dXJuIHNldF9kaXJlY3RfbWFwX3ZhbGlkX25v
Zmx1c2goZm9saW9fcGFnZShmb2xpbywgMCksCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZm9saW9fbnJfcGFnZXMoZm9saW8pLCB0cnVlKTsKPj4gK30KPj4g
Kwo+PiAgICNpZmRlZiBDT05GSUdfREVCVUdfUEFHRUFMTE9DCj4+ICAgc3RhdGljIGludCBkZWJ1
Z19wYWdlYWxsb2Nfc2V0X3BhZ2UocHRlX3QgKnB0ZSwgdW5zaWduZWQgbG9uZyBhZGRyLCB2b2lk
ICpkYXRhKQo+PiAgIHsKPj4gZGlmZiAtLWdpdCBhL2FyY2gvczM5MC9pbmNsdWRlL2FzbS9zZXRf
bWVtb3J5LmggYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oCj4+IGluZGV4IDk0
MDkyZjRhZTc2NC4uZmM3MzY1MmU1NzE1IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3MzOTAvaW5jbHVk
ZS9hc20vc2V0X21lbW9yeS5oCj4+ICsrKyBiL2FyY2gvczM5MC9pbmNsdWRlL2FzbS9zZXRfbWVt
b3J5LmgKPj4gQEAgLTYzLDYgKzYzLDggQEAgX19TRVRfTUVNT1JZX0ZVTkMoc2V0X21lbW9yeV80
aywgU0VUX01FTU9SWV80SykKPj4gICBpbnQgc2V0X2RpcmVjdF9tYXBfaW52YWxpZF9ub2ZsdXNo
KHN0cnVjdCBwYWdlICpwYWdlKTsKPj4gICBpbnQgc2V0X2RpcmVjdF9tYXBfZGVmYXVsdF9ub2Zs
dXNoKHN0cnVjdCBwYWdlICpwYWdlKTsKPj4gICBpbnQgc2V0X2RpcmVjdF9tYXBfdmFsaWRfbm9m
bHVzaChzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbnIsIGJvb2wgdmFsaWQpOwo+PiAraW50
IGZvbGlvX3phcF9kaXJlY3RfbWFwKHN0cnVjdCBmb2xpbyAqZm9saW8pOwo+PiAraW50IGZvbGlv
X3Jlc3RvcmVfZGlyZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlvKTsKPj4gICBib29sIGtlcm5l
bF9wYWdlX3ByZXNlbnQoc3RydWN0IHBhZ2UgKnBhZ2UpOwo+Pgo+PiAgICNlbmRpZgo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9zMzkwL21tL3BhZ2VhdHRyLmMgYi9hcmNoL3MzOTAvbW0vcGFnZWF0dHIu
Ywo+PiBpbmRleCBkM2NlMDRhNGIyNDguLmRmNGE0ODdiNDg0ZCAxMDA2NDQKPj4gLS0tIGEvYXJj
aC9zMzkwL21tL3BhZ2VhdHRyLmMKPj4gKysrIGIvYXJjaC9zMzkwL21tL3BhZ2VhdHRyLmMKPj4g
QEAgLTQxMiw2ICs0MTIsMjQgQEAgaW50IHNldF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goc3Ry
dWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIG5yLCBib29sIHZhbGlkKQo+PiAgICAgICAgICByZXR1
cm4gX19zZXRfbWVtb3J5KCh1bnNpZ25lZCBsb25nKXBhZ2VfdG9fdmlydChwYWdlKSwgbnIsIGZs
YWdzKTsKPj4gICB9Cj4+Cj4+ICtpbnQgZm9saW9femFwX2RpcmVjdF9tYXAoc3RydWN0IGZvbGlv
ICpmb2xpbykKPj4gK3sKPj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSAodW5zaWduZWQg
bG9uZylmb2xpb19hZGRyZXNzKGZvbGlvKTsKPj4gKyAgICAgICBpbnQgcmV0Owo+PiArCj4+ICsg
ICAgICAgcmV0ID0gc2V0X2RpcmVjdF9tYXBfdmFsaWRfbm9mbHVzaChmb2xpb19wYWdlKGZvbGlv
LCAwKSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZvbGlv
X25yX3BhZ2VzKGZvbGlvKSwgZmFsc2UpOwo+PiArICAgICAgIGZsdXNoX3RsYl9rZXJuZWxfcmFu
Z2UoYWRkciwgYWRkciArIGZvbGlvX3NpemUoZm9saW8pKTsKPj4gKwo+PiArICAgICAgIHJldHVy
biByZXQ7Cj4+ICt9Cj4+ICsKPj4gK2ludCBmb2xpb19yZXN0b3JlX2RpcmVjdF9tYXAoc3RydWN0
IGZvbGlvICpmb2xpbykKPj4gK3sKPj4gKyAgICAgICByZXR1cm4gc2V0X2RpcmVjdF9tYXBfdmFs
aWRfbm9mbHVzaChmb2xpb19wYWdlKGZvbGlvLCAwKSwKPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19ucl9wYWdlcyhmb2xpbyksIHRydWUpOwo+PiAr
fQo+PiArCj4+ICAgYm9vbCBrZXJuZWxfcGFnZV9wcmVzZW50KHN0cnVjdCBwYWdlICpwYWdlKQo+
PiAgIHsKPj4gICAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyOwo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20vc2V0X21lbW9yeS5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vc2V0
X21lbW9yeS5oCj4+IGluZGV4IDYxZjU2Y2RhY2NiNS4uNzIwOGFmNjA5MTIxIDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9zZXRfbWVtb3J5LmgKPj4gKysrIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20vc2V0X21lbW9yeS5oCj4+IEBAIC05MCw2ICs5MCw4IEBAIGludCBzZXRfcGFn
ZXNfcncoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCBudW1wYWdlcyk7Cj4+ICAgaW50IHNldF9kaXJl
Y3RfbWFwX2ludmFsaWRfbm9mbHVzaChzdHJ1Y3QgcGFnZSAqcGFnZSk7Cj4+ICAgaW50IHNldF9k
aXJlY3RfbWFwX2RlZmF1bHRfbm9mbHVzaChzdHJ1Y3QgcGFnZSAqcGFnZSk7Cj4+ICAgaW50IHNl
dF9kaXJlY3RfbWFwX3ZhbGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIG5y
LCBib29sIHZhbGlkKTsKPj4gK2ludCBmb2xpb196YXBfZGlyZWN0X21hcChzdHJ1Y3QgZm9saW8g
KmZvbGlvKTsKPj4gK2ludCBmb2xpb19yZXN0b3JlX2RpcmVjdF9tYXAoc3RydWN0IGZvbGlvICpm
b2xpbyk7Cj4+ICAgYm9vbCBrZXJuZWxfcGFnZV9wcmVzZW50KHN0cnVjdCBwYWdlICpwYWdlKTsK
Pj4KPj4gICBleHRlcm4gaW50IGtlcm5lbF9zZXRfdG9fcmVhZG9ubHk7Cj4+IGRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9tbS9wYXQvc2V0X21lbW9yeS5jIGIvYXJjaC94ODYvbW0vcGF0L3NldF9tZW1v
cnkuYwo+PiBpbmRleCA2YzZlYjQ4NmY3YTYuLjNmMGZjMzBlYjMyMCAxMDA2NDQKPj4gLS0tIGEv
YXJjaC94ODYvbW0vcGF0L3NldF9tZW1vcnkuYwo+PiArKysgYi9hcmNoL3g4Ni9tbS9wYXQvc2V0
X21lbW9yeS5jCj4+IEBAIC0yNjU2LDYgKzI2NTYsMjYgQEAgaW50IHNldF9kaXJlY3RfbWFwX3Zh
bGlkX25vZmx1c2goc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIG5yLCBib29sIHZhbGlkKQo+
PiAgICAgICAgICByZXR1cm4gX19zZXRfcGFnZXNfbnAocGFnZSwgbnIpOwo+PiAgIH0KPj4KPj4g
K2ludCBmb2xpb196YXBfZGlyZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+PiArewo+PiAr
ICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciA9ICh1bnNpZ25lZCBsb25nKWZvbGlvX2FkZHJlc3Mo
Zm9saW8pOwo+PiArICAgICAgIGludCByZXQ7Cj4+ICsKPj4gKyAgICAgICByZXQgPSBzZXRfZGly
ZWN0X21hcF92YWxpZF9ub2ZsdXNoKGZvbGlvX3BhZ2UoZm9saW8sIDApLAo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9saW9fbnJfcGFnZXMoZm9saW8pLCBm
YWxzZSk7Cj4+ICsgICAgICAgZmx1c2hfdGxiX2tlcm5lbF9yYW5nZShhZGRyLCBhZGRyICsgZm9s
aW9fc2l6ZShmb2xpbykpOwo+PiArCj4+ICsgICAgICAgcmV0dXJuIHJldDsKPj4gK30KPj4gK0VY
UE9SVF9TWU1CT0xfRk9SX01PRFVMRVMoZm9saW9femFwX2RpcmVjdF9tYXAsICJrdm0iKTsKPj4g
Kwo+PiAraW50IGZvbGlvX3Jlc3RvcmVfZGlyZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+
PiArewo+PiArICAgICAgIHJldHVybiBzZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKGZvbGlv
X3BhZ2UoZm9saW8sIDApLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZvbGlvX25yX3BhZ2VzKGZvbGlvKSwgdHJ1ZSk7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lN
Qk9MX0ZPUl9NT0RVTEVTKGZvbGlvX3Jlc3RvcmVfZGlyZWN0X21hcCwgImt2bSIpOwo+PiArCj4+
ICAgI2lmZGVmIENPTkZJR19ERUJVR19QQUdFQUxMT0MKPj4gICB2b2lkIF9fa2VybmVsX21hcF9w
YWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgaW50IG51bXBhZ2VzLCBpbnQgZW5hYmxlKQo+PiAgIHsK
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc2V0X21lbW9yeS5oIGIvaW5jbHVkZS9saW51
eC9zZXRfbWVtb3J5LmgKPj4gaW5kZXggMzAzMGQ5MjQ1ZjVhLi44ZDFjOGE3ZjdkNzkgMTAwNjQ0
Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvc2V0X21lbW9yeS5oCj4+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvc2V0X21lbW9yeS5oCj4+IEBAIC00MCw2ICs0MCwxNiBAQCBzdGF0aWMgaW5saW5lIGludCBz
ZXRfZGlyZWN0X21hcF92YWxpZF9ub2ZsdXNoKHN0cnVjdCBwYWdlICpwYWdlLAo+PiAgICAgICAg
ICByZXR1cm4gMDsKPj4gICB9Cj4+Cj4+ICtzdGF0aWMgaW5saW5lIGludCBmb2xpb196YXBfZGly
ZWN0X21hcChzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+PiArewo+PiArICAgICAgIHJldHVybiAwOwo+
PiArfQo+PiArCj4+ICtzdGF0aWMgaW5saW5lIGludCBmb2xpb19yZXN0b3JlX2RpcmVjdF9tYXAo
c3RydWN0IGZvbGlvICpmb2xpbykKPj4gK3sKPj4gKyAgICAgICByZXR1cm4gMDsKPj4gK30KPj4g
Kwo+PiAgIHN0YXRpYyBpbmxpbmUgYm9vbCBrZXJuZWxfcGFnZV9wcmVzZW50KHN0cnVjdCBwYWdl
ICpwYWdlKQo+PiAgIHsKPj4gICAgICAgICAgcmV0dXJuIHRydWU7Cj4+IC0tCj4+IDIuNTAuMQo+
Pgo+PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
