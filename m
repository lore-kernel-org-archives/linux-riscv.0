Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FC3C54E64
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PydV/zuO26D/SxNeuX/pBTl9h+EXAljlOGWWgMZVh9s=; b=pxNEPsg61M8mqv
	Rh0mnfXdA0e5oPh+M+yKAryY54yKw1rPG4CCZyFe1cYlbTQ323pkNlUUtqjhXT7YWz/i0r/JVhYHb
	LPxC/6Axdv0DBxiltmiBgOwz0AsgsdhYN9RlXoHybqPHIzkRKN674031N8czyPiJiH66YVJba8s83
	1+Hg4/TVmn7J/oOaqhijo6ncFgLPFL3y/1HtJLV/WWCZV0NP5UdDE8d8if0PZHgYssrYCldqnq7Mh
	mWfHmzUsSe02ej0AFtHLWhMTNB6+7HzVOYj8lXv1rt2mx8y90M2HPMQQ5iyHLn434CfjOTL0FpNwi
	9VUj55GHJCjeJezJoL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqxf-0000000EMtF-2MW5;
	Thu, 28 Mar 2024 14:42:35 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqxb-0000000EMq1-328H
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 14:42:33 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso691390a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 07:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1711636945; x=1712241745; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOp5govZZQSJRzD95rrhGtQGcUj+k1AZvhk4Bdb7Q3s=;
        b=iF7RG9ub6t4ET/vXSlDhMbf2GFEYDC2TYBXN2hI0QIeD+aj2C0vHtoSJne2FX36IIT
         jA3TEvhJTfY7tqNpB4/KTHGP5RmMGc2MuQR1PwvcITT0mtGN0+q1cinkQ1RRaXgWNuZj
         Z34pwLuDrZ3eL24FmlfmwoqtTap80A9UN+u256Kcb0pTEoUgmaGF+Qj6JQcrKv8pMIV7
         yIDd9cLqITbHzH64gBbtaLmttk26pGXPTL+LLKVR+QDmDptyd1BvT2FiCyWBy4sfnOlm
         e8X9IbmcpdfKNxP1t7vg+jWYbS4PSxCu5Aa7InZrD1xykGQjlp2B5okNF/P/Ph1L6gMY
         TV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711636945; x=1712241745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOp5govZZQSJRzD95rrhGtQGcUj+k1AZvhk4Bdb7Q3s=;
        b=TpqCILDrWrRgJPq909lr+LHoBHiKgo2t3O1dUxQ0ghlGjP1udOQXgekqX9FzHQiVpC
         xowv0XCSKs+u1L0R6ou8s1IXqZQxct3eUY6xnmcjP+3kJT13MgaYHClLhwwcOUUk9esj
         VWA1Ob4Zw+dalEKR7uTQNN/A9Rp9g1E3N8JuZUY7wzidCPN11PDoUpIlCvq5X3iVIGP0
         hxp+1n6+U6BDcbUIR74SmJLqrLj9wVlyGsMhKjnbW3tkGDoP85qlfv+O2tw4Q3QDmKVa
         uuukIm6BuFUFSDq+xI926YtMH2W7XIbbSGJ1x6NDvkeWTO4KzJNsT8XTbkESWmR0aC/6
         vIQw==
X-Forwarded-Encrypted: i=1; AJvYcCWxNbJTfZBdOGuWksUlTsJZ7/P+pvmav3VOhn0wayA+Iw7r5sEsn7zyvZZh0Vv1qVwjcoa/T+t+hi9rstUdIfsSvanNu1uGO3aUylkFAlox
X-Gm-Message-State: AOJu0Yw1fvIlkho4QwpR5Bw00h9vkxJW4cJwW899rrZdqiIK5w5Q1GVq
	mRmRm2BxHzV3R7N4JwjpkuVOc5xwCbV3icITv9uV6RknRfKy6gZyc6Y3Xzw2xvFOS66RDtzqiiK
	CXTzRPpEB6x23CuCd21RuvtkU+JA2DaMU4GtkMQ==
