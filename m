Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B79CAC5B8
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 23:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBm66QkY+wshg56sz30r0LYC7AqxBxDobpVDxyWoaaM=; b=WUOzyhGMXZer++
	FEUINn+PLWi/btQshOv0UlZt2AlHULzMAB0prV41muweh9VP/4oE27PJ490hxJYRkEpt6piOyKfC0
	nr2cy6/P7gBcNVmIZ47lgV6iUhGYKKI076QyaHXHH5y9+IxfsMuw/TxfWHMIDSU8H3+38+pWokvbI
	rJTR+Nahzem81b4Q/xFQ1dAmDBgnladjPLLl4BoXZrW81zBTR6P+a/TFma67NbMzPIdUpnvE8NjVl
	S0Hd7GwJ7YvixK5tAi2idVnkkVmqoLo7XIHz20iBj4aHZE42DyWxOc5ugXWTbUiX101/Ai7nHfFNT
	as3pLSEdhRFL12fzyarg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3kAF-00000006OGr-2ytF;
	Tue, 30 Sep 2025 23:53:47 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3kAD-00000006OG4-0eHx
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 23:53:46 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b3b27b50090so648976466b.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Sep 2025 16:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1759276423; x=1759881223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h3FgMGsAF0plFk4zuPYd3xzqTmZvpyQhfjL8rI22Lo=;
        b=CJ/Fbn85AdHzsnG1orxrDoD6FcaAEIGoRLobawVR2Oq21E4Kf+QKATNTmphXY7ggKs
         TpvAN2iS68caqzyqj0LkeLUXZfVZ84IZNkjGdHmxFN147g/fsrqPD99s6OJn+H0d9fQ2
         aur8boewFMRRnnhbpSN6QdddCak+6F8lOsvJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759276423; x=1759881223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h3FgMGsAF0plFk4zuPYd3xzqTmZvpyQhfjL8rI22Lo=;
        b=mKQyT+67+/Vn0kxBC7992BhCBxl17IG18uGlVbaDOuOmvlbegLO7IhiKlXpMZUaVi2
         /4ueaV1r/Cal0VjaTqWH9ScIKCmE04Zn7USdx+tsjGCLBAXa4+jtsatt1LsLEEmIZmXh
         0ztB1e44nEKo9MFJhg/o+haxF96Hb5Sb1vPHvESdN2nKXT18ED6TqDsBNzeB/lCsJMKP
         FkMZTNzv1+hoHupV3h7kC1uvmLxowRJpwYz4Xpzemm+NRKDXAYv8PqDBmA3iUBbJ43F0
         lve5p8OoWLLYHv2Npg1hnUEU8YeFPkOek5kuOhO0ExpebWykmfbnbybdty6/cpuDlSIm
         t2Vg==
X-Forwarded-Encrypted: i=1; AJvYcCX0jAIeHhy70dqWgYDgduJVk4lv5v7n1WoT226SiQPrUo/qsOAKi3PrCI5pui0nYrPLQJ/hkwytIJd5kg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrgijBOMVJyy4wo+WzoymJJmG7tgPV5jIDyldmWeyI8jWKivFN
	+MJMdsrS3qVKRiSmI+4eUvUm3ze7rwct0/9pfKarfXfXPwD5ZgBEISPX2SRm3KYS1ldmHNGqogn
	oIC0Gv4M=
X-Gm-Gg: ASbGncsHYhy6lZ7/SbGXm4hZNNuJKdYcgcKm0+zNdC5qPNiqOZzjpnM4r7YeSTGD5Ul
	14YUVRyeoubBQjyk4INMNzse6X07cy0QoLK/Fw+e/+Mluckg/8ZjKBr8k+oDpUVtYYelXeR8H2+
	E+wl6+N2ulUFHbeAipSQJt+ikwORRpDPLj0+Kg5NwYUnaX4HgKy9IYwVPXISERMlIpuVwokLyUI
	8N+KcDX0kymNTlWHIbmV2Z+wv9C6n4w+ewy4mZrXgni4TySAlMUOCjY7enELOpGpBZPuERnS/rX
	sLDuJ5h1lzaDjb056b8WYhqYGLqNQlnbeun7VC/4n4nEYj8SiSftmwot0tSw/2jDTqhdz+9rPpk
	ThOXLCQAhySSDHSiXV1sPQ8ATwSafkISRvawmWn52jbmDF+jmkBqyXLMh2uvAiAUUegOwX3aKxt
	LxCGycMGNkzp/HR0KxWQFP
