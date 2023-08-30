Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AD8C6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 21:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUSMVOmI7j/LVVEfnpdVdIKa8d3MfbfUS/AfT+NHPIU=; b=SZeduknRg0vGNs
	NyyvZscCHCBJWBB3/V4EHeKjuB+aNP9V5BJx0fZUjkwsjpmpMQRappUz+hFCVHvRl434riUvFcbaz
	THzS8ZAhYi2wnULRRJc/VMLCseukY+S3LxLtBucqm3Bg9AMxlCv2MrjWbNX+rQbWIIYlakCty1TKS
	2KJvyy0lz+wgj0hGNGsZU4enckp6p8hNbQidyowP9Ov2bVVLsibDfhis+BZYOMn/jFn8mY9lCSY1x
	H8FE+QqcvsOPRvORVg3Rfk2a1p3wlF1RS82wEbBPYSX9r3/9UHMNUfj2V6nX63JQ/c0hItjAsdlDk
	7lN1CDsOzzV2WhtWUruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbSmU-00ECgn-1G;
	Wed, 30 Aug 2023 21:31:18 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbSmS-00ECfk-0g
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 21:31:17 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-64f92ca5d8bso1109516d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 14:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693431068; x=1694035868; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrR3h31lbTk9xkTFf3cxnvH3CTKI0f+A5tILf14Z9rU=;
        b=o7E2zPa+9msjat1GDMNm0lGRNPfw2T3fkZ0bjGbxf8Koziv/UZi53ovHdZkzHppwLB
         KIzu/bNNYuxL6gF3kDxuxG8/lqIFKKeurpnJtxVgVYSMTDreVCmZMsD/ecFf18vkZW+z
         GDF7xRLzTcJlCww+r+DQ4drbmXcaCkg/cO83AKlK550WlT8wNAr7ZGug6cvo7H/P57sN
         JEeCKXyWjhX95bKmf7U2Dck4Y7ml712OPqLctnCB81F+aAq64MTgjavDsZ2ebhqsuj2O
         zMv401T6rxPNyXQK3NvOvJFnQjDgYgW8+p/YdPXXy6l1l3Xmi7SeJN4NCInhmfjuT35T
         Hhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693431068; x=1694035868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KrR3h31lbTk9xkTFf3cxnvH3CTKI0f+A5tILf14Z9rU=;
        b=j8mezwHbmOc1LMMpp+oV16U4ODWXcWeCR5k3vWny4A9H6JmlQRpSe7DMgUATUUznFA
         8WNiN0pLtwYO1Xl3wvKpqWLWcaMdmMgCKO69CS996wms23ub0TOfTGnnmxOg5XuaYjfY
         d60EMrvllrdQw7W6rwMYv5Lmp3OUEI4WXGIMgS2jm2HnA2Sxl42j0qcseUv4eakSVwoX
         ztRnc5Mn/kC3zCTUD8fVO7hvsZHIJpwTDtAk37Xaxp/ig5MIcOBQfNwLxyM2/NMq3r67
         r1IHhRRbTA2I7reZjcW6Osm3w5BvvNATVC9Pn/JCJhazGIHyFWCesl+WR+vEe4fuvaTr
         0jsg==
X-Gm-Message-State: AOJu0YyEPse60pyqDjspqt1SinHjq81gFbo64tDmAZotWL7fn/rFjf07
	NUlFcpcQlfPBCEl44tLbV054ZhUOR50FlgWwMLkX2w==
X-Google-Smtp-Source: AGHT+IGrjJEwv2qzVN9QCDg++IKj/hIoaTc9P6YamyZpMeXxSw8x87Z+YFRb68fzXttUiOA1D22LxFIYohGyo3SEQJU=
X-Received: by 2002:a0c:cc13:0:b0:641:8ba9:68ab with SMTP id
 r19-20020a0ccc13000000b006418ba968abmr1039748qvk.42.1693431068402; Wed, 30
 Aug 2023 14:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230722123850.634544-1-alexghiti@rivosinc.com>
In-Reply-To: <20230722123850.634544-1-alexghiti@rivosinc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 30 Aug 2023 14:30:31 -0700
Message-ID: <CABCJKucj78p4TBtXYmMdJ=vYK69XC=XU06uB+_fyfZLRnC4h0A@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] riscv: Introduce KASLR
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>, 
	Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_143116_250561_BAABDFF8 
X-CRM114-Status: GOOD (  16.12  )
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

