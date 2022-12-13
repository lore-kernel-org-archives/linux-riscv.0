Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B82C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 01:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EdtiAkq0H456I3M0wh6i68H/gPboz9ch1ZIeKclggoA=; b=O0M0eS14tBPILf
	7GMYW1zIS6FG/WbmRUhhqaPvgToO40QeeSonzp22PaEilmSsUjQb6uRti2EL14bP3m/bvr3nrifLl
	jck92zkr9cEt7Xyf5H8uw39xLYsZy8MQHu85yvO3WCLnwAiSEINYIm5S9eBcRekztky5p1+Jt1ovt
	mOV2CyrmpDNEMXUNv1dMWAZeAvzWf3CC3IfN7asZ9s/PufKV40WINgSLzNwyiyeg9I/4REqekWR9C
	VdqjYKubA0cwRIGVRRXQVz0rFC8ji5zGBQkkpr8Y0KiW7hX+MLA6/ON0EYLXIXu52dAgpN5s4p/mk
	LQw9PLx4fCUL+Gala87g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4uJN-009DwT-Bg; Tue, 13 Dec 2022 01:42:25 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4uJJ-009DEv-9j
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 01:42:22 +0000
Received: by mail-pf1-x430.google.com with SMTP id c13so1199427pfp.5
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 17:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=opT7QlxBkoYVHWKjfFWe+3FrtkzNsO2VihRNj3rgWn4=;
        b=SK1WTnhEcJ7vOVSL2xzzXtEkHtH43rxXSGW7Dtujo2q/jDMxxwle2K41T6LEOAbu31
         njuyn58rLHAdSISg9P623gyKYXFOPbX7pgjYFQq0nCNnpQM5nUBslElHcKrZV00WUweD
         2Ab6o7XW4eUWoa8IW7OXTpjK3c5JsXSeCBMBKd1ZVWft5A67PRSXDH8qkRexDCQaB9Yn
         RRx3hIYf+BW8rjptQ0hTe+UyiZNfb7Ry3StWfXGfsaNsXjMTMnyjPwgtlBcOWZ5bOvDK
         NYZEtjUykiKNojc+IPEX89P4N1KrKqPpyt3Z0lKnKRo6M5fuKnMpjzJMGm1TZAMuI+Yh
         G8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opT7QlxBkoYVHWKjfFWe+3FrtkzNsO2VihRNj3rgWn4=;
        b=Hi0+s/qf8Attax9FVr1AXB+mTwxVlDk2+CuGMnWbWMA/B1yWJ+h/kNQr/dxh15nigY
         gAkkzCeawIH+0GseFaraBwH4ems2aMdridVp0jIpPwX9UmHuiz6fuLzGfxxTC2VbLoY5
         h98y79COazaBPogQnfWQahDHDV6ms6jWyej83UVXJkk3jpqotayg9IXwnFiTlJdMU7uU
         ejiI3vLHZ6Zi6CHzqhy+1yfo1n77/19bGGE2S3FWZiz5NZfczH8UOzf5wlHTRNKLrMZP
         S7G2UnVBVuOOipEz/WmgeAMJrKe0OWMB3r5pZKGrkEPgIo7TjMeAbNfxGVMjWwWfNCRv
         hDeg==
X-Gm-Message-State: ANoB5pnNSUtUXw1yPw55QPHMRQfL3aoYNy9eHwaeW9gQF9Rd5FulvJlK
	51PsyKA6eHFfVjvrAkW8P1Ct2g==
X-Google-Smtp-Source: AA0mqf4Ax5/VKVlxMD5DSzFDunN/IfJNpj08Gszf3tnTB/tljXojhITyTp9EJLu9yUUGsdwIrNP7Ng==
X-Received: by 2002:a62:160a:0:b0:576:22d7:fd9e with SMTP id 10-20020a62160a000000b0057622d7fd9emr72299pfw.0.1670895734011;
        Mon, 12 Dec 2022 17:42:14 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id i134-20020a62878c000000b005761c4754e7sm6630376pfe.144.2022.12.12.17.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 17:42:13 -0800 (PST)
Date: Tue, 13 Dec 2022 01:42:10 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Matlack <dmatlack@google.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	"Yang, Weijiang" <weijiang.yang@intel.com>,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Amit, Nadav" <namit@vmware.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
	Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>,
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>,
	Krish Sadhukhan <krish.sadhukhan@oracle.com>,
	Ricardo Koller <ricarkol@google.com>,
	Jing Zhang <jingzhangos@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [RFC PATCH 01/37] KVM: x86/mmu: Store the address space ID
 directly in kvm_mmu_page_role
Message-ID: <Y5fYcosbituc0kc4@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-2-dmatlack@google.com>
 <22fe2332-497e-fe30-0155-e026b0eded97@intel.com>
 <Y5NvYmxpy6BPkmpW@google.com>
 <CALzav=eju4LYyX=ufNneSww+5sraYJ8cfQSi4LTOHfHWmddX9A@mail.gmail.com>
 <Y5dnWgJ0ine55/hN@google.com>
 <01cb4882-7a06-176f-7d55-f80cca300ffd@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01cb4882-7a06-176f-7d55-f80cca300ffd@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_174221_365231_15033218 
X-CRM114-Status: GOOD (  16.23  )
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

