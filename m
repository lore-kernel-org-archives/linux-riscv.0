Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74F1C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 06:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHfs+je2YHcgdrrzRqt66GiqfaMQNzaiyAhuj57WnGE=; b=YINpUa9lNSHtv9
	7vhcaIlnZ0aXmUZX7Ufj7LuVAOyp58GQ5i2n8Y+/QP/9gzq0pOf90HmQYzk2pgdwImn3y1nC8vHyA
	+cYhacjZQB55iXdLekD2q87dUSWbP+f1K/6dHSjCbR/HeTAh90udag00ma4vK8kPHb+x65XrPWhfl
	HIMWayf/5LqyrexKTIWq7L3WEzLc9IsrTYvyt/4QX7gup3/5X+vRx0uPKzhp07uTH714dW/zvO1B4
	5ng3E0RqkuWQNXA9T47mKeKuDGTQXp2iYUq3ktwUQdGlNyLCJAjZT59mps+EFAkFKXCVQAOxyFrkd
	8DK8SGS8P51T89P2ic9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN5Bu-0072M5-2J;
	Tue, 09 Jan 2024 06:02:22 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN5Br-0072Kz-19
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 06:02:20 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3606e69ec67so22243195ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 22:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1704780136; x=1705384936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SC3vgopQgjhiGDVg61h7B4FeTMOwECveBgS++xiO8eY=;
        b=qxbB3M596S9P3ITpuShRIYWoKDp3cw5qanZx4YtjbEShSzpCu8dp1wzNS7aP5yYXZY
         pCstxE2gzY70jjlZ/ZBXs/KtGscCwCZF7GgVUSfnNT0qjGPiCaN0TUXGw6vwNhX0eETS
         o67z6q5lL+v+r03pOfry0SrvI89c0yY57tnbMehxGaSx4bZ0GjRlcYYidZMLxL2SgC08
         2mjPpCdzuG1hh0NnIVyCNSK9UJh+vhpe7hvBwCp00u8R2LIAxDqX5XzIshWsoNNFAECR
         LXfZcw+NmAS+o/fiRyKbS3BpmIpKQQwZ+4U+LZDNB0gnootPRepwxsst1gF6qEurvVn0
         bq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704780136; x=1705384936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SC3vgopQgjhiGDVg61h7B4FeTMOwECveBgS++xiO8eY=;
        b=druvGkp453/BeAjV1ZuG7ZIK0oiX9hXXG2C2zxGjO21KGm1KgH3E/sDVmaFyx6eMuQ
         DovWYPszluJRpP7XmG76r6edXqI/iv4GLdpULz/DwWrQSleFAybmS4MdvDFrp4HTCgQT
         OjBJxR4e/Kcs4qpQGUhPYb3CyZ0ptFSQQFfM3DtSQ3F5CK8ZMn1KcbEodB7FWChSab1+
         IPepJtc7Ts3fLOyUfIysXrb3ZEVQgbgS2it0QNGboDCt9IyLLFFGW7nRNhK8AqtVWTqj
         k2v62vs+tKSnA5VOWiwCqGwOiObwF2wD7E1TVVJSuMQKMMuVAX2xDKO5iKP3k70sgxNr
         kVyg==
X-Gm-Message-State: AOJu0Yzq0MCd5G7uNYXoo7zUK1jvZMlES6Eiac3EUFJwpRqlJX2Fqx4z
	DK2CrHHg0mtYcRd+0u/EGH2Ykp2KIE7Ww48Yc/uvV0BV3R/vUA==
X-Google-Smtp-Source: AGHT+IFA0x43cfGZLFFEgvDfSne2HckKcDx43xjiVRe/8xM5bLM0cMYAEPSjP4WKy2beNi8IBKBA4NKXiFrZYks/3V4=
X-Received: by 2002:a05:6e02:17c6:b0:360:976f:d0b8 with SMTP id
 z6-20020a056e0217c600b00360976fd0b8mr1218628ilu.44.1704780135686; Mon, 08 Jan
 2024 22:02:15 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy1QsMuAmr+DFxjkf3a2Ur91AX9AnddRnBHGM6+exkAn1g@mail.gmail.com>
 <CABgObfZN4_xvOHr8aukZZGZj5teWZ7rt5RJU5Y0YFewQk19FRw@mail.gmail.com>
 <20240102-c07d32a585f11ee80bd7b70b@orel> <CAAhSdy2_STfVNb6PB0o-hW+rn-K+U5BcYJWJO3m8vbeQEQ9BFw@mail.gmail.com>
In-Reply-To: <CAAhSdy2_STfVNb6PB0o-hW+rn-K+U5BcYJWJO3m8vbeQEQ9BFw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Jan 2024 11:32:05 +0530
Message-ID: <CAAhSdy0GO=5N2Fz0O-=xMqJ1ZK3GoqsW76kt8UevxhJRbEYmtw@mail.gmail.com>
Subject: Re: Re: [GIT PULL] KVM/riscv changes for 6.8 part #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_220219_389122_1912B00E 
X-CRM114-Status: GOOD (  24.82  )
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

