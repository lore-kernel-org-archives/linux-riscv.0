Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7768C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 18:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=X1x39UmmBePoMush02zzCcqH0erw5mIEnzeDjV8rNFA=; b=zMuH+y+wVM2kbD27wx8uhNIasZ
	t3lW7sZCPCRXSm9HKiLf4KrvirS0u8WttwhsdmtZ9Bnz2kXnoPWuU/CGZHu/N7PdnU0eH+GrEQTS8
	dDLE/ferhLbKcs7iPwIQLiSkqLnPEa7jwdqhkKPhC8ECPhJ8fRIFwsZcZT1lUH3PZzxZboe2QWfDf
	JmFNJLHDmMAXWGImj3yW+4ncDI0qE6RdfowKKMsB8usWlYWbbURUx7z5bpwmcmkFt5HmvcA4hkfTc
	+JkB0faT55Yzw68r5r0XaSzFfVm4SkwPS3ayJmk5/40EIXLOWTDjGjiO3bkPBxnop57YUAUzhRfnn
	vqfaWKKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0r4-0000000Fwxw-3cIZ;
	Fri, 14 Feb 2025 18:56:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj09T-0000000FpVM-1cB4
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 18:11:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-220f4dd756eso16582085ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 10:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1739556658; x=1740161458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIgIUGm9z1JRdQVV8e2GcmT1rtEmaJWpLSj4Lm2nr2k=;
        b=dUVKtO67imMLF3lo4hgowG2ewWR/8IiY1QANn32oiKw1RTo9MBX+v2hlVmzNSZO6/7
         jpFP7KVMq5orAkn4KjF1eZIOPlcxoIc4yeA/ABWWpTVrqgmmA1KJB2/DVPdjIRrfOM0B
         LJFidN4BvrGyq3eWFY0PjGX3cDf1eYFAFttvZj5KFXoUimYdddUlbvzLUDEcRchrMhJf
         S5ZCSVZDWtEax5xHtInblm5EPmBkxLvljJJ4g8TA3cXN96RbQq2CJIYWG5zu4L5L0sRs
         fglzjXc8Atx/gkcEFYesTK7INh3qBOaqFXmWbFVL9CbZGo1TYN1OjjxkdfPDe4dQ3mtO
         38pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739556658; x=1740161458;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIgIUGm9z1JRdQVV8e2GcmT1rtEmaJWpLSj4Lm2nr2k=;
        b=XDLa9iMH83wqaUZzV3Va/nIRX0wt2rl06NTFPGKn93N+peHEoSV11uaGlzcsxMfgZN
         xQDKttXe5CdhQXkZoj34CnriRaQRnUcA6DyQd8emphNOAdxHaDVKXUvzF8kGKmsMZNyf
         Xh9iBgM1s65MbJaKd5yFKAsp3SWOTTGcj7GwGvWip901f1nk9ObsIVhO1H6+BGKDVsa3
         vOzEl1xTQQw0cFZ1vb4WgJa+na7EvvshW3IWF5cwNa1ht5R/8pXCNlTm5W1WBBkkF4uU
         FmtzbKePXcy2meWV5rcaI6o75hsOxiYuBN3rrOzUkjUd2X8V6TOfOwOOTVQLlK/XVPG7
         CUUw==
X-Gm-Message-State: AOJu0YxsgtveLGwKY/spcoevI+r3l6PKZhxbkI8OIHMwzfTE6kSNJZzl
	B4NeKH/ZTxppS5jH1TWlRujw3Vy7iiP/46DagpqXZ8/smWWAag/N396yxV427a2XV6lf4v/e2/d
	+
X-Gm-Gg: ASbGncv+TRWEI5lUkAgQKtCyvHrns5H1RKFLZPop/kCcwlbg868jQgT4ArHDMerVyrA
	ynsTv9bF4oqRvDHY0W3rkkXnevx/e8eJ9ct3qqNdL+xSlpsYeRAL6VxWhGyT9zbDnWEG16Y7uRD
	urOUIFjb9KUb0szI8/H2LAw1l3DBB1Bi9yF7e9yqh7SgLW+yUibdpXPyU7S1nOs04jJ2EGcGC3J
	GnFVL3Z2DU6p7ZoLk1vJyV0MXXQ8kyr1mQVi9jq52/2tV/GEJMRTzn1hCkJiE7Mtgu/QXMQfMZg
	/YQ6G+DC
X-Google-Smtp-Source: AGHT+IE8UOnjb7xW/jjW4Mp65q+t2VRrRKHx249GFwuMEie7raykZaSX75ToehvZqDEGxjgZ71utMw==
X-Received: by 2002:a17:902:cccc:b0:220:e04e:7213 with SMTP id d9443c01a7336-22104042474mr3568265ad.25.1739556656563;
        Fri, 14 Feb 2025 10:10:56 -0800 (PST)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536699asm31937715ad.90.2025.02.14.10.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 10:10:55 -0800 (PST)
Date: Fri, 14 Feb 2025 10:10:55 -0800 (PST)
X-Google-Original-Date: Fri, 14 Feb 2025 10:10:54 PST (-0800)
Subject: Re: Fixes for 6.14-rc3
In-Reply-To: <e0c61484-2849-42c1-8e01-f85f9329b859@ghiti.fr>
CC: linux-riscv@lists.infradead.org, Bjorn Topel <bjorn@rivosinc.com>,
  yongxuan.wang@sifive.com, shorne@gmail.com, cp0613@linux.alibaba.com, schwab@suse.de,
  cleger@rivosinc.com, robh@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-4f1e8c00-77c6-4333-80e9-1664d4eb9e03@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_101059_432759_4F2A2F0D 
