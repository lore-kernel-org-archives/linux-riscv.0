Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1D7CF6495
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Sep 2024 05:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLjgqDjMrtxKqp+eR/1RIwybRMkTdeER0TIVimSSFvQ=; b=EGyQVJPNSmSZn0
	1NWAxMzqzNj5oSF+61dLAJ8PHHpJZpn3pPbnSFfsHZQHLZt+q5hs9ZNiI70Lrc0+xselL7murU1b3
	T/4WTchvp+jE4fLtnXyQ6/fRV3QfS9XDqtGJG5vOErjaGqaIhtn3oxOW1d/q/0lo4GKhRhetGPuxt
	s8MTmZePCEh1FZD/TGxMCl6KmMwPrfKNf787mInfBGDzNwU/Wog+Pf+KhSdlRswxeui9E70Skkfkr
	0uxY0CX8xq9TVviE8sOqlC6IjQSeISbMNioGD2l47czGxGXM/lgB0ljeuVct/wEPzUhvS9A3u2wbl
	bPxESqEXEJsZimOkBNpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sumKj-0000000EAsV-34Ns;
	Sun, 29 Sep 2024 05:19:01 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sumKg-0000000EArx-2DS7
	for linux-riscv@lists.infradead.org;
	Sun, 29 Sep 2024 05:19:00 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71c63a43146so975760b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 22:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727587136; x=1728191936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfNYdN5DF0fxC1zWFU2xDZVwMMLzkSQRJ9Ujad4IKrU=;
        b=C62RCAX8T/OxDRcVRzKl6l8c1xLD6kNQL0hRRN1gz3VAoUztUzYwBijJObX5FAYZmS
         fjyJeSrfcQLe5vnHG1TEcwJGr0TrWf5NDBT6R2/6H5dkyhqna+2XrmG2aRLHaMXeplYT
         ETfb+opVhzB4YmcZbC6gGWmD7HArq7sMkBNobG0YfD0bt7n/Bac+5WXYf5gxF38noFMf
         L7L5Srea3IkQ+TKEHfryVQeoBetgiteVVZn1i9kMAANHLkLPWNWsBnzOW12lWnOXGoEf
         byUubf6zxLTQgJDMmO3jIECI1BVejnsD0NgHow/yaxNJNHGI++x3LpHZQWkV+wbrYqrI
         iY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727587136; x=1728191936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfNYdN5DF0fxC1zWFU2xDZVwMMLzkSQRJ9Ujad4IKrU=;
        b=g1MFw1RCladLLeehcmy2JUNXv8mk0UyxVE2yoApidDokjy/cziyA6fSAttxkRT7oiY
         uM/u/HADtaMUIP/phQrOITAG09Wdcg7DbeGGODlMWZHJ/BGAJVwLHK4INK5rtIUEZY2x
         AunDAnyShxPTGnywGLJAbUXGywSiCnltQZcLKaFCJJs7ay7PI/WUvqhdvipD5ad9f5cv
         akqLoXPWEd16QV48Pf/HV/waGsxKDzuh3Ol2QGMj2AJFeGYYQwoQuzK9K7TynJPPhjjV
         pDIMWNDuQNEZz3YJefVOZjc5DK5jzb5K60qFh0jrBO+smHi0qVPE4v437KX/auSZpnpr
         oTrw==
X-Gm-Message-State: AOJu0Ywe6mHejK36yVJV51LEIHf02YuVM/Lok7R6uy1l9PtjvyvVy6k+
	CuPjo4hEAqu3ZFwtVuQG+V+xShZ/oj9MQpCNufZ4MtTYYhCydGkstPnF2Bqz2ogG9FeVP56AjXQ
	Ul5QN6r/ha5VCq4UGgTo/kSF8QHtqVB3uOEN71g==
