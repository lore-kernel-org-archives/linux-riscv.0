Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A409C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:17:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C150B60BD3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 13:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C150B60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xNwsYDWTBF0rk85+PHLLbOq/DG2pJU+xUnMkGdakWdc=; b=iJUUauYyOENQg/12jxjAFd3zF
	6p0FsNeX1hToVjKVx4hSSBWwIxu0eo3WkEBE8K2GF5gPi3h6SNg6YzZ7dkjqCBwa1u7xQHrsVBy7b
	AdgfJWDl2bLv0RXkm4NuyXbyAnR4pm56FVOG87K3v0xB7jtL1Zpe/hbMdc7ZyIXE+IExqUV7VjE6M
	emg96tGnxp7k1Q1EkJIFq1Y5UevsXwNklJbRwt6UK8gt+Xfy7ulY0YxGL8Vxh03r+gbsJz2Fq6kdt
	sF0t6+9eh4nzbMWP1/TSM4U4pLYG3HyI/s/zCkol4tsqTU9LHmy180ShavS0YZyIFDZ13RMCaNa+/
	Jl3lmBV4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqFf-00CBEC-Tg; Tue, 20 Apr 2021 13:17:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqFL-00CBAB-VN; Tue, 20 Apr 2021 13:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=SUg8wB0RrT5587aVCPvM1LiwsySkMaT1rmEJCD31MUk=; b=gzAC5lxw38qgF36Aqz/gala1Gr
 iJMq+fYxKxhwWiguQXEsQ8UR+DxrVyumPO69/RUQ9yVn8dB2sVcio9v4sdXtzlPU+mcarsz5Ac150
 NXu7gX+8HOaJK6sp1I9OVVTovABQENy0lqI8TaZn5vdbAwigWfmNJoHQQwecxYyqOUhnsDKFPDVoB
 9DezF4+ysvyuIwFInc1wcLVwnKXT1rAqdbOJDo3do3gk+BXcJBXw7UA1mgA6w9Ihy1ENBGxMtmBGm
 bw8/CRp/o7wuIkRQJbm9B2hgqFbAUHaMtam8SZAizMLYZil+GHWUFLSKev4ug+BN7TvSO6yZzWWWv
 f8HoAkbw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqFH-00C8Fv-O1; Tue, 20 Apr 2021 13:16:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3539C6054E;
 Tue, 20 Apr 2021 13:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618924611;
 bh=I/WWp3ZhiKpLexAP/6uikhopmlNfpvxqz9r1ZOciMHE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MLCTSce9OniTPPSRnUpVeXThvdoyd0taSU7fa/CYv08AQbTRzTVTUxL9USTpI2yEF
 LkqtCHxKipBED3JIEOguSwX4VEDDB4PzVVdSd/Yfeo8Hmo9l2ocXZjzd8udzkYjRYD
 XBGUvYC46RNIPDpy64zVsJLv0iDLmLzr6mLm5V9f2P+H9YB1CFxsOYXxcBIfEIGcky
 nz+d1yohJllxlvDx0LFYKiN5pVVwLlRkaTDxcZ5njLBbxFD8vRItGGJ6HTyOLS9WQC
 y7Gl8aHxgSfr7wZfSSLSmhRMp2FRmJMRxJ7JeSgqldd8LtjCPKmA9AvVg0xSpqsHSw
 TJZkUhVtGP34A==
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
Subject: [PATCH v2 1/2] secretmem: optimize page_is_secretmem()
Date: Tue, 20 Apr 2021 16:16:09 +0300
Message-Id: <20210420131611.8259-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210420131611.8259-1-rppt@kernel.org>
References: <20210420131611.8259-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_061651_884772_D55D59DF 
X-CRM114-Status: GOOD (  17.55  )
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
