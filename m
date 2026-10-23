Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F8F606A31B
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 06:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j/y6SpWV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ilZMMvv+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RjN8oWiUAPhLzw7BWjSmsM86udUa8zTLO/UFDpNBGWc=; b=j/y6SpWVx+f8v8I9Mh6Uwivi9m
	a0P4g1y6Z+2760rrGTiDQbQtyz9MCozM/DKiYiLX5dWyZibF18pZJToBtushkLVH67iv/UDQ0Su0a
	erhaoaxhIc1y15ULvm5Yg/GTuwRRx7ycBiR0Jf+V2Q2vsL1EuppeOvhcNOQN+XOMvgXNS96ENyoNI
	sOeJ8bsjRZOnJWGd5GtVMk0/H/dAIT9VmzAK0Kxv3+ab5trcOVxe03Z1NBpFxJ3JuedbS5po48DYn
	4kMqfsNXofvwP6iNrhUuVxyUYkMandMfkOsCVyeinU5Pnz+LJ5yv9Hk51VJuwU+2QMm9a7t79QjG3
	yiSbgaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rc-0000000FZvr-3Pxe;
	Fri, 23 Oct 2026 06:34:52 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8ra-0000000FZts-2cX6
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 06:34:51 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so290677a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 23:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792737290; x=1793342090; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=db1iEGMFzAz69F0Qd2NIWb14nn5dPV9u5Dz96tL5APM=;
        b=ilZMMvv+H/Mn1Y4w2ZAvCllSsaUR9smcqejQAkie2t8eBa7+ICg+RF02vibWSlxVgi
         eiEjtpqKQrs5TMaiuyuVgoV+rFG/j3w1sn6rD+eW5jzD5saFOOOqmW6l+X7qoXlzwLgI
         Jxn5BJ4Nr5O5/ciqsHuEy1fpQQbLsX8A1eaAtAVI8S+KOJ2wHA25B90tjHcoCY2V+RZg
         KrUf29e12ZmC5Lsh4cQUxs2BgtaLdGyBhBz0syleSToR8/tVSxo4GFPJvB9FVD0tLazm
         FuXdA1FAkS4VNWlTXc9VdEU2ikMvcwYllV800860s7QidwFjRqHIEd8ydp41Mxe7jrUD
         S4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737290; x=1793342090;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=db1iEGMFzAz69F0Qd2NIWb14nn5dPV9u5Dz96tL5APM=;
        b=F68I3kQn63vLo5ATW/RhbkhzbLedpEJ8ibQmuPMcpMknKgwlx20+LuF/fNzx02FksC
         QS8dLIIdxNZ9sBgEv9Yfc6mqlrCuyd+tgDJDK/veuJ2v7I3QPM/f0ZhPA/2T1Wv6S5Qt
         CpE3NX/C4+ChByhdN3tzjYOtpkmw99UfHna35vTNZZqrEJxysMfREm9X61d/iJWxRcH1
         pwRDqJQ/mY/6YTQGaBx6oABNeBBiuT/Zn60xftc18yvVa8PGl/heMP+zpERgME7GjsHE
         e5zqxo5z3oQzP3Uwu9LUyYFHRAgK1kgWWDtT/5Vb8RRdgRxoXJExgSrHG3tf3AoZJ/pX
         Cmjg==
X-Forwarded-Encrypted: i=1; AKwUvBx0TCGBLa6AddsDK0NLeVUvG14/IM0FHIEPiSyTwaVMvK9/wwyoaa5RDQ91TsooVFWOq/QMeSdmg+GHnw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKbEA6R7D9uJWx+0UxH0xJsUHQGDcLdI9fqb/wk/MtF0WW68x/1
	gzWhXxP2XoJ0b5uX4myq5APUsY7DVrGoSw0OjzPKRqk+hofszy7ikpegcSCzLZkXD3I=
