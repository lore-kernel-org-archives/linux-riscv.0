Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF33C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 03:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=62KVPg6nhOXYs8YPMQytyf5pUgjkJCatYX7gYiSzHYA=; b=vLKvIlyEF/JoRE
	jWR7MOgmjS3FWhSawUx1bR959vG1kRg1LyrP5PuuoCe5b0d3UBjzxGzaYKKrX5XFDfviIt0i4twek
	cjPJ+m5rbVmPe7XUQFGWv+5BN0mE1mwWs0K1jzKZXLsZYicL9QzUp8h6cZEnc7gFUUvVYNv6KE0hl
	NkQzADB0t7qVRMlwdFRoIlX/+Qjv5sdXBeWmWYViKrjO5P2YOP20xeEfpgGVRjTcxTChDHkbhUal8
	ILqI0zuWb3tyS+AIjcAQuYrWHJu359BbPYTuEshdk+1lzOgOIsefs6PC/jnt4XCDndrRnBs8ul2NP
	Dax/4inBb/OQJNNFgeMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuFu-0000000AWx5-2jMc;
	Wed, 15 Jan 2025 03:39:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuEd-0000000AWZr-225A;
	Wed, 15 Jan 2025 03:38:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-216634dd574so73128865ad.2;
        Tue, 14 Jan 2025 19:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736912307; x=1737517107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WrzVQvi/jgw/I6AEsUGXcvK1mN9COshrp0/mcUa7yDQ=;
        b=RIAnc2ZLqNub0jUNj0a4EDsLQ3D85RdtsYsHlLo0PQfnnlzMvkxEBHcuYKoctnn2hp
         TQP02bx4xBP5x1s9xByZpYw4s/G1uwBxWY957K5GKibDFtI97BZJSqvdhWs/aW2b4qBe
         TsGWb5hF04GCQ8S5um2gEop2reP27oh2KLu/ic804buiN3Edl2BPlLFiFQroaw+3vazq
         ZHsCFxG3hHTiUwpCpmvcNZX6w6y8HXunIHwqFObtVjXWf9OMh461sO3NQLu3pyyTHW5U
         AiNrwXF/ixuSRzCHkYnJtYD/0r9fHL7bVL4sRm7NiN+6CIA1ZaSWhKYkDIjvBOYN7gVw
         TPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736912307; x=1737517107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrzVQvi/jgw/I6AEsUGXcvK1mN9COshrp0/mcUa7yDQ=;
        b=h2nny1hUIYoRTp6p75b6ZkDBZPSFDEnj+REO76BQaLZXPuMPYZoY//TpeglAt6hSIY
         yfZX/HycFy8UKkaN5fdPAEoXYGryiibMEsQyizhF84aJPkozznq5nKEPGe5molU2SiIy
         QyjLNdi8/AVKS1QxNj50kUEr0NEfHSph2hM/o86nGX0Xy7JthqTPIHjCNdl5GLerEf49
         8LJFzBIijbl1Sa0HiDAoUJSaTSXmI6PiMFCCy/BijK9Sem4N3GXWNxNXvPCzDbLcrHqy
         +aKCz/OdPa5stz/cZOD80T7TtoV8Lq1vO6mSUp+p1AZubpvcq14bA/AgAZ0u4jCdmgJU
         vh+g==
X-Forwarded-Encrypted: i=1; AJvYcCVf4pi5OnwyIOz55Hxrn7sr+Zmm7RDnwMZwk0Q1mX3t2e2Q0gD5b2hy+exr0zpcCKU9rm2wUEXi2lRud8DbwNVu@lists.infradead.org, AJvYcCW/IDKThv9mqp+3GL9sljSH6KL1zfZQ+FN1xVNb1dnKF3dBddk4T9TiPE3NY6Bv1Z5wzvP7BPlejx7qb10=@lists.infradead.org
X-Gm-Message-State: AOJu0YxK68Qbc7H/pp92DPe8P1C/YBZ4Jmradj4LvSmQUQkjepo8FlPv
	PDxDjOLr3eYQUsY46pHz5cd2didm3+UsXW1t5rhYsCnNcRLvapjk
X-Gm-Gg: ASbGncuitbc3rDZzw6J6PsU8aVmlAJYArAdVxX6f8NP69vBr5xap/ym/pQVrxCgKMFV
	xv85AQaHEuNYAkWhc/ej7FPNqZcolcb1nBmBI2KbqvFcpg4yWV72bj6IBykfeLUi4NlXdCU0/2V
	Lu1f9skSF1TIXbXWWcyZKJKqf5Ed71ahtPCeogdS7uMo3Hu48nPBpEytM/PEkVzBJd+jbC/gSLs
	IHuo8lbroMefvQJAX4e/E/vN4ktD6Wc6/8ou5IqxLeEoMed9LkGXXGU+EmVbS3jIpMtxhrYpfsw
	79K6gI0V
