Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66EBC48BD1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 13:19:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4BE2613BE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 13:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4BE2613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/I/E4b60zXQUuvPHQ3jh2KFutugCuy4mMVLBgo9OdA=; b=VSRQOi1WlIzlTY
	GlmnhRLJwanmuo+JrSjHOpJf7+Dr1e0joESeFPuxySVH2TJfBJLD7LbZP2SrBBxYDX60cmbOcN8o3
	3jWMqIOLQpyVauiWx/WyLd3VFLDEIiBu8hxkcogZR5SpjeFhHnk48jUEDCohqazBAP//CtxPgh+Yt
	TTJE02pDN20Bks82uCXnYK7zo7/RzuQuiu8YUHowGH9PHCeBNpEjV8O5L6ZfWc2X6xtRO1PGzCiXv
	x0Ag1549aZPC1dsyLYnIAkKBkbjqVkkXsuxpfA/nMO+hOwRXTf8u5xmuh0+WG6Shx6c+oPYgFEIaa
	5WXkI7fE+BVTeQ4DlRbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqy6j-00Dxad-I8; Wed, 09 Jun 2021 13:18:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqxYr-00DlX1-1n
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 12:43:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F178613B9
 for <linux-riscv@lists.infradead.org>; Wed,  9 Jun 2021 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623242636;
 bh=10QiHmdISEb61jB5RWmOiBIlcBu20xh90lnX4V4t658=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=np63E2gLpqH2koO1sA8ouLSSpC5l15+gBFl6+tWS96shPTdNepYNSn9cDSH/uvA9y
 iqwMawHznNJuDnZBDAJygJJxFKosRf8hQetp6ufT8EQ+TG9Hx3zQQDkFk/TS14Jlp/
 w1t5fxf4TWd+lKiXS2DrJfiMqguIKgFwYNf+Me7oO9nDLwkoj+kUkc5eE3BQ49kDKi
 EYy7NqMcB5S56mhY1v2FB9T512g+Bx2i/aPIMTOtai05lTAYvjzGjsXRGOHqrlVgFr
 1Imj5zRfZv12UODH98O9MTB/PYHwhgqUM/2FR9hAafvLcjKbGOEVSAIV73rjJ8IcZy
 u85/1m9Ee5UAA==
Received: by mail-lj1-f174.google.com with SMTP id 131so31512243ljj.3
 for <linux-riscv@lists.infradead.org>; Wed, 09 Jun 2021 05:43:56 -0700 (PDT)
X-Gm-Message-State: AOAM5311u3f56wOQz0E5sFhPPfWWqTgbPrvdl8xNLY4kDIFC9y2maA4z
 knQhncxS6eSbNrbhwm/57eW95h2dnbzuSiP/kZI=
X-Google-Smtp-Source: ABdhPJwaURGU3O5Ijy4ZAJhrS1dz1Pr8wQ0Y85BdkXWeynG0YUhR28g4jNQRqhR4QWRMjatsBLaORSkBBJxkyOyBss8=
X-Received: by 2002:a2e:900f:: with SMTP id h15mr20711283ljg.285.1623242634796; 
 Wed, 09 Jun 2021 05:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
 <CAJF2gTQ5271AP8aw42yvfOg0LjtnmPD8j_Uza6NH2nHxVz_QgQ@mail.gmail.com>
 <78f544f739120f5b541238a1d5f6e23b@mailhost.ics.forth.gr>
In-Reply-To: <78f544f739120f5b541238a1d5f6e23b@mailhost.ics.forth.gr>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 9 Jun 2021 20:43:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSko9yu_Hqgu3vOzjS=uPKC8jaLdgkAXx1BW2k26uuJRg@mail.gmail.com>
Message-ID: <CAJF2gTSko9yu_Hqgu3vOzjS=uPKC8jaLdgkAXx1BW2k26uuJRg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Christoph Hellwig <hch@lst.de>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Benjamin Koch <snowball@c3pb.de>, 
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_054357_164978_14696821 
X-CRM114-Status: GOOD (  38.02  )
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

