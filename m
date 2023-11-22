Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D963BC61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8V4IHTtFdMRxNR+JyxcfuLMHfeelqehyvYrVM+EsmU=; b=iyL85xOfl/6JiF
	VXUr7YmBpmZGJurSSbou8sEUxFyys8jkjTT0QREWjrH81Ce35QUijZu5W0BK2KJIFF3bA9rMk187j
	wVL2SsOPI2YBwMqAKktNRBCkZDATM8nktYIS5VOMcOhJvAcPTDrX9/RWPtxcDLy8twY6FYPu26559
	J1RdjLQe6iz3L+/WnqBYkZVQYOFMNhzuG+wyyz0PzpZ4c07Hqvk4ya//5SM4aj+TVBrDwRKmb952o
	WYkSmhd3uqut+X/AK0XnAIKSdTVvA3jp+Gb5rRS9hicG4+YbxpBRYQo6Gx91DjD1EACrxSyeyqtIq
	7mHnlM4S29ijffZieNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jdF-001E8B-0A;
	Wed, 22 Nov 2023 09:34:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jdB-001E6l-2A
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 09:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700645684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+OTgZltwB2ZS+YZyn6PYgFPXeR3pdRlWkz0aWS8O4HE=;
	b=AyZdLpZ8AiKvLQrSXIR6OO2LShWad9447dErRDr6JDn9GXz4ajw8Wi/aqA6TjEWZnIF+o3
	n4O1wCzZYsmXkZzsGZJECPH5MRhOtEsuMWOrmekZIG6ZSpfq1+pR/5TbSBum39W9BIPA3i
	o53o/XjeGQcrCAx8QK19U9zi7vRdekg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-_biuZLCONCOAsgDXiclx4A-1; Wed,
 22 Nov 2023 04:34:40 -0500
X-MC-Unique: _biuZLCONCOAsgDXiclx4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8960E3C0FCA6;
	Wed, 22 Nov 2023 09:34:39 +0000 (UTC)
Received: from localhost (unknown [10.72.112.97])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A80F1C060AE;
	Wed, 22 Nov 2023 09:34:36 +0000 (UTC)
Date: Wed, 22 Nov 2023 17:34:33 +0800
From: Baoquan He <bhe@redhat.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: eric_devolder@yahoo.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, geert@linux-m68k.org,
	tsbogend@alpha.franken.de,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	deller@gmx.de, ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	dave.hansen@linux.intel.com, x86@kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	kernel@xen0n.name, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com,
	keescook@chromium.org, paulmck@kernel.org,
	Peter Zijlstra <peterz@infradead.org>, frederic@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>, samitolvanen@google.com,
	juerg.haefliger@canonical.com, arnd@arndb.de,
	rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org,
	sebastian.reichel@collabora.com, rppt@kernel.org,
	kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com,
	ziy@nvidia.com, masahiroy@kernel.org, ndesaulniers@google.com,
	mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
	xin3.li@intel.com, tj@kernel.org,
	Greg KH <gregkh@linuxfoundation.org>, tsi@tuyoix.net,
	hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	kernel-team <kernel-team@cloudflare.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
Message-ID: <ZV3LKVOokpx2WvKp@MiWiFi-R3L-srv>
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
 <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv>
 <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
 <CALrw=nH-vcROja2W23rUKEEZMZhxsQiNB4P_ZZQ-XhPHAJGxrg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALrw=nH-vcROja2W23rUKEEZMZhxsQiNB4P_ZZQ-XhPHAJGxrg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_013449_785343_55E3EB21 
X-CRM114-Status: GOOD (  48.45  )
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

