Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF5CC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 20:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5oRV/8dluT9/joivq4O5gwAC08DRGT5PIhsNwwkWw8=; b=RNjK24zqmE0N3e
	whWi/IP+NAc7qg8IbmmmJRZr9AKZfgUrvBU1ae67K1NR4kMINVIhQqLrBGh98uqGP9TpEFRG8uq6Z
	M4CNti0z1e2TqfCSkdYSc46X2MiNsdwh271Vpx1Iz5TNyHXk5OyzWMJ8wNF89omKejAL6XsUNTY1F
	OJzMAgr5jXE4IqzEfT992ZZOSKjG3t/mZiylMiUdIxXyZKP2ZzNiBY3wGqb59s6JXkhcJFUjxL5S7
	piEhZ1Tx5Nf8Ie5HVjSIsCbHqrFVarJS0Axq+T21VqbbPX+JFDy4l1oYQnHixcIT9lvlg1hweNEuG
	L3jPnzW8gg9Adux9QzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Hjt-0006WJ-36;
	Thu, 25 May 2023 20:39:13 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Hjp-0006UU-2w;
	Thu, 25 May 2023 20:39:12 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-ba8afcc82c0so190275276.2;
        Thu, 25 May 2023 13:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685047145; x=1687639145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbD1OYIGibvwFMRrdJMTdc4wGgHOsGEW6NjvtgF3JXU=;
        b=hsCL+sMjCSPEeQwY9ipI1+Ugi88AzJEwmAmsO1IR16vD0JLbTTRj1EWY5Xyhze+GRV
         OIRanM33HOk1xRjR7/GHHUD5lVS6HFpcFxeDfzeE8/I0OcBZz8czUxvwLPGCPl3ZI/jZ
         DVqHoFaNkDaMUMuSYvpfhlO6EV7GylFCaeIZ84F6j+93L973raF6hD3O66C/pZ4eWLz+
         QLbFT/lbaOp/9U1+H051UFvXelrd7lzOtz3vj1HsEWe84ksN1HTRbSJYJedE8uZu9k6u
         F1jI+oM85Ujez7vT22bFzFiXTlvVTKRouPJkd38Xldm/McWaSi1VxP376ACeyocGF45q
         tGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685047145; x=1687639145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VbD1OYIGibvwFMRrdJMTdc4wGgHOsGEW6NjvtgF3JXU=;
        b=SvLD75OCaVSNlcQhfBJPHn+QgdlVCHSPUtGOSd2nV9L0UJBQ2SL1nMMtOanPaDZMl5
         NfAC2PlSjl6uwJTlrnwgZu/xK0jLYexcWlprYSLeqIpf+AY5DnMtHJy2wIObVb/kFO6o
         JfPw/QmXq70/Mu68PZF9BsCi4X+8+QgQtNAb0r1b4/5UECzc9Fejob4+N2M2GkPjSAJE
         Sc/6funRRotQRMEzgXvIKEUvtVyQDe/HZOh/wHJpwyX7rjroD6jXv+PO5W2fISzHVHNN
         UN8WYNlNU8OGYAzu1ogBZR5b7OI9fXfxHeQKRzHAZMNTw84bsiM/xenQxwuEOuspuc8R
         kcMg==
X-Gm-Message-State: AC+VfDzqVmqlAEVL4pjkUtncFxQCIUxDIY7LtbqvTm2V/s807qx5HkZZ
	DipmYETg+qrgJbguOYBlBUL3ZGjkOeksPX4ge4U=
X-Google-Smtp-Source: ACHHUZ4OcPsUwJDpZZlKfNKbpYbRuRkX6Q4UETTfFRyNyytwfdAtGP02e8IuqJSt1+a/7sd0aU+yePVkYawV73NLE1o=
X-Received: by 2002:a25:d111:0:b0:ba8:4b48:1de0 with SMTP id
 i17-20020a25d111000000b00ba84b481de0mr4810389ybg.47.1685047145065; Thu, 25
 May 2023 13:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com> <20230525085555.GV4967@kernel.org>
 <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com> <20230525202011.GZ4967@kernel.org>
