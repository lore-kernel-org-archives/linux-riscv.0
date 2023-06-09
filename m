Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1475FC7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 00:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8kSn9nYX5TUaAbgGAq7ma1a9/Wyg7tZkuQ3S/VdZl0U=; b=x/3+w7XhI0hUCC
	rY+TgebCklbWAxanh6uLVuWUhqMnhmf8PuL4mohZ0XcItqQE5+c6DSwG3wNcKTQQggQ/S0hMjOBbl
	QL+qXvAMat1ywtxGidtC1AG2gV4FyK00Mbx8HDFg8AVmYdWbFzacL7S63n+g0S9TVh+g7j0Ua7OdD
	CzRV77RfwOKPCjPSLlxOZn8d8N04tp+bfuNBheR9SS42AERSljgssV/2xNEKnH1F0Jj2fiW9ZHdv9
	owFsUm4uyZxAOgFphfwBg5GPtkY4nniQwho8wJKQt2N48ZSDMuIAqDE2Vo8ykCQN7AW4RJ5CYL8Hg
	GJjZzDGMA1B4LR7ScRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7PuE-00B34E-0p;
	Fri, 09 Jun 2023 00:23:06 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Pu8-00B324-1J;
	Fri, 09 Jun 2023 00:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686270180; x=1717806180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hfORcgQzuOPbSklLPJdOW8LVCo5d5Go2LF+sADUuhiU=;
  b=KKj2g/8okkDMbg1JK1vlqBo5WO8T2Yg1lw+o3aF091wCdUalOduElHZE
   /Dm25vHxeFMHoGjV6sWSn5Su2YITlWNga4vMxgXE7dDv2kaHbMS3GgBB+
   DCsYj58YJHY0MfAkyw2mT/fLUsyKAEFZ2x91wIwyDoHDjHnn0rfnygqnq
   udMIAAAlFmWvv9fmmv5e32stVYtfwOz2z395WKhNnSwHjmxOv0irJ/KtP
   KzeYl+aU2ZmFXkRyjXDZ/qalA+IdSgFWcYDGP09H4ACBHSCXnlwt9A+rT
   1DmVw/jx3J7LG0OkeF6IfOuLjqXQU3ZbmHyMi3UlFPQ34jSHNAptUCuBJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="421061877"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="421061877"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 17:22:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="884393196"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="884393196"
Received: from yjiang5-mobl.amr.corp.intel.com (HELO localhost) ([10.144.161.97])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 17:22:57 -0700
Date: Thu, 8 Jun 2023 17:22:57 -0700
From: Yunhong Jiang <yunhong.jiang@linux.intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch] x86/realmode: Make stack lock work in trampoline_compat()
Message-ID: <20230609002257.GA3661@yjiang5-mobl.amr.corp.intel.com>
References: <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
 <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx>
 <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <87h6rujdvl.ffs@tglx>
 <20230608233402.GA3430@yjiang5-mobl.amr.corp.intel.com>
 <a56a06c2-73fd-5295-3f6c-922ccb078488@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a56a06c2-73fd-5295-3f6c-922ccb078488@citrix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_172300_486324_FAD654D4 
X-CRM114-Status: GOOD (  25.94  )
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

