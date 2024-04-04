Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5A8CD128A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 00:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7Ef35L5mXyefnhbnhorckb2Dw4McGCg0TDIhlwcCo0=; b=yt+NWvO22ArLll
	elhdBS5vEhGVj404rJKd+vodpy3K+wwnHaCD41eaDX4rB0vz0215xUJXAXI8C0j2oclKKozgLVdD3
	nHe+a5M9v1pB44TB7FXaBrWhZGwisygSQnn8lZo8OIoqM68e3Ati0LY0tXgEHP+D4kQK1aAjC+5OY
	/WZFDKANqZ5FKnMtfQhxOKgG2of4KWBbOwtQ32ogTl670bUhA5Ans3FA9Vd6h2vmF0lPrzSSZcq9p
	ngP1E22EBEmtVc9IUeR6r/NeqvXLeAjW7l4D8rCYeOd5TyKi3DiPHrNV+7Zz/wr+7NHxZaLlszgcj
	MHlsjKrGbXhpkCHVMTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAip-00000000irS-1dVt;
	Thu, 04 Apr 2024 00:12:51 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAij-00000000ioN-3agC
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 00:12:47 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6167f4319afso805157b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 17:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712189564; x=1712794364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NS7RXz95lan08w3jmDkFk4FxH6W/mJ5XV1pPL/c834=;
        b=UMT0j5CLPEquIUUd/JaF5RXAjXw33k4sWJ3MvGpDs6Ws1V+9Mo6U7UxKkmTQY7WD26
         +R0ypdyj8//Vyp6PsQUv5rDqxtginUI9Y0KgEq69D6e4csxE/HcnU7Pot22HnF9fAr8L
         rLjPZa+oXI20IrHvjUaF/wvoLDjpQ6ZIntGZS1cd6zCGswrC2PQgy7M7ahxTskpNvy2s
         pPoEhuxcQI5z0HDNwDQZANTTk34ZURGIDnKB2h6oURyhurDBojrGOUK54Lo68cIgguvQ
         fvEL7selHAvX/naAJmKszkqQRGPZaU971AwIy7lmWRBUxzr8Cf6FeLC9iGFLxfZg4dgo
         RtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712189564; x=1712794364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NS7RXz95lan08w3jmDkFk4FxH6W/mJ5XV1pPL/c834=;
        b=KoyqfJAla8WzpzyEE7OcLIVQJx+nGRhPVXuLx8YR4Igr19t/NwxqDH5iMqcTDITQaM
         Ql2G+64IL2l0587/pSbWq71q0i3+uLNzPmHvBTWFpnodsagK3YnQMbw2RJeNNLij8f8X
         ChVS0o0r9jrrpbzZTTgm0d2Zhd4NcqjSLBdvOnyXanpeKI5Icjmw9daWdsA4sEDCiBqL
         E7rhJzdrREdIy7K4PkPQ/ulzrY0wYuH0WkNKBam1q26/JWMYr41VDHSoupNAu2H3MCr8
         zF8Mah/F3md433p0uxXEF1tLaHj9LoAgY79zykoQtQpc+Y1CrdfHE4seegv0wET3wfz3
         h1sg==
X-Forwarded-Encrypted: i=1; AJvYcCVKPl7Bp9zvm9V9fo54sRlDjx/eYI1TivIY8IzOECVyRv0plJ/VrZ7ovWUEKLs2iUoXMXvmdPkfe0z1c7hVmJ1J04PgD7ji0tuIXmwWFQ22
X-Gm-Message-State: AOJu0YwU7tX/0AUjo2OD80BDTDFoLMPLOLkDBQHO+wbjvMXxzGrfmEZX
	F7Yi5qEzP6Ak45aRPvf3/5aCxxHeoyRCmAc8ZgnALKEDnwfDrucBL1AmuTAWcuw/huUM1jCqkG0
	0n+YeGIrYi0o/1uQvfv5tS4cuSmi1pC5Eag9ZVA==
X-Google-Smtp-Source: AGHT+IGIN9RjvMLUDIpAmm7RsOi7H4k0RkSaVfgiFkKRBh0h1VzmfcxUfv/UOTCfGZuR0DO8KsX58y/fWkIBiXxYREE=
X-Received: by 2002:a81:7785:0:b0:615:1dc6:429a with SMTP id
 s127-20020a817785000000b006151dc6429amr922136ywc.46.1712189564372; Wed, 03
 Apr 2024 17:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-11-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-11-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 20:12:07 -0400
