Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5319ECD128A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 20:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=preKPbohUB50bB1LmOJVGMQbgx2U4bnTseA/1V0MByU=; b=JKlqq3REzl1tBe
	woxt8k0LPxp32OkQuMKXG2LSmrfCktGLH3yAeJDhG3KpvQRPwt872ik97HX/x8N4NTvj6gBz54tkA
	7Qt0gFSNndZAbECwmhyeAEJ4W0KzfSNYMosaX3IaJkncKs1ATShmPxTe9Cm+4d3jmFoasQGjtlink
	9yr9w/W5j8RgScXm9tYqQ/aYzHQ5k2jOOmxd3stqAM9vyXzBuNX7oEX6xko/CcNqyAPLARtZDj+Tv
	UqhxVoDtrO+6BIvtND3qRFEJPawW2keE1lXWQ3KFJzxUUtK3lvvjAgYnDD1sP4/42qf8afDpgDMEZ
	0V/6odASM7eiyOSLRj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtYjo-0000000DQB2-3rri;
	Sun, 07 Apr 2024 20:03:36 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtYjl-0000000DQ8w-0Gye
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 20:03:35 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2a2dd2221d3so2314850a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 07 Apr 2024 13:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712520210; x=1713125010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfMh48UYa1lhTnaBkcMEl7zleuPMjILYPz6KbF68Au8=;
        b=FyDtS9tEI83P9lhyciIgHAOXBtAY4du5x/DUokJuxvHOcPRULpIABo4SrJDZM9D59b
         t8kyfxAoVrwdfjBVJEXq2dGq9r5uGIyGfJNi6+PucLYmlWUe4+mVG35+zo2HMuWy3iWB
         fxOs57JTGkOpCNTbooWeLOnv4//GJF0vBVcNmjLlLKxJk31Mu635eEpILIeQSY20KgjO
         JMnCNdK1ZGq4Wg7dH+J0ZE5UI427Iy4PC9g0RZCox8l2A73yNoDxCloL7uRZ1VUVW3qH
         +CDQpM2q0OgWvec6l0/coZGQ/E59oDMwPanpy6P06dGGCgfscTa2H8Y7Ui78S6VIv4mB
         W3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712520210; x=1713125010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfMh48UYa1lhTnaBkcMEl7zleuPMjILYPz6KbF68Au8=;
        b=dNdkJMB76h96WMfz8tDjRcHBujBAfqVD0fEuA6NIWol2joxXWs9XAC2FLfkfLEbvwj
         xxTuB9KT/Tmpo0KY1aERQ8CoVX5q0mbuaMgzXAm74d4+Ibt1ZTvxhtu5DFlUz1po2xOr
         Uajtv4Bw9YTbkCW4wBfVAb93qNIJhzNL530mGgcoW5WcGhZinOZejTwLtZ4ZPvJ3mvMX
         9mDnDuIhIyMQijtPb6M8wDIFOA3ys50vtYts/ChSzbU9idRTY/IyOOnFDSvrbV/m9uwJ
         IBwpKXswDBLUJE22bytVi6WtpruTT+977vYxJcVlfa1I0jCwL6U3tKy3O7//wx/gqph7
         fGuQ==
X-Gm-Message-State: AOJu0Yypn8QaGDOcKlqw36f6Q2wEG3fI0vIswS11g2407Yi0vPkK+oLb
	L/ukA/O8ZG/n6CWcq/F2ARuaCNxAtXISIebX+K0TkYTxsnIoI0QHzTm7CNK2y/vQAYy9BHkTS9k
	GLpXKw75lAU0akMAAoT+h13G+jo8=
X-Google-Smtp-Source: AGHT+IEIt1Lru4k/Tnepu4IBYtQBsXst4gyHMFJlhgjYVHRQdcRfEYeE8aY/BvrRmgDuYCRzjKItROgB6OPb0gkL7mQ=
X-Received: by 2002:a17:90a:4dc6:b0:2a4:f53d:e732 with SMTP id
 r6-20020a17090a4dc600b002a4f53de732mr810440pjl.13.1712520210362; Sun, 07 Apr
 2024 13:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud>
