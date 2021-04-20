Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E90C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 15:02:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D70E610CC
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 15:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D70E610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xNwsYDWTBF0rk85+PHLLbOq/DG2pJU+xUnMkGdakWdc=; b=hQOfFVJ+0usW4b0nlfz+J/nBm
	f3NfOcVBL90Enuc6HvmbSarpTQdNLvBypfgplLqdrg/jMpiEjRr1WZ6WD+iwAj2Ug429J1n//P+k/
	8Moe7qWhAQb9SIxa2NqugvNA0w3Un6ZqppiDODp8wiAX+tA1irg4hKmLfco53nE26PGpx4wxwGtmX
	LWzVTz9EJUWT8pJaRtJrW+8+E9Lmm1zqw3x/Gq345RGCUKeJ8/iEE2XpLDf0XeuWKf+QgHySvyZ0n
	M5IJsJpH6OXKCGjiLnnAFI3LsLiLt0Vr+XT8UrJBn3/VUvWQFPCD1mfdm06+BvzCBpk/stq4/zQ2u
	LYJSEyiBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYrsu-00CPPh-Cy; Tue, 20 Apr 2021 15:01:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrsZ-00CPLM-RR; Tue, 20 Apr 2021 15:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=SUg8wB0RrT5587aVCPvM1LiwsySkMaT1rmEJCD31MUk=; b=l6tqxfg+N8fNbthW5zDfICHte1
 23ZSiywjyvAHD+Md/8Ev/itnOBZozGcn2/WWlmI/fEZPgqLJNfBtkJiCc/VdfIWtV/IKFBS65NquT
 nDFeubo1WCvFAHOKdrInTacOjwdFQNntYRyZg/8UBPiKZLvaI5PtA3uHOl3uugaqkANgNqJgMnZyG
 yN6kVLDHp3Kn1H+ND4HlRsCSaQgKv3jfcm85sY3D4+jTc4HZGQ9ki46sVbZr4KzCddMBY1JrIHmu0
 wVtY+zzEGvBIDL3bLzmLSWBoHPl4d0EosB4GGZtmlZxGMnXRVKs/8jhYyGqpGSKLBlYLmso2ZZQBI
 yyDSerlw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrsX-00CDQm-4q; Tue, 20 Apr 2021 15:01:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BBEE613D1;
 Tue, 20 Apr 2021 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618930888;
 bh=I/WWp3ZhiKpLexAP/6uikhopmlNfpvxqz9r1ZOciMHE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XwXn6wJhOGAPWFLJTXk9f9dCUdigjUcxoFpXuTTS7QeUKVHcKf3zboTSJuyxuYjhb
 7S7xoeOnTbujEhT+qOIHjvQZre4ngKMAYrLa0rLDC3mofLug616wj1X5JSuijxJl3M
 wtWUvSC/otrlPsLI++IhM/Oomn7H4VvxqSgNKO7a+xupoT4mtWTM+1UljzJQw1bV49
 aAL3dsbVJgqgEIWEnKruH97rHDTT/mkJA2/canG8R1Uf1jGMHr0nvKzI5l0LQUBq2w
 wnSLVpbmsRZF+NWjSRwMNhPpfFP2tVySPxwi4WHp6VrQK1Z5FqJbynTDJqoZBqn7aB
 joNOnC5v3AX0Q==
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
Subject: [PATCH v3 2/2] secretmem: optimize page_is_secretmem()
Date: Tue, 20 Apr 2021 18:00:49 +0300
Message-Id: <20210420150049.14031-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210420150049.14031-1-rppt@kernel.org>
References: <20210420150049.14031-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_080129_290733_C8B586C6 
X-CRM114-Status: GOOD (  17.45  )
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
cG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9zZWNyZXRtZW0u
aCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKystCiBtbS9zZWNyZXRtZW0uYyAgICAgICAg
ICAgIHwgMTIgKy0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc2VjcmV0bWVtLmgg
Yi9pbmNsdWRlL2xpbnV4L3NlY3JldG1lbS5oCmluZGV4IDkwN2E2NzM0MDU5Yy4uYjg0MmIzOGNi
ZWIxIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3NlY3JldG1lbS5oCisrKyBiL2luY2x1ZGUv
bGludXgvc2VjcmV0bWVtLmgKQEAgLTQsOCArNCwzMiBAQAogCiAjaWZkZWYgQ09ORklHX1NFQ1JF
VE1FTQogCitleHRlcm4gY29uc3Qgc3RydWN0IGFkZHJlc3Nfc3BhY2Vfb3BlcmF0aW9ucyBzZWNy
ZXRtZW1fYW9wczsKKworc3RhdGljIGlubGluZSBib29sIHBhZ2VfaXNfc2VjcmV0bWVtKHN0cnVj
dCBwYWdlICpwYWdlKQoreworCXN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nOworCisJLyoK
KwkgKiBVc2luZyBwYWdlX21hcHBpbmcoKSBpcyBxdWl0ZSBzbG93IGJlY2F1c2Ugb2YgdGhlIGFj
dHVhbCBjYWxsCisJICogaW5zdHJ1Y3Rpb24gYW5kIHJlcGVhdGVkIGNvbXBvdW5kX2hlYWQocGFn
ZSkgaW5zaWRlIHRoZQorCSAqIHBhZ2VfbWFwcGluZygpIGZ1bmN0aW9uLgorCSAqIFdlIGtub3cg
dGhhdCBzZWNyZXRtZW0gcGFnZXMgYXJlIG5vdCBjb21wb3VuZCBhbmQgTFJVIHNvIHdlIGNhbgor
CSAqIHNhdmUgYSBjb3VwbGUgb2YgY3ljbGVzIGhlcmUuCisJICovCisJaWYgKFBhZ2VDb21wb3Vu
ZChwYWdlKSB8fCAhUGFnZUxSVShwYWdlKSkKKwkJcmV0dXJuIGZhbHNlOworCisJbWFwcGluZyA9
IChzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqKQorCQkoKHVuc2lnbmVkIGxvbmcpcGFnZS0+bWFwcGlu
ZyAmIH5QQUdFX01BUFBJTkdfRkxBR1MpOworCisJaWYgKG1hcHBpbmcgIT0gcGFnZS0+bWFwcGlu
ZykKKwkJcmV0dXJuIGZhbHNlOworCisJcmV0dXJuIHBhZ2UtPm1hcHBpbmctPmFfb3BzID09ICZz
ZWNyZXRtZW1fYW9wczsKK30KKwogYm9vbCB2bWFfaXNfc2VjcmV0bWVtKHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hKTsKLWJvb2wgcGFnZV9pc19zZWNyZXRtZW0oc3RydWN0IHBhZ2UgKnBhZ2Up
OwogYm9vbCBzZWNyZXRtZW1fYWN0aXZlKHZvaWQpOwogCiAjZWxzZQpkaWZmIC0tZ2l0IGEvbW0v
c2VjcmV0bWVtLmMgYi9tbS9zZWNyZXRtZW0uYwppbmRleCAzYjFiYTM5OTE5NjQuLjBiY2QxNWUx
YjU0OSAxMDA2NDQKLS0tIGEvbW0vc2VjcmV0bWVtLmMKKysrIGIvbW0vc2VjcmV0bWVtLmMKQEAg
LTE1MSwyMiArMTUxLDEyIEBAIHN0YXRpYyB2b2lkIHNlY3JldG1lbV9mcmVlcGFnZShzdHJ1Y3Qg
cGFnZSAqcGFnZSkKIAljbGVhcl9oaWdocGFnZShwYWdlKTsKIH0KIAotc3RhdGljIGNvbnN0IHN0
cnVjdCBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgc2VjcmV0bWVtX2FvcHMgPSB7Citjb25zdCBz
dHJ1Y3QgYWRkcmVzc19zcGFjZV9vcGVyYXRpb25zIHNlY3JldG1lbV9hb3BzID0gewogCS5mcmVl
cGFnZQk9IHNlY3JldG1lbV9mcmVlcGFnZSwKIAkubWlncmF0ZXBhZ2UJPSBzZWNyZXRtZW1fbWln
cmF0ZXBhZ2UsCiAJLmlzb2xhdGVfcGFnZQk9IHNlY3JldG1lbV9pc29sYXRlX3BhZ2UsCiB9Owog
Ci1ib29sIHBhZ2VfaXNfc2VjcmV0bWVtKHN0cnVjdCBwYWdlICpwYWdlKQotewotCXN0cnVjdCBh
ZGRyZXNzX3NwYWNlICptYXBwaW5nID0gcGFnZV9tYXBwaW5nKHBhZ2UpOwotCi0JaWYgKCFtYXBw
aW5nKQotCQlyZXR1cm4gZmFsc2U7Ci0KLQlyZXR1cm4gbWFwcGluZy0+YV9vcHMgPT0gJnNlY3Jl
dG1lbV9hb3BzOwotfQotCiBzdGF0aWMgc3RydWN0IHZmc21vdW50ICpzZWNyZXRtZW1fbW50Owog
CiBzdGF0aWMgc3RydWN0IGZpbGUgKnNlY3JldG1lbV9maWxlX2NyZWF0ZSh1bnNpZ25lZCBsb25n
IGZsYWdzKQotLSAKMi4yOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
