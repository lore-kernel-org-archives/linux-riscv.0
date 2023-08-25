Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784B1C3DA6F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 08:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xl6XlSU+HrzIdohJsoZ9S69zWs6zRkkWccUj3IEkvIo=; b=jj69zOScJyTcnG
	QIX/KBl4B2NDs50+esyV14bUBNc1A4Q6Skpj2fX/hRAytgDq4KqZpyxY0VZxMVQAHurWs+ItKuVkK
	ZVKjGmu09Yfkk1sIBQE4yl1tOzQ1BwMTN/ptK6M3+7VS7lFknBUDIzJvpgqb9xzQXZiNfbyvIqYj5
	Le+nJIvxwt8NfN48v9RDsRh18hi7Xief/VRyBeGyxJdgQd4y/dOcOWYmkQFbrWyvv+/WbaJQHJQlk
	0QtlOa8Ynfxr19vWLJfiRVJdp6PZeVIZndJFXkKG10BGuWQ0k8gw1Ra1oyqhA2w7+tyezIBF0B/cf
	RmGDqe4EdiX/GrWvzRIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRzo-004cLy-1H;
	Fri, 25 Aug 2023 08:16:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRzk-004cKx-2l
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 08:16:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401b0d97850so5549675e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Aug 2023 01:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1692951398; x=1693556198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QarG4D38hejgpRnSoszhs3a63Lzs4eQsWlAcm288Byk=;
        b=SsewulCt2Pc7EMM4EB+kWAAQsOzV4coQxJuejETJvl61nTNWAe9AIN8dsfWmodOhdp
         mYRo5Q1rKMqayxVK+zsxdnCGRkVWeh/zUqra3G4s0o3p28IJLP6jxqzR4S79MJIgxH6U
         4GF126GW7MZpz7K5JJ7CFyVNHF4Y+WTy1QlxB34+Ut/zC2JAZi2Nga1f1XXKBE5FLkBw
         7FOxnNpIfOA95cLJ/x5PopEiCeHDlRqrFc1A2QEt20XTS4HVtRvNS1Ck+XlpIWbJjxTw
         cew9m7iuAMCZd5A3BOczwItc/FWcua8jtpmA8FYJhr6zFWkMttX20vBUlml2l9ik0grv
         5PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692951398; x=1693556198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QarG4D38hejgpRnSoszhs3a63Lzs4eQsWlAcm288Byk=;
        b=NSL+/4V4DkE3KI7EN1Sxy5q5N0HtjX+PzndwEX6Mwf7TEbuQoX92kYlX3ghyJaIhHF
         26FHOwDQekluKgoT16oULeSQ7qveMWDegLvm5pyGqdDtUPfvEkmgU6W5uxdlPekdq/TP
         BMQvZagwgCxbF3JUi4LI1frApO6rtqUZWhAyOQVS8/aaqvqBn5EU3wTRQzp0FGakStLO
         AFSmsXUnFEBWCPJynMkrpwpb17knMlulXZ5eTTr/BPYLHdleherN4c4IvYReAsuhhg7t
         AKnZp96X7YIi1Btw+6+IwL6QXxc/URTizYxHZLSiKDh4lDidcJGMgBuTnfRQJzmsB3Yw
         ZpAw==
X-Gm-Message-State: AOJu0YwNpjtF70I/sqt8Bg+AYrLB4tmvHGvb3E/za1iDOkEhOCgsJ+Nn
	I1hw+pinfQids3p6uM6QYNv3ig==
X-Google-Smtp-Source: AGHT+IHMBAQvzVNGufdhNhZVxd3pJA0HX/bQ3/nJpvxpmlK7f8hrq7Gl7fk4p8ovvvBQEZzI7M1xmg==
X-Received: by 2002:a05:600c:204b:b0:3fe:d952:98fb with SMTP id p11-20020a05600c204b00b003fed95298fbmr13665161wmg.8.1692951398090;
        Fri, 25 Aug 2023 01:16:38 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c511200b003fe24df4182sm2329978wms.1.2023.08.25.01.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:16:37 -0700 (PDT)
