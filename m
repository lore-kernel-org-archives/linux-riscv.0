Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC9BE6F06E
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 16:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HZlXc9cI2K0/9CTH0Kq0L2PlOmXGAELTRUI/279/B4=; b=LaiZS8VV+ucnM3
	k34bcldnnAGlgF2BXJep0iRAbdQKGrl7mOZ7t99oas8Ny3W4OL+bCHgjvCHwrXH6UTugOGKoOg6LU
	aD+zUJWH108H/znQLCBlW98WuHDmGWyf+IM/Ev4+2fPMW04LZZca4o/xPSvTVc8U447EDdKXJFojh
	g8veiZ22/xcZ8w3ejtjXLjdttk4e3JMrkp5DA+l4MW27uVLiOjKl8+lEGa/qQsE8E6l43hvTZiXYW
	N5gA+FjMCPWQkKXovG7pDuTIPMzNUaisyJJFCoeovvAaQo3eeDDfEq4jEmHEwx4/pWS8u8nQ2ZItR
	IajMTFcQlIDE81WeFApw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uwl-00000007lS1-2dZn;
	Fri, 01 Nov 2024 16:56:27 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uwi-00000007lQf-3IqU;
	Fri, 01 Nov 2024 16:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1730480184; x=1762016184;
  h=message-id:date:mime-version:to:cc:references:subject:
   from:in-reply-to:content-transfer-encoding;
  bh=KmcSGZZTBepw/haBxjfNfgGPXnl3daZOBZVZzzq5xe4=;
  b=JhNAo0RkuYPwWT6NXXRY5Lqd72sRW+3PGX6JEpcCAc4sj2HvdujQLzMM
   bMckwXygDSoMCyxiKLED27RiN3ssl77ATmHMCV6h8ET9Phf9DD3IZ0N6p
   oe5SKdfO4S282m6+bhfEw5pw/GHynFeaRZZbAWNLNgYmn1KdyCwgRbo3f
   Y=;
X-IronPort-AV: E=Sophos;i="6.11,250,1725321600"; 
   d="scan'208";a="381765496"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 16:56:22 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.38.20:55997]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.34.72:2525] with esmtp (Farcaster)
 id 6a9142ea-5ddd-46d3-9d40-2688c563fdd9; Fri, 1 Nov 2024 16:56:21 +0000 (UTC)
X-Farcaster-Flow-ID: 6a9142ea-5ddd-46d3-9d40-2688c563fdd9
Received: from EX19D003UWC002.ant.amazon.com (10.13.138.169) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 1 Nov 2024 16:56:20 +0000
Received: from [192.168.208.156] (10.106.101.42) by
 EX19D003UWC002.ant.amazon.com (10.13.138.169) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Fri, 1 Nov 2024 16:56:17 +0000
Message-ID: <7bd627df-0303-4ded-b8c8-ceb84fb20f0d@amazon.com>
Date: Fri, 1 Nov 2024 09:56:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <dave.hansen@intel.com>
References: <784d1522-0451-4844-a334-8b7d49019437@intel.com>
Subject: Re: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
Content-Language: en-US
From: "Manwaring, Derek" <derekmn@amazon.com>
In-Reply-To: <784d1522-0451-4844-a334-8b7d49019437@intel.com>
X-Originating-IP: [10.106.101.42]
X-ClientProxiedBy: EX19D038UWB002.ant.amazon.com (10.13.139.185) To
 EX19D003UWC002.ant.amazon.com (10.13.138.169)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_095624_875365_6319AFBC 
X-CRM114-Status: GOOD (  19.85  )
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
Cc: jthoughton@google.com, canellac@amazon.at, luto@kernel.org, kvm@vger.kernel.org, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, kalyazin@amazon.com, svens@linux.ibm.com, linux-mm@kvack.org, pbonzini@redhat.com, linux-kselftest@vger.kernel.org, hpa@zytor.com, kernel@xen0n.name, shuah@kernel.org, agordeev@linux.ibm.com, elena.reshetova@intel.com, linux-s390@vger.kernel.org, mlipp@amazon.at, corbet@lwn.net, will@kernel.org, chenhuacai@kernel.org, linux-riscv@lists.infradead.org, mingo@redhat.com, tabba@google.com, mathieu.desnoyers@efficios.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, roypat@amazon.co.uk, linux-trace-kernel@vger.kernel.org, jgowans@amazon.com, aou@eecs.berkeley.edu, gor@linux.ibm.com, hca@linux.ibm.com, rostedt@goodmis.org, ackerleytng@google.com, xmarcalx@amazon.com, bp@alien8.de, loongarch@lists.linux.dev, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, x86@kernel.org, seanjc@google.com, derekmn@amazon.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, graf@amazon.com, vannapurve@google.com, rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