X-Gm-Gg: AYBFou09AHmVa/zFSsxU2bw4fECBffGHrJiF3odJgFq+B8/8ZFzO1dr1EngKsu6iP4e
	su5vXG7Yw2an+AhX296v+PbcAzqAfUNGBeIoFUXNcE9NbB4anoO4b3QpCcZRzsAZqWwVC+aSdyx
	Ja438ALYG2hm+Wkfl3Vl6T6uNWt/w5Mjq0mm8f4mhYg4CgDrrGIy86OFaUdnqulpoGSxp/c3xE3
	KDCwJZVclRkUekJB/a4ybMrmlo/0WlioRvlW3fOgK50LzHgppScRLqu0QNR8fwjYLSn9FVGa8nW
	ALIqCbICgYJE7h4eTJc7OxgQKfA8GhiBkqgwybFYSnm+co7eW/K+7WUw4KHKHGiINRtBF8JZjvX
	nXkZjRUuOK0h8ZODNryTBSj7P/Pg/FYoPNzkrfWdSIprqlPEtS2Cj9ePAyDe1GVlXWZrLhT1V6Q
	TqTMrculWk2OCCtpL/2Qba2qFGAegEKqvFCN7SlIU+mNsh++pxbnN7aEFghlqFuEBmm3BGy+8Ti
	JYwWR5QDOpdTK9BfuHYnqYhpeHfqRNsuEg3RRPAj7CHSpJLKi35mezlrjQbzdKBYzCSLf+DdMP7
	+A==
X-Received: by 2002:a17:90b:3b44:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3adce08329dmr1117038a91.42.1792737289490;
        Thu, 22 Oct 2026 23:34:49 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add246f308sm575202a91.0.2026.10.22.23.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:34:48 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 2/4] riscv/mm: fix hotplug page-table destructor handling
