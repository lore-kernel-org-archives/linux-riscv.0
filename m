Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE00C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 07:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgxeyt5AbZ9+3Szs+iOklwkpY5yxB6Ri+s9xWCtmdWE=; b=ylnF+MzUtdOLEd
	zwIZaq3MJBeb7p1aq2EjQnKn3XM+udizJXMkDwmRmOTqbugDq6fLIKt65JhLsFZAK29Ma/mR1bI6N
	OFCfFylUq8EEWHjtWwpP8COhdlE3jE3EGvcbFsyu908hoH9+uHebXJYsflxuueRtZmbGAF2Q8zvrU
	wY+ajTWfwGu5sM0s/i48ofmzIqEZqrqaVGgxISnobppHLXqpDxP2ITmb6DDrAvE8qasipK3+wG32k
	v92O/HMXshAer0RQQbf7221/95s9ZgVigZogVjgzq8XhdJIBW17XU4icYkjuyPJgdV3fvFE5m5sNJ
	ByGMPOZdbZZOOXKK+T3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7BT-00AYx6-Bw; Wed, 01 Feb 2023 07:05:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN7BQ-00AYuj-AS
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 07:05:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so613789wmb.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 23:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8gKGvK+r7EDr5He9Gl8MsjplN89RsEBb0xFGFSeoWY=;
        b=ZDfGYSydUbs+W/mZ/JEdD6Q+8lcaLxLNi99HmCRr8gzdobuZMw/guj3LdnXcCx0jfS
         i/DhUZgi36mxwP7NxLmv/bIWDlAEd3yc/osBtAxPRl9qH8KIMR349F6AFdABhD0Qtn0I
         HSXoUmkKir6bff3h+lW+pB/Z6iRz6Ai4zv38CN1gpBrya5U682EU/6QBVmCPDYDVISYV
         d2oMFyDeR7jUfDue8RH6lTl0NRpDwaVv06H4rEPbemSqpTVQGx29KqonFPRPoXIoJSyM
         nTBEfeMaLzABTZMAIS0EzErF5H5641OBt4VdmoZuijfWPIN8aeuwXKeNd2jAvv526ZVF
         LYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8gKGvK+r7EDr5He9Gl8MsjplN89RsEBb0xFGFSeoWY=;
        b=klKueTB3ik6HYIA0Q30poM/qlJYAVb5pZuWS9fCu0P4aAPg5EXYh2DhUis4bwLyLEI
         wuerIisQMWkFGgbIxTPn0qmMdJbJVoGFv/j0F9lS7UTB/7MqoqKDHgXXhCu9FASCJcHy
         dG7OAtZbZqgkAsVIb8+QXZSrvAxX3+iS8293tGqkEM9DoK+bMZz0IcLnAiQ9c0+GlbQC
         7JPP7QXQJl/QcNterXWrTdL17Ovbjy4VjpDhGK/Bi+jei94N3LuLcrRztjDhIoSZ/vlE
         ExAUUd0Ls1IlkAdY5XlvsACKTzxehre9SpSFoEKtb3TRn85zxJt2CqnLNyujn1S39U3w
         8fxg==
X-Gm-Message-State: AO0yUKWpZYheMolq8kMsoDVhNkwyLlkWjUhiUNlXGCsGtc0frBOdiwG0
	uVcw8qNh/iIpmwyQ4MFbk3O3/g==
