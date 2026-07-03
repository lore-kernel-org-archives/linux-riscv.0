Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F22CC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 21:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqYO73cGdDRjIH2qYRMt5Yj7f2ogMqfr4TLt5NmzO4I=; b=tEI9MnMkqYNCfH
	7CI92rzsvBffzDVXxT76ds5sravGvAmLKA2EUbh1Qu/SgN5lIoRxkZGgFBHbPHllZQBWoQ0ZoPHOD
	19+43NJxegZKdVXzpLhavcbStXKKxoAJns+pWCmVWy69ZzMQ7KGJv8lMdPdFqcmyhCc8SYd5CfQHv
	adB0ccZ87sjEjbcifDkhdheIz9XP50ch/iPlhugZq9ClgnhY9lB15YJfAG+k6LXXKD8bV4pwejJkG
	UNB9O8meTkXy40AbgiGobz4CvxsOjwUKHW14uN39WoLJjH5NrRNYKJnmXwTCX4Gln4zY80L2umBpR
	tFTVrL6L4E3lmiuPZ5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wflJI-00000007vUx-00IH;
	Fri, 03 Jul 2026 21:20:32 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wflJC-00000007vUA-39EH;
	Fri, 03 Jul 2026 21:20:30 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 663L1ZSA3634717
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 3 Jul 2026 14:01:35 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 663L1ZSA3634717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1783112500;
	bh=GmRpAk0oLfd0gWfVh+rqnEOK9BfphxBIPqfUy4WToJg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=XsI115ZBOQE6RF8kLr3qg2nWr/ZTSr4Cc85qgkCOplrXGEthFkxyO4lr4Oxope3Ei
	 uXNwCi3aZ7FCtu+IMJnAqz2+ucRqWMj1Z7USJtc8sJ3JeZ97gpLik9L3v7EKJiITZs
	 v3dorB7yOn0T5r2CkG54hpyoXlryh4wtyjAKA2DelYGyZEF7zAgS971DjfDngm3ESi
	 xNG5a833nv7cyD8PK/+FW1vBKez1uSFK+Mw4JZVnFQTsSNU/45Xgc7/odbqex1xmxx
	 hXA4rZMcbl0HR+NkDB+kp5lErI+aTQzy/C6IBW2f20LsUByG25W5uHpF7doGhQ6iHG
	 wsGBsVIphvsfg==
Date: Fri, 03 Jul 2026 14:01:29 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Thomas Gleixner <tglx@kernel.org>, Kevin Brodsky <kevin.brodsky@arm.com>,
        =?ISO-8859-1?Q?Michal_Such=E1nek?= <msuchanek@suse.de>,
        Mark Rutland <mark.rutland@arm.com>
CC: Jinjie Ruan <ruanjinjie@huawei.com>, oleg@redhat.com,
        richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
        linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
        kees@kernel.org, guoren@kernel.org, chenhuacai@kernel.org,
        kernel@xen0n.name, geert@linux-m68k.org, tsbogend@alpha.franken.de,
        James.Bottomley@hansenpartnership.com, deller@gmx.de,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, richard@nod.at,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        luto@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, chris@zankel.net, jcmvbkbc@gmail.com,
        peterz@infradead.org, wad@chromium.org, thuth@redhat.com,
        ada.coupriediaz@arm.com, linusw@kernel.org, yeoreum.yun@arm.com,
        song@kernel.org, james.morse@arm.com, anshuman.khandual@arm.com,
        broonie@kernel.org, liqiang01@kylinos.cn, pengcan@kylinos.cn,
        ryan.roberts@arm.com, yangtiezhu@loongson.cn, sshegde@linux.ibm.com,
        mchauras@linux.ibm.com, austin.kim@lge.com, jchrist@linux.ibm.com,
        arnd@arndb.de, thomas.weissschuh@linutronix.de, sohil.mehta@intel.com,
        andrew.cooper3@citrix.com, jgross@suse.com, kas@kernel.org,
        x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-um@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v16_01/18=5D_seccomp=3A_Convert?=
 =?US-ASCII?Q?_=5F=5Fsecure=5Fcomputing=28=29_to_return_boolean?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87echjlrs4.ffs@fw13>
References: <20260629130616.642022-1-ruanjinjie@huawei.com> <20260629130616.642022-2-ruanjinjie@huawei.com> <akdp6GAu77-ipsXA@kunlun.suse.cz> <87cxx4mmim.ffs@fw13> <akeIK5TRCjlKbzbp@J2N7QTR9R3> <akeOjqMy7HVgRRCr@kunlun.suse.cz> <fa1f5b39-2703-40a1-81d6-3feba87e19b0@arm.com> <87echjlrs4.ffs@fw13>
Message-ID: <F0993CE8-27EB-42D9-80F7-04A7A73C2395@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_142028_934364_C2ACA1F9 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
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

T24gSnVseSAzLCAyMDI2IDE6NTI6NDMgUE0gUERULCBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj5PbiBGcmksIEp1bCAwMyAyMDI2IGF0IDEzOjU5LCBLZXZpbiBCcm9k
c2t5IHdyb3RlOgo+PiBPbiAwMy8wNy8yMDI2IDEyOjI3LCBNaWNoYWwgU3VjaMOhbmVrIHdyb3Rl
Ogo+Pj4+IElmIHdlJ3JlIGNoYW5naW5nIHRoZSByZXR1cm4gdHlwZSwgaXQgbWlnaHQgYmUgd29y
dGggcmVuYW1pbmcgdGhlCj4+Pj4gZnVuY3Rpb24gc29tZXRoaW5nIGxpa2U6Cj4+Pj4KPj4+PiAJ
c2VjY29tcF9wZXJtaXRzX3N5c2NhbGwoKQo+Pj4gVGhlbiBub3Qgb25seSBpdCBpcyBjbGVhciB3
aGljaCB3YXkgdGhlIGJvb2xlYW4gdmFsdWUgc2hvdWxkIGJlCj4+PiBpbnRlcnByZXRlZCwgaXQg
YWxzbyBwZXJ2ZW50cyB0aGUgYWNjaWRlbnRhbCBpbnZlcnNpb24gb2YgZXhpc3RpbmcKPj4+IGNh
bGxzLiBPdmVyYWxsIGdyZWF0Lgo+Pgo+PiBUb3RhbGx5IGFncmVlZCwgaWYgd2UgaGF2ZSB0aGUg
b3Bwb3J0dW5pdHkgdG8gcmVuYW1lIGEgY29tcGxldGVseQo+PiB1bmRlc2NyaXB0aXZlIGZ1bmN0
aW9uIG5hbWUgbGlrZSAic2VjdXJlX2NvbXB1dGluZyIgd2Ugc2hvdWxkIHRha2UgaXQuCj4KPkFi
c29sdXRlbHkgbm8gb2JqZWN0aW9ucyBmcm9tIG15IHNpZGUgb24gdGhhdC4KPgoKSGVsbCB5ZXMu
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