Message-ID: <CA+CK2bBeJWo_8kNGr5XoTbLV2gQHL9E=gmv1BxD+d4sKF-mjqw@mail.gmail.com>
Subject: Re: [PATCH v12 10/11] powerpc: mm: Use set_pte_at_unchecked() for
 early-boot / internal usages
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_171246_178836_FA8B1990 
X-CRM114-Status: GOOD (  14.07  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxOjEz4oCvQU0gUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxp
bnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gSW4gdGhlIG5ldyBzZXRfcHRlcygpIEFQSSwgc2V0X3B0
ZV9hdCgpIChhIHNwZWNpYWwgY2FzZSBvZiBzZXRfcHRlcygpKQo+IGlzIGludGVuZGVkIHRvIGJl
IGluc3RydW1lbnRlZCBieSB0aGUgcGFnZSB0YWJsZSBjaGVjayBmYWNpbGl0eS4gVGhlcmUKPiBh
cmUgaG93ZXZlciBzZXZlcmFsIG90aGVyIHJvdXRpbmVzIHRoYXQgY29uc3RpdHV0ZSB0aGUgQVBJ
IGZvciBzZXR0aW5nCj4gcGFnZSB0YWJsZSBlbnRyaWVzLCBpbmNsdWRpbmcgc2V0X3BtZF9hdCgp
IGFtb25nIG90aGVycy4gU3VjaCByb3V0aW5lcwo+IGFyZSB0aGVtc2VsdmVzIGltcGxlbWVudGVk
IGluIHRlcm1zIG9mIHNldF9wdGVzX2F0KCkuCj4KPiBBIGZ1dHVyZSBwYXRjaCBwcm92aWRpbmcg
c3VwcG9ydCBmb3IgcGFnZSB0YWJsZSBjaGVja2luZyBvbiBwb3dlcnBjCj4gbXVzdCB0YWtlIGNh
cmUgdG8gYXZvaWQgZHVwbGljYXRlIGNhbGxzIHRvCj4gcGFnZV90YWJsZV9jaGVja19we3RlLG1k
LHVkfV9zZXQoKS4gQWxsb3cgZm9yIGFzc2lnbm1lbnQgb2YgcHRlIGVudHJpZXMKPiB3aXRob3V0
IGluc3RydW1lbnRhdGlvbiB0aHJvdWdoIHRoZSBzZXRfcHRlX2F0X3VuY2hlY2tlZCgpIHJvdXRp
bmUKPiBpbnRyb2R1Y2VkIGluIHRoaXMgcGF0Y2guCj4KPiBDYXVzZSBBUEktZmFjaW5nIHJvdXRp
bmVzIHRoYXQgY2FsbCBzZXRfcHRlX2F0KCkgdG8gaW5zdGVhZCBjYWxsCj4gc2V0X3B0ZV9hdF91
bmNoZWNrZWQoKSwgd2hpY2ggd2lsbCByZW1haW4gdW5pbnN0cnVtZW50ZWQgYnkgcGFnZQo+IHRh
YmxlIGNoZWNrLiBzZXRfcHRlcygpIGlzIGl0c2VsZiBpbXBsZW1lbnRlZCBieSBjYWxscyB0bwo+
IF9fc2V0X3B0ZV9hdCgpLCBzbyB0aGlzIGVsaW1pbmF0ZXMgcmVkdW5kYW50IGNvZGUuCj4KPiBB
bHNvIHByZWZlciBzZXRfcHRlX2F0X3VuY2hlY2tlZCgpIGluIGVhcmx5LWJvb3QgdXNhZ2VzIHdo
aWNoIHNob3VsZCBub3QgYmUKPiBpbnN0cnVtZW50ZWQuCgpXb3VsZCBub3QgdGhlIGVhcmx5LWJv
b3QgdXNhZ2UgYmUgYWxsIGtlcm5lbCBtYXBwaW5ncyB0aGF0IGFyZSBpZ25vcmVkCmJ5IHBhZ2Ug
dGFibGUgY2hlY2sgYW53YXlzPyBTb3VuZHMgbGlrZSBpdCBpcyBiZXR0ZXIgdG8gb25seSB1c2Ug
dGhlCnNldF9wdGVfYXRfdW5jaGVja2VkKCkgdmVyc2lvbiB3aGVyZSBpdCBpcyByZWFsbHkgbmVl
ZGVkLCB3aGljaCBpcyB0bwphdm9pZCBkb3VibGUgY291bnRpbmcuIFRoaXMgd2lsbCBrZWVwIHRo
ZSB1c2FnZSBvZiB0aGlzIGZ1bmN0aW9uIG9ubHkKZm9yIG9uZSBwdXJwb3NlIHRoYXQgaXMgZWFz
eSB0byBmb2xsb3cuCgpQYXNoYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
