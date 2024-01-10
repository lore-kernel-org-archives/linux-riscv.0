Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FD0C4707C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 15:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Ba4f+0oxd4f9pggimrvBMOIZHOBTIulXMifLCx5jjPg=; b=IMPUqGK6pNVXerMqixEI3yeVUw
	MPz4IJuuisf913hSu7PvTtdahvVyDU514rhJKppRymH9PXR8ZdPudKOlrI3WnaqbSrifByK/p8FiK
	N68Cqdlt2zlEmBYIujmAykojX0mg+UcvSJmycE1UMOZsCIrh109WdwnfDmICETRBb4bTNrTo34PlV
	uWAdkyyQJn+nZcNvZhyRp82hRSa5+GemN1sY2/Exw3otK4xlDBPTaCFhtWjCwtp+JoWoCBBmkrz+9
	OeulY8x8F/s9wvLijmo0UBPioLL2cxWUuRRYg5MKhKsc3J+pzixI0/rymTXW/QGmP1mp0LQDVH1ZG
	ZF0YJtKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNa6W-00CTwV-27;
	Wed, 10 Jan 2024 15:02:52 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNa6S-00CTsp-2t
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 15:02:50 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7bee874fcc2so73244639f.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 07:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1704898966; x=1705503766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDOhfldge8Uqi88IICO5GiWGKubqGJznCXfP/iSLXVQ=;
        b=jAqV8m72rfi+B7g/AjT+3XHf0rO71GqegBCgZzSGlq+8kMr8JuuIXMYAfP+AuJ+mgL
         cAO/CsxRzJYKHlpPoVVQkzZrhuUOMnSi77VYj9w1V4d4J7R/AINHkN1FAcmUE89Tq0np
         QQ2Atv0ypJOs66COKEwwxz45zmh6SVhQ3FLD1vJRUXUioCs+B4vm/wv9gsS99OyPlLTm
         kcGMinEV3LtubxqvsTPCIaLN0ckpqi4oBvtDvWVukxfjn2rxlQ5Li9M5Rn+0ZPc8fBis
         hO3MRsj4iK8hzK2JVdsBJMzvnpX57YnJarMqJBO5REDoL7qDpUwfNgmcVNyzKrht0BVu
         mzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898966; x=1705503766;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDOhfldge8Uqi88IICO5GiWGKubqGJznCXfP/iSLXVQ=;
        b=F+rLikbj6Mb6JiHI6+1qir/QRvO3RzcvD9OgIW9jHSFSb49gYZlVAXzy7WtJU4D8hv
         BvHjK+sufBMaZQoubNxFu+a6W/LRs0setgOfQ2gfCUIQco85Mvs0fkB9GS1tupgz2LSP
         JRvkhPgGDfe1zEAfEDr7bQUaM/fLzX869eZvsdTPbinPHHM2BdPciZj//+sFmS/z+6Bo
         qgPGlXxz+4MduMnewu1PKd03wKFPolBxaoPm58fY0HT+5sIbvSUVFeWC03LXh3yr/QMC
         TcPDSYJ0fayVPF7C7o1tzssfULI+Ajl+tp6kmpJk1b1oM8b7oEfeABP5bA3ojH8efx4x
         fS9w==
X-Gm-Message-State: AOJu0Yy6X5FJWQfY/5bJN0kkN1iwFt4KN7KzBHfCryjxlSud9XlcxbSe
	SpYq6zHuQFx7hrKIdzgpBU2uepPTu03W7g==
X-Google-Smtp-Source: AGHT+IFvEvHL/QGJUQsjQ8prybfwncXa85e57Newrz911v/jC8XZx5Wju/7qfBnNb7m++tJXIL/2NA==
X-Received: by 2002:a5e:8816:0:b0:7be:e7ef:24c0 with SMTP id l22-20020a5e8816000000b007bee7ef24c0mr930254ioj.0.1704898965675;
        Wed, 10 Jan 2024 07:02:45 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id bw10-20020a056638460a00b0046e33773c09sm1301855jab.36.2024.01.10.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 07:02:45 -0800 (PST)
Date: Wed, 10 Jan 2024 07:02:45 -0800 (PST)
X-Google-Original-Date: Wed, 10 Jan 2024 07:02:43 PST (-0800)
Subject: Re: [v9, 00/10] riscv: support kernel-mode Vector
In-Reply-To: <20240108035209.GA212605@sol.localdomain>
CC: andy.chiu@sifive.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
  charlie@rivosinc.com, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
  peterz@infradead.org, tglx@linutronix.de, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ebiggers@kernel.org
