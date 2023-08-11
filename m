Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CC7EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yZsNbW4XKEyUOgAffsi6ATW0NIedhZ5Gc21hG4mKfKI=; b=KEP9P/NioJzukv4Cehl9xHu0ju
	4IXKZZ49pg9rtnX6PYhY+OoT0RJVj86viI9Fc5aDm8W2rFo1wD35r9qlfgwOmveeMRB0skSbiODQT
	OGTI1b2c4ATK7TQ94jyXjMwrEZFIP6d9PCYdt106CKIVUlKg8zZtcNRujk/hPk0nJmwwp523rson+
	FH1qUKucx65LyZ4ZxwlErelqDuewetp0eiyXvv8fAOxULPtQLGJue8Lle7KuUO18P2iLq4w+umHd/
	QzHu0PLCEFKMsNWIV1Osimfy8zmywcPDtk1j8/YebpReImwxSR/B5QtXbp2y+9Akpz5bbr9iiYlhM
	nibN+kJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUWBO-00BGaV-0F;
	Fri, 11 Aug 2023 17:44:18 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUWBL-00BGYS-1p
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 17:44:16 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-583d1d0de65so26422187b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691775853; x=1692380653;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5tf/etP9591sBoXXP0u0lhmE2sGhQYCIj4rXej+PgY=;
        b=z4avZMYBxF/USDP2G14KA+P8N8yreov1u2JOHwfc1TVZdl6Iz+YTKH19wDx7mUMq9M
         o4u6qon1QiMk8DVxh93qeN2Mz6fZGsUFtzOg33bB4Mo7KFsOypRjJRdzz9Y8WFCiY85q
         br+fPgBO/on1YU5soxnymBtm9OPZyICHaFKZfYSg9Ropko2mo0wKLVwIok1lVrWFw51i
         jjhtl/HK+nEz+jNhJe7imTF+VBA6+NGFZjFm7+hHqXCkfP3+rYY1oaYSypJ0v6009kFT
         lq7bEwknPOhWjDhET6YMFrJ/3n1YTZ5hf1bP/IHZB/5/XDyHPzuDGnqfF1kEhe1cc6AD
         1nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691775853; x=1692380653;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y5tf/etP9591sBoXXP0u0lhmE2sGhQYCIj4rXej+PgY=;
        b=HDBZo1Dao3lNTiIDbH4XuWaQld87Brs3uUxxEEtXA82g81a/25KVwTkhJgxhwv/+it
         o4uUE41szwEbYYax9S2CHr0LiXtPVhVB+0ytgliw9jtnUmPD6E3WZ1BmA/2GntkY7YDg
         /p6+TdZVTAzRgu6+FqvFiZLuoileIosPjo62dRcllirDhHCRO89PbnoAolOGSu9Ecz0d
         XBVbAbJjGVfikdyshgqiRLziURVgqm7SjNWIf2xOr1CpNQ9OPX1F1uDPn2JnUMN7Xj1y
         0sCN0fvHWH0RqXB2iB0cV4m6JAPtN1Iqs4RPguBJyUtkkeZEvGjhDVsIrItshyVgliQt
         Vh+w==
X-Gm-Message-State: AOJu0Ywz2ze+V8V+zPke1/CApcsX/45A71UY4djytqw1S727vD0JGzxW
	6lAfmNfw8BD3oUsYvjnPRS0vlohZG40=
X-Google-Smtp-Source: AGHT+IFlh+eXwF8rMcD2luIRCX1nl8Idt0F+6stO6hsWWfidj415wHUgqoJc8kVAwNGB8y2mQW1tGjk2lPA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:7443:0:b0:d20:7752:e384 with SMTP id
 p64-20020a257443000000b00d207752e384mr41859ybc.3.1691775853469; Fri, 11 Aug
 2023 10:44:13 -0700 (PDT)
Date: Fri, 11 Aug 2023 10:44:11 -0700
In-Reply-To: <CAGtprH9YE50RtqhW-U+wK0Vv6aKfqqtOPn8q4s8or=UZwPXZoA@mail.gmail.com>
Mime-Version: 1.0
References: <20230718234512.1690985-13-seanjc@google.com> <diqzv8dq3116.fsf@ackerleytng-ctop.c.googlers.com>
 <ZNKv9ul2I7A4V7IF@google.com> <CAGtprH9YE50RtqhW-U+wK0Vv6aKfqqtOPn8q4s8or=UZwPXZoA@mail.gmail.com>
Message-ID: <ZNZza/emWldkJC6X@google.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, pbonzini@redhat.com, maz@kernel.org, 
	oliver.upton@linux.dev, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, willy@infradead.org, akpm@linux-foundation.org, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chao.p.peng@linux.intel.com, tabba@google.com, jarkko@kernel.org, 
	yu.c.zhang@linux.intel.com, mail@maciej.szmigiero.name, vbabka@suse.cz, 
	david@redhat.com, qperret@google.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_104415_610995_332C078E 
