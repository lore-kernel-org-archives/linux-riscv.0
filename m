Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60812606A31B
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UjK2sBJQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=D5nJgQSz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2Mlp15NxUWiT9w8rea3YyEf6RK2IVTMvcRtm21PYbqI=; b=UjK2sBJQPcFQ2dF0SQVa2/ccOF
	TKVQrPCUtMWGOUY9D/O0wkG34vw/Xsk3S215fMPHQMQw3EexvQ08VBq0WWMVnWMbHfoxZymwXskDM
	u1TbFJgYbmanONV1MJOJKYxO7ZcK+aM7XhNFf3OmoyNMHWpH1o44qyx1y8VxhmTIPi2YKUh7i2a35
	ECIZx/YkHXafjNI49jo6LDOQ8cDcewUarMLl2jn0+YoEZUIAvPJAXbYG+aAaOWG5nwAOLpuEkY0UR
	j8Tj4pSfLjv8A5zSd6YF4wdtMcbrXtsgabFZA/ZuwEcD3n3fsi7t+Z372G5VcgXcBjkMAtB7dyvZg
	u/VSfmGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rl-0000000Fa4G-3lfG;
	Fri, 23 Oct 2026 06:35:01 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rg-0000000FZy5-0MwD
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 06:34:57 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc758830601so349651a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 23:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792737295; x=1793342095; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6F9SSG+/FeDA6bw52vBp7L6cM7wcJHblW41owDWPkN0=;
        b=D5nJgQSzmRyuvu9TXb11KNEcjcJs2ofzYzcedCm/0tiV7HsgakO3KAbL3h05VpOxO9
         Qy5VQj6jr0NqBbLOWNJo6a6YEJx2vjGLynp+724tNyWdnacutRYKY6isV7Ud5dMRdo9U
         ebgI4WsJKSW3CcN4mjfq8nycmz80fxqqAt0eFzJjeaaQ/TZXtW/CnpKGAvuXr0pf1E2P
         Xh6ZSdsGLE6NTJ3G438Ae7G6aOvfgZHn1xkfOmma4n87tOY/pnoL4ff55HBBFHd+mvJk
         TrxYcjoj4JFo7ATuWeeJNtlNibqRad5eBJ6HWHVuld57YlCIHv5yYjoELeuIl7+C+Ocm
         sQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737295; x=1793342095;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6F9SSG+/FeDA6bw52vBp7L6cM7wcJHblW41owDWPkN0=;
        b=XkDOmpgHcYWj38BaTHntcPkNJk36X8IqjlFqVj3lLK5vqVvigAc43wb+TSZYIdUsI7
         UTiovY6de34D6fe1F9kqQmFkDysp2WZl/RhXAIPi1xiVvRF1tKECvbuVYjBXA5bzB9bu
         LYhUGqBmPS00UHdQwsKZ9sLf9sCLuWoTgFh8SR9/qJLE+Ztuukya4YZ+tL+f66+JEGMD
         BfQ/hSDgMxFq6TqpNxevdkpv6zbg5TklygNM9IoSeBnTnejfJYFQYYfYptnGfZ/iL9ST
         pHl5yZg9P4TouMhPSgv90gRrOnVWfUG6aHJ/DEE0Qwkd1Q8AzYG4P0BEvL4fhBIRcpAe
         a25Q==
X-Forwarded-Encrypted: i=1; AKwUvBya/SnQOxOsmjnwNoJSL6Daf+KpkJxdGEVjBljXF+DgHMe+Kbg5V0pKU6VlAJaNabdkccmT7o5vBdOF8g==@lists.infradead.org
X-Gm-Message-State: AFq9FYKdYDYopFLkr2ufo4kY5E9Qf1grVC0l11ekCK4Cmefiy528vwld
	7GcBsNzLPN1wn3z374p6CuT3pGx0kq13ygO9AEdJtGprFBto3GxJ6ud1KTjJggiX5Rs=
X-Gm-Gg: AYBFou3FYY1JPjN9+G0PxoLhJK0e/jGStX03YJqmb4TBi9SuIU+FizZ9KsB3tbKBT8i
	D90NFxZiuCcFPzpwyjDdztY/OjHcbKfcwX6+oVm2BOKNVyope8Bq/VYXdUZo6B/LpGYVDNsuNnJ
	5FFyDxJcACTVijB5HglSPjTYManWTSKkLEKvMnHZ/LvKcugDnyK6kMrQEj+IKx27k+iCDZPiHoC
	s3eBl6VWGALRJAY1RbcG3aRKi7oCnnC6iKhrnqKFmcm2mrZlCnljpHoWajYx7v3cjufmDU+8VUL
	ub6vgSXPQqipGkBcufKjtzVCdUZ4QB4iJBZNhC36o79LlXJRAk5AGPv/ERdwt8YA+iBC21MLYZj
	zzL4V3MiwO7ihLY7izGn8OoEBzTNLDmiXCXIhEYUzPiwJaZlSyC6tNVSCmmolDgoRd4OtEfQg9o
	7pQjwa6/Mqq9x05SKiqDeyaifY2JqXUqPnB9loXTW7Gp9MY9Gns/8TOocqwSwwNuwW8UwWmZS+x
	zGxZ/ATeR1gv9Ks8hjJaeAGoPbNrJJWGKKY/HBegPmJm0/hFajb3P38Pa6W/sKHxBNQ7IupdmHg
	9g==
