Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E107DC2B9F4
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 23:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9349460FF2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 23:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9349460FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwMupldAGMaSB2OfyhmCs+EccdafMw5Ty1QZ0ilk7rM=; b=1ANz/zgiMdxo62
	AsTQYZkBitQJybWEBbX1Phxlo8gnH+9ZL527I2lRdhhRea7/+Ldi71udFGqXG9RjEiHzcNutp4EY7
	usT9u3Aqx+Ahfv/xiEDQ8FcQwKi1Gfzo1W05dcT5qf2OuMMEjdDh0CU8N2koV2Jd0rKEsOcTtPJyH
	TkEFAZ/f6VoC6sHwxiAlIglj82qAEWnpgVDPuqOEbrSa+ZKwJZexHkcIWUrrXr+H40qMfLsKBSIQ2
	bzY6XEbaA3JaNJvgCHgrMehqwyh6Kc6WK29bPn5EY2tBNjg5dr/pT1O1aH0axbx5rQZPVUuaouvF/
	qvzl4PQ4+SkzOXizVyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvpwe-008lC4-Hl; Tue, 22 Jun 2021 23:36:40 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvpwb-008lBI-12
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 23:36:38 +0000
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by linux.microsoft.com (Postfix) with ESMTPSA id 8A3A520B83FC
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 16:36:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8A3A520B83FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1624404995;
 bh=sbj5HIp4xJpRCiR6qVH+qNxqoKYrQm16hkrJ8Ci8owA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iETFZt5/lRZ/8BTZByARg+ERVKWkTbk+eqrO6mH7uWjdIqdt/rU7eHketabJGeRch
 eGMDrvb5bx3J4BbkeyaGrfFIjhgV8+ZUVq6I7CeT8/dyf94g3WA8rSUDJFYkFTkhxJ
 c2IKISNylmGLmTxemsFI32FvjdYBkBXsKMSj6Mfw=
Received: by mail-pl1-f171.google.com with SMTP id f10so143359plg.0
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 16:36:35 -0700 (PDT)
X-Gm-Message-State: AOAM530fag7MMp7XFBKPpTYaQADCUsCKdsBr/GZSdSBAaHXSLNJSDx4F
 k9k6lM4WhsveG+gcvosREIQJfwGJAbg7nevnOEY=
X-Google-Smtp-Source: ABdhPJzJ/12H4j0kvVazrTUlwFMjCdoEf5U0mhOYx6FiB6v9DtkVqSO4D7wVK5OaLf5i8qBy3oCZnMdRev/C+dtZnBE=
X-Received: by 2002:a17:90b:4b49:: with SMTP id
 mi9mr6191693pjb.187.1624404994991; 
 Tue, 22 Jun 2021 16:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-2-mcroce@linux.microsoft.com>
 <87f2cf0e98c5c5560cfb591b4f4b29c8@mailhost.ics.forth.gr>
In-Reply-To: <87f2cf0e98c5c5560cfb591b4f4b29c8@mailhost.ics.forth.gr>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Wed, 23 Jun 2021 01:35:58 +0200
X-Gmail-Original-Message-ID: <CAFnufp0JuAvrOA89KDbcbhMeMvovoS96STVV+r53PLGJV4r0aw@mail.gmail.com>
Message-ID: <CAFnufp0JuAvrOA89KDbcbhMeMvovoS96STVV+r53PLGJV4r0aw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: optimized memcpy
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>, 
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_163637_162598_C75D5AED 
X-CRM114-Status: GOOD (  35.47  )
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

