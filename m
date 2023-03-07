Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A89C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=h4iemBHqFeRH6L6Bcg60yD4cXdjzMrpMDrfecZGg1JU=; b=joluXRRl5m1nBm9XT4VwwYV7LN
	fRhmg/rTQHZ2lrRSqV599zfQElCy6ZLnndFzaNOIk6TmgSbEbI1elBffwc9inzi7zBboj2wEf1JNR
	QmJ6hoLuZ7g+yArQy/C6HJTGJStkOy7fKrNkwRpcpDF06V1k3rXP1dhFI2bDdsibhEtRYHoW6CvJ4
	7jMUjh4iws/mUjGbiKjk5I+e0lGn0w1Stm+g62ZNGpDB4MbPx69lNXIm4cGcL/L559cxhLnLQyoiN
	I1qkap3RYPqnEyhAy2RaW4rWLPZAXRZdBhD7PR+ieYJIJUyaaqnY71OxHsjow+m5sqicSp4r8Xrqn
	L9n3o4eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeIY-002Qfa-C3; Tue, 07 Mar 2023 20:52:38 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZeIV-002Qeq-TB
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:52:37 +0000
Received: by mail-pj1-x1036.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso17828367pjb.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 12:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678222350;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCRUbbivXKiVKHwulz9OMHQ7nMVECe/ueTR6Y96VpAw=;
        b=NQY00D+ZGXh6408o28C+PYTLXUrduIxKp8jJmyKpDtdqnKp1zwYEs112uPeqN9IQsc
         uPPi69SqwXQbucN/DyicF5BP8V6PMMeJWtSVnH5CtQTkgefyWnnQBCS9EoAo49Zd5vT2
         Hb8lL9/wmT26HoHCYc/BA3Oow6DARNAHef6Xi0bGM1pw3Z9AhTRRtxMaQj6FgJKM7J3s
         pzUdVzsfdA1OkAGXQDXcAdrGdnSQ3y+yhf8awYNYKKA8yB1rD7ButD9+laNEFf7r0/W8
         FaCA1whudWZNJUBKyYyv1G2KlVMLIbQnEJBwrJO2COzEbJ0JoSiLC9TJlF/WwpUGZBj+
         BlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678222350;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCRUbbivXKiVKHwulz9OMHQ7nMVECe/ueTR6Y96VpAw=;
        b=UkTcR77kY0qvUKM2Qr/fgvJ11VT+dioo2sAUB0IB1gy6XbnNQ6KJ++/vpuI5pR3RRD
         t4e4rIYvqC/BMkC+bs780JjRdOELJzEp6iIEQ5U1UslAw5XhHuDlW23HkG1bC7S5zrgf
         rfLr7b5t6Nfmcu7AwR01zVFsE9pm+ZrS6qylb4oCdKkVOT5kT3wrndHuog9sDadtLSRN
         S3PERIW37vCsYLA/QwOZVU0LNoCB+jxYCMHr0a5fMmTh/nS75qVfOJN16hQ70BXfQL8e
         iNe0v35uBB5SDhNUskxXf45Jx+8rOH5EMn7283LotUcMmcfea7sFx2nzElp6znL7oU9E
         wJyA==
X-Gm-Message-State: AO0yUKVxkEaIeYIgMxkoYiTebH3r3ecxKKrdAMM60cq0rgQV2R3s5NYh
	bbNbV23wrBJjDxCfbfGVhRPXEQ==
X-Google-Smtp-Source: AK7set9ZfD/RyoGoV9r1x9qlgZghNtB9kLGmnf6t2NSlZJU1eLjVuj/iqHE3ZZAdE/phYMMrv6JAOQ==
X-Received: by 2002:a17:903:22ca:b0:19e:685f:484a with SMTP id y10-20020a17090322ca00b0019e685f484amr19758932plg.62.1678222350213;
        Tue, 07 Mar 2023 12:52:30 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id kj15-20020a17090306cf00b0019aa8149cb9sm8840284plb.79.2023.03.07.12.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 12:52:29 -0800 (PST)
