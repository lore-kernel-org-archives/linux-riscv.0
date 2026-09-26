Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25813C9831E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 06:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5LY+d7MsfpR9LWQeiOffEv+NzGcnSMawaueg6A9jvM=; b=4mwD2Qx5biwxNj
	zLSWEkdh3nuFaiZNvU+5fkshYf+IlbNARmHjBzvEoADMGpVPuiVL7megf9APewRZa44wRuYmnavqt
	XcxvNyu/mNGMx/Pt6opGqT73UVjeu39s3HapMlxf7k9mFUT3+Ks96nL5Mh0nnpdH7bfJ1xGN7+B1U
	+oWGnUNpPb4vjhxJBr93z8AMOUdjpJVqJ45f7ewGnf7lwcArZiLG449zy54qmnMgBb4Xucl9hFvcH
	yVOjQJAGspxj1mfk3P2X2P6Bn/e6YN4QRmi0IydbpGe3utn+uA5kgYAgEL0ol5MtqDHcH3BG1H166
	K1tEW//iOnXJLJJ+UgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAMCe-0000000F5h2-11MW;
	Sat, 26 Sep 2026 06:48:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAMCb-0000000F5gf-3WY1;
	Sat, 26 Sep 2026 06:48:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E8FE6020C;
	Sat, 26 Sep 2026 06:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5191F000FF;
	Sat, 26 Sep 2026 06:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790405284;
	bh=/ZtlgtRXx70iH42f7yzu0ahvdG98SNDqpIESzbWq6Cs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=K7hP34PKJi6Bjcv22MS8TIn+XW0Rx8BecEVNFElkjULeWp5il9FmTmLHnrmZjURsm
	 MY4G/yFSo+VHJObjR7+6NyMJS/So7NLbCyIm5z3wbX9ZDaldB9bZxr8o2l6JTW1SP1
	 6svZup3jHwklut1SBhO1rWLTHK4uxE6WEIwRsyLDMs3Ah7CYv9BQ/tDG3rUmhoszL/
	 nh0r368reX/onFa7qh1GDmxQSQE/9gaWT8iwumST8Ty1lUAsrRwO1gPAkNXtXNGrRb
	 9A/PimWd4GasDWyRp82vXjmsfkojPF4x4FM8hU8HJRNWYavd1OdmlOr6/xw6hXpxms
	 dTurdAJ5oUfYQ==
Message-ID: <c8bd5eb2-d411-4b11-8f51-1309374bd466@kernel.org>
Date: Sat, 26 Sep 2026 08:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arch, mm: promote DEBUG_WX to CHECK_WX
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Nicholas Piggin <npiggin@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Shrikanth Hegde
 <sshegde@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20260925-direct-map-verify-wx-v1-1-7fd2f7d6d23b@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260925-direct-map-verify-wx-v1-1-7fd2f7d6d23b@kernel.org>
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