T24gVHVlLCBKdW4gMjIsIDIwMjEgYXQgMjoxNSBBTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNz
LmZvcnRoLmdyPiB3cm90ZToKPgo+IEhlbGxvIE1hdHRlbyBhbmQgdGhhbmtzIGZvciB0aGUgcGF0
Y2gsCj4KPiDOo8+EzrnPgiAyMDIxLTA2LTE3IDE4OjI3LCBNYXR0ZW8gQ3JvY2Ugzq3Os8+BzrHP
iM61Ogo+ID4KPiA+IEBAIC0wLDAgKzEsOTEgQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5Cj4gPiArLyoKPiA+ICsgKiBTdHJpbmcgZnVuY3Rpb25zIG9wdGlt
aXplZCBmb3IgaGFyZHdhcmUgd2hpY2ggZG9lc24ndAo+ID4gKyAqIGhhbmRsZSB1bmFsaWduZWQg
bWVtb3J5IGFjY2Vzc2VzIGVmZmljaWVudGx5Lgo+ID4gKyAqCj4gPiArICogQ29weXJpZ2h0IChD
KSAyMDIxIE1hdHRlbyBDcm9jZQo+ID4gKyAqLwo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC90
eXBlcy5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ICsKPiA+ICsvKiBNaW5p
bXVtIHNpemUgZm9yIGEgd29yZCBjb3B5IHRvIGJlIGNvbnZlbmllbnQgKi8KPiA+ICsjZGVmaW5l
IE1JTl9USFJFU0hPTEQgKEJJVFNfUEVSX0xPTkcgLyA4ICogMikKPiA+ICsKPiA+ICsvKiBjb252
ZW5pZW5jZSB1bmlvbiB0byBhdm9pZCBjYXN0IGJldHdlZW4gZGlmZmVyZW50IHBvaW50ZXIgdHlw
ZXMgKi8KPiA+ICt1bmlvbiB0eXBlcyB7Cj4gPiArICAgICB1OCAqdTg7Cj4KPiBZb3UgYXJlIHVz
aW5nIGEgdHlwZSBhcyBhIG5hbWUsIEknZCBnbyB3aXRoIGFzX2J5dGVzL2FzX3Vsb25nL2FzX3Vw
dHIKPiB3aGljaCBtYWtlcyBpdCBlYXNpZXIgZm9yIHRoZSByZWFkZXIgdG8gdW5kZXJzdGFuZCB3
aGF0IHlvdSBhcmUgdHJ5aW5nCj4gdG8gZG8uCj4KCk1ha2VzIHNlbnNlCgo+ID4gKyAgICAgdW5z
aWduZWQgbG9uZyAqdWxvbmc7Cj4gPiArICAgICB1aW50cHRyX3QgdXB0cjsKPiA+ICt9Owo+ID4g
Kwo+ID4gK3VuaW9uIGNvbnN0X3R5cGVzIHsKPiA+ICsgICAgIGNvbnN0IHU4ICp1ODsKPiA+ICsg
ICAgIHVuc2lnbmVkIGxvbmcgKnVsb25nOwo+ID4gK307Cj4gPiArCj4KPiBJIHN1Z2dlc3QgeW91
IGRlZmluZSB0aG9zZSB1bmlvbnMgaW5zaWRlIHRoZSBmdW5jdGlvbiBib2R5LCBubyBvbmUgZWxz
ZQo+IGlzIHVzaW5nIHRoZW0uCj4KClRoZXkgd2lsbCBiZSB1c2VkIGluIG1lbXNldCgpLCBpbiBw
YXRjaCAzLzMKCj4gPiArdm9pZCAqX19tZW1jcHkodm9pZCAqZGVzdCwgY29uc3Qgdm9pZCAqc3Jj
LCBzaXplX3QgY291bnQpCj4gPiArewo+ID4gKyAgICAgY29uc3QgaW50IGJ5dGVzX2xvbmcgPSBC
SVRTX1BFUl9MT05HIC8gODsKPiA+ICsjaWZuZGVmIENPTkZJR19IQVZFX0VGRklDSUVOVF9VTkFM
SUdORURfQUNDRVNTCj4gPiArICAgICBjb25zdCBpbnQgbWFzayA9IGJ5dGVzX2xvbmcgLSAxOwo+
ID4gKyAgICAgY29uc3QgaW50IGRpc3RhbmNlID0gKHNyYyAtIGRlc3QpICYgbWFzazsKPgo+IFdo
eSBub3QgdW5zaWduZWQgaW50cyA/Cj4KCk9rLgoKPiA+ICsjZW5kaWYKPiA+ICsgICAgIHVuaW9u
IGNvbnN0X3R5cGVzIHMgPSB7IC51OCA9IHNyYyB9Owo+ID4gKyAgICAgdW5pb24gdHlwZXMgZCA9
IHsgLnU4ID0gZGVzdCB9Owo+ID4gKwo+ID4gKyNpZm5kZWYgQ09ORklHX0hBVkVfRUZGSUNJRU5U
X1VOQUxJR05FRF9BQ0NFU1MKPgo+IElmIHlvdSB3YW50IHRvIGJlIGNvbXBsaWFudCB3aXRoIG1l
bWNweSB5b3Ugc2hvdWxkIGNoZWNrIGZvciBvdmVybGFwcGluZwo+IHJlZ2lvbnMgaGVyZSBzaW5j
ZSAiVGhlIG1lbW9yeSBhcmVhcyBtdXN0IG5vdCBvdmVybGFwIiwgYW5kIGRvIG5vdGhpbmcKPiBh
Ym91dCBpdCBiZWNhdXNlIGFjY29yZGluZyB0byBQT1NJWCB0aGlzIGxlYWRzIHRvIHVuZGVmaW5l
ZCBiZWhhdmlvci4KPiBUaGF0J3Mgd2h5IHJlY2VudCBsaWJjIGltcGxlbWVudGF0aW9ucyB1c2Ug
bWVtbW92ZSBpbiBhbnkgY2FzZSAobWVtY3B5Cj4gaXMgYW4gYWxpYXMgdG8gbWVtbW92ZSksIHdo
aWNoIGlzIHRoZSBzdWdnZXN0ZWQgYXBwcm9hY2guCj4KCk1tbSB3aGljaCBtZW1jcHkgYXJjaCBp
bXBsZW1lbnRhdGlvbiBkb2VzIHRoaXMgY2hlY2s/CkkgZ3Vlc3MgdGhhdCBub29uZSBpcyBjdXJy
ZW50bHkgZG9pbmcgaXQuCgo+ID4gKyAgICAgaWYgKGNvdW50IDwgTUlOX1RIUkVTSE9MRCkKPiA+
ICsgICAgICAgICAgICAgZ290byBjb3B5X3JlbWFpbmRlcjsKPiA+ICsKPiA+ICsgICAgIC8qIGNv
cHkgYSBieXRlIGF0IHRpbWUgdW50aWwgZGVzdGluYXRpb24gaXMgYWxpZ25lZCAqLwo+ID4gKyAg
ICAgZm9yICg7IGNvdW50ICYmIGQudXB0ciAmIG1hc2s7IGNvdW50LS0pCj4gPiArICAgICAgICAg
ICAgICpkLnU4KysgPSAqcy51OCsrOwo+ID4gKwo+Cj4gWW91IHNob3VsZCBjaGVjayBmb3IgIUlT
X0VOQUJMRUQoQ09ORklHX0NQVV9CSUdfRU5ESUFOKSBoZXJlLgo+CgpJIHRvdWdodCB0aGF0IG9u
bHkgTGl0dGxlIEVuZGlhbiBSSVNDLVYgbWFjaGluZXMgd2VyZSBzdXBwb3J0ZWQgaW4gTGludXgu
ClNob3VsZCBJIGFkZCBhIEJVSUxEX0JVR19PTigpPwpBbnl3YXksIGlmIHRoaXMgaXMgZ29pbmcg
aW4gZ2VuZXJpYyBsaWIvLCBJJ2xsIHRha2UgY2FyZSBvZiB0aGUgZW5kaWFubmVzcy4KCj4gPiAr
ICAgICBpZiAoZGlzdGFuY2UpIHsKPiA+ICsgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBsYXN0
LCBuZXh0Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICAvKiBtb3ZlIHMgYmFja3dhcmQgdG8gdGhl
IHByZXZpb3VzIGFsaWdubWVudCBib3VuZGFyeSAqLwo+ID4gKyAgICAgICAgICAgICBzLnU4IC09
IGRpc3RhbmNlOwo+Cj4gSXQnZCBoZWxwIGhlcmUgdG8gZXhwbGFpbiB0aGF0IHNpbmNlIHMgaXMg
ZGlzdGFuY2UgYnl0ZXMgYWhlYWQgcmVsYXRpdmUKPiB0byBkLCBhbmQgZCByZWFjaGVkIHRoZSBh
bGlnbm1lbnQgYm91bmRhcnkgYWJvdmUsIHMgaXMgbm93IGFsaWduZWQgYnV0Cj4gdGhlIGRhdGEg
bmVlZHMgdG8gYmUgc2hpZnRlZCB0byBjb21wZW5zYXRlIGZvciBkaXN0YW5jZSwgaW4gb3JkZXIg
dG8gZG8KPiB3b3JkLWJ5LXdvcmQgY29weS4KPgo+ID4gKwo+ID4gKyAgICAgICAgICAgICAvKiAz
Mi82NCBiaXQgd2lkZSBjb3B5IGZyb20gcyB0byBkLgo+ID4gKyAgICAgICAgICAgICAgKiBkIGlz
IGFsaWduZWQgbm93IGJ1dCBzIGlzIG5vdCwgc28gcmVhZCBzIGFsaWdubWVudCB3aXNlLAo+ID4g
KyAgICAgICAgICAgICAgKiBhbmQgZG8gcHJvcGVyIHNoaWZ0IHRvIGdldCB0aGUgcmlnaHQgdmFs
dWUuCj4gPiArICAgICAgICAgICAgICAqIFdvcmtzIG9ubHkgb24gTGl0dGxlIEVuZGlhbiBtYWNo
aW5lcy4KPiA+ICsgICAgICAgICAgICAgICovCj4KPiBUaGlzIGNvbW1lbmQgaXMgbWlzbGVhZGlu
ZyBiZWNhdXNlIHMgaXMgYWxpZ25lZCBvciBlbHNlIHMudWxvbmdbMF0vWzFdCj4gYmVsb3cgd291
bGQgcmVzdWx0IGFuIHVuYWxpZ25lZCBhY2Nlc3MuCj4KClllcywgdGhvc2UgdHdvIGNvbW1lbnRz
IHNob3VsZCBiZSByZXBocmFzZWQsIG1lcmdlZCBhbmQgcHV0IGFib3ZlLgoKPiA+ICsgICAgICAg
ICAgICAgZm9yIChuZXh0ID0gcy51bG9uZ1swXTsgY291bnQgPj0gYnl0ZXNfbG9uZyArIG1hc2s7
IGNvdW50IC09Cj4gPiBieXRlc19sb25nKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgbGFz
dCA9IG5leHQ7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgbmV4dCA9IHMudWxvbmdbMV07Cj4g
PiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgZC51bG9uZ1swXSA9IGxhc3QgPj4gKGRpc3Rh
bmNlICogOCkgfAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuZXh0IDw8
ICgoYnl0ZXNfbG9uZyAtIGRpc3RhbmNlKSAqIDgpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGQudWxvbmcrKzsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBzLnVsb25nKys7Cj4g
PiArICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgLyogcmVzdG9yZSBzIHdp
dGggdGhlIG9yaWdpbmFsIG9mZnNldCAqLwo+ID4gKyAgICAgICAgICAgICBzLnU4ICs9IGRpc3Rh
bmNlOwo+ID4gKyAgICAgfSBlbHNlCj4gPiArI2VuZGlmCj4gPiArICAgICB7Cj4gPiArICAgICAg
ICAgICAgIC8qIGlmIHRoZSBzb3VyY2UgYW5kIGRlc3QgbG93ZXIgYml0cyBhcmUgdGhlIHNhbWUs
IGRvIGEgc2ltcGxlCj4gPiArICAgICAgICAgICAgICAqIDMyLzY0IGJpdCB3aWRlIGNvcHkuCj4g
PiArICAgICAgICAgICAgICAqLwo+Cj4gQSB3aGlsZSgpIGxvb3Agd291bGQgbWFrZSBtb3JlIHNl
bnNlIGhlcmUuCj4KCk9rLgoKPiA+ICsgICAgICAgICAgICAgZm9yICg7IGNvdW50ID49IGJ5dGVz
X2xvbmc7IGNvdW50IC09IGJ5dGVzX2xvbmcpCj4gPiArICAgICAgICAgICAgICAgICAgICAgKmQu
dWxvbmcrKyA9ICpzLnVsb25nKys7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICAvKiBzdXBw
cmVzcyB3YXJuaW5nIHdoZW4gQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1M9
eSAqLwo+ID4gKyAgICAgZ290byBjb3B5X3JlbWFpbmRlcjsKPiA+ICsKPiA+ICtjb3B5X3JlbWFp
bmRlcjoKPiA+ICsgICAgIHdoaWxlIChjb3VudC0tKQo+ID4gKyAgICAgICAgICAgICAqZC51OCsr
ID0gKnMudTgrKzsKPiA+ICsKPiA+ICsgICAgIHJldHVybiBkZXN0Owo+ID4gK30KPiA+ICtFWFBP
UlRfU1lNQk9MKF9fbWVtY3B5KTsKPiA+ICsKPiA+ICt2b2lkICptZW1jcHkodm9pZCAqZGVzdCwg
Y29uc3Qgdm9pZCAqc3JjLCBzaXplX3QgY291bnQpIF9fd2Vhawo+ID4gX19hbGlhcyhfX21lbWNw
eSk7Cj4gPiArRVhQT1JUX1NZTUJPTChtZW1jcHkpOwoKUmVnYXJkcywKLS0gCnBlciBhc3BlcmEg
YWQgdXBzdHJlYW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