Message-ID: <mhng-667de983-8af9-47dc-8479-62d1fb661b14@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_070248_933615_E029BDF7 
X-CRM114-Status: GOOD (  23.29  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAwNyBKYW4gMjAyNCAxOTo1MjowOSBQU1QgKC0wODAwKSwgZWJpZ2dlcnNAa2VybmVs
Lm9yZyB3cm90ZToKPiBPbiBNb24sIEphbiAwOCwgMjAyNCBhdCAxMToxNjoyN0FNICswODAwLCBB
bmR5IENoaXUgd3JvdGU6Cj4+IE9uIFNhdCwgSmFuIDYsIDIwMjQgYXQgMjo1OeKAr0FNIEVyaWMg
QmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4KPj4gPiBIaSBQYWxtZXIs
Cj4+ID4KPj4gPiBPbiBGcmksIERlYyAyOSwgMjAyMyBhdCAwMjozNjoxN1BNICswMDAwLCBBbmR5
IENoaXUgd3JvdGU6Cj4+ID4gPiBUaGlzIHNlcmllcyBwcm92aWRlcyBzdXBwb3J0IHJ1bm5pbmcg
VmVjdG9yIGluIGtlcm5lbCBtb2RlLgo+PiA+Cj4+ID4gSXMgdGhlcmUgYW55IGNoYW5jZSB0aGF0
IHlvdSBjYW4gdGFrZSBwYXRjaGVzIDEgYW5kIDIgb2YgdGhpcyBzZXJpZXMgdmlhIHRoZQo+PiA+
IFJJU0MtViB0cmVlIGZvciB2Ni44PyAgVGhlIHZlY3RvciBjcnlwdG8gcGF0Y2hzZXQgZGVwZW5k
cyBvbiB0aG9zZSB0d28gcGF0Y2hlcy4KPj4gCj4+IFBhdGNoIDQgaXMgdmVyeSBlc3NlbnRpYWwg
Zm9yIG5vbi1wcmVlbXB0aWJsZSBrZXJuZWwtbW9kZSBWZWN0b3IsCj4+IHVubGVzcyB3ZSB3YW50
IHRvIGJlYXIgcmVzdG9yaW5nIG92ZXJoZWFkIGF0IGVhY2gga2VybmVsX3ZlY3Rvcl9lbmQoKS4K
Pj4gSXQncyB+MjAwIGN5Y2xlcyBvbiBhIFZMRU49MTI4IGhhcmR3YXJlLiBJdCBoYXBwZW5zIGFz
IGxvbmcgYXMgVmVjdG9yCj4+IGlzIGFsc28gdXNlZCBpbiB1c2VyLW1vZGUsIHdoaWNoIHdpbGwg
YmUgdmVyeSBjb21tb24uIFBsZWFzZSBjb25zaWRlcgo+PiBpbmNsdWRpbmcgdXAgdG8gcGF0Y2gg
NCBpZiB3ZSBtdXN0IHNwbGl0Lgo+PiAKPgo+IEl0J3MgZGVmaW5pdGVseSBhbiBpbXBvcnRhbnQg
b3B0aW1pemF0aW9uLCBidXQgSSB3b3VsZG4ndCBjYWxsIGl0ICJ2ZXJ5Cj4gZXNzZW50aWFsIi4g
IHg4NiBkaWRuJ3QgaW1wbGVtZW50IGxhenkgcmVzdG9yZXMgdW50aWwga2VybmVsIHY1LjIuCj4K
PiBNeSBob3BlIGlzIHRoYXQgd2UgY2FuIGp1c3QgZ2V0IGVub3VnaCBtZXJnZWQgc29vbiB0byB1
bmJsb2NrIHRoZSB2ZWN0b3IgY3J5cHRvCj4gcGF0Y2hzZXQsIHdoaWNoIGp1c3QgbmVlZHMga2Vy
bmVsX3ZlY3Rvcl97YmVnaW4sZW5kfSB3aXRoIHNvZnRpcnEgc3VwcG9ydC4gIFRoZQo+IHJlbWFp
bmluZyBjb3JlIHZlY3RvciB3b3JrIGNhbiBoYXBwZW4gaW4gcGFyYWxsZWwuCgpBbmR5IHNheXMg
aGUncyBnb2luZyB0byBzZW5kIGEgdjEwIHRvbW9ycm93LCBJJ2xsIHBsYW4gb24gbWVyZ2luZyB0
aGF0LgoKPgo+IC0gRXJpYwo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
