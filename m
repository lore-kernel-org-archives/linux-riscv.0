Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844C1C36000
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 08:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yti96wG5H2Nhpu5wQH5XxLsyja/J480eO/KvStCEWeQ=; b=YBZDJXgVMtvnzR
	sdsdes46b/25WCNZR+HhmWicm2b7IGIpZUmU0u/D478e2mkgAnG8AEPFBDKDe4mgbKDUJY+11WCMf
	raq0NdEZDemfrwYulUrY7KmHbQtJ0nGrwq52DPzRlm/0RKW1q7sJBDunibH0M0+RTW6BBPvsDZ6HR
	okXJ65GYTODqYRSJJMaeCrKzVk4nuPksH2/mPZxYshnV2lWvhOq9AP7it2zIcot9W6TFfZk7JHudm
	m503LOzQOsQV7//+raPJov4kaPrlv17DSfbYJ5PpepqGzCk4P1R9/7y8CSIKgTmDz0kX6nNfUSSiN
	jfw3lh17tVO9KhMnH+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuogT-00000008KNm-3HrG;
	Wed, 19 Mar 2025 08:21:53 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuoek-00000008K8w-2d6A;
	Wed, 19 Mar 2025 08:20:08 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZHh8p3p47z9sSY;
	Wed, 19 Mar 2025 09:05:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Pdv_1f5SWZW; Wed, 19 Mar 2025 09:05:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZHh8p2Mb8z9sSX;
	Wed, 19 Mar 2025 09:05:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2617E8B78F;
	Wed, 19 Mar 2025 09:05:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id K6S1MuFrSThd; Wed, 19 Mar 2025 09:05:30 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 585CB8B763;
	Wed, 19 Mar 2025 09:05:28 +0100 (CET)
Message-ID: <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
Date: Wed, 19 Mar 2025 09:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
To: Will Deacon <will@kernel.org>, Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <linux@roeck-us.net>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
 <20250318155946.GC13829@willie-the-truck>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250318155946.GC13829@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_012006_833819_758E9C6C 
X-CRM114-Status: GOOD (  17.69  )
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