X-Google-Smtp-Source: AGHT+IG7nVHqDcezd3xmQAp4vBQiBwgib6FzP4BDYjRCpSnpFC+KQyJk4fxnyZSyDrckcOuiOGpO6Q==
X-Received: by 2002:a17:902:f705:b0:205:4721:19c with SMTP id d9443c01a7336-21a83fe48fdmr395479085ad.37.1736912306544;
        Tue, 14 Jan 2025 19:38:26 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:e5d5:b870:ca9b:78f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10dffbsm73368195ad.49.2025.01.14.19.38.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 19:38:25 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: 21cnbao@gmail.com,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: [PATCH v3 0/4] mm: batched unmap lazyfree large folios during reclamation
Date: Wed, 15 Jan 2025 16:38:04 +1300
Message-Id: <20250115033808.40641-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_193827_520954_D2235693 
X-CRM114-Status: GOOD (  12.27  )
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
IApiZSBmb3VuZCBpbiB0aGUgY2hhbmdlbG9nIG9mIHBhdGNoIDQvNCkuCgotdjM6CiAqIGNvbGxl
Y3QgcmV2aWV3ZWQtYnkgYW5kIGFja2VkLWJ5IG9mIEJhb2xpbiwgRGF2aWQsIExhbmNlIGFuZCBX
aWxsLgogICB0aGFua3MhCiAqIHJlZmluZSBwbWQtbWFwcGVkIFRIUCBsYXp5ZnJlZSBjb2RlIHBl
ciBCYW9saW4gYW5kIExhbmNlLgogKiByZWZpbmUgdGxiYmF0Y2ggZGVmZXJyZWQgZmx1c2hpbmcg
cmFuZ2Ugc3VwcG9ydCBjb2RlIHBlciBEYXZpZC4KCi12MjoKIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LW1tLzIwMjUwMTEzMDMzOTAxLjY4OTUxLTEtMjFjbmJhb0BnbWFpbC5jb20vCgog
KiBkZXNjcmlibGUgYmFja2dyb3VuZHMsIHByb2JsZW1zIG1vcmUgY2xlYXJseSBpbiBjb3Zlci1s
ZXR0ZXIgcGVyCiAgIExvcmVuem8gU3RvYWtlczsKICogYWxzbyBoYW5kbGUgcmVkaXJ0aWVkIHBt
ZC1tYXBwZWQgbGFyZ2UgZm9saW9zIHBlciBCYW9saW4gYW5kIExhbmNlOwogKiBoYW5kbGUgc29t
ZSBjb3JuZXIgY2FzZXMgc3VjaCBhcyBIV1BPU0lPTiwgcHRlX3VudXNlZDsKICogcmlzY3YgYW5k
IHg4NiBidWlsZCBpc3N1ZXMuCgotdjE6CiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
bS8yMDI1MDEwNjAzMTcxMS44Mjg1NS0xLTIxY25iYW9AZ21haWwuY29tLwoKQmFycnkgU29uZyAo
NCk6CiAgbW06IFNldCBmb2xpbyBzd2FwYmFja2VkIGlmZiBmb2xpb3MgYXJlIGRpcnR5IGluIHRy
eV90b191bm1hcF9vbmUKICBtbTogU3VwcG9ydCB0bGJiYXRjaCBmbHVzaCBmb3IgYSByYW5nZSBv
ZiBQVEVzCiAgbW06IFN1cHBvcnQgYmF0Y2hlZCB1bm1hcCBmb3IgbGF6eWZyZWUgbGFyZ2UgZm9s
aW9zIGR1cmluZyByZWNsYW1hdGlvbgogIG1tOiBBdm9pZCBzcGxpdHRpbmcgcG1kIGZvciBsYXp5
ZnJlZSBwbWQtbWFwcGVkIFRIUCBpbiB0cnlfdG9fdW5tYXAKCiBhcmNoL2FybTY0L2luY2x1ZGUv
YXNtL3RsYmZsdXNoLmggfCAgMjUgKysrLS0tLQogYXJjaC9hcm02NC9tbS9jb250cHRlLmMgICAg
ICAgICAgIHwgICAyICstCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggfCAgIDUg
Ky0KIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyAgICAgICAgICB8ICAgNSArLQogYXJjaC94ODYv
aW5jbHVkZS9hc20vdGxiZmx1c2guaCAgIHwgICA1ICstCiBtbS9odWdlX21lbW9yeS5jICAgICAg
ICAgICAgICAgICAgfCAgMjQgKysrKystLQogbW0vcm1hcC5jICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMTE1ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogNyBmaWxlcyBjaGFuZ2Vk
LCAxMTcgaW5zZXJ0aW9ucygrKSwgNjQgZGVsZXRpb25zKC0pCgotLSAKMi4zOS4zIChBcHBsZSBH
aXQtMTQ2KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
