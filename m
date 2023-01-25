Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD55C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 21:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AV8KP9FnS3bvHqnyNPSDnCNJqJu9eo//pKA1mtI1dkU=; b=k/aQF53f0B5neU
	3Em2XR5q4De/14Cf7BQ366OcPjvAR4NZgg1rnzbWFXK21PWWSOhSO5HoGalrRV7GGbMTKzcNoUj4N
	EfU5k16yUyKoGF3+Tp7t0IK7f7A6gUfG4WAY99ah+DdOKvFO5m9XHx0XmZElsnZs/AtdwTykTdlVz
	xMccUzcOeh3cDLy2Hq5JUWi5RvraMt5Kx2qgSxIIwhRYk4NuM66DGxgiWg3soJ0kTWn9b5L5Af4lg
	tBNwW8NtEAt4yUXghJk4zSlXqDxifJ/RcmWGm/Dni6weGcsrcBmEkZoypwJONHZ63dbIWYFuTgMYs
	75v5NkFCROHISrnFyYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKnT7-008soZ-LE; Wed, 25 Jan 2023 21:38:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKnT4-008smA-2q
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 21:38:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id d14so14724682wrr.9
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 13:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbZdqAhuTe9AIsgKG5ncENT/Fwm11IcS5xObaY+RarY=;
        b=UkLUBw8AwwhiORilDzbdXozeWE2tAzcPWOjBItkn4G5MvRlWWNiLNKxDEBg1Q4+exF
         NK34lXMXzWsN5JwM1A1eQw/1naFhpuGk86S21TaYfIEwjtls0hmVZXnJefidBCvZCoIc
         37zcDnL2e3NfJwU8yXvSjRNhSGIfFB9sDsjcWcVy2DOdvfpdNCV6nQ5vq+vm8k1AOxeA
         JNUCi47dnyNQoq+YQmp1QVpXI4cmU3pmXhHpBPFGcXFmhv7fZTJ5JxJas/zuja2SZplG
         3gOToxegeWg1spBfCN/4qCmgXe1t6aCzgOR0K15bM30r0oPXRTsKwRrTLPQEEjIlEbVB
         U2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbZdqAhuTe9AIsgKG5ncENT/Fwm11IcS5xObaY+RarY=;
        b=F6LjUR4T9m94ArUsP3oB4EoJ3rQyk42CpAn99TMpUpNXHXKfKzMXpudSs8IDeNw/q1
         EvkhMoZtIc/VlMP2PldRg+540ZupQbXfqD6h1/SjdA6Oi1tEv0I0OvDyAEdMlSFHlVrm
         N+2MCnvshj4Y7ayg3o1zGFPPADqSyt/b6kbhgy+HKVgftX347de0ZRj3X0QT4Zo3h4oa
         bIGusteoZi0LcX39oA6+K/gmUeH1d5h9eAKBs8XnGRJVvqbDcUXuDNUZXezqIEU2r/8G
         AVajSgAQuJek2xMsmyI3raqCtVtdwjFIC+nh58j/0UxUPQEa7M37CgzR9eWmltxd8Xgx
         jtyg==
X-Gm-Message-State: AFqh2ko3tzZibyyrQ4OiimN7Q9MI/365JyznoH67qgvYcnhJP3bpJBTP
	37/KxT7bHadS8NM+GvmHa3223w==
X-Google-Smtp-Source: AMrXdXsR2Je/4xV9HRoKmjozZbu5PzVQTpAyfK0zfNO788NzP54zQrxCPv10LVg6W3IGFWf+qIWbEw==
X-Received: by 2002:a5d:5083:0:b0:2be:546c:4663 with SMTP id a3-20020a5d5083000000b002be546c4663mr17895375wrt.45.1674682681272;
        Wed, 25 Jan 2023 13:38:01 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id y15-20020adfdf0f000000b00236883f2f5csm5597781wrl.94.2023.01.25.13.38.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jan 2023 13:38:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <Y9GZbVrZxEZAraVu@spud>
Date: Wed, 25 Jan 2023 21:38:00 +0000
Cc: Andy Chiu <andy.chiu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org,
 Vineet Gupta <vineetg@rivosinc.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Message-Id: <08DF16C6-1D76-4FBE-871C-3A37C5349C87@jrtc27.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-20-andy.chiu@sifive.com> <Y9GZbVrZxEZAraVu@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_133806_211750_0C57183E 