X-Google-Smtp-Source: AGHT+IH6hPdDE15mXjWDFRrqojsoM7hgQNiMHmO1C0anJfRTtoUsIa4+epCZ9a1Q9sgfP+F+jh1zxg==
X-Received: by 2002:a17:907:9404:b0:b2d:830a:8c17 with SMTP id a640c23a62f3a-b46e612d2b3mr168948866b.56.1759276422917;
        Tue, 30 Sep 2025 16:53:42 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a983ffsm1254867166b.94.2025.09.30.16.53.41
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 16:53:41 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3b27b50090so648973066b.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Sep 2025 16:53:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvWpLr8DEkpd9vsXUkCt1cIbHddOciAMsuv/DcYE8DXD2ByG8I4OlScX+zbUpkz4bZKzMLbhzQsxNp+Q==@lists.infradead.org
X-Received: by 2002:a17:907:25c9:b0:b3d:b8c3:768d with SMTP id
 a640c23a62f3a-b46e0daad49mr180171266b.7.1759276421427; Tue, 30 Sep 2025
 16:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
 <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk> <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com>
In-Reply-To: <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 30 Sep 2025 16:53:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgYcOiFvsJzFb+HfB4n6Wj6zM5H5EghUMfpXSCzyQVSfA@mail.gmail.com>
X-Gm-Features: AS18NWCgDHu8MuPyS-TiEIKJaGU60doaJ515YpT3XFOuRRfLKrmyR46GA4zDZis
Message-ID: <CAHk-=wgYcOiFvsJzFb+HfB4n6Wj6zM5H5EghUMfpXSCzyQVSfA@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_165345_249627_80023DDE 
X-CRM114-Status: GOOD (  14.43  )
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

