Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCA0C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 08:43:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D296C60FF1
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 08:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D296C60FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O6CY9J6HbyXd/D8wWFLGHt2i4GEQgayZ9B6bfbJTf/U=; b=EctuHZzud/5YeDbt6PFrglKsZk
	+5NVJeb6MK6IhDS1Z9RjSqFBhqZr+QzJCyc3z7/7y6i2rdaOjnAaKXtxugbMvuMqsgevGo9Abq5qk
	IU0ly0eb4pTvpeDoROOpPO6lCCtkh/f4ikHlyl69FWWRVqr44ngH0saYcCV0u336j3M5MWNNAJXAX
	JCQC6GA3kUdsCn7JOC+j9SF7pnCtfZRa/xcjS6xpMd2RpwMccSXligUcF5njSpLNnxNFsuQ35t3PL
	0hQi/gB+/WrJMresNtD3cRrdEMy4non5eWe9gFjnLdABquIesXtCggu4fZsaZRRl0RUun12dwUmNw
	IzMkyN+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYPUb-009TfB-C2; Mon, 19 Apr 2021 08:42:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYPUN-009Tck-Ho; Mon, 19 Apr 2021 08:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Hp5HZmsO3UmlUWz7VUtTFdboFx+rLc0fC4QIRM5e8hg=; b=QA2XdgnKlnXFLjsKAYc/uRw+rG
 dqNBARxzBeTaKj6vfFlwlUiq43aPAZLxdUahom0wgdDa/HfY9gUb93sFS+NPtwJImm8HIi4bxCRju
 u5UOmF2bKefZXMhgJblFtGOfvsp7eatjQDVidKe0+rRzNxqTyQn0HNqd07eAJJ8FrW8pSlQhFVchy
 Gj+JctTUs6fmJLu8nGmj5atB1pE9gLRJXQP3nqr3MJ+xCsct8xku8AdKqN7/AEk5ITUh7bdZExbhn
 woH8Y/ottQtPJd9we/1sp7Uusc1Quik2D8jA5VJFK2/K9IGGxCNJfAF+l64lXDHwPTtOgNpcrgcxa
 xpftPsxw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYPUK-00BCYn-QE; Mon, 19 Apr 2021 08:42:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31DCF60FF1;
 Mon, 19 Apr 2021 08:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618821755;
 bh=ZF11+tf8Vhkw2CEEFwa77xqf5VWgUkXxrjvgn6XQs/g=;
 h=From:To:Cc:Subject:Date:From;
 b=nahTyurCdGGs/pKCEP8Ak/lpVtsi3V/pYxzKOzhHQVRrgd+HwSBHMp1c9VUvrUitZ
 lJO9E6YcRd6HfnllMc4TARUDu7xLHMaT5wCrC0xq5KCkq7QPScpBbwGhtKL2cUnlca
 S/XmN2p6Y5UiygqA4Iw/VW3Ovb/Tm7XMV2dSuU0Vx5JbaHgjAcQZGedyYpI5bGdNUN
 Swxd/sv5Pgcqe5q+W3CHtA8D5LIhwcS+NCKcymUNnFpMQPAS39WzvUsgIx4yz1H69k
 n9/rwnGjwqls7iqtmMKQ0KOPa18PvcYsCiO1B+OHgixQZ6x49EO1+/4Ba+tjGA33KC
 ROLb1q5BZJDGA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Shakeel Butt <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>,
 Will Deacon <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org,
 kernel test robot <oliver.sang@intel.com>
