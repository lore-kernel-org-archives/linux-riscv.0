Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346D5D78785
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eR8UUBq9vioTkg2oRJivRXyNe4Vf0Kx4VewoAKYtElk=; b=hBliE3+PQu87j+
	/Iisfyug/vKrc8hhmfFsTdi1xQWbpFteR26oJUqQrDT07QPnD3hAKblXvhVE1FTVI7Kb5PWAm4FqB
	yBEyDUdYZcPkdi5XgNHicm+xSAlKR+VevpK3gHH6bg3L+GaXpdBJBl5Gq/4NUvq60xxeUred4kL9X
	50s8ZJvJ59AUkjHySO9JU9LWFrSWnheAgAQPREITQIOEeccHmXcEu3cBpuWUv7iT0b/awIGfQZ5is
	DlVh3jPNDlAGZY0tKPhjjgErP1ZbiGjGe0nEbLVMJGrlSxRLUggTciy0POS9o68EhKyosiT32yCBf
	t1+VIU0MkKw4sz68oMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbpl-0000000ASWB-2Vts;
	Fri, 19 Dec 2025 14:51:57 +0000
Received: from mail-yx1-xb144.google.com ([2607:f8b0:4864:20::b144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbpj-0000000ASVc-391L
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 14:51:57 +0000
Received: by mail-yx1-xb144.google.com with SMTP id 956f58d0204a3-6420c08f886so2401237d50.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 06:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766155914; x=1766760714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T34RqGeGnjOKUGciQBRx+nn+LJqaJ4XQvp2thwWEcfc=;
        b=DblTuEnZSlsHLPlqaVCFGwEdJ0ybLRydfpGzhSimsN6gvoHUbNDE1etxG5HoTmNH6G
         /RLHxwlUSmiS+zNHuw2LlYDtPyH7pcLhtLDRVubFQC3Btdfcfez1mHEZI01D0pAhPVqm
         0rwU8E734zaxwdKbkLmlnylAqxiuePdBiH/uaEpcF2L1xnpt+1NddmWj/G0tDuUhhW5P
         8hGylozYw6jEUzv6Ihr0Yg11aLP+80waSPFGqbOxunWv0OUW61JYnpvkqoaLRiIEQFBD
         YGup/eqKzi7ldIviO7w5Flu7Si+Z9rocJbp6IKyKh7atthWRcfsv3btqn5rUoHCHSm1t
         DBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766155914; x=1766760714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T34RqGeGnjOKUGciQBRx+nn+LJqaJ4XQvp2thwWEcfc=;
        b=giLQNS7oVcuLSjkjeFcwlvAwGviLcxv9Xx8nvMj0nZt+a6rhm4a44qXkccaYm5lOK0
         gNV+S679hLBsHbznLLv0VS5nyUx3tkkO70n6p5xfIdjI74Wy9FCjj77EPLwhnfMiiyOa
         6Mdh5nKzxZfmMkEbzbVZ14fEeR7RvZMrueRbP5IXrGLhasKYWhfzttc0BiKfoZU1NoEL
         MjQdlq9j3S1GxioeYr7Y65rVs7RPtSG7Kfj0+FvGGiOQ7bqENH104kunQk0q04RwnK2z
         lThh37cxFbJil4xITOa8elaz3ReFnwE9xtQMYGXtjuBZLLfbxXFAg3BMeI+zHcaJq3aE
         DQcw==
X-Forwarded-Encrypted: i=1; AJvYcCWYp0v+JQG+KYZ6temd9UmHSR8Sv3QIYZfpEYXLVTBnu7xEN4Sc3gfJK/Qml6xK7ZIze1bwuQ3PyQBqJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw62R8Yv3DMkWb0VUSmEl/KxLo+KS18wiPzZ+V+LnqWX12LpC/f
	ROefuLdanLIsNW6OacLLsWqBxQWy+NuBPO1Ac7yEa1jKhbR6RTHPHGvmT5RTfQZ+TfFp9fv2asW
	bAuvbSTPtNYEqLAAp9iYK5SDE6dOFV0A=
X-Gm-Gg: AY/fxX51J1pRlMZdLlFBcz8vwNiBLQmOrFsaZPMOmB15MYkMgPvNN59lIFQr9zcCo1y
	CgHqpZbImpmQneaJ5q7W0Bs71JSfkyIcg1x9ofwtXIde9zNqe9qMV44DyGtclU1NnyDs23RmE+F
	CS9ZVE4swM2kSkajl9UwDHa+k7Tk+DCwaXQhdR3GF6G5sHRuypqfrCfN/LKmhx0FOrxDU3oZdgj
	Wy8pETMEKpAARQd3oD00mD5ArhF3f+u7KS4ewM5erjsRlXH2b9qOcxqygssft6oORnJrmrqsHY=
X-Google-Smtp-Source: AGHT+IGYt3hmA6z9rLwLs0TIpkxe/pEyyQuxnSnakYVCr+VNSwGyLqdmFy7K/kMsU9Wlx3pkt6/LyQ7Ql8eFrG9EgOM=
X-Received: by 2002:a05:690e:44e:b0:644:6fab:5644 with SMTP id
 956f58d0204a3-6466a8b4d23mr1962313d50.51.1766155914532; Fri, 19 Dec 2025
 06:51:54 -0800 (PST)
MIME-Version: 1.0
References: <CAJD_bPKbZaEHmKzVcLPGJuR3Y3MO1AJDA0TmLZrLkCJ0PzCM1A@mail.gmail.com>
In-Reply-To: <CAJD_bPKbZaEHmKzVcLPGJuR3Y3MO1AJDA0TmLZrLkCJ0PzCM1A@mail.gmail.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Fri, 19 Dec 2025 22:51:43 +0800
X-Gm-Features: AQt7F2rB5ZoVFLuFvudPA_r_ARNanxGv0N4ryxkcn2Ub_wWbOu7U5KxZi_0OWGc
Message-ID: <CADxym3b=gBhefPMUCeiE_H0WPbG9AuL5tGe_6gsCZ8wi1ifJoA@mail.gmail.com>
Subject: Re: [REGRESSION] Cannot boot 6.19-rc1 on riscv64 with BPF enabled.
To: Jason Montleon <jmontleo@redhat.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, ast@kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_065155_797496_920CCA6A 
X-CRM114-Status: GOOD (  13.00  )
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

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgMTA6MzbigK9QTSBKYXNvbiBNb250bGVvbiA8am1vbnRs
ZW9AcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBXaGVuIGJvb3RpbmcgcmlzY3Y2NCBzeXN0ZW1zIHdp
dGggQlBGIGVuYWJsZWQgdXNpbmcgNi4xOS1yYzEgdGhlCj4gc3lzdGVtIHByb2R1Y2VzIHRoZSBm
b2xsb3dpbmcgcGFuaWMuIEkgdHJpZWQgb24gc2V2ZXJhbCBib2FyZHMgYW5kCj4gdGhleSByZXN1
bHRlZCBpbiB0aGUgc2FtZSBlcnJvci4KClNvcnJ5IGFib3V0IHRoZSBwcm9ibGVtLiBJIGhhdmUg
c2VudCBhIGZpeCBmb3IgdGhpcyBpc3N1ZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIw
MjUxMjE5MTI0NzQ4LjgxMTMzLTEtZG9uZ21sMkBjaGluYXRlbGVjb20uY24vVC8jdQoKQW5kIGhl
cmUgaXMgdGhlIGRpc2N1c3Npb24gYWJvdXQgaXQ6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Jw
Zi9DQUR4eW0zWTA5ODgzNmZISFJTamVyeXhDcD1DUEI4c0RVMTlUQkJWczA3VlpPRVJKWHdAbWFp
bC5nbWFpbC5jb20vVC8jdQoKVGhhbmtzIQpNZW5nbG9uZyBEb25nCgo+Cj4gWyA1LjM4MDU4M10g
SW5zdWZmaWNpZW50IHN0YWNrIHNwYWNlIHRvIGhhbmRsZSBleGNlcHRpb24hCj4gWyA1LjM4NTk4
Nl0gVGFzayBzdGFjazogWzB4ZmZmZmZmYzYwMDAyMDAwMC4uMHhmZmZmZmZjNjAwMDI0MDAwXQo+
IFsgNS4zOTIzMzldIE92ZXJmbG93IHN0YWNrOiBbMHhmZmZmZmZkN2ZlZjdhMDcwLi4weGZmZmZm
ZmQ3ZmVmN2IwNzBdCj4gWyA1LjM5ODY5M10gQ1BVOiAyIFVJRDogMCBQSUQ6IDEgQ29tbTogc3lz
dGVtZCBUYWludGVkOiBHIFcKPiA2LjE5LjAtcmMxLTAwMDAxLWc3NGQ5Y2FiNWI2YzEgIzE1IE5P
TkUKPiBbIDUuNDA5MzAyXSBUYWludGVkOiBbV109V0FSTgo+IFsgNS40MTIyNzFdIEhhcmR3YXJl
IG5hbWU6IHN0YXJmaXZlIFN0YXJGaXZlIFZpc2lvbkZpdmUgMgo+IHYxLjNCL1N0YXJGaXZlIFZp
c2lvbkZpdmUgMiB2MS4zQiwgQklPUyAyMDI0LjEwLXJjMyAxMC8wMS8yMDI0Cj4gWyA1LjQyMzEz
NF0gZXBjIDogY29weV9mcm9tX2tlcm5lbF9ub2ZhdWx0X2FsbG93ZWQrMHhhLzB4MjgKPiBbIDUu
NDI4NzE4XSByYSA6IGNvcHlfZnJvbV9rZXJuZWxfbm9mYXVsdCsweDI4LzB4MTk4Cj4gWyA1LjQz
Mzc3NF0gZXBjIDogZmZmZmZmZmY4MDI0MDYyYSByYSA6IGZmZmZmZmZmODAyNDA2NzAgc3AgOiBm
ZmZmZmZjNjAwMDFmZmYwCj4gWyA1LjQ0MDk5N10gZ3AgOiBmZmZmZmZmZjgyNDY0Y2U4IHRwIDog
MDAwMDAwMDAwMDAwMDAwMCB0MCA6IGZmZmZmZmZmODAwMjQ2MjAKPiBbIDUuNDQ4MjE5XSB0MSA6
IGZmZmZmZmZmODAxN2MwNTIgdDIgOiAwMDAwMDAwMDAwMDAwMDAwIHMwIDogZmZmZmZmYzYwMDAy
MDAzMAo+IFsgNS40NTU0NDJdIHMxIDogZmZmZmZmZDZjMjE5ODI2MCBhMCA6IGZmZmZmZmQ2YzIx
OTgyNjAgYTEgOiAwMDAwMDAwMDAwMDAwMDA4Cj4gWyA1LjQ2MjY2NF0gYTIgOiAwMDAwMDAwMDAw
MDAwMDA4IGEzIDogMDAwMDAwMDAwMDAwMDA5ZCBhNCA6IDAwMDAwMDAwMDAwMDAwMDAKPiBbIDUu
NDY5ODg1XSBhNSA6IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiAwMDAwMDAwMDAwMDAwMDIxIGE3IDog
MDAwMDAwMDAwMDAwMDAwMwo+IFsgNS40NzcxMDZdIHMyIDogZmZmZmZmYzYwMDAyMDA3MCBzMyA6
IDAwMDAwMDAwMDAwMDAwMDggczQgOiAwMDAwMDAwMDAwMDAwMDAwCj4gWyA1LjQ4NDMyN10gczUg
OiBmZmZmZmZjNjAwMDIwMDgwIHM2IDogMDAwMDAwMDAwMDAwMDAwMCBzNyA6IDAwMDAwMDAwMDAw
MzgwMDAKPiBbIDUuNDkxNTQ5XSBzOCA6IDAwMDAwMDAwMDAwMDgwMDIgczkgOiAwMDAwMDAwMDAw
MzgwMDAwIHMxMDogZmZmZmZmYzYwMDAyM2NmOAo+IFsgNS40OTg3NzFdIHMxMTogZmZmZmZmZDZj
NDE5YmYwMCB0MyA6IDAwMDAwMDAwNzdhYjlkYjkgdDQgOiAwMDAwMDAwMDExMzkxOGU3Cj4gWyA1
LjUwNTk5M10gdDUgOiBmZmZmZmZmZjllOWJjYzI5IHQ2IDogZmZmZmZmYzYwMDAyM2FkNAo+IFsg
NS41MTEzMDRdIHN0YXR1czogMDAwMDAwMDIwMDAwMDEyMCBiYWRhZGRyOiBmZmZmZmZjNjAwMDFm
ZmYwIGNhdXNlOgo+IDAwMDAwMDAwMDAwMDAwMGYKPiBbIDUuNTE5MjIxXSBLZXJuZWwgcGFuaWMg
LSBub3Qgc3luY2luZzogS2VybmVsIHN0YWNrIG92ZXJmbG93Cj4gWyA1LjUyNDk2N10gQ1BVOiAy
IFVJRDogMCBQSUQ6IDEgQ29tbTogc3lzdGVtZCBUYWludGVkOiBHIFcKPiA2LjE5LjAtcmMxLTAw
MDAxLWc3NGQ5Y2FiNWI2YzEgIzE1IE5PTkUKPiBbIDUuNTM1NTc0XSBUYWludGVkOiBbV109V0FS
Tgo+IFsgNS41Mzg1NDRdIEhhcmR3YXJlIG5hbWU6IHN0YXJmaXZlIFN0YXJGaXZlIFZpc2lvbkZp
dmUgMgo+IHYxLjNCL1N0YXJGaXZlIFZpc2lvbkZpdmUgMiB2MS4zQiwgQklPUyAyMDI0LjEwLXJj
MyAxMC8wMS8yMDI0Cj4gWyA1LjU0OTQwOF0gQ2FsbCBUcmFjZToKPiBbIDUuNTUxODU5XSBbPGZm
ZmZmZmZmODAwMWU0Mzg+XSBkdW1wX2JhY2t0cmFjZSsweDI4LzB4MzgKPiBbIDUuNTU3MjYyXSBb
PGZmZmZmZmZmODAwMDI0NjI+XSBzaG93X3N0YWNrKzB4M2EvMHg1MAo+IFsgNS41NjIzMTddIFs8
ZmZmZmZmZmY4MDAxNmQwMj5dIGR1bXBfc3RhY2tfbHZsKzB4NWEvMHg4MAo+IFsgNS41Njc3MjBd
IFs8ZmZmZmZmZmY4MDAxNmQ0MD5dIGR1bXBfc3RhY2srMHgxOC8weDIwCj4gWyA1LjU3Mjc3Nl0g
WzxmZmZmZmZmZjgwMDAyYjdhPl0gdnBhbmljKzB4ZjIvMHgyZDAKPiBbIDUuNTc3NTcwXSBbPGZm
ZmZmZmZmODAwMDJkOTY+XSBwYW5pYysweDNlLzB4NDgKPiBbIDUuNTgyMTkxXSBbPGZmZmZmZmZm
ODAwMWUxMTA+XSBoYW5kbGVfYmFkX3N0YWNrKzB4OTgvMHhjMAo+IFsgNS41ODc3NjVdIFs8ZmZm
ZmZmZmY4MDI0MDY3MD5dIGNvcHlfZnJvbV9rZXJuZWxfbm9mYXVsdCsweDI4LzB4MTk4Cj4gWyA1
LjU5NDEyMl0gU01QOiBzdG9wcGluZyBzZWNvbmRhcnkgQ1BVcwo+IFsgNS41OTgwNzBdIC0tLVsg
ZW5kIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBLZXJuZWwgc3RhY2sgb3ZlcmZsb3cgXS0t
LQo+Cj4gQSBiaXNlY3QgaWRlbnRpZmllZCA0N2M5MjE0ZGNiIGFzIHRoZSBwcm9ibGVtYXRpYyBj
b21taXQ6Cj4gWzQ3YzkyMTRkY2JlYTkwNDNhYzIwNDQxYTI4NWM3YmI1NDg2YjhiMmRdIGJwZjog
Zml4IHRoZSB1c2FnZSBvZgo+IEJQRl9UUkFNUF9GX1NLSVBfRlJBTUUKPgo+IFRoaXMgY29tbWl0
IHJldmVydHMgY2xlYW5seSBhbmQgd2hlbiBidWlsZGluZyA2LjE5LXJjMSB3aXRob3V0IGl0IEkg
YW0KPiBhYmxlIHRvIGJvb3Qgc3VjY2Vzc2Z1bGx5Lgo+Cj4gQSBjb3B5IG9mIHRoZSB0cmFjZSwg
YmlzZWN0IGxvZywgYW5kIGNvbmZpZyB1c2VkIHRvIHJlcHJvZHVjZSB0aGUKPiBwcm9ibGVtIGFy
ZSBhdDoKPiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9qbW9udGxlb24vYjhiODYxMzUyZTdiOWJj
OWZkM2E5M2QzOTE5MjZkZWMKPgo+ICNyZWd6Ym90IGludHJvZHVjZWQ6IDQ3YzkyMTRkY2IKPgo+
IFRoYW5rIHlvdSwKPiBKYXNvbiBNb250bGVvbgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
