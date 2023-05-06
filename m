Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41D7C77B7C
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 00:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acMt68kY9DRgHwkQ6GWbe9OmrBBm+0sz2c1ADDOZH+U=; b=iKIaUG282W5CAu
	l4sz2YcHwnHjZkeMoWfjKljHU2VfaUyvrgvEtZbPDwE1pnSkNIJrPzKSiPaHSO28ZjnGNkBhiky1+
	kGjDcwusUlCz4/+WzTdz88uFBDIiYKAegsa1ZL8AdCzr3Fj+6Q/YbkG6zuugeOu3PPnRF6uHJdSQW
	xS0Rk5u5XiHCeNscAkIqibigQQQUVAV43y1yNJzPv0ylepFMRI9/wAh7NaZjqZ9Cl44fF2srwPhdz
	tvQXceCpJhxtDiQCu78NdnhVN7dEzKLVtKWBHroQSD8zIM5YSxRou5FDJmIoOJicDxID8sI5Xs3tV
	Q5Inpv4/rZW64cgBnmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pv6Da-00CDse-1O;
	Sat, 06 May 2023 00:56:10 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pv6DX-00CDrE-1X
	for linux-riscv@lists.infradead.org;
	Sat, 06 May 2023 00:56:08 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-b9daef8681fso2213520276.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 17:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683334563; x=1685926563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKg9ooWeNyIkgIgwiRq1E2syoa7nncxzMKLzyswsRsc=;
        b=oEYCubX2MVaZ3lIzvYofKvwQIDmS/lXvTaPe+nx4JYIouIEOq7/VZNJBz/955TtNWl
         rYZHJ+9qECqeg4RDvNtvrHP7Ui0lGMPDX2ubGmDW8gNEBQ4HBdjErLbRCtIQE4/ErBRb
         UlUMiTVsTHoQ8RelA4t0FXBYWpOlPMnSpnz4cQsoVWkXnKmP9FEXp+ofhhYThW6YyuE1
         IHUvMHy+BC8pzZGtWZNz6yAWNfS98wy2U8g8HBZK4UcJlfQuJKNgMLKe1XbotZB+DRQJ
         E6hjwHB7/x0k7bAxrYPgZylFDAG4hiLFoxg569IPVzorgRuRk9NqLc9+2y4ttTt5sYY5
         aecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683334563; x=1685926563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKg9ooWeNyIkgIgwiRq1E2syoa7nncxzMKLzyswsRsc=;
        b=DXm2fJ+nOvhgDfPTJkEsKlxuXZlNmV+Uk7JKT2Z9h0wnnLtGVKB/PqhG7GqNxSkaq6
         IvbK0+iHBWdUqd6zOJ28/wJNJHRFyP/EGWlRzVUuh/IT3wVauz81y8iz3Zbm+yikZizX
         ZTwqTe3UxPXMlYY1q7dy6zsYCBaXyKThFfWZ+28bZ0rH8wd5oVhrHgGuMhc+mDnGX6j3
         i4QgXoqgE/85MgM3qXNqYIJQUQLI6/6QESronpZV847D+7avoHi2G4YyYhpJFMhyXKTO
         DVf6WdmgfkiKi2/DICz4NXKgqlHws6r0lsblFQxzibyl2mH6NHlN7XkHp6ONohox0CPB
         KlOQ==
X-Gm-Message-State: AC+VfDz6I1pHQxyTCpuaYtQ7I/BGUoXhPK4wOwrmAqlFWLRCF0HAT3Pj
	R1LZOwivwPVTEUBZV9Eht/dPZWT9CYFQFFjxXPOSYQ==
X-Google-Smtp-Source: ACHHUZ7wTUegv3WyR7/Hq6e7DeiGJOrweEWBdXtRxu9dBQrh9sKO2r4H3TUs5GZtQPSXUUdXPbUlcJtY7oipXngdTpg=
X-Received: by 2002:a0d:cb44:0:b0:556:b029:e101 with SMTP id
 n65-20020a0dcb44000000b00556b029e101mr3457366ywd.19.1683334562650; Fri, 05
 May 2023 17:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230421165305.804301-1-vipinsh@google.com> <20230421165305.804301-10-vipinsh@google.com>
 <86pm7xjh3y.wl-maz@kernel.org>
In-Reply-To: <86pm7xjh3y.wl-maz@kernel.org>
From: Vipin Sharma <vipinsh@google.com>
Date: Fri, 5 May 2023 17:55:26 -0700
Message-ID: <CAHVum0d4W0emmyS0G8_nCXQuvgZN-8utDiT6TMYrOq7dF60aAw@mail.gmail.com>
Subject: Re: [PATCH 9/9] KVM: arm64: Run clear-dirty-log under MMU read lock
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, 
	tsbogend@alpha.franken.de, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com, 
	ricarkol@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_175607_515196_F18D9925 
