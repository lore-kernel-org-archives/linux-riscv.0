Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E3AC02183
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jan 2025 07:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sC4JdLJ41a7Thfiy9kcX+JQ8cbOmymv27kTP3EgkCtM=; b=prz5Glth0KjGfj
	C8DzhnHxyTqvKLSL+xT1soSZgjUkjRH0sgePROZRrb6kLtFrRZuX3y+vcdpW8ODT66dWgTSAeWpWo
	QPS9CFtXmK958pUQK0gQ1E+wufw72zAyzzeIoEpYq1v9MTdZG1PGsp6t/1k1p4ZsY/Tq78YSdm4qj
	nXv0xiC9zeqYhs5DeYHGMc3eOwzw7NYYmsO2lRU6DbCiWuYxZ7h7J7Oy/LUqyMl6pr4EDqhUqCrXB
	55cIcdCHIlEvjUdHGCeFIG0EfDx274SP+M3z2QHOtz7jTBy1ddHP5S5FRhRfRAQfgJ8ph8vz2fb4G
	y5yDLoa/unoPfevvJqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZPM1-00000003W2H-3Zem;
	Sun, 19 Jan 2025 07:04:17 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZPLF-00000003Vxj-2kj8
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jan 2025 07:03:31 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4b10dd44c8bso1009215137.3
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jan 2025 23:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1737270207; x=1737875007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnpXrWKq0VBDxTyj8254F7BSKfNpb/hJLHAuN7YJik0=;
        b=ZvE2ir9bgKu9JUJGRohQ6+obZJpYswrtApzLefoSXZC8VighN9visAhRhewQepNKD1
         kNiv1NiaBYYDw4Vxy214nvxyznNOitUT7i6xCtC/ie5H7XpIE5c2hqMhohK05F0GbT9J
         KRli04BTyhrYHfghieUW3ItJhoNKQ+T3WQeBSE4WBW7386x5i8WmJ39FXE1bihr7CHiu
         95WMLuyurqvoJ14GdqEUuxsgLBjjjxl/DDnYbsJAkyur7GnaUEOW+GesABPUc/Y6IE02
         58KTkGX9VU4BcZPogLNo4hkrAI+FBPrK2+XRfkFz51GRfmLP65MnenUXF7VzKEfMjmjy
         DKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737270207; x=1737875007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnpXrWKq0VBDxTyj8254F7BSKfNpb/hJLHAuN7YJik0=;
        b=J0MYofrn0lnkxw2P0PRrFwD2GPv+8Zb6tC8OG/DiACn+P1+cHOGGjfi3La1kTZJtVT
         JbbcJpRf+SEa5cbLp/Tvxcxy7/IaNHqcPhpQSFgbSLL2uSpKteBL765NzGRz9aJsemiF
         xbO69fLaHV5YbH6RNj1ERi+BZwlK6KCvG5cCrJPLdRQn6l1B3q0ZGSkFzKWzXwdAejEj
         Yr/x9+d7ITYNPiTFbHWovcPA/H37g3phEmAKbwbwhh4lnQw3PgtjvgKYmnag09u+io8n
         qy0V4RWyv/cuGKAqP+xtJnbCBtK7EVK5FlbrGByQApKQ0XtYSS23noOX/CK30rU5hMji
         893Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4wgOcqAbUNrFbjtPfkbvtuspcXbUnlOKBEiFbUd9XUmO3hG8GLdQvPWGU8S4LQ0DfsZ1nxkDV64zs1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YznXnltbcKMBNq6VUHz8v1lhWgSWH1rRrGQgvMnJzSJyhMBtAQH
	aJUjHdRrMypHU1kb9/YE2lMMJlt6p+GBP/Y+AXvJMcUDNvKe2UUyXIbg0wJky7pqhfLux8rj+Ow
	1eEUTy2pwYO3TyaSkwmda4xqx+1EftyxtlPCKbA==
X-Gm-Gg: ASbGncsEBFIMIHQegQElA6f/3Zes2Y7lszCez/TYm6w2TcPJrNi+dd6o0GaMje4KnuI
	IiCRYHJQqhz6nHxAbIAnr//heKktwtLtDX4iSMEHt5JBvBeH18bIF
X-Google-Smtp-Source: AGHT+IET+wfBuCZLuaKbQD0fnAAK9r+Trh7Tp3Z3Tdnsd8797nd910UeypWqyFjddsNTUEAmq7sdL4dxMI1NIJ2lWKE=
X-Received: by 2002:a05:6102:390e:b0:4b2:5c0a:98c1 with SMTP id
 ada2fe7eead31-4b690cb5750mr6905795137.22.1737270207604; Sat, 18 Jan 2025
 23:03:27 -0800 (PST)
