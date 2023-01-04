Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A320EC53210
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 21:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYsnfyK3zJsUkzBMiK1lSt1WVkyXzkY5N19dSCR230k=; b=fKHDxWC7huITVF
	JwNT9J4BZT754ObapfrKmvancQWXpmE74DB82F0IrnYsScsZeF/WDDKyd1q1q1mS5e6CTt2al4Iid
	tgoIPEY1s4O0KkOpm+/kLZTOHX687dOfco+j0CTHj9pwK7ZMiAD//9w0/eO8hwU5P+YjrG+UwcpAR
	taQT2pR5bIOQcNRl/Usiyf6NfqUF1lPdCXhKOB57KaAPLu45mGwvmqaVtuu1lOTOpic/G3fp59dY2
	haXN674BspqfCS9PlJ8/rguXnGEGE9+/mlWOahKc2+Kdgztz8knG037MjjZk6vcHui7YvP8pr4sxA
	4U5lbww+V5Xi/VSvLkdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDBKe-00CAfE-6K; Wed, 04 Jan 2023 21:29:56 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDBKb-00CAea-8d
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 21:29:55 +0000
Received: by mail-ed1-x530.google.com with SMTP id s5so50409261edc.12
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 13:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VW+o1L6StC3VRfBH6+djYunwJoptCjK3QCsqzL95gaM=;
        b=r8I6cEwkWxq0MuZS8azw7CPZMCyQgSlvhqOxV4gJjEQJ+WQyxr0U8R9DqNcvRQRRZw
         o2ViBmbXvIRxPBsxwfmLIvTZSelVeS5aY2MzpLNsFwMQm4z9azTRjM51ES0BJisQhIbn
         Ear1COJD9ygPOtkTSzh+YWqUR7yJa+ROId58KAG38n0GxjOG0vieHz9rANGWA7IWaL3p
         tX/yTtKshwHQKdgGYmO9SGBvRDJA4GRvT51Ee5IcMMEKnH0VhApP6xSyYZxSL1CPrdPv
         haKcAgWQMLt0tvpH35d8zGb+He0D4cb2nV09eIL7jIjOWznyPxWN8rk7aB04THLwF4pf
         dqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VW+o1L6StC3VRfBH6+djYunwJoptCjK3QCsqzL95gaM=;
        b=Kuz7+VEHQNXKPKA14/djJu5MEBqcw90lwVWABfJjnfI/Sc/poLZ1712bjpmHXYvWIP
         IR7LLa3b1s60EM3K+He4PWi6EqLmJ26v+0Z5jnE5VKQ3UaldfC2cS4Lil+HcMwuhWtpX
         O1Fj8hHBEKsWgL9K7qZy530w5V8UtjyTt+/PuU43V4JoOnLYLCCQP6/otXUG4uhtPz8o
         U/4WHXE+iRDlepiOY9bwnivFbe8irnD4UO71cR33vvbOMt1UGMf3jqIzGj4MPD2TqwfN
         p5Of3zV8wTkaKPqIDKK4ZU8VNdHWEW9cCsqt1BR0i4rBi1IpOtemLsiW/vvP4saYeO/o
         GtSA==
X-Gm-Message-State: AFqh2kqncRu+MIYfyf4ZRU7q2kVOrV3iCOtd2OAqvAkqX2nNQgptd1AF
	0iXeBSLhqGHTKP5QK3zXGwyoB7/uoKrnBsa28RHgsQ==
X-Google-Smtp-Source: AMrXdXtkgrZjqVXqnayPeQ4OGAshsUnjIkM3fI1qfKsyBLCth9vNtl8KgvZhN9VBxp8MlZX7K08lkt2hAmyKgcVx9q0=
X-Received: by 2002:aa7:dd17:0:b0:487:fdb6:11f2 with SMTP id
 i23-20020aa7dd17000000b00487fdb611f2mr3170781edv.213.1672867790761; Wed, 04
 Jan 2023 13:29:50 -0800 (PST)