X-CRM114-Status: GOOD (  13.86  )
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

T24gRnJpLCBBcHIgMjEsIDIwMjMgYXQgMTA6MTHigK9BTSBNYXJjIFp5bmdpZXIgPG1hekBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgMjEgQXByIDIwMjMgMTc6NTM6MDUgKzAxMDAsCj4g
VmlwaW4gU2hhcm1hIDx2aXBpbnNoQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+IFRha2UgTU1V
IHJlYWQgbG9jayBmb3Igd3JpdGUgcHJvdGVjdGluZyBQVEVzIGFuZCB1c2Ugc2hhcmVkIHBhZ2Ug
dGFibGUKPiA+IHdhbGtlciBmb3IgY2xlYXJpbmcgZGlydHkgbG9ncy4KPiA+Cj4gPiBDbGVhcmlu
ZyBkaXJ0eSBsb2dzIGFyZSBjdXJyZW50bHkgcGVyZm9ybWVkIHVuZGVyIE1NVSB3cml0ZSBsb2Nr
cy4gVGhpcwo+ID4gbWVhbnMgdkNQVXMgd3JpdGUgcHJvdGVjdGlvbiBmYXVsdCwgd2hpY2ggYWxz
byB0YWtlIE1NVSByZWFkIGxvY2ssICB3aWxsCj4gPiBiZSBibG9ja2VkIGR1cmluZyB0aGlzIG9w
ZXJhdGlvbi4gVGhpcyBjYXVzZXMgZ3Vlc3QgZGVncmFkYXRpb24gYW5kCj4gPiBlc3BlY2lhbGx5
IG5vdGljZWFibGUgb24gVk1zIHdpdGggbG90IG9mIHZDUFVzLgo+ID4KPiA+IFRha2luZyBNTVUg
cmVhZCBsb2NrIHdpbGwgYWxsb3cgdkNQVXMgdG8gZXhlY3V0ZSBwYXJhbGxlbGx5IGFuZCByZWR1
Y2VzCj4gPiB0aGUgaW1wYWN0IG9uIHZDUFVzIHBlcmZvcm1hbmNlLgo+Cj4gU3VyZS4gVGFraW5n
IG5vIGxvY2sgd2hhdHNvZXZlciB3b3VsZCBiZSBldmVuIGJldHRlci4KPgo+IFdoYXQgSSBkb24n
dCBzZWUgaXMgdGhlIGRldGFpbGVkIGV4cGxhbmF0aW9uIHRoYXQgZ2l2ZXMgbWUgdGhlIHdhcm0K
PiBmZWVsaW5nIHRoYXQgdGhpcyBpcyBzYWZlIGFuZCBjb3JyZWN0LiBTdWNoIGFuIGV4cGxhbmF0
aW9uIGlzIHRoZQo+IG1pbmltdW0gY29uZGl0aW9uIGZvciBtZSB0byBldmVuIHJlYWQgdGhlIHBh
dGNoLgo+CgpUaGFua3MgZm9yIGZyZWFraW5nIG1lIG91dC4gWW91ciBub3QgZ2V0dGluZyB3YXJt
IGZlZWxpbmcgaHVuY2ggd2FzCnJpZ2h0LCBzdGFnZTJfYXR0cl93YWxrZXIoKSBhbmQgc3RhZ2Uy
X3VwZGF0ZV9sZWFmX2F0dHJzKCkgY29tYm8gZG8Kbm90IHJldHJ5IGlmIGNtcHhjaGcgZmFpbHMg
Zm9yIHdyaXRlIHByb3RlY3Rpb24uIFdyaXRlIHByb3RlY3Rpb24KY2FsbGVycyBkb24ndCBjaGVj
ayB3aGF0IHRoZSByZXR1cm4gc3RhdHVzIG9mIHRoZSBBUEkgaXMgYW5kIGp1c3QKaWdub3JlcyBj
bXB4Y2hnIGZhaWx1cmUuIFRoaXMgbWVhbnMgYSB2Q1BVIChNTVUgcmVhZCBsb2NrIHVzZXIpIGNh
bgpjYXVzZSBjbXB4Y2hnIHRvIGZhaWwgZm9yIHdyaXRlIHByb3RlY3Rpb24gb3BlcmF0aW9uICh1
bmRlciByZWFkIGxvY2ssCndoaWNoIHRoaXMgcGF0Y2ggZG9lcykgYW5kIGNsZWFyIGlvY3RsIHdp
bGwgaGFwcGlseSByZXR1cm4gYXMgaWYKZXZlcnl0aGluZyBpcyBnb29kLgoKSSB3aWxsIHVwZGF0
ZSB0aGUgc2VyaWVzIGFuZCBhbHNvIHdvcmsgb24gdmFsaWRhdGluZyB0aGUgY29ycmVjdG5lc3MK
dG8gaW5zdGlsbCBtb3JlIGNvbmZpZGVuY2UuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
