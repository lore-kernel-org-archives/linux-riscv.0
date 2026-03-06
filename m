Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6959DFCB61F
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 16:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jQcQvl9endkM9HfvtPmIgwYFn29lfD11fqnVnmIN68E=; b=XYyqKbik+f/KKn
	RQ/bvGXKxl+PblxDLBrURMP0nBIZlmwzHH43k+AbQqOkobBb4SgPu1eKcjDP5YELaVIf9OWYQr+41
	Zbz17IG1eHWCzgLnIoTUyWVuZAIctWznL+yk+fz1fMx+61gdgxc5OKclM0LutCUGBRGMwCzam4iIX
	faRNvpdceSuBJPzexzPn1TqOW6Oa5x9y5NqsgCJgw3/R5vKG0t75B/KkFLmHb1m79jpP1ljwo2o61
	8CmOE7dbvKMwbp8qi2bjVEBKk88TiyJUtbNadBkfi5JOmJUavajP/xMjV7xk6GUuHFcpIyXltUkVt
	xyTQd53RZjTSxfiicXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXhA-000000047Iz-3V78;
	Fri, 06 Mar 2026 16:06:32 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXh7-000000047Hd-1tpv
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 16:06:30 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-676815e147dso4961881eaf.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 08:06:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772813188; cv=none;
        d=google.com; s=arc-20240605;
        b=R2y+krouHoOS86OyP8EUEvrQVOPCnAv1hpNA2Yeu9PvwsST9fgZgMlmz14eEzwNh/y
         pscLSvSeHoJw4gt9eYhPRD3BE+c+TMJIYZY6o55XYT09NU1i2dLaL8fuSr4u1soF1jwY
         LGIjBB9aYc+vnCmcGGfOQdyJNDZj6yTyVUwAiRoASt4NwXdDxzwph5lAUPzBQpGNTSKL
         Yrwbmki0T9oMp6xnxm03Y1RB88b96z7qaQPd/TCY2JOfJzyWWSfoUDgUgyQyvRPCA0Vl
         X4RCZcB+g7Rt+E1f81BaiPuFvGlXc7b6MLXwRniZoR++1I5zy4YeeVHpM8pckwjT89i3
         bc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=bq/d/mKtXxIR1+HyewF2kjtB/W3rkjxPeNkROtpkMok=;
        fh=JpWCyATdrNdZVVE9ddxe2tBw/Q49vtN7VZ1WzvPop3Q=;
        b=VuO/c8xaI31Mec7RVQsXjpcvSUqR4GojG16ITNZ1K53sm3QAN/EH3oEiYvAmTjlKOn
         FBmrF34JeUAsf56yu96i8lF2SDHz8s+55ofTzyYmOWR9U+McLvVSPiRetKDcdbgDrvSw
         8FCTnfLXGLtHmQuBvmYk58BYMefxEiEYgy3RVvdlpKtw5fkugBOjHgrWBijSzNkFovoY
         UXGJBhkhazPpPLktbNGylqNlwghjbpxcQekBEs9HvRYXZG/vqHyphi8xJplv0jssgepX
         ms/W1Ipi4HTGtctOOj054TyXhqe0SA5MtGbY1FSHkh3a90xu2nzWFDbU/BK/ubFBCLLf
         dI5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772813188; x=1773417988; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bq/d/mKtXxIR1+HyewF2kjtB/W3rkjxPeNkROtpkMok=;
        b=VOCI9kW/FEWDEOeoAIiEYwWUZPWyzca7/PGmPgx/xlppqk5zPLAGRDMXmygj4y+QCr
         YrofjtUJ+5Hs2Y4jVQJlfpCtCFnojEkjLduqcsww/6Q+acB7K7IUyXjqJqESrW3yklZD
         /My58RzIHT7/gSSuLr7USjOCuEm2u5btkF1n4dTbiWL6gg2VuTNmp4/yiq9LGQSPMyb7
         tygWI1HiYsKfqDs04sZjPZGW+SetftFLiZ7S7WY1gloFxFn0wVLT4x3tO4n2H6jI4oqE
         pNUv56ctlJSsC9Ih98GuDrjzIJamXvQ51LayBFg0eY0+zo6j5flH+9Ov/A1WdUUfBznE
         fQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772813188; x=1773417988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bq/d/mKtXxIR1+HyewF2kjtB/W3rkjxPeNkROtpkMok=;
        b=nbRBsFGL/Qr+UUvdgaTszoWPgAuK5rPLb659JgbL1gU7Z6bAnvJXekHSJIq40QToR0
         6dLmV8AALt5QSk9QoFw0+SXM/4Q4sUIA0vdjR8evRIh+L2OpNdmPa7v1aVn16CkK34wI
         YOK4LlE75NxWBNnJ06U26tWxhBPgyITeoah4kuw8+yUjPn0XwsT4ZCaHDvq5jkQRNs70
         ZTy4a6LUusro7FKax8lIPpYgiXGKrHwlHBWParogG+qAoRlcdaHHcE3t2ljqfdjip/jD
         vZ4pdS4Ioed8M5rT3B7QmUtU2w008w0VjjtNj6EZsW3Jar6PX4Lm81zFkVe5YmUBvsge
         52Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVRvty2Ec9xrnC0ij+Sw3/NweFMbfYkE/ODzACNsVX2YxFmwPoZfDMcsVQ34i2jT0wZFQhUBJmoxnd+Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIT+ffKtevHaQ+ctSGc/9Kdy8QEGpwAUehQjXdk1a8nzY0sbG3
	HTrMmih/g6S8YOtD41ezB3TXRFczudLdptTvsvByGGUrpyKh3ZojL3TXFni26YZeCnZvm/pZnUd
	QrLjtLYVn5LRbTuhhgRcNmD76UJR862+uKJ+4mgk23A==
