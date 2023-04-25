Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A35C6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7N6XzdCcZT2mC3NpnpkmO3FmMqb7Mu5JpcagtcZUFMQ=; b=ZQgt4QyHlBj1wk
	0mLVbeOkhrW6KjBPYUGDV0U1vaEphPZNAxV2jEp8LYXBKVjjVjf4W39JaMPWdXeypfpP3caiO2kbJ
	ZGRBF9u8F+qQhDGq32iUMEXCZul3uaCEmsCeIcyjfRVF1cPtRXJgXac5Br209jm202q3bjx4/quWs
	oX0vsqY/ZRNby//FUP8wk+QbyDIHND9XJOvQbn0ubpAaHDiZa1apPqGZZLw8WZLSgepF8+1z8Ioz7
	XnbMKPDq95i3HPgh0fCaYF4PV3vqA5SuHSKb9NuUsj63xn3ZVyUmSFbKMh1kAuVzBVLZkUI7RXtXV
	VicAFX+OEGg//PWwbG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prIRU-001A1z-2R;
	Tue, 25 Apr 2023 13:10:48 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prIRR-0019zE-0g;
	Tue, 25 Apr 2023 13:10:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682428245; x=1713964245;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rjBDnveYTlgu+7sEbRfwz2mR/VV2dupmzj53Ht6fq5I=;
  b=mJad9lR/v1br5RrSSqw0mmK/9vO+G4NGCqCoXKtaOFfQ+kFth0CmE5yB
   u3DTV2a8io61HK3N5ILGwvYju/wrwJ5Ocqb6GKyqVtzetCqob9P8Tux0M
   4K4KgKN5GuvbteKNKIMyyN22xbinOkdzFiWMb48amjyeR6RuMM3NZBDEI
   uAzjaVmlhKk5oJ/D109jQQ/htdzpMTUnlYWEMROjI/dLan4uDv/JI1ZVo
   zGvyR8P7aiusCKCJ7xTR6SSEwI6xDZ1PMCNX9+b/2jNVPcHvm4rEmxADO
   Cjas+nAG+26tnId82EOOwWtw2Pkj5IotRju36ssfQsznAjBMiTkfgOVTv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="326360157"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="326360157"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 06:10:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="939765044"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="939765044"
Received: from gchacko-mobl1.gar.corp.intel.com (HELO [10.215.145.52]) ([10.215.145.52])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 06:10:17 -0700
Message-ID: <fe1a849a-3276-5fad-869b-bad54bc918f6@intel.com>
Date: Tue, 25 Apr 2023 06:10:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap
 hooks
Content-Language: en-US
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>,
 Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev,
 Dylan Reid <dylan@rivosinc.com>, abrestic@rivosinc.com,
 Samuel Ortiz <sameo@rivosinc.com>, Christoph Hellwig <hch@infradead.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren
 <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jiri Slaby <jirislaby@kernel.org>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Uladzislau Rezki <urezki@gmail.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
 <20230419221716.3603068-46-atishp@rivosinc.com>
 <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com>
 <CAHBxVyFhDapAeMQ8quBqWZ10jWSHw1CdE227ciyKQpULHYzffA@mail.gmail.com>
 <81c476f4-ef62-e4a6-0033-8a46a15379fd@intel.com>
 <CAHBxVyHg7vTaQJWKoVSD8budVZEYSo1eDOyZyZK7gcJApR7SbA@mail.gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <CAHBxVyHg7vTaQJWKoVSD8budVZEYSo1eDOyZyZK7gcJApR7SbA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_061045_268621_F2F73F5E 
X-CRM114-Status: GOOD (  43.57  )
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

