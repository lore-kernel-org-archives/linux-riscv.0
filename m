Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE3AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 19:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rjatn2WiPrbKfvXAhrA5ohu6JjX0WFzCTkiSVoQkwvs=; b=X3zkE2Tw2sPNlB
	5jT/FM5qnkg9regOmiWe56Ptkpaw8gWc1Dkoj9cWrl+WxTwR+Gxta9kVYeRrT4dhy3b4Oh4y+Zjha
	YIPrHR1utKr8yWYwaokZ3NdcYDZ/OghAVmKHSOOK2KvCJA9QSz+erA2JTpY5NDNdgGI2RbW4bh+rx
	JlB4sS63frsVqeeKSR+4Y1itrJEmR9XSwuKGGlYitfij7ghxds03/TUAy6lV31Ps+h8cqzFsqMxAh
	876OItyBpiX2qORjc9LLEtJv2fzlWqi/cYj4X8G4qZkNWkDuUETDrst+ig2n8xfoW0fH3l3HAhW0k
	dcnlagvhdtViO2QLEQ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDV9M-00FrPA-04;
	Wed, 13 Dec 2023 19:44:08 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDV9H-00FrNO-30
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 19:44:06 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dbcc63b7c68so1675204276.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 11:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702496641; x=1703101441; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KwJmg/AmRci9oth6e0vim63G1m84y3oNQcN/OKV3e0=;
        b=0o1qAHNXuDXhnTSjfFLti7+HYHIllcnXpnccPGSa33vAY5s1hXjEiHz1tD/jSsangZ
         FKZ3k4yZwjTkHBkisQ8CPHVvJTKNqjZUz7USwVCAd3hfFJpYo0zHtSbyBwl5TH8EEQ06
         /WpbSpsn5QIyoAmT2jliJTAjvutfkuGFUjuKo/ceZhdOLSrv2K2xgPXX79zGFNjFo1TU
         cqUK4d+KpOIEVsDa1tSrVKv0vL5CwSZsWqZzR4tukk9MJ8kDVbfu8vdp7S/eel77iBn3
         PJKnTPJopjpbsVRSrFD1RoBoagVtlOkBDFUyYdG9iaa3NAx4jIk7KgmcRj4+CwZyub4P
         OipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702496641; x=1703101441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KwJmg/AmRci9oth6e0vim63G1m84y3oNQcN/OKV3e0=;
        b=CWX3e7exZg0eBT/g3w6XPTo6cVUq7CqOuAMOlA7ZTAgVTXozxXd5H4BKJqTB4ubtaJ
         cKYqNCYQrKGwIPt3VNlwOmhVSkedsx7tvhE0RPJuRXtOMwiV/k1nBxbwxe1OJv94R7jc
         zXQakrw2ndBrMlAUlwi4rpu89JXcabB9VfB+Km6pszS6dlHAdnh953kZeIES1BOfHlLs
         nAHgDTSp6Xz5BIF9D+YFcnGgg7uXMhXArOXzbC4L69s3BjAlZPTbaSDx5K4LFwA0u1f2
         DL2KXURTnVA7tfmmgpcf/byLehWTKSx8Mi0kS4ulq0SyWnJjtm5d4MQ6pGyHOUOO+Xga
         P0Kw==
X-Gm-Message-State: AOJu0Yz/EaEQuh0FPwFOEgznsQSiaie0kgz17i5B4PETYbHoo2+cWd6h
	XERzZVcxIWMktAVYF6v6lARJFoEJ4S8G4iHqmzI1Aw==
X-Google-Smtp-Source: AGHT+IFSmPxfZTBIe3gumpwK2nVwVDcDb9+yDl2yaVi4US6Ez2/rKUahNn9IJ0xE08iqlW2A2FfQ7xQQ2M/z/jnykQ4=
X-Received: by 2002:a25:8c91:0:b0:db7:dacf:59de with SMTP id
 m17-20020a258c91000000b00db7dacf59demr4990232ybl.82.1702496641231; Wed, 13
 Dec 2023 11:44:01 -0800 (PST)
MIME-Version: 1.0
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-2-201c483bd775@kernel.org> <CAKC1njSC5cC_fXnyNAPt=WU6cD-OjLKFxo90oVPmsLJbuWf4nw@mail.gmail.com>
 <d708b493-267a-4418-be91-9bde6b2cf50c@sirena.org.uk> <CAKC1njSQPO8ja7AkTzQ724hhSsGjchH9dLbbH9LXP0ZiKj-zPQ@mail.gmail.com>
 <0d0d8802-09e3-4ea5-a0b4-b3a08c8a282e@sirena.org.uk>