MIME-Version: 1.0
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
 <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7> <CAHh=Yk-_0rKB=FG6Voif2MDjtRxzUA5vXDP2J-o5=8ru1ewt0w@mail.gmail.com>
In-Reply-To: <CAHh=Yk-_0rKB=FG6Voif2MDjtRxzUA5vXDP2J-o5=8ru1ewt0w@mail.gmail.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Sun, 19 Jan 2025 15:03:16 +0800
X-Gm-Features: AbW1kvYEhClrN-MTto4gCSBy3I71VayyQl61nNw1WQtRAy-GYH0yHkhILkIz0uk
Message-ID: <CAHh=Yk-TosOmwEughfK9mMx-=DgzWK5H_bf6H641SGh1ue8BrA@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_230330_064699_586080C5 
X-CRM114-Status: GOOD (  29.76  )
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

Tnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPiDmlrwgMjAyNeW5tDHmnIg25pelIOmA
seS4gCDkuIvljYg1OjA55a+r6YGT77yaCj4KPiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQGJheWxpYnJlLmNvbT4g5pa8IDIwMjTlubQxMuaciDI35pelIOmAseS6lCDkuIvljYg0
OjIw5a+r6YGT77yaCj4gPgo+ID4gSGVsbG8gTnlsb24sCj4gPgo+ID4gT24gVHVlLCBEZWMgMjQs
IDIwMjQgYXQgMDU6Mzg6NThQTSArMDgwMCwgTnlsb24gQ2hlbiB3cm90ZToKPiA+ID4gQWNjb3Jk
aW5nIHRvIHRoZSBjaXJjdWl0IGRpYWdyYW0gb2YgVXNlciBMRURzIC0gUkdCIGRlc2NyaWJlZCBp
biB0aGUKPiA+ID4gbWFudWFsIGhpZml2ZS11bmxlYXNoZWQtYTAwLnBkZlswXSBhbmQgaGlmaXZl
LXVubWF0Y2hlZC1zY2hlbWF0aWNzLXYzLnBkZlsxXS4KPiA+ID4KPiA+ID4gVGhlIGJlaGF2aW9y
IG9mIFBXTSBpcyBhY2l0dmUtaGlnaC4KPiA+ID4KPiA+ID4gQWNjb3JkaW5nIHRvIHRoZSBkZXNj
cmlwdGlvbm9mIFBXTSBmb3IgcHdtY21wIGluIFNpRml2ZSBGVTc0MC1DMDAwIE1hbnVhbFsyXS4K
PiA+ID4KPiA+ID4gVGhlIHB3bSBhbGdvcml0aG0gaXMgKFBXKSBwdWxzZSBhY3RpdmUgdGltZSAg
PSAoRCkgZHV0eSAqIChUKSBwZXJpb2QuCj4gPiA+IFRoZSBgZnJhY2AgdmFyaWFibGUgaXMgcHVs
c2UgImluYWN0aXZlIiB0aW1lIHNvIHdlIG5lZWQgdG8gaW52ZXJ0IGl0Lgo+ID4KPiA+IEknbSB0
cnlpbmcgdG8gdW5kZXJzdGFuZCB0aGF0LiBZb3UncmUgc2F5aW5nIHRoYXQgdGhlIFBXTUNNUCBy
ZWdpc3Rlcgo+ID4gaG9sZHMgdGhlIGluYWN0aXZlIHRpbWUuIExvb2tpbmcgYXQgdGhlIGxvZ2lj
IGRpYWdyYW0gKEZpZ3VyZSAyOSkgb2YKPiA+ICJTaUZpdmUgRlU3NDAtQzAwMCBNYW51YWwgdjFw
NiIgdGhhdCBpcyBiZWNhdXNlIHB3bXMgaXMgZmVlZCBpbnRvIHRoZQo+ID4gY29tcGFyYXRvciBh
ZnRlciBnb2luZyB0aHJvdWdoIHRoYXQgWE5PUiB3aGVyZSB0aGUgbG93ZXIgaW5wdXQgaXMgYWx3
YXlzCj4gPiAwIChhcyBwd21jbXBYY2VudGVyIGlzIGFsd2F5cyAwKSBhbmQgc28gZWZmZWN0aXZl
bHkgY291bnRzIGJhY2t3YXJkcywKPiA+IHJpZ2h0Pwo+ID4gSW4gdGhhdCBjYXNlIHRoZSBzZW50
ZW5jZSAiVGhlIG91dHB1dCBvZiBlYWNoIGNvbXBhcmF0b3IgaXMgaGlnaAo+ID4gd2hlbmV2ZXIg
dGhlIHZhbHVlIG9mIHB3bXMgaXMgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvIHRoZSBjb3JyZXNw
b25kaW5nCj4gPiBwd21jbXBYLiIgZnJvbSB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIENvbXBhcmUg
UmVnaXN0ZXJzIGlzIHdyb25nLgo+ID4KPiBIaSBVd2UsCj4KPiBQbGVhc2UgZ2l2ZSB1cyBzb21l
IHRpbWUgdG8gY2xhcmlmeSB0aGVzZSBxdWVzdGlvbnMsIHRoYW5rIHlvdS4KPiA+IFdpdGggdGhh
dCBhc3N1bXB0aW9uIHRoZXJlIGFyZSBhIGZldyBpc3N1ZXMgd2l0aCB0aGUgc2Vjb25kIHBhdGNo
Ogo+ID4KPiA+ICAtIFRoZSBMaW1pdGF0aW9ucyBwYXJhZ3JhcGggc3RpbGwgc2F5cyAiVGhlIGhh
cmR3YXJlIGNhbm5vdCBnZW5lcmF0ZSBhCj4gPiAgICAxMDAlIGR1dHkgY3ljbGUuIgo+ID4gIC0g
SWYgcHdtX3NpZml2ZV9hcHBseSgpIGlzIGNhbGxlZCB3aXRoIHN0YXRlLT5kdXR5X2N5Y2xlID0g
MCB0aGUgUFdNQ01QCj4gPiAgICByZWdpc3RlciBiZWNvbWVzICgxVSA8PCBQV01fU0lGSVZFX0NN
UFdJRFRIKSAtIDEgd2hpY2ggcmVzdWx0cyBpbiBhCj4gPiAgICB3YXZlIGZvcm0gdGhhdCBpcyBh
Y3RpdmUgZm9yIDEgY2xvY2sgdGljayBlYWNoIHBlcmlvZC4gVGhhdCdzIGJvZ3VzLgo+ID4gICAg
SWYgZHV0eV9jeWNsZSA9IDAgaXMgcmVxdWVzdGVkLCBlaXRoZXIgbWFrZSBzdXJlIHRoZSBvdXRw
dXQgaXMKPiA+ICAgIGluYWN0aXZlIHRoZSB3aG9sZSB0aW1lLCBvciByZXR1cm4gYW4gZXJyb3Iu
Cj4gPiAgLSBXaXRoIHRoZSBhYm92ZSBlcnJvciBpbiB0aGUgb2ZmaWNpYWwgZG9jdW1lbnRhdGlv
biwgSSdkIGxpa2UgdG8gaGF2ZQo+ID4gICAgYSBjb2RlIGNvbW1lbnQgdGhhdCBleHBsYWlucyB0
aGUgbWlzbWF0Y2ggc3VjaCB0aGF0IGEgZnV0dXJlIHJlYWRlcgo+ID4gICAgb2YgdGhlIGNvZGUg
aGFzIGEgY2hhbmNlIHRvIHVuZGVyc3RhbmQgdGhlIHNpdHVhdGlvbiB3aXRob3V0IGluCj4gPiAg
ICBkZXRhaWwgcmV2aWV3IG9mIHRoZSBtYW51YWwgYW5kIHRoZSBkcml2ZXIuCj4gPgo+ID4gT3J0
aG9nb25hbCB0byB5b3VyIHBhdGNoZXMsIEkgd29uZGVyIGFib3V0Cj4gPgo+ID4gICAgICAgICBm
cmFjID0gRElWNjRfVTY0X1JPVU5EX0NMT1NFU1QobnVtLCBzdGF0ZS0+cGVyaW9kKTsKPiA+Cj4g
PiAuIFJvdW5kLWNsb3Nlc3QgaXMgdXN1YWxseSB3cm9uZyBpbiBhbiAuYXBwbHkoKSBjYWxsYmFj
ay4gSSBkaWRuJ3QgZG8KPiA+IHRoZSBkZXRhaWxlZCBtYXRoLCBidXQgSSB0aGluayB5b3UgbmVl
ZCB0byByb3VuZCB1cCBoZXJlLgpIaSBVd2UsIGFib3V0IHRoaXMgcGFydC4KCkkgcmFuIHNvbWUg
YmFzaWMgdGVzdHMgYnkgY2hhbmdpbmcgdGhlIHBlcmlvZCBhbmQgZHV0eSBjeWNsZSBpbiBib3Ro
CmRlY3JlYXNpbmcgYW5kIGluY3JlYXNpbmcgc2VxdWVuY2VzIChzZWUgdGhlIHNjcmlwdCBiZWxv
dykuCgojIEJhY2t3YXJkIHRlc3RpbmcgZm9yIHBlcmlvZCAoZGVjcmVhc2luZykKZWNobyAiVGVz
dGluZyBwZXJpb2QgYmFja3dhcmQuLi4iCgpzZXEgMTUwMDAgLTEgNTAwMCB8IHdoaWxlIHJlYWQg
cDsgZG8KCiAgIGVjaG8gJHAgPiAvc3lzL2NsYXNzL3B3bS9wd21jaGlwMS9wd20wL3BlcmlvZAoK
ICAgZWNobyAiVGVzdGluZyBwZXJpb2Q6ICRwIgoKZG9uZQoKCiMgRm9yd2FyZCB0ZXN0aW5nIGZv
ciBwZXJpb2QgKGluY3JlYXNpbmcpCmVjaG8gIlRlc3RpbmcgcGVyaW9kIGZvcndhcmQuLi4iCgpz
ZXEgNTAwMCAxIDE1MDAwIHwgd2hpbGUgcmVhZCBwOyBkbwoKICAgZWNobyAkcCA+IC9zeXMvY2xh
c3MvcHdtL3B3bWNoaXAxL3B3bTAvcGVyaW9kCgogICBlY2hvICJUZXN0aW5nIHBlcmlvZDogJHAi
Cgpkb25lCgoKIyBCYWNrd2FyZCB0ZXN0aW5nIGZvciBkdXR5IGN5Y2xlIChkZWNyZWFzaW5nKQpl
Y2hvICJUZXN0aW5nIGR1dHkgY3ljbGUgYmFja3dhcmQuLi4iCgpmb3IgZHV0eSBpbiAkKHNlcSAx
MDAwMCAtMSAwKTsgZG8KCiAgIGVjaG8gJGR1dHkgPiAvc3lzL2NsYXNzL3B3bS9wd21jaGlwMS9w
d20wL2R1dHlfY3ljbGUKCiAgIGVjaG8gIlRlc3RpbmcgZHV0eSBjeWNsZTogJGR1dHkiCgpkb25l
CgoKIyBGb3J3YXJkIHRlc3RpbmcgZm9yIGR1dHkgY3ljbGUgKGluY3JlYXNpbmcpCgplY2hvICJU
ZXN0aW5nIGR1dHkgY3ljbGUgZm9yd2FyZC4uLiIKCmZvciBkdXR5IGluICQoc2VxIDAgMSAxMDAw
MCk7IGRvCgogICBlY2hvICRkdXR5ID4gL3N5cy9jbGFzcy9wd20vcHdtY2hpcDEvcHdtMC9kdXR5
X2N5Y2xlCgogICBlY2hvICJUZXN0aW5nIGR1dHkgY3ljbGU6ICRkdXR5IgoKZG9uZQoKCgpJbiB0
aGVzZSBwYXJ0aWN1bGFyIHRlc3RzLCBJIGRpZG7igJl0IHNlZSBhbnkgZnVuY3Rpb25hbCBkaWZm
ZXJlbmNlIG9yCnVuZXhwZWN0ZWQgYmVoYXZpb3Igd2hldGhlciBJIHVzZWQgRElWNjRfVTY0X1JP
VU5EX0NMT1NFU1QoKSBvcgpESVY2NF9VNjRfUk9VTkRfVVAuCk9mIGNvdXJzZSwgdGhlcmXigJlz
IGEgY2hhbmNlIG15IHRlc3RzIGhhdmVu4oCZdCBjb3ZlcmVkIGV2ZXJ5IHNjZW5hcmlvLApzbyB0
aGVyZSBjb3VsZCBzdGlsbCBiZSBlZGdlIGNhc2VzIEkgbWlzc2VkLgoKRnJvbSB3aGF0IEkgdW5k
ZXJzdGFuZCwgeW91ciBtYWluIGNvbmNlcm4gaXMgdG8gZW5zdXJlIHdlIG5ldmVyIGVuZCB1cAp3
aXRoIGEgZHV0eSBjeWNsZSB0aGF04oCZcyBzbWFsbGVyIHRoYW4gd2hhdCB0aGUgdXNlciByZXF1
ZXN0ZWQsIHdoaWNoIGEKcm91bmQtdXAgYXBwcm9hY2ggd291bGQgaGVscCBndWFyYW50ZWUuIElm
IHlvdSBzdGlsbCByZWNvbW1lbmQgbWFraW5nCnRoYXQgY2hhbmdlIHRvIGFjaGlldmUgdGhlIGRl
c2lyZWQgYmVoYXZpb3IsIEnigJltIGhhcHB5IHRvIHVwZGF0ZSB0aGUKY29kZSBhY2NvcmRpbmds
eShDTE9TRVNULT5VUCkuCgpUaGFua3MgYWdhaW4gZm9yIHlvdXIgZmVlZGJhY2suCgo+IEkgd2ls
bCBjb25kdWN0IHJlbGV2YW50IGV4cGVyaW1lbnRzIHRvIGNsYXJpZnkgdGhpcyBpc3N1ZS4KPgo+
IFRoYW5rcyBhZ2Fpbi4KPiA+Cj4gPiBCZXN0IHJlZ2FyZHMKPiA+IFV3ZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
