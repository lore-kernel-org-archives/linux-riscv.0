Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE14C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 06:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqhWn4yPKMXp361pLwrWPBHBVTCsCRZ/kKi6smU/n3g=; b=iZBcKvod0uR9MI
	SXwp3+OyAiQ1AL5bWCbD/wjvIehlgEXzoXh8Dv/PmY5fXd3njMvVRpMOLVVB+5yvuH9e7M5U4aGqr
	s/y1Ji2OBAmeRx/pT2twtvanHXPxX/qqI5V8Qml98lGMsAqySlsRuMwZcrIIPLiSuGqAEUFKgJPVz
	KLDHYfrqL4UrXF3MQtgQ+wEpWt17SqZtD2ThMzdBcn6npBHZgwEvnfo3QKr3H11ZfLBOMltKp/GbS
	5ulx2b/QOIzGy6HBMQyPd1ma2X7YOb/KIIWnI472PlKHfTetqd9fJZ6xOdu7pMT7PlcfxMNYTDQsC
	DgnIWnA5Ljrnl7OVxXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF7xD-005ScC-Hu; Tue, 10 Jan 2023 06:17:47 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF7x9-005SZp-J0
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 06:17:45 +0000
Received: by mail-vk1-xa34.google.com with SMTP id z190so5129520vka.4
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 22:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CJjolKPlWAhG4ywZunllbYBE4Jf2JMO0vrAUHEfkjw=;
        b=UQV89TjBxsMqYrp4HaShVHvXh2Ce0AKWRK3bLEHVKP0BIHOPTp7pbUEbgPr4oDetb4
         KI6ji9+60LnPfZDux/u8NGhltUa2rNdtUr5nNvs+NOpOusIkyWogcQl3Qi0b5cVfk/HD
         Gh2i9t7rior+q6Me/lCPQIn5QuyDXHM2x5ueSvLMq8tc9SKm/TYktR9hWEx+W9AiGxj5
         QBuA6xIt4tgB+RWMMN8kJJ+9ox30KpjPsbLdlifphOkEGsHdICraWhSs5OrosNfPZgNW
         /+CCRvggxl47aOOHG//Hb/KGERPJPyYBOH7ZVvXsoEqhIZ3U0g+gLp7sWxQhP0YGc/g6
         GoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CJjolKPlWAhG4ywZunllbYBE4Jf2JMO0vrAUHEfkjw=;
        b=fmlu//3LuxtTDTK7abd1cGmwgtqlNfuvEd/7OX4KG3VC8aOVjo738IwwkFyoZ5v1ZB
         ACEUrehFdIoAtQUKfJThqfdyMIircj7OPbiG3B5L98rVDjy1i51Wmf+obc1wsegeZ+kc
         LrFfKcIVoqfnFG/kIijKJqayjQyxGmLYduBu1xS0F6t1ii8pzR6P7PDvUt74S+iVrNrg
         +lLFXPd4wb7Y2q3X24mYqkHK63Mgr2vP0l+THhRc3RcfmFtl2Rt0UTgNIWeKxvxsWRb9
         exG5WgBz7oP5pY0jyr7/SpsZ/gcJCDa1aK63A0SHJObWHD8mhU27huV7yAFW6UVcZF3E
         pd5Q==
X-Gm-Message-State: AFqh2kqz/N7DuzxtJ3tVWn/0Jqq6APqNDY0onmPY3SZDVhT8nOdIMxgw
	tn2Ud+x7oJyfzWU9SyxRxVBSKTSAw+bUMGCSo2BtXQ==
X-Google-Smtp-Source: AMrXdXv+UbPcEC0JIbuEUF6JQZeNC3GXIR+0tfBx5v6uXH+RRZFfR3XkgGAYKN5vIlEIZAfTFcYl9N5U9BOeOz/MzgA=
X-Received: by 2002:a1f:948e:0:b0:3b7:6c07:c79c with SMTP id
 w136-20020a1f948e000000b003b76c07c79cmr8478522vkd.34.1673331460720; Mon, 09
 Jan 2023 22:17:40 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCUKNFNRs6WkPNWV94BuLmT3KSPWK2FYCiD4PxPCxRs76PA@mail.gmail.com>
 <Y7wLa7I2hlz3rKw/@hirez.programming.kicks-ass.net> <CAOnJCU+qsJk9oL-2L8fJuGvpaJsyfwQ5+wFXA1L1jM6Fe=FK6A@mail.gmail.com>
