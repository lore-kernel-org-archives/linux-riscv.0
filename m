Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0990CE77188
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 03:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oc12eOtw2KwabVddmeBjjWYJkmoaHMEUkTxO2UnxCFc=; b=zYMTcz5Ej5bFe2
	cPnGPWQSLM5YGdAgigln2YYQlRid2EjB456MllLtdayqDMXSRv6JjuSry0ptbe88O1/Q4VuTu9iUG
	juXPdHbVqJcgAiyexpJat+OlDIb2080YDl+izx/JXJOHoUSmHRq8eJTWueHiUIPtgezmGCgqrPJpi
	u7BTKWZ2hmG4qD5ZKiZEIwmYDD0ny2MQ+XSifDhqyv9afGQH2MvcnYvDLHTtkiOeFWHLj56YUGRit
	iozNX2ph8/ikacqdaS8t2gY8ZkNqCdxFbVrQ6T2KlcAPQeU6w2hX8sb7joMHJDVRdno2siSUCq+QC
	lm3i4iKdaPSz/Pq4iIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXBJf-00000003vRx-45XG;
	Mon, 13 Jan 2025 03:40:39 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXBIM-00000003v6A-2Z43;
	Mon, 13 Jan 2025 03:39:20 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so7330552a91.0;
        Sun, 12 Jan 2025 19:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736739558; x=1737344358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FsECYO8sB292CmYpC3fxwMu7nIovFj7xiGwzKOJEc7U=;
        b=KcFwuuKjqVPMik/afWzb0jQ8dr+lcGEfJrTHoX34/i+c+4zBUQEpoPYNhUJCZXoQTg
         GJ4dnlfpR7Mxt0jM50fuH5d64QPdcjb20nz5GHSY0TMjv/G/CCMS7ItBW/S26AmeakA3
         HIeSg3gmXNSlSpw97rVEV91SQDwHXI7wDHRVf5fHEIJwiMlPldCgKc4Z5830H4jwC9NR
         UWYDI0YRirZ82u7yLtZPxcoC94ZEDRE16MqEpvXq9UE7FB+Bb9Fu2MbrZI6r74PXq2H1
         vKpPXg98n6/wmuQbNM7bipwNHc2aXhB88/vKp2xR3x3sG3oC1dqOq16OnSDbqXG1BnrE
         fNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736739558; x=1737344358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsECYO8sB292CmYpC3fxwMu7nIovFj7xiGwzKOJEc7U=;
        b=u4yIWW0cvCv4Zwa6nJh6emAvuDBUzc77MMkIsIsG4nZtXV6on/y3IvHHzr0zqP7dpu
         TgkiQvqZ1ts9eMDzJ26wqwvlLe43roH/W5jhF7eUKWwVnFd2B4cUMhVqqJButo5OegFi
         x5+gQTYwbsQFfvJo6ga9iFUfZXlkmliOuFT/6yV302eNynZiSog7m8mXEqxHxmeMTH0i
         yvfvXOdBhSnyEr58Uiz3vTeO5ySAyVd4WEZteaMR6zs5431JBj6PXhPUuLEa+F4LwTPg
         TjIPeyU/VSS9AEjLNsOr6/ynubmxpOCh3huAUr7H4vm7h9nCKXBafs8iofYirJKzD9ou
         SwPg==
X-Forwarded-Encrypted: i=1; AJvYcCUPlFToCiow+jmgh/N2K2H2hzEpG3mYEhO3U3+lRBC2edoa+bP2vsR6O2VEOWBe/1dWEFJsz5SFgDK6QY0v5hQ1@lists.infradead.org, AJvYcCVTVUDyE3mrc3wucyXVz15HwSsyy0FOhbfh9LnlJUAbRame1W3+squDlqo1NbNBz5hMJ876Ze/wbZJwTVw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3u/iDAWvx7578uRmYYu/c7pur10ethlFjPd1fmgEr0IN7BY0f
	ZLecbR4FBpBBmHJa2JBt2aSgEIdaPyc6OGdiYgTVkwrHHDlC3Sa1FauxHw==
X-Gm-Gg: ASbGncvtnp74KQ3vFNXJbVkWy4L0J0qC38vZ9p9fo46X+dkZCL8jp4K/FZD29cRJk+V
	dwp1i5dR3hpOhGOZIF1hZCiPtVPGBdzEVN+wRIYB8EQIhwhJZjQTygytLk+VRtnuNCAr4tNyvaY
	i3sQLWgP4XYwSjHrISPh+fM0Nq5k/zO78qBZYa7QyVUUoOoe1HMDcgZcv+OPR5mLr0FwI0yRQG1
	HEtEzv59uPRVlPlkPNciluan4tOzQ+pRWEfL92b+GID1HINvsvFZR981FOeZgmhZomuV15Wy1m9
	+R9RzfLl