T24gMTEvMjEvMjMgYXQgMDk6NDNhbSwgSWduYXQgS29yY2hhZ2luIHdyb3RlOgo+IE9uIFR1ZSwg
Tm92IDIxLCAyMDIzIGF0IDc6NTPigK9BTSBJZ25hdCBLb3JjaGFnaW4gPGlnbmF0QGNsb3VkZmxh
cmUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIE5vdiAyMSwgMjAyMyBhdCAxOjUw4oCvQU0g
QmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBFcmljIERlVm9s
ZGVyJ3MgT3JhY2xlIG1haWwgYWRkcmVzcyBpcyBub3QgYXZhaWxhYmxlIGFueW1vcmUsIGFkZCBo
aXMKPiA+ID4gY3VycmVudCBtYWlsIGFkZHJlc3MgaGUgdG9sZCBtZS4KPiA+Cj4gPiBUaGFuayB5
b3UhCj4gPgo+ID4gPiBPbiAxMS8yMC8yMyBhdCAxMDo1MnBtLCBJZ25hdCBLb3JjaGFnaW4gd3Jv
dGU6Cj4gPiA+ID4gR29vZCBkYXkhCj4gPiA+ID4KPiA+ID4gPiBXZSBoYXZlIHJlY2VudGx5IHN0
YXJ0ZWQgdG8gZXZhbHVhdGUgTGludXggNi42IGFuZCBub3RpY2VkIHRoYXQgd2UKPiA+ID4gPiBj
YW5ub3QgZGlzYWJsZSBDT05GSUdfS0VYRUMgYW55bW9yZSwgYnV0IGtlZXAgQ09ORklHX0NSQVNI
X0RVTVAKPiA+ID4gPiBlbmFibGVkLiBJdCBzZWVtcyB0byBiZSByZWxhdGVkIHRvIGNvbW1pdCA4
OWNkZTQ1NSAoImtleGVjOgo+ID4gPiA+IGNvbnNvbGlkYXRlIGtleGVjIGFuZCBjcmFzaCBvcHRp
b25zIGludG8ga2VybmVsL0tjb25maWcua2V4ZWMiKSwgd2hlcmUKPiA+ID4gPiBhIENPTkZJR19L
RVhFQyBkZXBlbmRlbmN5IHdhcyBhZGRlZCB0byBDT05GSUdfQ1JBU0hfRFVNUC4KPiA+ID4gPgo+
ID4gPiA+IEluIG91ciBjdXJyZW50IGtlcm5lbCAoTGludXggNi4xKSB3ZSBvbmx5IGVuYWJsZSBD
T05GSUdfS0VYRUNfRklMRQo+ID4gPiA+IHdpdGggZW5mb3JjZWQgc2lnbmF0dXJlIGNoZWNrIHRv
IHN1cHBvcnQgdGhlIGtlcm5lbCBjcmFzaCBkdW1waW5nCj4gPiA+ID4gZnVuY3Rpb25hbGl0eSBh
bmQgd291bGQgbGlrZSB0byBrZWVwIENPTkZJR19LRVhFQyBkaXNhYmxlZCBmb3IKPiA+ID4gPiBz
ZWN1cml0eSByZWFzb25zIFsxXS4KPiA+ID4gPgo+ID4gPiA+IEkgd2FzIHJlYWRpbmcgdGhlIGxv
bmcgY29tbWl0IG1lc3NhZ2UsIGJ1dCB0aGUgcmVhc29uIGZvciBhZGRpbmcKPiA+ID4gPiBDT05G
SUdfS0VYRUMgYXMgYSBkZXBlbmRlbmN5IGZvciBDT05GSUdfQ1JBU0hfRFVNUCBldmFkZWQgbWUu
IEFuZCBJCj4gPiA+ID4gYmVsaWV2ZSBmcm9tIHRoZSBpbXBsZW1lbnRhdGlvbiBwZXJzcGVjdGl2
ZSBDT05GSUdfS0VYRUNfRklMRSBzaG91bGQKPiA+ID4gPiBzdWZmaWNlIGhlcmUgKGFzIHdlIHN1
Y2Nlc3NmdWxseSB1c2VkIGl0IGZvciBjcmFzaGR1bXBzIG9uIExpbnV4IDYuMSkuCj4gPiA+ID4K
PiA+ID4gPiBJcyB0aGVyZSBhIHJlYXNvbiBmb3IgYWRkaW5nIHRoaXMgZGVwZW5kZW5jeSBvciBp
cyBpdCBqdXN0IGFuCj4gPiA+ID4gb3ZlcnNpZ2h0PyBXb3VsZCBzb21lIHNvbHV0aW9uIG9mIHJl
cXVpcmluZyBlaXRoZXIgQ09ORklHX0tFWEVDIG9yCj4gPiA+ID4gQ09ORklHX0tFWEVDX0ZJTEUg
d29yayBoZXJlPwo+ID4gPgo+ID4gPiBJIHNlYXJjaGVkIHRoZSBwYXRjaCBoaXN0b3J5LCBmb3Vu
ZCBFcmljIGRpZG4ndCBhZGQgdGhlIGRlcGVuZGVuY3kgb24KPiA+ID4gQ09ORklHX0tFWEVDIGF0
IHRoZSBiZWdpbm5pbmcuIExhdGVyIGEgbGludXgtbmV4dCBidWlsZGluZyBmYWlsdXJlIHdpdGgK
PiA+ID4gcmFuZGNvbmZpZyB3YXMgcmVwb3J0ZWQsIGluIHRoZXJlIENPTkZJR19DUkFTSF9EVU1Q
IGVuYWJsZWQsIHdoaWxlCj4gPiA+IENPTkZJR19LRVhFQyBpcyBkaXNhYmxlZC4gRmluYWxseSBF
cmljIGFkZGVkIHRoZSBLRVhFQyBkZXBlbmRlbmN5IGZvcgo+ID4gPiBDUkFTSF9EVU1QLiBQbGVh
c2Ugc2VlIGJlbG93IGxpbmsgZm9yIG1vcmUgZGV0YWlsczoKPiA+ID4KPiA+ID4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzNlOGVlY2QxLWEyNzctMmNmYi02OTBlLTVkZTJlYjdiOTg4ZUBv
cmFjbGUuY29tL1QvI3UKPiA+Cj4gPiBUaGFuayB5b3UgZm9yIGRpZ2dpbmcgdGhpcyB1cC4gSG93
ZXZlciBJJ20gc3RpbGwgY29uZnVzZWQsIGJlY2F1c2UKPiA+IHRoaXMgaXMgZXhhY3RseSBob3cg
d2UgY29uZmlndXJlIExpbnV4IDYuMSAoYWx0aG91Z2ggd2UgZG8gaGF2ZQo+ID4gQ09ORklHX0tF
WEVDX0ZJTEUgZW5hYmxlZCkgYW5kIHdlIGRvbid0IGhhdmUgYW55IHByb2JsZW1zLiBJIGJlbGll
dmUKPiA+IHdlIGRpZCBub3QgaW52ZXN0aWdhdGUgdGhpcyBpc3N1ZSBwcm9wZXJseS4KPiAKPiBJ
IGRpZCBzb21lIHByZWxpbWluYXJ5IGludmVzdGlnYXRpb24gZm9yIHRoaXMuIElmIEkgcGF0Y2gg
b3V0IHRoZQo+IGRlcGVuZGVuY3kgb24gQ09ORklHX0tFWEVDIHRoZSBrZXJuZWwgYnVpbGRzIGp1
c3QgZmluZSBmb3IgeDg2Cj4gKHdpdGhvdXQgQ09ORklHX0NSQVNIX0hPVFBMVUcgLSB3aGljaCBp
cyBwcm9iYWJseSBhbm90aGVyIGlzc3VlKSAtIHNvCj4gdGhpcyB3YXMgdGhlIHByZXZpb3VzIGJl
aGF2aW91ci4gSSBjYW4gc2VlIHRoYXQgdGhlIHJlcG9ydGVkIGVycm9yIGlzCj4gZm9yIGFybSBh
cmNoaXRlY3R1cmUgYW5kIHdhcyBhYmxlIHRvIHJlcHJvZHVjZSBpdCB3aXRoIGEgc2ltcGxlIGNy
b3NzCj4gY29tcGlsZXIgaW4gRGViaWFuLiBIb3dldmVyLCBJIHRoaW5rIGl0IGlzIHN0aWxsIHNv
bWVob3cgcmVsYXRlZCB0bwo+IHRoaXMgcGF0Y2hzZXQgYXMgdGhlIHByZXZpb3VzIGtlcm5lbHMg
KHVwIHRvIDYuNSkgYnVpbGQgZmluZSB3aXRoIGp1c3QKPiBDT05GSUdfQ1JBU0hfRFVNUCBhbmQg
d2l0aG91dCBDT05GSUdfS0VYRUMgZm9yIGFybSBhcyB3ZWxsLiBTbyBldmVuCj4gZm9yIGFybSBp
dCB3YXMgaW50cm9kdWNlZCBpbiA2LjYuCgpUaGFua3MgZm9yIHRoZSBpbmZvcm1hdGlvbi4KCkkg
aGF2ZW4ndCBydW4gdGhlIHJlcHJvZHVjZXIgb2YgaXNzdWUgcmVwb3J0ZWQgb24gRXJpYydzIG9s
ZCBwYXRjaHNldCwKd2hpbGUgY2hlY2tvdXQgdG8ga2VybmVsIDYuMSwgb25seSBzMzkwIHNlbGVj
dGVkIEtFWEVDIGZvciBDUkFTSF9EVU1QCmFscmVhZHkuIEFuZCB3aXRoIHRoZSBBUk0gYnVpbGRp
bmcgYnJlYWthZ2UsIHRoZSBzaW1wbGVzdCBpZGVhIGlzIAp0byBzZWxlY3QgS0VYRUMgb25seSBm
b3IgQVJNIG9yIFMzOTAgQ1JBU0hfRFVNUC4gSSBwbGFuIHRvIHRyeSB0aGUKcmVwcm9kdWNlciBs
YXRlci4gSWYgeW91IGhhdmUgYW55IGlkZWEgb3IgZHJhZnQgcGF0Y2gsIHBsZWFzZSBmZWVsIGZy
ZWUKdG8gcG9zdC4KCmRpZmYgLS1naXQgYS9rZXJuZWwvS2NvbmZpZy5rZXhlYyBiL2tlcm5lbC9L
Y29uZmlnLmtleGVjCmluZGV4IDdhZmYyOGRlZDJmNC4uMzgyZGNkOGQ3YTlkIDEwMDY0NAotLS0g
YS9rZXJuZWwvS2NvbmZpZy5rZXhlYworKysgYi9rZXJuZWwvS2NvbmZpZy5rZXhlYwpAQCAtOTcs
NyArOTcsNyBAQCBjb25maWcgQ1JBU0hfRFVNUAogICAgICAgIGRlcGVuZHMgb24gQVJDSF9TVVBQ
T1JUU19LRVhFQwogICAgICAgIHNlbGVjdCBDUkFTSF9DT1JFCiAgICAgICAgc2VsZWN0IEtFWEVD
X0NPUkUKLSAgICAgICBzZWxlY3QgS0VYRUMKKyAgICAgICBzZWxlY3QgS0VYRUMgaWYgKEFSTSB8
fCBTMzkwKQoKCmFyY2gvczM5MC9LY29uZmlnIGluIGtlcm5lbCA2LjE6CmNvbmZpZyBDUkFTSF9E
VU1QCiAgICAgICAgYm9vbCAia2VybmVsIGNyYXNoIGR1bXBzIgogICAgICAgIHNlbGVjdCBLRVhF
QwogICAgICAgIGhlbHAKICAgICAgICAgIEdlbmVyYXRlIGNyYXNoIGR1bXAgYWZ0ZXIgYmVpbmcg
c3RhcnRlZCBieSBrZXhlYy4KICAgICAgICAgIENyYXNoIGR1bXAga2VybmVscyBhcmUgbG9hZGVk
IGluIHRoZSBtYWluIGtlcm5lbCB3aXRoIGtleGVjLXRvb2xzCiAgICAgICAgICBpbnRvIGEgc3Bl
Y2lhbGx5IHJlc2VydmVkIHJlZ2lvbiBhbmQgdGhlbiBsYXRlciBleGVjdXRlZCBhZnRlcgogICAg
ICAgICAgYSBjcmFzaCBieSBrZHVtcC9rZXhlYy4KICAgICAgICAgIFJlZmVyIHRvIDxmaWxlOkRv
Y3VtZW50YXRpb24vczM5MC96ZmNwZHVtcC5yc3Q+IGZvciBtb3JlIGRldGFpbHMgb24gdGhpcy4K
ICAgICAgICAgIFRoaXMgb3B0aW9uIGFsc28gZW5hYmxlcyBzMzkwIHpmY3BkdW1wLgogICAgICAg
ICAgU2VlIGFsc28gPGZpbGU6RG9jdW1lbnRhdGlvbi9zMzkwL3pmY3BkdW1wLnJzdD4KCj4gCj4g
PiA+IEFuZCBiZXNpZGVzLCB0aGUgbmV3bHkgYWRkZWQgQ09ORklHX0NSQVNIX0hPVFBMVUcgYWxz
byBuZWVkcwo+ID4gPiBDT05GSUdfS0VYRUMgaWYgdGhlIGVsZmNvcmVoZHIgaXMgYWxsb3dlZCB0
byBiZSBtYW5pcHVsYXRlZCB3aGVuCj4gPiA+IGNwdS9tZW1vcnkgaG90cGx1ZyBoYXBlbmVkLgo+
ID4KPiA+IFRoaXMgc3RpbGwgZmVlbHMgbGlrZSBhIHJlZ3Jlc3Npb24gdG8gbWU6IGFueSBjcmFz
aCBkdW1wIHN1cHBvcnQKPiA+IHNob3VsZCBiZSBpbmRlcGVuZGVudCBvZiBLRVhFQyBzeXNjYWxs
cyBiZWluZyBwcmVzZW50LiBXaGlsZSBwcm9iYWJseQo+ID4gdGhlIGNvbW1vbiBjYXNlIChpbmNs
dWRpbmcgdXMpIHRoYXQgdGhlIGNyYXNoaW5nIGtlcm5lbCBhbmQgcmVjb3ZlcnkKPiA+IGtlcm5l
bCBhcmUgdGhlIHNhbWUsIHRoZXkgZG9uJ3QgaGF2ZSB0byBiZS4gV2UgbmVlZCBrZXhlYyBzeXNj
YWxsIGluCj4gPiB0aGUgY3Jhc2hpbmcga2VybmVsLCBidXQgY3Jhc2hkdW1wIHN1cHBvcnQgaW4g
dGhlIHJlY292ZXJ5IGtlcm5lbCAoYnV0Cj4gPiB0aGUgcmVjb3Zlcnkga2VybmVsIG5vdCBoYXZp
bmcgdGhlIGtleGVjIHN5c2NhbGxzIHNob3VsZCBiZSB0b3RhbGx5Cj4gPiBmaW5lKS4gSWYgd2Ug
ZG8gcmVxdWlyZSBzb21lIGNvZGUgZGVmaW5pdGlvbnMgZnJvbSBrZXhlYyAtIGF0IG1vc3Qgd2UK
PiA+IHNob3VsZCBwdXQgdGhlbSB1bmRlciBDT05GSUdfS0VYRUNfQ09SRS4KPiA+Cj4gPiA+IFRo
YW5rcwo+ID4gPiBCYW9xdWFuCj4gPiA+Cj4gCj4gSWduYXQKPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
