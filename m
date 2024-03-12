Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29155C54E49
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 06:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcqWbMEXY7WUkkqa6HZkefItc/0IkNjZzSP0FoaNpRg=; b=2Xe5DDiEOkDoMZ
	5g7jFVjf37r3ATRX93xvaMIl28iSIpL5Pt+fROCT/7YrrQPwILdMK4sooQNIA6RtQrk6MkwifQ4cI
	lVPwUN+qogWNj+IryBfz839qHNDHTvs6D4H2Kg1yNNvT32y3c5FTNDLngPp43zcUp6IsOjt0Ci2YU
	4112zGUOinSFgdkGPkJKc+hKcI48SevXAYv5NQJjE2dD1lckpiM/Q1N8P2kK1hRjyS5km8bg32ogH
	YUGUT89HHVoDPw6I7yL+ECRx0WKLJfEzDiWLhmI17hHcYGlqYl7tkleaEI49SeFGrg2jxm0gZjtyo
	9hMutXf0wcDwIl+tE74Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjvzH-00000004dNq-425V;
	Tue, 12 Mar 2024 06:51:48 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjvzF-00000004dMd-08MM
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 06:51:46 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3662e41370fso23070395ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 23:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1710226303; x=1710831103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jlbn6Y6RDa3oPVQhvM8AoFcycNttM1/rKlfiZkBWl0=;
        b=JOozsu7AWA4j4Zr6TL299CGf1RUF4wmzqSzzdsrMdYW6qipaZSFQwXyTf0kewtfxnU
         Peumwxvqu+YVU0NU5rnSqqJu5NnteNGwTv68OIti4e57NUj/ZSwq3E/wzY1r+M+JJfDr
         2sSRol6A80TqqHJGZVsPC3cScg9Y4KnO65QyevTNe5glMYMQsGE4vGj09dsd6ToRyaVB
         k+1rrFSuIyjW+BV0rAGr637k9NPaR+PqEGT8C0NomF6MqKk8LPW+JIDZdkQZifk1En9V
         RMJZ8N2iEL6gF1nba05jMQkR86pP0gvGifjavn92T6oTVoPPEaXHKvD/Oqjev+bGfxgN
         srOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710226303; x=1710831103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jlbn6Y6RDa3oPVQhvM8AoFcycNttM1/rKlfiZkBWl0=;
        b=XaI6oBd/TmfGGmWMqDsKYetGnRLUyFpIJ2q4Rn4mqVd6IMTHd5JUBgtGwUsoCL1CNB
         NIpOZ2Uj5iNN3VG01r8GouWOt8m7WbyNsf+pk/hB9BobYhPitEYlTfF3KYkOSIFt0IeF
         KExJaI5UyBzRHSal8++/ZUvK/O+iz1UhKVZsS11mNANFILKtRpnJsQvDD3sn4OGqIRoG
         GPpE7v9nHDWbby5x/ZtvaA6wfZF4ohbvy3tMasdCKerVzTQRnn1iGa+eOAc/Z9PCch2N
         occg4HEz7QuNTfDQiTvBZwfAcA2hLSzgtob0ix59qVprXbPEow0sPAyW6M3CYWjQ47cL
         a/ng==
X-Forwarded-Encrypted: i=1; AJvYcCUCDQo5eTxY+B76nb2Ukqzr6rt2QyQl7jH6yFJFDzv8tpEq0k+lj7NFFGVmffGExFTccR3QfjieBrQKHC4TIwtpqwoVLZyI3Nzj5TpvfcMp
X-Gm-Message-State: AOJu0YxY8hVpZGO+Jn8YGXzw7rqSon1uZpjOqw8/yhxiWfuF4sJK321B
	SxGJqgTiInXDn6tX6zDjENvrI7qo6iBwxLEECHvZmQO9BTFoflVDtjp7ntL0w5cG81Tz/Nm8/Jh
	qwbEzoHbD3gUOvcY23BZdT0cpdG21RhC4fAzhDA==
X-Google-Smtp-Source: AGHT+IE+UAUPCSg5o/PrsQAcGrTsJf88kKmlwJBozqCvIfVtKdOiN8DWNHUTp+k6166aKqtWYTGV5HUAsA0LSDNfteY=
X-Received: by 2002:a05:6e02:1a26:b0:365:b614:5cb4 with SMTP id
 g6-20020a056e021a2600b00365b6145cb4mr1105311ile.29.1710226303335; Mon, 11 Mar
 2024 23:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
 <Zen8qGzVpaOB_vKa@google.com> <CAAhSdy2Mu08RsBM+7FMjkcV49p9gOj3UKEoZnPAVk92e_3q=sw@mail.gmail.com>
 <ZesxeoyFZUeo-Z9F@google.com> <6091398f-a2b3-4dc9-9f33-d7459a0a9594@redhat.com>