T24gRnJpLCBKdW4gMDksIDIwMjMgYXQgMTI6NTc6NDZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwOS8wNi8yMDIzIDEyOjM0IGFtLCBZdW5ob25nIEppYW5nIHdyb3RlOgo+ID4g
T24gVHVlLCBNYXkgMzAsIDIwMjMgYXQgMTI6NDY6MjJQTSArMDIwMCwgVGhvbWFzIEdsZWl4bmVy
IHdyb3RlOgo+ID4+IFRoZSBzdGFjayBsb2NraW5nIGFuZCBzdGFjayBhc3NpZ25tZW50IG1hY3Jv
IExPQURfUkVBTE1PREVfRVNQIGZhaWxzIHRvCj4gPj4gd29yayB3aGVuIGludm9rZWQgZnJvbSB0
aGUgNjRiaXQgdHJhbXBvbGluZSBlbnRyeSBwb2ludDoKPiA+Pgo+ID4+IHRyYW1wb2xpbmVfc3Rh
cnQ2NAo+ID4+ICAgdHJhbXBvbGluZV9jb21wYXQKPiA+PiAgICAgTE9BRF9SRUFMTU9ERV9FU1Ag
PC0gbG9jawo+ID4gT25lIHBvc3NpYmx5IGR1bWIgcXVlc3Rpb24gYW5kIGhvcGUgZ2V0IHNvbWUg
aGludHMuCj4gCj4gVGhlcmUncyBhIHBocmFzZS7CoCAiVGhlIG9ubHkgZHVtYiBxdWVzdGlvbiBp
cyB0aGUgb25lIG5vdCBhc2tlZCIuCj4gCj4gSWYgeW91IGhhdmUgdGhpcyBxdWVzdGlvbiwgdGhl
cmUncyBhbiBleGNlbGxlbnQgY2hhbmNlIHRoYXQgc29tZW9uZSBlbHNlCj4gcmVhZGluZyB0aGlz
IHRocmVhZCBoYXMgdGhlIHNhbWUgcXVlc3Rpb24uCj4gCj4gPiAgVGhlIExPQURfUkVBTE1PREVf
RVNQIGlzCj4gPiBkZWZpbmVkIHVuZGVyIC5jb2RlMTYgZGlyZWN0aXZlIGFuZCB3aWxsIGJlIHVz
ZWQgYnkgMzItYml0IG1vZGUgY2FsbGVyIGFsc28uIElzCj4gPiBpdCBvayBiZWNhdXNlIHRoZSBp
bnN0cnVjdGlvbnMgdGhlcmUgd2lsbCBiZSBzYW1lIGZvciBib3RoIDE2LWJpdCBhbmQgMzItYml0
PyBJCj4gPiBjaGVja2VkCj4gPiBodHRwczovL2Z0cC5nbnUub3JnL29sZC1nbnUvTWFudWFscy9n
YXMtMi45LjEvaHRtbF9jaGFwdGVyL2FzXzE2Lmh0bWwjU0VDMjA1IGFuZAo+ID4gZG9uJ3QgZmlu
ZCBtdWNoIGluZm9ybWF0aW9uIHRoZXJlLgo+IAo+IFRoZSBwb3NpdGlvbiBvZiB0aGUgTE9BRF9S
RUFMTU9ERV9FU1AgLm1hY3JvIGl0c2VsZiBkb2Vzbid0IG1hdHRlci7CoAo+IEl0J3MganVzdCBz
b21lIHRleHQgd2hpY2ggZ2V0cyBwYXN0ZWQgZWxzZXdoZXJlLsKgIEltYWdpbmUgaXQganVzdCB0
aGUKPiBzYW1lIGFzIHJ1bm5pbmcgdGhlIEMgcHJlcHJvY2Vzc29yIG9uIGEgZmlsZSBiZWZvcmUg
Y29tcGlsaW5nIGl0Lgo+IAo+IEFzIHlvdSBub3RlLCBzb21lIGV4cGFuc2lvbnMgb2YgdGhlIG1h
Y3JvIGFyZSBpbiAuY29kZTE2LCBhbmQgc29tZSBhcmUKPiBub3QuwqAgVGhpcyBkb2VzIHJlc3Vs
dCBpbiBkaWZmZXJlbnQgYnl0ZXMgYmVpbmcgZW1pdHRlZC7CoCBUaGUgZGVmYXVsdAo+IG9wZXJh
bmRzIHNpemUgZmxpcHMgYmV0d2VlbiAuY29kZTE2IGFuZCAuY29kZTMyLCBzbyB0aGVyZSB3aWxs
IGJlIHNvbWUKPiAweDY2IHByZWZpeGVzIGluIG9uZSBtb2RlLCBhbmQgbm90IGluIG90aGVycy4K
PiAKPiBUaGUgaW1wb3J0YW50IHBvaW50IGlzIHRoZSBsIHN1ZmZpeCBvbiBidHNsLCB3aGljaCBm
b3JjZXMgaXQgdG8gYmUgbG9uZwo+ICgzMmJpdCkgaXJyZXNwZWN0aXZlIG9mIHRoZSBkZWZhdWx0
IG9wZXJhbmQgc2l6ZS4KPiAKPiBTbyB5ZXMsIGl0IHdpbGwgd29yaywgYnV0IHRoYXQncyBiZWNh
dXNlIGdhcyBpcyBoYW5kbGluZyB0aGUgZGlmZmVyaW5nCj4gZW5jb2RpbmdzIGF1dG9tYXRpY2Fs
bHkgYmFzZWQgb24gdGhlIGRlZmF1bHQgb3BlcmFuZCBzaXplIHdoZXJlIHRoZQo+IExPQURfUkVB
TE1PREVfRVNQIGdldHMgZXhwYW5kZWQuCj4gCj4gSG9wZSB0aGlzIGhlbHBzLApUaGFuayB5b3Ug
Zm9yIHRoZSBleHBsYWluYXRpb24sIGl0J3MgcXVpdGUgY2xlYXIgbm93Lgo+IAo+IH5BbmRyZXcK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
