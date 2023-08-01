Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56230EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 23:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1aFYq1G+294eo6IfLLksJ/fErrn4Fjd7AfPHniITR3k=; b=M9zF8DieY5Z3JO
	tbRbQOmyr3g4zaD/lt1zQM8Jpg7q/fG4tb/+e8pKMHYrAEiRRautrudmKlocvBY2HHYqlBt3MQhys
	c29L/g74Tew99mgyRiEJBJK4AI+xVeFKNd9s810V4eOUaJv4FJCYWjVf3rzWxLjGSTYgRCKqZ2eLz
	qFxWWEt8s3CNw7NrxRLfpHXEY1f+2O5dG3O1Ky5bC2CJuahA9S8WWwEMT7cHilmqdHrPPJhwhirOB
	s3Dixp50FlYfIxQOzKWq6XYwmNd8bPhVXFDKsgB7ya0wIkzca1n5PKuU0//CHQQ4H8I9CqEDQUa6Z
	eQOe01mVq+s7272obbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQypM-003WO9-01;
	Tue, 01 Aug 2023 23:30:56 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQypJ-003WMw-1Q
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 23:30:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b9c368f4b5so2335575ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 16:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690932650; x=1691537450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=86m4GR9B2OpRjtzGq0slUUGfFWMp1qBl7r1sdnV44Zs=;
        b=oXOhuADoyGWQ0CpVMkCDvFuSa4MXFW5gBBca+inDX7DNEkDMKdcSKpP8pXSZcsbbO+
         EIOlo1oFFw1605QRbVWA9tfP9iBqWxz3Xu+rhDQw5/MNdKajZBtt3x5na7aGFaHYwOC5
         wrb8HxEp7OxMNzzJzwG4X/qfizVI2QJMmqjSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690932650; x=1691537450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86m4GR9B2OpRjtzGq0slUUGfFWMp1qBl7r1sdnV44Zs=;
        b=L1oQ9NqnGkAegWzDAOUtLMduM+E5DryJGRf0E+epS7WTCjlcTWZkPYE4xrL8Ns3NVr
         ziBPQP/CNJYDhLFk9I2RUOwvFFP+59EEAdrRyThIA8vLEAYmbVW8TrmQmIkTicsB2/Jv
         +D6xr4b2zkbnDu7Ye6NyopEG6dU3C2QlaM6HBo/zVdEjottUhcK7iGBgQNqmemvNhriW
         LiSvr8txdR2hR6CqLIL/k/pRGxDm4ZYgK/A2F0mpgonMo7VwNwzyyA/0Tbow2JUW78JL
         6QVn7iKI65YeK82Frs8Z1155hxrxqED2N4V6Yp88nX1ZNnSze1+XcT/prRNFiqEsuTKn
         W3RQ==
X-Gm-Message-State: ABy/qLa6g7GnTrIBvCUOZR01LPoj8C/6w3NycUUj3zzBz7tYC5ClAF0J
	oxkC9dnUozX+1HCkSkrXhtY0qA==
X-Google-Smtp-Source: APBJJlF+gVNSruf2vthO1DrYzubB+mB7El3VzV9i7PDZy0XViadbu4f6RZq+Mn8fxhqwRga5R1HwMQ==
X-Received: by 2002:a17:902:d4c3:b0:1b8:a936:1915 with SMTP id o3-20020a170902d4c300b001b8a9361915mr15677302plg.22.1690932649870;
        Tue, 01 Aug 2023 16:30:49 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jh3-20020a170903328300b001b8b6a19bd6sm11021366plb.63.2023.08.01.16.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 16:30:49 -0700 (PDT)
Date: Tue, 1 Aug 2023 16:30:48 -0700
From: Kees Cook <keescook@chromium.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Justin Stitt <justinstitt@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] RISC-V: cpu: refactor deprecated strncpy
Message-ID: <202308011630.913CE919@keescook>
References: <20230801-arch-riscv-kernel-v1-1-2b3f2dc0bc61@google.com>
 <61DD603A-3D86-462F-B795-7EDE3A59ABBE@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61DD603A-3D86-462F-B795-7EDE3A59ABBE@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_163053_518724_4AEC1D83 
X-CRM114-Status: GOOD (  23.09  )
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