In-Reply-To: <6091398f-a2b3-4dc9-9f33-d7459a0a9594@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Mar 2024 12:21:31 +0530
Message-ID: <CAAhSdy2XEwtn47E5R93gGYHvDv5J0NSWXWyrmhe_kjQAw79N_w@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.9
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_235145_317752_CE31B28B 
X-CRM114-Status: GOOD (  20.10  )
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgNzo0MOKAr1BNIFBhb2xvIEJvbnppbmkgPHBib256aW5p
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gMy84LzI0IDE2OjQwLCBTZWFuIENocmlzdG9waGVy
c29uIHdyb3RlOgo+ID4gWW91J3JlIG1pc3NpbmcgdGhlIHBvaW50LiAgSSBkb24ndCBjYXJlIHdo
ZW4gcGF0Y2hlcyBsYW5kIGluIHRoZSBSSVNDLVYgdHJlZSwgbm9yCj4gPiBkbyBJIGNhcmUgdGhh
dCB5b3UgbWFkZSBhIGxhc3QgbWludXRlIHR3ZWFrIHRvIGZpeCBhIGJ1Zy4gIEkgY2FyZSB3aGVu
IGNvbW1pdHMKPiA+IHNob3cgdXAgaW4gbGludXgtbmV4dCwgYW5kKm5vbmUqICBvZiB0aGVzZSBj
b21taXRzIHdlcmUgaW4gbGludXgtbmV4dCB1bnRpbAo+ID4geWVzdGVyZGF5Lgo+ID4KPiA+ICAg
ICQgZ2l0IHRhZyAtbCAtLWNvbnRhaW5zIDJjNWFmMWM4NDYwMzc2NzUxZDU3YzUwYWY4OGEwNTNh
M2I4Njk5MjYKPiA+ICAgIG5leHQtMjAyNDAzMDcKPiA+ICAgIG5leHQtMjAyNDAzMDgKPiA+Cj4g
PiBUaGUqZW50aXJlKiAgcHVycG9zZSBvZiBsaW51eC1uZXh0IGlzIHRvIGludGVncmF0ZSphbGwq
ICB3b3JrIGRlc3RpbmVkIGZvciB0aGUKPiA+IG5leHQga2VybmVsIGludG8gYSBzaW5nbGUgdHJl
ZSwgc28gdGhhdCBjb25mbGljdHMsIGJ1Z3MsIGV0Yy4gY2FuIGJlIGZvdW5kIGFuZAo+ID4gZml4
ZWQqYmVmb3JlKiAgdGhlIG5leHQgbWVyZ2Ugd2luZG93Lgo+Cj4gSW5kZWVkLCBhbmQgdGhpcyBp
cyBtb3JlIGltcG9ydGFudCBhcyBtb3JlIHdvcmsgaXMgcm91dGVkIHRvd2FyZHMKPiBkaWZmZXJl
bnQgdHJlZXMuICBBdCB0aGlzIHBvaW50IHdlIGhhdmUgNSBtb3JlIG9yIGxlc3MgYWN0aXZlCj4g
YXJjaGl0ZWN0dXJlcywgYW5kIGVzcGVjaWFsbHkgaW4gc2VsZnRlc3RzIGxhbmQgaXQncyBpbXBv
cnRhbnQgdG8KPiBjb29yZGluYXRlIHdpdGggZWFjaCBvdGhlci4KPgo+IEFudXAsIGlkZWFsbHks
IHdoZW4geW91IHNheSB0aGF0IGEgcGF0Y2ggaXMgInF1ZXVlZCIgaXQgc2hvdWxkIG9ubHkgYmUg
YQo+IHNob3J0IHRpbWUgYmVmb3JlIHlvdSdyZSByZWFkeSB0byBzZW5kIGl0IHRvIG1lIC0gYW5k
IHRoYXQgbWVhbnMgcHV0dGluZwo+IGl0IGluIGEgcGxhY2Ugd2hlcmUgbGludXgtbmV4dCBwaWNr
cyBpdCB1cC4gIEZvciB4ODYgSSBnZW5lcmFsbHkgY29tcGlsZQo+IHRlc3QgYW5kIHJ1biBrdm0t
dW5pdC10ZXN0cyBvbiBvbmUgb2YgSW50ZWwgb3IgQU1ELCBhbmQgbGVhdmUgdGhlCj4gcmVtYWlu
aW5nIHRlc3RzIGZvciBsYXRlciAoYmVjYXVzZSB0aGV5IHRha2UgYSBkYXkgb3IgdHdvKSwgYnV0
IGluCj4gZ2VuZXJhbCBpdCdzIGEgbWF0dGVyIG9mIGRheXMgYmVmb3JlIGxpbnV4LW5leHQgZ2V0
IHRoZSBwYXRjaGVzLgo+CgpDdXJyZW50bHksIEkgd2FzIGNvbGxlY3RpbmcgcGF0Y2hlcyBpbiB0
aGUgcXVldWUgYW5kIGFsbG93aW5nIHBlb3BsZQooaW5jbHVkaW5nIG15c2VsZikgdG8gdGVzdCB0
aGUgcXVldWUgZm9yIGEgbG9uZ2VyIHRpbWUgYW5kIHVwZGF0aW5nCiJuZXh0IiBicmFuY2ggb25s
eSBhIGNvdXBsZSBvZiB3ZWVrcyBiZWZvcmUgSSBzZW5kIFBSLgoKR29pbmcgZm9yd2FyZCwgSSB3
aWxsIGZvbGxvdyB5b3VyIHN1Z2dlc3Rpb24uIFRoaXMgbWVhbnMgb25jZSBhCnNlcmllcyBpcyB0
ZXN0ZWQgb24gcXVldWUsIEkgd2lsbCBtb3ZlIGl0IHRvIHRoZSAibmV4dCIgYnJhbmNoIHNvb25l
cgpzbyB0aGF0ICJsaW51eC1uZXh0IiBwaWNrcyBpdCBzb29uZXIuCgpSZWdhcmRzLApBbnVwCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