X-Gm-Gg: ATEYQzxLt0+uStMYX4y3IDtLThznAl00OzesZRreHf2zIjxj9sEn9cbSKv8+v6WxRDl
	51C72p10udobdqIM68a3sZSBABg/gAFxMo7/h5FGfGDtnCuIc0bkhr0+qz8pk6hyClLoFI4XCYg
	lNJxPwWoj3B1Hl1BaeDiTfJM5W1Xak8gz6O4E5zoetA2m5pcFhJ7WsGZ3H+rT8g/xUijg9WorRG
	V3haznu4jRyjhqFJaEVUhs0mxHE/81cmUngRhYj2PYLjYWuA1WKKyZnpomz95kOQUckQvnzttHL
	PVyzK6t+Yh2+uzNQdDY210Jm6q1R4ZhTNgh8zRJQAzrJRM2ndlbNJL7CqX2vVzDEaGNhk768mea
	Rz5no7tLZ0cuuzpBROjL0rK7r4V8=
X-Received: by 2002:a05:6820:1843:b0:679:f05e:f13c with SMTP id
 006d021491bc7-67b9bd45a8cmr1550538eaf.60.1772813187874; Fri, 06 Mar 2026
 08:06:27 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Mar 2026 21:36:16 +0530
X-Gm-Features: AaiRm53452UyUTlO6hp4cwRrPvadg006HyyZw7yrDpFC4S4tJGwcfOAoyhE4Kyg
Message-ID: <CAAhSdy2EuZu_KeZ1RaUEg3shtfSnSVo7eJWOA6-g4j9Hn2oY5A@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 7.0 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_080629_662272_17C0BB98 
X-CRM114-Status: UNSURE (   7.23  )
X-CRM114-Notice: Please train this message.
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