X-Google-Smtp-Source: AK7set+k/wPPr1ZjoqjkmJ3suXeJsAYSrNEbwNPRfVbpz2KUV//5EoU3DiEoIgpuYmPe3INabtxGwA==
X-Received: by 2002:a05:600c:4fd3:b0:3dc:5b88:e6dd with SMTP id o19-20020a05600c4fd300b003dc5b88e6ddmr914970wmq.10.1675235123776;
        Tue, 31 Jan 2023 23:05:23 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id r12-20020a05600c35cc00b003d9fba3c7a4sm800681wmq.16.2023.01.31.23.05.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Jan 2023 23:05:23 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [QUERY]: Block region to mmap
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <Y9oHT1D1X9cdHLr0@infradead.org>
Date: Wed, 1 Feb 2023 07:05:22 +0000
Cc: Matthew Wilcox <willy@infradead.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Linux-MM <linux-mm@kvack.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>
Message-Id: <11BE997B-93C7-4D38-99BF-FD025A1FB945@jrtc27.com>
References: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
 <Y9KQPxzHBuZGIN4U@casper.infradead.org>
 <CA+V-a8uizF8sQgs8cfTwH3OnK+nvr2dXAoSOPTXCXLFnprHSeA@mail.gmail.com>
 <Y9fhOFEV0kS9U06/@casper.infradead.org> <Y9oHT1D1X9cdHLr0@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_230528_367299_3E65EE89 
X-CRM114-Status: GOOD (  20.62  )
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