X-Google-Smtp-Source: AGHT+IHOVUEQIwahsNe0JPIF/xCrkqjPY47Zb3CsoPvALwPFRqBWuqOSOx1Y9Cfq48Gfus/C7iH6nw==
X-Received: by 2002:a17:90b:3848:b0:2f5:63a:44f8 with SMTP id 98e67ed59e1d1-2f55443a0e3mr25854156a91.8.1736739557599;
        Sun, 12 Jan 2025 19:39:17 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:39b5:3f0b:acf3:9158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f25aabfsm44368405ad.246.2025.01.12.19.39.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jan 2025 19:39:17 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com,
	lorenzo.stoakes@oracle.com
Subject: [PATCH v2 0/4] mm: batched unmap lazyfree large folios during reclamation
Date: Mon, 13 Jan 2025 16:38:57 +1300
Message-Id: <20250113033901.68951-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_193918_654798_ABEC0B43 
X-CRM114-Status: GOOD (  11.96  )
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

RnJvbTogQmFycnkgU29uZyA8di1zb25nYmFvaHVhQG9wcG8uY29tPgoKQ29tbWl0IDczNWVjZGZh
ZjRlOCAoIm1tL3Ztc2NhbjogYXZvaWQgc3BsaXQgbGF6eWZyZWUgVEhQIGR1cmluZwpzaHJpbmtf
Zm9saW9fbGlzdCgpIikgcHJldmVudHMgdGhlIHNwbGl0dGluZyBvZiBNQURWX0ZSRUUnZCBUSFAg
aW4KbWFkdmlzZS5jLiAKSG93ZXZlciwgdGhvc2UgZm9saW9zIGFyZSBzdGlsbCBhZGRlZCB0byB0
aGUgZGVmZXJyZWRfc3BsaXQgbGlzdCBpbiAKdHJ5X3RvX3VubWFwX29uZSgpIGJlY2F1c2Ugd2Ug
YXJlIHVubWFwcGluZyBQVEVzIGFuZCByZW1vdmluZyBybWFwCmVudHJpZXMgb25lIGJ5IG9uZS4K
CkZpcnN0bHksIHRoaXMgaGFzIHJlbmRlcmVkIHRoZSBmb2xsb3dpbmcgY291bnRlciBzb21ld2hh
dCBjb25mdXNpbmcsIAovc3lzL2tlcm5lbC9tbS90cmFuc3BhcmVudF9odWdlcGFnZS9odWdlcGFn
ZXMtc2l6ZS9zdGF0cy9zcGxpdF9kZWZlcnJlZApUaGUgc3BsaXRfZGVmZXJyZWQgY291bnRlciB3
YXMgb3JpZ2luYWxseSBkZXNpZ25lZCB0byB0cmFjayBvcGVyYXRpb25zIApzdWNoIGFzIHBhcnRp
YWwgdW5tYXAgb3IgbWFkdmlzZSBvZiBsYXJnZSBmb2xpb3MuIEhvd2V2ZXIsIGluIHByYWN0aWNl
LCAKbW9zdCBzcGxpdF9kZWZlcnJlZCBjYXNlcyBhcmlzZSBmcm9tIG1lbW9yeSByZWNsYW1hdGlv
biBvZiBhbGlnbmVkIApsYXp5ZnJlZSBtVEhQcyBhcyBvYnNlcnZlZCBieSBUYW5ncXVhbi4gVGhp
cyBkaXNjcmVwYW5jeSBoYXMgbWFkZQp0aGUgc3BsaXRfZGVmZXJyZWQgY291bnRlciBoaWdobHkg
bWlzbGVhZGluZy4KClNlY29uZGx5LCB0aGlzIGFwcHJvYWNoIGlzIHNsb3cgYmVjYXVzZSBpdCBy
ZXF1aXJlcyBpdGVyYXRpbmcgdGhyb3VnaCAKZWFjaCBQVEUgYW5kIHJlbW92aW5nIHRoZSBybWFw
IG9uZSBieSBvbmUgZm9yIGEgbGFyZ2UgZm9saW8uIEluIGZhY3QsIAphbGwgUFRFcyBvZiBhIHB0
ZS1tYXBwZWQgbGFyZ2UgZm9saW8gc2hvdWxkIGJlIHVubWFwcGVkIGF0IG9uY2UsIGFuZAp0aGUg
ZW50aXJlIGZvbGlvIHNob3VsZCBiZSByZW1vdmVkIGZyb20gdGhlIHJtYXAgYXMgYSB3aG9sZS4K
ClRoaXJkbHksIGl0IGFsc28gaW5jcmVhc2VzIHRoZSByaXNrIG9mIGEgcmFjZSBjb25kaXRpb24g
d2hlcmUgbGF6eWZyZWUKZm9saW9zIGFyZSBpbmNvcnJlY3RseSBzZXQgYmFjayB0byBzd2FwYmFj
a2VkLCBhcyBhIHNwZWN1bGF0aXZlIGZvbGlvX2dldAptYXkgb2NjdXIgaW4gdGhlIHNocmlua2Vy
J3MgY2FsbGJhY2suCmRlZmVycmVkX3NwbGl0X3NjYW4oKSBtaWdodCBjYWxsIGZvbGlvX3RyeV9n
ZXQoZm9saW8pIHNpbmNlIHdlIGhhdmUKYWRkZWQgdGhlIGZvbGlvIHRvIHNwbGl0X2RlZmVycmVk
IGxpc3Qgd2hpbGUgcmVtb3Zpbmcgcm1hcCBmb3IgdGhlCjFzdCBzdWJwYWdlLCBhbmQgd2hpbGUg
d2UgYXJlIHNjYW5uaW5nIHRoZSAybmQgdG8gbnJfcGFnZXMgUFRFcyBvZgp0aGlzIGZvbGlvIGlu
IHRyeV90b191bm1hcF9vbmUoKSwgdGhlIGVudGlyZSBtVEhQIGNvdWxkIGJlCnRyYW5zaXRpb25l
ZCBiYWNrIHRvIHN3YXAtYmFja2VkIGJlY2F1c2UgdGhlIHJlZmVyZW5jZSBjb3VudCBpcwppbmNy
ZW1lbnRlZCwgd2hpY2ggY2FuIG1ha2UgInJlZl9jb3VudCA9PSAxICsgbWFwX2NvdW50IiB3aXRo
aW4KdHJ5X3RvX3VubWFwX29uZSgpIGZhbHNlLgoKICAgLyoKICAgICogVGhlIG9ubHkgcGFnZSBy
ZWZzIG11c3QgYmUgb25lIGZyb20gaXNvbGF0aW9uCiAgICAqIHBsdXMgdGhlIHJtYXAocykgKGRy
b3BwZWQgYnkgZGlzY2FyZDopLgogICAgKi8KICAgaWYgKHJlZl9jb3VudCA9PSAxICsgbWFwX2Nv
dW50ICYmCiAgICAgICAoIWZvbGlvX3Rlc3RfZGlydHkoZm9saW8pIHx8CiAgICAgICAgLi4uCiAg
ICAgICAgKHZtYS0+dm1fZmxhZ3MgJiBWTV9EUk9QUEFCTEUpKSkgewogICAgICAgICAgIGRlY19t
bV9jb3VudGVyKG1tLCBNTV9BTk9OUEFHRVMpOwogICAgICAgICAgIGdvdG8gZGlzY2FyZDsKICAg
fQoKVGhpcyBwYXRjaHNldCByZXNvbHZlcyB0aGUgaXNzdWUgYnkgbWFya2luZyBvbmx5IGdlbnVp
bmVseSBkaXJ0eSBmb2xpb3MgCmFzIHN3YXAtYmFja2VkLCBhcyBzdWdnZXN0ZWQgYnkgRGF2aWQs
IGFuZCB0cmFuc2l0aW9uaW5nIHRvIGJhdGNoZWQgCnVubWFwcGluZyBvZiBlbnRpcmUgZm9saW9z
IGluIHRyeV90b191bm1hcF9vbmUoKS4gQ29uc2VxdWVudGx5LCB0aGUgCmRlZmVycmVkX3NwbGl0
IGNvdW50IGRyb3BzIHRvIHplcm8sIGFuZCBtZW1vcnkgcmVjbGFtYXRpb24gcGVyZm9ybWFuY2Ug
CmltcHJvdmVzIHNpZ25pZmljYW50bHkg4oCUIHJlY2xhaW1pbmcgNjRLaUIgbGF6eWZyZWUgbGFy
Z2UgZm9saW9zIGlzIG5vdyAKMi41eCBmYXN0ZXIoVGhlIHNwZWNpZmljIGRhdGEgaXMgZW1iZWRk
ZWQgaW4gdGhlIGNoYW5nZWxvZyBvZiBwYXRjaAozLzQpLgoKQnkgdGhlIHdheSwgd2hpbGUgdGhl
IHBhdGNoc2V0IGlzIHByaW1hcmlseSBhaW1lZCBhdCBQVEUtbWFwcGVkIGxhcmdlIApmb2xpb3Ms
IEJhb2xpbiBhbmQgTGFuY2UgYWxzbyBmb3VuZCB0aGF0IHRyeV90b191bm1hcF9vbmUoKSBoYW5k
bGVzIApsYXp5ZnJlZSByZWRpcnRpZWQgUE1ELW1hcHBlZCBsYXJnZSBmb2xpb3MgaW5lZmZpY2ll
bnRseSDigJQgaXQgc3BsaXRzIAp0aGUgUE1EIGludG8gUFRFcyBhbmQgaXRlcmF0ZXMgb3ZlciB0
aGVtLiBUaGlzIHBhdGNoc2V0IHJlbW92ZXMgdGhlIAp1bm5lY2Vzc2FyeSBzcGxpdHRpbmcsIGVu
YWJsaW5nIHVzIHRvIHNraXAgcmVkaXJ0aWVkIFBNRC1tYXBwZWQgbGFyZ2UgCmZvbGlvcyAzLjVY
IGZhc3RlciBkdXJpbmcgbWVtb3J5IHJlY2xhbWF0aW9uLiAoVGhlIHNwZWNpZmljIGRhdGEgY2Fu
IApiZSBmb3VuZCBpbiB0aGUgY2hhbmdlbG9nIG9mIHBhdGNoIDQvNCkuCgotdjI6CiAqIGRlc2Ny
aWJsZSBiYWNrZ3JvdW5kcywgcHJvYmxlbXMgbW9yZSBjbGVhcmx5IGluIGNvdmVyLWxldHRlciBw
ZXIKICAgTG9yZW56byBTdG9ha2VzOwogKiBhbHNvIGhhbmRsZSByZWRpcnRpZWQgcG1kLW1hcHBl
ZCBsYXJnZSBmb2xpb3MgcGVyIEJhb2xpbiBhbmQgTGFuY2U7CiAqIGhhbmRsZSBzb21lIGNvcm5l
ciBjYXNlcyBzdWNoIGFzIEhXUE9TSU9OLCBwdGVfdW51c2VkOwogKiByaXNjdiBhbmQgeDg2IGJ1
aWxkIGlzc3Vlcy4KCi12MToKIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tLzIwMjUw
MTA2MDMxNzExLjgyODU1LTEtMjFjbmJhb0BnbWFpbC5jb20vCgpCYXJyeSBTb25nICg0KToKICBt
bTogU2V0IGZvbGlvIHN3YXBiYWNrZWQgaWZmIGZvbGlvcyBhcmUgZGlydHkgaW4gdHJ5X3RvX3Vu
bWFwX29uZQogIG1tOiBTdXBwb3J0IHRsYmJhdGNoIGZsdXNoIGZvciBhIHJhbmdlIG9mIFBURXMK
ICBtbTogU3VwcG9ydCBiYXRjaGVkIHVubWFwIGZvciBsYXp5ZnJlZSBsYXJnZSBmb2xpb3MgZHVy
aW5nIHJlY2xhbWF0aW9uCiAgbW06IEF2b2lkIHNwbGl0dGluZyBwbWQgZm9yIGxhenlmcmVlIHBt
ZC1tYXBwZWQgVEhQIGluIHRyeV90b191bm1hcAoKIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdGxi
Zmx1c2guaCB8ICAyNiArKystLS0tCiBhcmNoL2FybTY0L21tL2NvbnRwdGUuYyAgICAgICAgICAg
fCAgIDIgKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8ICAgMyArLQogYXJj
aC9yaXNjdi9tbS90bGJmbHVzaC5jICAgICAgICAgIHwgICAzICstCiBhcmNoL3g4Ni9pbmNsdWRl
L2FzbS90bGJmbHVzaC5oICAgfCAgIDMgKy0KIG1tL2h1Z2VfbWVtb3J5LmMgICAgICAgICAgICAg
ICAgICB8ICAxNyArKysrLQogbW0vcm1hcC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTEy
ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogNyBmaWxlcyBjaGFuZ2VkLCAxMTEgaW5z
ZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0pCgotLSAKMi4zOS4zIChBcHBsZSBHaXQtMTQ2KQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