X-CRM114-Status: GOOD (  20.57  )
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

T24gVGh1LCBBdWcgMTAsIDIwMjMsIFZpc2hhbCBBbm5hcHVydmUgd3JvdGU6Cj4gT24gVHVlLCBB
dWcgOCwgMjAyMyBhdCAyOjEz4oCvUE0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2ds
ZS5jb20+IHdyb3RlOgo+ID4gLi4uCj4gCj4gPiA+ICsgV2hlbiBiaW5kaW5nIGEgbWVtc2xvdCB0
byB0aGUgZmlsZSwgaWYgYSBrdm0gcG9pbnRlciBleGlzdHMsIGl0IG11c3QKPiA+ID4gICBiZSB0
aGUgc2FtZSBrdm0gYXMgdGhlIG9uZSBpbiB0aGlzIGJpbmRpbmcKPiA+ID4gKyBXaGVuIHRoZSBi
aW5kaW5nIHRvIHRoZSBsYXN0IG1lbXNsb3QgaXMgcmVtb3ZlZCBmcm9tIGEgZmlsZSwgTlVMTCB0
aGUKPiA+ID4gICBrdm0gcG9pbnRlci4KPiA+Cj4gPiBOdWxsaWZ5aW5nIHRoZSBLVk0gcG9pbnRl
ciBpc24ndCBzdWZmaWNpZW50LCBiZWNhdXNlIHdpdGhvdXQgYWRkaXRpb25hbCBhY3Rpb25zCj4g
PiB1c2Vyc3BhY2UgY291bGQgZXh0cmFjdCBkYXRhIGZyb20gYSBWTSBieSBkZWxldGluZyBpdHMg
bWVtc2xvdHMgYW5kIHRoZW4gYmluZGluZwo+ID4gdGhlIGd1ZXN0X21lbWZkIHRvIGFuIGF0dGFj
a2VyIGNvbnRyb2xsZWQgVk0uICBPciBtb3JlIGxpa2VseSB3aXRoIFREWCBhbmQgU05QLAo+ID4g
aW5kdWNlIGJhZG5lc3MgYnkgY29lcmNpbmcgS1ZNIGludG8gbWFwcGluZyBtZW1vcnkgaW50byBh
IGd1ZXN0IHdpdGggdGhlIHdyb25nCj4gPiBBU0lEL0hLSUQuCj4gPgo+IAo+IFREWC9TTlAgaGF2
ZSBtZWNoYW5pc21zIGkuZS4gUEFNVC9STVAgdGFibGVzIHRvIGVuc3VyZSB0aGF0IHRoZSBzYW1l
Cj4gbWVtb3J5IGlzIG5vdCBhc3NpZ25lZCB0byB0d28gZGlmZmVyZW50IFZNcy4KCk9uZSBvZiB0
aGUgbWFpbiByZWFzb25zIHdlIHBpdm90ZWQgYXdheSBmcm9tIHVzaW5nIGEgZmxhZyBpbiAic3Ry
dWN0IHBhZ2UiIHRvCmluZGljYXRlIHRoYXQgYSBwYWdlIHdhcyBwcml2YXRlIHdhcyBzbyB0aGF0
IEtWTSBjb3VsZCBlbmZvcmNlIDE6MSBWTTpwYWdlIG93bmVyc2hpcAoqd2l0aG91dCogcmVseWlu
ZyBvbiBoYXJkd2FyZS4KCkFuZCBGV0lXLCB0aGUgUEFNVCBwcm92aWRlcyBubyBwcm90ZWN0aW9u
IGluIHRoaXMgc3BlY2lmaWMgY2FzZSBiZWNhdXNlIEtWTSBkb2VzClRESC5NRU0uUEFHRS5SRU1P
VkUgd2hlbiB6YXBwaW5nIFMtRVBUIGVudHJpZXMsIGFuZCB0aGF0IG1hcmtzIHRoZSBwYWdlIGNs
ZWFyIGluCnRoZSBQQU1ULiAgVGhlIGRhbmdlciB0aGVyZSBpcyB0aGF0IHBoeXNpY2FsIG1lbW9y
eSBpcyBzdGlsbCBlbmNyeXB0ZWQgd2l0aCB0aGUKZ3Vlc3QncyBIS0lELCBhbmQgc28gbWFwcGlu
ZyB0aGUgbWVtb3J5IGludG8gYSBkaWZmZXJlbnQgVk0sIHdoaWNoIG1pZ2h0IG5vdCBiZQphIFRE
WCBndWVzdCEsIGNvdWxkIGxlYWQgdG8gY29ycnVwdGlvbiBhbmQvb3IgcG9pc29uICNNQ3MuCgpU
aGUgSEtJRCBpc3N1ZXMgd291bGRuJ3QgYmUgYSBwcm9ibGVtIGlmIHYxNSBpcyBtZXJnZWQgYXMt
aXMsIGJlY2F1c2UgemFwcGluZwpTLUVQVCBlbnRyaWVzIGFsc28gZnVsbHkgcHVyZ2VzIGFuZCBy
ZWNsYWltcyB0aGUgcGFnZSwgYnV0IGFzIHdlIGRpc2N1c3NlZCBpbgpvbmUgb2YgdGhlIG1hbnkg
dGhyZWFkcywgcmVjbGFpbWluZyBwaHlzaWNhbCBtZW1vcnkgc2hvdWxkIGJlIHRpZWQgdG8gdGhl
IGlub2RlLAppLmUuIHRvIG1lbW9yeSB0cnVseSBiZWluZyBmcmVlZCwgYW5kIG5vdCB0byBTLUVQ
VHMgYmVpbmcgemFwcGVkLiAgQW5kIHRoZXJlIGlzCmEgdmVyeSBnb29kIHJlYXNvbiBmb3Igd2Fu
dGluZyB0byBkbyB0aGF0LCBhcyBpdCBhbGxvd3MgS1ZNIHRvIGRvIHRoZSBleHBlbnNpdmUKY2Fj
aGUgZmx1c2ggKyBjbGVhciBvdXRzaWRlIG9mIG1tdV9sb2NrLgoKPiBEZWxldGluZyBtZW1zbG90
cyBzaG91bGQgYWxzbyBjbGVhciBvdXQgdGhlIGNvbnRlbnRzIG9mIHRoZSBtZW1vcnkgYXMgdGhl
IEVQVAo+IHRhYmxlcyB3aWxsIGJlIHphcHBlZCBpbiB0aGUgcHJvY2VzcwoKTm8sIGRlbGV0aW5n
IGEgbWVtc2xvdCBzaG91bGQgbm90IGNsZWFyIG1lbW9yeS4gIEFzIEkgc2FpZCBpbiBteSBwcmV2
aW91cyByZXNwb25zZSwKdGhlIGZhY3QgdGhhdCB6YXBwaW5nIFMtRVBUIGVudHJpZXMgaXMgZGVz
dHJ1Y3RpdmUgaXMgYSBsaW1pdGlhdGlvbiBvZiBURFgsIG5vdCBhCmZlYXR1cmUgd2Ugd2FudCB0
byBhcHBseSB0byBvdGhlciBWTSB0eXBlcy4gIEFuZCB0aGF0J3Mgbm90IGV2ZW4gYSBmdW5kYW1l
bnRhbApwcm9wZXJ0eSBvZiBURFgsIGUuZy4gVERYIGNvdWxkIHJlbW92ZSB0aGUgbGltaXRhdGlv
biwgYXQgdGhlIGNvc3Qgb2YgY29uc3VtaW5nCnF1aXRlIGEgYml0IG1vcmUgbWVtb3J5LCBieSB0
cmFja2luZyB0aGUgZXhhY3Qgb3duZXIgYnkgSEtJRCBpbiB0aGUgUEFNVCBhbmQKZGVjb3VwbGlu
ZyBTLUVQVCBlbnRyaWVzIGZyb20gcGFnZSBvd25lcnNoaXAuCgpPciBpbiB0aGVvcnksIEtWTSBj
b3VsZCB3b3JrYXJvdW5kIHRoZSBsaW1pdGF0aW9uIGJ5IG9ubHkgZG9pbmcgVERILk1FTS5SQU5H
RS5CTE9DSwp3aGVuIHphcHBpbmcgUy1FUFRzLiAgSG1tLCB0aGF0IG1pZ2h0IGFjdHVhbGx5IGJl
IHdvcnRoIGxvb2tpbmcgYXQuCgo+IGFuZCB0aGUgaG9zdCB3aWxsIHJlY2xhaW0gdGhlIG1lbW9y
eS4KClRoZXJlIGFyZSBubyBndWFyYW50ZWVzIHRoYXQgdGhlIGhvc3Qgd2lsbCByZWNsYWltIHRo
ZSBtZW1vcnkuICBFLmcuIFFFTVUgd2lsbApkZWxldGUgYW5kIHJlLWNyZWF0ZSBtZW1zbG90cyBm
b3IgInJlZ3VsYXIiIFZNcyB3aGVuIGVtdWxhdGluZyBvcHRpb24gUk9Ncy4gIEV2ZW4KaWYgdGhh
dCB1c2UgY2FzZSBpcyBub25zZW5zaWNhbCBmb3IgY29uZmlkZW50aWFsIFZNcyAoYW5kIGl0IHBy
b2JhYmx5IGlzIG5vbnNlbnNpY2FsKSwKSSBkb24ndCB3YW50IHRvIGRlZmluZSBLVk0ncyBBQkkg
YmFzZWQgb24gd2hhdCB3ZSAqdGhpbmsqIHVzZXJzcGFjZSB3aWxsIGRvLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