In-Reply-To: <CAOnJCU+qsJk9oL-2L8fJuGvpaJsyfwQ5+wFXA1L1jM6Fe=FK6A@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 10 Jan 2023 11:47:29 +0530
Message-ID: <CAK9=C2W+WapkbiXE+b_6Gc4rN0mfMx6NUBcXk0p=f_VzhObZiw@mail.gmail.com>
Subject: Re: Expected rdpmc behavior during context swtich and a RISC-V conundrum
To: Atish Patra <atishp@atishpatra.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Will Deacon <will@kernel.org>, Stephane Eranian <eranian@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Beeman Strong <beeman@rivosinc.com>, 
	Atish Patra <atishp@rivosinc.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_221743_675645_1EC5DBC9 
X-CRM114-Status: GOOD (  51.65  )
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

K2xpbnV4LXJpc2N2ICtrdm0tcmlzY3YKCk9uIFR1ZSwgSmFuIDEwLCAyMDIzIGF0IDE6MjYgQU0g
QXRpc2ggUGF0cmEgPGF0aXNocEBhdGlzaHBhdHJhLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEph
biA5LCAyMDIzIGF0IDQ6NDEgQU0gUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3Jn
PiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEphbiAwNSwgMjAyMyBhdCAxMTo1OToyNEFNIC0wODAw
LCBBdGlzaCBQYXRyYSB3cm90ZToKPiA+ID4gSGkgQWxsLAo+ID4gPiBUaGVyZSB3YXMgYSByZWNl
bnQgdWFiaSB1cGRhdGVbMV0gZm9yIFJJU0MtViB0aGF0IGFsbG93cyB0aGUgdXNlcnMgdG8KPiA+
ID4gcmVhZCBjeWNsZSBhbmQgaW5zdHJ1Y3Rpb24gY291bnQgd2l0aG91dCBhbnkgY2hlY2tzLgo+
ID4gPiBXZSB0cmllZCB0byByZXN0cmljdCB0aGF0IGJlaGF2aW9yIHRvIGFkZHJlc3Mgc2VjdXJp
dHkgY29uY2VybnMKPiA+ID4gZWFybGllciBidXQgaXQgcmVzdWx0ZWQgaW4gYnJlYWthZ2UgZm9y
IHNvbWUgdXNlciBzcGFjZQo+ID4gPiBhcHBsaWNhdGlvbnNbMl0uCj4gPiA+IFRodXMsIHByZXZp
b3VzIGJlaGF2aW9yIHdhcyByZXN0b3JlZCB3aGVyZSBhIHVzZXIgb24gUklTQy1WIHBsYXRmb3Jt
cwo+ID4gPiBjYW4gZGlyZWN0bHkgcmVhZCBjeWNsZSBvciBpbnN0cnVjdGlvbiBjb3VudFszXS4K
PiA+ID4KPiA+ID4gQ29tcGFyaXNvbiB3aXRoIG90aGVyIElTQXMgdy5yLnQgdXNlciBzcGFjZSBh
Y2Nlc3Mgb2YgY291bnRlcnM6Cj4gPiA+IEFSTTY0Cj4gPiA+ICAgLS0gRW5hYmxlZC9EaXNhYmxl
ZCB2aWEgKC9wcm9jL3N5cy9rZXJuZWwvcGVyZl91c2VyX2FjY2VzcykKPiA+ID4gICAtLSBPbmx5
IGZvciB0YXNrIGJvdW5kIGV2ZW50cyBjb25maWd1cmVkIHZpYSBwZXJmLgo+ID4gPgo+ID4gPiBY
ODYKPiA+ID4gIC0tLSByZHBtYyBpbnN0cnVjdGlvbgo+ID4gPiAgLS0tIEVuYWJsZS9EaXNhYmxl
IHZpYSDigJwvc3lzL2RldmljZXMvY3B1L3JkcG1j4oCdCj4gPiA+IC0tIEJlZm9yZSB2NC4wCj4g
PiA+ICAtLSBhbnkgcHJvY2VzcyAoZXZlbiB3aXRob3V0IGFjdGl2ZSBwZXJmIGV2ZW50KSByZHBt
Ywo+ID4gPiBBZnRlciB2NC4wCj4gPiA+IC0tIERlZmF1bHQgYmVoYXZpb3IgY2hhbmdlZCB0byBz
dXBwb3J0IG9ubHkgYWN0aXZlIGV2ZW50cyBpbiBhCj4gPiA+IHByb2Nlc3PigJlzIGNvbnRleHQu
Cj4gPiA+IC0tIENvbmZpZ3VyZWQgdGhyb3VnaCBwZXJmIHNpbWlsYXIgdG8gQVJNNjQKPiA+ID4g
LS0gQ29udGludWUgdG8gbWFpbnRhaW4gYmFja3dhcmQgY29tcGF0aWJpbGl0eSBmb3IgdW5yZXN0
cmljdGVkIGFjY2Vzcwo+ID4gPiBieSB3cml0aW5nIDIgdG8g4oCcL3N5cy9kZXZpY2VzL2NwdS9y
ZHBtY+KAnQo+ID4gPgo+ID4gPiBJTU8sIFJJU0MtViBzaG91bGQgb25seSBlbmFibGUgdXNlciBz
cGFjZSBhY2Nlc3MgdGhyb3VnaCBwZXJmIHNpbWlsYXIKPiA+ID4gdG8gQVJNNjQgYW5kIHg4NiAo
cG9zdCB2NC4wKS4KPiA+ID4gSG93ZXZlciwgd2UgZG8gaGF2ZSB0byBzdXBwb3J0IHRoZSBsZWdh
Y3kgYmVoYXZpb3IgdG8gYXZvaWQKPiA+ID4gYXBwbGljYXRpb24gYnJlYWthZ2UuCj4gPiA+IEFz
IHBlciBteSB1bmRlcnN0YW5kaW5nIGEgZGlyZWN0IHVzZXIgc3BhY2UgYWNjZXNzIGNhbiBsZWFk
IHRvIHRoZQo+ID4gPiBmb2xsb3dpbmcgcHJvYmxlbXM6Cj4gPiA+Cj4gPiA+IDEpIFRoZXJlIGlz
IG5vIGNvbnRleHQgc3dpdGNoIHN1cHBvcnQsIHNvIGNvdW50cyBmcm9tIG90aGVyIGNvbnRleHRz
IGFyZSBleHBvc2VkCj4gPiA+IDIpIElmIGEgcGVyZiB1c2VyIGlzIGFsbG9jYXRlZCBvbmUgb2Yg
dGhlc2UgY291bnRlcnMsIHRoZSBjb3VudGVyCj4gPiA+IHZhbHVlIHdpbGwgYmUgd3JpdHRlbgo+
ID4gPgo+ID4gPiBMb29raW5nIGF0IHRoZSB4ODYgY29kZSBhcyBpdCBjb250aW51ZXMgdG8gYWxs
b3cgdGhlIGFib3ZlIGJlaGF2aW9yLAo+ID4gPiByZHBtY19hbHdheXNfYXZhaWxhYmxlX2tleSBp
cyBlbmFibGVkIGluIHRoZSBhYm92ZSBjYXNlLiBIb3dldmVyLAo+ID4gPiBkdXJpbmcgdGhlIGNv
bnRleHQgc3dpdGNoIChjcjRfdXBkYXRlX3BjZV9tbSkKPiA+ID4gb25seSBkaXJ0eSBjb3VudGVy
cyBhcmUgY2xlYXJlZC4gSXQgb25seSBwcmV2ZW50cyBsZWFrYWdlIGZyb20gcGVyZgo+ID4gPiB0
YXNrIHRvIHJkcG1jIHRhc2suCj4gPiA+Cj4gPiA+IEhvdyBkb2VzIHRoZSBjb250ZXh0IHN3aXRj
aCBvZiBjb3VudGVycyB3b3JrIGZvciB1c2VycyB3aG8gZW5hYmxlCj4gPiA+IHVucmVzdHJpY3Rl
ZCBhY2Nlc3MgYnkgd3JpdGluZyAyIHRvIOKAnC9zeXMvZGV2aWNlcy9jcHUvcmRwbWPigJ0gPwo+
ID4gPiBPdGhlcndpc2UsIHJkcG1jIHVzZXJzIGxpa2VseSBnZXQgbm9pc2UgZnJvbSBvdGhlciBh
cHBsaWNhdGlvbnMuIElzCj4gPiA+IHRoYXQgZXhwZWN0ZWQgPwo+ID4gPiBUaGlzIGNhbiBiZSBh
IHNlY3VyaXR5IGNvbmNlcm4gYWxzbyB3aGVyZSBhIHJvZ3VlIHJkcG1jIHVzZXIKPiA+ID4gYXBw
bGljYXRpb24gY2FuIG1vbml0b3Igb3RoZXIgY3JpdGljYWwgYXBwbGljYXRpb25zIHRvIGluaXRp
YXRlIHNpZGUKPiA+ID4gY2hhbm5lbCBhdHRhY2suCj4gPiA+Cj4gPiA+IEFtIEkgbWlzc2luZyBz
b21ldGhpbmc/IFBsZWFzZSBjb3JyZWN0IG15IHVuZGVyc3RhbmRpbmcgb2YgdGhlIHg4Ngo+ID4g
PiBpbXBsZW1lbnRhdGlvbiBpZiBpdCBpcyB3cm9uZy4KPiA+Cj4gPiBTbyBvbiB4ODYgd2UgaGF2
ZSBSRFRTQyBhbmQgUkRQTUMgaW5zdHJ1Y3Rpb25zLiBSRFRTQyByZWFkcyB0aGUKPiA+IFRpbWUt
U3RhbXAtQ291bnRlciB3aGljaCBpcyBhIGdsb2JhbGx5IHN5bmNocm9uaXplZCBtb25vdG9uaWMg
aW5jcmVhc2luZwo+ID4gY291bnRlciBhdCBzb21lICdyYW5kb20nIHJhdGUgKGlkZWFsaXplZCwg
ZG9uJ3QgYXNrKS4gVGhpcyB0aGluZyBpcyB1c2VkCj4gPiBmb3IgdGltZS1rZWVwaW5nIGV0Yy4u
Cj4gPgo+ID4gQW5kIHRoZW4gdGhlcmUncyBSRFBNQyB3aGljaCAob3B0aW9uYWxseSkgYWxsb3dz
IHJlYWRpbmcgdGhlIFBNVQo+ID4gY291bnRlcnMgd2hpY2ggYXJlIG5vcm1hbGx5IGRpc2FibGVk
IGFuZCBhbGwgMC4KPiA+Cj4gPiBFdmVuIGlmIFJEUE1DIGlzIHVuY29uZGl0aW9uYWxseSBhbGxv
d2VkIGZyb20gdXNlcnNwYWNlICh0aGUgMiBvcHRpb24KPiA+IHlvdSByZWZlciB0bykgdXNlcnNw
YWNlIHdpbGwgb25seSBiZSBhYmxlIHRvIHJlYWQgdGhlc2UgMHMgdW5sZXNzCj4gPiBzb21lb25l
IGFsc28gcHJvZ3JhbXMgdGhlIFBNVS4gTGludXggb25seSBzdXBwb3J0cyBhIHNpbmdsZSBtZWFu
cyBvZgo+ID4gZG9pbmcgc286IHBlcmYgKHNvbWUgcGVvcGxlIHVzZSAvZGV2L21zciB0byBwb2tl
IGRpcmVjdGx5IHRvIHRoZSBNU1JzCj4gPiBidXQgdGhleSBnZXQgdG8ga2VlcCBhbGwgcGllY2Vz
KS4KPiA+Cj4KPiBJdCBtYWtlcyBzZW5zZSBub3cuIFRoYW5rcyEhCj4KPiBBRkFJSywgdGhlIC9k
ZXYvbXNyIGludGVyZmFjZSBpcyBhbHNvIGFsbG93ZWQgZm9yIHJvb3QgdXNlcnMgb25seS4gU28g
dGhhdAo+IGNvdmVycyB0aGUgc2VjdXJpdHkgY29uY2VybnMgSSB3YXMgYXNraW5nIGFib3V0Lgo+
Cj4gPiBSRFBNQyBpcyBvbmx5IHVzZWZ1bCBpZiB5b3UgcmVhZCBjb3VudGVycyB5b3Ugb3duIG9u
IHlvdXJzZWxmIC0tIElPVwo+ID4gc2VsZm1vbml0b3JpbmcsIHVzaW5nIHRoZSBpbnRlcmZhY2Ug
b3V0bGluZWQgaW4gdWFwaS9saW51eC9wZXJmX2V2ZW50cy5oCj4gPiBuZWFyIHN0cnVjdCBwZXJm
X2V2ZW50X21tYXBfcGFnZS4KPiA+Cj4gPiBBbnkgb3RoZXIgdXNhZ2UgLS0geW91IGdldCB0byBr
ZWVwIHRoZSBwaWVjZXMuCj4gPgo+ID4gQ2FuIHlvdSBvYnNlcnZlIHJhbmRvbSBvdGhlciBjb3Vu
dGVycywgeWVzLCB1bmF2b2lkYWJseSBzby4gVGhlIHN5c2ZzCj4gPiBjb250cm9sIHlvdSBtZW50
aW9uIHdhcyBpbnN0aXR1dGVkIHRvIHJlc3RyaWN0IHRoaXMgc29tZXdoYXQuCj4gPgo+ID4gSWYg
dGhlIFJJU0MtViBjb3VudGVycyBhcmUgZnVuZGFtZW50YWxseSB0aGUgUE1VIGNvdW50ZXJzIHRo
YXQgbmVlZCB0bwo+ID4gYmUgcmVzZXQgdG8gdHJpZ2dlciBldmVudHMsIHRoZW4geW91J3ZlIG1h
bmFnZWQgdG8gcGFpbnQgeW91cnNlbGYgaW50byBhCj4gPiB0aWdodCBzcG90IDovCj4gPgo+ID4g
RWl0aGVyIHlvdSBtdXN0IGRpcy1hbGxvdyB1c2Vyc3BhY2UgYWNjZXNzIHRvIHRoZXNlIHRoaW5n
cyAoYW5kIGJyZWFrCj4gPiB0aGVtKSBvciBsaW1pdCB0aGUgUE1VIHVzYWdlIC0tIGJvdGggb3B0
aW9ucyBzdWNrLgo+ID4KPiA+Cj4gPiBOb3csIEknbSB0aGlua2luZyB0aGF0IGVzcC4gc29tZXRo
aW5nIGxpa2UgaW5zdHJ1Y3Rpb24gY291bnQgaXMgbm90Cj4gPiBzeW5jaHJvbml6ZWQgYmV0d2Vl
biBjb3JlcyAoc2VlbXMgZnVuZGFtZW50YWxseSBpbXBvc3NpYmxlKSBhbmQgY2FuIG9ubHkKPiA+
IGJlIHJlYXNvbmFibHkgYmUgY29uc3VtZWQgKGFuZCBjb21wYXJlZCkgd2hlbiBzdHJpY3RseSBh
ZmZpbmUgdG8gYQo+ID4gcGFydGljdWxhciBDUFUsIHlvdSBjYW4gYXJndWUgdGhhdCBhcHBsaWNh
dGlvbnMgZG9pbmcgdGhpcyB3aXRob3V0IGFsc28KPiA+IHN0cmljdGx5IG1hbmFnaW5nIHRoZWly
IGFmZmluaXR5IG1hc2sgYXJlIGJyb2tlbiBhbnl3YXkgYW5kIHRoZXJlZm9yZQo+ID4geW91ciBi
cmVha2FnZSBpcyBub3QgaW4gZmFjdCBhIGJyZWFraW5nIHRoZW0gLS0geW91IGNhbid0IGJyZWFr
Cj4gPiBzb21ldGhpbmcgdGhhdCdzIGFscmVhZHkgYnJva2VuLgo+ID4KPgo+IEkgdGhpbmsgbW9z
dCBicm9rZW4gYXBwbGljYXRpb25zIHdlcmUgdXNpbmcgcmRjeWNsZSB0byBtZWFzdXJlIHRpbWUK
PiB3aGljaCB3YXMgd3JvbmcgYW55d2F5cy4KPiBJdCBwcm9iYWJseSBoYXBwZW5lZCBiZWNhdXNl
IHRoZXJlIHdhcyBubyAidGltZSIgQ1NSIGluIHRoZSBlYXJseQo+IGhhcmR3YXJlcy4gVGh1cywg
dGhlIHJkdGltZSB3b3VsZAo+IHRyYXAgJiBlbXVsYXRlZCBieSB0aGUgZmlybXdhcmUgd2hpY2gg
d2FzIHNsb3cuIFRoaXMgbGVhZCB0byB1c2VyCj4gc3BhY2UgYXBwbGljYXRpb24gdG8gdXNlIHJk
Y3ljbGUgd2hpY2gKPiB3YXMgbm90IGNvcnJlY3QgZWl0aGVyLiBTbyB0aGUgZXhpc3RpbmcgYXBw
bGljYXRpb25zIGFyZSBicm9rZW4gZm9yCj4gdXNpbmcgcmRjeWNsZSBhcyB3ZWxsLgo+Cj4gU2lu
Y2UgYm90aCBjeWNsZSAmIGluc3RyZXQgYmVoYXZlIHNpbWlsYXJseSAoZml4ZWQgY291bnRlcnMp
LCB0aGV5IGdldAo+IGVuYWJsZWQvZGlzYWJsZWQgdG9nZXRoZXIuCj4KPiA+Cj4gPiBBbnl3YXks
IGdpdmVuIFJJU0MtViBiZWluZyBhIHZlcnkgeW91bmcgcGxhdGZvcm0sIEkgd291bGQgdHJ5IHJl
YWxseQo+ID4gKnJlYWxseSogKlJFQUxMWSogaGFyZCB0byBzdG9tcCBvbiB0aGVzZSBhcHBsaWNh
dGlvbnMgYW5kIGdldCB0aGVtIHRvCj4gPiBjaGFuZ2UgaW4gb3JkZXIgdG8gcmVjbGFpbSB0aGUg
UE1VIHVzYWdlLgo+Cj4gWWVzLiBUaGFua3MgZm9yIHlvdXIgdmFsdWFibGUgaW5wdXQuCgpJIGFn
cmVlIHdpdGggUGV0ZXIgWi4gV2UgaGFkIGEgc2ltaWxhciBkaXNjdXNzaW9uIGluIHRoZQpQZXJm
b3JtYW5jZSBBbmFseXNpcyBTSUcgb2YgUklTQy1WIGludGVybmF0aW9uYWwgYXMgd2VsbC4KClRo
aXMgYWxzbyBmb3JjZXMgS1ZNIChhbmQgb3RoZXIgaHlwZXJ2aXNvcnMpIHRvIHNhdmUtbi1yZXN0
b3JlCkNZQ0xFIGFuZCBJTlNUUlVDVElPTiBjb3VudGVycyBzbyB0aGF0IG9uZSBHdWVzdC9WTQpj
YW4ndCBzZWUgY3ljbGUvaW5zdHJ1Y3Rpb24gY291bnRzIGZyb20gYW5vdGhlciBHdWVzdC9WTS4K
Ck9ubHkgYSBmZXcgYXBwbGljYXRpb25zIGFyZSBhZmZlY3RlZCBhbmQgUklTQy1WIGVjb3N5c3Rl
bQppcyB5b3VuZyBzbyBpdCBpcyBiZXR0ZXIgdG8gY2hhbmdlIHRoZXNlIGFwcGxpY2F0aW9ucyBy
YXRoZXIKdGhhbiBtYWtpbmcgQ1lDTEUgYW5kIElOU1RSVUNUSU9OIGNvdW50ZXJzIGFzIHBhcnQK
b2YgdUFCSS4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
