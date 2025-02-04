Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1244FC0218F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 04:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVKUjxLvgupObRg8am+QlChQEhnH5r5egBP+qblus84=; b=gXSNXhAJMRLYM0
	BGRua0ObK6yhndPYSd0i/UEaTKbsqQkfCZNbSqvWqx12N6y95GP1S7DifCDqqwHs0U7/OajZL/GtG
	iWtddqLnR4BKGXHfKXYJ3Ccp8dHsnuXFlT2zDRsYm3tKMONgHAtpXYs6XU0xSqwT6g6/d7Ax5kTC6
	NCXPfyQYuh7SK2NxFZ05fHU+I6fj41F6GxAiac/I7A29Y3RemfWGLZlF8jZXZDOgluMYOwOorHHNU
	irBuOnBfMp20tr4cHg7eqqNgxVIvRgxCbNyjubcWRrb559ieD8Snk4Lb3uPKn+fwmtWa02tcanK1Y
	KBIvPc8E0G9+UUon9Q7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfABQ-0000000HD2p-14PD;
	Tue, 04 Feb 2025 04:05:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfABN-0000000HD25-2q5N
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 04:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8BE165C6B1E
	for <linux-riscv@lists.infradead.org>; Tue,  4 Feb 2025 04:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F3DC4CEE3
	for <linux-riscv@lists.infradead.org>; Tue,  4 Feb 2025 04:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738641904;
	bh=6bVtRp4ma/3XAfRXklDX3ZGjq6cu/lwIqmyVbEim+a4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LL/kvNOzeYAa/09O+Hjo402TKZ5/EOoN8TQcbFeJ911ltmyFXd9uSsg9c1Crf1uMv
	 9Va09mav8/4G2XhKoi2pO+RMYCZIuw4st8hi/vl54060dNYGZ5tos7EAsZhWvPlHJz
	 m1zW4WTWSNXxZUcIchHZo/u+myk8tRt1OiJcEj4wQfVodpxmC0AOlHd40JU03kWCZm
	 vHwXc6tE2wn238eZ8n+LB8t6fiERAfmQrNksmA/DsewRw3T9YdGcsGJt2edfOuWQIk
	 X1G9PKA7trUAKdlpoUTEge2+x7BWuSzJ1SYCNJwKXsavtHkVKuyXpmzkwNLn4a0GeA
	 fYVpum82ee8zw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-543e49a10f5so5348039e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 20:05:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbKByPqdSgBcUsSSDBJhl+ucDMEB0jWqyLwNNv4CTcb/+wElBADagn5CrXYOp4VscDvG8Jc9n8rB1ALg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7JurWKgVNafRhkZhUr5J/uqnGg8E8RDcyckc1d/Z2KqtsZl4v
	h7Ks88NYWH5TOSQ4YQJDDNA9K1tf50g7wLfGvT8yZr18/khJ9PiNhOUImD/itHaseYvdACgeXJn
	3q8t34fvkPuNdyBMxlN793/m5f9U=
X-Google-Smtp-Source: AGHT+IHlMZJiSIPfje5V6EpLCF9/1THBrDnaoiSmFMYZV1yxrts0ySZYzq9KhzqWKZMHD2nbIaJyN+BNN661NZ4Ddn0=
X-Received: by 2002:a05:6512:3e18:b0:540:3561:666f with SMTP id
 2adb3069b0e04-543e4beac7cmr7820687e87.20.1738641902557; Mon, 03 Feb 2025
 20:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162> <Z5xzkwwZAWRRLCdj@ghost> <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
 <Z51BpVEkmVCg7gTX@ghost>
In-Reply-To: <Z51BpVEkmVCg7gTX@ghost>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 4 Feb 2025 13:04:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNATs=c4J7mR69ec3scPqw6PK4SKTs-ixrQM_eRiz=EhS8A@mail.gmail.com>
X-Gm-Features: AWEUYZmxhfJiLTgBSx_fCApybyr2Ad9PFplUqS9irvMW6M3bhQaX-hsT1E7z8vE
Message-ID: <CAK7LNATs=c4J7mR69ec3scPqw6PK4SKTs-ixrQM_eRiz=EhS8A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_200505_808924_9716756A 
X-CRM114-Status: GOOD (  34.16  )
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

