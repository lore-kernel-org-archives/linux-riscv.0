Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4256CCA476
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 12:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SQhfjFwEJKLDj5dK0kiJbaJenduyyH6tDJQtNEgH6s=; b=bT+DcvYRsNqGS6
	zrmQFao9RNzl10gmeOASDB3FO0gIPcY5izGslFL6WAZwcTq79q5Rx4gx1rG8vnZdcEznjpZisb/6h
	mWpw6s2McRE5IVyxCqeKW8hqc0URl5b92hT0SdoeBx4LFq5Dl9Mt64oJ8IdlsF/n/4dv9EdTWu+JE
	g4zXQ6ht18d1BsIRahjfDzU2CD0SSZfqruXq4zY7v5Cbt3DBngbx0bSS0b5Qmm8CX08C/nxPnEWzK
	BSSUZdHJg04K2sVxRLIsH213Mtlh6UiP7jh3RYHvlNifvIdFOtbvSQqVnnPpgpk9PbNbIoyijIdBM
	qX76uF/zbwUw3YUACL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CAM-00000008Q6y-0orF;
	Fri, 10 Oct 2025 12:24:10 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CAJ-00000008Q5G-1yZF
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 12:24:09 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7abc631ae5cso1483469a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760099043; x=1760703843; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro3+kAua24TbasdwiZJ06Dvn43ZJ82YF71cQ3Adsr5c=;
        b=ifhdzkT7r1+KFG2jGRqphBxIkSDhStlAeXlTQzZ/6E7seQaWLiICdAIJehU8zzx6Ht
         6JXB1Ve0BhT27VSE+X0e1aPtztYEIx9byxXSiPmsw7TsVyUtVuvkeROXZCWHeoppG+lO
         D2JZ1iaCm7YQ3v7uaWolx/qSRWUfjqlUlFKk7W/GRsLYlBFXt18lyezIFuZByKd0G1E9
         Qoikvkx9kxCln9+zfgINrxb4ieTabl7p4Mbko9KjsufMN6oWpaCYGuJZ5d0yCGFW7AC9
         FJU3LC/GmlrWIVB29Xx+cY/cGvE2mnworwUhY8wNbnKVYrDeWzEPAVy+kfx+nCi4dqx6
         UDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760099043; x=1760703843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ro3+kAua24TbasdwiZJ06Dvn43ZJ82YF71cQ3Adsr5c=;
        b=uYC+WAyb8+Z/+46T7PMuetXbxSgrwl76z/QGKuErASeWOTtqcNARCZmft3EB07F8cS
         rGXFAoguCAjdagmY2XuqItbERQfBfT2VbNggMQsfn4yjHhfp5uhxuHmtQvMw9QVTq63C
         u2xnEE0HWQA33IIuviwRlH24c8cPGL93fRH/AO8cwcCq99VXs159fthrxCxbyQbVO+Ut
         jIXawnDZ2VvaJYxbFrennP/ULNiNX8SkIQfemO8E7zwUGlBi5QWXwTz5t2qNG+qvXULy
         GTu/6aXk6390h+yPTE6/aOb97FYV7kzlVs92obQ2WG64o9XTMVk5hO4InGPrpEAu26Hq
         a/qg==
X-Forwarded-Encrypted: i=1; AJvYcCXZWFGBL/57iXXMeUnhO5vBcJ//mXlyrLjFiqX1pEleFHC56MDl6FjBxmf0B0F2zjDFWk3u150LZv5adQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE/QuvViDJLmYAsW2WuDmnQMrFktGJka0ZvvhUhEwYnyIj4pEQ
	fSzgkFMvOJH/gtvt4CuSAl2n7X8fNp3pgSjDeljx4Z1ggxcOVdRsI7NxhJMxUsi1ZIV3ZN3tFOi
	NTpmutnoriuT27fON07uur+9LjAloRxWhMbwSprwqBw==
X-Gm-Gg: ASbGncu2uloQrktXHgiAmopo/8xzvARG9+5hEIiQxeMjJGL2/GzPEHLJ/0jm5hlCjYW
	hi2P1aFou2XSyEwa0ZVs9aDY9W4Nh5cvRjWSQvDkYvdGsciqwrQhOTvv15T+b0SToMThzJmcuHy
	FKDdTxn9IfMxJJoob0zP7g3j4XX9t9iCOMMyo6PKQONC5wxMkU3QuS3VUuQQC8Jb3wCuGm9p38k
	gDkENj1UOE0XsRag1Gggs98Nn/QJpINSetN2EQ=