X-Received: by 2002:a17:90b:5487:b0:3ac:d79f:8229 with SMTP id 98e67ed59e1d1-3adce1737eamr1157717a91.61.1792737295119;
        Thu, 22 Oct 2026 23:34:55 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add246f308sm575202a91.0.2026.10.22.23.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:34:54 -0700 (PDT)
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
Subject: [PATCH v3 3/4] riscv/mm: fix missing destructor for hotplug PUD tables
Date: Fri, 23 Oct 2026 14:34:27 +0800
Message-ID: <20261023063428.3658761-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023063428.3658761-1-songmuchun@bytedance.com>
References: <20261023063428.3658761-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233456_135485_70A5DBF6 
X-CRM114-Status: GOOD (  10.50  )
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

Q29tbWl0IDg0NzJjYzQ1MDNlYiAoInJpc2N2OiBtbTogY2FsbCBQVUQvUDREIGN0b3IgaW4gc3Bl
Y2lhbCBrZXJuZWwKcGd0YWJsZSBhbGxvYyIpIG1hZGUgYWxsb2NfcHVkX2xhdGUoKSBydW4gdGhl
IFBVRCBwYWdlLXRhYmxlIGNvbnN0cnVjdG9yLgpIb3dldmVyLCBmcmVlX3B1ZF90YWJsZSgpIHN0
aWxsIGZyZWVzIG5vbi1yZXNlcnZlZCBQVUQgdGFibGVzIGRpcmVjdGx5CndpdGhvdXQgZGVjcmVt
ZW50aW5nIE5SX1BBR0VUQUJMRS4KCkZyZWUgUFVEIHRhYmxlcyB0aHJvdWdoIHRoZSBjb21tb24g
ZnJlZV9wZ3RhYmxlX3BhZ2UoKSBoZWxwZXIgc28gdGhhdApjb25zdHJ1Y3Rvci1iYWNrZWQgdGFi
bGVzIHJ1biB0aGUgbWF0Y2hpbmcgZGVzdHJ1Y3RvciBiZWZvcmUgYmVpbmcKZnJlZWQuCgpGaXhl
czogODQ3MmNjNDUwM2ViICgicmlzY3Y6IG1tOiBjYWxsIFBVRC9QNEQgY3RvciBpbiBzcGVjaWFs
IGtlcm5lbCBwZ3RhYmxlIGFsbG9jIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKQXNzaXN0
ZWQtYnk6IExMTQpTaWduZWQtb2ZmLWJ5OiBNdWNodW4gU29uZyA8c29uZ211Y2h1bkBieXRlZGFu
Y2UuY29tPgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KUmV2
aWV3ZWQtYnk6IEtldmluIEJyb2Rza3kgPGtldmluLmJyb2Rza3lAYXJtLmNvbT4KQWNrZWQtYnk6
IERhdmlkIEhpbGRlbmJyYW5kIChBcm0pIDxkYXZpZEBrZXJuZWwub3JnPgotLS0KdjM6Ci0gQ29s
bGVjdCBSZXZpZXdlZC1ieSBmcm9tIEJqw7ZybiBUw7ZwZWwgYW5kIEtldmluIEJyb2Rza3kKCnYy
OgotIENvbGxlY3QgQWNrZWQtYnkgZnJvbSBEYXZpZCBIaWxkZW5icmFuZAotLS0KIGFyY2gvcmlz
Y3YvbW0vaW5pdC5jIHwgNSArLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9y
aXNjdi9tbS9pbml0LmMKaW5kZXggZTExMWQyNWUxOGUxLi5mMzVmZTRjZGE4OWMgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCisrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCkBAIC0x
NTM3LDEwICsxNTM3LDcgQEAgc3RhdGljIHZvaWQgX19tZW1pbml0IGZyZWVfcHVkX3RhYmxlKHB1
ZF90ICpwdWRfc3RhcnQsIHA0ZF90ICpwNGQpCiAJCQlyZXR1cm47CiAJfQogCi0JaWYgKFBhZ2VS
ZXNlcnZlZChwYWdlKSkKLQkJZnJlZV9yZXNlcnZlZF9wYWdlKHBhZ2UpOwotCWVsc2UKLQkJX19m
cmVlX3BhZ2VzKHBhZ2UsIDApOworCWZyZWVfcGd0YWJsZV9wYWdlKHBhZ2UpOwogCXA0ZF9jbGVh
cihwNGQpOwogfQogCi0tIAoyLjU0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