T24gV2VkLCBBdWcgMDIsIDIwMjMgYXQgMTI6MDI6MTFBTSArMDEwMCwgSmVzc2ljYSBDbGFya2Ug
d3JvdGU6Cj4gT24gMSBBdWcgMjAyMywgYXQgMjI6MTQsIEp1c3RpbiBTdGl0dCA8anVzdGluc3Rp
dHRAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IGBzdHJuY3B5YCBpcyBkZXByZWNhdGVkIGZv
ciB1c2Ugb24gTlVMLXRlcm1pbmF0ZWQgZGVzdGluYXRpb24gc3RyaW5ncyBbMV0uCj4gPiAKPiA+
IEEgc3VpdGFibGUgcmVwbGFjZW1lbnQgaXMgYHN0cnNjcHlgIFsyXSBkdWUgdG8gdGhlIGZhY3Qg
dGhhdCBpdAo+ID4gZ3VhcmFudGVlcyBOVUwtdGVybWluYXRpb24gb24gaXRzIGRlc3RpbmF0aW9u
IGJ1ZmZlciBhcmd1bWVudCB3aGljaCBpcwo+ID4gX25vdF8gdGhlIGNhc2UgZm9yIGBzdHJuY3B5
YCEKPiA+IAo+ID4gVGhlIGBzdl90eXBlYCBidWZmZXIgaXMgZGVjbGFyZWQgd2l0aCBhIHNpemUg
b2YgMTYgd2hpY2ggaXMgdGhlbgo+ID4gZm9sbG93ZWQgYnkgc29tZSBgc3RybmNweWAgY2FsbHMg
dG8gcG9wdWxhdGUgdGhlIGJ1ZmZlciB3aXRoIG9uZSBvZjoKPiA+ICJzdjMyIiwgInN2NTciLCAi
c3Y0OCIsICJzdjM5IiBvciAibm9uZSIuIEhhcmQtY29kaW5nIHRoZSBtYXggbGVuZ3RoIGFzIDUg
aXMKPiA+IGVycm9yLXByb25lIGFuZCBpbnZvbHZlcyBjb3VudGluZyB0aGUgbnVtYmVyIG9mIGNo
YXJhY3RlcnMgKGFuZAo+ID4gaG9wZWZ1bGx5IG5vdCBmb3JnZXR0aW5nIHRvIGNvdW50IHRoZSBO
VUwtYnl0ZSkgaW4gdGhlIHJhdyBzdHJpbmcuCj4gPiAKPiA+IFVzaW5nIGEgcHJlLWRldGVybWlu
ZWQgbWF4IGxlbmd0aCBpbiBjb21iaW5hdGlvbiB3aXRoIGBzdHJzY3B5YCBwcm92aWRlcwo+ID4g
YSBjbGVhbmVyLCBsZXNzIGVycm9yLXByb25lIGFzIHdlbGwgYXMgYSBsZXNzIGFtYmlndW91cyBp
bXBsZW1lbnRhdGlvbi4KPiA+IGBzdHJzY3B5YCBndWFyYW50ZWVzIHRoYXQgaXQncyBkZXN0aW5h
dGlvbiBidWZmZXIgaXMgTlVMLXRlcm1pbmF0ZWQgZXZlbgo+ID4gaWYgaXQncyBzb3VyY2UgYXJn
dW1lbnQgZXhjZWVkcyB0aGUgbWF4IGxlbmd0aCBhcyBkZWZpbmVkIGJ5IHRoZSB0aGlyZAo+ID4g
YXJndW1lbnQuCj4gCj4gSSB3b3VsZCBpbWFnaW5lIHlvdeKAmWQgd2FudCBhIEJVR19PTigpIHJh
dGhlciB0aGFuIHNpbGVudCB0cnVuY2F0aW9uIGlmCj4gdGhhdCBldmVyIGhhcHBlbmVkICh3ZWxs
LCBzaWxlbnQgaWYgeW91IGlnbm9yZSBpdCB0aGVuIHByaW50aW5nIHRoZQo+IHRydW5jYXRlZCBz
dHJpbmcpLgo+IAo+IFRob3VnaCByZWFsbHkgeW91IGp1c3Qgd2FudCBhIHN0YXRpY19zdHJjcHkg
dGhhdCBsb29rcyBhdCBzaXplb2YqIGZvcgo+IHNvdXJjZSBhbmQgZGVzdGluYXRpb24gYW5kIGZh
aWxzIHRvIGJ1aWxkIGlmIGl0IGRvZXNu4oCZdCBmaXQ7IHRoZXJl4oCZcyBubwo+IHJlYXNvbiB0
aGlzIG5lZWRzIHRvIGJlIGZvdW5kIGF0IHJ1biB0aW1lLgoKRldJVywgdW5kZXIgQ09ORklHX0ZP
UlRJRllfU09VUkNFLCBzdHJzY3B5KCkgZG9lcyB0cnkgdG8ganVzdCBmb2xkIGF3YXkKdG8gYSBz
dGF0aWMgc3RyY3B5IHdoZW4gc2l6ZXMgYXJlIHByb3ZhYmx5IHNhZmUsIGV0Yy4KCi0tIApLZWVz
IENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
