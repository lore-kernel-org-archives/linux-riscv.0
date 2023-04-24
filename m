Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB87EC77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 13:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jEiFbwL9WN0rbpN9BndIpJpnanTwgSfWQDOL1tZAgA=; b=NlCxWy0CADyDqw
	d5JL+2NloQRy3KY20pbOKxTMha/KbFTkZcdKLCXXIbzZLOBfjd8oS2JpSncgkyha8yTHUuzdd05O5
	aEVtFzo/POl2z3Ujy/hw700R6Jhk0QY5LPYwQj5vTJBP+XhLYpm88Fa5xtDbpI33bGGQwFD1g1X58
	IPZIODllMyf40tt0QMmo/F2HUbU/q3+OR57pKVaXOArOZEQMRSda8uuZJoJXL8ju/bMLmRuKo1Tkg
	EL7tn1qU/VVIVmxuCJohVsLvNYyXzL2xRqhx0BEA7dQaeg7h4ehbLE0uUIGXWAmKSnz/KBRJ6Zs1M
	54gJ0s8audK/fo4TWcJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqwYU-00GT2j-1L;
	Mon, 24 Apr 2023 13:48:34 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqwYK-00GSwc-0r;
	Mon, 24 Apr 2023 13:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682344104; x=1713880104;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oPqlnm5FAEkzjCzsM5wwOi+X/O97WzQZ5VPCNK7UoWo=;
  b=BSlADEd7/kIe/sZ0Rqu/+ceaXxHopDQlqj4L8L3b1fx1CLJ69t6C8F2f
   9UWAxbFOE17aKW7uhHNtmCPcRczn47PjhV3oO+orC5oToJinZtba78T9d
   gRH/r+dgOytrFrgArMKZEB10FJSDaL61t3lktL19/mz0WkcI2mrr3+hT7
   /6RtTCSj1nLWbP/8pmC0hK8bow+szUFT/Xvdwu8OHI7PEBSPz4vE10+qP
   mazCBP2rUxsgfQbSL1UQXfM4JVr1SYNZ+s+xEIZw+AlfAdfbpg+AdCyW9
   SDi3mXGaGeNfbJW62mkMNyv21wisVEQ7m4Sk7J107fUC+8HB2ZttFoJjQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="346479870"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="346479870"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 06:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="693087845"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="693087845"
Received: from mkavai-mobl2.amr.corp.intel.com (HELO [10.212.196.194]) ([10.212.196.194])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 06:48:09 -0700
Message-ID: <81c476f4-ef62-e4a6-0033-8a46a15379fd@intel.com>
Date: Mon, 24 Apr 2023 06:48:09 -0700
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
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <CAHBxVyFhDapAeMQ8quBqWZ10jWSHw1CdE227ciyKQpULHYzffA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_064824_353055_D5235345 
X-CRM114-Status: GOOD (  24.20  )
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