X-CRM114-Status: GOOD (  24.33  )
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

T24gMjUgSmFuIDIwMjMsIGF0IDIxOjA0LCBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+
IHdyb3RlOgo+IAo+IEhleSBBbmR5LAo+IAo+IFRoYW5rcyBmb3IgcmVzcGlubmluZyB0aGlzLCBJ
IHRoaW5rIGEgbG90IG9mIHBlb3BsZSB3aWxsIGJlIGhhcHB5IHRvIHNlZQo+IGl0IQo+IAo+IE9u
IFdlZCwgSmFuIDI1LCAyMDIzIGF0IDAyOjIwOjU2UE0gKzAwMDAsIEFuZHkgQ2hpdSB3cm90ZToK
PiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L01ha2Vm
aWxlCj4+IGluZGV4IDEyZDkxYjBhNzNkOC4uNjc0MTFjZGM4MzZmIDEwMDY0NAo+PiAtLS0gYS9h
cmNoL3Jpc2N2L01ha2VmaWxlCj4+ICsrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPj4gQEAgLTUy
LDYgKzUyLDEzIEBAIHJpc2N2LW1hcmNoLSQoQ09ORklHX0FSQ0hfUlYzMkkpCTo9IHJ2MzJpbWEK
Pj4gcmlzY3YtbWFyY2gtJChDT05GSUdfQVJDSF9SVjY0SSkJOj0gcnY2NGltYQo+PiByaXNjdi1t
YXJjaC0kKENPTkZJR19GUFUpCQk6PSAkKHJpc2N2LW1hcmNoLXkpZmQKPj4gcmlzY3YtbWFyY2gt
JChDT05GSUdfUklTQ1ZfSVNBX0MpCTo9ICQocmlzY3YtbWFyY2gteSljCj4+ICtyaXNjdi1tYXJj
aC0kKENPTkZJR19SSVNDVl9JU0FfVikJOj0gJChyaXNjdi1tYXJjaC15KXYKPj4gKwo+PiAraWZl
cSAoJChDT05GSUdfUklTQ1ZfSVNBX1YpLCB5KQo+PiAraWZlcSAoJChDT05GSUdfQ0NfSVNfQ0xB
TkcpLCB5KQo+PiArICAgICAgICByaXNjdi1tYXJjaC15ICs9IC1tbm8taW1wbGljaXQtZmxvYXQg
LW1lbmFibGUtZXhwZXJpbWVudGFsLWV4dGVuc2lvbnMKPj4gK2VuZGlmCj4+ICtlbmRpZgo+IAo+
IFVoLCBzbyBJIGRvbid0IHRoaW5rIHRoaXMgd2FzIGFjdHVhbGx5IHRlc3RlZCB3aXRoIChhIHJl
Y2VudCB2ZXJzaW9uIG9mKQo+IGNsYW5nOgo+IGNsYW5nLTE1OiBlcnJvcjogdW5rbm93biBhcmd1
bWVudDogJy1tZW5hYmxlLWV4cGVyaW1lbnRhbC1leHRlbnNpb25zX3ppY2JvbV96aWhpbnRwYXVz
ZScKPiAKPiBGaXJzdGx5LCBuby1pbXBsaWNpdC1mbG9hdCBpcyBhIENGTEFHLCBzbyB3aHkgYWRk
IGl0IHRvIG1hcmNoPwo+IFRoZXJlIGlzIGFuIGV4aXN0aW5nIHBhdGNoIG9uIHRoZSBsaXN0IGZv
ciBlbmFibGluZyB0aGlzIGZsYWcsIGJ1dCBJCj4gcmVjYWxsIFBhbG1lciBzYXlpbmcgdGhhdCBp
dCB3YXMgbm90IGFjdHVhbGx5IG5lZWRlZD8KPiBQYWxtZXIsIGRvIHlvdSByZW1lbWJlciB3aHkg
dGhhdCB3YXM/Cj4gCj4gSSBkdW5ubyB3aGF0IGVuYWJsZS1leHBlcmltZW50YWwtZXh0ZW5zaW9u
cyBpcywgYnV0IEkgY2FuIGd1ZXNzLiBEbyB3ZQo+IHJlYWxseSB3YW50IHRvIGVuYWJsZSB2ZWN0
b3IgZm9yIHRvb2xjaGFpbnMgd2hlcmUgdGhlIHN1cHBvcnQgaXMKPiBjb25zaWRlcmVkIGV4cGVy
aW1lbnRhbD8gSSdtIG5vdCBhdSBmYWl0IHdpdGggdGhlIGRldGFpbHMgb2YgY2xhbmcKPiB2ZXJz
aW9ucyBub3IgdmVyc2lvbnMgb2YgdGhlIFZlY3RvciBzcGVjLCBzbyB0YWtlIHRoZSBmb2xsb3dp
bmcgd2l0aCBhCj4gYml0IG9mIGEgcGluY2ggb2Ygc2FsdC4uLgo+IFNpbmNlIHlvdSd2ZSBhbGxv
d2VkIHRoaXMgdG8gYmUgYnVpbHQgd2l0aCBhbnl0aGluZyBsYXRlciB0aGFuIGNsYW5nIDEzLAo+
IGRvZXMgdGhhdCBtZWFuIHRoYXQgZGlmZmVyZW50IHZlcnNpb25zIG9mIGNsYW5nIG1heSBnZW5l
cmF0ZSB2ZWN0b3IgY29kZQo+IHRoYXQgYXJlIG5vdCBjb21wYXRpYmxlPwo+IEknbSBlc3BlY2lh
bGx5IGNvbmNlcm5lZCBieToKPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3Ytdi1zcGVj
L3JlbGVhc2VzL3RhZy8wLjkKPiB3aGljaCBhcHBlYXJzIHRvIGJlIG1vc3QgcmVjZW50bHkgcmVs
ZWFzZWQgdmVyc2lvbiBvZiB0aGUgc3BlYywgcHJpb3IgdG8KPiBjbGFuZy9sbHZtIDEzIGJlaW5n
IHJlbGVhc2VkLgoKRm9yIGltcGxlbWVudGF0aW9ucyBvZiB1bnJhdGlmaWVkIGV4dGVuc2lvbnMg
eW91IGJvdGggaGF2ZSB0byBlbmFibGUKdGhlbSB3aXRoIC1tZW5hYmxlLWV4cGVyaW1lbnRhbC1l
eHRlbnNpb25zIGFuZCBoYXZlIHRvIGV4cGxpY2l0bHkKc3BlY2lmeSB0aGUgdmVyc2lvbiBpbiB0
aGUgLW1hcmNoIHN0cmluZyBzcGVjaWZpY2FsbHkgc28gdGhpcyBpc27igJl0IGEKY29uY2Vybi4g
T25seSBvbmNlIHJhdGlmaWVkIGNhbiB5b3UgdXNlIHRoZSB1bnZlcnNpb25lZCBleHRlbnNpb24s
CndoaWNoIGlzIGltcGxpY2l0bHkgdGhlIHJhdGlmaWVkIHZlcnNpb24gKGlnbm9yaW5nIHRoZSB3
aG9sZSBpMnAwIHZzCmkycDEgZmlhc2NvKS4KCkJ1dCBubywgeW91IHByb2JhYmx5IGRvbuKAmXQg
d2FudCBleHBlcmltZW50YWwgaW1wbGVtZW50YXRpb25zLCB3aGljaCBjYW4KZXhpc3Qgd2hlbiB0
aGUgcmF0aWZpZWQgdmVyc2lvbiBpcyBpbXBsZW1lbnRlZCBpbiB0aGVvcnkgKHNvIHRoZXJl4oCZ
cyBubwpjb21wYXRpYmlsaXR5IGNvbmNlcm4gYmFzZWQgb24gSVNBIGNoYW5nZXMpIGJ1dCBpc27i
gJl0IGRlZW1lZApwcm9kdWN0aW9uLXJlYWR5IChlLmcuIHBvdGVudGlhbCBBQkkgaW5zdGFiaWxp
dHkgaW4gdGhlIGNhc2Ugb2YKc29tZXRoaW5nIGxpa2UgVikuCgpKZXNzCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
