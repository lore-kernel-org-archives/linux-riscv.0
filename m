Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE38C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 18:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2oeY4rHCvQ1SUdjrkLbtkf/an1A+2M03dIhANSDsfM=; b=5BnV3UFi1z+mWM
	f22fh7Y+GpjBDT6dag9cGTeJbYXqUMEke6rViJjcWP7e0SnyuoCcsLUKi3SAxXFYi0etlX8peKw0e
	H/Dau9NxQKxceQxVwJjYO+q/lpT0JqX+H/cE64vJxc09bIjyZleaFLMjQP0qbo9+q4gYbMYmkc3py
	YIX2XNuBpK6zQU0acmy7EkV7XpQUUhhDykt7nPPiJEZn8AcbuDYkSI8VBoE+HpCY+GAwhOdZWN1Y1
	QUm9NfU5qzrgubhjMCqSrQCaMPwA5O1ZUa57Rs6Nj+JnsdgFsOSEpPOnrqgZr6rI3rkISzzaLgZvk
	MBXdb9x0eS+I4Vovijvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naLmv-006oBZ-Jr; Fri, 01 Apr 2022 18:14:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naLms-006oAv-Rw
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 18:14:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BC577B824FA
 for <linux-riscv@lists.infradead.org>; Fri,  1 Apr 2022 18:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EEE0C36AE5
 for <linux-riscv@lists.infradead.org>; Fri,  1 Apr 2022 18:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648836855;
 bh=kqU9j86Fp20yiuk8kX7VoDCOGTK2BPuNyNh6eBUBXXQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HWRpGX4VIciF/GlnmQv6GJXgQ+OyVRdB2wgg9us7F85HQm/c2I0dS4nRq0y4Vw9QM
 tr9hwIO63BWy3fyu7nlMXBlo1IcVkWB1myDWpWUmoGewxy9PJW2RSzNOu3HwE2/6ZV
 POhh64oogsyLx9uRWiB7tWJ6QGnEzg2zLU+5M0DvHlhJbhVLNFXh1ul9N8HJdXqi+1
 xWQXW68UtibXGdJGKREna7V522YPtYDR4XKJQOAIbC80rc61gOytRUYD/SDVXnKt6l
 p8kKnk48sQvs6rmnHcbgLqi3c3Wfe8PQ3Coy3OChuWrywMtDglBcwDxWhpz/IaVSE1
 7sFHryACB157w==
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2e612af95e3so41637917b3.9
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 11:14:15 -0700 (PDT)
X-Gm-Message-State: AOAM531yiS/6rB2Dp8iS29AhkcBYkUznPRf/pmHWvJQbYtMPOfNR7wyb
 hZLxRi6WwrIdyw/M3G6whJz+1gYGhZL6UKCyZtA=
X-Google-Smtp-Source: ABdhPJxX72PNJDxsBPPdOyCYcv5vbaFnbRnCdQFgmooWJ9gguxs2v2t8FmJaG5mRQzA59s9ZS0nSEuJvmAPfj2gW8xo=
X-Received: by 2002:a0d:d912:0:b0:2e6:4099:b34f with SMTP id
 b18-20020a0dd912000000b002e64099b34fmr11356518ywe.46.1648836854617; Fri, 01
 Apr 2022 11:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220401163909.20343-1-palmer@rivosinc.com>
In-Reply-To: <20220401163909.20343-1-palmer@rivosinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Fri, 1 Apr 2022 21:13:48 +0300
X-Gmail-Original-Message-ID: <CAFCwf13-o=kUR61xjWt=F-Q-Vfy=kF6fpMP7iB+83Gfqw7+2HA@mail.gmail.com>
Message-ID: <CAFCwf13-o=kUR61xjWt=F-Q-Vfy=kF6fpMP7iB+83Gfqw7+2HA@mail.gmail.com>
Subject: Re: [PATCH] habanalabs: Elide a warning on 32-bit targets
To: Palmer Dabbelt <palmer@rivosinc.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Ohad Sharabi <osharabi@habana.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_111419_240864_9D3FE2B2 
X-CRM114-Status: GOOD (  24.28  )
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