CgpMZSAxOC8wMy8yMDI1IMOgIDE2OjU5LCBXaWxsIERlYWNvbiBhIMOpY3JpdMKgOgo+IE9uIFRo
dSwgTWFyIDEzLCAyMDI1IGF0IDA1OjQwOjU5UE0gKzAxMDAsIEFsZXNzYW5kcm8gQ2FybWluYXRp
IHdyb3RlOgo+PiBPbiBUaHUsIE1hciAxMywgMjAyNSBhdCAxOjI14oCvUE0gV2lsbCBEZWFjb24g
PHdpbGxAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pgo+Pj4gT24gVGh1LCBNYXIgMTMsIDIwMjUgYXQg
MTE6NDM6MjJBTSArMDAwMCwgQWxlc3NhbmRybyBDYXJtaW5hdGkgd3JvdGU6Cj4+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vYnVnLmggYi9hcmNoL2FybTY0L2luY2x1ZGUv
YXNtL2J1Zy5oCj4+Pj4gaW5kZXggMjhiZTA0OGRiM2Y2Li4wNDRjNWUyNGExN2QgMTAwNjQ0Cj4+
Pj4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9idWcuaAo+Pj4+ICsrKyBiL2FyY2gvYXJt
NjQvaW5jbHVkZS9hc20vYnVnLmgKPj4+PiBAQCAtMTEsOCArMTEsMTQgQEAKPj4+Pgo+Pj4+ICAg
I2luY2x1ZGUgPGFzbS9hc20tYnVnLmg+Cj4+Pj4KPj4+PiArI2lmZGVmIEhBVkVfQlVHX0ZVTkNU
SU9OCj4+Pj4gKyMgZGVmaW5lIF9fQlVHX0ZVTkMgIF9fZnVuY19fCj4+Pj4gKyNlbHNlCj4+Pj4g
KyMgZGVmaW5lIF9fQlVHX0ZVTkMgIE5VTEwKPj4+PiArI2VuZGlmCj4+Pj4gKwo+Pj4+ICAgI2Rl
ZmluZSBfX0JVR19GTEFHUyhmbGFncykgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+Pj4g
LSAgICAgYXNtIHZvbGF0aWxlIChfX3N0cmluZ2lmeShBU01fQlVHX0ZMQUdTKGZsYWdzKSkpOwo+
Pj4+ICsgICAgIGFzbSB2b2xhdGlsZSAoX19zdHJpbmdpZnkoQVNNX0JVR19GTEFHUyhmbGFncywg
JWMwKSkgOiA6ICJpIiAoX19CVUdfRlVOQykpOwo+Pj4KPj4+IFdoeSBpcyAnaScgdGhlIHJpZ2h0
IGFzbSBjb25zdHJhaW50IHRvIHVzZSBoZXJlPyBJdCBzZWVtcyBhIGJpdCBvZGQgdG8KPj4+IHVz
ZSB0aGF0IGZvciBhIHBvaW50ZXIuCj4+Cj4+IEkgcmVjZWl2ZWQgdGhpcyBjb2RlIGFzIGxlZ2Fj
eSBmcm9tIGEgcHJldmlvdXMgdmVyc2lvbi4KPj4gSW4gbXkgcmV2aWV3LCBJIGNvbnNpZGVyZWQg
dGhlIGNhc2Ugd2hlbiBIQVZFX0JVR19GVU5DVElPTiBpcyBkZWZpbmVkOgo+PiBIZXJlLCBfX0JV
R19GVU5DIGlzIGRlZmluZWQgYXMgX19mdW5jX18sIHdoaWNoIGlzIHRoZSBuYW1lIG9mIHRoZQo+
PiBjdXJyZW50IGZ1bmN0aW9uIGFzIGEgc3RyaW5nIGxpdGVyYWwuCj4+IFVzaW5nIHRoZSBjb25z
dHJhaW50ICJpIiBzZWVtcyBhcHByb3ByaWF0ZSB0byBtZSBpbiB0aGlzIGNhc2UuCj4+Cj4+IEhv
d2V2ZXIsIHdoZW4gSEFWRV9CVUdfRlVOQ1RJT04gaXMgbm90IGRlZmluZWQ6Cj4+IF9fQlVHX0ZV
TkMgaXMgZGVmaW5lZCBhcyBOVUxMLiBJbml0aWFsbHksIEkgY29uc2lkZXJlZCBpdCBsaXRlcmFs
IDAsCj4+IGJ1dCBhZnRlciBpbnZlc3RpZ2F0aW5nIHlvdXIgY29uY2VybiwgSSBmb3VuZDoKPj4K
Pj4gYGBgCj4+ICQgZWNobyAtRSAiI2luY2x1ZGUgPHN0ZGlvLmg+XG4jaW5jbHVkZSA8c3RkZGVm
Lmg+XG5pbnQgbWFpbigpCj4+IHtcbnJldHVybiAwO1xufSIgfCBhYXJjaDY0LWxpbnV4LWdudS1n
Y2MgLUUgLWRNIC0gfCBncmVwIE5VTEwKPj4gI2RlZmluZSBOVUxMICgodm9pZCAqKTApCj4+IGBg
YAo+Pgo+PiBJIHJlYWxpemVkIHRoYXQgTlVMTCBpcyBhY3R1YWxseSBhIHBvaW50ZXIgdGhhdCBp
cyBub3QgYSBsaW5rIHRpbWUKPj4gc3ltYm9sLCBhbmQgdXNpbmcgdGhlICJpIiBjb25zdHJhaW50
IHdpdGggTlVMTCBtYXkgcmVzdWx0IGluIHVuZGVmaW5lZAo+PiBiZWhhdmlvci4KPj4KPj4gV291
bGQgdGhlIGZvbGxvd2luZyBhbHRlcm5hdGl2ZSBkZWZpbml0aW9uIGZvciBfX0JVR19GVU5DIGJl
IG1vcmUgY29udmluY2luZz8KPj4KPj4gYGBgCj4+ICNpZmRlZiBIQVZFX0JVR19GVU5DVElPTgo+
PiAgICAgICNkZWZpbmUgX19CVUdfRlVOQyBfX2Z1bmNfXwo+PiAjZWxzZQo+PiAgICAgICNkZWZp
bmUgX19CVUdfRlVOQyAodWludHB0cl90KTAKPj4gI2VuZGlmCj4+IGBgYAo+PiBMZXQgbWUga25v
dyB5b3VyIHRob3VnaHRzLgo+IAo+IFRoYW5rcyBmb3IgdGhlIGFuYWx5c2lzOyBJIGhhZG4ndCBu
b3RpY2VkIHRoaXMgc3BlY2lmaWMgaXNzdWUsIGl0IGp1c3QKPiBzbWVsbGVkIGEgYml0IGZpc2h5
LiBBbnl3YXksIHRoZSBkaWZmIGFib3ZlIGxvb2tzIGJldHRlciwgdGhhbmtzLgoKVGhhdCBwcm9w
YWJseSBkZXNlcnZlcyBhIGNvbW1lbnQuCgpEb2Vzbid0IHNwYXJzZSBhbmQvb3IgY2hlY2twYXRj
aCBjb21wbGFpbiBhYm91dCAwIGJlaW5nIHVzZWQgaW4gbGlldSBvZiAKTlVMTCA/CgpCeSB0aGUg
d2F5IEkgaGFkIHNpbWlsYXIgcHJvYmxlbSBpbiB0aGUgcGFzdCB3aXRoIEdDQyBub3Qgc2VlaW5n
IE5VTEwgYXMgCmEgX19idWlsdGluX2NvbnN0YW50X3AoKSwgcmVmZXIgY29tbWl0IDFkOGY3Mzli
MDdiZCAoInBvd2VycGMva3VhcDogRml4IApzZXQgZGlyZWN0aW9uIGluIGFsbG93L3ByZXZlbnRf
dXNlcl9hY2Nlc3MoKSIpCgpDaHJpc3RvcGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