T24gNC8yMS8yMyAxMjoyNCwgQXRpc2ggS3VtYXIgUGF0cmEgd3JvdGU6Cj4gT24gRnJpLCBBcHIg
MjEsIDIwMjMgYXQgMzo0NuKAr0FNIERhdmUgSGFuc2VuIDxkYXZlLmhhbnNlbkBpbnRlbC5jb20+
IHdyb3RlOj4+IFRoaXMgY2FsbGJhY2sgYXBwZWFycyB0byBzYXkgdG8gdGhlIGhvc3Q6Cj4+Cj4+
ICAgICAgICAgSGV5LCBJICh0aGUgZ3Vlc3QpIGFtIHRyZWF0aW5nIHRoaXMgZ3Vlc3QgcGh5c2lj
YWwgYXJlYSBhcyBNTUlPLgo+Pgo+PiBCdXQgdGhlIGhvc3QgYW5kIGd1ZXN0IGhhdmUgdG8gYWdy
ZWUgX3NvbWV3aGVyZV8gd2hhdCB0aGUgTU1JTyBpcyB1c2VkCj4+IGZvciwgbm90IGp1c3QgdGhh
dCBpdCBpcyBiZWluZyB1c2VkIGFzIE1NSU8uCj4gCj4gWWVzLiBUaGUgVFNNIChURUUgU2VjdXJp
dHkgTWFuYWdlcikgd2hpY2ggaXMgZXF1aXZhbGVudCB0byBURFggYWxzbyAKPiBuZWVkcyB0byBi
ZSBhd2FyZSBvZiB0aGUgTU1JTyByZWdpb25zIHNvIHRoYXQgaXQgY2FuIGZvcndhcmQgdGhlCj4g
ZmF1bHRzIGFjY29yZGluZ2x5LiBNb3N0IG9mIHRoZSBNTUlPIGlzIGVtdWxhdGVkIGluIHRoZSBo
b3N0Cj4gKHVzZXJzcGFjZSBvciBrZXJuZWwgZW11bGF0aW9uIGlmIHByZXNlbnQpLiBUaGUgaG9z
dCBpcyBvdXRzaWRlIHRoZQo+IHRydXN0IGJvdW5kYXJ5IG9mIHRoZSBndWVzdC4gVGh1cywgZ3Vl
c3QgbmVlZHMgdG8gbWFrZSBzdXJlIHRoZSBob3N0IAo+IG9ubHkgZW11bGF0ZXMgdGhlIGRlc2ln
bmF0ZWQgTU1JTyByZWdpb24uIE90aGVyd2lzZSwgaXQgb3BlbnMgYW4gCj4gYXR0YWNrIHN1cmZh
Y2UgZnJvbSBhIG1hbGljaW91cyBob3N0LgpIb3cgZG9lcyB0aGlzIG1lY2hhbmlzbSBzdG9wIHRo
ZSBob3N0IGZyb20gZW11bGF0aW5nIHNvbWV0aGluZyBvdXRzaWRlCnRoZSBkZXNpZ25hdGVkIHJl
Z2lvbj8KCk9uIFREWCwgZm9yIGluc3RhbmNlLCB0aGUgZ3Vlc3QgcGFnZSB0YWJsZSBoYXZlIGEg
c2hhcmVkL3ByaXZhdGUgYml0LgpQcml2YXRlIHBhZ2VzIGdldCBURFggcHJvdGVjdGlvbnMgdG8g
KGFtb25nIG90aGVyIHRoaW5ncykga2VlcCB0aGUgcGFnZQpjb250ZW50cyBjb25maWRlbnRpYWwg
ZnJvbSB0aGUgaG9zdC4gIFNoYXJlZCBwYWdlcyBjYW4gYmUgdXNlZCBmb3IgTU1JTwphbmQgZG9u
J3QgaGF2ZSB0aG9zZSBwcm90ZWN0aW9ucy4KCklmIHRoZSBob3N0IGdvZXMgYW5kIHRyaWVzIHRv
IGZsaXAgYSBwYWdlIGZyb20gcHJpdmF0ZS0+c2hhcmVkLCBURFgKcHJvdGVjdGlvbnMgd2lsbCBr
aWNrIGluIGFuZCBwcmV2ZW50IGl0LgoKTm9uZSBvZiB0aGlzIHJlcXVpcmVzIHRoZSBndWVzdCB0
byB0ZWxsIHRoZSBob3N0IHdoZXJlIGl0IGV4cGVjdHMgTU1JTwp0byBiZSBsb2NhdGVkLgoKPiBB
bGwgb3RoZXIgY29uZmlkZW50aWFsIGNvbXB1dGluZyBzb2x1dGlvbnMgYWxzbyBkZXBlbmQgb24g
Z3Vlc3QgCj4gaW5pdGlhdGVkIE1NSU8gYXMgd2VsbC4gQUZBSUssIHRoZSBURFggJiBTRVYgcmVs
aWVzIG9uICNWRSBsaWtlCj4gZXhjZXB0aW9ucyB0byBpbnZva2UgdGhhdCB3aGlsZSB0aGlzIHBh
dGNoIGlzIHNpbWlsYXIgdG8gd2hhdCBwa3ZtCj4gZG9lcy4gVGhpcyBhcHByb2FjaCBsZXRzIHRo
ZSBlbmxpZ2h0ZW5lZCBndWVzdCBjb250cm9sIHdoaWNoIE1NSU8KPiByZWdpb25zIGl0IHdhbnRz
IHRoZSBob3N0IHRvIGVtdWxhdGUuCgpJJ20gbm90IF9xdWl0ZV8gc3VyZSB3aGF0ICJndWVzdCBp
bml0aWF0ZWQiIG1lYW5zLiAgQnV0IFNFViBhbmQgVERYCmRvbid0IHJlcXVpcmUgYW4gaW9yZW1h
cCBob29rIGxpa2UgdGhpcy4gIFNvLCBldmVuIGlmIHRoZXkgKmFyZSogImd1ZXN0CmluaXRpYXRl
ZCIsIHRoZSBxdWVzdGlvbiBzdGlsbCByZW1haW5zIGhvdyB0aGV5IHdvcmsgd2l0aG91dCB0aGlz
IHBhdGNoLApvciB3aGF0IHRoZXkgYXJlIG1pc3Npbmcgd2l0aG91dCBpdC4KCj4gSXQgY2FuIGJl
IGEgc3Vic2V0IG9mIHRoZSByZWdpb24ncyBob3N0IHByb3ZpZGVkIHRoZSBsYXlvdXQuIFRoZQo+
IGd1ZXN0IGRldmljZSBmaWx0ZXJpbmcgc29sdXRpb24gaXMgYmFzZWQgb24gdGhpcyBpZGVhIGFz
IHdlbGwgWzFdLgo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTA5MzAw
MTA1MTEuMzM4Nzk2Ny0xLXNhdGh5YW5hcmF5YW5hbi5rdXBwdXN3YW15QGxpbnV4LmludGVsLmNv
bS8KCkkgZG9uJ3QgcmVhbGx5IHNlZSB0aGUgY29ubmVjdGlvbi4gIEV2ZW4gaWYgdGhhdCBzZXJp
ZXMgd2FzIGdvaW5nCmZvcndhcmQgKEknbSBub3Qgc3VyZSBpdCBpcykgdGhlcmUgaXMgbm8gaW9y
ZW1hcCBob29rIHRoZXJlLiAgVGhlcmUncwphbHNvIG5vIGd1ZXN0LT5ob3N0IGNvbW11bmljYXRp
b24gaW4gdGhhdCBzZXJpZXMuICBUaGUgZ3Vlc3QgZG9lc24ndApfdGVsbF8gdGhlIGhvc3Qgd2hl
cmUgdGhlIE1NSU8gaXMsIGl0IGp1c3QgZGVjbGluZXMgdG8gcnVuIGNvZGUgZm9yCmRldmljZXMg
dGhhdCBpdCBkaWRuJ3QgZXhwZWN0IHRvIHNlZS4KCkknbSBzdGlsbCByYXRoZXIgY29uZnVzZWQg
aGVyZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