In-Reply-To: <20240404-providing-emporium-e652e359c711@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Apr 2024 22:02:46 +0200
Message-ID: <CANiq72mUGAXj+ajfojfMgOD7S22Q0Y0Y4QCTxNLoNxwCSpksdg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	stable@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_130333_413468_50AFA21C 
X-CRM114-Status: GOOD (  11.31  )
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

T24gVGh1LCBBcHIgNCwgMjAyNCBhdCA0OjE34oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4KPiBPbiBSSVNDLVYgYW5kIGFybTY0LCBhbmQgcHJlc3VtYWJseSB4ODYsIGlm
IENGSV9DTEFORyBpcyBlbmFibGVkLAo+IGxvYWRpbmcgYSBydXN0IG1vZHVsZSB3aWxsIHRyaWdn
ZXIgYSBrZXJuZWwgcGFuaWMuIFN1cHBvcnQgZm9yCj4gc2FuaXRpc2VycywgaW5jbHVkaW5nIGtj
ZmkgKENGSV9DTEFORyksIGlzIGluIHRoZSB3b3JrcywgYnV0IGZvciBub3cKPiB0aGV5J3JlIG5p
Z2h0bHktb25seSBvcHRpb25zIGluIHJ1c3RjLiBNYWtlIFJVU1QgZGVwZW5kIG9uICFDRklfQ0xB
TkcKPiB0byBwcmV2ZW50IGNvbmZpZ3VyaW5nIGEga2VybmVsIHdpdGhvdXQgc3ltbWV0cmljYWwg
c3VwcG9ydCBmb3Iga2ZpLgo+Cj4gRml4ZXM6IDJmN2FiMTI2N2RjOSAoIktidWlsZDogYWRkIFJ1
c3Qgc3VwcG9ydCIpCj4gY2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKWyBNYXR0aGV3IE1h
dXJlciB3cml0ZXMgWzFdOgoKICAgIFRoaXMgcGF0Y2ggaXMgZmluZSBieSBtZSAtIHRoZSBsYXN0
IHBhdGNoIG5lZWRlZCBmb3IgS0NGSSB0byBiZQogICAgZnVuY3Rpb25hbCBpbiBSdXN0IGp1c3Qg
bGFuZGVkIHVwc3RyZWFtIGxhc3QgbmlnaHQsIHNvIHdlIHNob3VsZAogICAgcmV2aXNpdCB0aGlz
IChpbiB0aGUgZm9ybSBvZiBlbmFibGluZyBpdCkgb25jZSB3ZSBtb3ZlIHRvCiAgICBgcnVzdGMt
MS43OS4wYCBvciBsYXRlci4KCiAgUmFtb24gZGUgQyBWYWxsZSBhbHNvIGdhdmUgZmVlZGJhY2sg
WzJdIG9uIHRoZSBzdGF0dXMgb2YgS0NGSSBmb3IKICBSdXN0IGFuZCBjcmVhdGVkIGEgdHJhY2tp
bmcgaXNzdWUgWzNdIGluIHVwc3RyZWFtIFJ1c3QuICAgLSBNaWd1ZWwgXQoKWyBBZGRlZCBmZWVk
YmFjayBmcm9tIHRoZSBsaXN0LCBsaW5rcywgYW5kIHVzZWQgQ2MgZm9yIHRoZSB0YWcuIF0KCkFw
cGxpZWQgdG8gYHJ1c3QtZml4ZXNgIC0tIHRoYW5rcyBldmVyeW9uZSEgUGxlYXNlIGZlZWwgZnJl
ZSB0byBzZW5kCm1vcmUgdGFncyBmb3IgdGhpcyBvbmUuCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