X-Google-Smtp-Source: AGHT+IHIvCiL9/viH3Zv87RhUz8r9B/nNMpWCgwAx/ZU6AQHkrpwzseaugUZlw+S2sSjSOL/j/AgVGUngrHrFzkoTBM=
X-Received: by 2002:a17:90a:d481:b0:2a2:88d:19d9 with SMTP id
 s1-20020a17090ad48100b002a2088d19d9mr1331992pju.1.1711636945073; Thu, 28 Mar
 2024 07:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
 <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com> <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
In-Reply-To: <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Thu, 28 Mar 2024 22:43:46 +0800
Message-ID: <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support
 to record and check the accessed args
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet <quentin@isovalent.com>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_074231_771880_84D1B0F7 
X-CRM114-Status: GOOD (  30.24  )
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

T24gRnJpLCBNYXIgMTUsIDIwMjQgYXQgNDowMOKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1hciAxNCwgMjAyNCBhdCA4OjI3
4oCvQU0gQWxleGVpIFN0YXJvdm9pdG92Cj4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+
IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTWFyIDEyLCAyMDI0IGF0IDY6NTPigK9QTSDmoqbpvpno
kaMgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+IFsuLi4uLi5dCj4gPiA+
IFdoYXQgZG9lcyAiYSBodW5kcmVkIGF0dGFjaG1lbnRzIG1heCIgbWVhbnM/IENhbid0IEkKPiA+
ID4gdHJhY2UgdGhvdXNhbmRzIG9mIGtlcm5lbCBmdW5jdGlvbnMgd2l0aCBhIGJwZiBwcm9ncmFt
IG9mCj4gPiA+IHRyYWNpbmcgbXVsdGktbGluaz8KPiA+Cj4gPiBJIG1lYW4gd2hhdCB0aW1lIGRv
ZXMgaXQgdGFrZSB0byBhdHRhY2ggb25lIHByb2dyYW0KPiA+IHRvIDEwMCBmZW50cnktcyA/Cj4g
PiBXaGF0IGlzIHRoZSB0aW1lIGZvciAxayBhbmQgZm9yIDEwayA/Cj4gPgo+ID4gVGhlIGtwcm9i
ZSBtdWx0aSB0ZXN0IGF0dGFjaGVzIHRvIHByZXR0eSBtdWNoIGFsbCBmdW5jcyBpbgo+ID4gL3N5
cy9rZXJuZWwvdHJhY2luZy9hdmFpbGFibGVfZmlsdGVyX2Z1bmN0aW9ucwo+ID4gYW5kIGl0J3Mg
ZmFzdCBlbm91Z2ggdG8gcnVuIGluIHRlc3RfcHJvZ3Mgb24gZXZlcnkgY29tbWl0IGluIGJwZiBD
SS4KPiA+IFNlZSBnZXRfc3ltcygpIGluIHByb2dfdGVzdHMva3Byb2JlX211bHRpX3Rlc3QuYwo+
ID4KPiA+IENhbiB0aGlzIG5ldyBtdWx0aSBmZW50cnkgZG8gdGhhdD8KPiA+IGFuZCBhdCB3aGF0
IHNwZWVkPwo+ID4gVGhlIGFuc3dlciB3aWxsIGRlY2lkZSBob3cgYXBwbGljYWJsZSB0aGlzIGFw
aSBpcyBnb2luZyB0byBiZS4KPiA+IEdlbmVyYXRpbmcgZGlmZmVyZW50IHRyYW1wb2xpbmVzIGZv
ciBldmVyeSBhdHRhY2ggcG9pbnQKPiA+IGlzIGFuIGFwcHJvYWNoIGFzIHdlbGwuIFBscyBiZW5j
aG1hcmsgaXQgdG9vLgo+Cj4gSSBzZWUuIENyZWF0aW5nIHBsZW50eSBvZiB0cmFtcG9saW5lcyBk
b2VzIHRha2UgYSBsb3Qgb2YgdGltZSwKPiBhbmQgSSdsbCBkbyB0ZXN0aW5nIG9uIGl0Lgo+CgpJ
IGhhdmUgZG9uZSBhIHNpbXBsZSBiZW5jaG1hcmsgb24gY3JlYXRpbmcgMTAwMAp0cmFtcG9saW5l
cy4gSXQgaXMgc2xvdywgcXVpdGUgc2xvdywgd2hpY2ggY29uc3VtZSB1cCB0bwo2MHMuIFdlIGNh
bid0IGRvIGl0IHRoaXMgd2F5LgoKTm93LCBJIGhhdmUgYSBiYWQgaWRlYS4gSG93IGFib3V0IHdl
IGludHJvZHVjZQphICJkeW5hbWljIHRyYW1wb2xpbmUiPyBUaGUgYmFzaWMgbG9naWMgb2YgaXQg
Y2FuIGJlOgoKIiIiCnNhdmUgcmVncwpicGZzID0gdHJhbXBvbGluZV9sb29rdXBfaXAoaXApCmZl
bnRyeSA9IGJwZnMtPmZlbnRyaWVzCndoaWxlIGZlbnRyeToKICBmZW50cnkoY3R4KQogIGZlbnRy
eSA9IGZlbnRyeS0+bmV4dAoKY2FsbCBvcmlnaW4Kc2F2ZSByZXR1cm4gdmFsdWUKCmZleGl0ID0g
YnBmcy0+ZmV4aXRzCndoaWxlIGZleGl0OgogIGZleGl0KGN0eCkKICBmZXhpdCA9IGZleGl0LT5u
ZXh0Cgp4eHh4eHgKIiIiCgpBbmQgd2UgbG9va3VwIHRoZSAiYnBmcyIgYnkgdGhlIGZ1bmN0aW9u
IGlwIGluIGEgaGFzaCBtYXAKaW4gdHJhbXBvbGluZV9sb29rdXBfaXAuIFRoZSB0eXBlIG9mICJi
cGZzIiBpczoKCnN0cnVjdCBicGZfYXJyYXkgewogIHN0cnVjdCBicGZfcHJvZyAqZmVudHJpZXM7
CiBzdHJ1Y3QgYnBmX3Byb2cgKmZleGl0czsKICBzdHJ1Y3QgYnBmX3Byb2cgKm1vZGlmeV9yZXR1
cm5zOwp9CgpXaGVuIHdlIG5lZWQgdG8gYXR0YWNoIHRoZSBicGYgcHJvZ0EgdG8gZnVuY3Rpb24g
QS9CL0MsCndlIG9ubHkgbmVlZCB0byBjcmVhdGUgdGhlIGJwZl9hcnJheUEsIGJwZl9hcnJheUIs
IGJwZl9hcnJheUMKYW5kIGFkZCB0aGUgcHJvZ0EgdG8gdGhlbSwgYW5kIGluc2VydCB0aGVtIHRv
IHRoZSBoYXNoIG1hcAoiZGlyZWN0X2NhbGxfYnBmcyIsIGFuZCBhdHRhY2ggdGhlICJkeW5hbWlj
IHRyYW1wb2xpbmUiIHRvCkEvQi9DLiBJZiBicGZfYXJyYXlBIGV4aXN0LCBqdXN0IGFkZCBwcm9n
QSB0byB0aGUgdGFpbCBvZgpicGZfYXJyYXlBLT5mZW50cmllcy4gV2hlbiB3ZSBuZWVkIHRvIGF0
dGFjaCBwcm9nQiB0bwpCL0MsIGp1c3QgYWRkIHByb2dCIHRvIGJwZl9hcnJheUItPmZlbnRyaWVz
IGFuZApicGZfYXJyYXlCLT5mZW50cmllcy4KCkNvbXBhcmVkIHRvIHRoZSB0cmFtcG9saW5lLCBl
eHRyYSBvdmVyaGVhZCBpcyBpbnRyb2R1Y2VkCmJ5IHRoZSBoYXNoIGxvb2t1cGluZy4KCkkgaGF2
ZSBub3QgYmVndW4gdG8gY29kZSB5ZXQsIGFuZCBJIGFtIG5vdCBzdXJlIHRoZSBvdmVyaGVhZCBp
cwphY2NlcHRhYmxlLiBDb25zaWRlcmluZyB0aGF0IHdlIGFsc28gbmVlZCB0byBkbyBoYXNoIGxv
b2t1cApieSB0aGUgZnVuY3Rpb24gaW4ga3Byb2JlX211bHRpLCBtYXliZSB0aGUgb3ZlcmhlYWQg
aXMKYWNjZXB0YWJsZT8KClRoYW5rcyEKTWVuZ2xvbmcgRG9uZwoKPiA+Cj4gPiA+ID4KPiA+ID4g
PiBMZXQncyBzdGVwIGJhY2suCj4gWy4uLi4uLl0KPiA+Cj4gPiBGb3Igb25lIHRyYW1wb2xpbmUg
dG8gaGFuZGxlIGFsbCBhdHRhY2ggcG9pbnRzIHdlIG1pZ2h0Cj4gPiBuZWVkIHNvbWUgYXJjaCBz
dXBwb3J0LCBidXQgd2UgY2FuIHN0YXJ0IHNpbXBsZS4KPiA+IE1ha2UgYnRmX2Z1bmNfbW9kZWwg
d2l0aCBNQVhfQlBGX0ZVTkNfUkVHX0FSR1MKPiA+IGJ5IGNhbGxpbmcgYnRmX2Rpc3RpbGxfZnVu
Y19wcm90bygpIHdpdGggZnVuYz09TlVMTC4KPiA+IEFuZCB1c2UgdGhhdCB0byBidWlsZCBhIHRy
YW1wb2xpbmUuCj4gPgo+ID4gVGhlIGNoYWxsZW5nZSBpcyBob3cgdG8gdXNlIG1pbmltYWwgbnVt
YmVyIG9mIHRyYW1wb2xpbmVzCj4gPiB3aGVuIGJwZl9wcm9nQSBpcyBhdHRhY2hlZCBmb3IgZnVu
YzEsIGZ1bmMyLCBmdW5jMwo+ID4gYW5kIGJwZl9wcm9nQiBpcyBhdHRhY2hlZCB0byBmdW5jMywg
ZnVuYzQsIGZ1bmM1Lgo+ID4gV2UnZCBzdGlsbCBuZWVkIDMgdHJhbXBvbGluZXM6Cj4gPiBmb3Ig
ZnVuY1sxMl0gdG8gY2FsbCBicGZfcHJvZ0EsCj4gPiBmb3IgZnVuYzMgdG8gY2FsbCBicGZfcHJv
Z0EgYW5kIGJwZl9wcm9nQiwKPiA+IGZvciBmdW5jWzQ1XSB0byBjYWxsIGJwZl9wcm9nQi4KPiA+
Cj4gPiBKaXJpIHdhcyB0cnlpbmcgdG8gc29sdmUgaXQgaW4gdGhlIHBhc3QuIEhpcyBzbGlkZXMg
ZnJvbSBMUEM6Cj4gPiBodHRwczovL2xwYy5ldmVudHMvZXZlbnQvMTYvY29udHJpYnV0aW9ucy8x
MzUwL2F0dGFjaG1lbnRzLzEwMzMvMTk4My9wbHVtYmVycy5wZGYKPiA+Cj4gPiBQbHMgc3R1ZHkg
dGhlbSBhbmQgaGlzIHByaW9yIHBhdGNoc2V0cyB0byBhdm9pZCBzdGVwcGluZyBvbiB0aGUgc2Ft
ZSByYWtlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