SGkgTWlrZSwKCkxlIDI1LzA5LzIwMjYgw6AgMTE6NTMsIE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29m
dCkgYSDDqWNyaXTCoDoKPiBWZXJpZmljYXRpb24gdGhhdCB0aGUga2VybmVsIGRvZXMgbm90IGhh
dmUgd3JpdGFibGUgKyBleGVjdXRhYmxlCj4gbWFwcGluZ3MgaXMgYWJvdXQgZGV0ZWN0aW5nIHNl
Y3VyaXR5IHJpc2tzIHJhdGhlciB0aGFuIGEgcHVyZSBkZWJ1Zwo+IGZlYXR1cmUuCj4gCj4gTWFq
b3IgZGlzdHJpYnV0aW9uIGNvbmZpZ3VyYXRpb25zIGVuYWJsZSBpdCBpbiB0aGVpciBrZXJuZWxz
IGFzIHdlbGwgYXMKPiBkZWZjb25maWdzIG9mIG1vc3QgYXJjaGl0ZWN0dXJlcyB0aGF0IGhhdmUg
QVJDSF9IQVNfREVCVUdfV1guCj4gCj4gUmVuYW1lIHJlbGV2YW50IGdlbmVyaWMgY29uZmlndXJh
dGlvbiBvcHRpb25zIHRvIHVzZSBDSEVDS19XWCBhbmQgbW92ZQo+IHRoZWlyIGRlZmluaXRpb25z
IGZyb20gbW0vS2NvbmZpZy5kZWJ1ZyB0byBtbS9LY29uZmlnLgo+IAo+IEZvciBhcm0gdGhhdCBk
b2VzIG5vdCB3aWRlbHkgZW5hYmxlIGl0LCBvbmx5IHJlbmFtZSBpdHMgdmFyaWFudHMgb2YgdGhl
Cj4gY29uZmlnIG9wdGlvbnMuCj4gCj4gRW5hYmxpbmcgQ0hFQ0tfV1ggYWRkcyBhIGZldyBraWxv
Ynl0ZXMgdG8gdGhlIGtlcm5lbCBiaW5hcnkgYW5kIHdoaWxlCj4gdGhlIGFkZGVkIHNpemUgY2Fu
IGJlIHNsaWdodGx5IHJlZHVjZWQgd2l0aCBjaHVybnkgdXBkYXRlcyBvZgo+IGFyY2hpdGVjdHVy
ZSBpbXBsZW1lbnRhdGlvbnMgb2YgcHRkdW1wLCB0aGUgY29yZSBmdW5jdGlvbmFsaXR5IHRha2Vz
Cj4gbW9zdCBvZiB0aGUgYWRkZWQgc2l6ZS4gSXQgY2Fubm90IGJlIG1vdmVkIHRvIC5pbml0LnRl
eHQgYmVjYXVzZSB0aGUKPiB2ZXJpZmljYXRpb24gaGFzIHRvIGhhcHBlbiBhZnRlciBpbml0IHNl
Y3Rpb25zIGFyZSBmcmVlZC4KPiAKPiBXaXRoIHRoaXMsIG1ha2UgZ2VuZXJpYyBDSEVDS19XWCBk
ZWZhdWx0IHRvIFNUUklDVF9LRVJORUxfUldYIHdoaWxlCj4gc3RpbGwgbGVhdmluZyB1c2VycyB0
YXJnZXRpbmcgc21hbGwga2VybmVscyB0aGUgcG9zc2liaWxpdHkgdG8gb3B0LW91dC4KCkxvb2tp
bmcgYXQgaG93IGl0IGlzIGRvbmUgaW4gcG93ZXJwYyBJIGhhdmUgc29tZSBkb3VidCB3aXRoIHlv
dXIgcmVhc29uaW5nLgoKcHRkdW1wX2NoZWNrX3d4KCkgd2lsbCByZXBvcnQgcmVnYXJkbGVzcyBv
ZiBDT05GSUdfREVCVUdfV1g6CgoJaWYgKHN0Lnd4X3BhZ2VzKSB7CgkJcHJfd2FybigiQ2hlY2tl
ZCBXK1ggbWFwcGluZ3M6IEZBSUxFRCwgJWx1IFcrWCBwYWdlcyBmb3VuZFxuIiwKCQkJc3Qud3hf
cGFnZXMpOwoKCQlyZXR1cm4gZmFsc2U7Cgl9IGVsc2UgewoJCXByX2luZm8oIkNoZWNrZWQgVytY
IG1hcHBpbmdzOiBwYXNzZWQsIG5vIFcrWCBwYWdlcyBmb3VuZFxuIik7CgoJCXJldHVybiB0cnVl
OwoJfQoKVGhlIG9ubHkgZGlmZmVyZW5jZSBpcyB3ZSB3b24ndCBnZXQgdGhlIFdBUk5fT05DRSgp
OgoKCVdBUk5fT05DRShJU19FTkFCTEVEKENPTkZJR19ERUJVR19XWCksCgkJICAicG93ZXJwYy9t
bTogRm91bmQgaW5zZWN1cmUgVytYIG1hcHBpbmcgYXQgYWRkcmVzcyAlcC8lcFNcbiIsCgkJICAo
dm9pZCAqKXN0LT5zdGFydF9hZGRyZXNzLCAodm9pZCAqKXN0LT5zdGFydF9hZGRyZXNzKTsKCgpB
bmQgSSBiZWxpZXZlIGEgYmlnIGZhdCB3YXJuaW5nIGxpa2UgdGhpcyBpcyBhIGRlYnVnIG9wdGlv
biBub3QgdG8gYmUgCmVuYWJsZWQgb24gcHJvZHVjdGlvbiBrZXJuZWxzLgoKU28gSSB0aGluayB3
ZSBzaG91bGQgaW5zdGVhZCBkbzoKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3B0ZHVtcC5o
IGIvaW5jbHVkZS9saW51eC9wdGR1bXAuaAppbmRleCAyNDBiZDNiZmYxOGRkLi43MTRmNjNmYjYw
NGEwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3B0ZHVtcC5oCisrKyBiL2luY2x1ZGUvbGlu
dXgvcHRkdW1wLmgKQEAgLTMzLDcgKzMzLDcgQEAgYm9vbCBwdGR1bXBfY2hlY2tfd3godm9pZCk7
CgogIHN0YXRpYyBpbmxpbmUgdm9pZCBkZWJ1Z19jaGVja3d4KHZvaWQpCiAgewotCWlmIChJU19F
TkFCTEVEKENPTkZJR19ERUJVR19XWCkpCisJaWYgKElTX0VOQUJMRUQoQ09ORklHX1BURFVNUCkp
CiAgCQlwdGR1bXBfY2hlY2tfd3goKTsKICB9CgoKVGhhdCB3YXkgeW91IHNob3VsZCBnZXQgKHVu
dGVzdGVkKSB0aGUgZm9sbG93aW5nIHdhcm5pbmcgYnV0IG5vdCB0aGUgYmlnIApmYXQgZGVidWcg
V0FSTigpOgoKICAgQ2hlY2tlZCBXK1ggbWFwcGluZ3M6IEZBSUxFRCwgJWx1IFcrWCBwYWdlcyBm
b3VuZAoKQ2hyaXN0b3BoZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