SGkgQWxleGFuZHJlLAoKT24gU2F0LCBKdWwgMjIsIDIwMjMgYXQgNTozOeKAr0FNIEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZm9sbG93aW5n
IEtBU0xSIGltcGxlbWVudGF0aW9uIGFsbG93cyB0byByYW5kb21pemUgdGhlIGtlcm5lbCBtYXBw
aW5nOgo+Cj4gLSB2aXJ0dWFsbHk6IHdlIGV4cGVjdCB0aGUgYm9vdGxvYWRlciB0byBwcm92aWRl
IGEgc2VlZCBpbiB0aGUgZGV2aWNlLXRyZWUKPiAtIHBoeXNpY2FsbHk6IG9ubHkgaW1wbGVtZW50
ZWQgaW4gdGhlIEVGSSBzdHViLCBpdCByZWxpZXMgb24gdGhlIGZpcm13YXJlIHRvCj4gICBwcm92
aWRlIGEgc2VlZCB1c2luZyBFRklfUk5HX1BST1RPQ09MLiBhcm02NCBoYXMgYSBzaW1pbGFyIGlt
cGxlbWVudGF0aW9uCj4gICBoZW5jZSB0aGUgcGF0Y2ggMyBmYWN0b3JpemVzIEtBU0xSIHJlbGF0
ZWQgZnVuY3Rpb25zIGZvciByaXNjdiB0byB0YWtlCj4gICBhZHZhbnRhZ2UuCj4KPiBUaGUgbmV3
IHZpcnR1YWwga2VybmVsIGxvY2F0aW9uIGlzIGxpbWl0ZWQgYnkgdGhlIGVhcmx5IHBhZ2UgdGFi
bGUgdGhhdCBvbmx5Cj4gaGFzIG9uZSBQVUQgYW5kIHdpdGggdGhlIFBNRCBhbGlnbm1lbnQgY29u
c3RyYWludCwgdGhlIGtlcm5lbCBjYW4gb25seSB0YWtlCj4gPCA1MTIgcG9zaXRpb25zLgo+Cj4g
YmFzZS1jb21taXQtdGFnOiB2Ni41LXJjMQoKVGhhbmtzIGZvciBjb250aW51aW5nIHRvIHdvcmsg
b24gdGhpcyEKCkkgcmV2aWV3ZWQgdGhlIHBhdGNoZXMgYW5kIHRoZSBjb2RlIGxvb2tzIGNvcnJl
Y3QgdG8gbWUuIEkgYWxzbwphcHBsaWVkIHRoZSBzZXJpZXMgb24gdG9wIG9mIHY2LjUgYW5kIGFm
dGVyIHBhdGNoaW5nIHFlbXUgdG8gcHJvdmlkZSBhCmthc2xyLXNlZWQsIEkgY29uZmlybWVkIHRo
YXQgdGhlIHZpcnR1YWwgb2Zmc2V0IGFwcGVhcnMgdG8gYmUgcmFuZG9tCmFuZCBpcyBwcmludGVk
IG91dCB3aGVuIEkgcGFuaWMgdGhlIG1hY2hpbmU6CgojIGVjaG8gUEFOSUMgPiAvc3lzL2tlcm5l
bC9kZWJ1Zy9wcm92b2tlLWNyYXNoL0RJUkVDVApbICAgMTcuNTEwMDEyXSBsa2R0bTogUGVyZm9y
bWluZyBkaXJlY3QgZW50cnkgUEFOSUMKWyAgIDE3LjUxMDQxMV0gS2VybmVsIHBhbmljIC0gbm90
IHN5bmNpbmc6IGR1bXB0ZXN0ClsuLi5dClsgICAxNy41MTg2OTNdIEtlcm5lbCBPZmZzZXQ6IDB4
MzJjMDAwMDAgZnJvbSAweGZmZmZmZmZmODAwMDAwMDAKCkZvciB0aGUgc2VyaWVzOgpSZXZpZXdl
ZC1ieTogU2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZhbmVuQGdvb2dsZS5jb20+CgpJIGRpZG4ndCB0
ZXN0IHRoZSBFRkkgYml0cywgYnV0IHRoZSByZXN0IG9mIHRoZSBzZXJpZXM6ClRlc3RlZC1ieTog
U2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZhbmVuQGdvb2dsZS5jb20+CgpDb25vciwgaW4gYW5vdGhl
ciByZXBseSB5b3UgbWVudGlvbmVkIHlvdSdyZSBwbGFubmluZyBvbiByZXZpZXdpbmcgdGhlCnBh
dGNoZXMgYXMgd2VsbC4gRGlkIHlvdSBoYXZlIGFueSBmZWVkYmFjayBvciBjb25jZXJucz8KClNh
bWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
