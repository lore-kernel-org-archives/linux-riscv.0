Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE20CD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 20:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQyJlV7v+Sa75o+Bbh5mp+mEBaq5yEiTvmo1OuxPB/U=; b=vBKIOgVLs9wGYp
	5+EbZ1KdLJNFS//P6Iz/qJccAizhbEXpyrYbTo0ZIC03Znji/rdd2pe5STR2qGMCgjORuW8tNk6Tt
	ahEiTApw1awxtM+F+QZ1JC/jMLSXWDXsXSfZqK7NcI51otvOgKzuu0ElzRtFXC5WgwkHx0Ier+5Jq
	/4jWjZIAs4yRfoVP1GKS6a0IeLk1sq9F9KowGeSeglUAozJ4fs24IG+TWYoBHG/a3DGJIMPh0pwrj
	BKJJEpUEKqwmtxZk4ztormTxIgvn7cLnuL29raBsLMwiwR9g9Yt2pPHtj4mhGr5G+/OcLBhnc0MEi
	6e+XufMlImBMwOg9A8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNcOI-00000006Utt-1pol;
	Thu, 14 May 2026 20:10:42 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNcOF-00000006UtI-3rqA;
	Thu, 14 May 2026 20:10:41 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 64EJvxqM1443783
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 14 May 2026 12:58:00 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 64EJvxqM1443783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026042601; t=1778788682;
	bh=xeBHge+llXOwbb4JcAn9Da3zKsJCWrqg8YV6SgfLoXo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=TMJRrv8qsGR2DCztL/jIBPGQO28wsQqHTK/NveRi2zk0+LzcLKFnn8Iviy502ok9i
	 5OPdaLnKd7D98poTZNiOmU0cpqecXLRAlMLlzcNAcqmYAOBC161NH9p9vqagHz1Xzp
	 BPHAozGQd8pC11kLXAzXk4hpCEC4Qm5nr3r8fLBpDaXFU6ItVDJJC6CoKBpExDsJpx
	 SBUnV+538SZRyCwQ4LxXbvqDNKSQfPPT+pqoR4zWD30U5xD3yvUXZOrx9md0+xwCLQ
	 k9df5Yhe3oajwADOBTxx2BUJt+DFl3mJhhVx9sGvHpXM1M36RT8sI9kIAAkr7iTx6O
	 TigG32CPWMUsQ==
Date: Thu, 14 May 2026 12:57:53 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: kreijack@inwind.it, Goffredo Baroncelli <kreijack@libero.it>,
        Christoph Hellwig <hch@lst.de>, David Sterba <dsterba@suse.cz>
CC: Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
        David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Song Liu <song@kernel.org>,
        Yu Kuai <yukuai@alb-78bjiv52429oh8qptp.cn-shenzhen.alb.aliyuncs.com>,
        Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-raid@vger.kernel.org
Subject: Re: [PATCH 01/19] btrfs: require at least 4 devices for RAID 6
User-Agent: K-9 Mail for Android
In-Reply-To: <0a8d1ff4-f5a2-49e9-aa45-d25dbe4ded40@libero.it>
References: <20260512052230.2947683-1-hch@lst.de> <20260512052230.2947683-2-hch@lst.de> <20260512114231.GG2558453@suse.cz> <20260513054742.GA1018@lst.de> <0a8d1ff4-f5a2-49e9-aa45-d25dbe4ded40@libero.it>
Message-ID: <0507CCEF-0548-442F-8703-1D006B5E068B@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_131039_969685_4287929C 
X-CRM114-Status: GOOD (  14.74  )
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

T24gTWF5IDE0LCAyMDI2IDEyOjUxOjU5IFBNIFBEVCwgR29mZnJlZG8gQmFyb25jZWxsaSA8a3Jl
aWphY2tAbGliZXJvLml0PiB3cm90ZToKPk9uIDEzLzA1LzIwMjYgMDcuNDcsIENocmlzdG9waCBI
ZWxsd2lnIHdyb3RlOgo+PiBPbiBUdWUsIE1heSAxMiwgMjAyNiBhdCAwMTo0MjozMVBNICswMjAw
LCBEYXZpZCBTdGVyYmEgd3JvdGU6Cj4KPj4gCj4+PiBUaGUgZGVnZW5lcmF0ZSBtb2RlcyBvZgo+
Pj4gcmFpZDAsIDUsIG9yIDYgYXJlIGV4cGxpY2l0IGFzIGEgcG9zc2libGUgbWlkZGxlIHN0ZXAg
d2hlbiBjb252ZXJ0aW5nCj4+PiBwcm9maWxlcy4gIFdlIGNhbiB1c2UgYSBmYWxsYmFjayBpbXBs
ZW1lbnRhdGlvbiBmb3IgdGhpcyBjYXNlIGlmIHRoZQo+Pj4gYWNjZWxlcmF0ZWQgaW1wbGVtZW50
YXRpb25zIGNhbm5vdCBkbyBpdC4KPj4gCj4+IFRoaXMgaXMgbm90IGFib3V0IGEgZGVnZW5lcmF0
ZWQgbW9kZS4gIEZvciBhIGRlZ2VuZXJhdGVkIFJBSUQgNiwgcGFyaXR5Cj4+IGdlbmVyYXRpb24g
dXNlcyB0aGUgUkFJRCA1IFhPUiByb3V0aW5lcyBhcyB0aGUgc2Vjb25kIHBhcml0eSB3aWxsIGJl
Cj4+IG1pc3NpbmcuICBUaGlzIGlzIGFib3V0IGdlbmVyYXRpbmcgdHdvIHBhcml0aWVzIGZvciBh
IHNpbmdsZSBkYXRhIGRpc2ssCj4+IHdoaWNoIG11c3QgYmUgZXhwbGljaXRseSBzZWxlY3RlZC4K
Pj4gCj4KPkkgdGhpbmsgdGhhdCB0aGUgRGF2aWQgY29uY2VybiBpcyA6ICJ3aGF0IGhhcHBlbnMg
Zm9yIGFuIGFscmVhZHkKPmV4aXN0aW5nIGJ0cmZzIHJhaWQ2IDMgZGlza3MgZmlsZXN5c3RlbSB3
aGVuIHRoZSB1c2VyIHVwZ3JhZGUgdGhlIGtlcm5lbCA/Igo+KEkgYW0gdGhpbmtpbmcgd2hlbiBh
IG5ldyBCRyBuZWVkcyB0byBiZSBhbGxvY2F0ZWQpLi4uCj4KPkJSCj5HQgo+CgpUaGF0J3Mgd2hh
dCBJJ20gc2F5aW5nIOKAkyBpdCBzaG91bGQgaW52b2tlIHRoZSBSQUlELTEgY29kZSB1bmRlciB0
aGUgY292ZXIgKGFzIHdpdGggMyBkaXNrcywgRCA9IFAgPSBRLikKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