SGkgUGFvbG8sCgpXZSBoYXZlIHF1aXRlIGEgZmV3IGZpeGVzIHRoaXMgdGltZSBmb3IgdGhlIDcu
MCBrZXJuZWwuClRoZXNlIGZpeGVzIGFkZHJlc3MgcG90ZW50aWFsIHVzZS1hZnRlci1mcmVlIGlz
c3VlcywgbnVsbApwb2ludGVyIGRlcmVmZXJlbmNlcywgc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5k
IGFjY2Vzc2VzLAphbmQgb3RoZXJzLgoKUGxlYXNlIHB1bGwuCgpSZWdhcmRzLApBbnVwCgpUaGUg
Zm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDExNDM5YzQ2MzVlZGQ2NjlhZTQzNWVlYzMw
OGY0YWI4YTA4MDQ4MDg6CgogIExpbnV4IDcuMC1yYzIgKDIwMjYtMDMtMDEgMTU6Mzk6MzEgLTA4
MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgaHR0cHM6Ly9n
aXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0tcmlzY3YtZml4ZXMtNy4wLTEK
CmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjNjFlYzNlOGNjNWQ0NmZhMjY5NDM0YTll
YzE2Y2EzNmQzNjJlMGRkOgoKICBSSVNDLVY6IEtWTTogQ2hlY2sgaG9zdCBTc2FpYSBleHRlbnNp
b24gd2hlbiBjcmVhdGluZyBBSUEgaXJxY2hpcAooMjAyNi0wMy0wNiAxMToyMDozMCArMDUzMCkK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KS1ZNL3Jpc2N2IGZpeGVzIGZvciA3LjAsIHRha2UgIzEKCi0gUHJldmVudCBzcGVj
dWxhdGl2ZSBvdXQtb2YtYm91bmRzIGFjY2VzcyB1c2luZyBhcnJheV9pbmRleF9ub3NwZWMoKQog
IGluIEFQTElDIGludGVycnVwdCBoYW5kbGluZywgT05FX1JFRyByZWdpc2VyIGFjY2VzcywgQUlB
IENTUiBhY2Nlc3MsCiAgZmxvYXQgcmVnaXN0ZXIgYWNjZXNzLCBhbmQgUE1VIGNvdW50ZXIgYWNj
ZXNzCi0gRml4IHBvdGVudGlhbCB1c2UtYWZ0ZXItZnJlZSBpc3N1ZXMgaW4ga3ZtX3Jpc2N2X2dz
dGFnZV9nZXRfbGVhZigpLAogIGt2bV9yaXNjdl9haWFfYXBsaWNfaGFzX2F0dHIoKSwgYW5kIGt2
bV9yaXNjdl9haWFfaW1zaWNfaGFzX2F0dHIoKQotIEZpeCBwb3RlbnRpYWwgbnVsbCBwb2ludGVy
IGRlcmVmZXJlbmNlIGluIGt2bV9yaXNjdl92Y3B1X2FpYV9ybXdfdG9wZWkoKQotIEZpeCBvZmYt
Ynktb25lIGFycmF5IGFjY2VzcyBpbiBTQkkgUE1VCi0gU2tpcCBUSFAgc3VwcG9ydCBjaGVjayBk
dXJpbmcgZGlydHkgbG9nZ2luZwotIEZpeCBlcnJvciBjb2RlIHJldHVybmVkIGZvciBTbXN0YXRl
ZW4gYW5kIFNzYWlhIE9ORV9SRUcgaW50ZXJmYWNlCi0gQ2hlY2sgaG9zdCBTc2FpYSBleHRlbnNp
b24gd2hlbiBjcmVhdGluZyBBSUEgaXJxY2hpcAoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbnVwIFBhdGVsICgzKToKICAg
ICAgUklTQy1WOiBLVk06IEZpeCBlcnJvciBjb2RlIHJldHVybmVkIGZvciBTbXN0YXRlZW4gT05F
X1JFRwogICAgICBSSVNDLVY6IEtWTTogRml4IGVycm9yIGNvZGUgcmV0dXJuZWQgZm9yIFNzYWlh
IE9ORV9SRUcKICAgICAgUklTQy1WOiBLVk06IENoZWNrIGhvc3QgU3NhaWEgZXh0ZW5zaW9uIHdo
ZW4gY3JlYXRpbmcgQUlBIGlycWNoaXAKCkppYWthaSBYdSAoNCk6CiAgICAgIFJJU0MtVjogS1ZN
OiBGaXggdXNlLWFmdGVyLWZyZWUgaW4ga3ZtX3Jpc2N2X2dzdGFnZV9nZXRfbGVhZigpCiAgICAg
IFJJU0MtVjogS1ZNOiBGaXggbnVsbCBwb2ludGVyIGRlcmVmZXJlbmNlIGluCmt2bV9yaXNjdl92
Y3B1X2FpYV9ybXdfdG9wZWkoKQogICAgICBSSVNDLVY6IEtWTTogRml4IHVzZS1hZnRlci1mcmVl
IGluIGt2bV9yaXNjdl9haWFfYXBsaWNfaGFzX2F0dHIoKQogICAgICBSSVNDLVY6IEtWTTogRml4
IHBvdGVudGlhbCBVQUYgaW4ga3ZtX3Jpc2N2X2FpYV9pbXNpY19oYXNfYXR0cigpCgpMdWthcyBH
ZXJsYWNoICg1KToKICAgICAgS1ZNOiByaXNjdjogRml4IFNwZWN0cmUtdjEgaW4gQVBMSUMgaW50
ZXJydXB0IGhhbmRsaW5nCiAgICAgIEtWTTogcmlzY3Y6IEZpeCBTcGVjdHJlLXYxIGluIE9ORV9S
RUcgcmVnaXN0ZXIgYWNjZXNzCiAgICAgIEtWTTogcmlzY3Y6IEZpeCBTcGVjdHJlLXYxIGluIEFJ
QSBDU1IgYWNjZXNzCiAgICAgIEtWTTogcmlzY3Y6IEZpeCBTcGVjdHJlLXYxIGluIGZsb2F0aW5n
LXBvaW50IHJlZ2lzdGVyIGFjY2VzcwogICAgICBLVk06IHJpc2N2OiBGaXggU3BlY3RyZS12MSBp
biBQTVUgY291bnRlciBhY2Nlc3MKClJhZGltIEtyxI1tw6HFmSAoMSk6CiAgICAgIFJJU0MtVjog
S1ZNOiBmaXggb2ZmLWJ5LW9uZSBhcnJheSBhY2Nlc3MgaW4gU0JJIFBNVQoKV2FuZyBZZWNoYW8g
KDEpOgogICAgICBSSVNDLVY6IEtWTTogU2tpcCBUSFAgc3VwcG9ydCBjaGVjayBkdXJpbmcgZGly
dHkgbG9nZ2luZwoKIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgfCAxNSArKysrKysrKysr
LS0KIGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jICAgfCAyMyArKysrKysrKysrLS0tLS0tLS0t
CiBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgIHwgMTggKysrKysrKysrKystLS0tCiBhcmNo
L3Jpc2N2L2t2bS9haWFfaW1zaWMuYyAgIHwgIDQgKysrKwogYXJjaC9yaXNjdi9rdm0vbW11LmMg
ICAgICAgICB8ICA2ICsrKystCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X2ZwLmMgICAgIHwgMTcgKysr
KysrKysrKy0tLS0KIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgfCA1NCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9w
bXUuYyAgICB8IDE2ICsrKysrKysrKy0tLS0KIDggZmlsZXMgY2hhbmdlZCwgMTA5IGluc2VydGlv
bnMoKyksIDQ0IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