MIME-Version: 1.0
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com> <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com> <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com> <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com> <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org> <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com> <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com> <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com>
In-Reply-To: <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 4 Jan 2023 22:29:39 +0100
Message-ID: <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Andy Chiu <andy.chiu@sifive.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Florian Weimer <fweimer@redhat.com>, 
	Rich Felker <dalias@libc.org>, Andrew Waterman <andrew@sifive.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
	=?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
	davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Aaron Durbin <adurbin@rivosinc.com>, Andrew de los Reyes <adlr@rivosinc.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, GNU C Library <libc-alpha@sourceware.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_132953_333427_310ABCBF 
X-CRM114-Status: GOOD (  23.84  )
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

T24gV2VkLCA0IEphbiAyMDIzIGF0IDIxOjQ2LCBWaW5lZXQgR3VwdGEgPHZpbmVldGdAcml2b3Np
bmMuY29tPiB3cm90ZToKPgo+Cj4KPiBPbiAxLzQvMjMgMDg6MzQsIEFuZHkgQ2hpdSB3cm90ZToK
PiA+IEhpIFZpbmVldCwKPiA+Cj4gPiBPbiBXZWQsIEphbiA0LCAyMDIzIGF0IDM6MTcgQU0gVmlu
ZWV0IEd1cHRhIDx2aW5lZXRnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPj4gVGhlIHByY3RsIHN1
cHBvcnQgaW4gdGhlcmUgaXMgcmVhbGx5IHJ1ZGltZW50YXJ5IGFuZCBpbmNvbXBsZXRlLiBUaGVy
ZSdzCj4gPj4gbW9yZSB3b3JrIG5lZWRlZCB0byB1c2UgdGhlIGR5bmFtaWMgc3RhdGUgb2YgZW5h
YmxlbWVudCAtIGZvciBzYXkgc2lnbmFsCj4gPj4gZnJhbWUgZXRjLgo+ID4gWWVzLCBJIGFncmVl
IHRoYXQgc2lnbmFsIGFuZCBwdHJhY2UgbmVlZCBzcGVjaWFsIGhhbmRsaW5nIGlmIHdlJ2QgdHVy
bgo+ID4gb2ZmIFZlY3RvciB3aXRoIHByY3RsLiBGb3IgZXhhbXBsZSwgd2UgbWF5IG5vdCBuZWVk
IHRvIHNhdmUvcmVzdG9yZQo+ID4gdmVjdG9yIGNvbnRleHQgb24gY29udGV4dCBzd2l0Y2hlcyBh
bmQgc2lnbmFsIGhhbmRsaW5ncy4gQW5kIHdlIG1heQo+ID4gaGF2ZSB0byBwcmV2ZW50IHB0cmFj
ZSBmcm9tIHNldHRpbmcvZ2V0dGluZyB2ZWN0b3IgY29udGV4dCBpbiBzdWNoCj4gPiBjYXNlLiBJ
IGNhbiBpbXBsZW1lbnQgdGhpcyBpbnRvIHRoZSBzZXJpZXMgaWYgdGhpcyBpcyB3aGF0IHlvdSdy
ZQo+ID4gbG9va2luZyBmb3IuCj4KPiBQZXJmZWN0LiBUaGlzIGlzIGV4YWN0bHkgdGhlIGNvdmVy
YWdlIEkgd2FzIGhvcGluZyB0byBzZWUuIEdvIGZvciBpdC4KPgo+ID4+IFRoZSBuZXcgS2NvbmZp
ZyBDT05GSUdfUklTQ1ZfVlNUQVRFX0lOSVRfQUxMIHNlZW1zIGxpa2UgYQo+ID4+IGhhY2sgYm9s
dGVkIG9uIHRvcC4KPiA+IElJVUMsIG1vc3Qgb3BpbmlvbnMgc3VnZ2VzdGVkIHRoYXQgd2Ugc2hv
dWxkIGtlZXAgdGhlIGRlZmF1bHQgVmVjdG9yCj4gPiBzdGF0ZSB0byBPTiBpbiB0aHJlYWQ6Cj4g
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA5MjEyMTQ0MzkuMTQ5MTUxMC0xNy1z
dGlsbHNvbkByaXZvc2luYy5jb20vVC8jdQo+Cj4gQWN0dWFsbHkgY29tbXVuaXR5IGZlZWRiYWNr
IGlzIHRoYXQgdGhleSAqZG9uJ3QgKiB3YW50IHRoZSBkZWZhdWx0Cj4gdmVjdG9yIHN0YXRlIHRv
IGJlIG9uIGR1ZSB0byBwb3dlciBpbXBsaWNhdGlvbnMsIGluY3JlYXNlZCBzdGFjayBhbmQKPiBt
ZW1vcnkgdXNhZ2UgZm9yIHZlY3RvciBjb250ZW50cyAoaW4gdGhhdCB0aHJlYWQgYW5kIGVsc2Ug
d2hlcmUgYXMKPiB3ZWxsKS4gU28gd2Ugc2hvdWxkIGtlZXAgaXQgZGlzYWJsZWQgYnkgZGVmYXVs
dCwgYnV0IGluZGVlZCB3ZSBjb3VsZAo+IGhhdmUgdGhhdCBLY29uZmlnIG9wdGlvbiB0byBlbmFi
bGUgaXQuIEdyYW50ZWQgZGlzdHJvIGtlcm5lbHMgd2lsbCBrZWVwCj4gaXQgZGlzYWJsZWQgYnkg
ZGVmYXVsdCwgdGhpcyBsZXRzIHZlbmRvcnMgZW5hYmxlIGl0IHNlbGVjdGl2ZWx5IHVudGlsCj4g
dGhlIGZ1bGwgdXNlcnNwYWNlIGVuYWJsaW5nIGJpdHMgYXJlIGluIHBsYWNlLgoKU2hvdWxkIHdl
IHB1bnQgdGhpcyB0byB0aGUgRUxGIChlLmcuLCB1c2luZyBhIFJJU0MtViBzcGVjaWZpYwphdHRy
aWJ1dGUpIGFuZCB0YWtlIGEgcGVyLXByb2Nlc3MgZGVjaXNpb24gb24gd2hldGhlciB0byBzdGFy
dCBpbiBPTgpvciBPRkY/CkkgZG9uJ3QgZmVlbCBmdWxseSBjb21mb3J0YWJsZSB3aXRoIGEgS0NP
TkZJRyB0aGF0IGNvdWxkIGNoYW5nZSBhbmQKaW52YWxpZGF0ZSB0aGUgYXNzdW1wdGlvbnMgYSB1
c2Vyc3BhY2UgcHJvY2VzcyBjb3VsZCBoYXZlIG1hZGXigKYKCkFsdGVybmF0aXZlbHksIHdlIGNv
dWxkIGVzdGFibGlzaCB0aGUgY29udmVudGlvbiBvZiBoYXZpbmcgdHdvIHN0dWIKbGlicmFyaWVz
IHRoYXQgc2V0IHVwIGVpdGhlciBlbmFibGVkIG9yIGRpc2FibGUgc3RhdGUgZnJvbSB0aGVpcgou
aW5pdF9hcnJheSB0byBwcm92aWRlIGEgbWVjaGFuaXNtIGZvciBmb2xrcyB0aGF0IHdhbnQgdG8g
bWFrZSBhbgpleHBsaWNpdCBhc3N1bXB0aW9uLiAgQWx0aG91Z2ggdGhpcyBtYXkgdHJ5IHRvIG92
ZXJkZXNpZ24gYSBzb2x1dGlvbgpmb3IgYSBub24taXNzdWUuCgpQaGlsaXBwLgoKPgo+ID4gU28g
SU1ITyBhZGRpbmcgYSBidWlsZCBvcHRpb24gdG8gdGhvc2Ugd2hvIHByZWZlciBub3QgdG8KPiA+
IHVuY29uZGl0aW9uYWxseSBlbmFibGUgViBzaG91bGQgYmUgc3VmZmljaWVudC4KPgo+IEFzIGFi
b3ZlLCBpdCBzaG91bGQgYmUgb3RoZXIgd2F5IHJvdW5kLgo+Cj4gVGh4LAo+IC1WaW5lZXQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