X-Google-Smtp-Source: AGHT+IFwxCA7x9/0sbYa1+iquw2dNW2ztO7RgA5N9vNqLZKjJ8WptOtg61iPfZU7eyB/c+01KuJjQS2dtnsOgkC9/no=
X-Received: by 2002:a05:6870:d372:b0:3a5:81b0:8339 with SMTP id
 586e51a60fabf-3c0f91a8ef0mr5229274fac.31.1760099042537; Fri, 10 Oct 2025
 05:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
In-Reply-To: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 10 Oct 2025 20:23:50 +0800
X-Gm-Features: AS18NWBjm-gW9xf5A556itmFvcxR3HUB5zONSZ2JAVqk6TC55UaCFUsRW7mLiVI
Message-ID: <CAEEQ3w=3pte5=CR9-R3rmCGFZ9ErJ9YcWS9i=JwPUb1Ty3ipwQ@mail.gmail.com>
Subject: Re: [External] [PATCH v4 0/3] RISC-V: Detect Ssqosid extension and
 handle srmcfg CSR
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	Adrien Ricciardi <aricciardi@baylibre.com>, James Morse <james.morse@arm.com>, 
	Atish Kumar Patra <atishp@rivosinc.com>, Atish Patra <atish.patra@linux.dev>, 
	Vasudevan Srinivasan <vasu@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, guo.wenjia23@zte.com.cn, 
	liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_052407_662915_1A3EDF3F 
X-CRM114-Status: GOOD (  33.18  )
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