Date: Fri, 23 Oct 2026 14:34:26 +0800
Message-ID: <20261023063428.3658761-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023063428.3658761-1-songmuchun@bytedance.com>
References: <20261023063428.3658761-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233450_674965_1DDA1FC8 
X-CRM114-Status: GOOD (  13.77  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

UklTQy1WIHVzZXMgdGhlIHNhbWUgbWVtb3J5LWhvdHBsdWcgdGVhcmRvd24gY29kZSBmb3IgbGlu
ZWFyLW1hcCBhbmQKdm1lbW1hcCBwYWdlIHRhYmxlcy4gTGF0ZSBsaW5lYXItbWFwIGFsbG9jYXRp
b25zIHJ1biBwYWdlLXRhYmxlCmNvbnN0cnVjdG9ycywgd2hpbGUgdm1lbW1hcCBhbmQgZWFybHkg
YWxsb2NhdGlvbnMgbWF5IG5vdC4KCmZyZWVfcHRlX3RhYmxlKCkgdW5jb25kaXRpb25hbGx5IGNh
bGxzIHBhZ2V0YWJsZV9kdG9yKCksIGNvcnJ1cHRpbmcKTlJfUEFHRVRBQkxFIGFjY291bnRpbmcg
Zm9yIGNvbnN0cnVjdG9yLWZyZWUgdGFibGVzLiBmcmVlX3BtZF90YWJsZSgpCmF2b2lkcyB0aGF0
IGZvciB2bWVtbWFwIHVzaW5nIGlzX3ZtZW1tYXAsIGJ1dCBtYXBwaW5nIHR5cGUgaXMgbm90IGEK
cmVsaWFibGUgcHJveHkgZm9yIGNvbnN0cnVjdG9yIHN0YXRlLiBJbiBwYXJ0aWN1bGFyLCBpdCBi
ZWNvbWVzIGludmFsaWQKb25jZSBydW50aW1lIHZtZW1tYXAgdGFibGVzIHVzZSB0aGUgbm9ybWFs
IHBnYWxsb2MgaGVscGVycy4KCkludHJvZHVjZSBmcmVlX3BndGFibGVfcGFnZSgpIHRvIHNlbGVj
dCBmcmVlX3Jlc2VydmVkX3BhZ2UoKSBmb3IgcmVzZXJ2ZWQKcGFnZXMgYW5kIHBhZ2V0YWJsZV9m
cmVlKCkgb3RoZXJ3aXNlLiBUaGUgbGF0dGVyIHJ1bnMgdGhlIGRlc3RydWN0b3Igb25seQp3aGVu
IFBhZ2VUYWJsZSgpIGlzIHNldCwgaGFuZGxpbmcgYm90aCBjb25zdHJ1Y3Rvci1iYWNrZWQgYW5k
CmNvbnN0cnVjdG9yLWZyZWUgdGFibGVzLgoKRml4ZXM6IGM3NWE3NGY0YmExOSAoInJpc2N2OiBt
bTogQWRkIG1lbW9yeSBob3RwbHVnZ2luZyBzdXBwb3J0IikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcKQXNzaXN0ZWQtYnk6IExMTQpTaWduZWQtb2ZmLWJ5OiBNdWNodW4gU29uZyA8c29uZ211
Y2h1bkBieXRlZGFuY2UuY29tPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4KUmV2aWV3ZWQtYnk6IEtldmluIEJyb2Rza3kgPGtldmluLmJyb2Rza3lAYXJtLmNv
bT4KQWNrZWQtYnk6IERhdmlkIEhpbGRlbmJyYW5kIChBcm0pIDxkYXZpZEBrZXJuZWwub3JnPgot
LS0KdjM6Ci0gQ29sbGVjdCBBY2tlZC1ieSBmcm9tIERhdmlkIEhpbGRlbmJyYW5kCi0gQ29sbGVj
dCBSZXZpZXdlZC1ieSBmcm9tIEJqw7ZybiBUw7ZwZWwgYW5kIEtldmluIEJyb2Rza3kKCnYyOgot
IFVzZSBwYWdldGFibGVfZnJlZSgpIGZvciBub24tcmVzZXJ2ZWQgdGFibGVzIChzdWdnZXN0ZWQg
YnkgRGF2aWQKICBIaWxkZW5icmFuZCkKLSBTaW1wbGlmeSByZXNlcnZlZC1wYWdlIGhhbmRsaW5n
Ci0tLQogYXJjaC9yaXNjdi9tbS9pbml0LmMgfCAyNyArKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCmlu
ZGV4IGZiMzdiMGI2N2VmZS4uZTExMWQyNWUxOGUxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L21t
L2luaXQuYworKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwpAQCAtMTQ4NSwxMCArMTQ4NSwxNyBA
QCBzdHJ1Y3QgZXhlY21lbV9pbmZvIF9faW5pdCAqZXhlY21lbV9hcmNoX3NldHVwKHZvaWQpCiAj
ZW5kaWYgLyogQ09ORklHX0VYRUNNRU0gKi8KIAogI2lmZGVmIENPTkZJR19NRU1PUllfSE9UUExV
Rworc3RhdGljIHZvaWQgX19tZW1pbml0IGZyZWVfcGd0YWJsZV9wYWdlKHN0cnVjdCBwYWdlICpw
YWdlKQoreworCWlmIChQYWdlUmVzZXJ2ZWQocGFnZSkpCisJCWZyZWVfcmVzZXJ2ZWRfcGFnZShw
YWdlKTsKKwllbHNlCisJCXBhZ2V0YWJsZV9mcmVlKHBhZ2VfcHRkZXNjKHBhZ2UpKTsKK30KKwog
c3RhdGljIHZvaWQgX19tZW1pbml0IGZyZWVfcHRlX3RhYmxlKHB0ZV90ICpwdGVfc3RhcnQsIHBt
ZF90ICpwbWQpCiB7CiAJc3RydWN0IHBhZ2UgKnBhZ2UgPSBwbWRfcGFnZSgqcG1kKTsKLQlzdHJ1
Y3QgcHRkZXNjICpwdGRlc2MgPSBwYWdlX3B0ZGVzYyhwYWdlKTsKIAlwdGVfdCAqcHRlOwogCWlu
dCBpOwogCkBAIC0xNDk4LDE4ICsxNTA1LDEzIEBAIHN0YXRpYyB2b2lkIF9fbWVtaW5pdCBmcmVl
X3B0ZV90YWJsZShwdGVfdCAqcHRlX3N0YXJ0LCBwbWRfdCAqcG1kKQogCQkJcmV0dXJuOwogCX0K
IAotCXBhZ2V0YWJsZV9kdG9yKHB0ZGVzYyk7Ci0JaWYgKFBhZ2VSZXNlcnZlZChwYWdlKSkKLQkJ
ZnJlZV9yZXNlcnZlZF9wYWdlKHBhZ2UpOwotCWVsc2UKLQkJcGFnZXRhYmxlX2ZyZWUocHRkZXNj
KTsKKwlmcmVlX3BndGFibGVfcGFnZShwYWdlKTsKIAlwbWRfY2xlYXIocG1kKTsKIH0KIAotc3Rh
dGljIHZvaWQgX19tZW1pbml0IGZyZWVfcG1kX3RhYmxlKHBtZF90ICpwbWRfc3RhcnQsIHB1ZF90
ICpwdWQsIGJvb2wgaXNfdm1lbW1hcCkKK3N0YXRpYyB2b2lkIF9fbWVtaW5pdCBmcmVlX3BtZF90
YWJsZShwbWRfdCAqcG1kX3N0YXJ0LCBwdWRfdCAqcHVkKQogewogCXN0cnVjdCBwYWdlICpwYWdl
ID0gcHVkX3BhZ2UoKnB1ZCk7Ci0Jc3RydWN0IHB0ZGVzYyAqcHRkZXNjID0gcGFnZV9wdGRlc2Mo
cGFnZSk7CiAJcG1kX3QgKnBtZDsKIAlpbnQgaTsKIApAQCAtMTUxOSwxMiArMTUyMSw3IEBAIHN0
YXRpYyB2b2lkIF9fbWVtaW5pdCBmcmVlX3BtZF90YWJsZShwbWRfdCAqcG1kX3N0YXJ0LCBwdWRf
dCAqcHVkLCBib29sIGlzX3ZtZW1tCiAJCQlyZXR1cm47CiAJfQogCi0JaWYgKCFpc192bWVtbWFw
KQotCQlwYWdldGFibGVfZHRvcihwdGRlc2MpOwotCWlmIChQYWdlUmVzZXJ2ZWQocGFnZSkpCi0J
CWZyZWVfcmVzZXJ2ZWRfcGFnZShwYWdlKTsKLQllbHNlCi0JCXBhZ2V0YWJsZV9mcmVlKHB0ZGVz
Yyk7CisJZnJlZV9wZ3RhYmxlX3BhZ2UocGFnZSk7CiAJcHVkX2NsZWFyKHB1ZCk7CiB9CiAKQEAg
LTE2NDQsNyArMTY0MSw3IEBAIHN0YXRpYyB2b2lkIF9fbWVtaW5pdCByZW1vdmVfcHVkX21hcHBp
bmcocHVkX3QgKnB1ZF9iYXNlLCB1bnNpZ25lZCBsb25nIGFkZHIsIHVuCiAJCXJlbW92ZV9wbWRf
bWFwcGluZyhwbWRfYmFzZSwgYWRkciwgbmV4dCwgaXNfdm1lbW1hcCwgYWx0bWFwKTsKIAogCQlp
ZiAocGd0YWJsZV9sNF9lbmFibGVkKQotCQkJZnJlZV9wbWRfdGFibGUocG1kX2Jhc2UsIHB1ZHAs
IGlzX3ZtZW1tYXApOworCQkJZnJlZV9wbWRfdGFibGUocG1kX2Jhc2UsIHB1ZHApOwogCX0KIH0K
IAotLSAKMi41NC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