K0VsZW5hCgpPbiAyMDI0LTExLTAxIGF0IDE2OjA2KzAwMDAsIERhdmUgSGFuc2VuIHdyb3RlOgo+
IE9uIDEwLzMxLzI0IDE3OjEwLCBNYW53YXJpbmcsIERlcmVrIHdyb3RlOgo+ID4gVERYIGFuZCBT
RVYgZW5jcnlwdGlvbiBoYXBwZW5zIGJldHdlZW4gdGhlIGNvcmUgYW5kIG1haW4gbWVtb3J5LCBz
bwo+ID4gY2FjaGVkIGd1ZXN0IGRhdGEgd2UncmUgbW9zdCBjb25jZXJuZWQgYWJvdXQgZm9yIHRy
YW5zaWVudCBleGVjdXRpb24KPiA+IGF0dGFja3MgaXNuJ3QgbmVjZXNzYXJpbHkgaW5hY2Nlc3Np
YmxlLgo+ID4KPiA+IEknZCBiZSBpbnRlcmVzdGVkIHdoYXQgSW50ZWwsIEFNRCwgYW5kIG90aGVy
IGZvbGtzIHRoaW5rIG9uIHRoaXMsIGJ1dCBJCj4gPiB0aGluayBkaXJlY3QgbWFwIHJlbW92YWwg
aXMgd29ydGh3aGlsZSBmb3IgQ29DbyBjYXNlcyBhcyB3ZWxsLgo+Cj4gSSdtIG5vdCBzdXJlIHNw
ZWNpZmljYWxseSB3aGljaCBhdHRhY2tzIHlvdSBoYXZlIGluIG1pbmQuwqAgWy4uLl0KPgo+IEkg
X3RoaW5rXyB5b3UgbWlnaHQgYmUgdGhpbmtpbmcgb2YgYXR0YWNrcyBsaWtlIE1EUyB3aGVyZSBz
b21lIHJhbmRvbQo+IG1pY3JvYXJjaGl0ZWN0dXJhbCBidWZmZXIgY29udGFpbnMgZ3Vlc3QgZGF0
YSBhZnRlciBhIFZNIGV4aXQgYW5kIHRoZW4KPiBhbiBhdHRhY2tlciBleHRyYWN0cyBpdC7CoCBE
aXJlY3QgbWFwIHJlbW92YWwgZG9lc24ndCBhZmZlY3QgdGhlc2UKPiBidWZmZXJzIGFuZCBkb2Vz
bid0IG1pdGlnYXRlIGFuIGF0dGFja2VyIGdldHRpbmcgdGhlIGRhdGEgb3V0LgoKUmlnaHQsIHRo
ZSBvbmx5IGF0dGFja3Mgd2UgY2FuIHRod2FydCB3aXRoIGRpcmVjdCBtYXAgcmVtb3ZhbCBhcmUK
dHJhbnNpZW50IGV4ZWN1dGlvbiBhdHRhY2tzIG9uIHRoZSBob3N0IGtlcm5lbCB3aG9zZSBsZWFr
IG9yaWdpbiBpcwoiTWFwcGVkIG1lbW9yeSIgaW4gVGFibGUgMSBvZiB0aGUgUXVhcmFudGluZSBw
YXBlciBbMl0uIE1heWJlIHRoZQpzaW1wbGVzdCBoeXBvdGhldGljYWwgdG8gY29uc2lkZXIgaGVy
ZSBpcyBhIG5ldyBzcGVjdHJlIHYxIGdhZGdldCBpbiB0aGUKaG9zdCBrZXJuZWwuCgo+IFRoZSBt
YWluIHRoaW5nIEkgdGhpbmsgeW91IHdhbnQgdG8ga2VlcCBpbiBtaW5kIGlzIG1lbnRpb25lZCBp
biB0aGUgIlREWAo+IE1vZHVsZSB2MS41IEJhc2UgQXJjaGl0ZWN0dXJlIFNwZWNpZmljYXRpb24i
WzFdOgo+Cj4gPiBBbnkgc29mdHdhcmUgZXhjZXB0IGd1ZXN0IFREIG9yIFREWCBtb2R1bGUgbXVz
dCBub3QgYmUgYWJsZSB0bwo+ID4gc3BlY3VsYXRpdmVseSBvciBub24tc3BlY3VsYXRpdmVseSBh
Y2Nlc3MgVEQgcHJpdmF0ZSBtZW1vcnksCj4KPiBUaGF0J3MgYSBwcmV0dHkgYnJvYWQgY2xhaW0g
YW5kIGl0IGludm9sdmVzIG1pdGlnYXRpb25zIGluIGhhcmR3YXJlIGFuZAo+IHRoZSBURFggbW9k
dWxlLgo+Cj4gMS4gaHR0cHM6Ly9jZHJkdjIuaW50ZWwuY29tL3YxL2RsL2dldENvbnRlbnQvNzMz
NTc1CgpUaGFuayB5b3UsIEkgaGFkbid0IHNlZW4gdGhhdC4gVGhhdCBpcyBhIHZlcnkgc3Ryb25n
IGNsYWltIGFzIGZhciBhcwpwcmV2ZW50aW5nIHNwZWN1bGF0aXZlIGFjY2VzczsgSSBkaWRuJ3Qg
cmVhbGl6ZSBJbnRlbCBjbGFpbWVkIHRoYXQgYWJvdXQKVERYLiBUaGUgY29tbWEgZm9sbG93ZWQg
YnkgInRvIGRldGVjdCBpZiBhIHByaW9yIGNvcnJ1cHRpb24gYXR0ZW1wdCB3YXMKc3VjY2Vzc2Z1
bCIgbWFrZXMgbWUgd29uZGVyIGEgYml0IGlmIHRoZSBzdGF0ZW1lbnQgaXMgbm90IHF1aXRlIGFz
IGJyb2FkCmFzIGl0IHNvdW5kcywgYnV0IG1heWJlIHRoYXQncyBqdXN0IG1lYW50IHRvIHJlbGF0
ZSBpdCB0byB0aGUgaW50ZWdyaXR5CnNlY3Rpb24/Cgo+IElmIHRoZSBhdHRhY2sgaXMgbWl0aWdh
dGVkIHdoZW4gdGhlID4gZGF0YSBpcyBfbWFwcGVkXywgdGhlbiBpdCdzCj4gY2VydGFpbmx5IG5v
dCBwb3NzaWJsZSBfdW5tYXBwZWRfLgo+Cj4gU28gd2h5IGJvdGhlciB3aXRoIGRpcmVjdCBtYXAg
cmVtb3ZhbCBmb3IgVERYP8KgIEEgVk1NIHdyaXRlIHRvIFRECj4gcHJpdmF0ZSBkYXRhIGNhdXNl
cyBtYWNoaW5lIGNoZWNrcy7CoCBTbyBhbnkga2VybmVsIGJ1ZyB0aGF0IGV2ZW4KPiBhY2NpZGVu
dGFsbHkgd3JpdGVzIHRvIGtlcm5lbCBtZW1vcnkgY2FuIGJyaW5nIHRoZSB3aG9sZSBzeXN0ZW0g
ZG93bi4KPiBOb3QgbmljZS4KCkZhaXIgZW5vdWdoLiBJdCBoYXNuJ3QgYmVlbiBjbGVhciB0byBt
ZSBpZiB0aGVyZSBpcyBhIG1hY2hpbmUgY2hlY2sgd2hlbgp0aGUgaG9zdCBrZXJuZWwgYWNjZXNz
ZXMgZ3Vlc3QgbWVtb3J5IG9ubHkgdHJhbnNpZW50bHkuIEkgd2FzIGFzc3VtaW5nCnRoZXJlIGlz
IG5vdC4gQnV0IGlmIG90aGVyIG1pdGlnYXRpb25zIGNvbXBsZXRlbHkgcHJldmVudCBldmVuCnNw
ZWN1bGF0aXZlIGFjY2VzcyBvZiBURCBwcml2YXRlIG1lbW9yeSBsaWtlIHlvdSdyZSBzYXlpbmcs
IHRoZW4gYWdyZWUKbm90aGluZyB0byBnYWluIGZyb20gZGlyZWN0IG1hcCByZW1vdmFsIGluIHRo
ZSBURFggY2FzZS4KCkRlcmVrCgoKWzJdIGh0dHBzOi8vZG93bmxvYWQudnVzZWMubmV0L3BhcGVy
cy9xdWFyYW50aW5lX3JhaWQyMy5wZGYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
