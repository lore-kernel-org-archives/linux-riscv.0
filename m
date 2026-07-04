Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA65C43458
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jul 2026 17:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nh4uJTFNUqBuh7HFuF2gUq0HjJt2v5LXT94UF348N2s=; b=2UwUpr2FwCEVQq
	ojP8T963aYsPwSte4wNJNNbf+qv5v+SAykCdmk0yhUh0cKM2LhC9tS3uaCHcWEfp4R3JaPsrWylVH
	deHrMsczBugk2q3b45+2jLkM2nOgp8yIhm1EyIhibonKp2muiUjUIouxMmG5nn6jSwVyCDJKzNnPw
	XGiRQpYzZnkc1RkzOEOINMIp6nPZkFYFnMoXFWAJEgJe1iG2KAZZ/m4NPQEZDgtgysEUN9zbEyMkf
	rcDaIO9uBPCR+3auJnnlywTvF4FFSzfwW8EK56T7gi5SSiKsz5EewFOkMrZFuSUC1No4Tfc41y7S3
	3Hh3hqfoSAJ4mzvdus3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg4I1-00000008czN-0lLt;
	Sat, 04 Jul 2026 17:36:29 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg4Hy-00000008cyz-0Q6Q
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jul 2026 17:36:27 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 664HJ3VH1732288
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 4 Jul 2026 10:19:04 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 664HJ3VH1732288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1783185548;
	bh=dTFud6IYNn4nvyg1znQWrkcJonRufF/qiM6XZzzUK0c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=CJF5CAKRz4eNOPyR8kG0iAzsmyc+IwhntrZI2+KNzBcxTwm4Pcp7ISaY7lclR6A+T
	 R6iud2HrZonYFu7Ng8lIZ2Zy+h6YMeauv3txYKWEhoUf4+sfZRGAxFauHe9YYLo4uT
	 C6dgcvSiTqEU+iIkY6G3PGqbNZPx4bFWNID7VQM3t0H3q9hYfHNBXSLVMX7VMkyGoT
	 AchFenE1pkrCZJeaXw8wK9l7BRpqKAAfu9aoRxmSUBXrsCED1ggSW/SS3uws8TW93A
	 TkiqPgvXsUI43KFbqW08LGibZW5bbrWgmswEj6zjL2nzb2J1On7jMSJi4qiHbO8w3j
	 5g1n/GjjLwl9A==
Date: Sat, 04 Jul 2026 10:18:58 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Sven Schnelle <svens@linux.ibm.com>,
        =?ISO-8859-1?Q?Michal_Such=E1nek?= <msuchanek@suse.de>
CC: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
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
        Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Andrew Donnellan <andrew+kernel@donnellan.id.au>,
        Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, Zong Li <zong.li@sifive.com>,
        Nam Cao <namcao@linutronix.de>, Deepak Gupta <debug@rivosinc.com>,
        Lukas Gerlach <lukas.gerlach@cispa.de>,
        Rui Qi <qirui.001@bytedance.com>, Kees Cook <kees@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC=5D_entry=3A_Untangle_the_return_value_of?=
 =?US-ASCII?Q?_syscall=5Fenter=5Ffrom=5Fuser=5Fmode_from_syscall_NR?=
User-Agent: K-9 Mail for Android
In-Reply-To: <yt9dtsqg480p.fsf@linux.ibm.com>
References: <akVRcPsD_R_CE1qW@kunlun.suse.cz> <BA7CD91D-C0E5-47A1-B49C-BC6AF6604182@zytor.com> <87h5mhnjsr.ffs@fw13> <yt9dwlvca8rn.fsf@linux.ibm.com> <87ldbsmnie.ffs@fw13> <yt9d5x2w5r84.fsf@linux.ibm.com> <20260703105718.GO751831@noisy.programming.kicks-ass.net> <akecJWAJP-e5CYP_@kunlun.suse.cz> <yt9dtsqg480p.fsf@linux.ibm.com>
Message-ID: <69ACC6A7-7845-41B4-B0D0-2E6FCDA7443D@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_103626_145923_F9DA7EC5 
X-CRM114-Status: GOOD (  13.36  )
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

