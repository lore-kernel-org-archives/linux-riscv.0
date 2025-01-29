Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13379C0218D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8vGQ/F6DYRlD+8fQzPcjy5yKEfIH+zs444us06XRZM=; b=4/BXFlPhF4Vddf
	UT5rvk6bUaoINt6/28DIfIpA6kdvmPsbjDOV6f7dMs+ORHuRCncuszVznhhiF9sOgKHgnHL6nDJ/A
	bTIzItZIHZ5GS84+X4cqtrt4wF9yMDH0+73ovyAOKNhdGwIfXXqVmhT6shnIy+LTIc6F7l0QaTuWD
	Z5QQeKnCwJQ/Kw7Qgul69Fqfp4zA1XV/o6/T8+QVkfb+O9RuvVJt7qfLYh2R57Vu33o/5iKaU8nFB
	yFa+V1bhUYhOaBGlJ2AaguFofsLRm3gHaPQTszyCP7jpGS3eYXghWLcSaDZrkxLecF9XIZ39Y9hAr
	YJVplV3k4wz/BmjK0orQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td3mV-00000006aTX-20jm;
	Wed, 29 Jan 2025 08:50:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td3l9-00000006a6N-2Cow;
	Wed, 29 Jan 2025 08:49:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 631165C027D;
	Wed, 29 Jan 2025 08:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAFA1C4CED3;
	Wed, 29 Jan 2025 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738140558;
	bh=bkecGghn49Q0kcBr4/Q4RAYEqTU2lzStxg+kMBkUviM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+6QRnebTmdCsTn/fBIyawZ8F2h5FOi1VkBceKjrJE9gQqYhsE4MpI+DUnmOyvn9r
	 jy2STn2XFJrPEPFrh+vO/ZWYbctxdvY6UR3Ry6YZK+y8a1MhcK6ynlBs1p1BMMkJ1P
	 w6gLTDQPv35AYJJgnh4TzBlS6e9ascDPFne+p1YDjEpGVHG5PR2AxRH9J1o9Q9BPKi
	 anvTB+Oa86UvplOCcaBDT4qhHCCSJO/P11ip4o+2DBjUNcnkNIz/KxsEnezLq+wofc
	 pmlKCTkKHhEdUE5jBQ13DTAnVV4ZlV/QW5dr1RzqeBZB57C+fkYnuuFh6jqnxMpijz
	 QxNX1fm0X2YKQ==
Date: Wed, 29 Jan 2025 09:49:13 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Cc: Matthew Wilcox <willy@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, 
	netfs@lists.linux.dev, codalist@coda.cs.cmu.edu, linux-mm@kvack.org, 
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
	keyrings@vger.kernel.org, Song Liu <song@kernel.org>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, Corey Minyard <cminyard@mvista.com>
Subject: Re: Re: Re: Re: Re: [PATCH v2] treewide: const qualify ctl_tables
 where applicable
Message-ID: <umk5gfo7iq7krppvqsal57hlzds26bdqd3g7kccjzuudjikdws@k2oknd6zx6g7>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
 <87jzag9ugx.fsf@intel.com>
 <Z5epb86xkHQ3BLhp@casper.infradead.org>
 <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
 <CAHC9VhQnB_bsQaezBfAcA0bE7Zoc99QXrvO1qjpHA-J8+_doYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhQnB_bsQaezBfAcA0bE7Zoc99QXrvO1qjpHA-J8+_doYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_004919_756110_0C2A956E 
X-CRM114-Status: GOOD (  25.41  )
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