T24gRnJpLCBBcHIgMSwgMjAyMiBhdCA3OjQxIFBNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEZyb206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3Np
bmMuY29tPgo+Cj4gVGhpcyBkb3VibGUtY2FzdCBwYXR0ZXJuIGxvb2tzIGEgYml0IGF3a3dhcmQs
IGJ1dCBpdCBhbHJlYWR5IGV4aXN0cwo+IGVsc2V3aGVyZSBpbiB0aGUgZHJpdmVyLiAgV2l0aG91
dCB0aGlzIHBhdGNoIEkgZ2V0Cj4KPiBkcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVt
b3J5LmM6IEluIGZ1bmN0aW9uIOKAmGFsbG9jX2RldmljZV9tZW1vcnnigJk6Cj4gZHJpdmVycy9t
aXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5jOjE1Mzo0OTogd2FybmluZzogY2FzdCBmcm9t
IHBvaW50ZXIgdG8gaW50ZWdlciBvZiBkaWZmZXJlbnQgc2l6ZSBbLVdwb2ludGVyLXRvLWludC1j
YXN0XQo+ICAgMTUzIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKHU2NCkgZ2VuX3Bvb2xfZG1hX2FsbG9jX2FsaWduKHZtLT5kcmFtX3BnX3Bvb2wsCj4g
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
Cj4KPiB3aGljaCBlbmRzIHVwIHByb21vdGVkIHRvIGEgYnVpbGQgZXJyb3IgaW4gbXkgdGVzdCBz
ZXR1cC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMu
Y29tPgo+Cj4gLS0tCj4KPiBJIGRvbid0IGtub3cgYW55dGhpbmcgYWJvdXQgdGhpcyBkcml2ZXIs
IEknbSBqdXN0IHBhdHRlcm4tbWF0Y2hpbmcgdGhlCj4gd2FybmluZyBhd2F5Lgo+IC0tLQo+ICBk
cml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMgfCAxMCArKysrKy0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5jIGIvZHJpdmVy
cy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5jCj4gaW5kZXggZTAwOGQ4MmU0YmEzLi5m
MWZjNzljMWZjMTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9u
L21lbW9yeS5jCj4gKysrIGIvZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5j
Cj4gQEAgLTE1MCwxMiArMTUwLDEyIEBAIHN0YXRpYyBpbnQgYWxsb2NfZGV2aWNlX21lbW9yeShz
dHJ1Y3QgaGxfY3R4ICpjdHgsIHN0cnVjdCBobF9tZW1faW4gKmFyZ3MsCj4gICAgICAgICAgICAg
ICAgIGZvciAoaSA9IDAgOyBpIDwgbnVtX3BncyA7IGkrKykgewo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChpc19wb3dlcl9vZl8yKHBhZ2Vfc2l6ZSkpCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwaHlzX3BnX3BhY2stPnBhZ2VzW2ldID0KPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodTY0KSBnZW5fcG9vbF9kbWFfYWxsb2Nf
YWxpZ24odm0tPmRyYW1fcGdfcG9vbCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2Vfc2l6
ZSwgTlVMTCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2Vfc2l6ZSk7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHU2NCkgKHVpbnRwdHJfdCkg
Z2VuX3Bvb2xfZG1hX2FsbG9jX2FsaWduKHZtLT5kcmFtX3BnX3Bvb2wsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhZ2Vfc2l6ZSwgTlVMTCwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcGFnZV9zaXplKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBl
bHNlCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaHlzX3BnX3BhY2stPnBhZ2Vz
W2ldID0gKHU2NCkgZ2VuX3Bvb2xfYWxsb2Modm0tPmRyYW1fcGdfcG9vbCwKPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBhZ2Vfc2l6ZSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwaHlzX3BnX3BhY2stPnBhZ2VzW2ldID0gKHU2NCkgKHVpbnRwdHJfdCkgZ2VuX3Bvb2xfYWxs
b2Modm0tPmRyYW1fcGdfcG9vbCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YWdlX3NpemUpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICghcGh5c19wZ19wYWNrLT5w
YWdlc1tpXSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihoZGV2
LT5kZXYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQg
dG8gYWxsb2NhdGUgZGV2aWNlIG1lbW9yeSAob3V0IG9mIG1lbW9yeSlcbiIpOwo+IC0tCj4gMi4z
NC4xCj4KClRoaXMgcGF0Y2ggaXM6ClJldmlld2VkLWJ5OiBPZGVkIEdhYmJheSA8b2dhYmJheUBr
ZXJuZWwub3JnPgoKR3JlZywKQ291bGQgeW91IHBsZWFzZSBhcHBseSB0aGlzIGRpcmVjdGx5IHRv
IHlvdXIgbWlzYyB0cmVlIGFuZCBzZW5kIGl0IHRvCkxpbnVzIGF0IHlvdXIgbmV4dCBwdWxsIHJl
cXVlc3QgPwpJIGRvbid0IGhhdmUgYW55IG90aGVyIGZpeGVzIHBlbmRpbmcgZm9yIDUuMTguCgpG
b3IgNS4xOSB3ZSB3aWxsIGRvIGEgbW9yZSBlbGVnYW50IHNvbHV0aW9uIHRoYXQgQXJuZCBoYXMg
cmVjb21tZW5kZWQuCgpUaGFua3MsCk9kZWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