T24gU2F0LCBGZWIgMSwgMjAyNSBhdCA2OjMz4oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIEZlYiAwMSwgMjAyNSBhdCAxMjoxMDow
MkFNICswOTAwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6Cj4gPiBPbiBGcmksIEphbiAzMSwgMjAy
NSBhdCAzOjU04oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgSmFuIDMwLCAyMDI1IGF0IDA4OjUyOjQ1UE0gLTA3MDAs
IE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+ID4gPiA+IE9uIFdlZCwgSmFuIDIyLCAyMDI1IGF0
IDA3OjE3OjI2UE0gLTA4MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+ID4gPiA+IE9uIHJp
c2N2LCBrZXJuZWwgbW9kdWxlcyBlbmQgdXAgd2l0aCBhIHNpZ25pZmljYW50IG51bWJlciBvZiBs
b2NhbAo+ID4gPiA+ID4gc3ltYm9scy4gVGhpcyBiZWNvbWVzIGFwcGFyZW50IHdoZW4gY29tcGls
aW5nIG1vZHVsZXMgd2l0aCBkZWJ1ZyBzeW1ib2xzCj4gPiA+ID4gPiBlbmFibGVkLiBVc2luZyBh
bWRncHUua28gYXMgYW4gZXhhbXBsZSBvZiBhIGxhcmdlIG1vZHVsZSwgb24gcmlzY3YgdGhlCj4g
PiA+ID4gPiBzaXplIGlzIDc1NE1CIChubyBzdHJpcHBpbmcpLCA1M01CICgtLXN0cmlwLWRlYnVn
KSwgYW5kIDIxTUIKPiA+ID4gPiA+ICgtLXN0cmlwLXVubmVlZGVkKS4gT04geDg2LCBhbWRncHUu
a28gaXMgNDgyTUIgKG5vIHN0cmlwcGluZyksIDIxTUIKPiA+ID4gPiA+ICgtLXN0cmlwLWRlYnVn
KSwgYW5kIDIwTUIgKC0tc3RyaXAtdW5uZWVkZWQpLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFVzZSAt
LXN0cmlwLXVubmVlZGVkIGluc3RlYWQgb2YgLS1zdHJpcC1kZWJ1ZyB0byBzdHJpcCBtb2R1bGVz
IHNvCj4gPiA+ID4gPiBkZWNyZWFzZSB0aGUgc2l6ZSBvZiB0aGUgcmVzdWx0aW5nIG1vZHVsZXMu
IFRoaXMgaXMgcGFydGljdWxhcmx5Cj4gPiA+ID4gPiByZWxldmFudCBmb3IgcmlzY3YsIGJ1dCBh
bHNvIG1hcmdpbmFsbHkgYWlkcyBvdGhlciBhcmNoaXRlY3R1cmVzLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+
Cj4gPiA+ID4KPiA+ID4gPiBJcyB0aGVyZSBhbnkgc29ydCBvZiByZWdyZXNzaW9uIHJpc2sgd2l0
aCB0aGlzIHBhdGNoPyBJZiBzbywgYW5vdGhlcgo+ID4gPiA+IG9wdGlvbiBtYXkgYmUgdG8gZ2l2
ZSBhbm90aGVyIGxldmVsIHRvIElOU1RBTExfTU9EX1NUUklQIGxpa2UgMiBzbyB0aGF0Cj4gPiA+
ID4gSU5TVEFMTF9NT0RfU1RSSVA9MSBjb250aW51ZXMgdG8gYmVoYXZlIGFzIGJlZm9yZSBidXQg
cGVvcGxlIGNhbiBlYXNpbHkKPiA+ID4gPiBvcHQgaW50byB0aGlzIG9wdGlvbi4gTm8gc3Ryb25n
IG9waW5pb24gYmVjYXVzZSBJIGFtIG5vdCBzdXJlIGJ1dCB3YXMKPiA+ID4gPiBub3Qgc3VyZSBp
ZiBpdCB3YXMgY29uc2lkZXJlZC4KPiA+ID4KPiA+ID4gSSBkbyBub3QgYmVsaWV2ZSB0aGlzIHdv
dWxkIGNhdXNlIHJlZ3Jlc3Npb25zLiBUaGUgZGVzY3JpcHRpb24gb24gZ251Cj4gPiA+IHN0cmlw
IGlzOgo+ID4gPgo+ID4gPiAiUmVtb3ZlIGFsbCBzeW1ib2xzIHRoYXQgYXJlIG5vdCBuZWVkZWQg
Zm9yIHJlbG9jYXRpb24gcHJvY2Vzc2luZyBpbgo+ID4gPiBhZGRpdGlvbiB0byBkZWJ1Z2dpbmcg
c3ltYm9scyBhbmQgc2VjdGlvbnMgc3RyaXBwZWQgYnkgLS1zdHJpcC1kZWJ1Zy4iCj4gPiA+Cj4g
PiA+IFRoZSBkZXNjcmlwdGlvbiBvbiBsbHZtLXN0cmlwIGlzOgo+ID4gPgo+ID4gPiAiUmVtb3Zl
IGZyb20gdGhlIG91dHB1dCBhbGwgbG9jYWwgb3IgdW5kZWZpbmVkIHN5bWJvbHMgdGhhdCBhcmUg
bm90Cj4gPiA+IHJlcXVpcmVkIGJ5IHJlbG9jYXRpb25zLiBBbHNvIHJlbW92ZSBhbGwgZGVidWcg
c2VjdGlvbnMuIgo+ID4gPgo+ID4gPiBnbnUgc3RyaXAgLS1zdHJpcC11bm5lZWRlZCBzdHJpcHMg
c2xpZ2h0bHkgbW9yZSBhZ2dyZXNzaXZlbHkgYnV0IGl0IGRvZXMKPiA+ID4gbm90IGFwcGVhciB0
aGlzIGNhdXNlcyBhbnkgaXNzdWVzLgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gUmVnYXJkbGVzczoK
PiA+ID4gPgo+ID4gPiA+IFJldmlld2VkLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtl
cm5lbC5vcmc+Cj4gPiA+Cj4gPiA+IFRoYW5rcyEKPiA+ID4KPiA+Cj4gPgo+ID4gSXQgaXMgdHJ1
ZSAtLXN0cmlwLXVubmVlZGVkIGRyb3BzIGEgbG90IG9mIGNvbXBpbGVyLWdlbmVyYXRlZCBzeW1i
b2xzLCBidXQKPiA+IGl0IGFsc28gZHJvcHMgcmVhbCBzeW1ib2xzIHRoYXQgb3JpZ2luYXRlIGlu
IHRoZSBzb3VyY2UgY29kZS4KPiA+Cj4gPiBTbywgdGhpcyB3b3VsZCBnaXZlIHVzZXItdmlzaWJs
ZSBjaGFuZ2VzIGZvciBrYWxsc3ltcyBhdCBsZWFzdC4KPgo+IEFkZGluZyBJTlNUQUxMX01PRF9T
VFJJUD0iLS1zdHJpcC11bm5lZWRlZCIgd291bGQgYmUgc3VmZmljaWVudCBmb3IKPiByaXNjdi4g
SG93ZXZlciwgdGhpcyBoYXMgdGhlIGRvd25zaWRlIHRoYXQgcmlzY3Ygd2lsbCByZXF1aXJlIGRp
ZmZlcmVudAo+IGZsYWdzIHRoYW4gb3RoZXIgYXJjaGl0ZWN0dXJlcyB0byBnZXQgcmVhc29uYWJs
eSBzaXplZCBtb2R1bGVzLgoKWW91IGNhbiB1c2UgSU5TVEFMTF9NT0RfU1RSSVA9LS1zdHJpcC11
bm5lZWRlZCBmb3IgYWxsIGFyY2hpdGVjdHVyZSBpZiB5b3UgbGlrZS4KCkkgYXNzdW1lIHRoaXMg
aXMgYSByaXNjdiBpc3N1ZS4gU3BlY2lmaWNhbGx5LCByaXNjdiBnY2MuCldpdGggTExWTT0xLCBJ
IHNlZSBtdWNoIHNtYWxsZXIgcmlzY3YgbW9kdWxlcyB1c2luZyBJTlNUQUxMX01PRF9TVFJJUD0x
LgoKLS1zdHJpcC11bm5lZWRlZCBpcyBuZWVkbGVzc2x5IGFnZ3Jlc3NpdmUgZm9yIG90aGVyIGFy
Y2hpdGVjdHVyZXMsCmFuZCBJIGRvIG5vdCBzZWUgYSBnb29kIHJlYXNvbiB0byBjaGFuZ2UgdGhl
IGRlZmF1bHQuCgoKCgoKCgoKCj4KPiBJIGJlbGlldmUgdGhlc2Ugc3ltYm9scyBhcmUgb25seSB1
c2VmdWwgZm9yIGRlYnVnZ2luZywgaXMgdGhlcmUgYQo+IHVzZWNhc2UgZm9yIHRoZW0gdG8gYmUg
YXZhaWxhYmxlIHdoZW4gdGhlIHVzZXIgaGFzIG1vZHVsZXMgY29tcGlsZWQgd2l0aAo+IElOU1RB
TExfTU9EX1NUUklQPTE/Cj4KPiAtIENoYXJsaWUKPgo+ID4KPiA+Cj4gPiAkIHJpc2N2NjQtbGlu
dXgtZ251LW5tICAtbgo+ID4gL3RtcC9zdHJpcC11bm5lZWRlZC9saWIvbW9kdWxlcy82LjEzLjAt
MDk3NjAtZzY5ZTg1OGUwYjhiMi9rZXJuZWwvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmtvCj4gPiAgPiAvdG1wL3N5bWJvbC13aXRoLXN0cmlwLXVubmVlZGVkCj4gPiAkIHJpc2N2
NjQtbGludXgtZ251LW5tICAtbgo+ID4gL3RtcC9zdHJpcC1kZWJ1Zy9saWIvbW9kdWxlcy82LjEz
LjAtMDk3NjAtZzY5ZTg1OGUwYjhiMi9rZXJuZWwvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmtvCj4gPiAgPiAvdG1wL3N5bWJvbC13aXRoLXN0cmlwLWRlYnVnCj4gPgo+ID4gJCAg
ZGlmZiAtdSAvdG1wL3N5bWJvbC13aXRoLXN0cmlwLWRlYnVnICAvdG1wL3N5bWJvbC13aXRoLXN0
cmlwLXVubmVlZGVkCj4gPiAgWyBzbmlwIF0KPiA+ICAwMDAwMDAwMDAwMTY3NmNjIHQgdXZkX3Y2
XzBfcmluZ190ZXN0X3JpbmcKPiA+ICAwMDAwMDAwMDAwMTY3ODAyIHQgdXZkX3Y2XzBfcmluZ19l
bWl0X3BpcGVsaW5lX3N5bmMKPiA+ICAwMDAwMDAwMDAwMTY3YTAyIHQgdXZkX3Y2XzBfcmluZ19l
bWl0X2ZlbmNlCj4gPiAtMDAwMDAwMDAwMDE2N2I1OCByIENTV1RDSC4yCj4gPiAtMDAwMDAwMDAw
MDE2N2I2OCByIGFibV9zZXR0aW5ncwo+ID4gLTAwMDAwMDAwMDAxNjdiODAgciBhYm1fY29uZmln
Cj4gPiAtMDAwMDAwMDAwMDE2N2I5MCByIG1pbl9yZWR1Y3Rpb25fdGFibGVfdl8yXzIKPiA+IC0w
MDAwMDAwMDAwMTY3YmEwIHIgbWF4X3JlZHVjdGlvbl90YWJsZV92XzJfMgo+ID4gLTAwMDAwMDAw
MDAxNjdiYjAgciBtaW5fcmVkdWN0aW9uX3RhYmxlCj4gPiAtMDAwMDAwMDAwMDE2N2JjMCByIG1h
eF9yZWR1Y3Rpb25fdGFibGUKPiA+IC0wMDAwMDAwMDAwMTY3YmQwIHIgY3VzdG9tX2JhY2tsaWdo
dF9jdXJ2ZTAKPiA+ICAwMDAwMDAwMDAwMTY3YzM4IHIgYWJtX3NldHRpbmdzX2NvbmZpZzIKPiA+
ICAwMDAwMDAwMDAwMTY3YzcwIHIgYWJtX3NldHRpbmdzX2NvbmZpZzEKPiA+ICAwMDAwMDAwMDAw
MTY3Y2E4IHIgYWJtX3NldHRpbmdzX2NvbmZpZzAKPiA+Cj4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4g
QmVzdCBSZWdhcmRzCj4gPiBNYXNhaGlybyBZYW1hZGEKCgoKLS0KQmVzdCBSZWdhcmRzCk1hc2Fo
aXJvIFlhbWFkYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