T24gVHVlLCBKYW4gMjgsIDIwMjUgYXQgMTA6NDM6MTBBTSAtMDUwMCwgUGF1bCBNb29yZSB3cm90
ZToKPiBPbiBUdWUsIEphbiAyOCwgMjAyNSBhdCA2OjIy4oCvQU0gSm9lbCBHcmFuYWRvcyA8am9l
bC5ncmFuYWRvc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDI3LCAyMDI1IGF0
IDAzOjQyOjM5UE0gKzAwMDAsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+ID4gPiBPbiBNb24sIEph
biAyNywgMjAyNSBhdCAwNDo1NTo1OFBNICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToKPiA+ID4g
PiBZb3UgY291bGQgaGF2ZSBzdGF0aWMgY29uc3Qgd2l0aGluIGZ1bmN0aW9ucyB0b28uIFlvdSBn
ZXQgdGhlIHJvZGF0YQo+ID4gPiA+IHByb3RlY3Rpb24gYW5kIGZ1bmN0aW9uIGxvY2FsIHNjb3Bl
LCBiZXN0IG9mIGJvdGggd29ybGRzPwo+ID4gPgo+ID4gPiB0aW1lcl9hY3RpdmUgaXMgb24gdGhl
IHN0YWNrLCBzbyBpdCBjYW4ndCBiZSBzdGF0aWMgY29uc3QuCj4gPiA+Cj4gPiA+IERvZXMgdGhp
cyByZWFsbHkgbmVlZCB0byBiZSBjYydkIHRvIHN1Y2ggYSB3aWRlIGRpc3RyaWJ1dGlvbiBsaXN0
Pwo+ID4gVGhhdCBpcyBhIHZlcnkgZ29vZCBxdWVzdGlvbi4gSSByZW1vdmVkIDE2MCBwZW9wbGUg
ZnJvbSB0aGUgb3JpZ2luYWwKPiA+IGUtbWFpbCBhbmQgbGVmdCB0aGUgb25lcyB0aGF0IHdoZXJl
IHByZXZpb3VzbHkgaW52b2x2ZWQgd2l0aCB0aGlzIHBhdGNoCj4gPiBhbmQgbGVmdCBhbGwgdGhl
IGxpc3RzIGZvciBnb29kIG1lYXN1cmUuIEJ1dCBpdCBzZWVtcyBJIGNhbiByZWR1Y2UgaXQKPiA+
IGV2ZW4gbW9yZS4KPiA+Cj4gPiBIb3cgYWJvdXQgdGhpczogRm9yIHRoZXNlIHRyZWV3aWRlIGVm
Zm9ydHMgSSBqdXN0IGxlYXZlIHRoZSBwZW9wbGUgdGhhdAo+ID4gYXJlL3dlcmUgaW52b2x2ZWQg
aW4gdGhlIHNlcmllcyBhbmQgYWRkIHR3byBsaXN0czogbGludXgta2VybmVsIGFuZAo+ID4gbGlu
dXgtaGFyZGVuaW5nLgo+ID4KPiA+IFVubGVzcyBzb21lb25lIHNjcmVhbXMsIEknbGwgdHJ5IHRo
aXMgb3V0IG9uIG15IG5leHQgdHJlZXdpZGUuCj4gCj4gSSdtIG5vdCBzY3JlYW1pbmcgYWJvdXQg
aXQgOikgYnV0IGFueXRoaW5nIHRoYXQgdG91Y2hlcyB0aGUgTFNNLApJJ2xsIGNvbnNpZGVyIGl0
IGFzIGEgc2NyZWFtIDopIFNvIEknbGwga2VlcCBteSBwcmV2aW91cyBhcHByb2FjaCBvZgpsZWF2
aW5nIG9ubHkgcGVyc29uYWwgbWFpbHMgdGhhdCBhcmUgaW52b2x2ZWQsIGJ1dCBsZWF2aW5nIGFs
bCB0aGUgbGlzdHMKdGhhdCBiNCBzdWdnZXN0cy4KCj4gU0VMaW51eCwgb3IgYXVkaXQgY29kZSAo
b3IgbWF0Y2hlcyB0aGUgcmVnZXggaW4gTUFJTlRBSU5FUlMpIEkgd291bGQKPiBwcmVmZXIgdG8g
c2VlIG9uIHRoZSBhc3NvY2lhdGVkIG1haWxpbmcgbGlzdC4KCkdlbmVyYWwgY29tbWVudCBzZW50
IHRvIHRoZSB2b2lkOgpJdCBpcyB0cmlja3kgdG8ga25vdyBleGFjdGx5IHdobyB3YW50cyB0byBi
ZSBpbmZvcm1lZCBvZiBhbGwgdGhpcyBhbmQKd2hvIHRoaW5rcyBpdHMgdXNlbGVzcy4gSSB0aGlu
ayB0aGF0IGlmIHdlIHdhbnQgbW9yZSBmb2N1cyBpdCBzaG91bGQKY29tZSBmcm9tIGF1dG9tYXRl
ZCB0b29scyBsaWtlIGI0LiBNYXliZSBzb21lIHN0cmluZyBpbiBNQUlOVEFJTkVSUwpzdGF0aW5n
IHRoYXQgdGhlIGxpc3Qgc2hvdWxkIG5vdCBiZSB1c2VkIGluIGNhc2VzIG9mIHRyZWUtd2lkZSBj
b21taXRzPwoKQmVzdAoKLS0gCgpKb2VsIEdyYW5hZG9zCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