T24gTW9uLCBEZWMgMTIsIDIwMjIsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gMTIvMTIvMjIg
MTg6MzksIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gPiBNeSBwcmVmZXJlbmNlIHdvdWxk
IGJlIHRvIGxlYXZlIC5zbW0gaW4geDg2J3MgcGFnZSByb2xlCj4gCj4gV2hhdCBhYm91dCBkZWZp
bmluZyBhIGJ5dGUgb2YgYXJjaF9yb2xlIGFuZCBhIG1hY3JvIHRvIGJ1aWxkIGl0PwoKSSB0aGlu
ayBEYXZpZCBhbHJlYWR5IGNhcnZlZCBvdXQgYSBiaWcgY2h1bmsgZm9yIGFyY2ggcm9sZSBiaXRz
LCBteSBvYmplY3Rpb24Kd2FzIHB1cmVseSB0byBtYWtpbmcgYXNfaWQgYSBnZW5lcmljIDgtYml0
IHJvbGUuCgo+ID4gVW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZywgZS5nLiBhIG5lZWQgdG8g
bWFwIEdQQXMgZGlmZmVyZW50bHkgZm9yCj4gPiBTTU0gdnMuIG5vbi1TTU0sIFNNTSBjb3VsZCBo
YXZlIGJlZW4gaW1wbGVtZW50ZWQgd2l0aCBhIHNpbXBsZSBmbGFnCj4gPiBpbiBhIG1lbXNsb3Qg
dG8gbWFyayB0aGUgbWVtc2xvdCBhcyBTTU0tb25seS4KPiAKPiBVbmZvcnR1bmF0ZWx5IG5vdCwg
YmVjYXVzZSB0aGVyZSBjYW4gYmUgYW5vdGhlciByZWdpb24gKGZvciBleGFtcGxlIHZpZGVvCj4g
UkFNIGF0IDBBMDAwMGgpIHVuZGVybmVhdGggU01SQU0uCgpVZ2gsIGl0J3MgZXZlbiBhIHZlcnkg
ZXhwbGljaXRseSBkb2N1bWVudGVkICJmZWF0dXJlIi4KCiAgV2hlbiBjb21wYXRpYmxlIFNNTSBz
cGFjZSBpcyBlbmFibGVkLCBTTU0tbW9kZSBDQk8gYWNjZXNzZXMgdG8gdGhpcyByYW5nZSByb3V0
ZQogIHRvIHBoeXNpY2FsIHN5c3RlbSBEUkFNIGF0IDAwXzAwMEFfMGgg4oCTIDAwXzAwMEJfRkZG
RmguCiAgCiAgTm9uLVNNTSBtb2RlIENCTyBhY2Nlc3NlcyB0byB0aGlzIHJhbmdlIGFyZSBjb25z
aWRlcmVkIHRvIGJlIHRvIHRoZSBWaWRlbyBCdWZmZXIKICBBcmVhIGFzIGRlc2NyaWJlZCBhYm92
ZS4gUENJIEV4cHJlc3MqIGFuZCBETUkgb3JpZ2luYXRlZCBjeWNsZXMgdG8gU01NIHNwYWNlIGFy
ZSBub3QKICBzdXBwb3J0ZWQgYW5kIGFyZSBjb25zaWRlcmVkIHRvIGJlIHRvIHRoZSBWaWRlbyBC
dWZmZXIgQXJlYS4KCkkgYWxzbyBmb3Jnb3QgS1ZNIHN1cHBvcnRzIFNNQkFTRSByZWxvY2F0aW9u
IDotKAoKPiBJbiBmYWN0LCBLVk1fTUVNX1g4Nl9TTVJBTSB3YXMgdGhlIGZpcnN0IGlkZWEuICBJ
dCB3YXMgdWdsaWVyIHRoYW4gbXVsdGlwbGUKPiBhZGRyZXNzIHNwYWNlcyAoaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8xNDMxMDg0MDM0LTg0MjUtMS1naXQtc2VuZC1lbWFpbC1wYm9uemlu
aUByZWRoYXQuY29tKS4KPiBJbiByZXRyb3NwZWN0IHRoZXJlIHdlcmUgcHJvYmFibHkgd2F5cyB0
byBtaXggdGhlIGJlc3Qgb2YgdGhlIHR3byBkZXNpZ25zLAo+IGJ1dCBpdCB3YXNuJ3QgZ2VuZXJp
YyBlbm91Z2guCj4KPiA+IEFuZCBzZXBhcmF0ZSBhZGRyZXNzIHNwYWNlcyBiZWNvbWUgdHJ1bHkg
bmFzdHkgaWYgdGhlIENQVSBjYW4gYWNjZXNzIG11bHRpcGxlCj4gPiBwcm90ZWN0ZWQgcmVnaW9u
cywgZS5nLiBpZiB0aGUgQ1BVIGNhbiBhY2Nlc3MgdHlwZSBYIGFuZCB0eXBlIFkgYXQgdGhlIHNh
bWUgdGltZSwKPiA+IHRoZW4gdGhlcmUgd291bGQgbmVlZCB0byBiZSBtZW1zbG90cyBmb3IgInJl
Z3VsYXIiLCBYLCBZLCBhbmQgWCtZLgo+IAo+IFdpdGhvdXQgYSB1c2VjYXNlIHRoYXQncyBoYXJk
IHRvIHNheS4gIEl0J3MganVzdCBhcyBwb3NzaWJsZSB0aGF0IHRoZXJlCj4gd291bGQgYmUgYSBu
YXR1cmFsIGhpZXJhcmNoeSBvZiBsZXZlbHMuCgpBaCwgdHJ1ZS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