Date: Tue, 07 Mar 2023 12:52:29 -0800 (PST)
X-Google-Original-Date: Tue, 07 Mar 2023 12:51:40 PST (-0800)
Subject: Re: [PATCH] RISC-V: fix taking the text_mutex twice during sifive errata patching
In-Reply-To: <CAMuHMdU7oV4PcVDHOugq8TFn7bw4Q3DEpjCfcTpVJZLkC9LKOA@mail.gmail.com>
CC: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
  linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, zeha@debian.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert@linux-m68k.org
Message-ID: <mhng-e858c590-9ef4-4d8f-a4b0-8bb72f2e0dfa@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_125235_981646_A0C3AFF3 
X-CRM114-Status: GOOD (  20.08  )
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

T24gVHVlLCAwNyBNYXIgMjAyMyAxMjoxMzowMSBQU1QgKC0wODAwKSwgZ2VlcnRAbGludXgtbTY4
ay5vcmcgd3JvdGU6Cj4gSGkgQ29ub3IsCj4KPiBPbiBUaHUsIE1hciAyLCAyMDIzIGF0IDY6NDXi
gK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiBGcm9tOiBDb25v
ciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pgo+PiBDaHJpcyBwb2ludGVk
IG91dCB0aGF0IHNvbWUgYm9uZWhlYWQsICpjb3VnaCogbWUgKmNvdWdoKiwgYWRkZWQgdHdvCj4+
IG11dGV4X2xvY2tzKCkgdG8gdGhlIFNpRml2ZSBlcnJhdGEgcGF0Y2hpbmcuIFRoZSBzZWNvbmQg
d2FzIG1lYW50IHRvCj4+IGhhdmUgYmVlbiBhIG11dGV4X3VubG9jaygpLgo+Pgo+PiBSZXBvcnRl
ZC1ieTogQ2hyaXMgSG9mc3RhZWR0bGVyIDx6ZWhhQGRlYmlhbi5vcmc+Cj4+IEZpeGVzOiA5NDkz
ZTZmM2NlMDIgKCJSSVNDLVY6IHRha2UgdGV4dF9tdXRleCBkdXJpbmcgYWx0ZXJuYXRpdmUgcGF0
Y2hpbmciKQo+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+Cj4gVGhpcyBmaXhlcyB0aGUg
Y3Jhc2ggSSBzZWUgKHdpdGggImVhcmx5Y29uIGtlZXBfYm9vdGNvbiIpIG9uIFN0YXJMaWdodCwK
PiBhbmQgd2hpY2ggSSd2ZSBqdXN0IGJpc2VjdGVkIHRvIGFmb3JlbWVudGlvbmVkIGNvbW1pdCwg
c28KPiBUZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIu
YmU+Cj4KPiBZb3UgbWF5IHdhbnQgdG8gaW5jbHVkZSAoYSBwYXJ0IG9mKSB0aGUgY3Jhc2ggbG9n
IGJlbG93IGluIHlvdXIKPiBwYXRjaCBkZXNjcmlwdGlvbiwgdG8gbWFrZSBpdCBlYXNpZXIgZm9y
IGFmZmVjdGVkIHBlb3BsZSB0byBmaW5kCj4gdGhlIGZpeC4KCkkgYWRkZWQgaXQgdG8gdGhlIGNv
bW1pdCwgdGhhbmtzLiAgVGhpcyBpcyBpbiBmaXhlcy4KCj4KPiBVbmFibGUgdG8gaGFuZGxlIGtl
cm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgYXQgdmlydHVhbCBhZGRyZXNzCj4gMDAwMDAw
MDAwMDAwMDAzMAo+IE9vcHMgWyMxXQo+IE1vZHVsZXMgbGlua2VkIGluOgo+IENQVTogMCBQSUQ6
IDAgQ29tbTogc3dhcHBlciBOb3QgdGFpbnRlZAo+IDYuMi4wLXJjMS1zdGFybGlnaHQtMDAwNzkt
Zzk0OTNlNmYzY2UwMiAjMjI5Cj4gSGFyZHdhcmUgbmFtZTogQmVhZ2xlViBTdGFybGlnaHQgQmV0
YSAoRFQpCj4gZXBjIDogX19zY2hlZHVsZSsweDQyLzB4NTAwCj4gIHJhIDogc2NoZWR1bGUrMHg0
Ni8weGNlCj4gZXBjIDogZmZmZmZmZmY4MDY1OTU3YyByYSA6IGZmZmZmZmZmODA2NTlhODAgc3Ag
OiBmZmZmZmZmZjgxMjAzYzgwCj4gIGdwIDogZmZmZmZmZmY4MTJkNTBhMCB0cCA6IGZmZmZmZmZm
ODEyMGRiNDAgdDAgOiBmZmZmZmZmZjgxMjAzZDY4Cj4gIHQxIDogMDAwMDAwMDAwMDAwMDAwMSB0
MiA6IDRjNDUyMDNhNzY2MzczNjkgczAgOiBmZmZmZmZmZjgxMjAzY2YwCj4gIHMxIDogZmZmZmZm
ZmY4MTIwZGI0MCBhMCA6IDAwMDAwMDAwMDAwMDAwMDAgYTEgOiBmZmZmZmZmZjgxMjEzOTU4Cj4g
IGEyIDogZmZmZmZmZmY4MTIxMzk1OCBhMyA6IDAwMDAwMDAwMDAwMDAwMDAgYTQgOiAwMDAwMDAw
MDAwMDAwMDAwCj4gIGE1IDogZmZmZmZmZmY4MGExYmQwMCBhNiA6IDAwMDAwMDAwMDAwMDAwMDAg
YTcgOiAwMDAwMDAwMDUyNDY0ZTQzCj4gIHMyIDogZmZmZmZmZmY4MTIwZGI0MSBzMyA6IGZmZmZm
ZmZmODBhMWFkMDAgczQgOiAwMDAwMDAwMDAwMDAwMDAwCj4gIHM1IDogMDAwMDAwMDAwMDAwMDAw
MiBzNiA6IGZmZmZmZmZmODEyMTM5MzggczcgOiAwMDAwMDAwMDAwMDAwMDAwCj4gIHM4IDogMDAw
MDAwMDAwMDAwMDAwMCBzOSA6IDAwMDAwMDAwMDAwMDAwMDEgczEwOiBmZmZmZmZmZjgxMmQ3MjA0
Cj4gIHMxMTogZmZmZmZmZmY4MGQzYzkyMCB0MyA6IDAwMDAwMDAwMDAwMDAwMDEgdDQgOiBmZmZm
ZmZmZjgxMmU2ZGQ3Cj4gIHQ1IDogZmZmZmZmZmY4MTJlNmRkOCB0NiA6IGZmZmZmZmZmODEyMDNi
YjgKPiBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAzMCBj
YXVzZTogMDAwMDAwMDAwMDAwMDAwZAo+IFs8ZmZmZmZmZmY4MDY1OWE4MD5dIHNjaGVkdWxlKzB4
NDYvMHhjZQo+IFs8ZmZmZmZmZmY4MDY1OWRjZT5dIHNjaGVkdWxlX3ByZWVtcHRfZGlzYWJsZWQr
MHgxNi8weDI4Cj4gWzxmZmZmZmZmZjgwNjVhZTBjPl0gX19tdXRleF9sb2NrLmNvbnN0cHJvcC4w
KzB4M2ZlLzB4NjUyCj4gWzxmZmZmZmZmZjgwNjViMTM4Pl0gX19tdXRleF9sb2NrX3Nsb3dwYXRo
KzB4ZS8weDE2Cj4gWzxmZmZmZmZmZjgwNjViMTgyPl0gbXV0ZXhfbG9jaysweDQyLzB4NGMKPiBb
PGZmZmZmZmZmODAwMGFkOTQ+XSBzaWZpdmVfZXJyYXRhX3BhdGNoX2Z1bmMrMHhmNi8weDE4Ywo+
IFs8ZmZmZmZmZmY4MDAwMmI5Mj5dIF9hcHBseV9hbHRlcm5hdGl2ZXMrMHg3NC8weDc2Cj4gWzxm
ZmZmZmZmZjgwODAyZWU4Pl0gYXBwbHlfYm9vdF9hbHRlcm5hdGl2ZXMrMHgzYy8weGZhCj4gWzxm
ZmZmZmZmZjgwODAzY2IwPl0gc2V0dXBfYXJjaCsweDYwYy8weDY0MAo+IFs8ZmZmZmZmZmY4MDgw
MDkyNj5dIHN0YXJ0X2tlcm5lbCsweDhlLzB4OTljCj4gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAw
MDAwMDAwMCBdLS0tCj4KPiBHcntvZXRqZSxlZXRpbmd9cywKPgo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