In-Reply-To: <20230525202011.GZ4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 13:38:54 -0700
Message-ID: <CAOzc2pzGPBYL3S=noc1AAEtep04GexRmn2f_T3BPgVFZKaqXTg@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_133909_945627_61C3D60C 
X-CRM114-Status: GOOD (  15.34  )
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

T24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMToyMOKAr1BNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1heSAyNSwgMjAyMyBhdCAxMDowMDoyM0FNIC0w
NzAwLCBWaXNoYWwgTW9vbGEgd3JvdGU6Cj4gPiBPbiBUaHUsIE1heSAyNSwgMjAyMyBhdCAxOjU2
4oCvQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4g
SGksCj4gPiA+Cj4gPiA+IE9uIE1vbiwgTWF5IDAxLCAyMDIzIGF0IDEyOjI3OjU2UE0gLTA3MDAs
IFZpc2hhbCBNb29sYSAoT3JhY2xlKSB3cm90ZToKPiA+ID4gPiBObyBmb2xpbyBlcXVpdmFsZW50
cyBmb3IgcGFnZSB0eXBlIG9wZXJhdGlvbnMgaGF2ZSBiZWVuIGRlZmluZWQsIHNvCj4gPiA+ID4g
ZGVmaW5lIHRoZW0gZm9yIGxhdGVyIGZvbGlvIGNvbnZlcnNpb25zLgo+ID4gPgo+ID4gPiBDYW4g
eW91IHBsZWFzZSBlbGFib3JhdGUgd2h5IHdvdWxkIHdlIG5lZWQgZm9saW9zIGZvciBwYWdlIHRh
YmxlIGRlc2NyaXB0b3JzPwo+ID4KPiA+IFRoYW5rcyBmb3IgdGhlIHJldmlldyEKPiA+Cj4gPiBU
aGVzZSBtYWNyb3MgYXJlIGZvciBjYWxsZXJzIHRoYXQgY2FyZSBhYm91dCB0aGUgcGFnZSB0eXBl
LCBpLmUuIFRhYmxlIGFuZAo+ID4gQnVkZHkuIEFzaWRlIGZyb20gYWNjb3VudGluZyBmb3IgdGhv
c2UgY2FzZXMsIHRoZSBwYWdlIHRhYmxlcyBkb24ndCB1c2UgZm9saW9zLgo+ID4gVGhlc2UgYXJl
IG1vcmUgZm9yIHRoZSBjbGVhbmxpbmVzcyBvZiB0aG9zZSBjYWxsZXJzLgo+Cj4gQnV0IHdoeSB1
c2luZyBmb2xpbyBBUElzIGZvciBQYWdlVHlwZSB3aWxsIGJlIGNsZWFuZXIgdGhhbiB1c2luZyBw
YWdlIEFQSXM/Cj4gRG8geW91IGhhdmUgYW4gZXhhbXBsZT8KCkFoLCBmb3IgZXhhbXBsZSBpbiBt
bS9tZW1vcnktZmFpbHVyZS5jIHRoZXJlIGFyZSBhIGNvdXBsZSB1c2VzIG9mIFBhZ2VUYWJsZS4K
TGlrZSB0aGUgbGluZSA6CmlmIChmb2xpb190ZXN0X3NsYWIoZm9saW8pIHx8IFBhZ2VUYWJsZSgm
Zm9saW8tPnBhZ2UpIHx8CmZvbGlvX3Rlc3RfcmVzZXJ2ZWQoZm9saW8pKQp3aGVyZSB0aGF0IFBh
Z2VUYWJsZSgmZm9saW8tPnBhZ2UpIGNhbiBub3cgYmUgd3JpdHRlbiBhcyBmb2xpb190ZXN0X3Rh
YmxlKGZvbGlvKQppbnN0ZWFkLgoKQWxzbyB0aGVyZSBhcmUgbnVtZXJvdXMgdXNlcyBvZiBQYWdl
QnVkZHkgaW4gbW0vY29tcGFjdGlvbi5jIHRoYXQgd2lsbApsaWtlbHkgbmVlZCB0byBiZSBjb252
ZXJ0ZWQgdG8gZm9saW9zIGFzIHdlbGwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