SGkgRHJldywKCk9uIFdlZCwgT2N0IDgsIDIwMjUgYXQgMjoyMuKAr1BNIERyZXcgRnVzdGluaSA8
ZnVzdGluaUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBm
b3IgdGhlIFJJU0MtViBRdWFsaXR5LW9mLVNlcnZpY2UgSWRlbnRpZmllcnMKPiAoU3Nxb3NpZCkg
ZXh0ZW5zaW9uIFsxXSB3aGljaCBhZGRzIHRoZSBzcm1jZmcgcmVnaXN0ZXIuIFRoaXMgQ1NSCj4g
Y29uZmlndXJlcyBhIGhhcnQgd2l0aCB0d28gaWRlbnRpZmllcnM6IGEgUmVzb3VyY2UgQ29udHJv
bCBJRCAoUkNJRCkKPiBhbmQgYSBNb25pdG9yaW5nIENvdW50ZXIgSUQgKE1DSUQpLiBUaGVzZSBp
ZGVudGlmaWVycyBhY2NvbXBhbnkgZWFjaAo+IHJlcXVlc3QgaXNzdWVkIGJ5IHRoZSBoYXJ0IHRv
IHNoYXJlZCByZXNvdXJjZSBjb250cm9sbGVycy4KPgo+IEJhY2tncm91bmQgb24gUklTQy1WIFFv
UzoKPgo+IFRoZSBTc3Fvc2lkIGV4dGVuc2lvbiBpcyB1c2VkIGJ5IHRoZSBSSVNDLVYgQ2FwYWNp
dHkgYW5kIEJhbmR3aWR0aAo+IENvbnRyb2xsZXIgUW9TIFJlZ2lzdGVyIEludGVyZmFjZSAoQ0JR
UkkpIHNwZWNpZmljYXRpb24gWzJdLiBRb1MgaW4KPiB0aGlzIGNvbnRleHQgaXMgY29uY2VybmVk
IHdpdGggc2hhcmVkIHJlc291cmNlcyBvbiBhbiBTb0Mgc3VjaCBhcyBjYWNoZQo+IGNhcGFjaXR5
IGFuZCBtZW1vcnkgYmFuZHdpZHRoLiBJbnRlbCBhbmQgQU1EIGFscmVhZHkgaGF2ZSBRb1MgZmVh
dHVyZXMKPiBvbiB4ODYgYW5kIEFSTSBoYXMgTVBBTS4gVGhlcmUgaXMgYW4gZXhpc3RpbmcgdXNl
ciBpbnRlcmZhY2UgaW4gTGludXg6Cj4gdGhlIHJlc2N0cmwgdmlydHVhbCBmaWxlc3lzdGVtIFsz
XS4KPgo+IFRoZSBzcm1jZmcgQ1NSIHByb3ZpZGVzIGEgbWVjaGFuaXNtIGJ5IHdoaWNoIGEgc29m
dHdhcmUgd29ya2xvYWQgKGUuZy4KPiBhIHByb2Nlc3Mgb3IgYSBzZXQgb2YgcHJvY2Vzc2VzKSBj
YW4gYmUgYXNzb2NpYXRlZCB3aXRoIGFuIFJDSUQgYW5kIGFuCj4gTUNJRC4gQ0JRUkkgZGVmaW5l
cyBvcGVyYXRpb25zIHRvIGNvbmZpZ3VyZSByZXNvdXJjZSB1c2FnZSBsaW1pdHMsIGluCj4gdGhl
IGZvcm0gb2YgY2FwYWNpdHkgb3IgYmFuZHdpZHRoLiBDQlFSSSBhbHNvIGRlZmluZXMgb3BlcmF0
aW9ucyB0bwo+IGNvbmZpZ3VyZSBjb3VudGVycyB0byB0cmFjayB0aGUgcmVzb3VyY2UgdXRpbGl6
YXRpb24uCj4KPiBHb2FsIGZvciB0aGlzIHNlcmllczoKPgo+IFRoZXNlIHBhdGNoZXMgYXJlIHRh
a2VuIGZyb20gdGhlIGltcGxlbWVudGF0aW9uIG9mIHJlc2N0cmwgc3VwcG9ydCBmb3IKPiBSSVND
LVYgQ0JRUkkuIFBsZWFzZSByZWZlciB0byB0aGUgcHJvb2Ytb2YtY29uY2VwdCBSRkMgWzRdIGZv
ciBkZXRhaWxzCj4gb24gdGhlIHJlc2N0cmwgaW1wbGVtZW50YXRpb24uIE1vcmUgcmVjZW50bHks
IEkgaGF2ZSByZWJhc2VkIHRoZSBDQlFSSQo+IHN1cHBvcnQgb24gbWFpbmxpbmUgWzVdLiBCaWcg
dGhhbmtzIHRvIEphbWVzIE1vcnNlIGZvciB0aGUgdGlyZWxlc3MKPiB3b3JrIHRvIGV4dHJhY3Qg
cmVzY3RybCBmcm9tIGFyY2gveDg2IGFuZCBtYWtlIGl0IGF2YWlsYWJsZSB0byBhbGwKPiBhcmNo
aXRlY3R1cmVzLgo+Cj4gSSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBmaXJzdCBmb2N1cyBvbiB0
aGUgZGV0ZWN0aW9uIG9mIFNzcW9zaWQgYW5kCj4gaGFuZGxpbmcgb2Ygc3JtY2ZnIHdoZW4gc3dp
dGNoaW5nIHRhc2tzLiBJdCBoYXMgYmVlbiB0ZXN0ZWQgYWdhaW5zdCBhCj4gUUVNVSBicmFuY2gg
dGhhdCBpbXBsZW1lbnRzIFNzcW9zaWQgYW5kIENCUVJJIFs2XS4gQSB0ZXN0IGRyaXZlciBbN10K
PiB3YXMgdXNlZCB0byBzZXQgc3JtY2ZnIGZvciB0aGUgY3VycmVudCBwcm9jZXNzLiBUaGlzIGFs
bG93cyBzd2l0Y2hfdG8KPiB0byBiZSB0ZXN0ZWQgd2l0aG91dCByZXNjdHJsLgoKQ291bGQgd2Ug
Y29uc2lkZXIgc3VibWl0dGluZyB0aGUgZW50aXJlIFFvUyBmdW5jdGlvbmFsaXR5IGFzIGEgc2lu
Z2xlCmludGVncmF0ZWQgcGF0Y2hzZXQgKGluZGljYXRpbmcgdGhlIHVwc3RyZWFtIGJyYW5jaCB0
aGF0IHRoZSBwYXRjaHNldAppcyBiYXNlZCBvbik/IFRoaXMgc2hvdWxkIGluY2x1ZGUgdGhlIGNv
bnRlbnQgZnJvbQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDQxOTEx
MTExMS40NzcxMTgtMS1kZnVzdGluaUBiYXlsaWJyZS5jb20vCgoKPgo+IFsxXSBodHRwczovL2dp
dGh1Yi5jb20vcmlzY3YvcmlzY3Ytc3Nxb3NpZC9yZWxlYXNlcy90YWcvdjEuMAo+IFsyXSBodHRw
czovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1jYnFyaS9yZWxlYXNlcy90YWcvdjEu
MAo+IFszXSBodHRwczovL2RvY3Mua2VybmVsLm9yZy9maWxlc3lzdGVtcy9yZXNjdHJsLmh0bWwK
PiBbNF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA0MTkxMTExMTEu
NDc3MTE4LTEtZGZ1c3RpbmlAYmF5bGlicmUuY29tLwo+IFs1XSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9mdXN0aW5pL2xpbnV4LmdpdC9sb2cvP2g9YjQv
Y2JxcmkKPiBbNl0gaHR0cHM6Ly9naXRodWIuY29tL3R0LWZ1c3RpbmkvcWVtdS90cmVlL3Jpc2N2
LWNicXJpLXJxc2MtcHB0dAo+IFs3XSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9mdXN0aW5pL2xpbnV4LmdpdC9sb2cvP2g9YjQvc3Nxb3NpZC1kZWJ1Zwo+
Cj4gQ2hhbmdlcyBpbiB2NDoKPiAgLSBSZWJhc2Ugb24gcmlzY3YvZm9yLW5leHQgYXMgb2Ygcmlz
Y3YtZm9yLWxpbnVzLTYuMTgtbXcyCj4gIC0gQWRkIENvbm9yJ3MgQWNrZWQtYnkgdG8gdGhlIHlh
bWwgcGF0Y2gKPiAgLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NTA5MjAtc3Nxb3NpZC12Ni0xNy1yYzUtdjMtMC01MDkzMTYyOTIyZDhAa2VybmVsLm9yZy8KPgo+
IENoYW5nZXMgaW4gdjM6Cj4gIC0gRml4IHBhcmFtZXRlciBpbiBfX3N3aXRjaF90b19zcm1jZmco
KSB3aGVuIENPTkZJR19SSVNDVl9JU0FfU1NRT1NJRAo+ICAgIGlzIG5vdCBzZXQgdG8gYXZvaWQg
ZXJyb3IgaW4gY2xhbmcuIFRoaXMgZG9lcyB0cmlnZ2VyIGNoZWNrcGF0Y2gKPiAgICB3YXJuaW5n
IGFib3V0ICJBcmd1bWVudCAnX19uZXh0JyBpcyBub3QgdXNlZCBpbiBmdW5jdGlvbi1saWtlIG1h
Y3JvIgo+ICAgIGJ1dCBpdCBzZWVtcyB0aGF0ICdfX3N3aXRjaF90b19zcm1jZmcoX19uZXh0KScg
aXMgbmVlZGVkIHRvIGF2b2lkCj4gICAgdGhlIGVycm9yIHRoYXQgTEtQIHJlcG9ydGVkLiAnX19z
d2l0Y2hfdG9fc3JtY2ZnKCknIHdpbGwgdHJpZ2dlciBhCj4gICAgYnVpbGQgZXJyb3IgaW4gY2xh
bmcuCj4gICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI1MDkxNjIz
NTUud0J5ZXNzbmItbGtwQGludGVsLmNvbS8KPiAgLSBJbXByb3ZlIGRlc2NyaXB0aW9uIG9mIHNz
cW9zaWQgaW4gZXh0ZW5zaW9ucy54bWwKPiAgLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDkxNS1zc3Fvc2lkLXY2LTE3LXJjNS12Mi0wLTJkNGIw
MjU0ZGZkNkBrZXJuZWwub3JnLwo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAgLSBSZXN0b3JlIHRoZSBw
ZXItY3B1IGZpeCBmcm9tIFJGQyB2MiB0aGF0IHdhcyBtaXNzZWQgaW4gdjE6Cj4gICAgY2hhbmdl
IERFRklORV9QRVJfQ1BVIHRvIERFQ0xBUkVfUEVSX0NQVSBpbiBxb3MuaCBhbmQgbW92ZQo+ICAg
IERFRklORV9QRVJfQ1BVIHRvIHFvcy5jCj4gIC0gSW50cm9kdWNlIGEgcGF0Y2ggdGhhdCBhZGRz
IFNzcW9zaWQgdG8gcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gIC0gTGluayB0byB2MTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDkxMC1zc3Fvc2lkLXY2LTE3LXJjNS12MS0wLTcyY2I4
ZjE0NDYxNUBrZXJuZWwub3JnCj4KPiBDaGFuZ2VzIGluIHYxOgo+ICAtIFJlbmFtZSBhbGwgaW5z
dGFuY2VzIG9mIHRoZSBzcW9zY2ZnIENTUiB0byBzcm1jZmcgdG8gbWF0Y2ggdGhlCj4gICAgcmF0
aWZpZWQgU3Nxb3NpZCBzcGVjCj4gIC0gTGluayBSRkMgdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjMwNDMwLXJpc2N2LWNicXJpLXJmYy12Mi12Mi0wLThlMzcyNWM0
YTQ3M0BiYXlsaWJyZS5jb20vCj4KPiBDaGFuZ2VzIGluIFJGQyB2MjoKPiAgLSBjaGFuZ2UgREVG
SU5FX1BFUl9DUFUgdG8gREVDTEFSRV9QRVJfQ1BVIGZvciBjcHVfc3Fvc2NmZyBpbiBxb3MuaCB0
bwo+ICAgIHByZXZlbnQgbGlua2luZyBlcnJvciBhYm91dCBtdWx0aXBsZSBkZWZpbml0aW9uLiBN
b3ZlIERFRklORV9QRVJfQ1BVCj4gICAgZm9yIGNwdV9zcW9zY2ZnIGludG8gcW9zLmMKPiAgLSBy
ZW5hbWVkIHFvcyBwcmVmaXggaW4gZnVuY3Rpb24gbmFtZXMgdG8gc3Fvc2NmZyB0byBiZSBsZXNz
IGdlbmVyaWMKPiAgLSBoYW5kbGUgc3Fvc2NmZyB0aGUgc2FtZSB3YXkgaGFzX3ZlY3RvciBhbmQg
aGFzX2ZwdSBhcmUgaGFuZGxlZCBpbiB0aGUKPiAgICB2ZWN0b3IgcGF0Y2ggc2VyaWVzCj4gIC0g
TGluayB0byBSRkMgdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMw
NDEwMDQzNjQ2LjMxMzg0NDYtMS1kZnVzdGluaUBiYXlsaWJyZS5jb20vCj4KPiBTaWduZWQtb2Zm
LWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4KPiAtLS0KPiBEcmV3IEZ1c3Rp
bmkgKDMpOgo+ICAgICAgIGR0LWJpbmRpbmdzOiByaXNjdjogQWRkIFNzcW9zaWQgZXh0ZW5zaW9u
IGRlc2NyaXB0aW9uCj4gICAgICAgUklTQy1WOiBEZXRlY3QgdGhlIFNzcW9zaWQgZXh0ZW5zaW9u
Cj4gICAgICAgUklTQy1WOiBBZGQgc3VwcG9ydCBmb3Igc3JtY2ZnIENTUiBmcm9tIFNzcW9zaWQg
ZXh0Cj4KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sICAg
ICAgfCAgNiArKysrCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDcgKysrKwo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDE3ICsrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Nzci5oICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaCAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICAgICAgICAgICAgICAgICB8ICAzICsrCj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcW9zLmggICAgICAgICAgICAgICAgICAgICAgIHwgNDEgKysrKysr
KysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N3aXRjaF90by5oICAg
ICAgICAgICAgICAgICB8ICAzICsrCj4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Fvcy9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwv
cW9zL3Fvcy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKysKPiAgMTIgZmlsZXMgY2hh
bmdlZCwgOTYgaW5zZXJ0aW9ucygrKQo+IC0tLQo+IGJhc2UtY29tbWl0OiA2ODI0N2Q0NWMwNDVi
YjdkZGE5MjNjZjJjOGQwOTM3Y2UwZTE2Mzk0Cj4gY2hhbmdlLWlkOiAyMDI1MTAwNy1zc3Fvc2lk
LWRkYzg3OTY4YjJkOQo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gRHJldyBGdXN0aW5pIDxmdXN0
aW5pQGtlcm5lbC5vcmc+Cj4KPgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