X-Google-Smtp-Source: AGHT+IGEhqVDLijW8eFLAf0Zpd/2t9b8Hj6ZUTd8eofunEs6b9JnHUEdTB1zT1QLlxpz5n63GqYLHRlScJEqh/EyjxU=
X-Received: by 2002:a05:6a00:3d44:b0:717:8a87:7d02 with SMTP id
 d2e1a72fcca58-71b26070191mr13785447b3a.23.1727587136633; Sat, 28 Sep 2024
 22:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <878qvbzqfx.fsf@oldenburg.str.redhat.com> <CAPYmKFtWPxEvD7v4FfN1n=YGuYCKgFFm7SNer5-GF95OBTMG+Q@mail.gmail.com>
 <87o747xd8f.fsf@oldenburg.str.redhat.com>
In-Reply-To: <87o747xd8f.fsf@oldenburg.str.redhat.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Sun, 29 Sep 2024 13:18:45 +0800
Message-ID: <CAPYmKFv+7Qw1hrd6==sKnJFz2sYZdhm2TY404wfGxBqxKm-XNg@mail.gmail.com>
Subject: Re: [External] Page sizes supported by RISC-V
To: Florian Weimer <fweimer@redhat.com>
Cc: linux-riscv@lists.infradead.org, Jeff Law <jeffreyalaw@gmail.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Punit Agrawal <punit.agrawal@bytedance.com>, 
	wangpengcheng.pp@bytedance.com, Hangjing Li <lihangjing@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_221858_597356_1C9FD7B8 
X-CRM114-Status: GOOD (  11.41  )
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

T24gU3VuLCBTZXAgMjksIDIwMjQgYXQgMTowNOKAr1BNIEZsb3JpYW4gV2VpbWVyIDxmd2VpbWVy
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gKiBYdSBMdToKPgo+ID4gVGh1cywgd2UgYXJlIGFsc28g
dHJ5aW5nIHRvIGNhbGwgZm9yIG5hdGl2ZSA2NEsgTU1VIGluIFJJU0MtVgo+ID4gY29tbXVuaXR5
LiBZb3UgY2FuIGZpbmQgdGhlIGRpc2N1c3Npb24gaW4gbGluayBbMV0uIFdlIGhvcGUgbW9yZQo+
ID4gcGVvcGxlIGNhbiBwYXJ0aWNpcGF0ZSBpbiB0aGUgZGlzY3Vzc2lvbiBhbmQgcHJvdmlkZSBt
b3JlIGRhdGEKPiA+IHN1cHBvcnQuCj4KPiBJZiB5b3UgYXJlIHNlcmlvdXNseSBjb25zaWRlcmlu
ZyBvZmZlcmluZyA2NEsgcGFnZXMgYXMgYW4gb3B0aW9uLCB5b3UKPiBuZWVkIHRvIGNsYXJpZnkg
dGhlIHNwZWNpZmljYXRpb25zIGFuZCB1cGRhdGUgYmludXRpbHMgKnRvZGF5KiB0bwo+IGluY3Jl
YXNlIHRoZSBkZWZhdWx0IG1heGltdW0gcGFnZSBzaXplIGZvciB0aGUgYmluYXJpZXMgdGhlIGxp
bmtlcgo+IGdlbmVyYXRlcy4gIFRoZSB0cmFuc2l0aW9uIHdpbGwgb25seSBiZWNvbWUgaGFyZGVy
IGFzIGFkb3B0aW9uIGdyb3dzLgoKVGhhbmtzLiBBbmQgeWVzLCB3ZSBoYXZlIHNlbnQgcmVsYXRl
ZCBwYXRjaGVzIHRvIExMVk1bMF0uIFRoZSBwYXRjaGVzCnRvIGJpbnV0aWxzIGFyZSBvbiB0aGUg
d2F5LiBXZSB3aWxsIGFwcHJlY2lhdGUgaXQgdmVyeSBtdWNoIGlmIHlvdSBjYW4KaGVscCB0byBy
ZXZpZXcgYW5kIHByb3ZpZGUgYW55IHN1Z2dlc3Rpb25zLgoKWzBdIGh0dHBzOi8vZ2l0aHViLmNv
bS9sbHZtL2xsdm0tcHJvamVjdC9wdWxsLzEwMDk5NQoKWHUgTHUKCj4KPiBUaGFua3MsCj4gRmxv
cmlhbgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