T24gV2VkLCBKdW4gOSwgMjAyMSBhdCA1OjQ1IFBNIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3Mu
Zm9ydGguZ3I+IHdyb3RlOgo+Cj4gzqPPhM65z4IgMjAyMS0wNi0wOSAwNjoyOCwgR3VvIFJlbiDO
rc6zz4HOsc+IzrU6Cj4gPiBPbiBNb24sIEp1biA3LCAyMDIxIGF0IDI6MTQgQU0gTmljayBLb3Nz
aWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4KPiA+IHdyb3RlOgo+ID4+Cj4gPj4gzqPPhM65z4Ig
MjAyMS0wNS0yMCAwNDo0NSwgR3VvIFJlbiDOrc6zz4HOsc+IzrU6Cj4gPj4gPiBPbiBXZWQsIE1h
eSAxOSwgMjAyMSBhdCAyOjUzIFBNIENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90
ZToKPiA+PiA+Pgo+ID4+ID4+IE9uIFR1ZSwgTWF5IDE4LCAyMDIxIGF0IDExOjQ0OjM1UE0gLTA3
MDAsIERyZXcgRnVzdGluaSB3cm90ZToKPiA+PiA+PiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGxvb2tz
IGxpa2UgaXQgbWlnaHQgYmUgdXNlZnVsIGZvciB0aGUgU3RhckZpdmUgSkg3MTAwCj4gPj4gPj4g
PiBbMV0gWzJdIHRvbyBhcyBpdCBoYXMgcGVyaXBoZXJhbHMgb24gYSBub24tY29oZXJlbnQgaW50
ZXJjb25uZWN0LiBHTUFDLAo+ID4+ID4+ID4gVVNCIGFuZCBTRElPIHJlcXVpcmUgdGhhdCB0aGUg
TDIgY2FjaGUgbXVzdCBiZSBtYW51YWxseSBmbHVzaGVkIGFmdGVyCj4gPj4gPj4gPiBETUEgb3Bl
cmF0aW9ucyBpZiB0aGUgZGF0YSBpcyBpbnRlbmRlZCB0byBiZSBzaGFyZWQgd2l0aCBVNzQgY29y
ZXMgWzJdLgo+ID4+ID4+Cj4gPj4gPj4gTm90IHRvbyBtdWNoLCBnaXZlbiB0aGF0IHRoZSBTaUZp
dmUgbGluZWFnZSBDUFVzIGhhdmUgYW4gdW5jYWNoZWQKPiA+PiA+PiB3aW5kb3csIHRoYXQgaXMg
YSB0b3RhbGx5IGRpZmZlcmVudCB3YXkgdG8gYWxsb2NhdGUgdW5jYWNoZWQgbWVtb3J5Lgo+ID4+
ID4gSXQncyBhIHZlcnkgYmlnIE1JUFMgc21lbGwuIFdoYXQncyB0aGUgYXR0cmlidXRlIG9mIHRo
ZSB1bmNhY2hlZAo+ID4+ID4gd2luZG93PyAodW5jYWNoZWQgKyBzdHJvbmctb3JkZXIvIHVuY2Fj
aGVkICsgd2VhaywgbW9zdCB2ZW5kb3JzIHN0aWxsCj4gPj4gPiB1c2UgQVhJIGludGVyY29ubmVj
dCwgaG93IHRvIGRlYWwgd2l0aCBhIGJ1ZmZlcmFibGUgYXR0cmlidXRlPykgSW4KPiA+PiA+IGZh
Y3QsIGN1c3RvbWVycycgZHJpdmVycyB1c2UgZGlmZmVyZW50IHdheXMgdG8gZGVhbCB3aXRoIERN
QSBtZW1vcnkgaW4KPiA+PiA+IG5vbi1jb2hlcmVudCBTT0MuIE1vc3QgcmlzY3YgU09DIHZlbmRv
cnMgYXJlIGZyb20gQVJNLCBzbyBnaXZpbmcgdGhlbQo+ID4+ID4gdGhlIHNhbWUgd2F5IGluIERN
QSBtZW1vcnkgaXMgYSBzbWFydCBjaG9pY2UuIFNvIHVzaW5nIFBURSBhdHRyaWJ1dGVzCj4gPj4g
PiBpcyBtb3JlIHN1aXRhYmxlLgo+ID4+ID4KPiA+PiA+IFNlZToKPiA+PiA+IGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi92aXJ0dWFsLW1lbW9yeS9ibG9iL21haW4vc3BlY3MvNjExLXZpcnR1YWwt
bWVtb3J5LWRpZmYucGRmCj4gPj4gPiA0LjQuMQo+ID4+ID4gVGhlIGRyYWZ0IHN1cHBvcnRzIGN1
c3RvbSBhdHRyaWJ1dGUgYml0cyBpbiBQVEUuCj4gPj4gPgo+ID4+Cj4gPj4gTm90IG9ubHkgaXQg
ZG9lc24ndCBzdXBwb3J0IGN1c3RvbSBhdHRyaWJ1dGVzIG9uIFBURXM6Cj4gPj4KPiA+PiAiQml0
czYz4oCTNTQgYXJlIHJlc2VydmVkIGZvciBmdXR1cmUgc3RhbmRhcmQgdXNlIGFuZCBtdXN0IGJl
IHplcm9lZCBieQo+ID4+IHNvZnR3YXJlIGZvciBmb3J3YXJkIGNvbXBhdGliaWxpdHkuIgo+ID4+
Cj4gPj4gSXQgYWxzbyBnb2VzIGZ1cnRoZXIgdG8gc2F5IHRoYXQ6Cj4gPj4KPiA+PiAiaWYgYW55
IG9mIHRoZXNlIGJpdHMgYXJlIHNldCwgYSBwYWdlLWZhdWx0IGV4Y2VwdGlvbiBpcyByYWlzZWQi
Cj4gPiBBZ3JlZSwgd2hlbiBvdXIgcHJvY2Vzc29yJ3MgbW11IHdvcmtzIGluIGNvbXBhdGlibGUg
bW11LCB3ZSBtdXN0IGtlZXAKPiA+ICJCaXRzNjPigJM1NCBiaXQiIHplcm8gaW4gTGludXguCj4g
PiBTbywgSSB0aGluayB0aGlzIGlzIHRoZSBmaXJzdCB2ZXJzaW9uIG9mIHRoZSBQVEUgZm9ybWF0
Lgo+ID4KPiA+IElmIHRoZSAiUEJNVCIgZXh0ZW5zaW9uIHByb3Bvc2FsIGlzIGFwcHJvdmVkLCBp
dCB3aWxsIGNhdXNlIHRoZSBzZWNvbmQKPiA+IHZlcnNpb24gb2YgdGhlIFBURSBmb3JtYXQuCj4g
Pgo+ID4gTWF5YmUgaW4gdGhlIGZ1dHVyZSwgd2UnbGwgZ2V0IG1vcmUgdmVyc2lvbnMgb2YgdGhl
IFBURSBmb3JtYXRzLgo+ID4KPiA+IFNvLCBzZWVtcyBMaW51eCBtdXN0IHN1cHBvcnQgbXVsdGkg
dmVyc2lvbnMgb2YgUFRFIGZvcm1hdHMgd2l0aCBvbmUKPiA+IEltYWdlLCByaWdodD8KPiA+Cj4g
PiBPa2F5LCB3ZSBjb3VsZCBzdG9wIGFyZ3Vpbmcgd2l0aCB0aGUgRDEgUFRFIGZvcm1hdC4gQW5k
IHRhbGsgYWJvdXQgaG93Cj4gPiB0byBsZXQgTGludXggc3VwcG9ydCBtdWx0aSB2ZXJzaW9ucyBv
ZiBQVEUgZm9ybWF0cyB0aGF0IGNvbWUgZnJvbSB0aGUKPiA+IGZ1dHVyZSBSSVNDLVYgcHJpdmls
ZWdlIHNwZWMuCj4KPiBUaGUgUklTQy1WIElTQSBzcGVjcyBhcmUgbWVhbnQgdG8gYmUgYmFja3dh
cmRzIGNvbXBhdGlibGUsIHNvIG5ld2VyIFBURQo+IHZlcnNpb25zIHNob3VsZCB3b3JrIG9uIG9s
ZGVyIGRldmljZXMgKG5vdGUgdGhhdCB0aGUgc3BlYyBzYXlzIHRoYXQKPiBzb2Z0d2FyZSBtdXN0
IHNldCB0aG9zZSBiaXRzIHRvIHplcm8gZm9yICJmb3J3YXJkIGNvbXBhdGliaWxpdHkiIGFuZCBh
cmUKPiAicmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1c2UiIHNvIGN1cnJlbnQgaW1wbGVtZW50YXRpb25z
IG11c3QgaWdub3JlIHRoZW0pLgo+IE9idmlvdXNseSB0aGUgcHJvcG9zZWQgImlmIGFueSBvZiB0
aGVzZSBiaXRzIGFyZSBzZXQsIGEgcGFnZS1mYXVsdAo+IGV4Y2VwdGlvbiBpcyByYWlzZWQiIHdp
bGwgYnJlYWsgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgd2hpY2ggaXMgd2h5IHdlCj4gbmVlZCB0
byBhc2sgZm9yIGl0IHRvIGJlIHJlbW92ZWQgZnJvbSB0aGUgZHJhZnQuCj4KPiBBcyBhbiBleGFt
cGxlIHRoZSBQQk1UIHByb3Bvc2FsIHVzZXMgYml0cyA2Mjo2MSB0aGF0IG9uIG9sZGVyIGh3IHNo
b3VsZAo+IGJlIGlnbm9yZWQgKCJyZXNlcnZlZCBmb3IgZnV0dXJlIHVzZSIpLCBpZiBMaW51eCB1
c2VzIHRob3NlIGJpdHMgd2UKPiB3b24ndCBuZWVkIGEgZGlmZmVyZW50IGNvZGUgcGF0aCBmb3Ig
c3VwcG9ydGluZyBvbGRlciBody9vbGRlciBQVEUKPiB2ZXJzaW9ucywgd2UnbGwganVzdCBzZXQg
dGhlbSBhbmQgb2xkZXIgaHcgd2lsbCBpZ25vcmUgdGhlbS4gQmVjYXVzZSBvZgo+IHRoZSBndWFy
YW50ZWUgdGhhdCBJU0Egc3BlY3MgbWFpbnRhaW4gYmFja3dhcmRzIGNvbXBhdGliaWxpdHksIHRo
ZQo+IGZ1bmN0aW9uYWxpdHkgb2YgYml0cyA2Mjo2MSBpcyBndWFyYW50ZWVkIHRvIHJlbWFpbiBi
YWNrd2FyZHMKPiBjb21wYXRpYmxlLgp0aGUgc3BlYyBzYXlzIHRoYXQgc29mdHdhcmUgbXVzdCBz
ZXQgdGhvc2UgYml0cyB0byB6ZXJvIGZvciAiZm9yd2FyZApjb21wYXRpYmlsaXR5Ii4gU28gaG93
IG9sZGVyIGh3IGlnbm9yZSB0aGVtPwpJZiBhbiBvbGRlciBodyBmb2xsb3cgdGhlIGN1cnJlbnQg
c3BlYyByZXF1aXJlcyBzb2Z0d2FyZSB0byBzZXQgdGhvc2UKYml0cyB0byB6ZXJvLCBob3cgd2Ug
cHV0IGFueSBQQk1UIGJpdHMgd2l0aG91dCBkaWZmZXJlbnQgTGludXggUFRFCmZvcm1hdHM/Cgo+
Cj4gSW4gb3RoZXIgd29yZHMgd2UgZG9uJ3QgbmVlZCBhbnkgc3BlY2lhbCBoYW5kbGluZyBvZiBt
dWx0aXBsZSBQVEUKPiBmb3JtYXRzLCB3ZSBqdXN0IG5lZWQgdG8gc3VwcG9ydCB0aGUgbGF0ZXN0
IFByaXYuIFNwZWMgYW5kIHRoZSBTcGVjCj4gaXRzZWxmIHdpbGwgZ3VhcmFudGVlIGJhY2t3YXJk
cyBjb21wYXRpYmlsaXR5LgpOYWssIHRvdGFsbHkgbm8gTG9naWNhbGx5IHNlbGYtY29uc2lzdGVu
dC4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
