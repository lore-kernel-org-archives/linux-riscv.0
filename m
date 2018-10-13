Return-Path: <SRS0=D72f=MZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D00C71122
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 09:25:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4CFB20859
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 09:25:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+x+P1ow"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4CFB20859
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sourceforge.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToAqgiL+EJWhYSn98/xBXjVXkyas+xTes9y9c5b3NDw=; b=G+x+P1owWDUa9M
	oxb7ZL2hd1IGOKpkggI53oDZ8J6fY08MzIrwIRJv7grMVto0fHaBN5fLet0IRQNZ7q4gqcPDD2sK+
	sd5FyHsikJi/Epdl8uYS51gQvmtqzljuELw1YdGysgFwq+/OsH+0mJofuKzTtaNnDTARRmfCssVqT
	iF4nxNnAbhv9UfHRR2Hp0JITorN3egzOsyop7aQ3IF0puhoWD/FSzcXhKDy6nY+zra3/mxhIAd66i
	N1CgfSZpv3m5kOFCH0w3BwRB4Ld+YpQNNddfOXQXJJiylCueO6EWr1DPEGqm9WPFtyzIZxFg0bbt6
	3T6ZubIrR+Vde88xQAwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gBGAb-0003JX-10; Sat, 13 Oct 2018 09:25:13 +0000
Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBGAU-0002fr-R0; Sat, 13 Oct 2018 09:25:08 +0000
Received: from [192.168.1.2] ([77.182.109.121]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Ljgd6-1fe7F90cKO-00bZio; Sat, 13
 Oct 2018 11:23:11 +0200
Received: from [192.168.1.2] ([77.182.109.121]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Ljgd6-1fe7F90cKO-00bZio; Sat, 13
 Oct 2018 11:23:11 +0200
Subject: Re: [PATCH v2 1/2] treewide: remove unused address argument from
 pte_alloc functions
To: Joel Fernandes <joel@joelfernandes.org>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <03b524f3-5f3a-baa0-2254-9c588103d2d6@users.sourceforge.net>
 <20181012194210.GA27630@joelaf.mtv.corp.google.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <e1be1dda-90ab-052d-496b-3de01ffc80d1@users.sourceforge.net>
Date: Sat, 13 Oct 2018 11:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181012194210.GA27630@joelaf.mtv.corp.google.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:opVsTsdRSQYHnglK8xvkCUZUswSzgAiKoS+KIhCNIvHd3Yq3Ufx
 ceTjZIQMEq4s0BqtUDsQA+V/NSZ/iWF9ovz8l3V5T+EzWg7BbDd+DB1TsHw9ObirhajDCPf
 m94io4so/kUaQ+paPJXJjuENjQDWI0XLcPpR7a3huBeUNpGTXKQjSmr/JDL+b4gW6p57u4Z
 1BzRLcEsMoiZQwc663VQA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:v6MarwJQGgc=:Ymq3Px86/PQtPzMwB8SDWz
 2sVTW3LAMS2aIZ8Ekzl7/SDvldDrpm06rM73xwb0uYPMZ3GHwT//p8vaal6x17s8ay7WilQrz
 K1Bg967tVvkE9O+bHYv3RH85K5N3GlfnSnpVrzbF5FATwM77bmyW3MOdfKY7APM2E6r4svqKH
 MjIc6EhkL1944Pl4HVJszGwMBqx/ea3HMQWVGQE7Fd0Ebm1oh0deQfClHVkLGh8/eDgF8Djb6
 zhE9SKkfVZD6CWg7y9Zr8UuLknPaHhds4jQlAMO+YyPfNMHH3UXbXN3LViy8PQi9Sfu/wr8jr
 3+NabdySRdW+Eh9PkizWR+WbpiupacwKtItrKdb/mvDoVJACLixppwElNeEYZJCv3pD52wuiM
 eNEH08JILjZld6narndqV/zqIowHw7k2AsltgBKw0Mqlcd3QvKYQQZP0kzRbToXq5ZBasFKx6
 U+BMMQhDfw/6IIb5b051oCjD+wiruFio921rpsNCRU5y6aHnm+w7j8hRQukryGIa8LOrD4JCW
 yaRthF7hb06kDcJkklIkR9xn6uu3m37H3Ya+z/Dsj+VDmHFNkctUwe9XY3r0EKO0MJqy4riYs
 Lund5+9Dymq/dXSENAL9MmfFRdRSfOQ12yYUHLRKcOYrSNFpBluxLsiBkqcJq5jwuxdjSZhRe
 QzXp5jsYL6wwfiq9dly7RAYyGqQBu1TI8IMDHj5CyOWHrrPCt6S8e7162OjoHxsMqNTW8Aaoo
 z0PdDLyq3fVbSyAsDljIS3uoxrzwE7ryXbtER5vO5qv8MegP+wfnql8gFgSZR2DOoTwd1GhVk
 Nw4MxMBjGx6rPT068O9XO/l/2SyaNynS07fdGT4KUxwYM+p1nk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181013_022507_209337_060A18A7 
X-CRM114-Status: GOOD (  15.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Lokesh Gidra <lokeshgidra@google.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Daniel Colascione <dancol@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Hugh Dickins <hughd@google.com>,
 "James E. J. Bottomley" <jejb@parisc-linux.org>, kasan-dev@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, Will Deacon <will.deacon@arm.com>,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, nios2-dev@lists.rocketboards.org,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Richard Weinberger <richard@nod.at>, linux-parisc@vger.kernel.org,
 pantin@google.com, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181013092249.Q9ee06Ylqe-CbLk3AZ-Fj98U2SHj8w-ERwc1pmcxveA@z>

Pj4+IFRoZSBjaGFuZ2VzIHdlcmUgb2J0YWluZWQgYnkgYXBwbHlpbmcgdGhlIGZvbGxvd2luZyBD
b2NjaW5lbGxlIHNjcmlwdC4KCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gYWRqdXN0IHRoZSBv
cmRlciBvZiBwcm92aWRlZCBpbmZvcm1hdGlvbgppbiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uPwox
LiBVcGRhdGUgZ29hbHMKMi4gVHJhbnNmb3JtYXRpb24gaW1wbGVtZW50YXRpb24gYXQgdGhlIGVu
ZAoKCj4+ICJeKD86cHRlX2FsbG9jKD86X29uZSg/Ol9rZXJuZWwpPyk/fF9fcHRlX2FsbG9jKD86
X2tlcm5lbCk/KSQiOwo+IAo+IFN1cmUgaXQgbG9va3MgbW9yZSBjbGV2ZXIsIGJ1dCB3aHk/Cgox
LiBVc2FnZSBvZiBub24tY2FwdHVyaW5nIHBhcmVudGhlc2VzCjIuIENsZWFyZXIgc3BlY2lmaWNh
dGlvbiB3aGljaCBwYXJ0cyBjYW4gYmUgdHJlYXRlZCBhcyBvcHRpb25hbAogICBpbiB0aGUgc2Vh
cmNoIHBhdHRlcm4uCgoKPiBVZ2ggdGhhdCdzIGhhcmRlciB0byByZWFkIGFuZCBjb25mdXNpbmcu
CgoqIERvIHlvdSBjYXJlIGZvciBjb2Rpbmcgc3R5bGUgYW5kIGV4ZWN1dGlvbiBzcGVlZCBvZiBy
ZWd1bGFyIGV4cHJlc3Npb25zPwoKKiBJZiB5b3Ugd291bGQgcHJlZmVyIHRvIGxpc3QgZnVuY3Rp
b24gbmFtZXMgd2l0aG91dCBwbGFjZWhvbGRlcnMsCiAgeW91IGNhbiBldmVudHVhbGx5IHNwZWNp
ZnkgdGhlbSBhbHNvIHdpdGhpbiBTbVBMIGRpc2p1bmN0aW9ucyBkaXJlY3RseS4KCiogSXQgY2Fu
IGxvb2sgc2ltcGxlciB0byB1c2UgYW4gaWRlbnRpZmllciBsaXN0IGFzIGEgY29uc3RyYWludCB2
YXJpYW50LgogIGh0dHA6Ly9jb2NjaW5lbGxlLmxpcDYuZnIvZG9jcy9tYWluX2dyYW1tYXIwMDIu
aHRtbAoKCj4gQWdhaW4gdGhpcyBpcyBjb25mdXNpbmcuCgpUaGUgdmlldyBwb2ludHMgY2FuIGJl
IGRpZmZlcmVudCBmb3Igc3VjaCBTbVBMIGNvZGUuCgogVDMgZm4oVDEgRTEKKAotICAgICAgICAg
ICAsIFQyIEUyCnwgICAgICAgICAgICwgVDIgRTIKLSAgICAgICAgICAgLCBUNCBFNAopICAgICAp
OwoKCj4gSXQgbWFrZXMgb25lIHRoaW5rIHRoYXQgbWF5YmUgdGhlIHNlY29uZCBhcmd1bWVudCBj
YW4gYWxzbyBiZSByZW1vdmVkCgpZb3UgZXhwcmVzc2VkIHRoaXMgYXMgdGhlIGZpcnN0IHRyYW5z
Zm9ybWF0aW9uIHBvc3NpYmlsaXR5LCBkaWRuJ3QgeW91PwoKWW91IHdvdWxkIGxpa2UgdG8gZGVs
ZXRlIGFuIGFyZ3VtZW50IGZyb20gdGhlIGVuZCBvZiBhIGZ1bmN0aW9uCm9yIG1hY3JvIHBhcmFt
ZXRlciAob3IgZXhwcmVzc2lvbikgbGlzdC4KSSBzdWdnZXN0IHRoZW4gYWdhaW4gdG8gYXZvaWQg
dGhlIFNtUEwgc3BlY2lmaWNhdGlvbiBvZiBzb3VyY2UgY29kZSBhZGRpdGlvbnMKKHBsdXMgbGlu
ZXMgaW4gdGhlIGZpbGUgZGlmZmVyZW5jZSBmb3JtYXQpLgoKCj4gYW5kIHJlcXVpcmVzIGNhcmVm
dWwgb2JzZXJ2YXRpb24gdGhhdCB0aGUgIik7IiBmb2xsb3dzLgoKWWVzLCBvZiBjb3Vyc2UuCgpX
b3VsZCB5b3UgY2FyZSBtb3JlIGluIHRoZSBkaXN0aW5jdGlvbiB3aGljaCBjb2RlIHBhcnRzIHNo
b3VsZCBiZSBrZXB0IHVuY2hhbmdlZD8KCgo+IFJpZ2h0LCBJIGRvbid0IG5lZWQgaXQgaW4gdGhp
cyBjYXNlLgoKVGhhbmtzIGZvciB5b3VyIHVuZGVyc3RhbmRpbmcgdGhhdCB0aGUgbWV0YXZhcmlh
YmxlIOKAnHBvc2l0aW9uIHDigJ0KY2FuIGJlIGRlbGV0ZWQgaW4gdGhlIFNtUEwgcnVsZSDigJxw
dGVfYWxsb2NfbWFjcm/igJ0uCgoKPiBCdXQgdGhlIHNjcmlwdCB3b3JrcyBlaXRoZXIgd2F5LgoK
SSBpbWFnaW5lIHRoYXQgeW91IGNhbiBiZWNvbWUgaW50ZXJlc3RlZCBpbiBhIGJpdCBuaWNlciBy
dW4gdGltZSBjaGFyYWN0ZXJpc3RpY3MuCgoKPiBJIGxpa2UgdG8gdGFrZSBtb3JlIG9mIGEgcHJv
YmxlbSBzb2x2aW5nIGFwcHJvYWNoIHRoYXQgbWFrZXMgc2Vuc2UsCgpUaGlzIGlzIHVzdWFsLgoK
Cj4gdGhhbiBhaW1pbmcgZm9yIHBlcmZlY3Rpb24sCgpJZiB5b3Ugd2lsbCB3b3JrIG1vcmUgd2l0
aCBzY3JpcHRzIGZvciB0aGUgc2VtYW50aWMgcGF0Y2ggbGFuZ3VhZ2UsCnlvdSBtaWdodCBiZWNv
bWUgdXNlZCB0byBhZGRpdGlvbmFsIGNvZGluZyB2YXJpYW50cy4KCgo+IGFmdGVyIGFsbCB0aGlz
IGlzIGEgdXNlZnVsIHNjcmlwdCB0aGF0IHdlIGRvIG5vdCBuZWVkIHRvIGNoZWNrCj4gaW4gb25j
ZSB3ZSBmaW5pc2ggd2l0aCBpdC4KCkkgYW0gY3VyaW91cyBpZiB0aGVyZSB3aWxsIGV2b2x2ZSBh
IG5lZWQgdG8gYWRkIHNpbWlsYXIgdHJhbnNmb3JtYXRpb24gYXBwcm9hY2hlcwp0byBhIGtub3du
IHNjcmlwdCBjb2xsZWN0aW9uLgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9zY3JpcHRzL2NvY2NpbmVsbGU/aWQ9
NzlmYzE3MGIxZjVjMzZmNDg2ZDg4NmJmYmQ1OWViNGU2MjMyMTEyOAoKV291bGQgeW91IGV2ZW50
dWFsbHkgbGlrZSB0byBydW4gc3VjaCBzY3JpcHRzIG9uY2UgbW9yZT8KClJlZ2FyZHMsCk1hcmt1
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