In-Reply-To: <0d0d8802-09e3-4ea5-a0b4-b3a08c8a282e@sirena.org.uk>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 13 Dec 2023 11:43:49 -0800
Message-ID: <CAKC1njRHs0R=VKfn4jBap9__oR0rBHmNy7_tqHR8=xEHdUE4+A@mail.gmail.com>
Subject: Re: [PATCH v7 02/39] prctl: arch-agnostic prctl for shadow stack
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_114403_974405_EE2F9B9D 
X-CRM114-Status: GOOD (  21.10  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgNTozN+KAr0FNIE1hcmsgQnJvd24gPGJyb29uaWVAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIERlYyAxMiwgMjAyMyBhdCAwNDo1MDozOFBNIC0w
ODAwLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4KPiA+IEEgdGhlb3JldGljYWwgc2NlbmFyaW8gKG5v
IGN1cnJlbnQgd29ya2xvYWRzIHNob3VsZCd2ZSB0aGlzIGNhc2UKPiA+IGJlY2F1c2Ugbm8gc2hh
ZG93IHN0YWNrKQo+Cj4gPiAtIFVzZXIgbW9kZSBkaWQgX0VOQUJMRSBvbiB0aGUgbWFpbiB0aHJl
YWQuIFNoYWRvdyBzdGFjayB3YXMgYWxsb2NhdGVkCj4gPiBmb3IgdGhlIGN1cnJlbnQKPiA+ICAg
dGhyZWFkLgo+ID4gLSBVc2VyIG1vZGUgY3JlYXRlZCBhIGJ1bmNoIHdvcmtlciB0aHJlYWRzIHRv
IHJ1biB1bnRydXN0ZWQgY29udGFpbmVkCj4gPiBjb2RlLiBUaGV5IHNoYWRvdwo+ID4gICBzdGFj
ayB0b28uCj4gPiAtIG1haW4gdGhyZWFkIGhhZCB0byBkbyBkbG9wZW4gYW5kIG5vdyBuZWVkIHRv
IGRpc2FibGUgc2hhZG93IHN0YWNrIG9uCj4gPiBpdHNlbGYgZHVlIHRvCj4gPiAgIGluY29tcGF0
aWJpbGl0eSBvZiBpbmNvbWluZyBvYmplY3QgaW4gYWRkcmVzcyBzcGFjZS4KPiA+IC0gbWFpbiB0
aHJlYWQgY29udHJvbHMgd29ya2VyIHRocmVhZHMgYW5kIGtub3dzIHRoZXkncmUgY29udGFpbmVk
IGFuZAo+ID4gc2hvdWxkIHN0aWxsIGJlIHJ1bm5pbmcKPiA+ICAgd2l0aCBhIHNoYWRvdyBzdGFj
ay4gQWx0aG91Z2ggb25jZSBpbiBhIHdoaWxlIHRoZSBtYWluIHRocmVhZCBuZWVkcwo+ID4gdG8g
cGVyZm9ybSB3cml0ZXMgdG8gYSBzaGFkb3cKPiA+ICAgc3RhY2sgb2Ygd29ya2VyIHRocmVhZHMg
Zm9yIHNvbWUgZml4dXAgKGluIHRoZSBzYW1lIGFkZHIgc3BhY2UpLgo+ID4gbWFpbiB0aHJlYWQg
ZG9lc24ndCB3YW50IHRvIGRlbGVnYXRlCj4gPiAgIHRoaXMgcmVzcG9uc2liaWxpdHkgb2Ygc3Mg
d3JpdGVzIHRvIHdvcmtlciB0aHJlYWRzIGJlY2F1c2UgdGhleSdyZSB1bnRydXN0ZWQuCj4KPiA+
IEhvdyB3aWxsIGl0IGRvIHRoYXQgKGN1cnJlbnRseSBfRU5BQkxFIGlzIG1hcnJpZWQgdG8gX1dS
SVRFIGFuZCBfUFVTSCkgPwo+Cj4gVGhhdCdzIGZlZWxpbmcgbW9kZXJhdGVseSBmaXJtbHkgaW50
byAiZG9uJ3QgZG8gdGhhdCIgdGVycml0b3J5IHRvIGJlCj4gaG9uZXN0LCB0aGUgcHJvYmxlbXMg
b2YgdHJ5aW5nIHRvIG1vZGlmeSB0aGUgc3RhY2sgb2YgYW5vdGhlciBydW5uaW5nCj4gdGhyZWFk
IHdoaWxlIGl0J3MgYWN0aXZlIGp1c3QgZG9uJ3Qgc2VlbSB3b3J0aCBpdCAtIGlmIHlvdSdyZQo+
IGNvb3JkaW5hdGluZyBlbm91Z2ggdG8gZG8gdGhlIG1vZGlmaWNhdGlvbnMgaXQncyBwcm9iYWJs
eSBwb3NzaWJsZSB0bwo+IGp1c3QgYXNrIHRoZSB0aHJlYWQgd2hvJ3Mgc3RhY2sgaXMgYmVpbmcg
bW9kaWZpZWQgdG8gZG8gdGhlIG1vZGlmaWNhdGlvbgo+IGl0c2VsZiBhbmQgaGF2aW5nIGFuIHVu
cHJvdGVjdGVkIHRocmVhZCB3cml0aW5nIGludG8gc2hhZG93IHN0YWNrIG1lbW9yeQo+IGRvZXNu
J3QgZmVlbCBncmVhdC4KPgoKWWVhaCBubyBsZWFuaW5ncyBvbiBteSBzaWRlLiBKdXN0IHdhbnRl
ZCB0byBhcnRpY3VsYXRlIHRoaXMgc2NlbmFyaW8uClNpbmNlIHRoaXMgaXMgbmV3IGdyb3VuZCwK
d2UgY2FuIGRlZmluZSB3aGF0J3MgYXBwcm9wcmlhdGUuIExldCdzIGtlZXAgaXQgdGhpcyB3YXkg
d2hlcmUgYQp0aHJlYWQgY2FuIHdyaXRlIHRvIHNoYWRvdwpzdGFjayBtYXBwaW5ncyBvbmx5IHdo
ZW4gaXQgaXRzZWxmIGhhcyBzaGFkb3cgc3RhY2sgZW5hYmxlZC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