T24gMSBGZWIgMjAyMywgYXQgMDY6MzEsIENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFk
Lm9yZz4gd3JvdGU6Cj4gT24gTW9uLCBKYW4gMzAsIDIwMjMgYXQgMDM6MjQ6NDBQTSArMDAwMCwg
TWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4+PiBCYXNpY2FsbHkgd2UgYXJlIG1ha2luZyB1c2Ugb2Yg
dGhlIG1lbW9yeSBwcm90ZWN0aW9uIHVuaXQgKE1QVSkgc28KPj4+IHRoYXQgb25seSBNLW1vZGUg
aXMgYWxsb3dlZCB0byBhY2Nlc3MgdGhpcyByZWdpb24gYW5kIFMvVSBtb2RlcyBhcmUKPj4+IGJs
b2NrZWQuCj4+IAo+PiBUaGlzIHNvdW5kcyBsaWtlIFJJU0MtViB0ZXJtaW5vbG9neS4gIEkgaGF2
ZSBubyBpZGVhIHdoYXQgTSwgUyBvciBVCj4+IG1vZGVzIGFyZSAoU3VwZXJ2aXNvciBhbmQgVXNl
ciwgSSdkIGd1ZXNzIGZvciB0aGUgbGFzdCB0d28/KQo+IAo+IAo+IFllcywgTSA9IE1hY2hpbmUs
IFMgPSBTdXBlcnZpc29yLCBhbmQgVSA9IFVzZXIuCj4gTSBvbWRlIGlzIHRoZSBhYnNvbHV0ZWxl
IHdvcnN0IGlkZWEgb2YgUklTQy1WIGFuZCBiYXNpY2FsbHkgYSBtaXgKPiBvZiBtaWNyb2NvZGUg
YW5kIHN1cGVyLVNNTSBtb2RlLgo+IAo+PiBCZWZvcmUgd2UgZ28gdG9vIGRlZXBseSBpbnRvIGl0
LCBob3cgbXVjaCB3b3VsZCBpdCBjb3N0IHRvIGJ1eSBhbGwgb2YKPj4gdGhlc2UgcGFydHMgYW5k
IGZlZWQgdGhlbSBpbnRvIGEgc2hyZWRkZXI/ICBJJ20gbm90IGVudGlyZWx5IGpva2luZzsKPj4g
aWYgaXQncyBsZXNzIHRoYW4gdGhlIHNvZnR3YXJlIGVuZ2luZWVyaW5nIHRpbWUgaXQnZCB0YWtl
IHRvIGRldmVsb3AKPj4gYW5kIHN1cHBvcnQgdGhpcyBmZWF0dXJlLCB3ZSBzaG91bGQgZG8gaXQu
Cj4gCj4gVGhlIGFib3ZlIHN1Z2dlc3RzIHRoaXMgaXMgaW4gbm8gd2F5IGFuIGFjdHVhbCBoYXJk
d2FyZSBwcm9ibGVtLCBidXQgdGhlCj4gc3R1cGlkIGRlY2lzaW9uIGlzIGRvbmUgaW4gdGhlIE0t
TW9kZSBmaXJtd2FyZS4gIEkgdGhpbmsgaXQgaXMgdmVyeQo+IHJlYXNvbmFibGUgdG8gc2ltcGx5
IG5vdCBzdXBwb3J0IHRoZSBkZXZpY2VzIGluIExpbnV4IHVudGlsIHRoZSBmaXJtd2FyZQo+IGlz
IGZpeGVkLgoKTm8sIGl0IHJlYWxseSBpcyBhIGhhcmR3YXJlIHNwZWMgdmlvbGF0aW9uLiBWaXJ0
dWFsIGFkZHJlc3NlcyB3aXRoaW4KdGhlIG1hZ2ljIHJhbmdlIGJ5cGFzcyB0cmFuc2xhdGlvbiB3
aXRoIG5vIHdheSB0byB0dXJuIGl0IG9mZi4gVGhlCmZpcm13YXJlIGlzIGJlaW5nIChoYXMgYmVl
bj8pIHBhdGNoZWQgdG8gYmxvY2sgdGhvc2UgYWNjZXNzZXMgYXQgdGhlCnBoeXNpY2FsIG1lbW9y
eSBwcm90ZWN0aW9uIGxldmVsIHNvIGFueSBhdHRlbXB0IHRvIHVzZSB0aG9zZSB2aXJ0dWFsCmFk
ZHJlc3NlcyB3aWxsIGZhdWx0LCBidXQgaWYgTGludXggd2FudHMgdG8gc3VwcG9ydCB0aGlzIGN1
cnNlZApoYXJkd2FyZSBhbmQgaXRzIGdyb3NzIHNwZWMgdmlvbGF0aW9uIHRoZW4gaXQgbmVlZHMg
dG8gZm9yYmlkIGFueQphbGxvY2F0aW9uIG9mIHRoZSBWQSByYW5nZS4KClRoaXMgbWFnaWMgcmFu
Z2UgYWxzbyBvdmVybGFwcyB3aXRoIHRoZSBkZWZhdWx0IGJhc2UgYWRkcmVzcyB1c2VkIGZvcgpi
b3RoIEdOVSBsZCBhbmQgTExWTSBMTEQsIGZvciBhZGRlZCBlbnRlcnRhaW5tZW50LCBzbyBhbG1v
c3QgZXZlcnkKcG9zaXRpb24tZGVwZW5kZW50IGJpbmFyeSB0aGF0IGV4aXN0cyBpbiB0aGUgd29y
bGQgZm9yIFJJU0MtViBjYW5ub3QgYmUKcnVuIG9uIHRoaXMgaGFyZHdhcmUuIE9uZSBjb3VsZCBj
aGFuZ2UgdGhhdCBmb3IgZnV0dXJlIGJpbmFyaWVzLCBidXQKdGhhdCBkb2VzbuKAmXQgc2VlbSBy
aWdodCB0byBtZS4uLiBJTU8gdGhpcyBoYXJkd2FyZSBpcyBldmVuIG1vcmUg4oCcbm90ClJJU0Mt
VuKAnSB0aGFuIHRoZSBEMSB3aXRoIGl0cyBwYWdlIHRhYmxlIG1lc3MsIGJ1dCBJIGRvbuKAmXQg
dGhpbmsgd2XigJlsbApldmVyIHNlZSBSSVNDLVYgSW50ZXJuYXRpb25hbCBjb21lIG91dCBhbmQg
c2F5IHRoYXQsIHNvIGl04oCZcyB1cCB0byB0aGUKb3Blbi1zb3VyY2UgY29tbXVuaXRpZXMgdG8g
ZGVjaWRlIHdoYXQgdGhleSB3YW50IHRvIHN1cHBvcnQgYW5kIHdoYXQKdGhleSB2aWV3IGFzIHRv
byBtdWNoIG9mIGEgdmlvbGF0aW9uIHRvIGJlIGFjY2VwdGFibGUuCgpKZXNzCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