Date: Fri, 25 Aug 2023 10:16:36 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230825-374a82446ed3eea02fcb41e6@orel>
References: <20230711201831.2695097-1-evan@rivosinc.com>
 <20230824-factual-jawed-2dddd2cf2bdd@wendy>
 <CALs-Hss51fQE1yxe1Y1T86X+OfjPaAd386vosQ8gzRm=Njm1gw@mail.gmail.com>
 <20230824-exploit-spectacle-ecedd91e9075@spud>
 <CALs-HssqaOjvUOdBVn=oN+uzkkmjguys2UttTYgdcqJwJB0HnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HssqaOjvUOdBVn=oN+uzkkmjguys2UttTYgdcqJwJB0HnQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_011640_933227_184E5AA3 
X-CRM114-Status: GOOD (  28.83  )
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

T24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMDM6MDY6NTNQTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBUaHUsIEF1ZyAyNCwgMjAyMyBhdCAxMDoyOeKAr0FNIENvbm9yIERvb2xleSA8Y29u
b3JAa2VybmVsLm9yZz4gd3JvdGU6Ci4uLgo+ID4gRG8geW91IHdhbnQgdG8gaGF2ZSB0aGlzIG5l
dyB0aGluZyBpbiBjcHVpbmZvIHRlbGwgdGhlIHVzZXIgInRoaXMgaGFydAo+ID4gaGFzIHh5eiBl
eHRlbnNpb25zIHRoYXQgYXJlIHN1cHBvcnRlZCBieSBhIGtlcm5lbCwgYnV0IG1heWJlIG5vdCB0
aGlzCj4gPiBrZXJuZWwiIG9yIHRvIHRlbGwgdGhlIHVzZXIgInRoaXMgaGFydCBoYXMgeHl6IGV4
dGVuc2lvbnMgdGhhdCBhcmUKPiA+IHN1cHBvcnRlZCBieSB0aGlzIGtlcm5lbCI/IFlvdXIgdGV4
dCBhYm92ZSBzYXlzICJ1bmRlcnN0b29kIGJ5IHRoZQo+ID4ga2VybmVsIiwgYnV0IEkgdGhpbmsg
dGhhdCdzIGEgcG9vciBkZWZpbml0aW9uIHRoYXQgbmVlZHMgdG8gYmUgaW1wcm92ZWQKPiA+IHRv
IHNwZWxsIG91dCBleGFjdGx5IHdoYXQgeW91IG1lYW4uIElPVyBkb2VzICJ1bmRlcnN0b29kIiBt
ZWFuIHRoZQo+ID4ga2VybmVsIHdpbGwgcGFyc2UgdGhlbSBpbnRvIGEgc3RydWN0dXJlLCBvciBk
b2VzIGl0IG1lYW4gInllcyB5b3UgY2FuCj4gPiB1c2UgdGhpcyBleHRlbnNpb24gb24gdGhpcyBw
YXJ0aWN1bGFyIGhhcnQiLgo+IAo+IEknbSBpbWFnaW5pbmcgL3Byb2MvY3B1aW5mbyBiZWluZyBj
bG9zZXIgdG8gInRoZSBDUFUgaGFzIGl0IGFuZCB0aGUKPiBrZXJuZWwgYXQgbGVhc3QgdmFndWVs
eSB1bmRlcnN0YW5kcyBpdCwgYnV0IG1heSBub3QgaGF2ZSBmdWxsIHN1cHBvcnQKPiBmb3IgaXQg
ZW5hYmxlZCIuIEknbSBhc3N1bWluZyAvcHJvYy9jcHVpbmZvIGlzIG1vc3RseSB1c2VkIGJ5IDEp
Cj4gaHVtYW5zIHdhbnRpbmcgdG8ga25vdyBpZiB0aGV5IGhhdmUgaGFyZHdhcmUgc3VwcG9ydCBm
b3IgYSBmZWF0dXJlLAo+IGFuZCAyKSBhZG1pbmlzdHJhdG9ycyBjb2xsZWN0aW5nIHRlbGVtZXRy
eSB0byBtYW5hZ2UgZmxlZXRzIChpZSBkbyBJCj4gaGF2ZSBhbnkgaGFyZHdhcmUgZGVwbG95ZWQg
dGhhdCBzdXBwb3J0cyBYKS4KCklzICgyKSBhIHNwZWNpYWwgY2FzZSBvZiAoMSk/IChJIHdhbnQg
dG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFuZCBhbGwgdGhlCmNhc2VzLikKCj4gUHJvZ3JhbW1lcnMg
bG9va2luZyB0bwo+IHNlZSAiaXMgdGhlIGtlcm5lbCBzdXBwb3J0IGZvciB0aGlzIGZlYXR1cmUg
cmVhZHkgcmlnaHQgbm93IiB3b3VsZAo+IGlkZWFsbHkgbm90IGJlIHBhcnNpbmcgL3Byb2MvY3B1
aW5mbyB0ZXh0LCBhcyBtb3JlIGRpcmVjdCBtZWNoYW5pc21zCj4gbGlrZSBzcGVjaWZpYyBod3By
b2JlIGJpdHMgZm9yICJhbSBJIGZ1bGx5IHJlYWR5IHRvIGdvIiB3b3VsZCBiZQo+IGVhc2llciB0
byB3b3JrIHdpdGguIEZlZWwgZnJlZSB0byB5ZWxsIGF0IG1lIGlmIHRoaXMgb3ZlcmFsbCB2aXNp
b24KPiBzZWVtcyBmbGF3ZWQuCj4gCj4gSSB0cmllZCB0byBsb29rIHRvIHNlZSBpZiB0aGVyZSB3
YXMgY29uc2Vuc3VzIGFtb25nIHRoZSBvdGhlcgo+IGFyY2hpdGVjdHVyZXMuIEFhcmNoNjQgc2Vl
bXMgdG8gZ28gd2l0aCAic3VwcG9ydGVkIGFuZCBmdWxseSBlbmFibGVkIiwKPiBhcyB0aGVpciBj
cHVfaGFzX2ZlYXR1cmUoKSBkaXJlY3RseSB0ZXN0cyBlbGZfaHdjYXAsIGFuZCBlbGVtZW50cyBp
bgo+IGFybTY0X2VsZl9od2NhcHNbXSBhcmUgS2NvbmZpZyBnYXRlZC4gWDg2IGlzIGNvbXBsaWNh
dGVkLCBidXQgSUlSQyBpcwo+IG1vcmUgYWxvbmcgdGhlIGxpbmVzIG9mICJoYXJkd2FyZSBoYXMg
aXQiLiBUaGV5IGhhdmUgdHdvIG1hY3JvcywKPiBjcHVfaGFzKCkgZm9yICJyYXcgY2FwYWJpbGl0
eSIgYW5kIGNwdV9mZWF0dXJlX2VuYWJsZWQoKSBmb3IgImtlcm5lbAo+IGNhbiBkbyBpdCB0b28i
LCBhbmQgdGhleSB1c2UgY3B1X2hhcygpIGZvciAvcHJvYy9jcHVpbmZvIGZsYWdzLgo+CgpJJ2Qg
bGVhbiBtb3JlIHRvd2FyZHMgdGhlIHdheSBBQXJjaDY0IGdvZXMsIGJlY2F1c2UsIHVubGVzcyAv
cHJvYy9jcHVpbmZvCmlzIGp1c3QgYSBibGluZCByZWd1cmdpdGF0aW9uIG9mIGFuIGlzYSBzdHJp
bmcgZnJvbSBEVCAvIEFDUEksIHRoZW4gdGhlCmtlcm5lbCBtdXN0IGF0IGxlYXN0IGtub3cgc29t
ZXRoaW5nIGFib3V0IGl0LiBBZHZlcnRpc2luZyBhIGZlYXR1cmUgd2hpY2gKaXMga25vd24sIGJ1
dCBhbHNvIGtub3duIG5vdCB0byB3b3JrLCBzZWVtcyBvZGQgdG8gbWUuIFNvIG15IHZvdGUgaXMg
dGhhdApvbmx5IGZlYXR1cmVzIHdoaWNoIGFyZSBwcmVzZW50IGFuZCBlbmFibGVkIGluIHRoZSBr
ZXJuZWwgb3IgcHJlc2VudCBhbmQKbm90IG5lY2Vzc2FyeSB0byBiZSBlbmFibGVkIGluIHRoZSBr
ZXJuZWwgaW4gb3JkZXIgZm9yIHVzZXJzcGFjZSBvcgp2aXJ0dWFsIG1hY2hpbmVzIHRvIHVzZSBi
ZSBhZHZlcnRpc2VkIGluIC9wcm9jL2NwdWluZm8uCgpXZSBzdGlsbCBoYXZlIFNNQklPUyAoZG1p
ZGVjb2RlKSB0byBibGluZGx5IGR1bXAgd2hhdCB0aGUgaGFyZHdhcmUKc3VwcG9ydHMgZm9yIGNh
c2VzICgxKSBhbmQgKDIpIGFib3ZlLgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