T24gNC8yNS8yMyAwMTowMCwgQXRpc2ggS3VtYXIgUGF0cmEgd3JvdGU6Cj4gT24gTW9uLCBBcHIg
MjQsIDIwMjMgYXQgNzoxOOKAr1BNIERhdmUgSGFuc2VuIDxkYXZlLmhhbnNlbkBpbnRlbC5jb20+
IHdyb3RlOgo+PiBPbiA0LzIxLzIzIDEyOjI0LCBBdGlzaCBLdW1hciBQYXRyYSB3cm90ZToKPj4g
SSdtIG5vdCBfcXVpdGVfIHN1cmUgd2hhdCAiZ3Vlc3QgaW5pdGlhdGVkIiBtZWFucy4gIEJ1dCBT
RVYgYW5kIFREWAo+PiBkb24ndCByZXF1aXJlIGFuIGlvcmVtYXAgaG9vayBsaWtlIHRoaXMuICBT
bywgZXZlbiBpZiB0aGV5ICphcmUqICJndWVzdAo+PiBpbml0aWF0ZWQiLCB0aGUgcXVlc3Rpb24g
c3RpbGwgcmVtYWlucyBob3cgdGhleSB3b3JrIHdpdGhvdXQgdGhpcyBwYXRjaCwKPj4gb3Igd2hh
dCB0aGV5IGFyZSBtaXNzaW5nIHdpdGhvdXQgaXQuCj4gCj4gTWF5YmUgSSBtaXN1bmRlcnN0b29k
IHlvdXIgcXVlc3Rpb24gZWFybGllci4gQXJlIHlvdSBjb25jZXJuZWQgYWJvdXQgZ3Vlc3RzCj4g
aW52b2tpbmcgYW55IE1NSU8gcmVnaW9uIHNwZWNpZmljIGNhbGxzIGluIHRoZSBpb3JlbWFwIHBh
dGggb3IgcGFzc2luZwo+IHRoYXQgaW5mb3JtYXRpb24gdG8gdGhlIGhvc3QgPwoKTXkgY29uY2Vy
biBpcyB0aGF0IEkgZG9uJ3Qga25vdyB3aHkgdGhpcyBwYXRjaCBpcyBoZXJlLiAgVGhlcmUgc2hv
dWxkIGJlCmEgdmVyeSBzaW1wbGUgYW5zd2VyIHRvIHRoZSBxdWVzdGlvbjogV2h5IGRvZXMgUklT
Qy1WIG5lZWQgdGhpcyBwYXRjaApidXQgeDg2IGRvZXMgbm90PwoKPiBFYXJsaWVyLCBJIGFzc3Vt
ZWQgdGhlIGZvcm1lciBidXQgaXQgc2VlbXMgeW91IGFyZSBhbHNvIGNvbmNlcm5lZAo+IGFib3V0
IHRoZSBsYXR0ZXIgYXMgd2VsbC4gU29ycnkgZm9yIHRoZSBjb25mdXNpb24gaW4gdGhhdCBjYXNl
Lgo+IFRoZSBndWVzdCBpbml0aWF0aW9uIGlzIG5lY2Vzc2FyeSB3aGlsZSB0aGUgaG9zdCBub3Rp
ZmljYXRpb24gY2FuIGJlCj4gbWFkZSBvcHRpb25hbC4KPiBUaGUgImd1ZXN0IGluaXRpYXRlZCIg
bWVhbnMgdGhlIGd1ZXN0IHRlbGxzIHRoZSBUU00gKGVxdWl2YWxlbnQgb2YgVERYCj4gbW9kdWxl
IGluIFJJU0MtVikgdGhlIE1NSU8gcmVnaW9uIGRldGFpbHMuCj4gVGhlIFRTTSBrZWVwcyBhIHRy
YWNrIG9mIHRoaXMgYW5kIGFueSBwYWdlIGZhdWx0cyB0aGF0IGhhcHBlbiBpbiB0aGF0Cj4gcmVn
aW9uIGFyZSBmb3J3YXJkZWQKPiB0byB0aGUgaG9zdCBieSB0aGUgVFNNIGFmdGVyIHRoZSBpbnN0
cnVjdGlvbiBkZWNvZGluZy4gVGh1cyBUU00gY2FuCj4gbWFrZSBzdXJlIHRoYXQgb25seSBpb3Jl
bWFwcGVkIHJlZ2lvbnMgYXJlCj4gY29uc2lkZXJlZCBNTUlPIHJlZ2lvbnMuIE90aGVyd2lzZSwg
YWxsIG1lbW9yeSBvdXRzaWRlIHRoZSBndWVzdAo+IHBoeXNpY2FsIHJlZ2lvbiB3aWxsIGJlIGNv
bnNpZGVyZWQgYXMgdGhlIE1NSU8gcmVnaW9uLgoKQWhoLCBPSywgdGhhdCdzIGEgZmFtaWxpYXIg
cHJvYmxlbS4gIEkgc2VlIHRoZSBjb25uZWN0aW9uIHRvIGRldmljZQpmaWx0ZXJpbmcgbm93LgoK
SXMgdGhpcyBmdW5jdGlvbmFsaXR5IGluIHRoZSBjdXJyZW50IHNldD8gIEkgd2VudCBsb29raW5n
IGZvciBpdCBhbmQgYWxsCkkgZm91bmQgd2FzIHRoZSBob3N0IG5vdGlmaWNhdGlvbiBzaWRlLgoK
SXMgdGhpcyB0aGUgb25seSBtZWNoYW5pc20gYnkgd2hpY2ggdGhlIGd1ZXN0IHRlbGxzIHRoZSBU
U00gd2hpY2ggcGFydHMKb2YgdGhlIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgY2FuIGJl
IGV4cG9zZWQgdG8gdGhlIGhvc3Q/CgpGb3IgVERYIGFuZCBTRVYsIHRoYXQgaW5mb3JtYXRpb24g
aXMgaW5mZXJyZWQgZnJvbSBhIGJpdCBpbiB0aGUgcGFnZQp0YWJsZXMuICBFc3NlbnRpYWxseSwg
dGhlcmUgYXJlIGRlZGljYXRlZCBndWVzdCBwaHlzaWNhbCBhZGRyZXNzZXMgdGhhdAp0ZWxsIHRo
ZSBoYXJkd2FyZSBob3cgdG8gdHJlYXQgdGhlIG1hcHBpbmdzOiBzaG91bGQgdGhlIHNlY3VyZSBw
YWdlCnRhYmxlcyBvciB0aGUgaG9zdCdzIEVQVC9OUFQgYmUgY29uc3VsdGVkPwoKSWYgdGhhdCBt
ZWNoYW5pc20gaXMgZGlmZmVyZW50IGZvciBSSVNDLVYsIGl0IHdvdWxkIGdvIGEgbG9uZyB3YXkg
dG8KZXhwbGFpbmluZyB3aHkgUklTQy1WIG5lZWRzIHRoaXMgcGF0Y2guCgo+IEluIHRoZSBjdXJy
ZW50IENvVkUgaW1wbGVtZW50YXRpb24sIHRoYXQgTU1JTyByZWdpb24gaW5mb3JtYXRpb24gaXMg
YWxzbwo+IHBhc3NlZCB0byB0aGUgaG9zdCB0byBwcm92aWRlIGFkZGl0aW9uYWwgZmxleGliaWxp
dHkuIFRoZSBob3N0IG1heQo+IGNob29zZSB0byBkbyBhZGRpdGlvbmFsCj4gc2FuaXR5IGNoZWNr
IGFuZCBiYWlsIGlmIHRoZSBmYXVsdCBhZGRyZXNzIGRvZXMgbm90IGJlbG9uZyB0bwo+IHJlcXVl
c3RlZCBNTUlPIHJlZ2lvbnMgd2l0aG91dAo+IGdvaW5nIHRvIHRoZSB1c2Vyc3BhY2UuIFRoaXMg
aXMgcHVyZWx5IGFuIG9wdGltaXphdGlvbiBhbmQgbWF5IG5vdCBiZSBtYW5kYXRvcnkuCgpNYWtl
cyBzZW5zZSwgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uCgo+Pj4gSXQgY2FuIGJlIGEgc3Vi
c2V0IG9mIHRoZSByZWdpb24ncyBob3N0IHByb3ZpZGVkIHRoZSBsYXlvdXQuIFRoZQo+Pj4gZ3Vl
c3QgZGV2aWNlIGZpbHRlcmluZyBzb2x1dGlvbiBpcyBiYXNlZCBvbiB0aGlzIGlkZWEgYXMgd2Vs
bCBbMV0uCj4+Pgo+Pj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMDkzMDAx
MDUxMS4zMzg3OTY3LTEtc2F0aHlhbmFyYXlhbmFuLmt1cHB1c3dhbXlAbGludXguaW50ZWwuY29t
Lwo+Pgo+PiBJIGRvbid0IHJlYWxseSBzZWUgdGhlIGNvbm5lY3Rpb24uICBFdmVuIGlmIHRoYXQg
c2VyaWVzIHdhcyBnb2luZwo+PiBmb3J3YXJkIChJJ20gbm90IHN1cmUgaXQgaXMpIHRoZXJlIGlz
IG5vIGlvcmVtYXAgaG9vayB0aGVyZS4gIFRoZXJlJ3MKPj4gYWxzbyBubyBndWVzdC0+aG9zdCBj
b21tdW5pY2F0aW9uIGluIHRoYXQgc2VyaWVzLiAgVGhlIGd1ZXN0IGRvZXNuJ3QKPj4gX3RlbGxf
IHRoZSBob3N0IHdoZXJlIHRoZSBNTUlPIGlzLCBpdCBqdXN0IGRlY2xpbmVzIHRvIHJ1biBjb2Rl
IGZvcgo+PiBkZXZpY2VzIHRoYXQgaXQgZGlkbid0IGV4cGVjdCB0byBzZWUuCj4gCj4gVGhpcyBp
cyBhIHJlY2VudCB2ZXJzaW9uIG9mIHRoZSBhYm92ZSBzZXJpZXMgZnJvbSB0ZHggZ2l0aHViLiBU
aGlzIGlzCj4gYSBXSVAgYXMgd2VsbCBhbmQgaGFzIG5vdCBiZWVuIHBvc3RlZCB0bwo+IHRoZSBt
YWlsaW5nIGxpc3QuIFRodXMsIGl0IG1heSBiZSBnb2luZyB1bmRlciByZXZpc2lvbnMgYXMgd2Vs
bC4KPiBBcyBwZXIgbXkgdW5kZXJzdGFuZGluZyB0aGUgYWJvdmUgaW9yZW1hcCBjaGFuZ2VzIGZv
ciBURFggbWFyayB0aGUKPiBpb3JlbWFwcGVkIHBhZ2VzIGFzIHNoYXJlZC4KPiBUaGUgZ3Vlc3Qt
Pmhvc3QgY29tbXVuaWNhdGlvbiBoYXBwZW4gaW4gdGhlICNWRSBleGNlcHRpb24gaGFuZGxlcgo+
IHdoZXJlIHRoZSBndWVzdCBjb252ZXJ0cyB0aGlzIHRvIGEgaHlwZXJjYWxsIGJ5IGludm9raW5n
IFRERy5WUC5WTUNBTEwKPiB3aXRoIGFuIEVQVCB2aW9sYXRpb24gc2V0LiBUaGUgaG9zdCB3b3Vs
ZCBlbXVsYXRlIGFuIE1NSU8gYWRkcmVzcyBpZgo+IGl0IGdldHMgYW4gVk1DQUxMIHdpdGggRVBU
IHZpb2xhdGlvbi4KPiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIGFtIHdyb25nLgoKWWVhaCwgVERY
IGRvZXM6CgoxLiBHdWVzdCBNTUlPIGFjY2VzcwoyLiBHdWVzdCAjVkUgaGFuZGxlciAoaWYgdGhl
IGFjY2VzcyBmYXVsdHMpCjMuIEd1ZXN0IGh5cGVyY2FsbC0+aG9zdAo0LiBIb3N0IGZpeGVzIHRo
ZSBmYXVsdAo1LiBIeXBlcmNhbGwgcmV0dXJucywgZ3Vlc3QgcmV0dXJucyBmcm9tICNWRSB2aWEg
SVJFVAo2LiBHdWVzdCByZXRyaWVzIE1NSU8gaW5zdHJ1Y3Rpb24KCkZyb20gd2hhdCB5b3Ugc2Fp
ZCwgUklTQy1WIGFwcGVhcnMgdG8gZG86CgoxLiBHdWVzdCBNTUlPIGFjY2VzcwoyLiBIb3N0IE1N
SU8gaGFuZGxlcgozLiBIb3N0IGhhbmRsZXMgdGhlIGZhdWx0LCByZXR1cm5zCjQuIEd1ZXN0IHJl
dHJpZXMgTU1JTyBpbnN0cnVjdGlvbgoKSW4gb3RoZXIgd29yZHMsIHRoaXMgbWVjaGFuaXNtIGRv
ZXMgdGhlIHNhbWUgdGhpbmcgYnV0IHNob3J0LWNpcmN1aXRzCnRoZSB0cmlwIHRocm91Z2ggI1ZF
IGFuZCB0aGUgaHlwZXJjYWxsLgoKV2hhdCBoYXBwZW5zIGlmIHRoaXMgaW9yZW1hcCgpIGhvb2sg
aXMgbm90IGluIHBsYWNlPyAgRG9lcyB0aGUgaGFyZHdhcmUKKG9yIFRTTSkgZ2VuZXJhdGUgYW4g
ZXhjZXB0aW9uIGxpa2UgVERYIGdldHM/ICBJZiBzbywgaXQncyBwcm9iYWJseQpwb3NzaWJsZSB0
byBtb3ZlIHRoaXMgIm5vdGlmeSB0aGUgVFNNIiBjb2RlIHRvIHRoYXQgZXhjZXB0aW9uIGhhbmRs
ZXIKaW5zdGVhZCBvZiBuZWVkaW5nIGFuIGlvcmVtYXAoKSBob29rLgoKSSdtIG5vdCBzYXlpbmcg
dGhhdCBpdCdzIF9iZXR0ZXJfIHRvIGRvIHRoYXQsIGJ1dCBpdCB3b3VsZCBhbGxvdyB5b3UgdG8K
Z2V0IHJpZCBvZiB0aGlzIHBhdGNoIGZvciBub3cgYW5kIGdldCBtZSB0byBzaHV0IHVwLiA6KQoK
PiBBcyBJIHNhaWQgYWJvdmUsIHRoZSBvYmplY3RpdmUgaGVyZSBpcyB0byBub3RpZnkgdGhlIFRT
TSB3aGVyZSB0aGUgCj4gTU1JTyBpcy4gTm90aWZ5aW5nIHRoZSBob3N0IGlzIGp1c3QgYW4gb3B0
aW1pemF0aW9uIHRoYXQgd2UgY2hvb3NlIHRvCj4gYWRkLiBJbiBmYWN0LCBpbiB0aGlzIHNlcmll
cyB0aGUgS1ZNIGNvZGUgZG9lc24ndCBkbyBhbnl0aGluZyB3aXRoCj4gdGhhdCBpbmZvcm1hdGlv
bi4gVGhlIGNvbW1pdCB0ZXh0IHByb2JhYmx5IGNhbiBiZSBpbXByb3ZlZCB0byBjbGFyaWZ5Cj4g
dGhhdC4KCkp1c3QgdG8gY2xvc2UgdGhlIGxvb3AgaGVyZSwgcGxlYXNlIGdvIHRha2UgYSBsb29r
IGF0CnBncHJvdF9kZWNyeXB0ZWQoKS4gIFRoYXQncyB3aGVyZSB0aGUgeDg2IGd1ZXN0IHBhZ2Ug
dGFibGUgYml0IGdldHMgdG8KdGVsbCB0aGUgaGFyZHdhcmUgdGhhdCB0aGUgbWFwcGluZyBtaWdo
dCBjYXVzZSBhICNWRSBhbmQgaXMgdW5kZXIgdGhlCmNvbnRyb2wgb2YgdGhlIGhvc3QuICBUaGF0
J3MgdGhlIGV4dGVudCBvZiB3aGF0IHg4NiBkb2VzIGF0IGlvcmVtYXAoKSB0aW1lLgoKU28sIHRv
IHN1bW1hcml6ZSwgd2UgaGF2ZToKCng4NjoKMS4gR3Vlc3QgcGFnZSB0YWJsZSBiaXQgdG8gbWFy
ayBzaGFyZWQgKGhvc3QpIHZzLiBwcml2YXRlIChndWVzdCkKICAgY29udHJvbAoyLiAjVkUgaWYg
dGhlcmUgaXMgYSBmYXVsdCBvbiBhIHNoYXJlZCBtYXBwaW5nIHRvIGNhbGwgaW50byB0aGUgaG9z
dAoKUklTQy1WOgoxLiBHdWVzdC0+VFNNIGNhbGwgdG8gbWFyayBNTUlPIHZzLiBwcml2YXRlCjIu
IEZhdWx0cyBpbiB0aGUgTU1JTyBhcmVhIGFyZSB0aGVuIHRyYW5zcGFyZW50IHRvIHRoZSBndWVz
dAoKVGhhdCBkZXNpZ24gZGlmZmVyZW5jZSB3b3VsZCwgaW5kZWVkLCBoZWxwIGV4cGxhaW4gd2h5
IHRoaXMgcGF0Y2ggaXMKaGVyZS4gIEknbSBzdGlsbCBub3QgMTAwJSBjb252aW5jZWQgdGhhdCB0
aGUgcGF0Y2ggaXMgKnJlcXVpcmVkKiwgYnV0IEkKYXQgbGVhc3QgdW5kZXJzdGFuZCBob3cgd2Ug
YXJyaXZlZCBoZXJlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
