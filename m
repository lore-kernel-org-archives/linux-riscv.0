Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE49BC47258
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 04:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BoNHQZlwMvRfeoJYbjpYXdFad9TzFxi7WTZPtbQA/OU=; b=yr4Z3JWjhj231c
	QH7dT7lmYUikS87oOwpLguUM4KAq+FPEEMhCHgaInTZ1DDAgNtOwtqsoDdp4rbXH2hhni3I4cZHjb
	Cb5lsRIQa8l80alor/JN0b+O4yGO8EUhqKTkFq+2/I4mN7EfyvqAsfO7NNp28hgfkkIehN+jK0e8s
	mVLc7PWq9xItAeZllG5Nt0pL1Brx/Fhdsui7cGM2yZs+gnzm5ApVP/Blg3KIH3GhmVqrSi8LCcafh
	qSPHudtqoQtN4ppIVp3kltNvc5b8JjwNjNj/pvu71VHwJ7WpF2Js9we/2tdNVDYS7mohmpF69ahFn
	O9tjPj8dp0kNKDhl4ubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rR2Ww-0079zI-2n;
	Sat, 20 Jan 2024 04:00:26 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rR2Wu-0079yi-0U
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 04:00:25 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7beefdfe71eso65710539f.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 20:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1705723222; x=1706328022; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm77cdy8sjLxejMosTN9VvQDmoUNl7t40h/yggndkso=;
        b=ffhUXya5PyebjV3w3k8rOfLz8xRTWaTaPUP2TmiSah3lkv4X24mz4SdfNYjW0L2Y35
         7UkYU/oj93NB5Jb+UiEPIcKuitRn7vZ3HyjEKgqZOZAO/tFTm0yPjxr6A3Iy0bCK082O
         haGM91nQj0ZgRZDKmZlVAfRZMkUpo73OcJZ4q86WK5UIE70s7X0L6mcLBcz/Gua8x7ea
         pC/Yyf47XcPOBs/ItINeZFCTW0izNrEvt1rIIQ1eERp7MEIjvDmODr+kEyaef/gs0f2s
         yuV5AarM1ppVp1cIjkGCNw499c/hTzS6Y85ndam4tM2FW2HzIgHNkx3NvWRQQU680Fzm
         7Zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705723222; x=1706328022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xm77cdy8sjLxejMosTN9VvQDmoUNl7t40h/yggndkso=;
        b=hOreKnVEYtRwSftdm/GLliSzUN8szHqnkAuUnZwWdQR5FAtVfacZyohgLFv8hZsaWr
         Z083xFiWV5WGWI9U/F6KdJ3gM2LWNfzMB0dLX4q4UPwaTjNSSeUflpFVvn9BxGY6qZAx
         FEuTOi/Y4lmxd+7BcgrflcFJseTGMjxJZlZ7h/YwwExRb1hzahBaTT9xTauDRH7wrdKF
         0dCThLlYJomCtz+RRGI8JOPEcg5BjI3EnZ4Ae5ctO0KudqxmUA9ZAJ1KGqsVuaGZKJOV
         8NWCLyZGgV+djXopFvqve0itla+8QsPpfW6byEMr+gtboutsZwMj96yk0Y9TTyjKQhHL
         d0qw==
X-Gm-Message-State: AOJu0YykQ/kChsAQ2kV4cOMv5jSys9h5MqZ3ulOFI4Ljx5ZicOBspIHK
	snDtckoiHXsjzTqTfpWb/gVXMj8pXGTJXkIEfCI1/TDc+OQL3dbqyJ92l/KA00mU7GoAevl1px0
	3q1l+A3NMxOQh2zr0RMKaXIqTsiJ7D3dqAZmlRA==
X-Google-Smtp-Source: AGHT+IGg4ZcMYreFV9xlYVnib9lYgAyXv1Hi5hQ3Ji6o35ET/PG3DLNpo8igmEKscRALY1LTjwXa2naZ6EqS+RMFBqM=
X-Received: by 2002:a05:6602:4f49:b0:7bf:4f95:c10f with SMTP id
 gm9-20020a0566024f4900b007bf4f95c10fmr758470iob.33.1705723221837; Fri, 19 Jan
 2024 20:00:21 -0800 (PST)