T24gSnVseSAzLCAyMDI2IDQ6Mzk6MTggQU0gUERULCBTdmVuIFNjaG5lbGxlIDxzdmVuc0BsaW51
eC5pYm0uY29tPiB3cm90ZToKPk1pY2hhbCBTdWNow6FuZWsgPG1zdWNoYW5la0BzdXNlLmRlPiB3
cml0ZXM6Cj4KPj4gVGhlIHNhbWUgY291bGQgYmUgYXNrZWQgb2Ygc3lzY2FsbF9lbnRlcl9mcm9t
X3VzZXJfbW9kZS4gSSBmaW5kIGl0IHZlcnkKPj4gb2RkLiBXaHkgZG9lcyBpdCBjb25mbGF0ZSB0
aGUgc3lzY2FsbCBudW1iZXIgd2l0aCBpdHMgcmV0dXJuIHZhbHVlPwo+Pgo+PiBJdCBuZXZlciB1
c2VzIHRoZSBzeXNjYWxsIG51bWJlciBwYXNzZWQgaW4gZXhjZXB0IHdoZW4gcmV0dXJuaW5nIGl0
Cj4+IHVuY2hhbmdlZC4gV2hlbiBpdCBwb2tlcyB0aGUgcmVnaXN0ZXJzIGl0IHJlYWRzIHRoZSBz
eXNjYWxsIG51bWJlciBmcm9tCj4+IHRoZW0uCj4+Cj4+IElmIHRoZSBjYWxsZXIgb2Ygc3lzY2Fs
bF9lbnRlcl9mcm9tX3VzZXJfbW9kZSBvbmx5IHJlYWQgdGhlIHN5c2NhbGwKPj4gbnVtYmVyIGZy
b20gdGhlIHJlZ2lzdGVycyB3aGVuIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUgcmV0dXJu
cyBhbmQKPj4gaW5kaWNhdGVzIHRoZSBzeXNjYWxsIHNob3VsZCBiZSBzdGlsbCBleGVjdXRlZCB0
aGlzIHdob2xlIHNoZW5pZ2FuIHdvdWxkCj4KPkkgYWdyZWUuIFRoZSBmYWN0IHRoYXQgaWYgKG5y
IDwgTlJfc3lzY2FsbCkganVzdCB3b3JrcyBiZWNhdXNlIC0xIGdldHMKPmNhc3RlZCB0byAweGZm
ZmZmZmZmIGFuZCBpcyB0aGVyZWZvcmUgb3V0IG9mIGJvdW5kcyBpcyB2ZXJ5IG9kZC4KPgoKTm90
IGF0IGFsbCBzdHJhbmdlLiBJdCBpcyBhbiAqZXh0cmVtZWx5KiBjb21tb24gY29uc3RydWN0IGlu
IEMsIGVzcGVjaWFsbHkgZm9yIHJhbmdlIGNoZWNraW5nIHZhbHVlcyBpbnRvIFswLCBuKS4KCklu
IGFkZGl0aW9uIHRvIGJlaW5nIGlkaW9tYXRpYywga2VlcCBpbiBtaW5kIHRoYXQgdGhpcyBpcyBv
bmUgb2YgdGhlIGFic29sdXRlbHkgbW9zdCBwZXJmb3JtYW5jZSBjcml0aWNhbCBwYXRocyBpbiB0
aGUgZW50aXJlIGtlcm5lbC4gT25lIG9mIHRoZSBmdW5kYW1lbnRhbCBjb3JuZXJzdG9uZXMgYmVo
aW5kIFVuaXggaXMgdG8ga2VlcCBzeXN0ZW0gY2FsbHMgY2hlYXAgc28gdGhhdCB0aGV5IGNhbiBi
ZSBzaW1wbGUgYnVpbGRpbmcgYmxvY2tzIGZvciBtb3JlIGNvbXBsZXggb3BlcmF0aW9ucy4gSXQg
aXMgbm90IHRoZSBvbmx5IHBvc3NpYmxlIGRlc2lnbiBwaGlsb3NvcGh5LCBidXQgaXQgaXMgdGhl
IG9uZSB3ZSBjaG9zZSB0byBhZG9wdCwgcXVpdGUgc3VjY2Vzc2Z1bGx5LgoKVGhlIGRvd25zaWRl
PyBTcXVlZXppbmcgZXZlcnkgcG9zc2libGUgY3ljbGUgb3V0IG9mIHRoZSBzeXN0ZW0gY2FsbCBw
YXRoIGJlY29tZXMgb25lIG9mIHRoZSBtb3N0IGVzc2VudGlhbCB0dW5pbmcgdGFza3MuIFRoZSBn
b29kIHBhcnQgaXMgdGhhdCBrZWVwaW5nIHRoZSBzeXN0ZW0gY2FsbCBwYXRoIGNsZWFuIGFsc28g
bWFrZXMgaXQgbWFpbnRhaW5hYmxlLCBldmVuIHdoZW4gdGhlcmUgYXJlIHF1aXJrcy4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