Subject: [PATCH] secretmem: optimize page_is_secretmem()
Date: Mon, 19 Apr 2021 11:42:18 +0300
Message-Id: <20210419084218.7466-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_014236_953259_6C6D6B93 
X-CRM114-Status: GOOD (  18.15  )
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

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgoKS2VybmVsIHRlc3Qgcm9i
b3QgcmVwb3J0ZWQgLTQuMiUgcmVncmVzc2lvbiBvZiB3aWxsLWl0LXNjYWxlLnBlcl90aHJlYWRf
b3BzCmR1ZSB0byBjb21taXQgIm1tOiBpbnRyb2R1Y2UgbWVtZmRfc2VjcmV0IHN5c3RlbSBjYWxs
IHRvIGNyZWF0ZSAic2VjcmV0IgptZW1vcnkgYXJlYXMiLgoKVGhlIHBlcmYgcHJvZmlsZSBvZiB0
aGUgdGVzdCBpbmRpY2F0ZWQgdGhhdCB0aGUgcmVncmVzc2lvbiBpcyBjYXVzZWQgYnkKcGFnZV9p
c19zZWNyZXRtZW0oKSBjYWxsZWQgZnJvbSBndXBfcHRlX3JhbmdlKCkgKGlubGluZWQgYnkgZ3Vw
X3BnZF9yYW5nZSk6CgogMjcuNzYgICsyLjUgIDMwLjIzICAgICAgIHBlcmYtcHJvZmlsZS5jaGls
ZHJlbi5jeWNsZXMtcHAuZ3VwX3BnZF9yYW5nZQogIDAuMDAgICszLjIgICAzLjE5IMKxIDIlICBw
ZXJmLXByb2ZpbGUuY2hpbGRyZW4uY3ljbGVzLXBwLnBhZ2VfbWFwcGluZwogIDAuMDAgICszLjcg
ICAzLjY2IMKxIDIlICBwZXJmLXByb2ZpbGUuY2hpbGRyZW4uY3ljbGVzLXBwLnBhZ2VfaXNfc2Vj
cmV0bWVtCgpGdXJ0aGVyIGFuYWx5c2lzIHNob3dlZCB0aGF0IHRoZSBzbG93IGRvd24gaGFwcGVu
cyBiZWNhdXNlIG5laXRoZXIKcGFnZV9pc19zZWNyZXRtZW0oKSBub3IgcGFnZV9tYXBwaW5nKCkg
YXJlIG5vdCBpbmxpbmUgYW5kIG1vcmVvdmVyLAptdWx0aXBsZSBwYWdlIGZsYWdzIGNoZWNrcyBp
biBwYWdlX21hcHBpbmcoKSBpbnZvbHZlIGNhbGxpbmcKY29tcG91bmRfaGVhZCgpIHNldmVyYWwg
dGltZXMgZm9yIHRoZSBzYW1lIHBhZ2UuCgpNYWtlIHBhZ2VfaXNfc2VjcmV0bWVtKCkgaW5saW5l
IGFuZCByZXBsYWNlIHBhZ2VfbWFwcGluZygpIHdpdGggcGFnZSBmbGFnCmNoZWNrcyB0aGF0IGRv
IG5vdCBpbXBseSBwYWdlLXRvLWhlYWQgY29udmVyc2lvbi4KClJlcG9ydGVkLWJ5OiBrZXJuZWwg
dGVzdCByb2JvdCA8b2xpdmVyLnNhbmdAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJh
cG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQoKQEFuZHJldywKVGhlIHBhdGNoIGlzIHZz
IHY1LjEyLXJjNy1tbW90cy0yMDIxLTA0LTE1LTE2LTI4LCBJJ2QgYXBwcmVjaWF0ZSBpZiBpdCB3
b3VsZApiZSBhZGRlZCBhcyBhIGZpeHVwIHRvIHRoZSBtZW1mZF9zZWNyZXQgc2VyaWVzLgoKIGlu
Y2x1ZGUvbGludXgvc2VjcmV0bWVtLmggfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrLQog
bW0vc2VjcmV0bWVtLmMgICAgICAgICAgICB8IDEyICstLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFu
Z2VkLCAyNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L3NlY3JldG1lbS5oIGIvaW5jbHVkZS9saW51eC9zZWNyZXRtZW0uaAppbmRleCA5
MDdhNjczNDA1OWMuLmI4NDJiMzhjYmViMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9zZWNy
ZXRtZW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L3NlY3JldG1lbS5oCkBAIC00LDggKzQsMzIgQEAK
IAogI2lmZGVmIENPTkZJR19TRUNSRVRNRU0KIAorZXh0ZXJuIGNvbnN0IHN0cnVjdCBhZGRyZXNz
X3NwYWNlX29wZXJhdGlvbnMgc2VjcmV0bWVtX2FvcHM7CisKK3N0YXRpYyBpbmxpbmUgYm9vbCBw
YWdlX2lzX3NlY3JldG1lbShzdHJ1Y3QgcGFnZSAqcGFnZSkKK3sKKwlzdHJ1Y3QgYWRkcmVzc19z
cGFjZSAqbWFwcGluZzsKKworCS8qCisJICogVXNpbmcgcGFnZV9tYXBwaW5nKCkgaXMgcXVpdGUg
c2xvdyBiZWNhdXNlIG9mIHRoZSBhY3R1YWwgY2FsbAorCSAqIGluc3RydWN0aW9uIGFuZCByZXBl
YXRlZCBjb21wb3VuZF9oZWFkKHBhZ2UpIGluc2lkZSB0aGUKKwkgKiBwYWdlX21hcHBpbmcoKSBm
dW5jdGlvbi4KKwkgKiBXZSBrbm93IHRoYXQgc2VjcmV0bWVtIHBhZ2VzIGFyZSBub3QgY29tcG91
bmQgYW5kIExSVSBzbyB3ZSBjYW4KKwkgKiBzYXZlIGEgY291cGxlIG9mIGN5Y2xlcyBoZXJlLgor
CSAqLworCWlmIChQYWdlQ29tcG91bmQocGFnZSkgfHwgIVBhZ2VMUlUocGFnZSkpCisJCXJldHVy
biBmYWxzZTsKKworCW1hcHBpbmcgPSAoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKikKKwkJKCh1bnNp
Z25lZCBsb25nKXBhZ2UtPm1hcHBpbmcgJiB+UEFHRV9NQVBQSU5HX0ZMQUdTKTsKKworCWlmICht
YXBwaW5nICE9IHBhZ2UtPm1hcHBpbmcpCisJCXJldHVybiBmYWxzZTsKKworCXJldHVybiBwYWdl
LT5tYXBwaW5nLT5hX29wcyA9PSAmc2VjcmV0bWVtX2FvcHM7Cit9CisKIGJvb2wgdm1hX2lzX3Nl
Y3JldG1lbShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7Ci1ib29sIHBhZ2VfaXNfc2VjcmV0
bWVtKHN0cnVjdCBwYWdlICpwYWdlKTsKIGJvb2wgc2VjcmV0bWVtX2FjdGl2ZSh2b2lkKTsKIAog
I2Vsc2UKZGlmZiAtLWdpdCBhL21tL3NlY3JldG1lbS5jIGIvbW0vc2VjcmV0bWVtLmMKaW5kZXgg
M2IxYmEzOTkxOTY0Li4wYmNkMTVlMWI1NDkgMTAwNjQ0Ci0tLSBhL21tL3NlY3JldG1lbS5jCisr
KyBiL21tL3NlY3JldG1lbS5jCkBAIC0xNTEsMjIgKzE1MSwxMiBAQCBzdGF0aWMgdm9pZCBzZWNy
ZXRtZW1fZnJlZXBhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiAJY2xlYXJfaGlnaHBhZ2UocGFnZSk7
CiB9CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgYWRkcmVzc19zcGFjZV9vcGVyYXRpb25zIHNlY3Jl
dG1lbV9hb3BzID0geworY29uc3Qgc3RydWN0IGFkZHJlc3Nfc3BhY2Vfb3BlcmF0aW9ucyBzZWNy
ZXRtZW1fYW9wcyA9IHsKIAkuZnJlZXBhZ2UJPSBzZWNyZXRtZW1fZnJlZXBhZ2UsCiAJLm1pZ3Jh
dGVwYWdlCT0gc2VjcmV0bWVtX21pZ3JhdGVwYWdlLAogCS5pc29sYXRlX3BhZ2UJPSBzZWNyZXRt
ZW1faXNvbGF0ZV9wYWdlLAogfTsKIAotYm9vbCBwYWdlX2lzX3NlY3JldG1lbShzdHJ1Y3QgcGFn
ZSAqcGFnZSkKLXsKLQlzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZyA9IHBhZ2VfbWFwcGlu
ZyhwYWdlKTsKLQotCWlmICghbWFwcGluZykKLQkJcmV0dXJuIGZhbHNlOwotCi0JcmV0dXJuIG1h
cHBpbmctPmFfb3BzID09ICZzZWNyZXRtZW1fYW9wczsKLX0KLQogc3RhdGljIHN0cnVjdCB2ZnNt
b3VudCAqc2VjcmV0bWVtX21udDsKIAogc3RhdGljIHN0cnVjdCBmaWxlICpzZWNyZXRtZW1fZmls
ZV9jcmVhdGUodW5zaWduZWQgbG9uZyBmbGFncykKLS0gCjIuMjguMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