SGkgUGFvbG8sCgpPbiBUaHUsIEphbiA0LCAyMDI0IGF0IDExOjAw4oCvQU0gQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4KPiBIaSBQYW9sbywKPgo+IE9uIFdlZCwgSmFu
IDMsIDIwMjQgYXQgMTo1NeKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5j
b20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgSmFuIDAyLCAyMDI0IGF0IDA3OjI0OjI2UE0gKzAx
MDAsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gPiA+IE9uIFN1biwgRGVjIDMxLCAyMDIzIGF0IDY6
MzPigK9BTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+ID4gPgo+
ID4gPiA+IEhpIFBhb2xvLAo+ID4gPiA+Cj4gPiA+ID4gV2UgaGF2ZSB0aGUgZm9sbG93aW5nIEtW
TSBSSVNDLVYgY2hhbmdlcyBmb3IgNi44Ogo+ID4gPiA+IDEpIEtWTV9HRVRfUkVHX0xJU1QgaW1w
cm92ZW1lbnQgZm9yIHZlY3RvciByZWdpc3RlcnMKPiA+ID4gPiAyKSBHZW5lcmF0ZSBJU0EgZXh0
ZW5zaW9uIHJlZ19saXN0IHVzaW5nIG1hY3JvcyBpbiBnZXQtcmVnLWxpc3Qgc2VsZnRlc3QKPiA+
ID4gPiAzKSBTdGVhbCB0aW1lIGFjY291bnQgc3VwcG9ydCBhbG9uZyB3aXRoIHNlbGZ0ZXN0Cj4g
PiA+Cj4gPiA+IEp1c3Qgb25lIHNtYWxsIHRoaW5nIEkgbm90aWNlZCBvbiAoMyksIGRvIHlvdSBy
ZWFsbHkgbmVlZCBjcHVfdG9fbGU2NAo+ID4gPiBhbmQgbGU2NF90b19jcHUgb24gUklTQy1WPyBJ
dCBzZWVtcyB0aGF0IGl0IHdhcyBjb3BpZWQgZnJvbSBhYXJjaDY0Lgo+ID4gPiBObyBuZWVkIHRv
IHJlc2VuZCB0aGUgUFIgYW55d2F5LCBvZiBjb3Vyc2UuCj4gPgo+ID4gV2hpbGUgTGludXgvS1ZN
IGlzIG9ubHkgTEUsIHRoZSBhcmNoIGRvZXNuJ3QgcHJvaGliaXQgUy1tb2RlIGJlaW5nCj4gPiBj
b25maWd1cmVkIHRvIHVzZSBCRSBtZW1vcnkgYWNjZXNzZXMsIHNvIEkga2VwdCB0aGUgY29udmVy
c2lvbnMuIFRoZXkKPiA+IGF0IGxlYXN0IHByb3ZpZGUgc29tZSBzZWxmLWRvY3VtZW50aW5nIG9m
IHRoZSBjb2RlLiBUaGUgYmlnZ2VzdAo+ID4gcHJvYmxlbSB3aXRoIHRoZW0sIHRob3VnaCwgaXMg
dGhhdCBJIGRpZG4ndCB1c2UgX19sZTY0IHR5cGVzIGFuZCBub3cKPiA+IHNwYXJzZSBpcyB5ZWxs
aW5nIGF0IG1lLiBJIHBhdGNoZWQgdGhhdCB0aGlzIG1vcm5pbmcsIGJ1dCBkaWRuJ3QgZ2V0Cj4g
PiBhIGNoYW5jZSB0byBwb3N0IHlldC4gSSBjb3VsZCBpbnN0ZWFkIHJpcCBvdXQgdGhlIGNvbnZl
cnNpb25zIHRvCj4gPiBxdWlldCBzcGFyc2UsIGlmIHRoYXQgd291bGQgYmUgcHJlZmVycmVkLgo+
Cj4gVGhlIFNCSSBzcGVjIGlzIHF1aXRlIGV4cGxpY2l0IGFib3V0IGVuZGlhbm5lc3Mgb2YgZGF0
YSBpbiBzaGFyZWQKPiBtZW1vcnkuIEFsc28sIHRoZSBSSVNDLVYgcHJpdiBzcGVjIGFsbG93cyBC
RSBsb2FkL3N0b3JlIG9wZXJhdGlvbnMKPiBzbyBldmVudHVhbGx5IHdlIG1pZ2h0IHNlZSBCRSBw
bGF0Zm9ybXMuIEkgc3VnZ2VzdCBrZWVwaW5nIHRoZSBMRQo+IGNvbnZlcnNpb24gbWFjcm9zIGFu
ZCBfX2xlMzIvX19sZTY0IGRhdGEgdHlwZXMuCj4KPiBSZWdhcmRpbmcgdGhlIHNwYXJzZSBlcnJv
cnMsIERyZXcgY2FuIHNlbmQgZml4IHBhdGNoZXMgd2hpY2ggSQo+IHdpbGwgaW5jbHVkZSBpbiB0
aGUgc2Vjb25kIFBSIGZvciA2LjguCj4KPiBJIGhvcGUgdGhpcyBpcyBva2F5Lgo+CgpGcmllbmRs
eSBwaW5nID8KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