MIME-Version: 1.0
References: <CAK9=C2UV8J52a1pZjsNpFNwpUKn5K3nhS-+bS-3pohDwi3HrfQ@mail.gmail.com>
 <mhng-f5f3ec82-ce6a-4e20-8799-f36fd82d74b6@palmer-ri-x1c9>
In-Reply-To: <mhng-f5f3ec82-ce6a-4e20-8799-f36fd82d74b6@palmer-ri-x1c9>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Jan 2024 09:30:10 +0530
Message-ID: <CAAhSdy1irrxUXTZKVvYB6UmXC6brb4U7xB_k5z2T82qOS=jdug@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] RISC-V SBI debug console extension support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: apatel@ventanamicro.com, Greg KH <gregkh@linuxfoundation.org>, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	jirislaby@kernel.org, Conor Dooley <conor@kernel.org>, ajones@ventanamicro.com, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_200024_193498_F197ABFA 
X-CRM114-Status: GOOD (  23.80  )
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

T24gU2F0LCBKYW4gMjAsIDIwMjQgYXQgMzoyOeKAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCAxOSBKYW4gMjAyNCAwMjowOToxOCBQU1Qg
KC0wODAwKSwgYXBhdGVsQHZlbnRhbmFtaWNyby5jb20gd3JvdGU6Cj4gPiBPbiBTYXQsIEphbiAx
MywgMjAyNCBhdCAxMjowMOKAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+
IHdyb3RlOgo+ID4+Cj4gPj4gT24gVGh1LCAxMSBKYW4gMjAyNCAwNjo1MDozNyBQU1QgKC0wODAw
KSwgcGF0Y2h3b3JrLWJvdCtsaW51eC1yaXNjdkBrZXJuZWwub3JnIHdyb3RlOgo+ID4+ID4gSGVs
bG86Cj4gPj4gPgo+ID4+ID4gVGhpcyBzZXJpZXMgd2FzIGFwcGxpZWQgdG8gcmlzY3YvbGludXgu
Z2l0IChmb3ItbmV4dCkKPiA+PiA+IGJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMu
Y29tPjoKPiA+PiA+Cj4gPj4gPiBPbiBGcmksIDI0IE5vdiAyMDIzIDEyOjM5OjAwICswNTMwIHlv
dSB3cm90ZToKPiA+PiA+PiBUaGUgU0JJIHYyLjAgc3BlY2lmaWNhdGlvbiBpcyBub3cgZnJvemVu
LiBUaGUgU0JJIHYyLjAgc3BlY2lmaWNhdGlvbiBkZWZpbmVzCj4gPj4gPj4gU0JJIGRlYnVnIGNv
bnNvbGUgKERCQ04pIGV4dGVuc2lvbiB3aGljaCByZXBsYWNlcyB0aGUgbGVnYWN5IFNCSSB2MC4x
Cj4gPj4gPj4gZnVuY3Rpb25zIHNiaV9jb25zb2xlX3B1dGNoYXIoKSBhbmQgc2JpX2NvbnNvbGVf
Z2V0Y2hhcigpLgo+ID4+ID4+IChSZWZlciB2Mi4wLXJjNSBhdCBodHRwczovL2dpdGh1Yi5jb20v
cmlzY3Ytbm9uLWlzYS9yaXNjdi1zYmktZG9jL3JlbGVhc2VzKQo+ID4+ID4+Cj4gPj4gPj4gVGhp
cyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBTQkkgZGVidWcgY29uc29sZSAoREJDTikgZXh0ZW5z
aW9uIGluCj4gPj4gPj4gTGludXggUklTQy1WLgo+ID4+ID4+Cj4gPj4gPj4gWy4uLl0KPiA+PiA+
Cj4gPj4gPiBIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6Cj4gPj4gPiAgIC0gW3Y1LDEv
NV0gUklTQy1WOiBBZGQgc3R1YnMgZm9yIHNiaV9jb25zb2xlX3B1dGNoYXIvZ2V0Y2hhcigpCj4g
Pj4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jL2Y1MDNiMTY3YjY2MAo+ID4+
ID4gICAtIFt2NSwyLzVdIFJJU0MtVjogQWRkIFNCSSBkZWJ1ZyBjb25zb2xlIGhlbHBlciByb3V0
aW5lcwo+ID4+ID4gICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcmlzY3YvYy9mNDNmYWJmNDQ0
Y2EKPiA+PiA+ICAgLSBbdjUsMy81XSB0dHkvc2VyaWFsOiBBZGQgUklTQy1WIFNCSSBkZWJ1ZyBj
b25zb2xlIGJhc2VkIGVhcmx5Y29uCj4gPj4gPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9y
aXNjdi9jL2M3N2JmMzYwN2EwZgo+ID4+ID4gICAtIFt2NSw0LzVdIHR0eTogQWRkIFNCSSBkZWJ1
ZyBjb25zb2xlIHN1cHBvcnQgdG8gSFZDIFNCSSBkcml2ZXIKPiA+PiA+ICAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL3Jpc2N2L2MvODhlYWQ2OGU3NjRjCj4gPj4gPiAgIC0gW3Y1LDUvNV0gUklT
Qy1WOiBFbmFibGUgU0JJIGJhc2VkIGVhcmx5Y29uIHN1cHBvcnQKPiA+PiA+ICAgICBodHRwczov
L2dpdC5rZXJuZWwub3JnL3Jpc2N2L2MvNTA5NDJhZDZkZGI1Cj4gPj4gPgo+ID4+ID4gWW91IGFy
ZSBhd2Vzb21lLCB0aGFuayB5b3UhCj4gPj4KPiA+PiBOYXRoYW4gcG9pbnRzIG91dCB0aGF0IHRo
aXMgaGFzIHNvbWUgc2VtYW50aWMgY29uZmxpY3RzIHdpdGggYSBwYXRjaCBpbgo+ID4+IEdyZWcn
cyBUVFkgdHJlZTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvZ3JlZ2toL3R0eS5naXQvY29tbWl0Lz9pZD1mMzJmY2JlZGJlOTI5MDU2NWU0ZWFjM2ZkN2M0
YzQ1MWQ1NDc4Nzg3Cj4gPj4KPiA+PiBTbyBJIHRoaW5rIHRoZSBiZXN0IGJldCBpcyB0byB3YWl0
IG9uIEdyZWcncyBwYXRjaCB0byBsYW5kIGluIExpbnVzJwo+ID4+IHRyZWUsIGFuZCB0aGVuIGJh
c2UgYSB2NiBvZiB0aGlzIHBhdGNoIHNldCBvbiB0aGF0IG1lcmdlZCBwYXRjaC4gIEknbQo+ID4+
IGdvaW5nIHRvIGRyb3AgdGhpcyBvbmUgZnJvbSBmb3ItbmV4dC4KPiA+Cj4gPiBHcmVnJ3MgcGF0
Y2ggaXMgbm93IGF2YWlsYWJsZSBpbiB1cHN0cmVhbSBMaW51eCBzbyBJIHdpbGwgcmViYXNlIGFu
ZAo+ID4gc2VuZCBvdXQgdjYuCj4KPiBTb3JyeSwgSSBmb3Jnb3QgYWJvdXQgdGhpcyBvbmUgYW5k
IG1lcmdlZCBpdC4gIEkganVzdCBzZW50IHVwIGEgZml4dXA6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjQwMTE5MjE1NjEyLjIwNTI5LTItcGFsbWVyQHJpdm9zaW5jLmNvbS8KCk5v
IGlzc3Vlcy4gQXBhcnQgZnJvbSBhIG1pbm9yIGNvbW1lbnQsIHlvdXIgZml4dXAgbG9va3MgZ29v
ZCB0byBtZS4KClRoYW5rcywKQW51cAoKPiAuCj4KPiA+Cj4gPiBUaGFua3MsCj4gPiBBbnVwCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