T24gVHVlLCAzMCBTZXB0IDIwMjUgYXQgMDk6MDQsIExpbnVzIFRvcnZhbGRzCjx0b3J2YWxkc0Bs
aW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPaCBDaHJpc3QuIElzIHNvbWVib2R5IHNl
cmlvdXNseSB3b3JraW5nIG9uIEJFIHN1cHBvcnQgaW4gMjAyNT8KCk9rLCBJIGp1c3QgZ29vZ2xl
ZCB0aGlzLCBhbmQgSSBhbSBwdXR0aW5nIG15IGZvb3QgZG93bjoKCiBXRSBBUkUgTk9UIFBSRUVN
UFRJVkVMWSBTVVBQT1JUSU5HIEJJRy1FTkRJQU4gT04gUklTQy1WCgpUaGUgZG9jdW1lbnRlZCAi
cmVhc29uaW5nIiBmb3IgdGhhdCBjcmF6aW5lc3MgaXMgdG9vIHN0dXBpZCBmb3Igd29yZHMsCmJ1
dCBzaW5jZSByaXNjdi5vcmcgZGlkIHB1dCBpdCBpbiB3b3JkcywgSSdsbCBqdXN0IHF1b3RlIHRo
b3NlIHdvcmRzCmhlcmU6CgogIlRoZXJlIGFyZSBzdGlsbCBhcHBsaWNhdGlvbnMgd2hlcmUgdGhl
IHdheSBkYXRhIGlzIHN0b3JlZCBtYXR0ZXJzLApzdWNoIGFzIHRoZSBwcm90b2NvbHMgdGhhdCBt
b3ZlIGRhdGEgYWNyb3NzIHRoZSBJbnRlcm5ldCwgd2hpY2ggYXJlCmRlZmluZWQgYXMgYmlnLWVu
ZGlhbi4gU28gd2hlbiBhIGxpdHRsZS1lbmRpYW4gc3lzdGVtIG5lZWRzIHRvIGluc3BlY3QKb3Ig
bW9kaWZ5IGEgbmV0d29yayBwYWNrZXQsIGl0IGhhcyB0byBzd2FwIHRoZSBiaWctZW5kaWFuIHZh
bHVlcyB0bwpsaXR0bGUtZW5kaWFuIGFuZCBiYWNrLCBhIHByb2Nlc3MgdGhhdCBjYW4gdGFrZSBh
cyBtYW55IGFzIDEwLTIwCmluc3RydWN0aW9ucyBvbiBhIFJJU0MtViB0YXJnZXQgd2hpY2ggZG9l
c27igJl0IGltcGxlbWVudCB0aGUgWmJiCmV4dGVuc2lvbiIKCkluIG90aGVyIHdvcmRzLCBpdCBp
cyBzdWdnZXN0aW5nIHRoYXQgUklTQy1WIGFkZCBhIGJpZy1lbmRpYW4gbW9kZSBkdWUgdG8KCiAo
YSkgaW50ZXJuZXQgcHJvdG9jb2xzIC0gd2hlcmUgYnl0ZSBzd2FwcGluZyBpcyBub3QgYW4gaXNz
dWUKCiAoYikgdXNpbmcgInNvbWUgUklTQy1WIGltcGxlbWVudGF0aW9ucyBkb24ndCBkbyB0aGUg
ZXhpc3RpbmcgWmJiCmV4dGVuc2lvbiIgYXMgYW4gZXhjdXNlCgpUaGlzIGlzIHBsYWluIGluc2Fu
aXR5LiBGaXJzdCBvZmYsIGV2ZW4gaWYgYnl0ZSBzd2FwcGluZyB3YXMgYSByZWFsCmNvc3QgZm9y
IG5ldHdvcmtpbmcgLSBpdCdzIG5vdCwgdGhlIHJlYWwgY29zdHMgdGVuZCB0byBiZSBhbGwgaW4K
bWVtb3J5IHN1YnN5c3RlbXMgLSBqdXN0IGltcGxlbWVudCB0aGUgZGFtbiBaYmIgZXh0ZW5zaW9u
LgoKRG9uJ3QgZ28gIndlJ3JlIHRvbyBpbmNvbXBldGVudCB0byBpbXBsZW1lbnQgWmJiLCBzbyB3
ZSdyZSBub3cgYXNraW5nCnRoYXQgRVZFUllCT0RZIEVMU0UgZmVlbCB0aGUgcGFpbiBvZiBhIG11
Y2ggKndvcnNlKiBleHRlbnNpb24gYW5kCmZyYWdtZW50aW5nIFJJU0MtViBmdXJ0aGVyIi4KCkkn
bSBob3BpbmcgdGhpcyBpcyBzb21lIEFwcmlsIGZvb2xzIGpva2UsIGJ1dCB0aGF0IHBhZ2UgaXMg
ZGF0ZWQKIk1hcmNoIDEwLCAyMDI1Ii4gQ2xvc2UsIGJ1dCBub3QgY2xvc2UgZW5vdWdoLgoKVGhp
cyBpcyB0aGUga2luZCBvZiBzaWxseSBzdHVmZiB0aGF0IGp1c3QgbWFrZXMgUklTQy1WIGxvb2sg
YmFkLgoKQmVuIC0gSSdtIGFmcmFpZCB0aGF0IHRoYXQgcGFnZSBoYXMgImZ1cnRoZXIgcmVhZGlu
ZyIgcG9pbnRpbmcgdG8gY29kZXRoaW5rLgoKSSBzZWUgc29tZSBDT05GSUdfQ1BVX0JJR19FTkRJ
QU4gaGFzIGFscmVhZHkgbWFkZSBpdCBpbiwgYnV0IHRoaXMKbmVlZHMgdG8gc3RvcC4KClRoZSBt
YWlubGluZSBrZXJuZWwgaXMgZm9yIG1haW5saW5lIGRldmVsb3BtZW50LiBOb3QgZm9yIHJhbmRv
bQpleHBlcmltZW50cyB0aGF0IG1ha2UgdGhlIHdvcmxkIGEgd29yc2UgcGxhY2UuCgpBbmQgeWVz
LCB3ZSdyZSBvcGVuIHNvdXJjZSwgYW5kIHRoYXQgdmVyeSBtdWNoIG1lYW5zIHRoYXQgYW55Ym9k
eSBpcwptb3JlIHRoYW4gd2VsY29tZSB0byB0cnkgdG8gcHJvdmUgbWUgd3JvbmcuCgpJZiBpdCB0
dXJucyBvdXQgdGhhdCBCRSBSSVNDLVYgYmVjb21lcyBhIHJlYWwgdGhpbmcgdGhhdCBpcyByZWxl
dmFudAphbmQgYWN0dWFsbHkgZmluZHMgYSBwbGFjZSBpbiB0aGUgUklTQy1WIGVjb3N5c3RlbSwg
dGhlbiBfb2ZfY291cnNlXwp3ZSBzaG91bGQgc3VwcG9ydCBpdCBhdCB0aGF0IHBvaW50IGluIHRo
ZSBtYWlubGluZSBrZXJuZWwuCgpCdXQgSSByZWFsbHkgZG8gdGhpbmsgdGhhdCBpdCBhY3R1YWxs
eSBtYWtlcyBSSVNDLVYgb25seSB3b3JzZSwgYW5kCnRoYXQgd2Ugc2hvdWxkICpub3QqIGFjdGl2
ZWx5IGhlbHAgdGhlIGZyYWdtZW50YXRpb24uCgogICAgICAgICAgICAgTGludXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