X-CRM114-Status: GOOD (  18.37  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxMiBGZWIgMjAyNSAwMjoyNToyNSBQU1QgKC0wODAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBIaSBQYWxtZXIsCj4KPiBQbGVhc2UgZmluZCBiZWxvdyB0aGUgbGlzdCBvZiBmaXhl
cyB0aGF0IEkgaGF2ZSBjb2xsZWN0ZWQgZm9yIDYuMTQsIG5vIAo+IHJlZ3Jlc3Npb25zIGhhdmUg
YmVlbiBkZXRlY3RlZCBzaW5jZSB2Ni4xNC1yYzEgCj4gKGh0dHBzOi8vZ2l0aHViLmNvbS9saW51
eC1yaXNjdi9saW51eC9wdWxsLzMwKToKPgo+ICJyaXNjdjogc2lnbmFsOiBmaXggdGhlIHNpemUg
b2Ygc2lnbmFsIGZyYW1lIiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8y
MDI0MTIyMDA4MzkyNi4xOTQ1My0xLXlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbS8KPiAicnNlcS9z
ZWxmdGVzdHM6IEZpeCByaXNjdiByc2VxX29mZnNldF9kZXJlZl9hZGR2IGlubGluZSBhc20iIAo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwMTE0MTcwNzIxLjM2MTMy
ODAtMS1zaG9ybmVAZ21haWwuY29tLwo+ICJEb2N1bWVudGF0aW9uOiByaXNjdjogUmVtb3ZlIEtQ
Uk9CRVNfT05fRlRSQUNFIiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwMTA4
MDIwMzQyLjQxNzItMS1jcDA2MTNAbGludXguYWxpYmFiYS5jb20vVC8gCgpMb29rcyBsaWtlIHRo
ZSBkb2NzIHBlb3BsZSBnb3QgdGhpcyBvbmUsIGl0IGNvbmZsaWN0ZWQgb24gbmV4dCBzbyBJIApk
cm9wcGVkIGl0LiAgSSdtIGdvaW5nIHRvIGxldCBldmVyeXRoaW5nIGdvIHRocm91Z2ggbGludXgt
bmV4dCBhZ2FpbiwgCkknbGwgdHJ5IGFuZCBzZW5kIGEgUFIgdG9tb3Jyb3cgbW9ybmluZyBpZiBJ
IGNhbiBnZXQgYXdheSBmcm9tIHRoZSBiYWJ5LgoKPiAicmlzY3YvZnV0ZXg6IHNpZ24gZXh0ZW5k
IGNvbXBhcmUgdmFsdWUgaW4gYXRvbWljIGNtcHhjaGciIAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzkxNjE0N2RiLTk0YTUtNDZkZi04YTIyLTFkMzAxMDU5MTU0Y0BnaGl0
aS5mci9ULyNtMTU1YTllYmVkMjg2YmVhMzQ2NjlhNTEzYmRlY2Q4ZmRiZGRhZWFjNAo+ICJyaXNj
di9hdG9taWM6IERvIHByb3BlciBzaWduIGV4dGVuc2lvbiBhbHNvIGZvciB1bnNpZ25lZCBpbiAK
PiBhcmNoX2NtcHhjaGfigIsiIAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzkwYzk1MDQ2LTRjZGQtNDgzMC1iZTM5LWQ3MzRkZjEzN2ZkM0BnaGl0aS5mci9ULyNtZTViNTI1
ZjM4N2ZiMzk5NTU1YjBiY2ZmM2NjYjQwMWI1ODFmNGE0Ngo+ICIgcmlzY3Y6IGNwdWZlYXR1cmU6
IHVzZSBiaXRtYXBfZXF1YWwoKSBpbnN0ZWFkIG9mIG1lbWNtcCgpIiAKPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDIxMDE1NTYxNS4xNTQ1NzM4LTEtY2xlZ2VyQHJp
dm9zaW5jLmNvbS8KPiAicmlzY3Y6IGNhY2hlaW5mbzogVXNlIG9mX3Byb3BlcnR5X3ByZXNlbnQo
KSBmb3Igbm9uLWJvb2xlYW4gcHJvcGVydGllcyIgCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvMjAyNDExMDQxOTAzMTQuMjcwMDk1LTEtcm9iaEBrZXJuZWwub3JnLwo+Cj4g
Tm90ZSB0aGF0IHRoZSBsYXN0IG9uZSBkb2VzIG5vdCBwcm9wZXJseSBhcHBseSwgYSBuZXcgdmVy
c2lvbiBmcm9tIEVtaWwgCj4gZG9lcywgYnV0IFJvYiBzZW50IHRoaXMgcGF0Y2ggbGFzdCBOb3Zl
bWJlciBmaXJzdC4KCkknZCBwaWNrZWQgdXAgUm9iJ3MgdGhlIG1vcm5pbmcgYmVmb3JlLCBJIGp1
c3QgZml4ZWQgdXAgdGhlIGNoYW5nZXMuICAKU29tZW5vZSAobWF5YmUgRW1pbD8pIHBvaW50ZWQg
aXQgb3V0IGluIHRoZSBwYXRjaHdvcmsgbWVldGluZy4KCj4gVGhhbmtzLAo+Cj4gQWxleAo+Cj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
